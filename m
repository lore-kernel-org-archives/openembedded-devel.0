Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D097F759CD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 06:33:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7I6XPer024852
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 23:33:25 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Mon, 17 Aug 2015 23:33:24 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 18 Aug 2015 14:29:39 +0800
Message-ID: <1439879379-30452-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe] gd: upgrade to 2.1.1
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
X-List-Received-Date: Tue, 18 Aug 2015 06:33:25 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

remove fix-the-subdir-objects-error.patch, a same fix has been merged
into source code.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../gd/gd-2.1.0/fix-the-subdir-objects-error.patch | 39 ----------------------
 .../gd/{gd_2.1.0.bb => gd_2.1.1.bb}                |  5 ++-
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta-oe/recipes-support/gd/gd-2.1.0/fix-the-subdir-objects-error.patch
 rename meta-oe/recipes-support/gd/{gd_2.1.0.bb => gd_2.1.1.bb} (87%)

diff --git a/meta-oe/recipes-support/gd/gd-2.1.0/fix-the-subdir-objects-error.patch b/meta-oe/recipes-support/gd/gd-2.1.0/fix-the-subdir-objects-error.patch
deleted file mode 100644
index 02b1670..0000000
--- a/meta-oe/recipes-support/gd/gd-2.1.0/fix-the-subdir-objects-error.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From b1ae702a48888e2c3b0ebe0772a88b45a37b84f5 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Fri, 17 Jan 2014 01:58:05 -0500
-Subject: [PATCH] configure.ac: fix the subdir-objects error
-
-Fix this error:
-iautomake: warning: possible forward-incompatibility.
-automake: At least a source file is in a subdirectory, but the 'subdir-objects'
-automake: automake option hasn't been enabled.  For now, the corresponding output
-automake: object file(s) will be placed in the top-level directory.  However,
-automake: this behaviour will change in future Automake versions: they will
-automake: unconditionally cause object files to be placed in the same subdirectory
-automake: of the corresponding sources.
-automake: You are advised to start using 'subdir-objects' option throughout your
-automake: project, to avoid future incompatibilities.
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- configure.ac |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 2f9f744..438e08b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -45,7 +45,7 @@ AC_SUBST(GDLIB_AGE)
- FEATURES="GD_GIF GD_GIFANIM GD_OPENPOLYGON"
- AC_SUBST(FEATURES)
- 
--AM_INIT_AUTOMAKE([foreign dist-bzip2 dist-xz -Wall -Werror])
-+AM_INIT_AUTOMAKE([foreign dist-bzip2 dist-xz -Wall -Werror subdir-objects])
- AC_CONFIG_HEADERS([src/config.h:src/config.hin])
- 
- dnl newer automake wants this, but we still want to work with older
--- 
-1.7.10.4
-
diff --git a/meta-oe/recipes-support/gd/gd_2.1.0.bb b/meta-oe/recipes-support/gd/gd_2.1.1.bb
similarity index 87%
rename from meta-oe/recipes-support/gd/gd_2.1.0.bb
rename to meta-oe/recipes-support/gd/gd_2.1.1.bb
index f03b9b0..0731902 100644
--- a/meta-oe/recipes-support/gd/gd_2.1.0.bb
+++ b/meta-oe/recipes-support/gd/gd_2.1.1.bb
@@ -13,10 +13,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c97638cafd3581eb87abd37332137669"
 DEPENDS = "freetype libpng jpeg zlib tiff libvpx"
 
 SRC_URI = "https://bitbucket.org/libgd/gd-libgd/downloads/libgd-${PV}.tar.bz2 \
-           file://fix-the-subdir-objects-error.patch \
 "
-SRC_URI[md5sum] = "5a1d5bab3a4a41d9f111bcceee4ad25b"
-SRC_URI[sha256sum] = "f3e1bc472bd81ee976a739436659fe752a14727a964c64530fde68531ddeee91"
+SRC_URI[md5sum] = "d3f1a992ac9c550ebc6da89c147f89af"
+SRC_URI[sha256sum] = "895ea9c6fcab187b0a908ae3e9e6b06423756f8a643d362349b0caab4014bd0d"
 
 S = "${WORKDIR}/libgd-${PV}"
 
-- 
1.9.1


