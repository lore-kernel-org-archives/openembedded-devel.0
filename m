Return-Path: <Abdur_Rehman@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id D89DA62132
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 May 2016 19:08:09 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1b5HgX-0004DC-Eq from Abdur_Rehman@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 May 2016 12:08:09 -0700
Received: from svr-pkl-eng-06.pkl.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-02.mgc.mentorg.com (137.202.0.106) with Microsoft SMTP
	Server id 14.3.224.2; Tue, 24 May 2016 20:08:08 +0100
From: Abdur Rehman <abdur_rehman@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 May 2016 00:07:50 +0500
Message-ID: <1464116871-38779-1-git-send-email-abdur_rehman@mentor.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH v4 1/2] libass: add newer version
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
X-List-Received-Date: Tue, 24 May 2016 19:08:14 -0000
Content-Type: text/plain

* mpv requires newer libass to build
* move SRC_URI from Google Code to GitHub
* ENCA support has been removed https://github.com/libass/libass/pull/197
  remove --enable-enca which is now an [unknown-configure-option]
* Fix [textrel] for x86 targets

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Abdur Rehman <abdur_rehman@mentor.com>
---
 meta-oe/recipes-multimedia/libass/libass.inc       | 10 +++++-----
 meta-oe/recipes-multimedia/libass/libass_0.10.1.bb |  5 -----
 meta-oe/recipes-multimedia/libass/libass_0.13.2.bb |  4 ++++
 3 files changed, 9 insertions(+), 10 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/libass/libass_0.10.1.bb
 create mode 100644 meta-oe/recipes-multimedia/libass/libass_0.13.2.bb

diff --git a/meta-oe/recipes-multimedia/libass/libass.inc b/meta-oe/recipes-multimedia/libass/libass.inc
index 328cd14..85ac873 100644
--- a/meta-oe/recipes-multimedia/libass/libass.inc
+++ b/meta-oe/recipes-multimedia/libass/libass.inc
@@ -1,5 +1,5 @@
 DESCRIPTION = "libass is a portable subtitle renderer for the ASS/SSA (Advanced Substation Alpha/Substation Alpha) subtitle format. It is mostly compatible with VSFilter."
-HOMEPAGE = "http://code.google.com/p/libass/"
+HOMEPAGE = "https://github.com/libass/libass"
 SECTION = "libs/multimedia"
 
 LICENSE = "ISC"
@@ -7,9 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ae98663bac55afe5d989919d296f28a"
 
 DEPENDS = "enca fontconfig freetype libpng fribidi"
 
-INC_PR = "r1"
-
-SRC_URI = "http://${BPN}.googlecode.com/files/${BP}.tar.gz"
+SRC_URI = "https://github.com/libass/libass/releases/download/${PV}/libass-${PV}.tar.xz"
 
 inherit autotools pkgconfig
 
@@ -17,10 +15,12 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[harfbuzz] = "--enable-harfbuzz,--disable-harfbuzz,harfbuzz"
 
 EXTRA_OECONF = " \
-    --enable-enca \
     --enable-fontconfig \
 "
 
+# Disable compiling with ASM for x86 to avoid textrel
+EXTRA_OECONF_append_x86 = " --disable-asm"
+
 PACKAGES =+ "${PN}-tests"
 
 FILES_${PN}-tests = " \
diff --git a/meta-oe/recipes-multimedia/libass/libass_0.10.1.bb b/meta-oe/recipes-multimedia/libass/libass_0.10.1.bb
deleted file mode 100644
index 0b32276..0000000
--- a/meta-oe/recipes-multimedia/libass/libass_0.10.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require ${PN}.inc
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "6cace482a013a3c4bf3b31a68ac66026"
-SRC_URI[sha256sum] = "629a7e81fff92dea8d0399b818a41fd1b61e381c67a5961b1eaec2efadb14c6c"
diff --git a/meta-oe/recipes-multimedia/libass/libass_0.13.2.bb b/meta-oe/recipes-multimedia/libass/libass_0.13.2.bb
new file mode 100644
index 0000000..8cf2bd8
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libass/libass_0.13.2.bb
@@ -0,0 +1,4 @@
+require recipes-multimedia/${BPN}/${BPN}.inc
+
+SRC_URI[md5sum] = "1c8cbd5751aeb192bda04a65d0464fd9"
+SRC_URI[sha256sum] = "d698d0a6adca7c36c5a86b540d67b05bfd36cebc3c351ab7646497c43fe1face"
-- 
2.8.1


