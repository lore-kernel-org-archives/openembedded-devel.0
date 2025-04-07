Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 597A7C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 16:17:22 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.51621.1744042641079275144
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 09:17:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=EDlAtDzo;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-2025040716171820d53b8ff18ae9b31e-3zlpzd@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2025040716171820d53b8ff18ae9b31e
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 07 Apr 2025 18:17:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=AL8zSAzl7y53uNRng70V8/A2JVTsksKRV5R5a94Be3E=;
 b=EDlAtDzoM11uogwcVXSMMGrV/vJ0cG5hmhOTpd4BKojt24QDats5HH65lcu2VriZJvkwaL
 S9jsB1A9vGqPiNUrWa4cY3aob9DQlVUviF1t7uWIwFrA/HDDsnhbTNR3rEB0NlutF7ESJ77T
 FyN+JgdY9HyVIFMoJ0lm7tQTlU7P/RtYmZn2wSIaoRUjn8yohe6XTdtEy335e8TAWs9KlzgT
 U3JhUca5oBRZMd3kuDBxYMPVe4wT0Oh2ErWr63xhHnvyBHJNx+itZ78r7TP2DFLX31NrbJCd
 zPBE0zZNr0pF7rVlD2yEJhAJoewOcIimb8ZDe49xGnDVdpy0keSvfnkA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH v2 2/3] bit7z: add new recipe
Date: Mon,  7 Apr 2025 18:16:25 +0200
Message-Id: <20250407161626.8501-2-peter.marko@siemens.com>
In-Reply-To: <20250407161626.8501-1-peter.marko@siemens.com>
References: <20250407161626.8501-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 16:17:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116673

From: Peter Marko <peter.marko@siemens.com>

bit7z is a cross-platform C++ static library that allows the
compression/extraction of archive files through a clean and simple
wrapper interface to the dynamic libraries from the 7-Zip project.
It supports compression and extraction to and from the filesystem or
the memory, reading archives metadata, updating existing ones,
creating multi-volume archives, operation progress callbacks, and many
other functionalities.

Recipe comments:
* 2 patches needed for successful build+ptest were submitted upstream
* to upstream dependency inclusion patch we'd have to completely rework
  dependency handling and would be probably against their concepts

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...ge-in-BitPropVariant-on-Arm-architec.patch | 41 +++++++++++++++
 ...Fix-reinterpret-cast-compiler-errors.patch | 52 +++++++++++++++++++
 ...1-cmake-disable-dependency-inclusion.patch | 29 +++++++++++
 meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb  | 29 +++++++++++
 4 files changed, 151 insertions(+)
 create mode 100644 meta-oe/recipes-extended/7zip/bit7z/0001-Fix-int8_t-storage-in-BitPropVariant-on-Arm-architec.patch
 create mode 100644 meta-oe/recipes-extended/7zip/bit7z/0001-Fix-reinterpret-cast-compiler-errors.patch
 create mode 100644 meta-oe/recipes-extended/7zip/bit7z/0001-cmake-disable-dependency-inclusion.patch
 create mode 100644 meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb

diff --git a/meta-oe/recipes-extended/7zip/bit7z/0001-Fix-int8_t-storage-in-BitPropVariant-on-Arm-architec.patch b/meta-oe/recipes-extended/7zip/bit7z/0001-Fix-int8_t-storage-in-BitPropVariant-on-Arm-architec.patch
new file mode 100644
index 0000000000..b1bf6923f2
--- /dev/null
+++ b/meta-oe/recipes-extended/7zip/bit7z/0001-Fix-int8_t-storage-in-BitPropVariant-on-Arm-architec.patch
@@ -0,0 +1,41 @@
+From d504abaf2b0a514193f52df42098bc16de4718b2 Mon Sep 17 00:00:00 2001
+From: Oz <rik20@live.it>
+Date: Fri, 17 Jan 2025 21:23:59 +0100
+Subject: [PATCH] Fix int8_t storage in BitPropVariant on Arm architectures
+
+Upstream-Status: Backport [https://github.com/rikyoz/bit7z/commit/d504abaf2b0a514193f52df42098bc16de4718b2]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ include/bit7z/bitwindows.hpp | 4 ++++
+ src/bitpropvariant.cpp       | 2 +-
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/include/bit7z/bitwindows.hpp b/include/bit7z/bitwindows.hpp
+index 5849b956..2f29a989 100644
+--- a/include/bit7z/bitwindows.hpp
++++ b/include/bit7z/bitwindows.hpp
+@@ -126,7 +126,11 @@ struct PROPVARIANT {
+     WORD wReserved2;
+     WORD wReserved3;
+     union {
++#if defined( __arm__ ) || defined( __aarch64__ )
++        signed char cVal;
++#else
+         char cVal;
++#endif
+         unsigned char bVal;
+         short iVal;
+         unsigned short uiVal;
+diff --git a/src/bitpropvariant.cpp b/src/bitpropvariant.cpp
+index 1e7f094f..642e1268 100644
+--- a/src/bitpropvariant.cpp
++++ b/src/bitpropvariant.cpp
+@@ -157,7 +157,7 @@ BitPropVariant::BitPropVariant( uint64_t value ) noexcept: PROPVARIANT() {
+ BitPropVariant::BitPropVariant( int8_t value ) noexcept: PROPVARIANT() {
+     vt = VT_I1;
+     wReserved1 = 0;
+-    cVal = static_cast< char >( value );
++    cVal = static_cast< decltype(cVal) >( value );
+ }
+ 
+ BitPropVariant::BitPropVariant( int16_t value ) noexcept: PROPVARIANT() {
diff --git a/meta-oe/recipes-extended/7zip/bit7z/0001-Fix-reinterpret-cast-compiler-errors.patch b/meta-oe/recipes-extended/7zip/bit7z/0001-Fix-reinterpret-cast-compiler-errors.patch
new file mode 100644
index 0000000000..08b64f4999
--- /dev/null
+++ b/meta-oe/recipes-extended/7zip/bit7z/0001-Fix-reinterpret-cast-compiler-errors.patch
@@ -0,0 +1,52 @@
+From bedeec4d57d29be7de91697277ace00ba87d3e75 Mon Sep 17 00:00:00 2001
+From: Peter Marko <peter.marko@siemens.com>
+Date: Tue, 1 Apr 2025 15:23:51 +0200
+Subject: [PATCH] Fix reinterpret-cast compiler errors
+
+Building on 32-bit arm, following warning/error occurs:
+
+src/internal/windows.cpp: In function 'bit7z::OLECHAR* AllocStringBuffer(LPCSTR, uint32_t)':
+src/internal/windows.cpp:79:6: error: cast from 'unsigned char*' to 'bstr_prefix_t*' {aka 'unsigned int*'} increases required alignment of target type [-Werror=cast-align]
+   79 |     *reinterpret_cast< bstr_prefix_t* >( bstrBuffer ) = byteLength;
+      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+git/src/internal/windows.cpp:83:19: error: cast from 'unsigned char*' to 'bit7z::BSTR' {aka 'wchar_t*'} increases required alignment of target type [-Werror=cast-align]
+   83 |     BSTR result = reinterpret_cast< BSTR >( bstrBuffer + sizeof( bstr_prefix_t ) );
+      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+cc1plus: all warnings being treated as errors
+
+Fix it by using the desired variable size right away and thus avoid
+casting to an array with different alignment.
+
+Upstream-Status: Backport [https://github.com/rikyoz/bit7z/commit/b2789ea9b0fbb2a74dbf6764ddb72d60659a3bce]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/internal/windows.cpp | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/src/internal/windows.cpp b/src/internal/windows.cpp
+index 9304aed7..7bee5959 100644
+--- a/src/internal/windows.cpp
++++ b/src/internal/windows.cpp
+@@ -68,19 +68,18 @@ auto AllocStringBuffer( LPCSTR str, uint32_t byteLength ) -> BSTR {
+ 
+     // Allocating memory for storing the BSTR as a byte array.
+     // NOLINTNEXTLINE(cppcoreguidelines-no-malloc, cppcoreguidelines-owning-memory)
+-    auto* bstrBuffer = static_cast< byte_t* >( std::calloc( bufferSize, sizeof( byte_t ) ) );
++    auto* bstrBuffer = static_cast< bstr_prefix_t* >( std::calloc( bufferSize, sizeof( byte_t ) ) );
+ 
+     if ( bstrBuffer == nullptr ) { // Failed to allocate memory for the BSTR buffer.
+         return nullptr;
+     }
+ 
+     // Storing the number of bytes of the BSTR as a prefix of it.
+-    // NOLINTNEXTLINE(cppcoreguidelines-pro-type-reinterpret-cast)
+-    *reinterpret_cast< bstr_prefix_t* >( bstrBuffer ) = byteLength;
++    *bstrBuffer = byteLength;
+ 
+     // The actual BSTR must point after the byteLength prefix.
+     // NOLINTNEXTLINE(cppcoreguidelines-pro-bounds-pointer-arithmetic, cppcoreguidelines-pro-type-reinterpret-cast)
+-    BSTR result = reinterpret_cast< BSTR >( bstrBuffer + sizeof( bstr_prefix_t ) );
++    BSTR result = reinterpret_cast< BSTR >( bstrBuffer + 1 );
+     if ( str != nullptr ) {
+         // Copying byte-by-byte the input string to the BSTR.
+         // Note: flawfinder warns about not checking for buffer overflows; this is a false alarm,
diff --git a/meta-oe/recipes-extended/7zip/bit7z/0001-cmake-disable-dependency-inclusion.patch b/meta-oe/recipes-extended/7zip/bit7z/0001-cmake-disable-dependency-inclusion.patch
new file mode 100644
index 0000000000..1b0dfa1eb1
--- /dev/null
+++ b/meta-oe/recipes-extended/7zip/bit7z/0001-cmake-disable-dependency-inclusion.patch
@@ -0,0 +1,29 @@
+From 5e23482b89dfbed025eb5e505aba6420512bd9c3 Mon Sep 17 00:00:00 2001
+From: Peter Marko <peter.marko@siemens.com>
+Date: Tue, 1 Apr 2025 11:31:38 +0200
+Subject: [PATCH] cmake: disable dependency inclusion
+
+In Yocto we don't download dependencies, they are satisfied from
+sysroot.
+This cmake file would try to download dependency management tool CPM
+even if all dependencies are satisfied.
+
+Upstream-Status: Inappropriate [OE-specific]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 5378bb3..5916025 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -194,7 +194,7 @@ include( cmake/BuildOptions.cmake )
+ include( cmake/CompilerOptions.cmake )
+ 
+ # dependencies
+-include( cmake/Dependencies.cmake )
++#include( cmake/Dependencies.cmake )
+ 
+ # 7-zip source code
+ target_link_libraries( ${LIB_TARGET} PRIVATE 7-zip )
diff --git a/meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb b/meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb
new file mode 100644
index 0000000000..2b9029d9e3
--- /dev/null
+++ b/meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb
@@ -0,0 +1,29 @@
+SUMMARY = "A C++ static library offering a clean and simple interface to the 7-Zip shared libraries"
+HOMEPAGE = "https://github.com/rikyoz/bit7z"
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=48a3fe23ed1353e0995dadfda05ffdb6"
+
+SRC_URI = " \
+    git://github.com/rikyoz/bit7z.git;protocol=https;branch=master \
+    file://0001-cmake-disable-dependency-inclusion.patch \
+    file://0001-Fix-reinterpret-cast-compiler-errors.patch \
+    file://0001-Fix-int8_t-storage-in-BitPropVariant-on-Arm-architec.patch \
+"
+
+SRCREV = "386e00ad3286e7a10e5bb6d05a5b41b523fce623"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+DEPENDS = "7zip"
+
+EXTRA_OECMAKE += "-DBIT7Z_CUSTOM_7ZIP_PATH=${STAGING_INCDIR}/7zip"
+
+do_install() {
+    install -d ${D}${libdir}
+    install -m 0644 ${S}/lib/*/*.a ${D}${libdir}
+
+    install -d ${D}${includedir}/${BPN}
+    install -m 0644 ${S}/include/${BPN}/*.hpp ${D}${includedir}/${BPN}
+}

