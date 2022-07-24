Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3982DC43334
	for <webhook@archiver.kernel.org>; Sun, 24 Jul 2022 14:33:51 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.17176.1658673225246663517
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Jul 2022 07:33:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KC/f1zep;
 spf=pass (domain: gmail.com, ip: 209.85.218.48,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id va17so16225620ejb.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Jul 2022 07:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cG0GPzS/0yVG16JjFNl3pMTBiCKyVtc33WmnFNs48Jk=;
        b=KC/f1zepm1OZbRKZ/GFmJIefg1+arAKPiwuhYSMOD2+QThw/NCXW25DP6E/czyrI9k
         4jz2mtPugG0+p4AbqEpp+MKPppqUrdTBYbXi8LRThtL/9NPtmGuLH5MOLp2XAc33f4DR
         e80CI8ElZiojaqL4PNoHPGn+tO/eTd8gjSDFWTWWGU87I7ScGBKryfhDc6kqCcPetocI
         0ydyu75R5z2F/vjWKfzjou2IMxP8yWD36yhfKeDWZUqK53HmC51O9UAQAfeHUo7ldsEB
         qNGTvnw3XDAmy2RkS7vTCFxxqJldHnGCzx4AVuP18pn9ql+YWyQR2vLzhEUOo64hEpmp
         pIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cG0GPzS/0yVG16JjFNl3pMTBiCKyVtc33WmnFNs48Jk=;
        b=o/uAsDieblqxgjsX9DX7FO2j8MfcNcFRWbMM/fa4Jhtw1lTQBDHC9oPmlFgD9EA78u
         Ee0x/1Ikf9jL78/SB6sWpZaG9qfPR5Owzr5ZtrrFubSXTIEBpuyH8x9apPSsTJnNB9Ur
         i5aEj4dVSIgpCR2V+oi5ISZDT2YDxo3ikC/hhW1VY82iOfVci8+I99dywqe/un3dvBdg
         eCDpj5MNIMcHoKTmLibReZytDywlBpgW1OthZlV2BoCyc3SjeTiZgS2L+p6w2RNJOhGy
         ut3m05FqxBM+vxJji2kkjUFgHle1co7D30JXFiuyyK2U9v0+/dOGALklu7W/oxcPs/pu
         7uXw==
X-Gm-Message-State: AJIora8GEjb7EGDWhwt7lzbROxcTvY4zK5vE9uIDX2ZxGR4HO9fFDLOV
	Ismc4qJTTd0LvEdlsTFXkeaUnpnu+xZgtA==
X-Google-Smtp-Source: 
 AGRyM1s7+DcNnsNsf8Nu7y/cW7bJqCOi9dFDOZu1UzO7jFfNL25CSIU2jyfsFOW/DxuAE2yo8BEgrA==
X-Received: by 2002:a17:907:96a4:b0:72b:647e:30fd with SMTP id
 hd36-20020a17090796a400b0072b647e30fdmr6520937ejc.723.1658673223234;
        Sun, 24 Jul 2022 07:33:43 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-fij45r00gxfeifntv3v.18120a2.ip6.access.telenet.be.
 [2a02:1812:512:2c00:f099:b041:7b7b:f5bb])
        by smtp.gmail.com with ESMTPSA id
 b27-20020a17090630db00b0072af843c794sm4245870ejb.43.2022.07.24.07.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jul 2022 07:33:42 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-pyzmq: fixed oelint-adv warnings
Date: Sun, 24 Jul 2022 16:33:27 +0200
Message-Id: <20220724143327.43832-2-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220724143327.43832-1-jan.vermaete@gmail.com>
References: <20220724143327.43832-1-jan.vermaete@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Jul 2022 14:33:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97959

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../python/python3-pyzmq_23.2.0.bb            | 47 ++++++++++---------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_23.2.0.bb b/meta-python/recipes-devtools/python/python3-pyzmq_23.2.0.bb
index 3471265e4..003f35d91 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_23.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_23.2.0.bb
@@ -2,24 +2,36 @@ SUMMARY = "PyZMQ: Python bindings for ZMQ"
 DESCRIPTION = "This package contains Python bindings for ZeroMQ. ZMQ is a lightweight and fast messaging implementation."
 HOMEPAGE = "http://zeromq.org/bindings:python"
 LICENSE = "BSD-3-Clause & LGPL-3.0-only"
-LIC_FILES_CHKSUM = "file://COPYING.BSD;md5=11c65680f637c3df7f58bbc8d133e96e \
-                    file://COPYING.LESSER;md5=12c592fa0bcfff3fb0977b066e9cb69e"
-DEPENDS = "zeromq python3-packaging-native"
+LIC_FILES_CHKSUM = "\
+    file://COPYING.BSD;md5=11c65680f637c3df7f58bbc8d133e96e \
+    file://COPYING.LESSER;md5=12c592fa0bcfff3fb0977b066e9cb69e \
+"
+
+DEPENDS = "python3-packaging-native zeromq"
 
-SRC_URI += "file://club-rpath-out.patch"
+SRC_URI:append = " \
+    file://club-rpath-out.patch \
+    file://run-ptest \
+"
 SRC_URI[sha256sum] = "a51f12a8719aad9dcfb55d456022f16b90abc8dde7d3ca93ce3120b40e3fa169"
 
 inherit pypi pkgconfig python_setuptools_build_meta ptest
 
-SRC_URI += " \
-	file://run-ptest \
+PACKAGES =+ "\
+    ${PN}-test \
 "
 
-DEPENDS += "python3-packaging-native"
+FILES:${PN}-test += "\
+    ${libdir}/${PYTHON_DIR}/site-packages/*/tests \
+"
+
+RDEPENDS:${PN} += "\
+        ${PYTHON_PN}-json \
+        ${PYTHON_PN}-multiprocessing \
+"
 
-RDEPENDS:${PN} += " \
-	${PYTHON_PN}-multiprocessing \
-	${PYTHON_PN}-json \
+RDEPENDS:${PN}-ptest += "\
+        ${PN}-test \
 "
 
 do_compile:prepend() {
@@ -31,18 +43,7 @@ do_compile:prepend() {
     echo no_libzmq_extension = True >> ${S}/setup.cfg
 }
 
-RDEPENDS:${PN}-ptest += " \
-	${PN}-test \
-"
-
-PACKAGES =+ "\
-    ${PN}-test \
-"
-
-FILES:${PN}-test = " \
-    ${libdir}/${PYTHON_DIR}/site-packages/*/tests \
-"
 do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/zmq/tests/* ${D}${PTEST_PATH}/tests/
+        install -d ${D}${PTEST_PATH}/tests
+        cp -rf ${S}/zmq/tests/* ${D}${PTEST_PATH}/tests/
 }
-- 
2.25.1


