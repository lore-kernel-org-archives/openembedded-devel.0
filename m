Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 076A9C3DA42
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:23:14 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.7394.1687180989913837955
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=oAhlJeFP;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.54, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-31114b46d62so3520062f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180988; x=1689772988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMygM2PB6hnFkYkmsax/xdkPLOhohgGU4ntilxWfGtc=;
        b=oAhlJeFPNiy9jMoSN9FaIjDO9HChm1Xhi9Y8+HtUmOdQk+QbYprqdQ3NvRusUwX/Z+
         lM3ABCFdMZqcX0ui7Kx+wcUWvgDEJeOGnZKa771kYkn+eQ/cTDxPX6CV/Xv0G/QgY15b
         BpAWAEKAEHcDTH6S9PXsL9KtxgAyv1iuXTstaPLyLL2Vh+xZT2ZusjgfCgPzk2uxUIkq
         922KmB/orDqfM6+RO1kgI9SevV/z5jxjavviYEyw65RL8/Ppnye0gSetWxMPZfvjzPBj
         tgQXyThmfIE2fMFKwwXm3DW8FznGDFpH2QWGzpr8K0jnp9gqZ9E+Ok2wUH0xanTV7f3X
         PBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180988; x=1689772988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SMygM2PB6hnFkYkmsax/xdkPLOhohgGU4ntilxWfGtc=;
        b=e+F5dKVlvVg/5yceW/GC8Lpq0Ypr5tejASpllljiMJa6gpfhrfTEhrvBGcmHegAixW
         83umR+HMgFLTIXOZBpjfXzdTsa93gRpJR77Cm3ktWhqoHOMHKyL/DclCnQGeqfZYun3y
         Py5z3bq8zOYzXWjdQIRycOmnHQZHxOTDvpHP+mPcxNhiMFmqf+BPeGDDjbBtubjfCoX3
         QaLdGOwl1WV6yaM/3coSRQ/nlA0fisv8RcopUGzFX+/lJuVPEarGLVpsJbWMp0/IsttY
         VOjNLZVnw1Hjqm66fVRaXTJ77B7jdho/XZtHVXCGjk1EG5unRoxNrpYnVrMrp7sREAuB
         iq5A==
X-Gm-Message-State: AC+VfDzBusx7CeI3tAWSMrBxYMqgmNPHuvlUbZO/sYf9RmjWyesVeBe+
	q7IcJzVqNJkf7VcFcdnVpTn37Q==
X-Google-Smtp-Source: ACHHUZ47gLdW18vK4XysPd+N4xzi4ICxQw262UMmhQtSsBTUoZ15BpGbzomAEA8Jb6Vq7qqFaSMBgQ==
X-Received: by 2002:a5d:456c:0:b0:306:2e04:5925 with SMTP id a12-20020a5d456c000000b003062e045925mr10122185wrc.17.1687180988460;
        Mon, 19 Jun 2023 06:23:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:23:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 46/54] python3-coverage: fix coding style and RDEPENDS
Date: Mon, 19 Jun 2023 15:22:06 +0200
Message-Id: <20230619132214.213417-47-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:23:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103430

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Don't use PYTHON_PN, order RDEPENDS alphabetically. Replace toml with
tomllib to fix a run-time dependency issue.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python/python3-coverage_7.2.7.bb          | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.2.7.bb b/meta-python/recipes-devtools/python/python3-coverage_7.2.7.bb
index f625996ba..a69c05d25 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.2.7.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.2.7.bb
@@ -8,14 +8,13 @@ SRC_URI[sha256sum] = "924d94291ca674905fe9481f12294eb11f2d3d3fd1adb20314ba89e94f
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-	${PYTHON_PN}-sqlite3 \
-	${PYTHON_PN}-core \
-	${PYTHON_PN}-pprint \
-	${PYTHON_PN}-json \
-	${PYTHON_PN}-xml \
-	${PYTHON_PN}-crypt \
-	${PYTHON_PN}-shell \
-	${PYTHON_PN}-io \
-	${PYTHON_PN}-toml \
-	${PYTHON_PN}-multiprocessing \
+    python3-crypt \
+    python3-io \
+    python3-json \
+    python3-multiprocessing \
+    python3-pprint \
+    python3-shell \
+    python3-sqlite3 \
+    python3-tomllib \
+    python3-xml \
 "
-- 
2.39.2


