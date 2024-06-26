Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2DD6C41513
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 14:36:41 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.28428.1719412595120206446
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 07:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=UXpJGwiB;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.214.170, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f9d9b57b90so45733195ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 07:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1719412594; x=1720017394; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q/HWygh0szMbIBBCCuDILLnQCQ4nYKbHCaR9Eg/glKw=;
        b=UXpJGwiBYkUC/gtb8E7L0DOzhvhgFOjIaziL7IzrhWwmGZn5l5v7Df0vNbLNzH+3DE
         mht0Hq+YMxApcLCIMeK1IhKZvNxn5b2jFfrOpr6VTe0mThm9zSSlVu1bKCvAICMAkHts
         U11VnmEw4+ehFpsI73SN+/x5fo76AeZTpbPaXIxPElEmm8ataoki1Bw5BbRg16vqOHYa
         l6TwzlIrYq9zsQ4f/sPRsS1CSbRgLvUGCLCnHkn+m06zPirfhHtqA/7ZClsehdwAocOe
         D8rYZ+WgZvY6eGgVMIwSLNyR82pMvB0kEwi2BMu/aYT7b4AoBVNjw5P7SGMo+lbzihZa
         OZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719412594; x=1720017394;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q/HWygh0szMbIBBCCuDILLnQCQ4nYKbHCaR9Eg/glKw=;
        b=ceSynnnNDh6wth5rngzYOZAgI4yE3yNvyYkzGRVp3dBNL6rdRxUV4intYjRKJbYX2J
         IUm3rhYO2WKcYh17me/70gOU/FuK5Plod+C3QSHdYQw/BRYawURIXBPMQYhKyTY5Q4ly
         No65D+wj6BVhEZ7SVMRAee2JBNHWHBMMPaiPb+JovvVdNHTD7EDcGkPnzbyqCKcEmktx
         aR1d95foVaGLfd+PghYy97UwOunmBJYLKM9srekS0KGjAH44ZsLrlSFE/XgY6UXLwPD1
         ATeyPDbcLS3uVFJhnEoDR2PLnJZrj+RGXZuwRX/Rs58x7+VaIk+Y3qEwFiQlhWpEzI8G
         dLiw==
X-Gm-Message-State: AOJu0YzJlyGnVRL0kjS4hvS4sO9/DLxw8c+qsLiA2Hb842VR8sj1fc3+
	VWNH8SAYRV/zzwAwHzvX1+9goZWLOf2dC4mqHFLttUK476xgZ7SYiHyVrdQPrWJsY9RpUO3RSuQ
	d
X-Google-Smtp-Source: AGHT+IFUkh9BUpg5WsS6PmYnaluaUihaRyZ8NqFfHJEHOkA+6lkkjN/Yub19CH4gNopA/Lsx0CbErw==
X-Received: by 2002:a17:902:e542:b0:1f9:ae6d:5697 with SMTP id d9443c01a7336-1fa23ee2607mr148760765ad.35.1719412594521;
        Wed, 26 Jun 2024 07:36:34 -0700 (PDT)
Received: from localhost.localdomain ([50.54.151.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fa3229f936sm63871445ad.85.2024.06.26.07.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 07:36:34 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 1/1] links: CVE status update for CVE-2008-3319
Date: Wed, 26 Jun 2024 07:36:29 -0700
Message-ID: <20240626143629.84191-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240626143629.84191-1-ninette@thehoodiefirm.com>
References: <20240626143629.84191-1-ninette@thehoodiefirm.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 14:36:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111100

The recipe used in the `meta-openembedded` is a different links package compared to the one which has the CVE issue.
Package used in `meta-embedded`: twibright links http://links.twibright.com/download.php
Package with CVE issue: Maian Links https://www.maianmedia.com/

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 meta-oe/recipes-support/links/links_2.29.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/links/links_2.29.bb b/meta-oe/recipes-support/links/links_2.29.bb
index e3a15d181..311d84e48 100644
--- a/meta-oe/recipes-support/links/links_2.29.bb
+++ b/meta-oe/recipes-support/links/links_2.29.bb
@@ -9,3 +9,5 @@ EXTRA_OECONF = "--enable-graphics \
                 --without-directfb --without-pmshell --without-atheos \
                 --without-x"
 SRC_URI[sha256sum] = "22aa96c0b38e1a6f8f7ed9d7a4167a47fc37246097759ef6059ecf8f9ead7998"
+
+CVE_STATUS[CVE-2008-3319] = "cpe-incorrect: The recipe used in the `meta-openembedded` is a different links package compared to the one which has the CVE issue."
-- 
2.44.0


