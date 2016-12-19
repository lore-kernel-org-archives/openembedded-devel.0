Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 43E86601A4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 20:56:35 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id d9so162844597ioe.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 12:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ckgqleBafJwqh3m5wRMiAugrU4kcS+1n3BD0GDCr0fs=;
	b=G7Pv0T0SLn6u3zLWt2pErlJV893zo/S5DCAzy6drCKCTvlDCkB95+IMHxc8CzvaKGl
	bHBKbahV6HXMZWmJFiNH21BLhfCeTGKqY+ifpfHX1siydLMRFQVP+AMCjoKLPRizjl8O
	HShHyZGHnnarQprnArWXcO+FsoSRlEtV53GaPSk6lCqDyVSsmCGcmsxHcY374AIZA4CT
	l3yFY2zZDeL6Ftevl1IZmNZ925y1nsIwW1vZblBNGTRtn0GzUMtXiYtZHqADJwbp63oU
	4Pkit15g/QKFcmZiate97EFajB1qZfQn1acuU8BHTTgXWd+aC17W9hId2i9XzHT9ZES+
	A2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ckgqleBafJwqh3m5wRMiAugrU4kcS+1n3BD0GDCr0fs=;
	b=lTtod4lacJuRosaK1BLcdXPM7vu4WcQ2AKKW+a05iR77QnnMwrMvm87X6xyyZXWslu
	8oodb8UUF+QzVoTQxqtpfYwQHsMSa9hs+vTeHNda+QyAbjkxNyjTUNk736fItDxMEUhS
	AKAfq8B1cbPA2EcEY4N4lASSSXbecVoV90ZG6sCerBuwe2DzDKike0fI02AmnG337KxQ
	gz+HFu1QZUcECWxFtCh8hJ0wkttZRdizuRe/uhHq6g2zh7kphZUN4Cb+U6q20yyZ9uWj
	HCrGGYZiZxcRk8MbV90+P+CaxlkrichL0KWB891VS10QhComyRxvk5yRXQgoirOQzut4
	iTcQ==
X-Gm-Message-State: AIkVDXLTUZrVjPT3qyvEvSGDdgus+KHzeENEGWTVIw24el4IqLY8NcA1tEE98aojAEeOUA==
X-Received: by 10.107.184.214 with SMTP id i205mr16291177iof.167.1482180996635;
	Mon, 19 Dec 2016 12:56:36 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id 19sm8912949ion.9.2016.12.19.12.56.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Dec 2016 12:56:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Dec 2016 12:56:29 -0800
Message-Id: <20161219205629.7768-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] yajl_1.0.12: Add recipe for yajl1
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
X-List-Received-Date: Mon, 19 Dec 2016 20:56:36 -0000

yajl1 and yajl2 are not ABI compatible, therefore
add a recipe for latest release of yajl1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb

diff --git a/meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb b/meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb
new file mode 100644
index 000000000..ed62bb25d
--- /dev/null
+++ b/meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Yet Another JSON Library."
+
+DESCRIPTION = "YAJL is a small event-driven (SAX-style) JSON parser \
+written in ANSI C, and a small validating JSON generator."
+
+HOMEPAGE = "http://lloyd.github.com/yajl/"
+
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://COPYING;md5=da2e9aa80962d54e7c726f232a2bd1e8"
+
+SRC_URI = "https://github.com/lloyd/${BPN}/archive/${PV}.tar.gz"
+SRC_URI[md5sum] = "792672a75c3aa87a283b8714545a0bd0"
+SRC_URI[sha256sum] = "5f0d297154da89f0131b71110c0e95af78b6127d6252930441fd20671bb28167"
+
+inherit cmake lib_package
+
+EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
-- 
2.11.0


