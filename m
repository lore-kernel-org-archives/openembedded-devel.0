Return-Path: <Xufeng.Zhang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EE7BF6D3D0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2013 09:41:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9O9f92F001893
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2013 02:41:09 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.210) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 24 Oct 2013 02:41:08 -0700
From: Xufeng Zhang <xufeng.zhang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 24 Oct 2013 17:48:41 +0800
Message-ID: <1382608121-6622-1-git-send-email-xufeng.zhang@windriver.com>
X-Mailer: git-send-email 1.7.0.2
MIME-Version: 1.0
Subject: [PATCH meta-networking] quagga/ripd: Fix two bugs after received SIGHUP signal
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Oct 2013 09:41:08 -0000
Content-Type: text/plain

There are two problems for ripd implementation after received
SIGHUP signal:
1). ripd didn't clean up ifp->connected list before reload
    configuration file which makes the same advertise packet
    being sent multiple times(depends on how many SIGHUP was recieved).
2). ripd reset ri->split_horizon flag to RIP_NO_SPLIT_HORIZON
    during restart which is different from the flag when ripd is
    firstly started up, leading to unnecessary route to be advertised.

[YOCTO #5266]

Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
---
 .../ripd-fix-two-bugs-after-received-SIGHUP.patch  |   49 ++++++++++++++++++++
 .../recipes-protocols/quagga/quagga.inc            |    3 +-
 2 files changed, 51 insertions(+), 1 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/quagga/files/ripd-fix-two-bugs-after-received-SIGHUP.patch

diff --git a/meta-networking/recipes-protocols/quagga/files/ripd-fix-two-bugs-after-received-SIGHUP.patch b/meta-networking/recipes-protocols/quagga/files/ripd-fix-two-bugs-after-received-SIGHUP.patch
new file mode 100644
index 0000000..c081143
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/files/ripd-fix-two-bugs-after-received-SIGHUP.patch
@@ -0,0 +1,49 @@
+ripd: Fix two bugs after received SIGHUP signal
+
+There are two problems for ripd implementation after received
+SIGHUP signal:
+1). ripd didn't clean up ifp->connected list before reload
+    configuration file.
+2). ripd reset ri->split_horizon flag to RIP_NO_SPLIT_HORIZON
+    which lead to the unnecessary route to be advertised.
+
+Upstream-Status: Pending
+
+Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
+---
+--- a/ripd/rip_interface.c
++++ b/ripd/rip_interface.c
+@@ -500,6 +500,8 @@
+   struct listnode *node;
+   struct interface *ifp;
+   struct rip_interface *ri;
++  struct connected *ifc;
++  struct listnode *conn_node, *next;
+ 
+   for (ALL_LIST_ELEMENTS_RO (iflist, node, ifp))
+     {
+@@ -514,6 +516,13 @@
+ 	  thread_cancel (ri->t_wakeup);
+ 	  ri->t_wakeup = NULL;
+ 	}
++
++      for (conn_node = listhead (ifp->connected); conn_node; conn_node = next)
++        {
++          ifc = listgetdata (conn_node);
++          next = conn_node->next;
++          listnode_delete (ifp->connected, ifc);
++        }          
+     }
+ }
+ 
+@@ -548,8 +557,8 @@
+ 	  ri->key_chain = NULL;
+ 	}
+ 
+-      ri->split_horizon = RIP_NO_SPLIT_HORIZON;
+-      ri->split_horizon_default = RIP_NO_SPLIT_HORIZON;
++      ri->split_horizon = RIP_SPLIT_HORIZON;
++      ri->split_horizon_default = RIP_SPLIT_HORIZON;
+ 
+       ri->list[RIP_FILTER_IN] = NULL;
+       ri->list[RIP_FILTER_OUT] = NULL;
diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index 89b9f7a..bf37067 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -31,7 +31,8 @@ SRC_URI = "http://download.savannah.gnu.org/releases/quagga${QUAGGASUBDIR}/quagg
            file://quagga.default \
            file://watchquagga.init \
            file://watchquagga.default \
-           file://volatiles.03_quagga"
+           file://volatiles.03_quagga \
+           file://ripd-fix-two-bugs-after-received-SIGHUP.patch"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[cap] = "--enable-capabilities,--disable-capabilities,libcap"
-- 
1.7.0.2


