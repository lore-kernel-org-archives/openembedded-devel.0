Return-Path: <krzk@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id F21377C2AA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2019 14:47:21 +0000 (UTC)
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B0933218CD;
	Fri, 25 Jan 2019 14:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548427643;
	bh=vNTntjXggMFRcMgrX16uHkJsNbe4q0VNw10ymuHmIlk=;
	h=From:To:Cc:Subject:Date:From;
	b=yKn15dKVIwoz3DbjJDjTiQUM1ge5PZssvwRHOz49nAoSUKSrL81uCUndu7rlrC8UT
	J75TWVk1bpbTP8BcGp+LHdts8BZ62J37CL6f6eyJ0U0dkM842uSe+0eYYOYa2+JgkX
	eNy0GGAp3dnpS4Lt/w//l+GPsVJx1Hiw/g6mmp6I=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jan 2019 15:46:47 +0100
Message-Id: <1548427607-12485-1-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] civetweb: Bump to v1.11
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
X-List-Received-Date: Fri, 25 Jan 2019 14:47:22 -0000

Drop upstream accepted patch.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../0001-undefine-macro-before-redefining.patch    | 26 ----------------------
 .../recipes-connectivity/civetweb/civetweb_git.bb  |  7 +++---
 2 files changed, 3 insertions(+), 30 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/civetweb/civetweb/0001-undefine-macro-before-redefining.patch

diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb/0001-undefine-macro-before-redefining.patch b/meta-networking/recipes-connectivity/civetweb/civetweb/0001-undefine-macro-before-redefining.patch
deleted file mode 100644
index 8653302130e8..000000000000
--- a/meta-networking/recipes-connectivity/civetweb/civetweb/0001-undefine-macro-before-redefining.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 59f65235a7a690f50d1686e9977908c053697d8c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 28 Aug 2018 22:59:13 -0700
-Subject: [PATCH] undefine macro before redefining
-
-Fixes
-src/main.c:89:9: error: 'printf' macro redefined [-Werror,-Wmacro-redefined]
-
-Upstream-Stats: Submitted [https://github.com/civetweb/civetweb/pull/649]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/main.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/main.c b/src/main.c
-index bbcb0aec..01191a3c 100644
---- a/src/main.c
-+++ b/src/main.c
-@@ -86,6 +86,7 @@
- 
- #include "civetweb.h"
- 
-+#undef printf
- #define printf                                                                 \
- 	DO_NOT_USE_THIS_FUNCTION__USE_fprintf /* Required for unit testing */
- 
diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
index d681f7f30ca0..c8fe24c6375f 100644
--- a/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
@@ -4,11 +4,10 @@ HOMEPAGE = "https://github.com/civetweb/civetweb"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=6f28fdcba0dda735eed62bac6a397562"
 
-SRCREV = "19f31ba8dd8443e86c7028a4b4c37f4b299aa68c"
-PV = "1.10+git${SRCPV}"
+SRCREV = "ce8f6d38a60eb16c996afee1e5340f76ef4d0923"
+PV = "1.11+git${SRCPV}"
 SRC_URI = "git://github.com/civetweb/civetweb.git \
            file://0001-Unittest-Link-librt-and-libm-using-l-option.patch \
-           file://0001-undefine-macro-before-redefining.patch \
            "
 
 S = "${WORKDIR}/git"
@@ -36,7 +35,7 @@ PACKAGECONFIG[cgi] = "-DCIVETWEB_DISABLE_CGI=OFF,-DCIVETWEB_DISABLE_CGI=ON,"
 PACKAGECONFIG[cpp] = "-DCIVETWEB_ENABLE_CXX=ON,-DCIVETWEB_ENABLE_CXX=OFF,"
 PACKAGECONFIG[debug] = "-DCIVETWEB_ENABLE_MEMORY_DEBUGGING=ON,-DCIVETWEB_ENABLE_MEMORY_DEBUGGING=OFF,"
 PACKAGECONFIG[ipv6] = "-DCIVETWEB_ENABLE_IPV6=ON,-DCIVETWEB_ENABLE_IPV6=OFF,"
-PACKAGECONFIG[server] = "-DCIVETWEB_INSTALL_EXECUTABLE=ON,-DCIVETWEB_INSTALL_EXECUTABLE=OFF,"
+PACKAGECONFIG[server] = "-DCIVETWEB_ENABLE_SERVER_EXECUTABLE=ON -DCIVETWEB_INSTALL_EXECUTABLE=ON,-DCIVETWEB_ENABLE_SERVER_EXECUTABLE=OFF -DCIVETWEB_INSTALL_EXECUTABLE=OFF,"
 PACKAGECONFIG[ssl] = "-DCIVETWEB_ENABLE_SSL=ON -DCIVETWEB_SSL_OPENSSL_API_1_1=OFF -DCIVETWEB_ENABLE_SSL_DYNAMIC_LOADING=OFF,-DCIVETWEB_ENABLE_SSL=OFF,openssl (=1.0.2%),"
 PACKAGECONFIG[websockets] = "-DCIVETWEB_ENABLE_WEBSOCKETS=ON,-DCIVETWEB_ENABLE_WEBSOCKETS=OFF,"
 
-- 
2.7.4


