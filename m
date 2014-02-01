Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 562366EA8E
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2014 07:34:36 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so2658458eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 23:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=mYgbIF4FlVcyVg/nJJqVnsRsgjp9cmhS5OXHBK0U3/w=;
	b=ou6O5fe4/msOwsNeaHRYHvFVNGF2uFkOO++v+OtE0D47jbjOQd5dLnm1vSMMiVRS4S
	p3HApumZlo3uGm4OyalHEtE2LbcLqPBP+k3HMp6HoX+kGOJLUyp1JJjU0Yk2X1vr09e9
	sQLxdjHLrTD9wdUoTpx8imwewwS/Kir8N1R7/fMFVw8WaasY+z6u9vSIJ2W7nyJ/7eWo
	NEr5jyg/iiJlewuHPF7geZkXXHRIZES1glQadrQujomRO07qS6GZkvixfNgvIR/D6v9W
	Nb1yN3wv5wtlALV8JzCXoS01ZSPVrnVgma04ortY37HfYLy87rPEdNw2ubunbFOeKHCi
	VVNw==
X-Received: by 10.14.225.67 with SMTP id y43mr805105eep.10.1391240077020;
	Fri, 31 Jan 2014 23:34:37 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id m9sm32959596eeh.3.2014.01.31.23.34.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jan 2014 23:34:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Feb 2014 08:34:10 +0100
Message-Id: <366ccbf904d279e3238e2b7bfad200ec10714a5a.1391239970.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
Subject: [PATCH 14/20] webkit-efl: Add recipe with snapshot from r159807
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
X-List-Received-Date: Sat, 01 Feb 2014 07:34:36 -0000

* announcement:
  http://sourceforge.net/mailarchive/message.php?msg_id=31742684

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...lines.h-remove-indexingHeader-preCapacity.patch | 27 ++++++++++++
 ...KitHelpers.cmake-Add-Wno-error-cast-align.patch | 29 +++++++++++++
 .../webkit/webkit-efl/gcc-4.8.2.fix.patch          | 15 +++++++
 .../webkit/webkit-efl_2.3.2+svnr159807.bb          | 48 ++++++++++++++++++++++
 4 files changed, 119 insertions(+)
 create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0001-ButterflyInlines.h-remove-indexingHeader-preCapacity.patch
 create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0001-WebKitHelpers.cmake-Add-Wno-error-cast-align.patch
 create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/gcc-4.8.2.fix.patch
 create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl_2.3.2+svnr159807.bb

diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/0001-ButterflyInlines.h-remove-indexingHeader-preCapacity.patch b/meta-efl/recipes-efl/webkit/webkit-efl/0001-ButterflyInlines.h-remove-indexingHeader-preCapacity.patch
new file mode 100644
index 0000000..003a1d1
--- /dev/null
+++ b/meta-efl/recipes-efl/webkit/webkit-efl/0001-ButterflyInlines.h-remove-indexingHeader-preCapacity.patch
@@ -0,0 +1,27 @@
+From 5b9bbf9c056e3690e2872cc74a8962ec6a21a020 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Mon, 13 Jan 2014 19:00:46 +0100
+Subject: [PATCH] ButterflyInlines.h: remove
+ !indexingHeader()->preCapacity(oldStructure)
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ Source/JavaScriptCore/runtime/ButterflyInlines.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Source/JavaScriptCore/runtime/ButterflyInlines.h b/Source/JavaScriptCore/runtime/ButterflyInlines.h
+index f5439bb..d5c828f 100644
+--- a/Source/JavaScriptCore/runtime/ButterflyInlines.h
++++ b/Source/JavaScriptCore/runtime/ButterflyInlines.h
+@@ -128,7 +128,7 @@ inline Butterfly* Butterfly::growArrayRight(
+     bool hadIndexingHeader, size_t oldIndexingPayloadSizeInBytes,
+     size_t newIndexingPayloadSizeInBytes)
+ {
+-    ASSERT_UNUSED(oldStructure, !indexingHeader()->preCapacity(oldStructure));
++//    ASSERT_UNUSED(oldStructure, !indexingHeader()->preCapacity(oldStructure));
+     ASSERT_UNUSED(oldStructure, hadIndexingHeader == oldStructure->hasIndexingHeader(intendedOwner));
+     void* theBase = base(0, propertyCapacity);
+     size_t oldSize = totalSize(0, propertyCapacity, hadIndexingHeader, oldIndexingPayloadSizeInBytes);
+-- 
+1.8.5.2
+
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/0001-WebKitHelpers.cmake-Add-Wno-error-cast-align.patch b/meta-efl/recipes-efl/webkit/webkit-efl/0001-WebKitHelpers.cmake-Add-Wno-error-cast-align.patch
new file mode 100644
index 0000000..5df0f8a
--- /dev/null
+++ b/meta-efl/recipes-efl/webkit/webkit-efl/0001-WebKitHelpers.cmake-Add-Wno-error-cast-align.patch
@@ -0,0 +1,29 @@
+From bfabbcab5dc4fe29bc91bbfbd9c9a404a3e2538b Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Mon, 13 Jan 2014 17:21:25 +0100
+Subject: [PATCH] WebKitHelpers.cmake: Add -Wno-error=cast-align
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ Source/cmake/WebKitHelpers.cmake | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Source/cmake/WebKitHelpers.cmake b/Source/cmake/WebKitHelpers.cmake
+index 1e51ebc..d813117 100644
+--- a/Source/cmake/WebKitHelpers.cmake
++++ b/Source/cmake/WebKitHelpers.cmake
+@@ -42,7 +42,10 @@ macro(WEBKIT_SET_EXTRA_COMPILER_FLAGS _target)
+ 
+         # Enable errors on warning
+         if (OPTION_ENABLE_WERROR)
+-            set(OLD_COMPILE_FLAGS "-Werror -Wno-error=unused-parameter ${OLD_COMPILE_FLAGS}")
++            # /OE/build/shr-core/tmp-eglibc/work/x86_64-oe-linux/webkit-efl/2.3.2+svnr159807-r0/webkit-efl/Source/WebCore/platform/graphics/GlyphPage.h: In member function 'void WebCore::OpenTypeVerticalData::substituteWithVerticalGlyphs(const WebCore::SimpleFontData*, WebCore::GlyphPage*, unsigned int, unsigned int) const': /OE/build/shr-core/tmp-eglibc/work/x86_64-oe-linux/webkit-efl/2.3.2+svnr159807-r0/webkit-efl/Source/WebCore/platform/graphics/GlyphPage.h:120:30: error: array subscript is above array bounds [-Werror=array-bounds]
++            # | /OE/build/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/include/libsoup-2.4/libsoup/soup-proxy-uri-resolver.h:13:50: error: 'GType soup_proxy_uri_resolver_get_type()' is deprecated (declared at /OE/build/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/include/libsoup-2.4/libsoup/soup-proxy-uri-resolver.h:48) [-Werror=deprecated-declarations]
++            # | /OE/build/shr-core/tmp-eglibc/work/cortexa8-vfp-neon-oe-linux-gnueabi/webkit-efl/2.3.2+svnr159807-r0/webkit-efl/Source/JavaScriptCore/runtime/JSDataViewPrototype.cpp:120:133: error: cast from 'uint8_t* {aka unsigned char*}' to 'JSC::IntegralTypedArrayAdaptor<short int, JSC::GenericTypedArrayView<JSC::Int16Adaptor>, JSC::JSGenericTypedArrayView<JSC::Int16Adaptor>, (JSC::TypedArrayType)4u>::Type* {aka short int*}' increases required alignment of target type [-Werror=cast-align]
++            set(OLD_COMPILE_FLAGS "-Werror -Wno-error=unused-parameter -Wno-error=array-bounds -Wno-error=deprecated-declarations -Wno-error=cast-align ${OLD_COMPILE_FLAGS}")
+         endif ()
+ 
+         # Disable C++0x compat warnings for GCC >= 4.6.0 until we build
+-- 
+1.8.5.2
+
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/gcc-4.8.2.fix.patch b/meta-efl/recipes-efl/webkit/webkit-efl/gcc-4.8.2.fix.patch
new file mode 100644
index 0000000..635c1cb
--- /dev/null
+++ b/meta-efl/recipes-efl/webkit/webkit-efl/gcc-4.8.2.fix.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Backport http://trac.webkit.org/changeset/160834
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+Index: a/Source/WTF/wtf/dtoa/double-conversion.cc
+===================================================================
+--- a/Source/WTF/wtf/dtoa/double-conversion.cc	(revision 160833)
++++ b/Source/WTF/wtf/dtoa/double-conversion.cc	(revision 160834)
+@@ -447,5 +447,5 @@
+         const int kBufferSize = kMaxSignificantDigits + 10;
+         char buffer[kBufferSize];  // NOLINT: size is known at compile time.
+-        int buffer_pos = 0;
++        unsigned buffer_pos = 0;
+         
+         // Exponent will be adjusted if insignificant digits of the integer part
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl_2.3.2+svnr159807.bb b/meta-efl/recipes-efl/webkit/webkit-efl_2.3.2+svnr159807.bb
new file mode 100644
index 0000000..879ff1f
--- /dev/null
+++ b/meta-efl/recipes-efl/webkit/webkit-efl_2.3.2+svnr159807.bb
@@ -0,0 +1,48 @@
+DESCRIPTION = "Webkit browser engine, EFL edition"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://Source/WebKit/LICENSE;md5=4646f90082c40bcf298c285f8bab0b12 \
+                    file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d84286dda758da57bd691 \
+                    file://Source/WebKit/efl/ewk/EWebKit.h;endline=20;md5=55ea170b1582797d2c69712de850f2fa \
+"
+
+# you need harfbuzz with icu enabled, you can add this to your config:
+# PACKAGECONFIG_append_pn-harfbuzz = " icu"
+DEPENDS = "icu libxslt sqlite3 gperf-native bison-native flex-native jpeg \
+           libpng libxt fontconfig cairo freetype glib-2.0 libsoup-2.4 \
+           libxml2 pango eina ecore evas edje eldbus harfbuzz enchant \
+           ruby-native"
+
+SRC_URI = "\
+    ${E_RELEASES}/libs/webkit-efl/webkit-efl-159807.tar.xz \
+    file://gcc-4.8.2.fix.patch \
+    file://0001-WebKitHelpers.cmake-Add-Wno-error-cast-align.patch \
+    file://0001-ButterflyInlines.h-remove-indexingHeader-preCapacity.patch \
+"
+SRC_URI[md5sum] = "3e1377d976460dd14db0dd3cd39b8e48"
+SRC_URI[sha256sum] = "a99531299e41ba4671b32bbf46c3efc4d65960c9c87949a87f76e622c284f178"
+
+S = "${WORKDIR}/${BPN}"
+
+inherit cmake lib_package pkgconfig perlnative pythonnative
+
+ARM_INSTRUCTION_SET = "arm"
+
+EXTRA_OECMAKE = " \
+    -DPORT=Efl \
+    -DSHARED_CORE=On \
+    -DENABLE_DRAG_SUPPORT=On \
+    -DENABLE_WEB_AUDIO=Off \
+    -DENABLE_VIDEO=Off \
+    -DENABLE_VIDEO_TRACK=Off \
+    -DENABLE_ACCESSIBILITY=Off \
+    -DENABLE_BATTERY_STATUS=Off \
+"
+
+LEAD_SONAME = "libewebkit.so"
+PACKAGES =+ "${PN}launcher-dbg ${PN}launcher ${PN}-inspector"
+
+FILES_${PN} += "${datadir}/webkit-1.0/theme/default.edj ${datadir}/ewebkit-0/themes/default.edj"
+FILES_${PN}-dev += "${libdir}/cmake"
+FILES_${PN}launcher = "${bindir}/EWebLauncher"
+FILES_${PN}launcher-dbg = "${bindir}/.debug/EWebLauncher"
+FILES_${PN}-inspector += "${datadir}/ewebkit-0/inspector"
-- 
1.8.5.3


