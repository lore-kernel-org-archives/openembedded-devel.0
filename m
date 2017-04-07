Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 888A677E3A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Apr 2017 21:36:59 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.6.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3w0Cb00D7vz1qrMj;
	Fri,  7 Apr 2017 23:37:00 +0200 (CEST)
X-Auth-Info: 7+ifj5xVCKoJjKSXewCT2xYsFsXYPaSDCL3UgaHqR4o=
Received: from kurokawa.lan (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3w0CZz542SzvdWQ;
	Fri,  7 Apr 2017 23:36:59 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Apr 2017 23:36:46 +0200
Message-Id: <20170407213646.29455-1-marex@denx.de>
X-Mailer: git-send-email 2.11.0
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH] fbida: Fix compile-host-path error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Apr 2017 21:37:00 -0000

Remove the explicit reference to /usr/local/* in Variables.mk.
This is completely bogus and causes failure during cross-compilation.

Signed-off-by: Marek Vasut <marex@denx.de>
---
 meta-oe/recipes-graphics/fbida/fbida_2.10.bb       |  4 ++-
 .../fbida/files/0001-Avoid-using-host-path.patch   | 34 ++++++++++++++++++++++
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/fbida/files/0001-Avoid-using-host-path.patch

diff --git a/meta-oe/recipes-graphics/fbida/fbida_2.10.bb b/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
index c14fc9b68..459a1e8d2 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
@@ -10,7 +10,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
 DEPENDS = "virtual/libiconv jpeg fontconfig freetype libexif"
 
-SRC_URI = "https://www.kraxel.org/releases/fbida/fbida-${PV}.tar.gz"
+SRC_URI = "https://www.kraxel.org/releases/fbida/fbida-${PV}.tar.gz \
+	   file://0001-Avoid-using-host-path.patch \
+	   "
 SRC_URI[md5sum] = "09460b964b58c2e39b665498eca29018"
 SRC_URI[sha256sum] = "7a5a3aac61b40a6a2bbf716d270a46e2f8e8d5c97e314e927d41398a4d0b6cb6"
 
diff --git a/meta-oe/recipes-graphics/fbida/files/0001-Avoid-using-host-path.patch b/meta-oe/recipes-graphics/fbida/files/0001-Avoid-using-host-path.patch
new file mode 100644
index 000000000..cdf2c25d3
--- /dev/null
+++ b/meta-oe/recipes-graphics/fbida/files/0001-Avoid-using-host-path.patch
@@ -0,0 +1,34 @@
+From 8d8fa9f22d9f6a95523bac63ac3af724faf5ff92 Mon Sep 17 00:00:00 2001
+From: Marek Vasut <marex@denx.de>
+Date: Fri, 7 Apr 2017 23:26:09 +0200
+Subject: [PATCH] Avoid using host-path
+
+Remove the explicit reference to /usr/local/* , this is completely
+bogus and causes trouble during cross-compilation.
+
+Signed-off-by: Marek Vasut <marex@denx.de>
+Upstream-Status: Inappropriate [upstream requires this]
+---
+ mk/Variables.mk | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/mk/Variables.mk b/mk/Variables.mk
+index 99f787c..3ffd87a 100644
+--- a/mk/Variables.mk
++++ b/mk/Variables.mk
+@@ -42,12 +42,6 @@ CFLAGS		+= -Wall -Wmissing-prototypes -Wstrict-prototypes \
+ 		   -Wpointer-arith -Wunused
+ CXXFLAGS	+= -Wall -Wpointer-arith -Wunused
+ 
+-# add /usr/local to the search path if something is in there ...
+-ifneq ($(wildcard /usr/local/include/*.h),)
+-  CFLAGS  += -I/usr/local/include
+-  LDFLAGS += -L/usr/local/$(LIB)
+-endif
+-
+ # fixup include path for $(srcdir) != "."
+ ifneq ($(srcdir),.)
+   CFLAGS  += -I. -I$(srcdir)
+-- 
+2.11.0
+
-- 
2.11.0


