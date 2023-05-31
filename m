Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 280FBC77B7A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:21 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.9104.1685521516514321198
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=kbUpfnQC;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.52, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-30ad752f433so3750853f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521515; x=1688113515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzRYD/rIqhnDNFSe1Spp7rpHoMFNB4T5soN9jvPG7UU=;
        b=kbUpfnQCHNczja4HtIPYCW5tyu3s5VUWiA2ZaFJiGxyfw++STLqw5dRpNOC6kWQhXc
         jb/3onEpCAL4lp+KdhOUDzBpNCmk8fk8xJaDLFeW+phwwXNcyHBSzNGiCtMJV1NNd4Uk
         ry9BgOiuEDbCr16aXcpzzk+U4NbE0lZiyBzvd1ivf0+MaMui2gddW23fWgSrQoOAxObb
         FYjl1PQwxdZeK2bd1iD1EGJUaJBW+Qqb1urApWgTZAC6EDRpWGahFTLUSJIPInXJnorM
         DqY2fVwgOg8uluc1gCgyiEd1HcoTT1sIISdWZ3HtgkioOE78c5jRQt9vPDHrqnwBFkwq
         Dmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521515; x=1688113515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dzRYD/rIqhnDNFSe1Spp7rpHoMFNB4T5soN9jvPG7UU=;
        b=CP6kBxWBPIbFOMuggq625KxwmnzAxHggTdf0XP9a1tDTrDnGkwXgzalWi0hKWt1G4t
         XdQQqRmxKfXLlAEfFuzTXZLw8dC7ATSYCxaB1NCZzXma8tJzhzv3K7Yer4Fp/EedEiP+
         FzrlLM8QnOBNC38AjdNT5zD2jBwC5WdC/LsBlbVcyaIEToCdTtG5B08dUm5KyD6NsQ1x
         76LH56kSBMi5uqOYwxM1oyS8H2lZ2BPkEwmfhISW3AW/LZKAm37B3YrbYhxeTk4h3ixN
         qtb9IS7YuobQRa70t8U0dFNtxgeBFohGCbW8BonpfR5SYK/vZungypARJBl/ycXVs/OY
         Y8rg==
X-Gm-Message-State: AC+VfDxGO5q2fyMsqRakkjsuUkN9s0HghoNSeAktQwMfxZzXoi5FfVhW
	kKLM6R2WZULOV7q3JECdE/YWoQ==
X-Google-Smtp-Source: ACHHUZ6ZxeAVbwbZfj0gDjdQ/0AFR3MKz8hu+RGPFdFbssWBPOXSVFE2LTFViDc+36wil+dMb3MMhg==
X-Received: by 2002:a5d:5964:0:b0:309:3df3:8e0f with SMTP id e36-20020a5d5964000000b003093df38e0fmr2991901wri.51.1685521515060;
        Wed, 31 May 2023 01:25:15 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 008/149] python3-mock: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:16 +0200
Message-Id: <20230531082437.10646-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102935

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-mock_5.0.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-mock_5.0.2.bb b/meta-python/recipes-devtools/python/python3-mock_5.0.2.bb
index 6753d2cbf..6b511d82f 100644
--- a/meta-python/recipes-devtools/python/python3-mock_5.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-mock_5.0.2.bb
@@ -13,6 +13,7 @@ RDEPENDS:${PN} += " \
     python3-prettytable \
     python3-pyflakes \
     python3-pyparsing \
+    python3-unittest \
 "
 
 SRC_URI[sha256sum] = "06f18d7d65b44428202b145a9a36e99c2ee00d1eb992df0caf881d4664377891"
-- 
2.39.2


