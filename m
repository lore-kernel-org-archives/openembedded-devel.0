Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A41C531DC
	for <webhook@archiver.kernel.org>; Sat, 10 Aug 2024 15:38:40 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web10.7845.1723304313085497178
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Aug 2024 08:38:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DzHckFrC;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e0ec934a1fdso537819276.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 08:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723304312; x=1723909112; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqnkeyVLMZ6IUrtnOoKqeH6ZO9Ug5Q0x4tDhx8zVnvQ=;
        b=DzHckFrC3iqDU1TTRgx5VRAhJV9RIrKaFq0ecx9j6NMWY/Hy8f/RLkr9QKf/K0xRDt
         DBMG3ezj4VHO9OJiKlj+wrAh7MGzE/U/+KEJ2ELt3mzyYFZGD+RiEyKqNXstyKHxaTTX
         1T9xTjgs2ok90bBfm0UEmYPleiOmp37S1qfh2V7AR88N3aprdAmYY3o98MU7qun/eX5K
         UQ0M2DkwUBEVk/nFbCrBWuW2+6KWjYAzKk3S9qHCCvmNQkyanZ/LyjF7Htw2np1y4/i5
         S0QvuiOQv8Bl0p5Yw9IU/o/cjxZ3R89Y5DVR+2zMhT/jTja1+LsdZdHDnAcMZ06rNbpK
         mC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723304312; x=1723909112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IqnkeyVLMZ6IUrtnOoKqeH6ZO9Ug5Q0x4tDhx8zVnvQ=;
        b=Tzv0AP+FGC/WUf+GKIH0TM5KtUjaq5VGJI0NCFjQQMymXevK0vTIUup4jCytJjIci4
         fIKBdomImB5oyo/ee0vRONgHuxkuMbQVZN2XGWchV/nszFqKeibIcNKrV4RJtshJkKAP
         /hPrPE29W4x4Pml7k7GaXHb7H95NSXO2ix5U4tuT3VoFR2C0YWUOISdY2EczWoM3gUPv
         iKtpPrRFC65Y88n+JTDwA3rIBI06APcEC1LoX319fv0x6PVJocXiFrfRULwgPCAfcZik
         t+sQwOARUTvi+mvs+lYAagyP/jGifRYkmRAnvRDOwh9jd9bHtEBMEY7VxWq5GuXECIUY
         A53Q==
X-Gm-Message-State: AOJu0Yxsosmrhz6bEcInLQQmJkRUkseD3Wb3z86TfnEyNopjwHKk5hqr
	sZIDVvgu/s6IjV11GpwaVLMxJaH5uFiQ8sW1ZYaUqjQ0qp4leNH9Ia59ZA==
X-Google-Smtp-Source: AGHT+IHXRliWKG+E8XkQuwHVY+JLX3Eb66atBR9mev1l/JSaw4mPkrFWnHVZORA8SFjDfztERdq+lw==
X-Received: by 2002:a05:6902:230d:b0:e0b:ab0b:6ec6 with SMTP id 3f1490d57ef6-e0eb9946e2bmr4812577276.19.1723304312032;
        Sat, 10 Aug 2024 08:38:32 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:ad:eb2b:7538:7504])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0ec8c0726bsm382526276.39.2024.08.10.08.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Aug 2024 08:38:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ninette Adhikari <ninette@thehoodiefirm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 3/5] imagemagick: Update status for CVE
Date: Sat, 10 Aug 2024 11:38:28 -0400
Message-Id: <20240810153830.900538-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240810153830.900538-1-akuster808@gmail.com>
References: <20240810153830.900538-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 15:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111747

From: Ninette Adhikari <ninette@thehoodiefirm.com>

Update status for:
CVE-2016-7532, CVE-2014-9822, CVE-2014-9823, CVE-2014-9824, CVE-2014-9825, CVE-2014-9826, CVE-2014-9827, CVE-2014-9828, CVE-2014-9829, CVE-2014-9830, CVE-2014-9831, CVE-2014-9848, CVE-2014-9852, CVE-2014-9853, CVE-2014-9854, CVE-2014-9907, CVE-2016-10062, CVE-2016-10144, CVE-2016-10145, CVE-2016-10146, CVE-2016-5118, CVE-2016-7513, CVE-2016-7514, CVE-2016-7515, CVE-2016-7516, CVE-2016-7517, CVE-2016-7518, CVE-2016-7519, CVE-2016-7520, CVE-2016-7521, CVE-2016-7522, CVE-2016-7523, CVE-2016-7524, CVE-2016-7525, CVE-2016-7526, CVE-2016-7527, CVE-2016-7528, CVE-2016-7529, CVE-2016-7530, CVE-2016-7533

CPE is incorrect, the current version is not affected.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f8c70167e6a00ad1d2d8ee5675e2c84d59f2dfd5)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../imagemagick/imagemagick_7.1.1.bb          | 42 ++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index 8dc3cb267b..5407c4e400 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -100,6 +100,7 @@ ALTERNATIVE_TARGET[montage.1] = "${mandir}/man1/montage.im7.1"
 ALTERNATIVE_LINK_NAME[stream.1] = "${mandir}/man1/stream.1"
 ALTERNATIVE_TARGET[stream.1] = "${mandir}/man1/stream.im7.1"
 
+CVE_STATUS[CVE-2007-1667] = "cpe-incorrect: CVE should not include a CPE for imagemagick"
 CVE_STATUS[CVE-2014-9804] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
 CVE_STATUS[CVE-2014-9805] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
 CVE_STATUS[CVE-2014-9806] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
@@ -118,7 +119,47 @@ CVE_STATUS[CVE-2014-9818] = "cpe-incorrect: The current version (7.1.1) is not a
 CVE_STATUS[CVE-2014-9819] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
 CVE_STATUS[CVE-2014-9820] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
 CVE_STATUS[CVE-2014-9821] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9822] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9823] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9824] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9825] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9826] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9827] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9828] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9829] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9830] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9831] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9848] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9852] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9853] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9854] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9907] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-10062] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.1-10"
+CVE_STATUS[CVE-2016-10144] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.7-1"
+CVE_STATUS[CVE-2016-10145] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.7-1"
+CVE_STATUS[CVE-2016-10146] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.6-8"
+CVE_STATUS[CVE-2016-5118] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.1-7"
+CVE_STATUS[CVE-2016-7513] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7514] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.1-0"
+CVE_STATUS[CVE-2016-7515] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7516] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7517] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7518] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7519] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7520] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7521] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7522] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7523] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7524] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7525] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7526] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7527] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7528] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7529] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7530] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
 CVE_STATUS[CVE-2016-7531] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.1-0"
+CVE_STATUS[CVE-2016-7532] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7533] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
 CVE_STATUS[CVE-2016-7534] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
 CVE_STATUS[CVE-2016-7535] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
 CVE_STATUS[CVE-2016-7536] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
@@ -128,4 +169,3 @@ CVE_STATUS[CVE-2017-5506] = "cpe-incorrect: The current version (7.1.1) is not a
 CVE_STATUS[CVE-2017-5509] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.4-4"
 CVE_STATUS[CVE-2017-5510] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.4-4"
 CVE_STATUS[CVE-2017-5511] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.4-3"
-CVE_STATUS[CVE-2007-1667] = "cpe-incorrect: CVE should not include a CPE for imagemagick"
-- 
2.34.1


