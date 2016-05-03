Return-Path: <eu@felipetonello.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id BF57162137
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 May 2016 15:17:03 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id a17so45419818wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 May 2016 08:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=felipetonello-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=zXTaG3IQoKlH+QUzofjEDdusIhMXkmsw+byvpJFjZfo=;
	b=HDK9Hqb37RygSzv+Xda2No209Usi5uw9oWGTcZL0oLL0d41Bs7hstegnCzx4RMDV8n
	Op1a4gMBSDherQfMRgWgmy0Qap3H9giokESUGoX3pcTmv+f1ZTlNu9B7CfwzD8PGUmpO
	kgaw+iyAuLGtH2/pytOJvvmJnIwwygKQ+/LM9MUS9+nOXdJFmwqmw90nxS81q82sWe0o
	riciVbD7/q0Q42gwZrPp4ZR2pnp6J8hC7IqtRVF21C7ZPS5W8zHRr7hm4M85eXm46KdY
	IRRGXibzpng0S+vc4t9CEjmN5m7wr4BNv09eG80cvizRhG+C9aNMcNK+6NPQKeHAbfv1
	Yuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=zXTaG3IQoKlH+QUzofjEDdusIhMXkmsw+byvpJFjZfo=;
	b=EdWRSyFtT01wK/VjRtx8+WL8msDYZ1r2vAGSPu8eCcmlJ6pJh6XiR6K3FqdN9BaDuK
	dUD3eWfqs/4Z0uOiV98+DKIWRPsR3GgHHIRdUXFU023q36vaZTtPC5pnHmETY8Hr2boH
	g8mpTfIfPSeekLadVHDPuJTdhxHifSLicYPFxl+SyVVQ8LL8UFQBSY6NZuaHbStOVyrS
	zHwZL48hPksPup8DWcounOjjDbWl8x+Ecykhkos7q+6z/K45kuVJ0zZr9fjrdcLvdPVq
	uFOxHIJ8GoQzlcB4gb736wb8ZL8bRIYlrcC1XD5Q20B+Wu4JTXsO9B/PLGyyeDsNUcHh
	6esQ==
X-Gm-Message-State: AOPr4FXfdUDlzEhY3Y1e8QRUkScpqY/nhFzbH7xnyDRIRTDg60RhlOdCpu3zYti9EM1a5Q==
X-Received: by 10.28.157.202 with SMTP id g193mr26884857wme.46.1462288623782; 
	Tue, 03 May 2016 08:17:03 -0700 (PDT)
Received: from felipe-arch.localdomain ([81.145.202.106])
	by smtp.gmail.com with ESMTPSA id w82sm5051183wmw.5.2016.05.03.08.17.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 May 2016 08:17:02 -0700 (PDT)
From: "Felipe F. Tonello" <eu@felipetonello.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 May 2016 16:20:23 +0100
Message-Id: <1462288824-15975-2-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <1462288824-15975-1-git-send-email-eu@felipetonello.com>
References: <1462288824-15975-1-git-send-email-eu@felipetonello.com>
Subject: [PATCH 1/2] protobuf: add protobuf-c recipe
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
X-List-Received-Date: Tue, 03 May 2016 15:17:06 -0000

replaces/obsoletes: commit 0d31f8448412 [Added protobuf-c criu dependency]
in meta-virtualization

This version of the recipe also adds a separated package for the compiler.

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 .../recipes-devtools/protobuf/protobuf-c_1.2.1.bb  | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
new file mode 100644
index 000000000000..40fb96cf47bb
--- /dev/null
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
@@ -0,0 +1,28 @@
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
+PACKAGE_BEFORE_PN = "${PN}-compiler"
+RDEPENDS_${PN}-compiler = "protobuf-compiler"
+RDEPENDS_${PN}-dev += "${PN}-compiler"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=235c3195a3968524dc1524b4ebea0c0e"
+SRC_URI = "https://github.com/protobuf-c/protobuf-c/archive/v${PV}.tar.gz"
+
+SRC_URI[md5sum] = "b884aeba4283309445a8e3b6e7322dd6"
+SRC_URI[sha256sum] = "2d708fb3c024b9e6e86df141faff802194f5db90a4b79e6d4aa6bd61dd983dd6"
+
+inherit autotools pkgconfig
+
+FILES_${PN}-compiler = "${bindir}"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.8.0


