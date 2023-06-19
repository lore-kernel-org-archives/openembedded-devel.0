Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0954C3DA41
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:23:03 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.7424.1687180981688603148
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:23:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=05U1zDDp;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.45, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-31114b46d62so3519904f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180980; x=1689772980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=efhnl4idvlCl6CkX1J7sjfuY+I379qcStcRlGPYLuZs=;
        b=05U1zDDpBHX6UnIcY4LVOz9nUlV14oSvEecwPL4tpEn9xEiWAzxON71ApLUIvaERmF
         awtRtRnM+es4c7ZGQaLhoD8E362aLzMQ4Z03WDtfxhod51G2IMGgEzj2w4VFx0N2llo4
         OMVX8TUZz+PSNvvMIZhjasR3ASTueK+XbWES53mpKvfIqAEAEvnJaXQqzT76my+cBx9e
         aYKejYibZv9ZAqbG23b+7kiVSbeba4uNxSdpazbXxhCeIRxQMJwUE5aPnrRIkFsWHZOZ
         Dk5xTHQF2pbFoTNv1NqTFs+g7WQxEjqX1c3UVqdtkr3mGW4twE1iN0HGquev5f260wIG
         3O6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180980; x=1689772980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=efhnl4idvlCl6CkX1J7sjfuY+I379qcStcRlGPYLuZs=;
        b=CS2+1jq+8lMl0ihlyF5gelHTkn4SGDUDt8UFHcR9lUEmFtfkERb3vYvQS/IngOzrxp
         QAc4MvnDgp71gNSVPUZWO9mzX5Chh1XlXVipCxSKtpciWuCZJy+tyUlYKiirPlewksI3
         v85Rv+6x/tbB1AffXeD9B13noDoBZNysEwjNFxu2/TVb4XX34zIZ3QkP2Cs7hi/rEvzV
         iDB+ID3B61jp2zBCJfrUbCriwnEhpTz7DpvRBBKcubC35JbJmLfTBt8czCQpcto8jvPw
         v12ucy/I5xRYN4XH0orKVaAKMCZEDotBKmQkeQqLtkNhjyezs2AqPvx3jU+OeXCaCgt3
         SDqA==
X-Gm-Message-State: AC+VfDyRABjeCdGIZKxqmKTzkkj2Tb8jeKkHx5lIdYZ3pqu9D5uz9ZCU
	AegsXfShsvdABk7X+l0VNsHrTQ==
X-Google-Smtp-Source: ACHHUZ4Gx0378TtTFW43y3vKxx/sQ4zwXolT28X/OFf+oh/2yMZ2W4DkBLkgQiUiuINVhntoAPqB0w==
X-Received: by 2002:a5d:6810:0:b0:30f:d1e3:22b7 with SMTP id w16-20020a5d6810000000b0030fd1e322b7mr10328145wru.6.1687180980171;
        Mon, 19 Jun 2023 06:23:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 38/54] python3-can: fix coding style
Date: Mon, 19 Jun 2023 15:21:58 +0200
Message-Id: <20230619132214.213417-39-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:23:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103422

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


