Return-Path: <krzk@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 0C519744C1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 12:26:06 +0000 (UTC)
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 31ED02175C;
	Wed, 18 Apr 2018 12:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31ED02175C
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
From: Krzysztof Kozlowski <krzk@kernel.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Apr 2018 14:25:59 +0200
Message-Id: <1524054359-14419-1-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][rocko][PATCH v2] civetweb: Add new recipe for v1.10 version
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
X-List-Received-Date: Wed, 18 Apr 2018 12:26:07 -0000

Add recipe for CivetWeb: easy to use, powerful, C/C++ embeddable web
server with optional CGI, SSL and Lua support, under MIT license.

CivetWeb provides C and C++ libraries and a standalone server binary.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Use SRCREC as suggested by Khem Raj.
2. Drop nativesdk class.
3. Fix native build with patch.
4. Explicitly disable SSL (does not build at v1.10).
5. Disable ASAN (not applicable for native builds).
---
 ...ssing-librt-and-libm-during-native-compil.patch | 42 ++++++++++++++++++++
 .../recipes-connectivity/civetweb/civetweb_1.10.bb | 45 ++++++++++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/civetweb/civetweb/0001-Test-Fix-missing-librt-and-libm-during-native-compil.patch
 create mode 100644 meta-networking/recipes-connectivity/civetweb/civetweb_1.10.bb

diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb/0001-Test-Fix-missing-librt-and-libm-during-native-compil.patch b/meta-networking/recipes-connectivity/civetweb/civetweb/0001-Test-Fix-missing-librt-and-libm-during-native-compil.patch
new file mode 100644
index 000000000000..23479561f85f
--- /dev/null
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb/0001-Test-Fix-missing-librt-and-libm-during-native-compil.patch
@@ -0,0 +1,42 @@
+From cd93e2c538cecb3192fd24c0fbd6e834d0c47eec Mon Sep 17 00:00:00 2001
+From: Krzysztof Kozlowski <krzk@kernel.org>
+Date: Wed, 18 Apr 2018 14:11:52 +0200
+Subject: [PATCH] Test: Fix missing librt and libm during native compilation
+
+civetweb looks for librt and libm in weird places and for native build
+this fails:
+
+    | ../third_party/lib/libcheck.a(check.c.o): In function `tcase_create':
+    | build/tmp/work/x86_64-linux/civetweb-native/1.10-r0/build/third_party/src/check-unit-test-framework/src/check.c:145: undefined reference to `floor'
+    | build/tmp/work/x86_64-linux/civetweb-native/1.10-r0/build/third_party/src/check-unit-test-framework/src/check.c:148: undefined reference to `floor'
+
+These are needed dependencies so try regular system linkage in such
+case.
+
+Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
+---
+ test/CMakeLists.txt | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/test/CMakeLists.txt b/test/CMakeLists.txt
+index f34b2e0e4ce4..05d25702178c 100644
+--- a/test/CMakeLists.txt
++++ b/test/CMakeLists.txt
+@@ -60,10 +60,14 @@ endif()
+ find_package(LibM)
+ if (LIBM_FOUND)
+   set(CHECK_LIBRARIES "${CHECK_LIBRARIES};LIBM::LIBM")
++else()
++  set(CHECK_LIBRARIES "${CHECK_LIBRARIES};-lm")
+ endif()
+ find_package(LibRt)
+ if (LIBRT_FOUND)
+   set(CHECK_LIBRARIES "${CHECK_LIBRARIES};LIBRT::LIBRT")
++else()
++  set(CHECK_LIBRARIES "${CHECK_LIBRARIES};-lrt")
+ endif()
+ 
+ # Build the C unit tests
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_1.10.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_1.10.bb
new file mode 100644
index 000000000000..dce32d6d0312
--- /dev/null
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb_1.10.bb
@@ -0,0 +1,45 @@
+SUMMARY = "Civetweb embedded web server"
+HOMEPAGE = "https://github.com/civetweb/civetweb"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=da079d81be91ff1d1ca56dcd751f897f"
+
+SRCREV = "0f1b43536d97d9311c73b658b86a9d44be9e5e82"
+SRC_URI = "git://github.com/civetweb/civetweb.git"
+SRC_URI_append_class-native = " \
+    file://0001-Test-Fix-missing-librt-and-libm-during-native-compil.patch \
+"
+S = "${WORKDIR}/git"
+
+# civetweb supports building with make or cmake (although cmake lacks few features)
+inherit cmake
+
+# Disable Lua and Duktape because they do not compile from CMake (as of v1.8, v1.9 and v1.10).
+# Disable ASAN as it is included only in Debug build.
+# As of v1.10, SSL does not work. Bring it back with v1.11.
+EXTRA_OECMAKE = " \
+    -DBUILD_SHARED_LIBS=ON \
+    -DCIVETWEB_ENABLE_DUKTAPE=OFF \
+    -DCIVETWEB_ENABLE_LUA=OFF \
+    -DCIVETWEB_ENABLE_ASAN=OFF \
+    -DCIVETWEB_ENABLE_SSL=OFF \
+"
+EXTRA_OECMAKE_class-native = " \
+    -DBUILD_SHARED_LIBS=ON \
+    -DCIVETWEB_ENABLE_DUKTAPE=OFF \
+    -DCIVETWEB_ENABLE_LUA=OFF \
+    -DCIVETWEB_ENABLE_ASAN=OFF \
+    -DCIVETWEB_ENABLE_SSL=OFF \
+"
+
+PACKAGECONFIG ??= "caching cgi cpp debug ipv6 server websockets"
+PACKAGECONFIG[caching] = "-DCIVETWEB_DISABLE_CACHING=OFF,-DCIVETWEB_DISABLE_CACHING=ON,"
+PACKAGECONFIG[cgi] = "-DCIVETWEB_DISABLE_CGI=OFF,-DCIVETWEB_DISABLE_CGI=ON,"
+PACKAGECONFIG[cpp] = "-DCIVETWEB_ENABLE_CXX=ON,-DCIVETWEB_ENABLE_CXX=OFF,"
+PACKAGECONFIG[debug] = "-DCIVETWEB_ENABLE_MEMORY_DEBUGGING=ON,-DCIVETWEB_ENABLE_MEMORY_DEBUGGING=OFF,"
+PACKAGECONFIG[ipv6] = "-DCIVETWEB_ENABLE_IPV6=ON,-DCIVETWEB_ENABLE_IPV6=OFF,"
+PACKAGECONFIG[server] = "-DCIVETWEB_INSTALL_EXECUTABLE=ON,-DCIVETWEB_INSTALL_EXECUTABLE=OFF,"
+# PACKAGECONFIG[ssl] = "-DCIVETWEB_ENABLE_SSL=ON -DCIVETWEB_SSL_OPENSSL_API_1_1=ON -DCIVETWEB_ENABLE_SSL_DYNAMIC_LOADING=OFF,-DCIVETWEB_ENABLE_SSL=OFF,openssl"
+PACKAGECONFIG[websockets] = "-DCIVETWEB_ENABLE_WEBSOCKETS=ON,-DCIVETWEB_ENABLE_WEBSOCKETS=OFF,"
+
+BBCLASSEXTEND = "native"
-- 
2.7.4


