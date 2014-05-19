Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (unknown [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 9D51D65FE5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 May 2014 11:26:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.98,866,1392159600"; d="scan'208";a="51415658"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 19 May 2014 13:26:59 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	(TLS) id 14.2.318.1; Mon, 19 May 2014 13:26:59 +0200
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Mon, 19 May 2014 13:26:59 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 19 May 2014 13:27:05 +0200
Message-ID: <1400498825-24073-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
MIME-Version: 1.0
Subject: [PATCH] open-vcdiff: update to 0.8.4
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
X-List-Received-Date: Mon, 19 May 2014 11:27:02 -0000
Content-Type: text/plain

wget is ignoring "Content-Disposition" http header, that's why I've added 'downloadfilename' in SRC_URI.

Note: Googlecode discarded their download section and moved to Googledrive.
http://google-opensource.blogspot.fr/2013/05/a-change-to-google-code-download-service.html

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 .../open-vcdiff/files/aclocal-amflags-fix.patch    | 33 ----------------------
 .../open-vcdiff/open-vcdiff_0.8.3.bb               | 19 -------------
 .../open-vcdiff/open-vcdiff_0.8.4.bb               | 18 ++++++++++++
 3 files changed, 18 insertions(+), 52 deletions(-)
 delete mode 100644 meta-oe/recipes-support/open-vcdiff/files/aclocal-amflags-fix.patch
 delete mode 100644 meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.3.bb
 create mode 100644 meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.4.bb

diff --git a/meta-oe/recipes-support/open-vcdiff/files/aclocal-amflags-fix.patch b/meta-oe/recipes-support/open-vcdiff/files/aclocal-amflags-fix.patch
deleted file mode 100644
index cd1efd7..0000000
--- a/meta-oe/recipes-support/open-vcdiff/files/aclocal-amflags-fix.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Fix this error:
-
-| aclocal: error: non-option arguments are not accepted: '\'.
-
-Starting from commit v1.11-662-g52246cc, when given non-option arguments, aclocal rejects them, instead of silently ignoring them.
-
-Declare ACLOCAL_AMFLAGS as a single line because autoreconf can't handle multiline.
-
-Notice that ACLOCAL_AMFLAGS is deprecated.
-In configure.ac, AC_CONFIG_MACRO_DIRS should be used (instead of AC_CONFIG_MACRO_DIR) but requires automake 1.13+.
-
-Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
----
- Makefile.am | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 5c765c7..f4295a6 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,8 +1,7 @@
- ## Process this file with automake to produce Makefile.in
- 
- # Make sure that when we re-make ./configure, we get the macros we need
--ACLOCAL_AMFLAGS = -I m4 \
--                  -I gflags/m4
-+ACLOCAL_AMFLAGS = -I m4 -I gflags/m4
- 
- # This is so we can #include <google/vcencoder.h> or <gtest/gtest.h>
- AM_CPPFLAGS = -I$(top_srcdir)/src \
--- 
-1.8.5.4
-
diff --git a/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.3.bb b/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.3.bb
deleted file mode 100644
index c6af25d..0000000
--- a/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.3.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "An encoder/decoder for the VCDIFF (RFC3284) format"
-DESCRIPTION = "A library with a simple API is included, as well as a \
-               command-line executable that can apply the encoder and \
-               decoder to source, target, and delta files. \
-               A slight variation from the draft standard is defined \
-               to allow chunk-by-chunk decoding when only a partial \
-               delta file window is available."
-HOMEPAGE = "http://code.google.com/p/open-vcdiff/"
-SECTION = "console/utils"
-
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b2c8309843bc5297cfb4dc84f43f3ccc"
-
-SRC_URI = "http://open-vcdiff.googlecode.com/files/${BPN}-${PV}.tar.gz \
-           file://aclocal-amflags-fix.patch"
-SRC_URI[md5sum] = "5f848e4916b407879f55e0ca74c3f6af"
-SRC_URI[sha256sum] = "b7e47db78866082e9e8b5782f5491092c8414f0acc0440aea03b14c7d1d3c371"
-
-inherit autotools
diff --git a/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.4.bb b/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.4.bb
new file mode 100644
index 0000000..e6942d0
--- /dev/null
+++ b/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.4.bb
@@ -0,0 +1,18 @@
+SUMMARY = "An encoder/decoder for the VCDIFF (RFC3284) format"
+DESCRIPTION = "A library with a simple API is included, as well as a \
+               command-line executable that can apply the encoder and \
+               decoder to source, target, and delta files. \
+               A slight variation from the draft standard is defined \
+               to allow chunk-by-chunk decoding when only a partial \
+               delta file window is available."
+HOMEPAGE = "http://code.google.com/p/open-vcdiff/"
+SECTION = "console/utils"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ff820d4ddc1ba05b6fd37b41a21506f9"
+
+SRC_URI = "https://drive.google.com/uc?id=0B5WpIi2fQU1aNGJwVE9hUjU5clU&export=download;downloadfilename=${BP}.tar.gz"
+SRC_URI[md5sum] = "5c0d378d907bebc38b51c3d7e4117011"
+SRC_URI[sha256sum] = "2b142b1027fb0a62c41347600e01a53fa274dad15445a7da48083c830c3138b3"
+
+inherit autotools
-- 
1.8.1.2


