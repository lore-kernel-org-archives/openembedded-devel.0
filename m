Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5154C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 19:16:23 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.1746.1646248582830475656
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 11:16:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QGCFgRzZ;
 spf=pass (domain: gmail.com, ip: 209.85.215.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 139so2472801pge.1
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 11:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fv9Klaygyo0EYRxMhs5OIQLPWai2UVGSPaGaRrsIihI=;
        b=QGCFgRzZ8uxzSOxj8wQz02DpKqD3WLqp2VBfPUwuDii9NuTxMfq3xbGF6dcREfrfiE
         pPHOtQgDSXgkQpboZO/EeQBfnr1cdSccccAyZ+fTX+D8/VLhGD1AM3X2IIycNhHSEAVX
         0zmqtHiq1lHEokrsv9RoJ3GmzU9LnRYRzyCjwU1cEv1XAp6BuyEXJQFhCRntHapAwhJS
         misMnrBHPtv7kuW2M2f/yCZDG1VP5rosji05NFTBpxyQ3q2iZ5MI6jGkHYoVyq5BxtEc
         OLN/QyrSVWOcZpoILp4vWpzJriEwLYx3ORTYD5wSnRZwmdq4eefMjHKYHBM2z53rINDh
         Niwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fv9Klaygyo0EYRxMhs5OIQLPWai2UVGSPaGaRrsIihI=;
        b=fYAggNZfj6IeeTBk41nnRPEi4nC2Eh5ZUWU6LcxOaZFP+9czF+LrFZIFujnR7IG1T2
         dP/WZICFx9mY/uahX/xg2THGznK3KYPNODrMOjwyn6ywEDta0EfvEiLABCmJlI5Wt9pf
         8gPeZC2Bm2UxgDoM7D6XvMHt7g+xYdGWedAfU5GOvyVOIfczWCh7xzbX/Asx4HByB14u
         BsJa0Czwap4DcaNg1mrp0EuWMGGpAiVynLxLe0HBnoutcavnO/7ZjhuURKuDo/vkoAq8
         NC5+QpTCLk7XbkSRMLu92Qm/rmt/zQXWjvW0UqRTXTh0EjT3LdJ6M3ylEPP2OB1Ykb+K
         H81Q==
X-Gm-Message-State: AOAM533ztW1h0laPbxOOlNQaYiSB3M5RwPyM8it+PZyiKX1OXBv8lEEP
	lBC01cp5lnDxj8MKvJv2N5Ky1eiUXvALBw==
X-Google-Smtp-Source: 
 ABdhPJwlsnuKLQlG7fruuwv3Acqs5Nwe6RPP2J3ZnpquCek1XYLjXifRleBbxUHqx1cS6V+sCVILCg==
X-Received: by 2002:a63:710f:0:b0:378:c35a:3c3 with SMTP id
 m15-20020a63710f000000b00378c35a03c3mr11515147pgc.535.1646248582016;
        Wed, 02 Mar 2022 11:16:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1a20])
        by smtp.gmail.com with ESMTPSA id
 my6-20020a17090b4c8600b001bc2cb011dasm6069766pjb.4.2022.03.02.11.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 11:16:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-aws-iot-device-sdk-python: Upgrade to
 1.5.0
Date: Wed,  2 Mar 2022 11:16:19 -0800
Message-Id: <20220302191619.2408490-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 19:16:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95704

Use github to fetch it since its not yet available on pypi
Port to use setuptools

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Use-setuptools-instead-of-distutils.patch | 29 ++++++++++++
 ...python3-aws-iot-device-sdk-python_1.5.0.bb | 44 +++++++++++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python/0001-setup.py-Use-setuptools-instead-of-distutils.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python/0001-setup.py-Use-setuptools-instead-of-distutils.patch b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python/0001-setup.py-Use-setuptools-instead-of-distutils.patch
new file mode 100644
index 0000000000..9bc8b36f36
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python/0001-setup.py-Use-setuptools-instead-of-distutils.patch
@@ -0,0 +1,29 @@
+From 36f8106535150b970c75e8b8456ebc5a7d1dbdb3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 2 Mar 2022 11:11:01 -0800
+Subject: [PATCH] setup.py: Use setuptools instead of distutils
+
+distutils is deprecated and will be gone in 3.12+
+
+Upstream-Status: Submitted [https://github.com/aws/aws-iot-device-sdk-python/pull/305]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 3846bae..d0c2b8d 100644
+--- a/setup.py
++++ b/setup.py
+@@ -3,7 +3,7 @@ sys.path.insert(0, 'AWSIoTPythonSDK')
+ import AWSIoTPythonSDK
+ currentVersion = AWSIoTPythonSDK.__version__
+ 
+-from distutils.core import setup
++from setuptools import setup
+ setup(
+     name = 'AWSIoTPythonSDK',
+     packages=['AWSIoTPythonSDK', 'AWSIoTPythonSDK.core',
+-- 
+2.35.1
+
diff --git a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.0.bb b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.0.bb
new file mode 100644
index 0000000000..2f877487ac
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.0.bb
@@ -0,0 +1,44 @@
+DESCRIPTION = "SDK for connecting to AWS IoT using Python."
+HOMEPAGE = "https://github.com/aws/aws-iot-device-sdk-python"
+LICENSE = "Apache-2.0 & (EPL-1.0 | EDL-1.0)"
+LICENSE:${PN}-examples = "Apache-2.0"
+LIC_FILES_CHKSUM = "\
+    file://LICENSE.txt;md5=9ac49901b833e769c7d6f21e8dbd7b30 \
+    file://AWSIoTPythonSDK/core/protocol/paho/client.py;endline=14;md5=5a3c8a1a4bb71bd934f450ecff972ad9 \
+"
+SRCREV = "90d7b05749e2da7a13193024c720e3c8d9bf1157"
+SRC_URI = "git://github.com/aws/aws-iot-device-sdk-python;branch=master;protocol=https \
+           file://0001-setup.py-Use-setuptools-instead-of-distutils.patch \
+           "
+
+S = "${WORKDIR}/git"
+
+inherit setuptools3
+
+PYPI_PACKAGE = "AWSIoTPythonSDK"
+
+do_install:append() {
+        install -d -m0755 ${D}${datadir}/${BPN}/examples
+        cp --preserve=mode,timestamps -R ${S}/samples/* ${D}${datadir}/${BPN}/examples
+        # this requires the full blown AWS Python SDK
+        rm -r ${D}${datadir}/${BPN}/examples/basicPubSub
+}
+
+PACKAGES =+ "${PN}-examples"
+
+RDEPENDS:${PN} += " \
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
+RDEPENDS:${PN}-examples += "${PN}"
+
+FILES:${PN}-examples = "${datadir}/${BPN}/examples"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.35.1


