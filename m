Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 946F7C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:56:04 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web09.4263.1634338563460053643
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=ZF7AnchP;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.49, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f49.google.com with SMTP id y26so47869022lfa.11
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OU4e8fXKkMldPa4sig6jH2t052ZrQhHrj+qhkZr9rtQ=;
        b=ZF7AnchPiKD2suOgvMjveXD5J7xHgoF6VItXwCUxlDqco1nyDEqpNDrMQ2rSkHdTlq
         1olIMS+xCBGsZXUK4PM5G9cyv0sBmHCes6uVTsDXfNMvmP6d2tmZoOjoScc+4Hcmi9Da
         ClezNZ7a76uRRYJUZGY6GJkxSTbxG/EOKfWsJiDOkMM3HZ5Imaq9xpEz40JWLeO4lCki
         gT9OCwGcNNE7n3ssfBQdvbryvZZ8ncIz8woF4YQx89jFldMVOhYEhXtnCQdu+9ImeMOV
         vChfYr5jbg4f3+/jH+MFqfXVJ+7K9m8JYv+/IiXi7AgFSPOLE1aP+KL0MjPZVM4TsrNL
         /tRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OU4e8fXKkMldPa4sig6jH2t052ZrQhHrj+qhkZr9rtQ=;
        b=4uhCYBZ8frhsBxl0uolh/d9Z/npgAJDk//EuGr6pSV+gavTw2BjdtAMbnab/itjevD
         T4NGeFLb1HoZd+DXyUADPyFSxViqDkd8Jf/f+Qjm7RH7yjlzSQsmj51c+RXgHjsSW1Ua
         zmsy2gvYP/f9tuUbWY3Q5p1M2Us45vENrvXGwteYqZ1avQ4AbSfTrrbrBorJwXPPWk85
         +H/cT3y9AlopRXGoDREzO6l97Yv5ZD1UsWEf+cpKgoeddDP9f0XgElHEcZeoJ6kOdQSk
         UzXr8gBEv7IUaK5y2J2CHija6AfxrUUzgXeQwehE4ZrqZEn8AFolbCDzQ55rxKHK2BVj
         BlUw==
X-Gm-Message-State: AOAM532pvYtmGrk5u8K+b1KA6vumA2VF273xvkL/MiLGPSCxJE40BnZ3
	8LliTZnrmBbA6LZvXsGtaU0N/++zYdYZMEFi
X-Google-Smtp-Source: 
 ABdhPJyEcnWNWFnbJvcsgm7SODygcs4zpjELuaw33TPQAGKbnsPghPqqtjoqZlX8PYx260XsTRL8Gg==
X-Received: by 2002:a05:6512:23aa:: with SMTP id
 c42mr10290102lfv.55.1634338561468;
        Fri, 15 Oct 2021 15:56:01 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 bd9sm706672ljb.29.2021.10.15.15.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:56:00 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-sympy: udpate to 1.9
Date: Sat, 16 Oct 2021 00:55:59 +0200
Message-Id: <20211015225559.4162137-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:56:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93345

License-Update: copyright years updated.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-devtools/python/python3-sympy_1.8.bb  | 15 ---------------
 .../recipes-devtools/python/python3-sympy_1.9.bb  | 12 ++++++++++++
 2 files changed, 12 insertions(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-sympy_1.8.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-sympy_1.9.bb

diff --git a/meta-python/recipes-devtools/python/python3-sympy_1.8.bb b/meta-python/recipes-devtools/python/python3-sympy_1.8.bb
deleted file mode 100644
index e274857f7..000000000
--- a/meta-python/recipes-devtools/python/python3-sympy_1.8.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-# This recipe is adapted from one in meta-jupyter:
-# https://github.com/Xilinx/meta-jupyter/blob/master/recipes-python/python3-sympy_1.1.bb
-
-SUMMARY = "Computer algebra system (CAS) in Python"
-HOMEPAGE = "https://pypi.org/project/sympy/"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2245824980a408ef1749391dfba32b3b"
-
-SRC_URI[sha256sum] = "1ca588a9f6ce6a323c5592f9635159c2093572826668a1022c75c75bdf0297cb"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} += "python3-mpmath"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-sympy_1.9.bb b/meta-python/recipes-devtools/python/python3-sympy_1.9.bb
new file mode 100644
index 000000000..92018698e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-sympy_1.9.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Computer algebra system (CAS) in Python"
+HOMEPAGE = "https://pypi.org/project/sympy/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=42976c55ba05d15b32a7b4757dee5e64"
+
+SRC_URI[sha256sum] = "c7a880e229df96759f955d4f3970d4cabce79f60f5b18830c08b90ce77cd5fdc"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += "python3-mpmath"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


