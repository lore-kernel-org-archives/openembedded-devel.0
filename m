Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F4B8CD98CF
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 15:34:01 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73351.1781278433207940631
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2026 08:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=LYgEQH4j;
 spf=pass (domain: snapchat.com, ip: 209.85.128.48, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so11743215e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2026 08:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1781278431; x=1781883231; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I7ac2bMVpH+89W2mCm04KmqJ293ofP/3/KioTUnDrGs=;
        b=LYgEQH4j4dsQnDRE/t34+XjbYt+DShf2YV6/P/L4Iu/6QZglLCYsSts1gvkBdaKMhe
         3PN+pqMojRho5A7PL0oKMiWylU69Aneb26wofyJc3t62ZZFNC69eJ/KU2AXy8pAG4O/1
         SPJhSBHh7w8G7wRNtrZ8aH7zeaLwf/AaTNums=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781278431; x=1781883231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7ac2bMVpH+89W2mCm04KmqJ293ofP/3/KioTUnDrGs=;
        b=jlVGODMl0mJoKY8xm3UM0XhMCyI3ccLYaZBUWPSFQI0qYwa4ZlFoXxc0d81LPfnTbF
         SXWyjCraLrhd8JjuXxCtY1lMF63PNIDUCzPvDoP3BjU6SvRRLxrZKE40pK4K/F5IZxt8
         q6Uq9Ba6HDEo4qI9jROd9HVoxuY0c7xluaaGcbiriQEeLfLEhEK1wemOc+LoZdWA9VmU
         mA9vhfy/jgHG/KGbtWiE8tRENHh/qP7KCT+2bHIi4QbiycEs/yX7kC5TBgjmb47+IDC+
         R/QqWJpE+BqWPvtbr34FISH8MWAUYHSOV+Z684yj0FdUhXBjGtX9Tj0GYJtEovYmA/ui
         6l+Q==
X-Gm-Message-State: AOJu0YzMv5txtUs2YvJ0oPK1EXYTtQUN7abtuCkYO5oRyujq0tR6h9gU
	TfuXOA+nsAUE5CZosynz0AeIRmV/XZwVD1VGRQdDP88X6CUWbwKfNtuEDxpSlnQfCz6gTndEc/h
	UI1D2MMw=
X-Gm-Gg: Acq92OHykt0SnTwv5EeSQDj/nd/86DjoScTJWzDqPLVKhTko90N0o9RBhMiVXUzJNWA
	NTlwk27EvQC93QdbxJBCKgCwkWC0zfGTwLRwW1zD7MJmw4rL5DanZ7ejWZeWqjJcqjS0tXFpwgB
	Bv/58EdASg77NWHoZRiHWpK8qPXDxBxnwQTbNKQ2VOZugo7rYlUrHBRWCDbXZqngFOjejbhXZWv
	ZnEFbUK29RkRHdBaT91gMH503M/flTXA7kbseElbwU/4zbjJVXMlqEyvKExw3MhOkARMcoyu3Dl
	zjqDc8Ke5z+SY+oGvd4TIU3JiqwFx9mx3yVO9wGyuoyOIqPckhI5a/BD+BBPHrtzjcTqgFEM8Z9
	LvKIQPZxiuWALtwnycfrpM4WhQo1FPEZdCLKCk/xDPeXdWUJZenlYd5WzCrxWTns2qoJtYlvVbT
	OubIOxVBcoTJ24Uw79TZEG5CKXvmSf9v7TbR0HVNFvvrbAivGjXZ6u2BbAER1Z9s4A18k=
X-Received: by 2002:a05:600c:820c:b0:490:958c:46dc with SMTP id 5b1f17b1804b1-490ec4e75d9mr45612625e9.17.1781278431275;
        Fri, 12 Jun 2026 08:33:51 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f23fsm6790498f8f.9.2026.06.12.08.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 08:33:50 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-devel@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>,
	Mihajlo Marinkovic <mmarinkovic@snap.com>
Subject: [meta-oe][PATCH 1/2] android-libboringssl: add new recipe for BoringSSL shared libraries
Date: Fri, 12 Jun 2026 17:33:38 +0200
Message-ID: <20260612153339.2514304-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2026 15:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127541

From: Etienne Cordonnier <ecordonnier@snap.com>

Add a recipe shipping the BoringSSL shared libraries required by
android-tools-adbd. BoringSSL is the TLS/crypto library used by adbd
for ADB authentication.

The libraries are installed under ${libdir}/android/ to avoid conflicting
with the system libcrypto/libssl in the sysroot. A SOVERSION=0 patch is
applied so Yocto's standard .so / .so.0 packaging split works correctly.
An ld.so.conf.d drop-in registers ${libdir}/android so binaries can find
the libraries at runtime.

This recipe is tightly coupled to android-tools: update it together when
upgrading android-tools to a new version.

AI-Generated: Uses GitHub Copilot (Claude Sonnet 4.6)

Signed-off-by: Mihajlo Marinkovic <mmarinkovic@snap.com>
Co-authored-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 ...ION-0-to-crypto-and-ssl-shared-libra.patch | 62 ++++++++++++++++
 .../android-libboringssl/boringssl-go-stub    | 22 ++++++
 .../boringssl-gtest-stub.cc                   |  1 +
 .../android-libboringssl_14.0.0+r45.bb        | 70 +++++++++++++++++++
 4 files changed, 155 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/android-libboringssl/android-libboringssl/0001-cmake-add-SOVERSION-0-to-crypto-and-ssl-shared-libra.patch
 create mode 100644 meta-oe/recipes-devtools/android-libboringssl/android-libboringssl/boringssl-go-stub
 create mode 100644 meta-oe/recipes-devtools/android-libboringssl/android-libboringssl/boringssl-gtest-stub.cc
 create mode 100644 meta-oe/recipes-devtools/android-libboringssl/android-libboringssl_14.0.0+r45.bb

diff --git a/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl/0001-cmake-add-SOVERSION-0-to-crypto-and-ssl-shared-libra.patch b/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl/0001-cmake-add-SOVERSION-0-to-crypto-and-ssl-shared-libra.patch
new file mode 100644
index 0000000000..74ad93aa8d
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl/0001-cmake-add-SOVERSION-0-to-crypto-and-ssl-shared-libra.patch
@@ -0,0 +1,62 @@
+From 03a13ef3ea786286d9317562647e9856c1b71736 Mon Sep 17 00:00:00 2001
+From: Etienne Cordonnier <ecordonnier@snap.com>
+Date: Thu, 11 Jun 2026 00:00:00 +0000
+Subject: [PATCH] cmake: add SOVERSION 0 to crypto and ssl shared libraries
+
+BoringSSL's CMakeLists.txt does not set SOVERSION, so the built shared
+libraries have no SONAME embedded and cmake names them libcrypto.so /
+libssl.so without any version suffix.  This causes two problems in a
+Yocto build:
+
+1. The Yocto QA check "dev-so" rejects unversioned .so symlinks in
+   non-dev packages, but those symlinks are required at runtime because
+   the DT_NEEDED entry in binaries that link against BoringSSL refers to
+   the bare libcrypto.so name.
+
+2. Standard Yocto FILES patterns split libraries by suffix: .so.* goes
+   into the runtime package and .so symlinks go into -dev.  Without a
+   SOVERSION these patterns do not apply correctly.
+
+Setting SOVERSION to 0 causes cmake to:
+  - build libcrypto.so.0 as the real ELF with SONAME=libcrypto.so.0
+  - create libcrypto.so as a development symlink
+
+Binaries linked with -l:libcrypto.so.0 (as android-tools does) will
+record DT_NEEDED=libcrypto.so.0 and resolve correctly at runtime.
+
+Upstream-Status: Inappropriate [OE-specific packaging requirement]
+Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
+---
+ crypto/CMakeLists.txt | 2 ++
+ ssl/CMakeLists.txt    | 2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/crypto/CMakeLists.txt b/crypto/CMakeLists.txt
+index cdb5ddc..fca86cc 100644
+--- a/crypto/CMakeLists.txt
++++ b/crypto/CMakeLists.txt
+@@ -327,6 +327,8 @@ endif()
+ 
+ set_target_properties(crypto PROPERTIES LINKER_LANGUAGE C)
+ 
++set_target_properties(crypto PROPERTIES SOVERSION 0)
++
+ if(WIN32)
+   target_link_libraries(crypto ws2_32)
+ endif()
+diff --git a/ssl/CMakeLists.txt b/ssl/CMakeLists.txt
+index d8d997e..e49b350 100644
+--- a/ssl/CMakeLists.txt
++++ b/ssl/CMakeLists.txt
+@@ -46,6 +46,8 @@ install_if_enabled(TARGETS ssl EXPORT OpenSSLTargets ${INSTALL_DESTINATION_DEFAU
+ set_property(TARGET ssl PROPERTY EXPORT_NAME SSL)
+ target_link_libraries(ssl crypto)
+ 
++set_target_properties(ssl PROPERTIES SOVERSION 0)
++
+ add_executable(
+   ssl_test
+ 
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl/boringssl-go-stub b/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl/boringssl-go-stub
new file mode 100644
index 0000000000..de63f38c9c
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl/boringssl-go-stub
@@ -0,0 +1,22 @@
+#!/bin/sh
+if [ "$1" = "run" ] && [ "$2" = "util/embed_test_data.go" ]; then
+    echo 'extern const int boringssl_dummy_crypto_test_data = 0;'
+    exit 0
+fi
+if [ "$1" = "run" ] && [ "$2" = "err_data_generate.go" ]; then
+    cat <<'EOF'
+#include <stddef.h>
+#include <stdint.h>
+
+const uint32_t kOpenSSLReasonValues[] = {0};
+const size_t kOpenSSLReasonValuesLen = 0;
+const char kOpenSSLReasonStringData[] = "";
+EOF
+    exit 0
+fi
+if [ "$1" = "version" ]; then
+    echo 'go version go0.0.0 yocto/stub'
+    exit 0
+fi
+echo "Unexpected Go invocation: $*" >&2
+exit 1
diff --git a/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl/boringssl-gtest-stub.cc b/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl/boringssl-gtest-stub.cc
new file mode 100644
index 0000000000..7477536281
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl/boringssl-gtest-stub.cc
@@ -0,0 +1 @@
+int boringssl_dummy_gtest_translation_unit = 0;
diff --git a/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl_14.0.0+r45.bb b/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl_14.0.0+r45.bb
new file mode 100644
index 0000000000..fccf6e0dff
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl_14.0.0+r45.bb
@@ -0,0 +1,70 @@
+DESCRIPTION = "BoringSSL shared libraries for android-tools"
+SECTION = "libs"
+# This recipe is tightly coupled to android-tools: when upgrading android-tools,
+# update this recipe to the BoringSSL version shipped in the corresponding Debian
+# android-platform-tools source package.
+# BoringSSL is a fork of OpenSSL; new files carry ISC license, OpenSSL license
+# covers the forked parts.
+LICENSE = "OpenSSL & ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2ca501bc96ce9ed0814e2c592c3f9593"
+
+SRC_URI = " \
+    https://deb.debian.org/debian/pool/main/a/android-platform-external-boringssl/android-platform-external-boringssl_${PV}.orig.tar.xz \
+    file://boringssl-go-stub \
+    file://boringssl-gtest-stub.cc \
+    file://0001-cmake-add-SOVERSION-0-to-crypto-and-ssl-shared-libra.patch \
+"
+SRC_URI[md5sum] = "83d24d2f3136ba6a486b5464369b91b4"
+SRC_URI[sha256sum] = "f9223e8c15ad5d9e3f1cd50861f4c272658864661e2332bea5d60952aa0930cd"
+
+# The Debian orig tarball unpacks to android-platform-external-boringssl-${PV}/
+# with the actual source under a src/ subdirectory.
+S = "${UNPACKDIR}/android-platform-external-boringssl-${PV}/src"
+
+inherit cmake
+
+CFLAGS:append = " -Wno-discarded-qualifiers"
+
+OECMAKE_TARGET_COMPILE = "crypto ssl"
+
+EXTRA_OECMAKE = " \
+    -DBUILD_SHARED_LIBS=ON \
+    -DBUILD_TESTING=OFF \
+    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
+    -DGO_EXECUTABLE=${WORKDIR}/hosttools/go \
+"
+
+do_configure:prepend() {
+    install -d ${WORKDIR}/hosttools
+    install -m 0755 ${UNPACKDIR}/boringssl-go-stub ${WORKDIR}/hosttools/go
+
+    # BoringSSL builds its own minimal gtest from third_party/googletest; provide
+    # an empty stub .cc. We only build the crypto and ssl targets so the test
+    # source files are never compiled, but cmake still needs gtest-all.cc to
+    # exist to create the boringssl_gtest target.
+    if [ ! -f ${S}/third_party/googletest/src/gtest-all.cc ]; then
+        install -d ${S}/third_party/googletest/src
+        install -m 0644 ${UNPACKDIR}/boringssl-gtest-stub.cc \
+            ${S}/third_party/googletest/src/gtest-all.cc
+    fi
+}
+do_install() {
+    # Install headers under a boringssl/ subdirectory to avoid shadowing the
+    # system OpenSSL headers in the sysroot.
+    install -d ${D}${includedir}/boringssl
+    cp -a ${S}/include/openssl ${D}${includedir}/boringssl/
+
+    # Install shared libraries under ${libdir}/android/ to avoid conflicting
+    # with the system libssl/libcrypto in the sysroot.
+    install -d ${D}${libdir}/android
+    install -m 0755 ${B}/crypto/libcrypto.so.0 ${D}${libdir}/android/libcrypto.so.0
+    ln -sf libcrypto.so.0 ${D}${libdir}/android/libcrypto.so
+    install -m 0755 ${B}/ssl/libssl.so.0 ${D}${libdir}/android/libssl.so.0
+    ln -sf libssl.so.0 ${D}${libdir}/android/libssl.so
+
+}
+
+FILES:${PN}-dev = "${includedir}/boringssl ${libdir}/android/libcrypto.so ${libdir}/android/libssl.so"
+FILES:${PN} = "${libdir}/android/libcrypto.so.0 ${libdir}/android/libssl.so.0"
+
+BBCLASSEXTEND = "native"
-- 
2.43.0


