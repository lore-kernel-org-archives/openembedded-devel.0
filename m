Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD3D6C2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 12:55:35 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.18839.1719838527269470641
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jul 2024 05:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=lmO2NtEu;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.208.172, mailfrom: brgl@bgdev.pl)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ec1620a956so34108381fa.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 05:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719838525; x=1720443325; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IT48CIBM+QQmDLBUL+ItTcklBfUpirralZx5sVT7Z5M=;
        b=lmO2NtEuhrVCdjv9kxoIpo3vPn9VmhetkLOj8W7Tay5XStNpn73HHlbBbS1QMCSqUY
         0EsmaHC0mhipGxWcVzGejEiNXJOoC1Zahlc3YUif6Q+saF5A9f3Mg3E8h1XIYbhqe41m
         EKx/X7k6owSz7yfa552EamO8TE1EWQZARjn3kFCm3fDZEtsubum7RGR7pkMdlwxxt9zp
         FFiCYZKmBe7a2E/lxyPZIhRs5QvYxF0KVWHE5Vm/NtbScW8t1Uf7h3Mnxq4vXeNouzUa
         GXefmOHIB9quubP2JCnZy6HxygwnWrRuK/9aAc/QU6GidOaODV0ln4cg5BscuZr0s6oM
         glpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719838525; x=1720443325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IT48CIBM+QQmDLBUL+ItTcklBfUpirralZx5sVT7Z5M=;
        b=qi91uIpTbFpuHa23ZHTBOWHbBWuDaVL6t4a1r6o939eS7mf8PLsRbk275KcPc5Cugh
         6Qdxzrp5UXsuQ1kTcchfcbwWJmwGJai6doVSINBr7EvxdmYqfSGu06a1gQdNixizEu0q
         nX3YPoYxhjo1TQpPEVxJijuSWiN9y3g8dhm+pavyYN+yajG8Zrcrvtxexva4IaXVeZcU
         CYtAgIVpuxcMEquVfbVfnBCkDRpP6IaQNyCz4mEe8E3kvGNE2BbR6IRxOVVtVofuMSer
         +D+hNA5gyL1p3RmYt7xHlYa1RdZLZfDBaa9meiT0Z2auiK8qqA7gdVo9FZ3w818H52rh
         6TkA==
X-Forwarded-Encrypted: i=1; AJvYcCWLDziQCEApRtc1/sUEmaMc8HqBcMhMBvR04fRM8L3rsr0UjHlGz8Ev3qw3u/TjMoib38+aPWccMQiS/U7jU3mNcnoS9+Cz8dcL5FC0Cz8F0mCZztYVKk27FQ==
X-Gm-Message-State: AOJu0Yx6E0h5TCzF7XyiOCb1aBAQIqU6XG772Oi3UGRc1SOC0Qh+FicS
	buAENZ0ydVzYozVbjE9zsGXCShiAcKCWHd2F/8YiMkXMOVB86ZE9OuqrRvpljAU=
X-Google-Smtp-Source: AGHT+IHy7Xogmt9AO6p1X8ja4nM/0OPlv5O6+KUzfuGbPPUcdayCeVg79Mzmd+mXLlNRT9jx9+/YCg==
X-Received: by 2002:a05:6512:6c6:b0:52d:582e:4117 with SMTP id 2adb3069b0e04-52e826f75c0mr3749921e87.54.1719838524608;
        Mon, 01 Jul 2024 05:55:24 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:1c2d:13b2:676b:59c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af5ba51sm150796395e9.12.2024.07.01.05.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 05:55:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH] python3-virtualenv: add missing run-time dependencies
Date: Mon,  1 Jul 2024 14:55:19 +0200
Message-ID: <20240701125519.36398-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 12:55:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111199

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The recipe is missing most of the run-time dependencies for virtualenv.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-virtualenv_20.26.3.bb     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.26.3.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.26.3.bb
index 6720f50da..975bf11af 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.26.3.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.26.3.bb
@@ -16,7 +16,11 @@ DEPENDS += "\
 "
 
 RDEPENDS:${PN} += " \
+    python3-compression  \
     python3-distlib \
     python3-filelock \
+    python3-json \
+    python3-misc \
+    python3-modules \
     python3-platformdirs \
 "
-- 
2.43.0


