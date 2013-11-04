Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 998CE6AF66
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2013 03:31:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA43VlXp014021
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 3 Nov 2013 19:31:47 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Sun, 3 Nov 2013 19:31:46 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Nov 2013 11:31:50 +0800
Message-ID: <1383535910-1944-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH meta-networking] quagga: backport a patch from 0.99.22 to fix "no ip address" command
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
X-List-Received-Date: Mon, 04 Nov 2013 03:31:48 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...ingering-IP-address-after-deletion-BZ-486.patch |   64 ++++++++++++++++++++
 .../recipes-protocols/quagga/quagga_0.99.21.bb     |    3 +-
 2 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-protocols/quagga/files/lingering-IP-address-after-deletion-BZ-486.patch

diff --git a/meta-networking/recipes-protocols/quagga/files/lingering-IP-address-after-deletion-BZ-486.patch b/meta-networking/recipes-protocols/quagga/files/lingering-IP-address-after-deletion-BZ-486.patch
new file mode 100644
index 0000000..42bdc20
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/files/lingering-IP-address-after-deletion-BZ-486.patch
@@ -0,0 +1,64 @@
+From 7f062c217b262e362a3362c677dea6c5e820adf1 Mon Sep 17 00:00:00 2001
+From: David Lamparter <equinox@diac24.net>
+Date: Mon, 1 Feb 2010 16:41:26 +0100
+Subject: [PATCH] zebra: lingering IP address after deletion (BZ#486)
+
+Upstream-status: Backport
+
+zebra address bookkeeping is a mess. this is just a workaround to have
+IPv4 address deletion somewhat working on Linux.
+
+the if_unset_prefix call is synchronous, when it returns success the
+address deletion completed successfully. this is either signaled by a
+netlink ACK or by an OK return value from ioctl().
+
+This version is wrapped by #ifdef HAVE_NETLINK so we don't touch the
+BSDs for now.
+
+* zebra/interface.c: On Linux, update zebra internal state after
+  deleting an address.
+
+Signed-off-by: David Lamparter <equinox@opensourcerouting.org>
+---
+ zebra/interface.c |   21 ++++++++++++++++++---
+ 1 file changed, 18 insertions(+), 3 deletions(-)
+
+diff --git a/zebra/interface.c b/zebra/interface.c
+index 2242259..3578b79 100644
+--- a/zebra/interface.c
++++ b/zebra/interface.c
+@@ -1297,13 +1297,28 @@ ip_address_uninstall (struct vty *vty, struct interface *ifp,
+ 	       safe_strerror(errno), VTY_NEWLINE);
+       return CMD_WARNING;
+     }
++  /* success! call returned that the address deletion went through.
++   * this is a synchronous operation, so we know it succeeded and can
++   * now update all internal state. */
++
++  /* the HAVE_NETLINK check is only here because, on BSD, although the
++   * call above is still synchronous, we get a second confirmation later
++   * through the route socket, and we don't want to touch that behaviour
++   * for now.  It should work without the #ifdef, but why take the risk...
++   * -- equinox 2012-07-13 */
++#ifdef HAVE_NETLINK
++
++  /* Remove connected route. */
++  connected_down_ipv4 (ifp, ifc);
+ 
+-#if 0
+   /* Redistribute this information. */
+   zebra_interface_address_delete_update (ifp, ifc);
+ 
+-  /* Remove connected route. */
+-  connected_down_ipv4 (ifp, ifc);
++  /* IP address propery set. */
++  UNSET_FLAG (ifc->conf, ZEBRA_IFC_REAL);
++
++  /* remove from interface, remark secondaries */
++  if_subnet_delete (ifp, ifc);
+ 
+   /* Free address information. */
+   listnode_delete (ifp->connected, ifc);
+-- 
+1.7.10.4
+
diff --git a/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb b/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb
index 2b46930..10740bc 100644
--- a/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb
+++ b/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb
@@ -2,7 +2,8 @@ require quagga.inc
 
 PR = "${INC_PR}.0"
 
-SRC_URI += "file://0001-doc-fix-makeinfo-errors-and-one-warning.patch"
+SRC_URI += "file://0001-doc-fix-makeinfo-errors-and-one-warning.patch \
+            file://lingering-IP-address-after-deletion-BZ-486.patch"
 
 SRC_URI[quagga-0.99.21.md5sum] = "99840adbe57047c90dfba6b6ed9aec7f"
 SRC_URI[quagga-0.99.21.sha256sum] = "9b8aea9026b4771a28e254a66cbd854723bcd0d71eebd0201d11838d4eb392ee"
-- 
1.7.10.4


