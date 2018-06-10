Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 763A97604D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 14:11:40 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id w7-v6so17706765wrn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 07:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=t7MpHX064T0v22lHji/10fqQ3Wa1QqglTIhcmDH1li4=;
	b=DhPt7Ty/9mgi3O0Q4qCfBStyX4pyPvHSdUvru9XYwTbMknuhGsgpiMogi0Y4O8GZU5
	fQGNcPnvoAr9AaxwHD3rLehZ8vpEbiSedxFMVQxUnVwDAisFVGUJMKZv4k7nwVRHBv3t
	eZ0S5bpffqgZVOXCrVqrful3MHNsxRMhkh9kemLXUDFJ90DVsEnpOSpQEZIS6g1e76Ff
	Zzy7+U6RDm4FTdV/dtEdjw2K/zeTDqKCGs0VgaLbhmX3JDs3rEtJha1pj6fm5w1ntXw7
	yZfHg19t0cnv47nXIZu+LJHdi9g6OrK0C1jFDcLgp9oQ+cp4gO09kVFswTSUEPQktrH6
	jcKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=t7MpHX064T0v22lHji/10fqQ3Wa1QqglTIhcmDH1li4=;
	b=PEtIx9RuAESDRf0AJ2tnCp9A+Xrj/0w0IDfwwE9Pa6GVeMj+MR1/nZiV3QqTXMS6rh
	Y1ilG3tu4wgqZOb4fJWV2A/Tq6NDD5v3YGJmvm3USY9gzUAGi1rE5SBZ+Zj9i/dfGfi3
	eSf5+SbkPgn+w0qM+evJCp4mMrl2DEZ19hQiq2p4yh07ZCZhpdt1dlEpAo9VuA63/0d2
	uj1PWxf14gpcbedgPsuoZL+r2eVMDTzArrcsWpJq9imzrd3gPpYP073z/PqHqbeoFND4
	IO/Z1aVox/fsE2mjcc7nQuuBDReZocaqXobeAwuuNRlake5FsOjV3JNP3cL+5+TEfMoC
	Wjkw==
X-Gm-Message-State: APt69E2koXKX1zkHg1i9Vt/qxDzX3qGw+WdN48NBoIejgrO68g8kjhFl
	deXNekjE31Q/UVFNyA4CoHeQFw==
X-Google-Smtp-Source: ADUXVKKp6Jqi6benT3q3vlUus+5SYLuNEQOxMg5TOZbGiu3TuKtx7IPJvfEch94A5onGOluKpgl0pw==
X-Received: by 2002:adf:ba01:: with SMTP id
	o1-v6mr10868933wrg.249.1528639901029; 
	Sun, 10 Jun 2018 07:11:41 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	y18-v6sm33891587wrl.53.2018.06.10.07.11.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Jun 2018 07:11:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2018 14:11:36 +0000
Message-Id: <20180610141136.4311-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180610141136.4311-1-Martin.Jansa@gmail.com>
References: <20180610141136.4311-1-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-qt5 4/4] qtwebengine: fix build with plugins as well as ozone enabled
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
X-List-Received-Date: Sun, 10 Jun 2018 14:11:40 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...es.cpp-Fix-build-with-plugins-and-oz.patch | 50 +++++++++++++++++++
 ...alloc-as-it-s-not-available-on-musl.patch} |  2 +-
 ... 0006-musl-link-against-libexecinfo.patch} |  2 +-
 recipes-qt/qt5/qtwebengine_git.bb             |  7 +--
 4 files changed, 56 insertions(+), 5 deletions(-)
 create mode 100644 recipes-qt/qt5/qtwebengine/0004-chromium_overrides.cpp-Fix-build-with-plugins-and-oz.patch
 rename recipes-qt/qt5/qtwebengine/{0004-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch => 0005-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch} (94%)
 rename recipes-qt/qt5/qtwebengine/{0005-musl-link-against-libexecinfo.patch => 0006-musl-link-against-libexecinfo.patch} (92%)

diff --git a/recipes-qt/qt5/qtwebengine/0004-chromium_overrides.cpp-Fix-build-with-plugins-and-oz.patch b/recipes-qt/qt5/qtwebengine/0004-chromium_overrides.cpp-Fix-build-with-plugins-and-oz.patch
new file mode 100644
index 0000000..4c82e2f
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0004-chromium_overrides.cpp-Fix-build-with-plugins-and-oz.patch
@@ -0,0 +1,50 @@
+From df55b0480c348e4b7b1875ec012dbb740a71f6dc Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sun, 10 Jun 2018 10:26:17 +0000
+Subject: [PATCH] chromium_overrides.cpp: Fix build with plugins and ozone
+ enabled
+
+* otherwise it fails with:
+  | make[3]: Entering directory '/OE/build/owpb/webos-ports/tmp-glibc/work/i586-webos-linux/qtwebengine/5.10.1+gitAUTOINC+9dc8dff7a8_c858cc7609-r0/build/src/core'
+| creating linker version script QtWebEngineCore.version
+| rm -f libQt5WebEngineCore.so.5.10.1 libQt5WebEngineCore.so libQt5WebEngineCore.so.5 libQt5WebEngineCore.so.5.10
+| linking ../../lib/libQt5WebEngineCore.so.5.10.1
+| /OE/build/owpb/webos-ports/tmp-glibc/work/i586-webos-linux/qtwebengine/5.10.1+gitAUTOINC+9dc8dff7a8_c858cc7609-r0/recipe-sysroot-native/usr/bin/i586-webos-linux/../../libexec/i586-webos-linux/gcc/i586-webos-linux/7.3.0/ld: error: /OE/build/owpb/webos-ports/tmp-glibc/work/i586-webos-linux/qtwebengine/5.10.1+gitAUTOINC+9dc8dff7a8_c858cc7609-r0/build/src/core/release/obj/content/browser/browser/pepper_truetype_font_list_ozone.o: multiple definition of 'content::GetFontFamilies_SlowBlocking(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >*)'
+| /OE/build/owpb/webos-ports/tmp-glibc/work/i586-webos-linux/qtwebengine/5.10.1+gitAUTOINC+9dc8dff7a8_c858cc7609-r0/recipe-sysroot-native/usr/bin/i586-webos-linux/../../libexec/i586-webos-linux/gcc/i586-webos-linux/7.3.0/ld: /OE/build/owpb/webos-ports/tmp-glibc/work/i586-webos-linux/qtwebengine/5.10.1+gitAUTOINC+9dc8dff7a8_c858cc7609-r0/build/src/core/release/obj/QtWebEngineCore/chromium_overrides.o: previous definition here
+| /OE/build/owpb/webos-ports/tmp-glibc/work/i586-webos-linux/qtwebengine/5.10.1+gitAUTOINC+9dc8dff7a8_c858cc7609-r0/recipe-sysroot-native/usr/bin/i586-webos-linux/../../libexec/i586-webos-linux/gcc/i586-webos-linux/7.3.0/ld: error: /OE/build/owpb/webos-ports/tmp-glibc/work/i586-webos-linux/qtwebengine/5.10.1+gitAUTOINC+9dc8dff7a8_c858cc7609-r0/build/src/core/release/obj/content/browser/browser/pepper_truetype_font_list_ozone.o: multiple definition of 'content::GetFontsInFamily_SlowBlocking(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, std::vector<ppapi::proxy::SerializedTrueTypeFontDesc, std::allocator<ppapi::proxy::SerializedTrueTypeFontDesc> >*)'
+| /OE/build/owpb/webos-ports/tmp-glibc/work/i586-webos-linux/qtwebengine/5.10.1+gitAUTOINC+9dc8dff7a8_c858cc7609-r0/recipe-sysroot-native/usr/bin/i586-webos-linux/../../libexec/i586-webos-linux/gcc/i586-webos-linux/7.3.0/ld: /OE/build/owpb/webos-ports/tmp-glibc/work/i586-webos-linux/qtwebengine/5.10.1+gitAUTOINC+9dc8dff7a8_c858cc7609-r0/build/src/core/release/obj/QtWebEngineCore/chromium_overrides.o: previous definition here
+| collect2: error: ld returned 1 exit status
+| Makefile.core_module:74: recipe for target '../../lib/libQt5WebEngineCore.so.5.10.1' failed
+| make[3]: *** [../../lib/libQt5WebEngineCore.so.5.10.1] Error 1
+| make[3]: Leaving directory '/OE/build/owpb/webos-ports/tmp-glibc/work/i586-webos-linux/qtwebengine/5.10.1+gitAUTOINC+9dc8dff7a8_c858cc7609-r0/build/src/core'
+| Makefile:122: recipe for target 'sub-core_module-pro-make_first' failed
+| make[2]: *** [sub-core_module-pro-make_first] Error 2
+| make[2]: Leaving directory '/OE/build/owpb/webos-ports/tmp-glibc/work/i586-webos-linux/qtwebengine/5.10.1+gitAUTOINC+9dc8dff7a8_c858cc7609-r0/build/src/core'
+| Makefile:78: recipe for target 'sub-core-make_first' failed
+| make[1]: *** [sub-core-make_first] Error 2
+| make[1]: Leaving directory '/OE/build/owpb/webos-ports/tmp-glibc/work/i586-webos-linux/qtwebengine/5.10.1+gitAUTOINC+9dc8dff7a8_c858cc7609-r0/build/src'
+| Makefile:46: recipe for target 'sub-src-make_first' failed
+| make: *** [sub-src-make_first] Error 2
+| ERROR: oe_runmake failed
+| WARNING: /OE/build/owpb/webos-ports/tmp-glibc/work/i586-webos-linux/qtwebengine/5.10.1+gitAUTOINC+9dc8dff7a8_c858cc7609-r0/temp/run.do_compile.10122:1 exit 1 from 'exit 1'
+| ERROR: Function failed: do_compile (log file is located at /OE/build/owpb/webos-ports/tmp-glibc/work/i586-webos-linux/qtwebengine/5.10.1+gitAUTOINC+9dc8dff7a8_c858cc7609-r0/temp/log.do_compile.10122)
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
+---
+ src/core/chromium_overrides.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/core/chromium_overrides.cpp b/src/core/chromium_overrides.cpp
+index 8f6687ff..994e2799 100644
+--- a/src/core/chromium_overrides.cpp
++++ b/src/core/chromium_overrides.cpp
+@@ -159,7 +159,7 @@ std::unique_ptr<base::ListValue> GetFontList_SlowBlocking()
+     return std::move(font_list);
+ }
+ 
+-#if BUILDFLAG(ENABLE_PLUGINS)
++#if BUILDFLAG(ENABLE_PLUGINS) && !defined(USE_OZONE)
+ // content/browser/renderer_host/pepper/pepper_truetype_font_list.h
+ void GetFontFamilies_SlowBlocking(std::vector<std::string> *font_families)
+ {
diff --git a/recipes-qt/qt5/qtwebengine/0004-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch b/recipes-qt/qt5/qtwebengine/0005-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch
similarity index 94%
rename from recipes-qt/qt5/qtwebengine/0004-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch
rename to recipes-qt/qt5/qtwebengine/0005-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch
index 34e6909..fc86bc7 100644
--- a/recipes-qt/qt5/qtwebengine/0004-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch
+++ b/recipes-qt/qt5/qtwebengine/0005-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch
@@ -1,4 +1,4 @@
-From 036d00c37384ceef85728d22acdef0c4a97858ea Mon Sep 17 00:00:00 2001
+From 2b031d6f50467470175b2070e5aefb5fdbebb729 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Tue, 12 Dec 2017 16:06:14 +0200
 Subject: [PATCH] musl: don't use pvalloc as it's not available on musl
diff --git a/recipes-qt/qt5/qtwebengine/0005-musl-link-against-libexecinfo.patch b/recipes-qt/qt5/qtwebengine/0006-musl-link-against-libexecinfo.patch
similarity index 92%
rename from recipes-qt/qt5/qtwebengine/0005-musl-link-against-libexecinfo.patch
rename to recipes-qt/qt5/qtwebengine/0006-musl-link-against-libexecinfo.patch
index 5419b3b..f52859f 100644
--- a/recipes-qt/qt5/qtwebengine/0005-musl-link-against-libexecinfo.patch
+++ b/recipes-qt/qt5/qtwebengine/0006-musl-link-against-libexecinfo.patch
@@ -1,4 +1,4 @@
-From 1cc4f23181c03adcf246c296ba188c11a1fe40f7 Mon Sep 17 00:00:00 2001
+From 447dea44ae95e7011ab3921b2b88a4295d406e87 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Thu, 14 Dec 2017 11:28:10 +0200
 Subject: [PATCH] musl: link against libexecinfo
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 24c8a77..db98ee3 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -124,16 +124,17 @@ RDEPENDS_${PN}-examples += " \
 QT_MODULE_BRANCH_CHROMIUM = "65-based"
 
 # Patches from https://github.com/meta-qt5/qtwebengine/commits/b5.11
-# 5.11.meta-qt5.3
+# 5.11.meta-qt5.5
 SRC_URI += " \
     ${QT_GIT}/qtwebengine-chromium.git;name=chromium;branch=${QT_MODULE_BRANCH_CHROMIUM};protocol=${QT_GIT_PROTOCOL};destsuffix=git/src/3rdparty \
     file://0001-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch \
     file://0002-Include-dependency-to-QCoreApplication-translate.patch \
     file://0003-Force-host-toolchain-configuration.patch \
+    file://0004-chromium_overrides.cpp-Fix-build-with-plugins-and-oz.patch \
 "
 SRC_URI_append_libc-musl = "\
-    file://0004-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch \
-    file://0005-musl-link-against-libexecinfo.patch \
+    file://0005-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch \
+    file://0006-musl-link-against-libexecinfo.patch \
 "
 
 # Patches from https://github.com/meta-qt5/qtwebengine-chromium/commits/65-based
-- 
2.17.1


