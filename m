Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1105AC41513
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 23:55:53 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.1447.1718322947919534460
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jun 2024 16:55:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JbxpNvEL;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f8395a530dso15001115ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 16:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718322947; x=1718927747; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iT0PXDPJVMPdORZHBQq0YfpBopT7S3nMr8ZyK7omhXo=;
        b=JbxpNvELRrpJla77rXYOpoWcMf3ISsRm1TDlIGg0slkOKG3ObWjO1RB8uQ3GgkaVQb
         F/qzolElzYQOh9tAEV5cEFtQ7Ru4yR1L4hV9zkD2+PHNq/MCm9kyhiymHVyq6C0rezax
         G3nx8V6qzsdSY0iXo8TqFI4TebGBazLTDy30UVAGFXTDWrPustranHnmix21NKzHiEMv
         H1VnN+ZJyAM/ocYs9zk77HctwmstGaRwz9Tdptr2X0NPojlMwsNW6Uw1xtgNhiaV7tu8
         fSmnHMMqdK2qQrttbUjJn3iOZq7VkMgbuVtQkfiwtd5RxKhVPh89qpu6J2dRTJM/DLXi
         V2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718322947; x=1718927747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iT0PXDPJVMPdORZHBQq0YfpBopT7S3nMr8ZyK7omhXo=;
        b=QtIF3foO8aKJHmQwuYkbONslKjQ8jG25bgzxMsDp7nFR6heahsaLUX0YuMZEhlXZcl
         lzzqJPWl+9Z+f31XYLuqQxBN0Ce3pnfdUy4HwRMWs/si/nCtNuRUAzqBo1GoZGYqyEZL
         svBc4QrQv2Ds9W5tIIbJ//4F/cU++UlPunoxt78NJ+yIwkMI+J5CB0GgvocqcQQQv5tb
         gOy3QbLcdae67Sg8RoSR8mV1x9VaP8daG1rW3Uv872eWs5JQihKVGXmc8xyvwmukoqdU
         /mn6R7VJg9dTPy5iFdmVmmQfLMzSgm+Zwo0NMWoWmGYbzVsBCW8CZSPUv6ifEmer6Qn5
         aKSw==
X-Gm-Message-State: AOJu0YyWV98OTZhpzB9VSoJR68bskKe4vw41Sm6NE9IWj3yKJVr6L89A
	m8rg5W8OFh9bhNImc3D2HyWw9h8szuMYopFPrJvCfuhu1N8+vBc3irtzkQ==
X-Google-Smtp-Source: AGHT+IHyXUa1ldUO++tV8FRvscO+YIecGS6v0KWEWn7djFddLgz1MOU7wPwuG4aac50cc6eOzc5YbA==
X-Received: by 2002:a17:903:2312:b0:1f7:3e19:6d9f with SMTP id d9443c01a7336-1f8626d2481mr13662705ad.19.1718322947087;
        Thu, 13 Jun 2024 16:55:47 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::91d2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855ee804fsm19951285ad.131.2024.06.13.16.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 16:55:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 2/2] aravis: Remove AUTHOR field
Date: Thu, 13 Jun 2024 16:55:42 -0700
Message-ID: <20240613235542.2996129-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240613235542.2996129-1-raj.khem@gmail.com>
References: <20240613235542.2996129-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 23:55:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110897

this field has been removed from recipes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb b/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
index a4386e809c..950ce25363 100644
--- a/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
+++ b/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
@@ -4,7 +4,6 @@ DESCRIPTION = "\
     It currently implements the gigabit ethernet and USB3 protocols used by industrial cameras.\
     It also provides a basic ethernet camera simulator and a simple video viewer.\
 "
-AUTHOR = "Emmanuel Pacaud"
 HOMEPAGE = "https://github.com/AravisProject/aravis"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"

