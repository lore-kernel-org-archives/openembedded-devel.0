Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6508C001DD
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:22:43 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.7404.1687180957589521286
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=5DMRxyeR;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.44, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3112f256941so1562319f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180956; x=1689772956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOeewYQh5Eg1m4wZ3qsgO7KaJ3ldnjD8g3md6N579ro=;
        b=5DMRxyeRQfpiJx1eXxl+gz0q49RgKTjAh1SLV2AQljsSwJAm05ewzgqQ58z0Afvb13
         hhHodXHyBJfXBmIhJGbVUX68XrMZwCcDe+eK41dYvZ5n6cZf9xv7PWW6NtCNt9IvpuDJ
         XjUG7wWlQaAQWtU3yI2O+fB9VdeVui27U/vNfey08rw4j2REAn8QhKfxv0tPy0gytv46
         lRThHKGRcwDsXJLuYO0ooq3Oo1Y1JiDSdk0d5U5njKl5kZ3ThoJzVCF1MP0YYFGP7bze
         h7vVTa8dlgV0cbXbjY3UHA7GsDdhFSYEasweZWJqXI/BxbHofQRbS3P3pjHW2j2ggoRW
         ik2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180956; x=1689772956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOeewYQh5Eg1m4wZ3qsgO7KaJ3ldnjD8g3md6N579ro=;
        b=Qf2fhEHXyjyT5Xx9w5nxZ5yei4H5EDy4pstacM7neonPci5cOkKuByT/+FmHNAWEEH
         NmiFHVb90+vsG7N7bqQ+h6vOVoAqpsTxLW3iuQ5XUard59YlmuXtL07PY19Qzle6JG8u
         UJ3xCd9fH1kqKFdtq4m3xipifziv/kQSqlguUULLNFdGgeLnHEjyHDrIQKZnDRlFMqxt
         YtUd3przrdAPEy1iKmA7/1wiwX5VkjoyOmeqdW5w9YhHzR+WOMV//YIj0ycML4clh820
         /ulm2cXElDkOZPnweKamaOQP+5bTB68+EQdo8EKcnQSbJZMJJCVmWXWd5VPNJhjAqQ+T
         xftw==
X-Gm-Message-State: AC+VfDySQNngi2tRpddwin9prw0/+OprnXpPdndPA8bvnLYq4ZHfkJTv
	VXJFyT7z6JZuptbFOcvhSpDLYw==
X-Google-Smtp-Source: ACHHUZ4FLL+e3rIlxnJnpI1J/RSIvwnAZpd3RAm4d1QiphirCEy2HgBZloxBwSdR+vS8e/52E5S6Yg==
X-Received: by 2002:a5d:4bc1:0:b0:30a:ae5b:9e93 with SMTP id l1-20020a5d4bc1000000b0030aae5b9e93mr5859976wrt.11.1687180956180;
        Mon, 19 Jun 2023 06:22:36 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 16/54] python3-isort: fix coding style
Date: Mon, 19 Jun 2023 15:21:36 +0200
Message-Id: <20230619132214.213417-17-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:22:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103400

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Stop using PYTHON_PN and fix white spaces.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python/python3-isort_5.12.0.bb                 | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.12.0.bb b/meta-python/recipes-devtools/python/python3-isort_5.12.0.bb
index 6d7b20f3a..03d7a529c 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.12.0.bb
@@ -8,13 +8,13 @@ SRC_URI[sha256sum] = "8bef7dde241278824a6d83f44a544709b065191b95b6e50894bdc722fc
 
 inherit pypi python_poetry_core
 
-RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-profile \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-difflib \
+RDEPENDS:${PN} += " \
+    python3-datetime \
+    python3-difflib \
+    python3-numbers \
+    python3-pprint \
+    python3-profile \
+    python3-shell \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


