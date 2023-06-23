Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E957C001DD
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:40:17 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.207.1687531213780472399
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:40:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=XZL4Vskd;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.46, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4f957a45b10so886582e87.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531212; x=1690123212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=efhnl4idvlCl6CkX1J7sjfuY+I379qcStcRlGPYLuZs=;
        b=XZL4VskdbUANCIbokoZqkWq4+/ZQRvvejmwG9rdsbqtn+6IiKzy5a6uvJXtCFzQusf
         dHPtwFkJ8sJMAJ6WDSo/m78YdHUwURaNOUHWTBj9si3oKBTtOUP7u7nedFU36nsHsbxt
         cSOUOzrcMrcHG1+yF/v9I2yvK0E3hKDFa2FvBLB/OerGPmlctjOgx+KLT55wlxJb2W3m
         Xcyn8IbOPYLkmPGOeOHkAXFhCTL6mDulEvNzfIaQ2TqrXWx8KFMy3nbwxb7TKXZYyRWI
         i9LTa/rZrN0RGaJTJbfZcD2vpHmMwWrKUBkPqWIJo2KC6vfc4cz+RzZue91pO2R18L50
         uY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531212; x=1690123212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=efhnl4idvlCl6CkX1J7sjfuY+I379qcStcRlGPYLuZs=;
        b=C+9+l9fHkhcW9LLKDqSxPjUSfXQ6NthyPLQdOwIrEYKxnFoJZT6YZVzLIU1cYfzeMM
         veB3vtQg7mzAdrFJw791b1jUO3xQITNfGzX2rxN56QOWTkE2xyVIwsJl6zasPfS/Gxq3
         OlksMPCGa1s9YSzjeAnm4QI7cof1UCKajOjMuPyuBgY8kIQzl56gyO73nw8HBKcnU5+F
         DFm+6siv+g7FCmNzsQPJbvhRLnqrwL9rQs4uge1rn6l22JUcD+ZymNDCZH6xb/dwXPeh
         MdY10WenWnt3z+RilCFtQRYLO/5RQ/R11JyHAuCB5aBSxCmz6OUGCBopi+3cYBLz65W+
         ReeA==
X-Gm-Message-State: AC+VfDwpZNWM/YNHyGKDLpdhMENvURDdHURxNFDLbK5HNKEXZcvwDWXP
	nXd0rSsHNSdpCVoaJDC69pcvaD5ahTmqt7hg6ig=
X-Google-Smtp-Source: ACHHUZ4VMLCUtICACTOypZQXT++m5vEB4WjGKnIZ5lR1wDLxOGG49F5koeZJUG5DUtcwjXedzSxedA==
X-Received: by 2002:a19:e308:0:b0:4f6:2156:51b5 with SMTP id a8-20020a19e308000000b004f6215651b5mr13401193lfh.35.1687531212046;
        Fri, 23 Jun 2023 07:40:12 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:40:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 39/55] python3-can: fix coding style
Date: Fri, 23 Jun 2023 16:39:05 +0200
Message-Id: <20230623143921.146338-40-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103535

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Stop using PYTHON_PN, order RDEPENDS alphabetically, drop unneeded
class-target override, fix whitespaces.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python/python3-can_4.2.1.bb               | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-can_4.2.1.bb b/meta-python/recipes-devtools/python/python3-can_4.2.1.bb
index d7b2a9573..f5cc31d6f 100644
--- a/meta-python/recipes-devtools/python/python3-can_4.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-can_4.2.1.bb
@@ -9,19 +9,19 @@ PYPI_PACKAGE="python-can"
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN}:class-target += "\
-    ${PYTHON_PN}-aenum \
-    ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-codecs \
-    ${PYTHON_PN}-compression \
-    ${PYTHON_PN}-fcntl \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-misc \
-    ${PYTHON_PN}-netserver \
-    ${PYTHON_PN}-sqlite3 \
-    ${PYTHON_PN}-wrapt \
-    ${PYTHON_PN}-pkg-resources \
-    ${PYTHON_PN}-typing-extensions \
+RDEPENDS:${PN} += " \
+    python3-aenum \
+    python3-codecs \
+    python3-compression \
+    python3-ctypes \
+    python3-fcntl \
+    python3-logging \
+    python3-misc \
+    python3-netserver \
+    python3-pkg-resources \
+    python3-sqlite3 \
+    python3-typing-extensions \
+    python3-wrapt \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


