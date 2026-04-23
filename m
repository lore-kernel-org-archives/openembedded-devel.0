Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 616E5F589C1
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 12:49:45 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18547.1776948578039658297
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2026 05:49:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rmobVDjI;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2b299b3c739so30681665ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 05:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776948577; x=1777553377; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qh6creXaPw5LSjO4rOV6xdbHJH9l1Ga16KrKfRb7UNI=;
        b=rmobVDjIkQCBv59Z7yHY2XQ3UKwK3lU6DIdOvB8k8SmJmDwb2kicFAHANg+FsoMfxt
         /V/jHkzXx1TCS0zlKlnaQnJrVnWapD36vnywHt1+wsIpksZmSE8mJTLNFWj4ZcuXJVaD
         xhxSYve24hsJmVQZTK1YoNuxbF90h4B2rZ1TlBw19w/BXEUXBa3ZmP4b9kikLsm6NxKY
         uImIjMofgNKFp0XHK3KHIPa1qhKBd7Q8JUr/sZgfSeXCe5999sveWir4+hDSvjj5MBo9
         kTIgZCCB44+Fbt9jDhh05zey8NSTaEX6JsO+JLgNjtOcfMG229wd1ne0de/aN+ve6Ny6
         cfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948577; x=1777553377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qh6creXaPw5LSjO4rOV6xdbHJH9l1Ga16KrKfRb7UNI=;
        b=GzSQ2Z8iPS2IdEkhAhPWsi3OKrovQrj8zxmSNtGN8W5zRkSK2HNuyqhaF8mRwdmkyo
         S2y42o1OyQeDZarfzdF5YR0bpXQyTw5h+naVlKPV/AaI4fp+7j1bauO/MOGG61eNIi1U
         vZBpuCYJfSTNgy0dhdjvm2hhdXgBZVx2YNKOrOaC6Z38S08lSIGRz9dww/dfFjg4gAh5
         4uGCJZGvagiQTPDKxzrRfYROWXLDNTXZI9nIs8Mr5NJlSBs02EJu/km4plbdx3CU2SjE
         QhCj+w6LzfjGiCOiwED4cLPrIK3hSsNxiAF06Lx++B4DWfXl4TXHEtBmnEau97uRX8Hr
         GTbA==
X-Gm-Message-State: AOJu0YxfXlWWFXNk2fV/B6P61913EhfXLIG+zBsJd25BWbUD7xKBkHNm
	lwTlUw1ChBuPHin1Z4z2RyH0b3kW8OWC00sIynx1ZRP0/PH2Zhg9F9cPm8sP4loQ
X-Gm-Gg: AeBDiet+e8N86SqeFDtCDSD0Pl79xMJGw056qdRd9bXa1f3hqye85Ty5aCZISJpjCCr
	xA6p2ylmLC0RoqjLbVDAvF9bV4v7aKfDemdQ3X8ZeENgWMKt1of3Gjtg8KY/I1UgEdwZyI3LO4J
	3Yo4/BVzfUhS4e53r6+Tzmkbya38gQeI4tu3H03wm3veT2n3g0ZCPPrvdl6cCuAakeSIIq9REze
	45nrRs//Ny5znQ/N60L6OWtyOK7onaCJ7PDMM7fFv9CPVXt/0QRYj8h23uNQN0uWT6xMtyPNrvr
	eP7np9bwVfZUG7goE22Pzum5VwEJtqwE9NkoRTMNTAY0hX3iAKgGULov0n2snoPLxCT576rIGGo
	DNibe0QHBqeGNatREOY5kOY1/Eltx7xVOB5cemitWNtOlc8OQqRyyONFFy4N1fAmKmKSeFjPrlK
	mGlq3BilFpFzPrPyEv9zDLIe2lF9Gbh5yXwVhZ/HkA+NX+AerS33GBKPZBJw==
X-Received: by 2002:a17:902:a70a:b0:2b2:b117:1d5d with SMTP id d9443c01a7336-2b5f9f93101mr195625835ad.33.1776948577195;
        Thu, 23 Apr 2026 05:49:37 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa14487sm204043415ad.18.2026.04.23.05.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:49:36 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 12/19] libgphoto2: patch CVE-2026-40338
Date: Fri, 24 Apr 2026 00:48:10 +1200
Message-ID: <20260423124823.1983261-12-ankur.tyagi85@gmail.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126588

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-40338

Backport the patch referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit f22e17508e89cf8bbb98e3cbe186bb99e379c456)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gphoto2/libgphoto2/CVE-2026-40338.patch   | 34 +++++++++++++++++++
 .../gphoto2/libgphoto2_2.5.33.bb              |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40338.patch

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40338.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40338.patch
new file mode 100644
index 0000000000..9f233f2ec9
--- /dev/null
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40338.patch
@@ -0,0 +1,34 @@
+From 43cc20e807cd2935869617a7d8b9488070712c0e Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <marcus@jet.franken.de>
+Date: Sat, 11 Apr 2026 10:47:52 +0200
+Subject: [PATCH] =?UTF-8?q?Fixed=20Sony=20DPD=20Enum=20Count=20OOB=20Read?=
+ =?UTF-8?q?=20(CWE-125)=20=E2=80=94=20MEDIUM?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+In the PTP_DPFF_Enumeration case of ptp_unpack_Sony_DPD(), dtoh16o(data, *poffset) reads 2 bytes for enumeration count N without verifying 2 bytes remain. The standard parser at line 704 has this check.
+
+CVE-2026-40338
+
+Reported-By: Sebastián Alba <sebasjosue84@gmail.com>
+
+CVE: CVE-2026-40338
+Upstream-Status: Backport [https://github.com/gphoto/libgphoto2/commit/3b9f9696be76ae51dca983d9dd8ce586a2561845]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ camlibs/ptp2/ptp-pack.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/camlibs/ptp2/ptp-pack.c b/camlibs/ptp2/ptp-pack.c
+index fc51d77..f90d2a5 100644
+--- a/camlibs/ptp2/ptp-pack.c
++++ b/camlibs/ptp2/ptp-pack.c
+@@ -851,6 +851,7 @@ ptp_unpack_Sony_DPD (PTPParams *params, const unsigned char* data, PTPDeviceProp
+ 		break;
+ 	case PTP_DPFF_Enumeration: {
+ #define N	dpd->FORM.Enum.NumberOfValues
++		if (*poffset + sizeof(uint16_t) > dpdlen) goto outofmemory;
+ 		N = dtoh16o(data, *poffset);
+ 		dpd->FORM.Enum.SupportedValue = calloc(N,sizeof(dpd->FORM.Enum.SupportedValue[0]));
+ 		if (!dpd->FORM.Enum.SupportedValue)
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
index 85c86a03a6..440b78dffb 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
@@ -16,6 +16,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.xz;name=libgphoto2 \
            file://CVE-2026-40334.patch \
            file://CVE-2026-40335.patch \
            file://CVE-2026-40336.patch \
+           file://CVE-2026-40338.patch \
            "
 SRC_URI[libgphoto2.sha256sum] = "28825f767a85544cb58f6e15028f8e53a5bb37a62148b3f1708b524781c3bef2"
 

