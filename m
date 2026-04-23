Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA70F589C0
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 12:49:35 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18546.1776948572275437169
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2026 05:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=p/knO5pF;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b788a98557so22155015ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 05:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776948571; x=1777553371; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8jhshFja19pUjDU8AslJAGnI96VUUOOgGWxM7XuvJoo=;
        b=p/knO5pFOIfWfhuJmluzx9LPDCyGMTJzj3JTmluP7oW740/16qleaOkRCOQADfJSsf
         3DJPA3/Qhc4McfgPFbF+f0gLMnaBR93AF3v+mnMcxRVM5WP2BR7RlCkaqPg++wOCgyyK
         PBXKUDiSkjYBNUFlxAyuWcy5EnkBsH0GKJuLaklZ5eMWj9Pkjzd4X/Cv/QBiu5eThbcg
         zHx4Rv012VYTdPm2/aN/gpl47oVhDqaihPPhX+Kua8Vc0aUnPunxUUBw4WBV4bjnctDB
         uy1wx9L/tQSr/rrqR7TgcjqWLv2LCnXZoaRdsqjC3qrnfDgwQEoNntROmulGhhaTzxl3
         GiOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948571; x=1777553371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8jhshFja19pUjDU8AslJAGnI96VUUOOgGWxM7XuvJoo=;
        b=D89jB8rAwBJa5qMB2SjnWauvk8TRH5YTwIzybIjtml0nO8GKrgjYgP/uZ/ogl9KF9L
         GnAU27D/KU/dBIHVd+L5mObdxL5gPe4DgeIFYkhqbJqC5/OOmLnrBBtYoYXiXRlkm3CJ
         m7Qehf0Su5C9y0bkutQvEiKHrtZFMahgL9rCJkNR5cj3a6TJMiDlqHGDuPzCmGvVxyJi
         h6iv0qwrnfqOhSf6CoW6CKr2PNDaCwryvym5cGeWW4D84cqD8zyvE8ebBTxm4XBqdhnC
         DtdVyfHNjS4Uff8ZlDgzMOsI6oRB6YLsLPOn2+cHY4uCDlCEABVGMeJDycx9n4iFzaWw
         LDBA==
X-Gm-Message-State: AOJu0YxadqUN+SCQh1nWZb2W0LTmQEL8tgbKgA88ro1rGpvlXtofuKLl
	yfFnEszFrsOjsEyVTHwAQMFZio9165umkpO51WH0Kc6MuSDCeSkzhADWdBtZZzfE
X-Gm-Gg: AeBDieslil/vX+KZErzXYqJQz38NvKH36/1yMUvJR7vGB4NkkPZYI2XmAp8FZMmNZF0
	g0MfYznDubiuRIFjUGCwYrS+f4oG+5uoaTpYiu+hTdS7KROkXpl2a1B8Ts/M3PZz4q+mIsBE+3v
	G6k40BegGRtpaqKKBvFYqcR2+qirzdV1qLm4nN2WSgiXl3Y8oSXuobZxz8np2IBEagQ+Q/Dg5c9
	xPYG8DCSslxaUIqvIS0u0d/Qe/IlifTJLnM1GnZSXi3uV95YR9f3uOrY7X2ITkZZz6B1z8MrUMt
	71a9Cl1fPhB0+zvW0kBZ4ZpT1ijVHEuJtZXja5nExl3QS8o+pbTgPXMCEbGwOTFMcREyQkJKnW4
	Kal/KCLc3uTlIyOlJVAX1BXI8PWUtquAcNjxSnK90M9tfO3ZOvLVrCXXRQ/+vIQpfysva+5SXyi
	OyTts7DOHEvFgoOPI/g/nMBwxnTWeiPalcDXkBahcrt/G3Dy3Jxhzrw3CWuA==
X-Received: by 2002:a17:902:d58a:b0:2b0:ac1e:9737 with SMTP id d9443c01a7336-2b5f9ec5ea7mr285970845ad.12.1776948571424;
        Thu, 23 Apr 2026 05:49:31 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa14487sm204043415ad.18.2026.04.23.05.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:49:31 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 10/19] libgphoto2: patch CVE-2026-40335
Date: Fri, 24 Apr 2026 00:48:08 +1200
Message-ID: <20260423124823.1983261-10-ankur.tyagi85@gmail.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126586

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-40335

Backport the patch that is referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit f735ea20b176591b65deaa456e93ebf7ecbead3f)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gphoto2/libgphoto2/CVE-2026-40335.patch   | 43 +++++++++++++++++++
 .../gphoto2/libgphoto2_2.5.33.bb              |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40335.patch

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40335.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40335.patch
new file mode 100644
index 0000000000..dfe832e6c8
--- /dev/null
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40335.patch
@@ -0,0 +1,43 @@
+From edcdf804662eb4340fdc371af4853d6579e969ab Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <marcus@jet.franken.de>
+Date: Wed, 8 Apr 2026 15:07:38 +0200
+Subject: [PATCH] =?UTF-8?q?Fixed=20UINT128/INT128=20Unchecked=20Offset=20A?=
+ =?UTF-8?q?dvance=20(CWE-125)=20=E2=80=94=20MEDIUM?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Finding 5: UINT128/INT128 Unchecked Offset Advance (CWE-125) — MEDIUM
+
+In ptp_unpack_DPV(), the PTP_DTC_UINT128 and PTP_DTC_INT128 cases advance *offset += 16 without verifying 16 bytes remain. The entry check at line 609 only guarantees *offset < total (at least 1 byte available). After the unchecked advance, *offset can exceed total, and the CTVAL macro's bounds check (total - *offset < sizeof(target)) wraps due to unsigned arithmetic.
+
+CVE-2026-40335
+
+Reported-By: Sebastián Alba <sebasjosue84@gmail.com>
+
+CVE: CVE-2026-40335
+Upstream-Status: Backport [https://github.com/gphoto/libgphoto2/commit/433bde9888d70aa726e32744cd751d7dbe94379a]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ camlibs/ptp2/ptp-pack.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/camlibs/ptp2/ptp-pack.c b/camlibs/ptp2/ptp-pack.c
+index 982b4f4..7fc120d 100644
+--- a/camlibs/ptp2/ptp-pack.c
++++ b/camlibs/ptp2/ptp-pack.c
+@@ -614,10 +614,14 @@ ptp_unpack_DPV (
+ 	case PTP_DTC_UINT64: CTVAL(value->u64,dtoh64a); break;
+ 
+ 	case PTP_DTC_UINT128:
++		if (total - *offset < 16)
++			return 0;
+ 		*offset += 16;
+ 		/*fprintf(stderr,"unhandled unpack of uint128n");*/
+ 		break;
+ 	case PTP_DTC_INT128:
++		if (total - *offset < 16)
++			return 0;
+ 		*offset += 16;
+ 		/*fprintf(stderr,"unhandled unpack of int128n");*/
+ 		break;
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
index 9e4726d8e9..84ce802ea4 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
@@ -14,6 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.xz;name=libgphoto2 \
            file://0001-configure-Filter-out-buildpaths-from-CC.patch \
            file://CVE-2026-40333.patch \
            file://CVE-2026-40334.patch \
+           file://CVE-2026-40335.patch \
            "
 SRC_URI[libgphoto2.sha256sum] = "28825f767a85544cb58f6e15028f8e53a5bb37a62148b3f1708b524781c3bef2"
 

