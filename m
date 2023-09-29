Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97116E71D5E
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 21:19:28 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.29553.1696022364505580361
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 14:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: straka.derek@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-41807974fc1so77911401cf.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 14:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696022363; x=1696627163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V1xya4ivOB6UMDwMEN5saeqaQ+OJWvatqMBEDrTxrtA=;
        b=qQbqU1jTA+0TM7w9YfnW0UC/hFjyQ8D3kDM4KLmwdcYiu+e0QmiqVmBGj0hKUS6aYR
         aQtzLKwOoFrbTrKTJ+PJcmk8qJ48BwGmyiqZHlkw5m1zf/nifgZeO6rRPPigxu2frxsI
         mnvi6ppb0pMGXdU/MhN0dhRi2KcOjcEhWIOt1Lggp0d29E8wsBl7nNwp1YM9xPGlk5Vy
         IevTs6glvJTIr7MfrNgoafWwqPfDgz2QIZ1TTCm5/ujMYo55d/0bnSL5z+sN5CF4wQnh
         0/mm2wb5iQbuFtVBkt/++UGmUuOJLcAUkA+tPcedMtoPUyTmNgtzMDJQkocZDvHNLz19
         SW+w==
X-Gm-Message-State: AOJu0YxEkMQZjJzH/G0u3u6yDd6y55fBTmaQHiMrASv+7PnxKITtzx6l
	NQI0SmSRNHgk2Urz48+HSvW9NOTbmbl2xKx4
X-Google-Smtp-Source: AGHT+IGfW/FP5YoQd72DM+kzjhTdiHt4NqMn0P43aNxYt+lbpnUQbZgK/54JoDZGawDb/rfHQG1AuQ==
X-Received: by 2002:a05:622a:453:b0:410:a2c4:d696 with SMTP id o19-20020a05622a045300b00410a2c4d696mr6662284qtx.35.1696022363104;
        Fri, 29 Sep 2023 14:19:23 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id p10-20020a05620a112a00b0077569c302d1sm2890053qkk.28.2023.09.29.14.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 14:19:22 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-parse-type: update version 0.5.2 -> 0.6.2
Date: Fri, 29 Sep 2023 21:19:12 +0000
Message-Id: <20230929211912.2137840-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 21:19:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105271

Verify the license remains the same and update the checksum
Remove python-six runtime dependency

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...rse-type_0.5.2.bb => python3-parse-type_0.6.2.bb} | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-parse-type_0.5.2.bb => python3-parse-type_0.6.2.bb} (51%)

diff --git a/meta-python/recipes-devtools/python/python3-parse-type_0.5.2.bb b/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb
similarity index 51%
rename from meta-python/recipes-devtools/python/python3-parse-type_0.5.2.bb
rename to meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb
index 7eebbfb50..99493db32 100644
--- a/meta-python/recipes-devtools/python/python3-parse-type_0.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb
@@ -1,15 +1,14 @@
 SUMMARY = "Simplifies building parse types based on the parse module"
 HOMEPAGE = "https://github.com/jenisys/parse_type"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=16374dbaeaca1890153edb3f41371222"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2e469278ace89c246d52505acc39c3da"
 
-SRC_URI[md5sum] = "b954062f14ab723a91fe1e2be15e859d"
-SRC_URI[sha256sum] = "7f690b18d35048c15438d6d0571f9045cffbec5907e0b1ccf006f889e3a38c0b"
+SRC_URI[sha256sum] = "79b1f2497060d0928bc46016793f1fca1057c4aacdf15ef876aa48d75a73a355"
 
 PYPI_PACKAGE = "parse_type"
 inherit pypi ptest setuptools3
 
-RDEPENDS:${PN} += "${PYTHON_PN}-parse ${PYTHON_PN}-six"
+RDEPENDS:${PN} += "${PYTHON_PN}-parse"
 
 SRC_URI += " \
 	file://run-ptest \
@@ -19,11 +18,6 @@ RDEPENDS:${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
 "
 
-do_configure:prepend() {
-	sed -i -e "/python_version >= 3.0/d" ${S}/setup.py
-	sed -i -e "/use_2to3/d" ${S}/setup.py
-}
-
 do_install_ptest() {
 	install -d ${D}${PTEST_PATH}/tests
 	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-- 
2.34.1


