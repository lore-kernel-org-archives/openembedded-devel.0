Return-Path: <krzk@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 6682474DB1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 May 2018 08:24:37 +0000 (UTC)
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6522820857;
	Fri, 25 May 2018 08:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1527236679;
	bh=T/paroTvW2FkkOkaUz2KC79V1QhT4KrLmeMOx4I5raw=;
	h=From:To:Cc:Subject:Date:From;
	b=IUohgKoSjEWJqu+TEpSWYjYafdh+Q/vF+Cjk52oEeVXEWQv/OuukVxtGfxJwe6ugq
	P0B938vo8dk43IQmSYREJFj1WyUU8SGNPDOvlnk5se6HfOwYZCP9PJwldWgfLOT+Xj
	UUtWagfLpCCkikvh9nWrLrxt5BZgphmNuJVbiNWo=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 May 2018 10:24:32 +0200
Message-Id: <1527236672-31805-1-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH v4] civetweb: Add new recipe with git-based version
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
X-List-Received-Date: Fri, 25 May 2018 08:24:38 -0000

Add recipe for CivetWeb: easy to use, powerful, C/C++ embeddable web
server with optional CGI, SSL and Lua support, under MIT license.

CivetWeb provides C and C++ libraries and a standalone server binary.

Choose specific post-v1.10 git revision b8148afe8fa4 which has a fixed
SSL support (depending on OpenSSL v1.0.2).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v3:
1. Rebase on sumo branch.
2. Use Makefile generator for CMake (ninja does not build).

Changes since v2:
1. Bump to post-v1.10 git revision.
2. Add ssl package config.
3. Drop cgi, cpp and debug from default package config.

Changes since v1:
1. Use SRCREC as suggested by Khem Raj.
2. Drop nativesdk class.
3. Fix native build with patch.
4. Explicitly disable SSL (does not build at v1.10).
5. Disable ASAN (not applicable for native builds).
---
 ...ssing-librt-and-libm-during-native-compil.patch | 42 +++++++++++++++++++
 .../recipes-connectivity/civetweb/civetweb_git.bb  | 47 ++++++++++++++++++++++
 2 files changed, 89 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/civetweb/civetweb/0001-Test-Fix-missing-librt-and-libm-during-native-compil.patch
 create mode 100644 meta-networking/recipes-connectivity/civetweb/civetweb_git.bb

diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb/0001-Test-Fix-missing-librt-and-libm-during-native-compil.patch b/meta-networking/recipes-connectivity/civetweb/civetweb/0001-Test-Fix-missing-librt-and-libm-during-native-compil.patch
new file mode 100644
index 000000000000..401cf39ad8df
--- /dev/null
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb/0001-Test-Fix-missing-librt-and-libm-during-native-compil.patch
@@ -0,0 +1,42 @@
+From cd93e2c538cecb3192fd24c0fbd6e834d0c47eec Mon Sep 17 00:00:00 2001
+From: Krzysztof Kozlowski <krzk@kernel.org>
+Date: Wed, 18 Apr 2018 14:11:52 +0200
+Subject: [PATCH] Unittest: Fix missing librt and libm during native compilation
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
+ unittest/CMakeLists.txt | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/unittest/CMakeLists.txt b/unittest/CMakeLists.txt
+index f34b2e0e4ce4..05d25702178c 100644
+--- a/unittest/CMakeLists.txt
++++ b/unittest/CMakeLists.txt
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
diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
new file mode 100644
index 000000000000..45d6ec8864b4
--- /dev/null
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
@@ -0,0 +1,47 @@
+SUMMARY = "Civetweb embedded web server"
+HOMEPAGE = "https://github.com/civetweb/civetweb"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=6f28fdcba0dda735eed62bac6a397562"
+
+SRCREV = "b8148afe8fa44c64f75e69655c4fdc9095565568"
+PV = "1.10+git${SRCPV}"
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
+EXTRA_OECMAKE = " \
+    -DBUILD_SHARED_LIBS=ON \
+    -DCIVETWEB_ENABLE_DUKTAPE=OFF \
+    -DCIVETWEB_ENABLE_LUA=OFF \
+    -DCIVETWEB_ENABLE_ASAN=OFF \
+"
+EXTRA_OECMAKE_class-native = " \
+    -DBUILD_SHARED_LIBS=ON \
+    -DCIVETWEB_ENABLE_DUKTAPE=OFF \
+    -DCIVETWEB_ENABLE_LUA=OFF \
+    -DCIVETWEB_ENABLE_ASAN=OFF \
+"
+
+# Building with ninja fails on missing third_party/lib/libcheck.a (which
+# should come from external CMake project)
+OECMAKE_GENERATOR = "Unix Makefiles"
+
+PACKAGECONFIG ??= "caching ipv6 server ssl websockets"
+PACKAGECONFIG[caching] = "-DCIVETWEB_DISABLE_CACHING=OFF,-DCIVETWEB_DISABLE_CACHING=ON,"
+PACKAGECONFIG[cgi] = "-DCIVETWEB_DISABLE_CGI=OFF,-DCIVETWEB_DISABLE_CGI=ON,"
+PACKAGECONFIG[cpp] = "-DCIVETWEB_ENABLE_CXX=ON,-DCIVETWEB_ENABLE_CXX=OFF,"
+PACKAGECONFIG[debug] = "-DCIVETWEB_ENABLE_MEMORY_DEBUGGING=ON,-DCIVETWEB_ENABLE_MEMORY_DEBUGGING=OFF,"
+PACKAGECONFIG[ipv6] = "-DCIVETWEB_ENABLE_IPV6=ON,-DCIVETWEB_ENABLE_IPV6=OFF,"
+PACKAGECONFIG[server] = "-DCIVETWEB_INSTALL_EXECUTABLE=ON,-DCIVETWEB_INSTALL_EXECUTABLE=OFF,"
+PACKAGECONFIG[ssl] = "-DCIVETWEB_ENABLE_SSL=ON -DCIVETWEB_SSL_OPENSSL_API_1_1=OFF -DCIVETWEB_ENABLE_SSL_DYNAMIC_LOADING=OFF,-DCIVETWEB_ENABLE_SSL=OFF,openssl (=1.0.2%),"
+PACKAGECONFIG[websockets] = "-DCIVETWEB_ENABLE_WEBSOCKETS=ON,-DCIVETWEB_ENABLE_WEBSOCKETS=OFF,"
+
+BBCLASSEXTEND = "native"
-- 
2.7.4


