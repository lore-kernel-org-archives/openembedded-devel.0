Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40EF7F589BE
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 12:49:35 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18666.1776948569299219958
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2026 05:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eO/jDaYl;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ab39b111b9so27081765ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 05:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776948568; x=1777553368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIM7icUHErCSROTJJwtt5d/U1crUy1umV20jPba6VXg=;
        b=eO/jDaYlPZ5dkLQYUUBpUvE71PCJHCMXN4MUa6Dc5c5ZL60G8D2m0XzqDWssHkgsB7
         usXJMECZ+14t0RCwVSgpAwV+HVBlf7VZPC5FrtpjIkfEzLhwbHP1V0E4zMMyvs7VEvu6
         5k+OS4exNL3jIgBXr5vQ27ZgnYEC5LDEWvClWGoVDZZkO4sSWksdK5BoSNWXywz/fHa3
         iuBHm8Fg8DrbxpZ5h0+xCl8pVFLOvl76XBRIkghg8D+vTTH2CY+nIAVj8EtSjiExj1mJ
         u8Nb+LW/OH7+BxylihCUbJeE8EG/yVYntacxW1gyhxNdD/jI+RLB336JA1JwuNKd4+l7
         cjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948568; x=1777553368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XIM7icUHErCSROTJJwtt5d/U1crUy1umV20jPba6VXg=;
        b=U5ZSijcHj7te97e1C7LSm4x7mTY3/l/P2t8Y7Mte4+ssumcDCCcY4VvzcHoKSa+4eX
         QpEc4tELAdeeTi6nbRQAAFBO8YDqywN52z0sr5yZEYMt951IJtfAxd/lecolcsRf/6QF
         trd9gBs/8F2aWpYTPObVbAy5Ox5RKuHUz5z34ZfUPQq7kfbyjJxU+t7ws3I4ylkINPBe
         0rZC8JycFoAnvu9NVD0I5PTDIOi+dPY4bXhFL5K/JCeKJyYmSLWPtmn9xibvFRJm3gAF
         ev0bVyOIc8axxBM5p0uo141s+a/1sxHHmnWEWbWAtrW9aWc/ec5Wb+T/0vGQieUu9fuQ
         vABQ==
X-Gm-Message-State: AOJu0YyF2YrytuzhMTCupGFCUeInsLHksc2C1b5R0Zbg1Uptwxuitzba
	xHF/ne3BzPN8pJsaW6QmpLeNoqAWqkeYdYeKmPEdNzj3DEqthd5qhfU74GY3eTXP
X-Gm-Gg: AeBDiesQ8f6WbLoWji+RzfCDYQkV5XzRCvxP/NEzsD68ra4fW26QNxryqAbP81s52KH
	sYPp7/4sHk4EhdrMEfRXytHYBG9s23ciS9w/386pocJzePDqjFvgs99RJCIZvV/hCUkt+2Fz2ON
	BIhi0al8Y7FzUWUHKJ2ULmbC+y6T+TK/tpsC9G6JiCYK0kYOGfYtFhblin5bHNjpsj7DzuCu/fL
	DSBMSkccZBzhHCEse6JS1FYmK9cwdSEfFlx/hDAtItaufHDAPtZAoSMYWcu5Qq4L1YW5+CNqr4N
	+4IRbQBB7v2/L6kgJBVFu1p6TWeuSDn03vPEFJd8OxNkvZ1r+No/M5nMAoPqNC2MUM2wrEuEvKU
	gCkhsaLACYS/hH5zqs7rzwq8AT7rdKUfxr8aQ8IgHqZHHMsswG1IMuwrxmaevbP54hxoshWzTZ2
	SHv+3o8H1WSA+6L8/qtUP1PH+I+eLW1x089sJV8HMt58UGsJw=
X-Received: by 2002:a17:902:8d98:b0:2b4:5fae:cbd8 with SMTP id d9443c01a7336-2b5f9f83117mr200681595ad.37.1776948568470;
        Thu, 23 Apr 2026 05:49:28 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa14487sm204043415ad.18.2026.04.23.05.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:49:28 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 9/19] libgphoto2: patch CVE-2026-40334
Date: Fri, 24 Apr 2026 00:48:07 +1200
Message-ID: <20260423124823.1983261-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423124823.1983261-1-ankur.tyagi85@gmail.com>
References: <20260423124823.1983261-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 12:49:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126585

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-40334

Backport the patch that is referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit ce3fa8ad2a403c0c9bfcbcc9f4fc877c6ffb9fab)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gphoto2/libgphoto2/CVE-2026-40334.patch   | 37 +++++++++++++++++++
 .../gphoto2/libgphoto2_2.5.33.bb              |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40334.patch

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40334.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40334.patch
new file mode 100644
index 0000000000..883582dff0
--- /dev/null
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40334.patch
@@ -0,0 +1,37 @@
+From 20b33a26b2efdbf2c35c5cacc54a041855ec764b Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <marcus@jet.franken.de>
+Date: Wed, 8 Apr 2026 15:15:54 +0200
+Subject: [PATCH] Fixed Canon FolderEntry Missing Null Termination
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+ptp_unpack_Canon_FE() copies filename with strncpy into a 13-byte
+buffer without explicit null termination. The EOS variant at line
+1451–1452 correctly adds fe->Filename[PTP_CANON_FilenameBufferLen-1]
+= 0; confirming this was recognized as necessary but not applied to the
+original Canon path.
+
+ CVE-2026-40334
+
+Reported-By: Sebastián Alba <sebasjosue84@gmail.com>
+
+CVE: CVE-2026-40334
+Upstream-Status: Backport [https://github.com/gphoto/libgphoto2/commit/259fc7d3bfe534ce4b114c464f55b448670ab873]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ camlibs/ptp2/ptp-pack.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/camlibs/ptp2/ptp-pack.c b/camlibs/ptp2/ptp-pack.c
+index 09dcc24..982b4f4 100644
+--- a/camlibs/ptp2/ptp-pack.c
++++ b/camlibs/ptp2/ptp-pack.c
+@@ -1369,6 +1369,7 @@ ptp_unpack_Canon_FE (PTPParams *params, const unsigned char* data, PTPCANONFolde
+ 	fe->ObjectSize       = dtoh32a(data + PTP_cfe_ObjectSize);
+ 	fe->Time     = (time_t)dtoh32a(data + PTP_cfe_Time);
+ 	strncpy(fe->Filename, (char*)data + PTP_cfe_Filename, PTP_CANON_FilenameBufferLen);
++	fe->Filename[PTP_CANON_FilenameBufferLen-1] = '\0';
+ }
+ 
+ /*
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
index e5a64c504a..9e4726d8e9 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
@@ -13,6 +13,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.xz;name=libgphoto2 \
            file://40-libgphoto2.rules \
            file://0001-configure-Filter-out-buildpaths-from-CC.patch \
            file://CVE-2026-40333.patch \
+           file://CVE-2026-40334.patch \
            "
 SRC_URI[libgphoto2.sha256sum] = "28825f767a85544cb58f6e15028f8e53a5bb37a62148b3f1708b524781c3bef2"
 

