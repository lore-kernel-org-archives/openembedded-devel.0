Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4B047752AD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 06:51:58 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id f189-v6so2266176pfa.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 23:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=4dRHdTosdstJ4WBCyI6ceZ8FAHud/cJA6CUsS3leVRM=;
	b=IuGpAGuXH9H/q6XJRnkFe+gTGkdao2X0lzI7gFIHdzd9Bn1vceoHgnxL9vZS26SBtp
	dQ2IrA2x8mpKqeRssQHFKVqJk0PaOS4sK36cVaxREmmOcYEpK1RIDWuQC7lp3NpKk+Ps
	Zlgzux4YuJkYuT4u9spDOHRZXbcu2gFV/BYyTEpp0Usrhu8TEgIS14o/cmlLs0bRpglk
	5HyR4HDpd9UgHHOPK9rIMYU3XlI9Oz39YCCPqwX1Xmi9NyKCJIE0yzoIo3eR05iQ+siJ
	GnIJq9GVVXguKD413XVY/VmKFgS4H0YuZQProV+DqJ4N0G0PAnPD3zqOcE2sY96eP7Aa
	z88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4dRHdTosdstJ4WBCyI6ceZ8FAHud/cJA6CUsS3leVRM=;
	b=a161ZdWUNK+h/5nRyFxHGqgjYffkSMkUkTrmtptb0Zhx8GT8uuMnpD93Mq/M+fFlA7
	lRuirI/qyoHzDHl5z355NMWADlgccw5m5baH2nIvTDG25gl4utzOr1tP/HRsgKXHUtYz
	krnSeW/ZvkJtYhLXnEG2dNOs+gSn/uvreLtb2Wp3LdBKCy6MkAjLoMzjWcR8FpLGrKiO
	Q7/DXL38T5deQydvfx+zwBkIc//Lrfcx0Lw7l+BLYtTlgw81SAhl4pP7I7oiKd4MA9XY
	MB+5BcicUxznFHE5QcasR5Mlf2MvkaCypsV3eSmKo+Yzc6Jol+qdedb58IyKc+IEZUXo
	82Rw==
X-Gm-Message-State: ALKqPwe9wRHa4U+Zf1jTSfQA20cva3ULRMVFephtps/VPWBXZlWHXRRj
	5VRg6TtuOJnu4097ghUeXflqhw==
X-Google-Smtp-Source: AB8JxZpidLnr7v31J7d0JdyujDvgjypJm5a8y8tpwg4aOpjZfZXtByYuLrYl4lpC8ankCFnzlPtIzw==
X-Received: by 2002:a63:6aca:: with SMTP id
	f193-v6mr3535056pgc.244.1526021519710; 
	Thu, 10 May 2018 23:51:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	w12-v6sm6648503pfi.158.2018.05.10.23.51.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 May 2018 23:51:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 May 2018 23:51:53 -0700
Message-Id: <20180511065153.39324-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [meta-oe][PATCH] poppler: Update to 0.64
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
X-List-Received-Date: Fri, 11 May 2018 06:51:59 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...txt-Add-libpoppler-to-link-along-wit.patch | 29 +++++++++++++++++++
 .../{poppler_0.63.0.bb => poppler_0.64.0.bb}  | 20 +++++++------
 2 files changed, 40 insertions(+), 9 deletions(-)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/0001-glib-CMakeLists.txt-Add-libpoppler-to-link-along-wit.patch
 rename meta-oe/recipes-support/poppler/{poppler_0.63.0.bb => poppler_0.64.0.bb} (74%)

diff --git a/meta-oe/recipes-support/poppler/poppler/0001-glib-CMakeLists.txt-Add-libpoppler-to-link-along-wit.patch b/meta-oe/recipes-support/poppler/poppler/0001-glib-CMakeLists.txt-Add-libpoppler-to-link-along-wit.patch
new file mode 100644
index 0000000000..7ed795ef7b
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/0001-glib-CMakeLists.txt-Add-libpoppler-to-link-along-wit.patch
@@ -0,0 +1,29 @@
+From d488de23b75b2f3e235f1c184b2253d1402b4c0f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 10 May 2018 23:47:56 -0700
+Subject: [PATCH] glib/CMakeLists.txt: Add libpoppler to link along with
+ poppler-glib
+
+This is required since poppler-glib uses symbols from poppler and
+we use --as-needed
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ glib/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/glib/CMakeLists.txt b/glib/CMakeLists.txt
+index 33c6608..87e1b44 100644
+--- a/glib/CMakeLists.txt
++++ b/glib/CMakeLists.txt
+@@ -127,7 +127,7 @@ if (HAVE_INTROSPECTION AND BUILD_SHARED_LIBS)
+   get_directory_property(_tmp_includes INCLUDE_DIRECTORIES)
+   _list_prefix(_includes _tmp_includes "-I")
+   set(Poppler_0_18_gir_CFLAGS ${_includes} -L${CMAKE_BINARY_DIR})
+-  set(Poppler_0_18_gir_LIBS poppler-glib)
++  set(Poppler_0_18_gir_LIBS poppler-glib poppler)
+   _list_prefix(_abs_introspection_files introspection_files "${CMAKE_CURRENT_SOURCE_DIR}/")
+   list(APPEND _abs_introspection_files
+     ${CMAKE_CURRENT_BINARY_DIR}/poppler-enums.c
diff --git a/meta-oe/recipes-support/poppler/poppler_0.63.0.bb b/meta-oe/recipes-support/poppler/poppler_0.64.0.bb
similarity index 74%
rename from meta-oe/recipes-support/poppler/poppler_0.63.0.bb
rename to meta-oe/recipes-support/poppler/poppler_0.64.0.bb
index 8acb356287..01f0df109d 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.63.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.64.0.bb
@@ -2,15 +2,15 @@ SUMMARY = "Poppler is a PDF rendering library based on the xpdf-3.0 code base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = " \
-    http://poppler.freedesktop.org/${BP}.tar.xz \
-    file://0001-Do-not-overwrite-all-our-build-flags.patch \
-    file://0002-CairoOutputDev.cc-fix-build-error-when-using-fixedpo.patch \
-"
-SRC_URI[md5sum] = "66a54da4896b1408611699feda5c1821"
-SRC_URI[sha256sum] = "27cc8addafc791e1a26ce6acc2b490926ea73a4f89196dd8a7742cff7cf8a111"
+SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
+           file://0001-Do-not-overwrite-all-our-build-flags.patch \
+           file://0002-CairoOutputDev.cc-fix-build-error-when-using-fixedpo.patch \
+           file://0001-glib-CMakeLists.txt-Add-libpoppler-to-link-along-wit.patch \
+           "
+SRC_URI[md5sum] = "f7f687ebb60004f8ad61994575018044"
+SRC_URI[sha256sum] = "b21df92ca99f78067785cf2dc8e06deb04726b62389c0ee1f5d8b103c77f64b1"
 
-DEPENDS = "fontconfig zlib cairo lcms"
+DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
 inherit cmake pkgconfig gobject-introspection
 
@@ -26,12 +26,14 @@ PACKAGECONFIG[nss] = "-DWITH_NSS3=ON,-DWITH_NSS3=OFF,nss"
 # surprise - did not expect this to work :)
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'cmake_qt5', '', d)}
 
-SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
+#SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
 
 EXTRA_OECMAKE += " \
+    -DENABLE_CMS=lcms2 \
     -DENABLE_XPDF_HEADERS=ON \
     -DBUILD_GTK_TESTS=OFF \
     -DENABLE_ZLIB=ON \
+    -DCMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES:PATH='${STAGING_INCDIR}' \
 "
 
 do_configure_append() {
-- 
2.17.0


