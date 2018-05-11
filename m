Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 69F927553C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 07:01:44 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id a13-v6so2049324pgu.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 00:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=3XsifDIGhf5ILQr4ZZ68utZSlVs8RP7dSdgnRqdNMBA=;
	b=rYCAmMlHywd5xtyVlxHFRRb+pxG11i8sy+1nfNnLctKZeK+aSRAN9rcD6WiZ+d63Ri
	wUAtAQXGUNdJdOhPhHrIq/sGatxwyL2B90LiTSmuZH2GGY6tRcpTBlDM4K5clLv9we3K
	9neema18coXJlNXvaTB9WQjAlXICex8DDX5mhwdTMr5fmPTEiIiXoztcUtmgp/gBMab8
	Eny4W1B2mQ+AjwatKMFnQIGItAzejYg7nhO9/WetbciTzZYIIFsOmtRrzwDYWnWzR+wi
	5Od5FwKK+buXvOwuE4TCftjot8Qt/cP42BmR2410wFtJ8Eun80SbAOsCvPIKv/Vmir3h
	S9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3XsifDIGhf5ILQr4ZZ68utZSlVs8RP7dSdgnRqdNMBA=;
	b=qvxxRS8C68WVC747X5kDOKd6vsdPXtB+r+1I/KS75Xa5EPLaqV//NEa2EWOZnwSnuS
	ca0BMn/dTaIzymTFFK0n4Wd7mSpFjM86Zq1QpHnPxi7kBumNq+nMhbhjNfTOWPwHUNUn
	2KNkSnzwGzWYmRRVdf0lKHkFiSOf2fdZW0uuzR8NEIrRtW2xXA0B+EXYaNxBbRtF+ttg
	80o1QMQckJ4uOWN7/N2PV++HYNmqGZaR2UpQZVmPyL/CEgQnltH8kMPQHxqZSMyVHQ98
	O9zDIEHolf6tDB0JfFciMAt/vNTEvXH+32lTxcviFcBXbFqsljnzgCKHh7BbdM5dNvye
	ky/Q==
X-Gm-Message-State: ALKqPweEd8FgyKRykZ06Tb7x+gMLphPe1KjpCkqSuquafq7PKpXFnqHp
	O/o9CfgEzonFn1sVImyeg71zRg==
X-Google-Smtp-Source: AB8JxZrKQ77ZD3mpsP6U/8DSzYUjRJow1+0aNi6KbjNUbY9dYSjCumUJFvq0BO9kRSCypTFiiR7q9Q==
X-Received: by 2002:a63:6ac6:: with SMTP id
	f189-v6mr3556256pgc.308.1526022105829; 
	Fri, 11 May 2018 00:01:45 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	w1-v6sm3741016pgp.3.2018.05.11.00.01.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 May 2018 00:01:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 May 2018 00:01:42 -0700
Message-Id: <20180511070142.38794-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [meta-oe][PATCH V2] poppler: Update to 0.64
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
X-List-Received-Date: Fri, 11 May 2018 07:01:45 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes since v1:
    - Fix build with security flags

 ...txt-Add-libpoppler-to-link-along-wit.patch | 29 +++++++++++++++++++
 .../{poppler_0.63.0.bb => poppler_0.64.0.bb}  | 18 +++++++-----
 2 files changed, 39 insertions(+), 8 deletions(-)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/0001-glib-CMakeLists.txt-Add-libpoppler-to-link-along-wit.patch
 rename meta-oe/recipes-support/poppler/{poppler_0.63.0.bb => poppler_0.64.0.bb} (76%)

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
similarity index 76%
rename from meta-oe/recipes-support/poppler/poppler_0.63.0.bb
rename to meta-oe/recipes-support/poppler/poppler_0.64.0.bb
index 8acb356287..1e87ae6e6c 100644
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
 
@@ -29,9 +29,11 @@ inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'cmake_qt5', '', d)}
 SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
 
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


