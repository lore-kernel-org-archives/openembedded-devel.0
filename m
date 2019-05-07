Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 97EEC7D6A3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 21:44:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44zCmb1hkRz5Q
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 23:44:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557265455;
	bh=bhih2E0hIUx3q8HXieNhH2jwRULfsGjLWdHdeY/DFaE=;
	h=From:To:Subject:Date:From;
	b=NaZD7wHcZZrLizh0zyUQ4SRhGlwZbiJh96HNAwERFGcQgti7w6+rUXPkgVLiymmeP
	0ai4EUctKKBw/ergPPNG3yQyfC18tZOcsInyJO5ak9XbCZKQwbcBJtMo2SHYfpKl2c
	rxMaqkkhu1I+eM4Bvi6UsJ/BRKAx/fRq6q9HEw8b1Xa3qOjtZO1//lb2timsQf8aW+
	Kq9mS4Xo7dLj/5J/lUQKYa0LqTafiVC9/4hqHtCH9ZWi4FzJTte8m0ntRq7K0bfliR
	n22LrAfFyE1ywC0alMt//AINGjqB2VDk1ogtRGuEqhzu26HuLHaX8JkJspWklx8DQJ
	R6ESbo8vA+LZtpgWw5KCFTVZmr319Y+36mYBPb38So1K0bZesGUAyEeZ2EtsxsZF8e
	9Xs5r8CodmVR6vyzPxLZul+HtnEQtFhXG+JjbG0M/6/pudgAUj+mYkdraR0NLlaBFm
	+A4ivOLEEbbvMsSgAqX5fxy7ZtaQVz8AqiOu3okL6hAFGeos5p70gBQso0avvBEYqG
	vbENaymyhir8TC5ApaOAbr+ljSYNnsIzyhvpKraKxWVPa1wy97+GObCUZS/VYJB7WZ
	HSPdWBZtpc5NO6zlVZ1k5kvrMJsFEvBo90kTFuJb7PzBkPpYaQolKFdY+q2gCVaJ3X
	Iebp2kjYas7OKah2tpOxJ3/g=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 May 2019 00:44:14 +0300
Message-Id: <20190507214414.19696-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-gnome][PATCH] wv: upgrade 1.2.4 -> 1.2.9
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
X-List-Received-Date: Tue, 07 May 2019 21:44:15 -0000

The upstream location has changed.
Remove a patch for an issue fixed upstream.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../recipes-gnome/wv/wv-1.2.4/pkgconfig.patch       | 13 -------------
 ...use-foreign-mode-to-avoid-errors-with-miss.patch |  0
 ...wvRTF.c-Specify-print-format-in-rtf_output.patch |  0
 .../recipes-gnome/wv/{wv_1.2.4.bb => wv_1.2.9.bb}   |  7 +++----
 4 files changed, 3 insertions(+), 17 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/wv/wv-1.2.4/pkgconfig.patch
 rename meta-gnome/recipes-gnome/wv/{wv-1.2.4 => wv}/0001-configure-use-foreign-mode-to-avoid-errors-with-miss.patch (100%)
 rename meta-gnome/recipes-gnome/wv/{wv-1.2.4 => wv}/0001-wvRTF.c-Specify-print-format-in-rtf_output.patch (100%)
 rename meta-gnome/recipes-gnome/wv/{wv_1.2.4.bb => wv_1.2.9.bb} (65%)

diff --git a/meta-gnome/recipes-gnome/wv/wv-1.2.4/pkgconfig.patch b/meta-gnome/recipes-gnome/wv/wv-1.2.4/pkgconfig.patch
deleted file mode 100644
index 136d89341..000000000
--- a/meta-gnome/recipes-gnome/wv/wv-1.2.4/pkgconfig.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: wv-1.2.0/wv-1.0.pc.in
-===================================================================
---- wv-1.2.0.orig/wv-1.0.pc.in	2008-03-19 22:25:18.000000000 +0000
-+++ wv-1.2.0/wv-1.0.pc.in	2008-03-19 22:26:32.000000000 +0000
-@@ -6,5 +6,6 @@
- Name: wvWare
- Description: Word Document Filter library and utilities
- Version: @VERSION@
--Libs: -L${libdir} -lwv @WMF_LIBS@ @XML_LIBS@ @GLIB_LIBS@ @GSF_LIBS@ @PNG_LIBS@ @ZLIB_LIBS@ @LIBS@ -lm
--Cflags: -I${includedir}/wv @GSF_CFLAGS@
-+Requires: libgsf-1
-+Libs: -L${libdir} -lwv @WMF_LIBS@ @XML_LIBS@ @PNG_LIBS@ @ZLIB_LIBS@ @LIBS@ -lm
-+Cflags: -I${includedir}/wv
diff --git a/meta-gnome/recipes-gnome/wv/wv-1.2.4/0001-configure-use-foreign-mode-to-avoid-errors-with-miss.patch b/meta-gnome/recipes-gnome/wv/wv/0001-configure-use-foreign-mode-to-avoid-errors-with-miss.patch
similarity index 100%
rename from meta-gnome/recipes-gnome/wv/wv-1.2.4/0001-configure-use-foreign-mode-to-avoid-errors-with-miss.patch
rename to meta-gnome/recipes-gnome/wv/wv/0001-configure-use-foreign-mode-to-avoid-errors-with-miss.patch
diff --git a/meta-gnome/recipes-gnome/wv/wv-1.2.4/0001-wvRTF.c-Specify-print-format-in-rtf_output.patch b/meta-gnome/recipes-gnome/wv/wv/0001-wvRTF.c-Specify-print-format-in-rtf_output.patch
similarity index 100%
rename from meta-gnome/recipes-gnome/wv/wv-1.2.4/0001-wvRTF.c-Specify-print-format-in-rtf_output.patch
rename to meta-gnome/recipes-gnome/wv/wv/0001-wvRTF.c-Specify-print-format-in-rtf_output.patch
diff --git a/meta-gnome/recipes-gnome/wv/wv_1.2.4.bb b/meta-gnome/recipes-gnome/wv/wv_1.2.9.bb
similarity index 65%
rename from meta-gnome/recipes-gnome/wv/wv_1.2.4.bb
rename to meta-gnome/recipes-gnome/wv/wv_1.2.9.bb
index 03ee5b4ac..72b8508a2 100644
--- a/meta-gnome/recipes-gnome/wv/wv_1.2.4.bb
+++ b/meta-gnome/recipes-gnome/wv/wv_1.2.9.bb
@@ -5,14 +5,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6cbca01f1c9178aca280e8ff64d85b2f"
 
 DEPENDS = "libgsf glib-2.0 libpng"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/wvware/wv-${PV}.tar.gz \
-           file://pkgconfig.patch \
+SRC_URI = "https://www.abisource.com/downloads/wv/${PV}/${BP}.tar.gz \
            file://0001-configure-use-foreign-mode-to-avoid-errors-with-miss.patch \
            file://0001-wvRTF.c-Specify-print-format-in-rtf_output.patch \
            "
 
-SRC_URI[md5sum] = "c1861c560491f121e12917fa76970ac5"
-SRC_URI[sha256sum] = "673109910e22d4cf94cc8be4dcb9a0c41b5fbdb1736d4b7bdc7778894d57c2d6"
+SRC_URI[md5sum] = "dbccf2e9f747e50c913b7e3d126b73f7"
+SRC_URI[sha256sum] = "4c730d3b325c0785450dd3a043eeb53e1518598c4f41f155558385dd2635c19d"
 
 inherit autotools pkgconfig
 
-- 
2.17.1


