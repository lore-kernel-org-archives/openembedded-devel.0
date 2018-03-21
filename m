Return-Path: <andre.draszik@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 60CD27899E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 16:59:27 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id y6so5977702qtm.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 09:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KqblLkwr6SylBci+TOZ01LyzU6Yako4g08YHGyPcAlI=;
	b=bFS8fWpe1iV08vbvEb9i8r/xuinQzvYFog2makeqm8b8JMLiHecDwPjiV3RhOgVHe8
	sZhvCxt75STTiSAchyaPN3mvOhXhsJ+kvF9nHQpaqH20u1ePzEbB8WeRx3L0CR4PRxFY
	Td6FIDpJMNvKM+TwVLkojq0UJTYiIODcvdGOsSpnf8Zr1Qx0MnxbRpyX77dYY102NS/D
	rA+CizRtl5vltuMkkBLcGVF7HQoKhDkJstA3hdG8aOPhYKvK9O9yrAOuIxYVCXoO5nl7
	SvNFM7nDwuDO2xcNcnenWFGfTBCha0gkw8Aecu9jeODWZVKAB/Ipwf0UEyXhOAP46SiL
	Ll/g==
X-Gm-Message-State: AElRT7GhSuDSRsgwocU/SDwQ19zzRyw3aqS0EXyqrw1CdXrCQhMu59lg
	O0e9ommYSXAGWkV/D6geHfwn0J/l
X-Google-Smtp-Source: AG47ELte+9LDlYT/uqVg6uYTyU1J6ist2fRX8E6nd9IT6erMW1xQcOKDxb0W7/BzyT+/9zbfVN88OA==
X-Received: by 10.200.4.9 with SMTP id v9mr29603465qtg.69.1521651569016;
	Wed, 21 Mar 2018 09:59:29 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	d11sm3065587qth.97.2018.03.21.09.59.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Mar 2018 09:59:28 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Mar 2018 16:59:23 +0000
Message-Id: <20180321165923.31902-3-git@andred.net>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180321165923.31902-1-git@andred.net>
References: <20180321165923.31902-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-python][PATCH 3/3] python-aws-iot-device-sdk-python: also package examples (as additional package)
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
X-List-Received-Date: Wed, 21 Mar 2018 16:59:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 .../python/python-aws-iot-device-sdk-python.inc             | 13 +++++++++++++
 .../python/python-aws-iot-device-sdk-python_1.3.1.bb        |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc b/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc
index d31c01411..1c9625259 100644
--- a/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc
+++ b/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc
@@ -13,6 +13,17 @@ inherit pypi
 
 PYPI_PACKAGE = "AWSIoTPythonSDK"
 
+PACKAGES =+ "${PN}-examples"
+
+do_install_append() {
+        install -d -m0755 ${D}${datadir}/${BPN}/examples
+        cp --preserve=mode,timestamps -R ${S}/samples/* ${D}${datadir}/${BPN}/examples
+        # this requires the full blown AWS Python SDK
+        rm -r ${D}${datadir}/${BPN}/examples/basicPubSub
+}
+
+FILES_${PN}-examples = "${datadir}/${BPN}/examples"
+
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-crypt \
     ${PYTHON_PN}-datetime \
@@ -25,4 +36,6 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-threading \
 "
 
+RDEPENDS_${PN}-examples += "${PN}"
+
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


