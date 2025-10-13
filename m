Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F42CCD185
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 18:51:21 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.52876.1760381475619672427
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Oct 2025 11:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HBjB+bDV;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4256866958bso2550727f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 11:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760381474; x=1760986274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TBw+7Su8FafgdeU5dTf6+mqPrB2Qgfp1NvZ6Y5YS/3E=;
        b=HBjB+bDVt/19sXHywa9iyUqHabxqUgEr1WguhGp2IpkGVISZlFuarPDrepLQv0mP4m
         duaHr89s4/ihkRQamDrt+b2yqBGnPFi+inimndh/BKDImXGel9mdg1H8s67eQQs8WDtL
         /bS3qL6KjQNbVn/JJG6Ku7YV2AQ3yCxtpQ1LtfejilsiMDP7oifA8YUzk3cdKQiFUruN
         qHeNg2/3uVHSj1egCjIuwJGkn5ccC19VrjZfE82Ki5imtaOoNcoJksDVXRQG+k0JlLyK
         eo1A8qDINzcWNnOLRFq7uDrZUCOb1ofhjlD1SkiqI3mBt8TYk6yxIcSljOVGaivtWmEO
         N4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760381474; x=1760986274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TBw+7Su8FafgdeU5dTf6+mqPrB2Qgfp1NvZ6Y5YS/3E=;
        b=BAI1FtbWYLclHghSWDjU/kFi8HLAIc3V3rNwbxrRsuAgp4mwuNw0JAMr7x6HgbbxRb
         MNcuvW/rTGmeg/AyuagHqsD/Tg5KS1C+zoRk8RObKNCpIRMDbScXw0UKEJVrjaWV6RQh
         9bwNUhNF4DfQQtC2pNdbXNP1ynjyJjMOjRgnNcVD4mJbqu6CM+zAKVV/baFyeJHQVpIh
         FPqJngPBAcm5oNxcy9alEP/gu7vDjT2MBju0276sIQv6T71+lVZ93k8EMy6WqEuApn/B
         u9gg9KqMUirheCj56yZmwGzKimUSkqX6nRzKuNZyrYaR66PLk/RyE2nvdXdg3A1lx8aU
         zYEQ==
X-Gm-Message-State: AOJu0Yx9tLYIZ64+BJRYAwX0TSJrqg5dsWesP8Gd3reNAr76i1d2MDKV
	eny4osq70gqcYpbticw7UbZ02MUq9bS8WoZqsNcBAgAFG1nmjxwBIfda5E5RFQ==
X-Gm-Gg: ASbGncsRZmi2FT4BgFYW8OURIeHG3kCxICvSooknNRFh6bJ1eVkJNARPI16DbP//t4Y
	xLAymf6wb7hxQ3CoWBoYXLsI18296HQwSrP9X30DK8oOLlL7NwptlSblFqcNvUHhBQrNDgfi5xK
	fVy6gI4G2teSVVsoberrvDvQi7FhDsk5tq5UMgtdZfvIg2BRnPoKNvSf7T2dF/dd2pReLbTzSE5
	UKYAVPBQ2UgMEyvb/U9LHrGql2JEqaQDLLpp1puHE3MQtPmswfxqObmcO4uZuD7FKOtn8aFTIVZ
	OJdIRRAvSPys4UMnC4NKWS/S1skbQdaWCj+4+7S7kVAuL/c45T+flnnWbfP84cMHRV6czFNEUxb
	xLwCDNgyVR5/ShFkMiGfH86V1ODdpJBHS3SaGUHc=
X-Google-Smtp-Source: AGHT+IHCd14zMugZh0JbndiV8nwbYeGGDzK523r1LdiM8CkQujDdsjg0EkQiI3oXVWOFHM6X2KS6Xw==
X-Received: by 2002:a05:600c:609b:b0:456:13b6:4b18 with SMTP id 5b1f17b1804b1-46fa9b106cbmr169657515e9.31.1760381473663;
        Mon, 13 Oct 2025 11:51:13 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e10e8sm19514955f8f.39.2025.10.13.11.51.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 11:51:13 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gimp: ignore CVE-2007-3741 (again)
Date: Mon, 13 Oct 2025 20:51:12 +0200
Message-ID: <20251013185112.482125-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 18:51:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120546

During the last update of the recipe the CVE_STATUS for this CVE
was incorrectly removed by me due to misreading the version info.

Rectify this issue by re-adding this deleted CVE_STATUS flag.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gimp/gimp/gimp_3.0.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.4.bb b/meta-gnome/recipes-gimp/gimp/gimp_3.0.4.bb
index b04fab67ef..e2ad29eb98 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.4.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.4.bb
@@ -133,4 +133,5 @@ FILES:${PN} += "${datadir}/metainfo"
 
 RDEPENDS:${PN} = "mypaint-brushes-1.0 glib-networking python3-pygobject"
 
+CVE_STATUS[CVE-2007-3741] = "not-applicable-platform: This only applies for Mandriva Linux"
 CVE_STATUS[CVE-2025-8672] = "not-applicable-config: the vulnerability only affects MacOS"

