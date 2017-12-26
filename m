Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7307971BA6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Dec 2017 16:20:19 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id g123so11942226qka.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Dec 2017 08:20:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KKIodawYWt93JsGNO0xVcx5MU7CnaJr+GaRbfWFOt/w=;
	b=PcEbNMFHF+MIh7GRJO80wxPFnd94o2tE3u9noSqec/0FZ8SDozYHbxGlYtBeLy/aF8
	gXvYBTUR5pUW3Pl+Ef8ewGr1ZzpyCa1qmluScOwDEYJHNMM9uf7jLEqbNymnguYr17Kx
	RBu2GpXqVjsmXVu8H+qGCIftpBBs5BiIMbFFxSRxb9oJhAEHmYhz7cuGVH5J/s5yerd5
	tisCeIRO1YOsjpb1xSYAWgIgE5lCG7yhN0e9G6n96OTGG28UqReIrlc8JTOk7JK926jw
	UgcdTKOb/HUYtUe0XWb3A2rYujF5V9bTYxycZ/d1nLIQS8G8+AOzB0Ho58E2k3NGPlAU
	Dgkw==
X-Gm-Message-State: AKGB3mLa6Hu2Ledl88TVkugEkGw6ALPD/eYA7uqljr8ESqT2PxZr9Rgi
	xHuzj3Bvasmy/J3/JTuLGZxO8C7L
X-Google-Smtp-Source: ACJfBouTXtAbYSWNpLkkCHGFg8iqfvZ1gNgVoICStQwEEQ00n7v5FerczCN1Pj42Fu6P9kr5iHid4g==
X-Received: by 10.55.5.133 with SMTP id 127mr34101636qkf.102.1514305220269;
	Tue, 26 Dec 2017 08:20:20 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	185sm13796361qkd.1.2017.12.26.08.20.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Dec 2017 08:20:19 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Dec 2017 11:20:12 -0500
Message-Id: <1514305212-13231-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyflakes: update to version 1.6.0
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
X-List-Received-Date: Tue, 26 Dec 2017 16:20:19 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-pyflakes_1.2.3.bb       | 14 --------------
 .../recipes-devtools/python/python-pyflakes_1.6.0.bb       | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyflakes_1.2.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python-pyflakes_1.6.0.bb

diff --git a/meta-python/recipes-devtools/python/python-pyflakes_1.2.3.bb b/meta-python/recipes-devtools/python/python-pyflakes_1.2.3.bb
deleted file mode 100644
index 05e3413..0000000
--- a/meta-python/recipes-devtools/python/python-pyflakes_1.2.3.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "passive checker of Python programs"
-HOMEPAGE = "https://github.com/dreamhost/cliff"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.rst;md5=eb48916870306ef34a061cec727ccae5"
-
-SRC_URI[md5sum] = "995747589e97c75055cf5b4e1e031e0b"
-SRC_URI[sha256sum] = "2e4a1b636d8809d8f0a69f341acf15b2e401a3221ede11be439911d23ce2139e"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += " \
-    python-prettytable \
-    python-cmd2 \
-    python-pyparsing"
diff --git a/meta-python/recipes-devtools/python/python-pyflakes_1.6.0.bb b/meta-python/recipes-devtools/python/python-pyflakes_1.6.0.bb
new file mode 100644
index 0000000..2444859
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyflakes_1.6.0.bb
@@ -0,0 +1,14 @@
+SUMMARY = "passive checker of Python programs"
+HOMEPAGE = "https://github.com/dreamhost/cliff"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://README.rst;md5=029ce1beb023f2c4ca9f417e4984a865"
+
+SRC_URI[md5sum] = "b385b0e4cd40a522553e97cd2d83573e"
+SRC_URI[sha256sum] = "8d616a382f243dbf19b54743f280b80198be0bca3a5396f1d2e1fca6223e8805"
+
+inherit pypi setuptools
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-prettytable \
+    ${PYTHON_PN}-cmd2 \
+    ${PYTHON_PN}-pyparsing"
-- 
2.7.4


