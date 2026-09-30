Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 533F8CA5FC4
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 23:30:54 +0000 (UTC)
Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.119.1790811052516390684
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 16:30:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=X1JFEp0k;
 spf=pass (domain: gmail.com, ip: 74.125.228.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-86212a185dcso4048333b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 16:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790811052; x=1791415852; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nxhlrWANWqoz04sdtbGYAymA8tsm8ztJLFGBvLDAJC0=;
        b=X1JFEp0kIMn6fCDdbIawtaojA+ETKN1/w618mF7urGJxKTlri91XxPv8Up7K6IvKsy
         Jxw1pdh4WSmMBPiF1J/iqgGgV9NELHTj6RULzlYClkeRQAQx1u44bqTo3PzMGLlXQI6N
         8Nx80D9QcRQe4q1SEFy1Z4PeokSsx2ivdFs/CnV5XPQcT8mM/OLqw5QXZTT0f6cQaiUF
         Xzv5ZeXWKyDuT6OQGK63npdhK3KmDQSLGsegz/RiMmBmbnuifTMnxKYLYFsfTy9hHR2D
         ygitUbDU3+eDQXetkInrZCIQLpQ/p3/O4MAvzfimkEMsUJKxSxYO/sD20q39D8UM+67S
         rkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790811052; x=1791415852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nxhlrWANWqoz04sdtbGYAymA8tsm8ztJLFGBvLDAJC0=;
        b=wG9M/GGPwzQ+/3QiW5xOF4CI7H0c1pZvKOzMp/yQjHQxlqWeYOhbHMSy2cutoIV5am
         COBVh3Lusx0dyG2ZJwqyD/ve/Nj7a5sxHHt1znE6Vjn3Rpr0/45kDyq61Q8zXBnm2dcj
         kTMcv6qlmJejRxb2Xe+jeCz0NdF5id/wKCJ8lgrDK+DoA6XpSITk54+PuoKeCuf3siKj
         AGFdwNov5legbAFYhAP1OcV+vG9NRAnyNyKRIHM1VF9I46cSQtB1xwqER83ZihMdi8A+
         O7Gp00w5LLMvSpT5LR7LrOdHFwpQefRu2ctdI8AoOPr5kuoPQk1JAW/TBFYmbI05Ofuq
         pilw==
X-Gm-Message-State: AFuF++kCxYV9IHcagqpwLd3A0pUGNgC9skeiR1dSDd06AUwdAswO/HgE
	Bdt/JPdxJczY4BsO9B0eHnqHNQ0+EUxiaS1IlmvNsHAVGrdHHlFXZAZdlsyb5g==
X-Gm-Gg: AYBFou2aH1QM2h7B9f376amfb0G31MW/U6PLjXOKGsqypkxiD4XP96/JVDHBXfmbw9E
	xoqiLPpWA2sgxyTJ34LjFWEXP4eLyQQXvoP+Mwz5vSIle3dU7pkzckUNyWsG6WOQuosvbtkFWHu
	6oK9D99ge/LBMJolJQ41q5/gdwgnOG+VxzqNM9coh7Y3Mk8bOeSNwpAzpuQ5gbeNqJocxkCwvtP
	VmCa27VvdXw0PngUXihGMYmwbgncA7lM1LJN+rtfg3SR2fXbmOzFVtVwOgxZa+cTviDeHwyTPHZ
	Q1qfJU05OSLePu3wg+/sjaUWWwadvgwatHxxgsqJlQ7FWrFPxzBuVnIW+8DlrCFTJVJ2hWQRxV5
	TuMRety2m0uVLbM5dpdplR5G3Q1SZPDhu48Wuqef9N2ZaYSfixnuNsiD0tzSPu0p8V3XkJnuBNG
	dRv2sT6nNXPmSi/y0e+ZguF4qV0VQdavTfRjrXRXlq/O6rvhpTPoRkIRWSI4wbcrEoZxDZcPAE4
	1spCsQh/kiAtPOVvPGj+JE=
X-Received: by 2002:a05:6a00:2ea3:b0:886:418e:a397 with SMTP id d2e1a72fcca58-8874ad7d548mr2250770b3a.23.1790811051825;
        Wed, 30 Sep 2026 16:30:51 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8881589a0c3sm231249b3a.7.2026.09.30.16.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 16:30:51 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-filesystems][PATCH 5/14] ntfs-3g-ntfsprogs: upgrade 2026.7.7 -> 2026.9.28
Date: Thu,  1 Oct 2026 12:30:25 +1300
Message-ID: <20260930233034.659237-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930233034.659237-1-ankur.tyagi85@gmail.com>
References: <20260930233034.659237-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 23:30:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130538

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/tuxera/ntfs-3g/releases/tag/2026.9.18
https://github.com/tuxera/ntfs-3g/releases/tag/2026.9.28

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...-3g-ntfsprogs_2026.7.7.bb => ntfs-3g-ntfsprogs_2026.9.28.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/{ntfs-3g-ntfsprogs_2026.7.7.bb => ntfs-3g-ntfsprogs_2026.9.28.bb} (97%)

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2026.7.7.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2026.9.28.bb
similarity index 97%
rename from meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2026.7.7.bb
rename to meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2026.9.28.bb
index 083c135b83..795afa3b6b 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2026.7.7.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2026.9.28.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 SRC_URI = "git://github.com/tuxera/ntfs-3g;protocol=https;branch=edge;tag=${PV} \
            file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch \
            "
-SRCREV = "d327833ec1d5eb1358b6f2c37139f10a3460944d"
+SRCREV = "7f0f841fc52cf719106c5c93bafe465004e36816"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 

