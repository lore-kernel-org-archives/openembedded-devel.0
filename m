Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D3E7F589C3
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 12:49:45 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18674.1776948580969607320
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2026 05:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Qj4dXgWG;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a8fba3f769so29711515ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 05:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776948580; x=1777553380; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGmMMP4U9rVEDfwjqWUt4/8pFwvd8heztUThkaDY0/E=;
        b=Qj4dXgWG3git9ZekR1cX/60+vuiIJMCbFpJQBk7uXEW3pu3hByXS/gdoGPt1QKguz2
         1QbPf6xPdIrZkUzoBOktbjUx/a4cQzQATBc0RsdiZ23s+KyUun0wV5NOLfzY6LlfaRas
         O61a4AVm1f48CA3/f9EYKXATG6Tt9Da97WmVZUm0RHfmyFnpk+iPZF8zZxxIcVAjC009
         vawJVMZCXQcf1Ch0NVtyq0KOw5q+zbOLVvw4I44MogIGaggBMJ30CIpJbUnDLlIhy295
         QUlR2SKPVJmalrz6MWWIDhxqJWgjqZMBbTzCPXD+lyWrabgBeewRsz6ETN90Q4+O7HFN
         oBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948580; x=1777553380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jGmMMP4U9rVEDfwjqWUt4/8pFwvd8heztUThkaDY0/E=;
        b=oBhoDANqRHEfP6LmeWuKMBT9TLRGIQP0jTJXqFbvfGmN9PuV5HRaYucyjohqmFsm8L
         VS9O6v2/EaiUPLWkO9+gMYH4DzLPrxtq7h9O84QWUo3rpjUdzJZUdN7zUC1/IUYrhUHD
         8k9k1nprBsWCWDsmxndJzBcuqIK8XLlTMNllVuMXp9Ypk3i13S6/c/IAEB6KJeXdG57w
         +VRvjHBH7DJnFNAM64ni8MlVOu9FeAwjriWuaNiV7uyQqtmKuuNzJF0HQvB54Ekt+DEn
         PUKK87VNXb/tWPCDtL7J14qwaJKeBPSHUOrJWo2kPLBkN0CBCLAF1X9bAG29jU4TQMG8
         KAMQ==
X-Gm-Message-State: AOJu0YwG/SIx/02PIaipKpqygejjGMTmG3HMjVS92LX1nfIoZpnT0DfM
	sKPBh2PqiYC/173jzAF7rvMoG0zJGz6U+tQcDGsSrZzIr4cPkB7lf0mSZlsTrnXS
X-Gm-Gg: AeBDievoJCLSTwDUsGEkL9teQKX80pg91pyfHwqzi3sV+DJKI4KByPC7q58J5yQ6Gxt
	AQJNJQrOtB6qsKd9YY9Uh9jTljvIOFQpq0DCGxls2viYQobAybUX8/dCvxR8ebPI10cplOeytld
	3+Dzim1fdSh+6+andkDUcC+8xS8w2aTfiE9SVWBrBR/0olslSwi9Q/uwMIqxB1yVxhY7j8Wzl1U
	BiS+60228DF9gC3uBGkj26djp8Z4IUMXJJMLzj+bQUHwQOe3KAXz70qN82EwhpyN0ewB/MHco28
	fafyin8vyOwbmEqpZQ2ieC7/0PFpfN29sBwvHtEZbIYyGkJvuiRPk/LGR3PXI0LMoqbHMHQLwzZ
	DB0UngOhMVgO0N31F5AoycFFHQF4EB5RgWeD+Vsdcn/84STvcxuqQGXAcNxoDlqrOJsgORhdalt
	Oj+1OBdq6QArEqI4YELrKc/r0Zvwi+msw6vHntPHE5feZnHKQ=
X-Received: by 2002:a17:903:3d43:b0:2b0:5d60:7f3f with SMTP id d9443c01a7336-2b5f9ee90bdmr205996165ad.16.1776948580157;
        Thu, 23 Apr 2026 05:49:40 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa14487sm204043415ad.18.2026.04.23.05.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:49:39 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 13/19] libgphoto2: patch CVE-2026-40339
Date: Fri, 24 Apr 2026 00:48:11 +1200
Message-ID: <20260423124823.1983261-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423124823.1983261-1-ankur.tyagi85@gmail.com>
References: <20260423124823.1983261-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 12:49:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126589

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-40339

Backport the patch referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 2e3be1dddc215192ff277740271d65cdceaa0b18)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gphoto2/libgphoto2/CVE-2026-40339.patch   | 41 +++++++++++++++++++
 .../gphoto2/libgphoto2_2.5.33.bb              |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40339.patch

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40339.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40339.patch
new file mode 100644
index 0000000000..b00ac72772
--- /dev/null
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40339.patch
@@ -0,0 +1,41 @@
+From 585e8113b541469347d09c341c2e8b468b431adb Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <marcus@jet.franken.de>
+Date: Sat, 11 Apr 2026 10:50:47 +0200
+Subject: [PATCH] =?UTF-8?q?Fixed=20Sony=20DPD=20FormFlag=20OOB=20Read=20(C?=
+ =?UTF-8?q?WE-125)=20=E2=80=94=20MEDIUM?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+ptp_unpack_Sony_DPD() reads the FormFlag byte via dtoh8o(data, *poffset)
+without a prior bounds check. The standard ptp_unpack_DPD() at line
+686–687 correctly validates *offset + sizeof(uint8_t) > dpdlen before
+this same read, but the Sony variant omits this check.
+
+CVE-2026-40339
+
+Reported-By: Sebastián Alba <sebasjosue84@gmail.com>
+
+CVE: CVE-2026-40339
+Upstream-Status: Backport [https://github.com/gphoto/libgphoto2/commit/09f8a940b1e418b5693f5c11e3016a1ad2cea62d]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ camlibs/ptp2/ptp-pack.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/camlibs/ptp2/ptp-pack.c b/camlibs/ptp2/ptp-pack.c
+index f90d2a5..28648a5 100644
+--- a/camlibs/ptp2/ptp-pack.c
++++ b/camlibs/ptp2/ptp-pack.c
+@@ -833,9 +833,10 @@ ptp_unpack_Sony_DPD (PTPParams *params, const unsigned char* data, PTPDeviceProp
+ 	   code or the Data Type is a string (with two empty strings as
+ 	   values). In both cases Form Flag should be set to 0x00 and FORM is
+ 	   not present. */
+-
+ 	if (*poffset==PTP_dpd_Sony_DefaultValue)
+ 		return 1;
++	if (*poffset + sizeof(uint8_t) > dpdlen)
++		return 1;
+ 
+ 	dpd->FormFlag = dtoh8o(data, *poffset);
+ 	ptp_debug (params, "formflag 0x%04x", dpd->FormFlag);
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
index 440b78dffb..b8d6aee3c1 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
@@ -17,6 +17,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.xz;name=libgphoto2 \
            file://CVE-2026-40335.patch \
            file://CVE-2026-40336.patch \
            file://CVE-2026-40338.patch \
+           file://CVE-2026-40339.patch \
            "
 SRC_URI[libgphoto2.sha256sum] = "28825f767a85544cb58f6e15028f8e53a5bb37a62148b3f1708b524781c3bef2"
 

