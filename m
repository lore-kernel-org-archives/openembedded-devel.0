Return-Path: <straka.derek@gmail.com>
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
	[209.85.210.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4CA4960E75
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 00:59:54 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id a15so4770707otf.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 16:59:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MXCkRoAB4Mbp6ijFZAA7afFyQ2dKITVpnlLUFPrJ1LA=;
	b=hD1sTRuLWTzbuZYUNJg9lUAwemyKZ7AcxIHOkxXVnbFkfCByUdNmTwaz7f5Yoc0XR5
	myklWULhd00N71zOlG3SUBT733CkZrl+FL8uN41Q0kqfUEY/mHLPlGMMxxUMXtfDpWh6
	eXaAByvP6U69kmDm8VE9gjPOYzR7j+8gJauA4AyVaq5bFdxAXKa7OCptrP4txg4+FEuN
	C4eDXEGoLY0bm+FUFTdorDe+o9eYO6HGrSkSY+XO5n6vrHPlhOMKHIgZvGhimEPEW+Gd
	VJMrTnHsumn/QZFtzjKgSDdPJnywKJtyjnXG/enDhiAN97xitRX+sJ+6Ju9bLuUYuZNR
	tIkA==
X-Gm-Message-State: APjAAAV2UgvjQ+G3rptEyjQGdEDOTGpfNGKX1KZIzZA7CSBmE6o0/wUS
	WCow6GT5dbycZiq1w6FZiT8eJOF7iC0=
X-Google-Smtp-Source: APXvYqxLJNRv4zTRFNNFIdq1VVGX4whrxc8WyWxw39GLCCuBGz9qIDwApAdoi3fXkc9bTPRjjG0d4Q==
X-Received: by 2002:a9d:7f12:: with SMTP id j18mr8931607otq.17.1581296394950; 
	Sun, 09 Feb 2020 16:59:54 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id
	p24sm3929288oth.28.2020.02.09.16.59.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 16:59:54 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 19:59:42 -0500
Message-Id: <20200210005942.16312-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-aws-iot-device-sdk-python: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Mon, 10 Feb 2020 00:59:54 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python-aws-iot-device-sdk-python.inc      | 41 ------------------
 ...python3-aws-iot-device-sdk-python_1.4.7.bb | 43 ++++++++++++++++++-
 2 files changed, 41 insertions(+), 43 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc

diff --git a/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc b/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc
deleted file mode 100644
index 60493e1dec..0000000000
--- a/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc
+++ /dev/null
@@ -1,41 +0,0 @@
-DESCRIPTION = "SDK for connecting to AWS IoT using Python."
-HOMEPAGE = "https://github.com/aws/aws-iot-device-sdk-python"
-LICENSE = "Apache-2.0 & (EPL-1.0 | EDL-1.0)"
-LICENSE_${PN}-examples = "Apache-2.0"
-LIC_FILES_CHKSUM = "\
-    file://LICENSE.txt;md5=9ac49901b833e769c7d6f21e8dbd7b30 \
-    file://AWSIoTPythonSDK/core/protocol/paho/client.py;endline=14;md5=5a3c8a1a4bb71bd934f450ecff972ad9 \
-"
-
-SRC_URI[md5sum] = "2b3df629827d8bc18ca4d927b4885a17"
-SRC_URI[sha256sum] = "7e67c8cfeee8a1c8fd251bcc418de9d4dca697753565c9a9e614525179d9555d"
-
-inherit pypi
-
-PYPI_PACKAGE = "AWSIoTPythonSDK"
-
-do_install_append() {
-        install -d -m0755 ${D}${datadir}/${BPN}/examples
-        cp --preserve=mode,timestamps -R ${S}/samples/* ${D}${datadir}/${BPN}/examples
-        # this requires the full blown AWS Python SDK
-        rm -r ${D}${datadir}/${BPN}/examples/basicPubSub
-}
-
-PACKAGES =+ "${PN}-examples"
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-crypt \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-math \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-threading \
-"
-RDEPENDS_${PN}-examples += "${PN}"
-
-FILES_${PN}-examples = "${datadir}/${BPN}/examples"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.7.bb b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.7.bb
index c43649dbfe..78e024bd19 100644
--- a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.7.bb
+++ b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.7.bb
@@ -1,2 +1,41 @@
-inherit setuptools3
-require python-aws-iot-device-sdk-python.inc
+DESCRIPTION = "SDK for connecting to AWS IoT using Python."
+HOMEPAGE = "https://github.com/aws/aws-iot-device-sdk-python"
+LICENSE = "Apache-2.0 & (EPL-1.0 | EDL-1.0)"
+LICENSE_${PN}-examples = "Apache-2.0"
+LIC_FILES_CHKSUM = "\
+    file://LICENSE.txt;md5=9ac49901b833e769c7d6f21e8dbd7b30 \
+    file://AWSIoTPythonSDK/core/protocol/paho/client.py;endline=14;md5=5a3c8a1a4bb71bd934f450ecff972ad9 \
+"
+
+SRC_URI[md5sum] = "2b3df629827d8bc18ca4d927b4885a17"
+SRC_URI[sha256sum] = "7e67c8cfeee8a1c8fd251bcc418de9d4dca697753565c9a9e614525179d9555d"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "AWSIoTPythonSDK"
+
+do_install_append() {
+        install -d -m0755 ${D}${datadir}/${BPN}/examples
+        cp --preserve=mode,timestamps -R ${S}/samples/* ${D}${datadir}/${BPN}/examples
+        # this requires the full blown AWS Python SDK
+        rm -r ${D}${datadir}/${BPN}/examples/basicPubSub
+}
+
+PACKAGES =+ "${PN}-examples"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-crypt \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-math \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-threading \
+"
+RDEPENDS_${PN}-examples += "${PN}"
+
+FILES_${PN}-examples = "${datadir}/${BPN}/examples"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


