Return-Path: <krzk@kernel.org>
X-Greylist: delayed 476 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 11 Apr 2018 09:59:54 UTC
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id B7AB2745AD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2018 09:59:54 +0000 (UTC)
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5B5AA21737;
	Wed, 11 Apr 2018 09:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B5AA21737
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
From: Krzysztof Kozlowski <krzk@kernel.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Apr 2018 11:51:41 +0200
Message-Id: <1523440301-20150-1-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python3-websockets: Add new recipe for v4.0.1 version
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
X-List-Received-Date: Wed, 11 Apr 2018 09:59:54 -0000

Add recipe for python3-websockets v4.0.1.  Strictly speaking the package
does not require asyncio but instead builds on top of it and it is
essential for any work.

Make this recipe a native one to allow usage for example in image tests
as a websocket client talking to a device under test.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../recipes-devtools/python/python3-websockets_4.0.1.bb  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-websockets_4.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-websockets_4.0.1.bb b/meta-python/recipes-devtools/python/python3-websockets_4.0.1.bb
new file mode 100644
index 000000000000..414129c59d2f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-websockets_4.0.1.bb
@@ -0,0 +1,16 @@
+SUMMARY = "An implementation of the WebSocket Protocol (RFC 6455)"
+HOMEPAGE = "https://github.com/aaugustin/websockets"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5070256738c06d2e59adbec1f4057dac"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "9e8c6b3c70def4146d75fbb0f52bdfc7"
+SRC_URI[sha256sum] = "da4d4fbe059b0453e726d6d993760065d69b823a27efc3040402a6fcfe6a1ed9"
+
+BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-asyncio \
+"
-- 
2.7.4


