Return-Path: <andre.draszik@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8EFDD78910
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 09:11:57 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id s78so8393836qkl.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 02:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9A9MI2nXxUcICUZ7U0SUNkbQVrTEPkAtCpBnraTbxFQ=;
	b=kLPdS2lsM8slfg0w2dQZ007BxlwGgWL+QJkLSR39Dv6tUS0h9zxSReMj2sGPnuxbhQ
	ONhweWd8qzZGWCSP7FX05NO/Qe1dFNra9WzyAKZQF5ac964iK1yaQXQDZ6VD5zUpnzcg
	nRZzoNvUx65OmNJBYRTsPg9EJAUDWG9lxRfn2M/aUOhA+XTflOOwy7BZ+TmEkJ2x70Z6
	7b0Gy2iQEjAgwcMYu3QXzp7EXIR5Pgb9tlonKoYA4kF1pQyjMC0O6nE6du50f8C5kuzb
	C8/PLHO/10JYtM+hZs5jp5pcd15VTCf7YaAjqQtPJ3F/mFyemqpQyf0z+a+fsdnH9xCt
	/mzQ==
X-Gm-Message-State: AElRT7FOu6GaZA7uNi+lLzea9RtA+HD4eiU/kdYFsE0uvng/eHWaXVIt
	q2Jz7TnVZUPubaaeP3TKfCbP7b64
X-Google-Smtp-Source: AG47ELuamJXIpsIbi7eMrQyxiMX2Lqul/rWSmbXydr5jqmvePMReNCB7OpHKh5/zfkNfbb6c6QORJQ==
X-Received: by 10.55.72.12 with SMTP id v12mr34000925qka.323.1521709918494;
	Thu, 22 Mar 2018 02:11:58 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id n68sm823747qke.25.2018.03.22.02.11.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Mar 2018 02:11:58 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Mar 2018 09:11:52 +0000
Message-Id: <20180322091152.3145-3-git@andred.net>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180322091152.3145-1-git@andred.net>
References: <20180322091152.3145-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-python][PATCH v2 3/3] python-aws-iot-device-sdk-python: also package examples (as additional package)
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
X-List-Received-Date: Thu, 22 Mar 2018 09:11:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Signed-off-by: André Draszik <andre.draszik@jci.com>

---
v2:
* add correct license to examples package
* run through oe-stylize.py
---
 .../python/python-aws-iot-device-sdk-python.inc             | 13 +++++++++++++
 .../python/python-aws-iot-device-sdk-python_1.3.1.bb        |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc b/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc
index 7b6066083..a3299e4ac 100644
--- a/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc
+++ b/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc
@@ -1,6 +1,7 @@
 DESCRIPTION = "SDK for connecting to AWS IoT using Python."
 HOMEPAGE = "https://github.com/aws/aws-iot-device-sdk-python"
 LICENSE = "Apache-2.0 & (EPL-1.0 | EDL-1.0)"
+LICENSE_${PN}-examples = "Apache-2.0"
 LIC_FILES_CHKSUM = "\
     file://LICENSE.txt;md5=9ac49901b833e769c7d6f21e8dbd7b30 \
     file://AWSIoTPythonSDK/core/protocol/paho/client.py;endline=14;md5=5a3c8a1a4bb71bd934f450ecff972ad9 \
@@ -13,6 +14,15 @@ inherit pypi
 
 PYPI_PACKAGE = "AWSIoTPythonSDK"
 
+do_install_append() {
+        install -d -m0755 ${D}${datadir}/${BPN}/examples
+        cp --preserve=mode,timestamps -R ${S}/samples/* ${D}${datadir}/${BPN}/examples
+        # this requires the full blown AWS Python SDK
+        rm -r ${D}${datadir}/${BPN}/examples/basicPubSub
+}
+
+PACKAGES =+ "${PN}-examples"
+
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-crypt \
     ${PYTHON_PN}-datetime \
@@ -24,5 +34,8 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-numbers \
     ${PYTHON_PN}-threading \
 "
+RDEPENDS_${PN}-examples += "${PN}"
+
+FILES_${PN}-examples = "${datadir}/${BPN}/examples"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python_1.3.1.bb b/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python_1.3.1.bb
index 12ae978e3..490e97391 100644
--- a/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python_1.3.1.bb
@@ -1,2 +1,4 @@
 inherit setuptools
 require python-aws-iot-device-sdk-python.inc
+
+RDEPENDS_${PN}-examples += "${PYTHON_PN}-argparse"
-- 
2.16.2


