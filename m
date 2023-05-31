Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5FFC7EE24
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:21 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.9133.1685521579862116083
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=MwT7TKpy;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-30af56f5f52so1469507f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521578; x=1688113578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5vOcjpVY62FDMVFNUnKo4RCbY6v2kWP/FRXJvGPiBq0=;
        b=MwT7TKpyfk7BjSQ/dYd73/Eotgej4p3Xa0scBKmIqA60vZkTEkrl1BgV1SEDE1iK4C
         B60jCW9ZNimJf/ZfBx9kR0X6XZW8ircnBMXbPo7SU2hIsRGzUx7Z/pDOFKJbKUq0L/mr
         6Mo6UTWE+hm7guSit6fE9uxXF8vwU6qDvKrq7YtNTmtx6pjvG/2tcCg83Ce12tktNKdW
         91+UeMtMpEINPf0JVOGPmpWxTk8oouVEXTjyEdDGRNMleddYTWKASYFWq/LzUfMIiqPq
         Jlp0uUA+ZGybHqHyr9Z3wpusiMXro48PUlQkbsOw/9Z/So9VZSf3Po6pT8zNhvmALiJL
         bJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521578; x=1688113578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5vOcjpVY62FDMVFNUnKo4RCbY6v2kWP/FRXJvGPiBq0=;
        b=S9RMgGfJDFpz/9SQzWCeUHVNmSQM5hdZnBGaL87wTEMBbhQCYTaDBm+MTZZpcVSRSt
         0s+5ISpu+M8DUpr2bV93bUv9frekvy7H4qgl+KrDI7CZld2D/4prwLF0jT6t34L3w2+d
         +WB4Y8X6Oc44XeFZTyqy09uvbpxIrqonIBIxf6pRNt9gphJhXVXGAXMIEHy+0n1R48ua
         tgltt4l8mHi6c7teNcR/v2TYMLzUkT69iaOWMKK/Jf0HoX1ANc3fTdAUQu1WZuutQUZS
         /D1wee63JF6qVFPw0e3/PtXSx9JMP+fpK1E1pabtzBn/vtk9oRHQ+8cxR9aviDOtgH6S
         veGQ==
X-Gm-Message-State: AC+VfDzbU9ZR/oFu/6YqDi9EGGgL6+F/7Ixd73mI8fAZ7gM7uR95HBLR
	D3GXaN8H4pPlA8sP+gdlJ4D3ZZ7nJuhrlvALMX4=
X-Google-Smtp-Source: ACHHUZ7Y2ksUdbeR+VxY4VH5hkDTkdH1PNgOJ0f48QdiTEdBW/IvBXpSgOcdi5RU6Gm68ZYZCpr6gw==
X-Received: by 2002:adf:e5c7:0:b0:30a:e3da:efe5 with SMTP id a7-20020adfe5c7000000b0030ae3daefe5mr3602332wrn.32.1685521578394;
        Wed, 31 May 2023 01:26:18 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 064/149] python3-pyroute2: fix coding style
Date: Wed, 31 May 2023 10:23:12 +0200
Message-Id: <20230531082437.10646-65-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102991

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Make indentations consistent and stop using PYTHON_PN.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python/python3-pyroute2_0.5.19.bb         | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb
index fa5b3a522..2720f3ed9 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb
@@ -8,29 +8,29 @@ SRC_URI[sha256sum] = "45460d12ed2a5caf272a357a3360b36d1e346f17afe1425b66fc21d70f
 inherit setuptools3 pypi ptest
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-distutils \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-multiprocessing \
-    ${PYTHON_PN}-pickle \
-    ${PYTHON_PN}-pkgutil \
-    ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-unixadmin \
+    python3-ctypes \
+    python3-distutils \
+    python3-io \
+    python3-json \
+    python3-logging \
+    python3-multiprocessing \
+    python3-pickle \
+    python3-pkgutil \
+    python3-pprint \
+    python3-shell \
+    python3-unixadmin \
 "
 
 SRC_URI += " \
-	file://run-ptest \
+    file://run-ptest \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-	${PYTHON_PN}-fcntl \
+    python3-pytest \
+    python3-fcntl \
 "
 
 do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
-- 
2.39.2


