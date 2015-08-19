Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3E314608B7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 09:31:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7J9VECJ023948
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 02:31:14 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Wed, 19 Aug 2015 02:31:13 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 19 Aug 2015 17:27:23 +0800
Message-ID: <1439976443-12967-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe] dialog: upgrade to 1.2-20150528
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
X-List-Received-Date: Wed, 19 Aug 2015 09:31:14 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

remove use-pkg-config-for-ncurses-detection.patch, the new version is
using the pkg-config to check ncurses
configuration assumes the cf_have_ncuconfig is unknown for cross-compile,
but ncurses is added into DEPENDS, so change it as yes

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...alog_1.2-20150225.bb => dialog_1.2-20150528.bb} |  6 ++--
 .../use-pkg-config-for-ncurses-detection.patch     | 32 ----------------------
 2 files changed, 3 insertions(+), 35 deletions(-)
 rename meta-oe/recipes-extended/dialog/{dialog_1.2-20150225.bb => dialog_1.2-20150528.bb} (78%)
 delete mode 100644 meta-oe/recipes-extended/dialog/files/use-pkg-config-for-ncurses-detection.patch

diff --git a/meta-oe/recipes-extended/dialog/dialog_1.2-20150225.bb b/meta-oe/recipes-extended/dialog/dialog_1.2-20150528.bb
similarity index 78%
rename from meta-oe/recipes-extended/dialog/dialog_1.2-20150225.bb
rename to meta-oe/recipes-extended/dialog/dialog_1.2-20150528.bb
index 88af59f..4fb938e 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.2-20150225.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.2-20150528.bb
@@ -8,11 +8,10 @@ DEPENDS = "ncurses"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-SRC_URI[md5sum] = "38ef59a7daa5459119cb06777c735e4b"
-SRC_URI[sha256sum] = "6844b13a7a1fea568a8d5bb3004e1af90888cd4a5e8c2ded2c38f34fcc7397ff"
+SRC_URI[md5sum] = "593615fb448e001e5b81420473a7354b"
+SRC_URI[sha256sum] = "a8cd7a66bdb41e53a3145cbb0eb370c5ce7300fe0e9ad6d3e8d3b9e16ff16418"
 
 SRC_URI = "ftp://invisible-island.net/dialog/dialog-${PV}.tgz \
-           file://use-pkg-config-for-ncurses-detection.patch \
           "
 
 # hardcoded here for use in dialog-static recipe
@@ -26,5 +25,6 @@ EXTRA_OECONF = "--with-ncurses \
 do_configure() {
     gnu-configize --force
     sed -i 's,${cf_ncuconfig_root}6-config,${cf_ncuconfig_root}-config,g' -i configure
+    sed -i 's,cf_have_ncuconfig=unknown,cf_have_ncuconfig=yes,g' -i configure
     oe_runconf
 }
diff --git a/meta-oe/recipes-extended/dialog/files/use-pkg-config-for-ncurses-detection.patch b/meta-oe/recipes-extended/dialog/files/use-pkg-config-for-ncurses-detection.patch
deleted file mode 100644
index 0a25a7f..0000000
--- a/meta-oe/recipes-extended/dialog/files/use-pkg-config-for-ncurses-detection.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Subject: [PATCH] use pkg-config for ncurses detection.
-
-Upstream-Status: Inappropriate [configuration]
-
-This is a workaround to make dialog be able to build after ncurses-config
-does not work, since the configure file is called directly in dialog bb
-file, and autoconf can not work, make a workaround in configure file.
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- configure | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/configure b/configure
-index 8afe3d7..a54bcc1 100755
---- a/configure
-+++ b/configure
-@@ -11567,9 +11567,8 @@ fi
- 
- if test "$NCURSES_CONFIG" != none ; then
- 
--CPPFLAGS="$CPPFLAGS `$NCURSES_CONFIG --cflags`"
--
--cf_add_libs="`$NCURSES_CONFIG --libs`"
-+CPPFLAGS="$CPPFLAGS `pkg-config --short-errors --print-errors --cflags "ncurses" 2>/dev/null`"
-+cf_add_libs="`pkg-config --short-errors --print-errors --libs "ncurses" 2>/dev/null` $LIBS"
- # Filter out duplicates - this happens with badly-designed ".pc" files...
- for cf_add_1lib in $LIBS
- do
--- 
-1.7.10.4
-
-- 
1.9.1


