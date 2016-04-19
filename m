Return-Path: <eu@felipetonello.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 454446FFE8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2016 15:37:14 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id u206so36436333wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2016 08:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=felipetonello-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=QoLCiOiYQ+o+EQTg4qUAxf+r81jigDIrGydlR4FzQpY=;
	b=iEVINcTMV3d+FzhZBqVTsYr0RGiJIih6HR6sMx8z97U3x24epxs5t7O64R/3rnER4A
	SkykDsqqH4a3zigi+9cqSGqt6wiJ/CcEIEbGB7AQZ2Ts+WHv9dWt/fLP8hHeL+mup4OB
	VKAq+DzhzIRcWegGw3amyI6pXDgLxpdNWvo3WwafrfBv64NP4gpKEyDovtxhYlFLqPFE
	kxIkqVZDfmebJglIjo91e6rb6hlPAs4XDxNX3BbvySzgCKbivOAJ5IhMWPKKVnfe+hrW
	Gk8Ypon0WhlgC3lVHAbJfK5slQaImQsMUuDx58htxbOv3lT5OoQMKtlKNATwrd4IgGCU
	FZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=QoLCiOiYQ+o+EQTg4qUAxf+r81jigDIrGydlR4FzQpY=;
	b=SLQN9L8Gb1YTswGfsT9YuKw+N5zxbdRrcLxJ7PtqupVODCsU9muDkRQzbZH7dv5XSQ
	AGWBPgOOVKwiyOxzS6Q7qQQ0XvHWx4SNZZoR95qT6/D/2YQ1+Fj5IDYAnrLcdGFeg3PG
	aEWBA+N49D+3L0JDYo+2HS4qisEt25dKtThh2xGqIqB5VG85nw6FwSyfaW9TDTrnJcXc
	D/qGj9EpjYQngmHILlg3bC0P9i/VRIKsY8/hLUlzA8O949j/Up8AyoCdcmx2ITBLzNWL
	uOB+X+WMdnw+lOSs0tsLGUwh62s88BNrXfqggBH7yDJ8qcsMidfWJte3LXMGo7j3Vgyu
	sT4Q==
X-Gm-Message-State: AOPr4FWFwsJX+d8IgmIyuozcJX/mYkYNRxFTMj921QRPWjb/PaQafvf4wXT8z9WWSlZtug==
X-Received: by 10.194.116.103 with SMTP id jv7mr4156272wjb.22.1461080235460;
	Tue, 19 Apr 2016 08:37:15 -0700 (PDT)
Received: from felipe-arch.localdomain ([81.145.202.106])
	by smtp.gmail.com with ESMTPSA id v64sm4952474wmv.1.2016.04.19.08.37.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Apr 2016 08:37:14 -0700 (PDT)
From: "Felipe F. Tonello" <eu@felipetonello.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Apr 2016 16:40:17 +0100
Message-Id: <1461080418-9229-2-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <1461080418-9229-1-git-send-email-eu@felipetonello.com>
References: <1461080418-9229-1-git-send-email-eu@felipetonello.com>
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
X-List-Received-Date: Tue, 19 Apr 2016 15:37:16 -0000

Initial version of recipe. The main package could be split into two to
separate the compiler. This also applies to protobuf recipe.

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 .../recipes-devtools/protobuf/protobuf-c_1.2.1.bb  | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
new file mode 100644
index 000000000000..88cdb0bccd8e
--- /dev/null
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
@@ -0,0 +1,26 @@
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


