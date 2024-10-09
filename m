Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 388A2CEE33F
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 18:21:33 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.24219.1728498084567503313
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Oct 2024 11:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IRjGwC8e;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fac6b3c220so1016481fa.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 11:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728498082; x=1729102882; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hcqNrdQ1pfXzjwmNIov/6ygrL8AZfPcKxkdCZWGyWM=;
        b=IRjGwC8eTO0pOwgX3fr8NzLLudwnDkmxZ0+0IHZaRx+wWTJKB+VpKpz55R6vAEGpPG
         7dlnRAekQPOk9iTIFUtYkNWtd1cUsXYvsNuCzqYkBNladS9/V+PCpb1RIm21/angkhbq
         v8eyF5fPCw5px07pxz5oelSxw5Jr/a4fpzGtCgzQwNwoIA5gCUa2Jx4uUhyP7YxgnUoi
         9nLMF94uAVpuo53Mb8o4WLS+n/fVtuBJ4rsrB7n73WtRnUE2x3uNPOpPC3wyVlCo6van
         d/c/OQQCwpGmHsw8Igu4tZ3huk3o2SR3THiZnNjYr85ZNQ58EJPYv+6QZ8TebBe/WC+E
         O7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728498082; x=1729102882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8hcqNrdQ1pfXzjwmNIov/6ygrL8AZfPcKxkdCZWGyWM=;
        b=iyH0Mc8upqHSnneNGUi/AsVcDVUJdNrM93IwHI8ZMKWD5JbF4AxMuGtBiiKoSYchJ0
         eQV6lgkdR57tZuuH0KmmSbWR97s/LYCphKCTShGJ4mFfml1/j+Me6lVvWRPtiPEa/Zrp
         jACyKsPvH03XdEngCOCBvZXVQ2xrd4H2Zu3swd9TmCMtolywVhM5HCVfAXtgzPjRLurv
         HgvQeAIN1pGBHManLaKwLxUqJOs39GTxmEOGBdBTzlB8JD2sn2N+3hdFQt7rwzRAKnCO
         iMC8FB3Yu02j6//GVWrIqC2GDgs/UuOv7zKIH2ahVWJpQODW1AVchRo9HicAamCyeBI0
         A/UA==
X-Gm-Message-State: AOJu0YzKQ6/CQXRk2qcP4KiLv0xrVlT9oX5f4raoYsvfUNFYQYUi99NX
	OAYu5vxV2HAfN/mJKX52P1JSQ4URPZwTtuFelB1kPSVdf14v3/oLeEqeXA==
X-Google-Smtp-Source: AGHT+IGPh4Ple+KBUAkeU1ByIfonk1Afv/B6yBvkStseIK1nbeJGCaKGm3RBoaXpWrdTHFKtFfxe2w==
X-Received: by 2002:a05:651c:1989:b0:2fa:c455:23c with SMTP id 38308e7fff4ca-2fb187f477emr37070641fa.42.1728498081929;
        Wed, 09 Oct 2024 11:21:21 -0700 (PDT)
Received: from localhost.localdomain ([176.33.66.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9954cd8395sm446754466b.30.2024.10.09.11.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 11:21:21 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 4/7] python3-spidev: switch to PEP-517 build backend
Date: Wed,  9 Oct 2024 21:20:28 +0300
Message-Id: <20241009182031.242045-4-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241009182031.242045-1-alperyasinak1@gmail.com>
References: <20241009182031.242045-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 18:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112740

Fix:

WARNING: python3-spidev-3.6-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-spidev_3.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-spidev_3.6.bb b/meta-python/recipes-devtools/python/python3-spidev_3.6.bb
index e3fdc435a..807ee5b78 100644
--- a/meta-python/recipes-devtools/python/python3-spidev_3.6.bb
+++ b/meta-python/recipes-devtools/python/python3-spidev_3.6.bb
@@ -12,4 +12,4 @@ SRCNAME = "spidev"
 
 SRC_URI[sha256sum] = "14dbc37594a4aaef85403ab617985d3c3ef464d62bc9b769ef552db53701115b"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
-- 
2.25.1


