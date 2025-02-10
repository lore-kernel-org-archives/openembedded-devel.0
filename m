Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C335C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 10:10:39 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.47260.1739182228860669970
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 02:10:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=SIeVEpal;
 spf=pass (domain: konsulko.com, ip: 209.85.218.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab7c14b880dso147282066b.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 02:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1739182227; x=1739787027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mo/Y55IkkDbWEFiaBQ01238y7ipsOtrXtlD2xhh4mHA=;
        b=SIeVEpalXTit5F+dUOj8ms4rC/iutXu902HBtzMBhoKv/ZOI4N6JvoU3hkSyhqPY5l
         C3tsyWz3eg/gEo9da8FYrReWO81m06pCIEE7HRR5ljf8ADVBc1xSibI4CGeyjxL3OHqz
         ZeeMQvWvn8xNGrteVN20EJGKtGTRFbTAfrn5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739182227; x=1739787027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mo/Y55IkkDbWEFiaBQ01238y7ipsOtrXtlD2xhh4mHA=;
        b=lv8rpNsjS2b5V/Ug9l1IKKKwf2dTJxrg0cHUrMS/7m+OmR13uYmUSY5oWdPaVmYIhm
         uPtjs5y9pG0w5jXYX8qly3wTQJzk6Yu5ZtMcgNujmEoikJZ68mMdjkHXz1Jc+d8QTsAa
         5FdaYUHmDg83S7+Iov+coSmz3xEOymSi9/E8T6rRutW3Q9jarhUEYvVsB5ikwiY3JoGR
         GwbEADFKdleSMzTodWk++fELH/XBunuVS2LxrxoXg+Rc+AtEwqhXTBLWb+yV8DanFCBS
         2bu1HiB/BykbH8VYVxtqwikj7UbJWK/UreCFiu0XSMyblbV6tevANNS0/ZzGExLD4QDF
         dyoA==
X-Gm-Message-State: AOJu0YxxAPU1qhykHVeIfBt+M+c1EZNBef+XuhRrtHwJbEZp+oJUGbkh
	iCO+9iGUK+oWB5VZwNcOLH/AlpX6llv8WCkM/hsMcKf/lp9KBxgBeKc4hFKUP1kDKA+4/u0FeCE
	5
X-Gm-Gg: ASbGncsCC5M//yVaPh7ERjVj/oaRHsl0P6VwCIq7fdviIuy+6b0YOI9kF6+5PSZUyyF
	fCxLrEfiJ3WlhY8/9cipqhq7VGBDq/qmWIyC0xneJi3vxkYyTAURwGdJudzOYvJgnVBGJeOYrkJ
	cD05qCvFfG24HWCo2MEqRCJFNfKtxMf48GfpVtimughgC1zEIVFtCo2N4TJl4n5L4nykv/lbNr1
	EwMilPFgd+tsVSHywhmDXDRhf2MVv7ssklRgqffWj4TR7B6DXrLL7QtwcFGjniH30cp0YeBh/pc
	MNlUXpavawjXoR2R/w39IP7Xjl6OSQ==
X-Google-Smtp-Source: AGHT+IGxCyP83AWgXITm9nq+CnQ4SJ91wfM9Yn0xI45lkF/SDOwHEPuoADGRpaRBlAIGJ67o6eeoug==
X-Received: by 2002:a17:907:d0c:b0:ab7:b84:544d with SMTP id a640c23a62f3a-ab789ada45fmr1295832766b.22.1739182227030;
        Mon, 10 Feb 2025 02:10:27 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bb9cc86fsm242747066b.140.2025.02.10.02.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 02:10:26 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-aiohappyeyeballs: Upgrade 2.4.4 -> 2.4.6
Date: Mon, 10 Feb 2025 12:10:21 +0200
Message-Id: <20250210101023.1204349-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250210101023.1204349-1-leon.anavi@konsulko.com>
References: <20250210101023.1204349-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 10:10:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115396

Upgrade to release 2.4.6:

- Ensure all timers are cancelled when after staggered race
  finishes
- Keep classifiers in project to avoid automatic enrichment
- Move classifiers to prevent recalculation by poetry

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...happyeyeballs_2.4.4.bb => python3-aiohappyeyeballs_2.4.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohappyeyeballs_2.4.4.bb => python3-aiohappyeyeballs_2.4.6.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.4.4.bb b/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.4.6.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.4.4.bb
rename to meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.4.6.bb
index ad48c5990c..f66ff61302 100644
--- a/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.4.6.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohappyeyeballs"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 
-SRC_URI[sha256sum] = "5fdd7d87889c63183afc18ce9271f9b0a7d32c2303e394468dd45d514a757745"
+SRC_URI[sha256sum] = "9b05052f9042985d32ecbe4b59a77ae19c006a78f1344d7fdad69d28ded3d0b0"
 
 inherit pypi python_poetry_core
 
-- 
2.39.5


