Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8E719728EA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Dec 2014 08:29:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBJ8TQNK020464
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Dec 2014 00:29:27 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 19 Dec 2014 00:29:26 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Dec 2014 00:29:25 -0800
Message-ID: <1418977765-46144-3-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1418977765-46144-1-git-send-email-liezhi.yang@windriver.com>
References: <1418977765-46144-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking] [PATCH 3/3] netkit-rusers: fix parallel build issue
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
X-List-Received-Date: Fri, 19 Dec 2014 08:29:26 -0000
Content-Type: text/plain

Fixed:
rusers.x: No such file or directory
Makefile:44: recipe for target 'rusers_xdr.c' failed

(LOCAL REV: NOT UPSTREAM) -- Sent to meta-networking on 20141219

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...rusersd-Makefile-fix-parallel-build-issue.patch |   30 ++++++++++++++++++++
 .../netkit-rusers/netkit-rusers_0.17.bb            |    1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-networking/recipes-netkit/netkit-rusers/netkit-rusers/rpc.rusersd-Makefile-fix-parallel-build-issue.patch

diff --git a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers/rpc.rusersd-Makefile-fix-parallel-build-issue.patch b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers/rpc.rusersd-Makefile-fix-parallel-build-issue.patch
new file mode 100644
index 0000000..d85178d
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers/rpc.rusersd-Makefile-fix-parallel-build-issue.patch
@@ -0,0 +1,30 @@
+From c23cc112a480f90950de5cf1de09b1a7e732bf21 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Mon, 15 Dec 2014 18:31:13 -0800
+Subject: [PATCH] rpc.rusersd/Makefile: fix parallel build issue
+
+Fixed:
+rusers.x: No such file or directory
+Makefile:44: recipe for target 'rusers_xdr.c' failed
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ rpc.rusersd/Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/rpc.rusersd/Makefile b/rpc.rusersd/Makefile
+index 792f528..65a424a 100644
+--- a/rpc.rusersd/Makefile
++++ b/rpc.rusersd/Makefile
+@@ -40,5 +40,5 @@ rusers.x:
+ rusers.h: $(RUSERSX) rusers.x
+ 	$(RPCGEN) -h -o rusers.h rusers.x
+ 
+-rusers_xdr.c: $(RUSERSX)
++rusers_xdr.c: $(RUSERSX) rusers.x
+ 	$(RPCGEN) -c -C -o rusers_xdr.c rusers.x
+-- 
+1.7.9.5
+
diff --git a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
index e59f7a7..c930842 100644
--- a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
@@ -8,6 +8,7 @@ DEPENDS = " tcp-wrappers libtirpc rpcbind"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.orig.tar.gz;name=archive \
            ${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}-8.diff.gz;name=patch8 \
+           file://rpc.rusersd-Makefile-fix-parallel-build-issue.patch \
 "
 
 SRC_URI[archive.md5sum] = "dc99a80b9fde2ab427c874f88f1c1602"
-- 
1.7.9.5


