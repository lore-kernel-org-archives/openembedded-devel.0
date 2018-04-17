Return-Path: <krzk@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id E272E65CC7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 12:16:02 +0000 (UTC)
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id CE3282183A;
	Tue, 17 Apr 2018 12:16:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE3282183A
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
From: Krzysztof Kozlowski <krzk@kernel.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Apr 2018 14:15:57 +0200
Message-Id: <1523967357-4158-1-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][rocko][PATCH] civetweb: Add new recipe for v1.10 version
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
X-List-Received-Date: Tue, 17 Apr 2018 12:16:03 -0000

Add recipe for CivetWeb: easy to use, powerful, C/C++ embeddable web
server with optional CGI, SSL and Lua support, under MIT license.

CivetWeb provides C and C++ libraries and a standalone server binary.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../recipes-connectivity/civetweb/civetweb_1.10.bb | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/civetweb/civetweb_1.10.bb

diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_1.10.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_1.10.bb
new file mode 100644
index 000000000000..35af45680818
--- /dev/null
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb_1.10.bb
@@ -0,0 +1,34 @@
+SUMMARY = "Civetweb embedded web server"
+HOMEPAGE = "https://github.com/civetweb/civetweb"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=da079d81be91ff1d1ca56dcd751f897f"
+
+SRC_URI = " \
+    git://github.com/civetweb/civetweb.git;tag=v${PV} \
+"
+S = "${WORKDIR}/git"
+
+# civetweb supports building with make or cmake (although cmake lacks few features)
+inherit cmake
+
+# Disable Lua and Duktape because they do not compile from CMake (as of v1.8, v1.9 and v1.10)
+EXTRA_OECMAKE = " \
+    -DBUILD_SHARED_LIBS=ON \
+    -DCIVETWEB_ENABLE_DUKTAPE=OFF \
+    -DCIVETWEB_ENABLE_LUA=OFF \
+"
+
+PACKAGECONFIG ??= "asan caching cgi cpp debug ipv6 server websockets"
+PACKAGECONFIG[asan] = "-DCIVETWEB_ENABLE_ASAN=ON,-DCIVETWEB_ENABLE_ASAN=OFF,gcc-sanitizers"
+PACKAGECONFIG[caching] = "-DCIVETWEB_DISABLE_CACHING=OFF,-DCIVETWEB_DISABLE_CACHING=ON,"
+PACKAGECONFIG[cgi] = "-DCIVETWEB_DISABLE_CGI=OFF,-DCIVETWEB_DISABLE_CGI=ON,"
+PACKAGECONFIG[cpp] = "-DCIVETWEB_ENABLE_CXX=ON,-DCIVETWEB_ENABLE_CXX=OFF,"
+PACKAGECONFIG[debug] = "-DCIVETWEB_ENABLE_MEMORY_DEBUGGING=ON,-DCIVETWEB_ENABLE_MEMORY_DEBUGGING=OFF,"
+PACKAGECONFIG[ipv6] = "-DCIVETWEB_ENABLE_IPV6=ON,-DCIVETWEB_ENABLE_IPV6=OFF,"
+PACKAGECONFIG[server] = "-DCIVETWEB_INSTALL_EXECUTABLE=ON,-DCIVETWEB_INSTALL_EXECUTABLE=OFF,"
+# As of v1.10, SSL does not work. Bring it back with v1.11:
+# PACKAGECONFIG[ssl] = "-DCIVETWEB_ENABLE_SSL=ON -DCIVETWEB_SSL_OPENSSL_API_1_1=ON -DCIVETWEB_ENABLE_SSL_DYNAMIC_LOADING=OFF,-DCIVETWEB_ENABLE_SSL=OFF,openssl"
+PACKAGECONFIG[websockets] = "-DCIVETWEB_ENABLE_WEBSOCKETS=ON,-DCIVETWEB_ENABLE_WEBSOCKETS=OFF,"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


