Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A05C61DCD
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 02:53:54 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28016.1787799234033647901
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 19:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Iit+0qE0;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8534d507f59so1864739b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 19:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787799233; x=1788404033; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2o26WmKpt+gQT4cP+4hb3YAViY+vpcLG+rRHaeGBHlU=;
        b=Iit+0qE0inrnZcBaHEfk7qkNf3T5TzRP2ux6hNbb60OSXzzpsa/BLB7347V/e2TS1N
         S2X9FPySRHKgWIatPvSB0aIJl7866eVbjaG0PKbSB/Dd3EOe2/PXWVwk1840gJoLQ5em
         1WwawSr7Lg/q1YsKPJQzED9QDusWZuCp9WGNmMqAs3PJxWQE/kuyy9/YFTUsiTVSIKgA
         39dHuhHWr1WJ6rbxsnfGjvK8kF0X6T8CcdChg3XBR7F5qojHjd67aWBaB8VMbAM22rh6
         5H39xnWGb+rMypLdhRsyxJSuI5pd3MTup1bl8PvHDF2f1lSYxOTHfkuzveaqXn4y2UyA
         yEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787799233; x=1788404033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2o26WmKpt+gQT4cP+4hb3YAViY+vpcLG+rRHaeGBHlU=;
        b=S+224MYC556NYjVgP/p0vjdqxA7WduKyQp1qNehKBS7mHr2jnqEQEyKFAUBRXdNOos
         nIRNdj20z3NHe7JGHNyW+mTuig6KX1UQMNMY4XgiWFI5nY0qVXd4xqhHndf594yLfBGC
         me9ECCsRSSkbQX1vjImSpcKI63+Q6+jjlKNT/vKAe3Tc9gfh7GSNoAzXk4Ygr/QM8ryd
         sCrACpk+RGJFDnafYdjIxDiMGANzLwEBF11Bof5tGhMFRCrLdGFYeLKapBNioMOPwyQo
         UQM+TQltT/Mhv88Y0i/LFj8CBExSsbCcAAwIwWNyUtWPMmOjgi68B40KCnE05UoAq9i9
         WheQ==
X-Gm-Message-State: AFuF++k3iTaT0DiUQD8e9ip5teD/Rd52F8oXqG05z1diza09couLDGVB
	qJ0YyNXGHA8mYk9e4DKWPXBGWnhHPHqm1qiLoVVe5q5ps+tmKxHUenitARMscw==
X-Gm-Gg: AR+sD107AvN2opqecVx0yktVGhyHNoX1lmlshGG8742ZqSDDCln3WWuklh8KzGjGmmh
	VlyXbt/qrIA5A+xbObGXezc4vJoufBj/S1AQlhlVFGvdy0gAyJM00S9YGdwy7a0dzMNcJVoHNDC
	CtcATUOeV2th+oVRqbUKEB3Ytz3iBj7dUWg8ZclrRWmYAhfNoW3ooykMqfWXr1HPEWGDzEdD8Ep
	tTclBXH+JR5iWOspfR5LDpPX49VGEYaXiOSIImfVDSL95RGqQuf8j/TGR3E3IUaFtDc7NI85Vvf
	SHJGgWJq4xuCLAOzHtoDhQ2bpM/hB0QO5SjGsGzl01IrbxDaOS2qmotP3BIZ/1dg+yoSfBwRdeF
	5anqoZPnlHsBEVcO/r9AO0nhNl5qEsfwJMaA2lUSZ2be4omnBjOTvlA87oastbAroR5jY4hdp67
	j+0o7zdr2xUlB03jqsi90vDD2vhrhamUnnVUvBHwJb8BtlORW4mqdNz33zj0cqhCCXuEDcgvf7
X-Received: by 2002:a05:6a00:2da0:b0:853:5152:a3e9 with SMTP id d2e1a72fcca58-853744affadmr21392228b3a.11.1787799233396;
        Wed, 26 Aug 2026 19:53:53 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8556db7ab0esm5787b3a.48.2026.08.26.19.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 19:53:53 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 9/11] libsrtp: add UPSTREAM_CHECK_GITTAGREGEX
Date: Thu, 27 Aug 2026 14:53:21 +1200
Message-ID: <20260827025323.1433982-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827025323.1433982-1-ankur.tyagi85@gmail.com>
References: <20260827025323.1433982-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 02:53:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129529

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version libsrtp
...
INFO: Current version: 2.8.0
INFO: Latest version: 27
INFO: Latest version's commit: 8ca9b9e50743a9d2192dba5e26183121adb33d46

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-multimedia/recipes-support/libsrtp/libsrtp_2.8.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.8.0.bb b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.8.0.bb
index 19cb9ae061..c8db49c8b6 100644
--- a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.8.0.bb
+++ b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.8.0.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2909fcf6f09ffff8430463d91c08c4e1"
 SRC_URI = "git://github.com/cisco/libsrtp.git;branch=2_x_dev;protocol=https;tag=v${PV}"
 SRCREV = "24b3bf8f19b6f5ab4cd2bcceb4f4064efca86fd5"
 
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[nss] = "-Dcrypto-library=nss,, nss,,, openssl"

