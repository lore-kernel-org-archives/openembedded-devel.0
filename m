Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F12C4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 15:26:39 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.24430.1714404395090468901
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Apr 2024 08:26:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=SUgnnkBK;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.208.180, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2db13ca0363so73541291fa.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 08:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1714404393; x=1715009193; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1s220a3fkeKaYPeNwbl2XAhY1onC2Yh+Od1hAiIBADw=;
        b=SUgnnkBKvzjRzr64O8vpGECTkoWZg82ZAD5PJkKahT28oNsxd4H0Z8a220A1uGCom5
         vha2gDXhUWVehyGFI3ThDA9+lsO+rI/Z4Lm0ps/WIHnO8fTmMeLVmlYyh0bkZCLBJoIG
         XsIof8ENqLQY1AOjPlq7nQ2NtRAoeOW8RyaJ2o+UnK9+M9WaV5MYftLU+9aYS2uqcs8g
         Uc1VLGgCi2pAXZLOfhTdsjBBsyW6IaYWN+m6x8WRMe+Fmg3OIEm2F28sKKM/fcdFHZBQ
         R3Su04h+t/FzMWgBGx+uGGSfhB61WuGOCQqXj3/Osgui2w68pZsKJEgCBTAe/5Ait0DG
         cutg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714404393; x=1715009193;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1s220a3fkeKaYPeNwbl2XAhY1onC2Yh+Od1hAiIBADw=;
        b=l6EG7FMktVh6KkscrRktP2G5IRAA8DsX5aeD0e0GQLyTlgYIxTDcvw/NZCtbeE5Cty
         TP7h1TwLzClXRVC3EbQfCYh8/tIECc7NzzmJxFtdpz32qA+S0c9aGyWJHNgYVbuGFGii
         wxhRA1V/BDSwmwXhwfdH1waAZG81ACr+DOYJC9j/Hre6ZQozrJSjUJvjyQFiiU3D/ywc
         IUGtNdhkQ42c/RMonWusJGB7qjpxJF1D9zksSrLNhnUBgOnkW/+90haQWel7uD+UuCQ4
         OQDAgDUo+Fj7ZH+14a7lM+mGkLAzLUveBmwBnK8q8Prl0ndR8y8cPBTKLGqNiNVmRffl
         bPSg==
X-Gm-Message-State: AOJu0YwTdOao0afocE1bbD6Ys1Q7jslwHW+0n+95kv+KXRY7iZWhIjLG
	dJPAzfuEbCqAiDWMfgZ6ELCV2lO5v6CnkYouvSngXgI/ic9d6FCqgui8co38DF+OJPC2DVl4Gdi
	ZrSM=
X-Google-Smtp-Source: AGHT+IGIeC50KGDJGlVIrV45myw5qEYaxm7+kmhkIzW8puPlshoGukB/rQ/cZayadiYQ/zpKobr7ig==
X-Received: by 2002:a2e:2203:0:b0:2e0:3ad2:b371 with SMTP id i3-20020a2e2203000000b002e03ad2b371mr3361686lji.25.1714404393015;
        Mon, 29 Apr 2024 08:26:33 -0700 (PDT)
Received: from Ninettes-MBP.fritz.box (pd9ebc533.dip0.t-ipconnect.de. [217.235.197.51])
        by smtp.gmail.com with ESMTPSA id fw24-20020a170906c95800b00a58ff4d4869sm1503265ejb.123.2024.04.29.08.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:26:32 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Peter.Marko@siemens.com,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH v2] open-vm-tools: Update status for CVE-2014-4199 and CVE-2014-4200
Date: Mon, 29 Apr 2024 17:26:30 +0200
Message-ID: <20240429152630.29780-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <AS1PR10MB5697918A4420D720F71CE2E0FD1B2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <AS1PR10MB5697918A4420D720F71CE2E0FD1B2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 15:26:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110189

Current version 12.3.5 is not affected by the issue.
Affected versions: Up to (incl) 10.0.3
---
 .../recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb
index 6696e552c..82aab051f 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb
@@ -120,3 +120,5 @@ python() {
 }
 
 CVE_PRODUCT = "open-vm-tools vmware:tools"
+CVE_STATUS[CVE-2014-4199] = "fixed-version: No action required. The current version (12.3.5) is not affected by the CVE which affects version 10.0.3"
+CVE_STATUS[CVE-2014-4200] = "fixed-version: No action required. The current version (12.3.5) is not affected by the CVE which affects version 10.0.3"
-- 
2.44.0


