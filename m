Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5AB1EE642A
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 04:11:59 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.39637.1726114316225044290
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Sep 2024 21:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PdLbbN/c;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7b0c9bbddb4so396310a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 21:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726114315; x=1726719115; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bYKCEwDnIZtbxuWVPgy+268TEayVt6GvPHMIMO4SVLA=;
        b=PdLbbN/czekpT0tJywUk3gp7hkgBBd9EuQcFpeTdKSgTrbKnfJ43OkS8mxh3W82LpF
         2rJUdVeHFEwMEPfExIAsMdciPOaEumOma8o+GOboYAVl1MlkxEV6MTa5s7+HeGj3skQa
         gl+D60YRFB6J/gGKKEr2wVjjMo4DE1CWRW0eOZVN+y5phlbWrpo/Itc9QKDqGFCJv0f/
         GbzCXizzvGq/up6QI12HmIQAP1IF94aNsHezuny/O0JvFfcvsb2mEZY47lCiMtUkVED3
         dhJ+wEnwp9RedyAF2Iz1J5iEWf/EfWE4Uln9ef+A6YKVg4rBfl7Z52KHGaXtdkftw+ws
         WjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726114315; x=1726719115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bYKCEwDnIZtbxuWVPgy+268TEayVt6GvPHMIMO4SVLA=;
        b=wTcnYvWjr4o5gZP5x4weX3pS1ZRYxNAd5eCWx2QrU6Te+ZSVLh5426N81nP3qGyVV4
         2VGfwb4T/4Fgk0CV9Dsabj2g6sXta9BA8Nh0izlmPOZlOrsP9IMjcTvXl8apO/u/ZXlP
         4BN9SvgZ5+T1Hkpmv4zog8UTCiiJRgBrJB/Jsik1NUMiC3v2/w6tkMfuLhend9iF722l
         edomQwGAytqCh85P4mWmm40oG1FM6LOKPWStAMYtrdj+XFVHZIaOuiXRDW6w3LDt4Vrx
         Gy9XMI0vVN3aM/546i1BGtOJ7XDswMFjCLFbwBeLnmTV6QZFFR9SrvhxJf2a1xE0uFPd
         tgYg==
X-Gm-Message-State: AOJu0YwtKil85YnivxkX8nLwWlz8djXc97J5IlVtgoirz0DvvFXb+w0A
	f09NezE6OvWJajtWbtW8nTPy0nSM8WLJENaUqfpCkj2aIH4lV6UJ9xNrdcll
X-Google-Smtp-Source: AGHT+IF88o3krfoEZXuNgMbqat3VcRkd2bb0IrV/hDrkDudGS3rvY85JphF2/l6ONrRfvR/Rv0inUA==
X-Received: by 2002:a05:6a21:4d8b:b0:1ce:e725:1723 with SMTP id adf61e73a8af0-1cf76243dabmr1926002637.45.1726114315101;
        Wed, 11 Sep 2024 21:11:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c5d8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dadb42e6fasm11559781a91.0.2024.09.11.21.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 21:11:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-serpent: Add missing rdeps for ptests to run
Date: Wed, 11 Sep 2024 21:11:52 -0700
Message-ID: <20240912041152.54166-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Sep 2024 04:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112254

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-serpent_1.41.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-serpent_1.41.bb b/meta-python/recipes-devtools/python/python3-serpent_1.41.bb
index 941b5ee0f3..f3cf80a375 100644
--- a/meta-python/recipes-devtools/python/python3-serpent_1.41.bb
+++ b/meta-python/recipes-devtools/python/python3-serpent_1.41.bb
@@ -9,8 +9,10 @@ inherit pypi ptest setuptools3
 SRC_URI += " \
     file://run-ptest \
 "
-
+# python3-misc for timeit.py
 RDEPENDS:${PN}-ptest += " \
+    python3-attr \
+    python3-misc \
     python3-pytest \
     python3-pytz \
     python3-unittest-automake-output \

