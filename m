Return-Path: <eu@felipetonello.com>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4546B6012C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Apr 2016 15:50:13 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id c126so58135710lfb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 08:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=felipetonello-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=yBzFY6HjsSVk5XyygZn8blQLBa8RwUu0Kv1JuyBDYtc=;
	b=F1Oyp7Sf/cSoyZDsGVAl+1RLxPJZuSO1aOzrAZJJYzeQcmGbJnhc0nk75pKGe0EKan
	nOwOSttkZmHDm+la01f02cb34Sb65sA/AHY+gxKfrRMU4nZiCLT0HhbQu1vg78H5qmh5
	Uyy6iaAItAbsAHCIQGLKYPpo5O6VAX3FKpB3D0KAKY1ZOIaM0K7NHIgQhJ5x/ZFEE1a6
	gyO4oaDFGwHVjl5Tw3mjB5EMDtxBkZ0M/7WE4+5nLbO15UfEDP1AZ2bzL9NC9dHWJ+Mv
	LyntM7lvel1wTtEJ1bVwlWAh2LvAjhVI4yyB2RwGNM2scGqABCx5exvwU4WToJOrEirw
	jwoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=yBzFY6HjsSVk5XyygZn8blQLBa8RwUu0Kv1JuyBDYtc=;
	b=Oyvuaqvjir5/4bQ3Ou8fVo7LlZWN6pO9FKQAI+U4Lb6y0UVA0zUu66pcQYhllbyArk
	ZGkPw0KueebOJsqnjbX8WUcpWg8lnTzf936ssQaEHfEcpMYuHj/wfTGUz6fLelEQI0h7
	+2aA+uPlnFopHqSoA0Lwiqt/+LZnd2t37RwqTz3A3YNJFrNMaa7oBcMqMk2D6YfPazWs
	dLISA0VBCHqG0BtVS1aaU9nZ1cGn3rqflowuSr1cQ4/5m2QbMRJBv0BlhOiQmiPhKf4h
	SZ/xs/tnzallNLTrsy31+7RX1HZM9/ZtEvo2cPUIlMtVaknsCxuOcoVrVufS805yN1K1
	zIdA==
X-Gm-Message-State: AD7BkJKtJNuf9G8fJ10Gop5g2AhliBLXxzh9uZYwYf3H+qwiliQ4ZPtULxDgtGt/wCRiWg==
X-Received: by 10.194.103.198 with SMTP id fy6mr7937987wjb.48.1459785012409;
	Mon, 04 Apr 2016 08:50:12 -0700 (PDT)
Received: from felipe-arch.localdomain ([81.145.202.106])
	by smtp.gmail.com with ESMTPSA id
	hh8sm29656061wjc.42.2016.04.04.08.50.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 Apr 2016 08:50:11 -0700 (PDT)
From: "Felipe F. Tonello" <eu@felipetonello.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Apr 2016 16:52:59 +0100
Message-Id: <1459785179-27170-1-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 2.8.0
Subject: [PATCH] protobuf: add protobuf-c recipe
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
X-List-Received-Date: Mon, 04 Apr 2016 15:50:15 -0000

Initial version of recipe. The main package could be split into two to
separate the compiler. This also applies to protobuf recipe.

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 .../recipes-devtools/protobuf/protobuf-c_1.2.1.bb  | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
new file mode 100644
index 000000000000..6d1c8c414b19
--- /dev/null
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Protocol Buffers - structured data serialisation mechanism"
+DESCRIPTION = "This is protobuf-c, a C implementation of the Google Protocol Buffers data \
+serialization format. It includes libprotobuf-c, a pure C library that \
+implements protobuf encoding and decoding, and protoc-c, a code generator that \
+converts Protocol Buffer .proto files to C descriptor code, based on the \
+original protoc. protobuf-c formerly included an RPC implementation; that code \
+has been split out into the protobuf-c-rpc project."
+HOMEPAGE = "https://github.com/protobuf-c/protobuf-c"
+SECTION = "console/tools"
+LICENSE = "BSD-2-Clause"
+
+DEPENDS = "protobuf-native protobuf"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=235c3195a3968524dc1524b4ebea0c0e"
+SRC_URI = "https://github.com/protobuf-c/protobuf-c/archive/v${PV}.tar.gz"
+
+SRC_URI[md5sum] = "b884aeba4283309445a8e3b6e7322dd6"
+SRC_URI[sha256sum] = "2d708fb3c024b9e6e86df141faff802194f5db90a4b79e6d4aa6bd61dd983dd6"
+
+inherit autotools pkgconfig
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.8.0


