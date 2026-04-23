Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EEDBF589C2
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 12:49:35 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18669.1776948575121975431
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2026 05:49:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qElwnoSl;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b0afa0210bso30514455ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 05:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776948574; x=1777553374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7spcN0DpTVleDWtPWpAVK0jQmfzDh7eMnV/zRjba6Vc=;
        b=qElwnoSlmed+HjSfxp5SkInQDyT89xJ+zmq2M2e8SaHDqKFroNunz60giyb+HBFTDm
         v3hK93O2YGVKOZ0MJD+j7RmUNKYDVharfYlw9RxDD3SAUEb0hP55PuwfYLT25u7eNHgg
         XKWI89QitiIhq5ES3r0/MWFXtl/o/N1TmChqdreoKCOBVlIx7N4pn4kkeOXSi1zIuGhs
         Al6kHVPjCtjNmBAzv7w1L5sG6ILZPH6Qrgeo2VKE5uDkbx375EDI5BwlkCapV/IAMmKC
         WjEv/qWQu336/auwnfKJaxzyDt8tIY1Z6MHuCvsxO0rov84Pjk2VsCZVUJiA8ovlvjCF
         FnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948574; x=1777553374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7spcN0DpTVleDWtPWpAVK0jQmfzDh7eMnV/zRjba6Vc=;
        b=lQmRCS6rxDyE+VZW7l7izES+H8NkdKsqppUb1f3obd02K8vltMaXo1Mn5qgNbdmOw9
         pTGHF7JQhtA/Hdz123wq5ndq8uVBsaHOfYBIaTE1vzeGOuJmd0PkSQ59B1vUpdgNOsiT
         lCcuNOACNvQNkZI5Xox66xF94wl5l3eS9ikBDbFSXleK+TACMJnsuO5xRPOZe1fWGQRV
         qHrFXN5i0K3AjjZJpWn2cmmR2m1w3lEI5rWhBqPo0rPt8UYc/yT5Rc5sb9rjbVskbXXm
         R3yjSeOoxNNY1ZNiAbKRgt01HthXt9EseFYni77w5vrH4xpLuCa5uJQ9AJf3csZuRJMd
         97DQ==
X-Gm-Message-State: AOJu0Yz3H4+5k74MYvYUx/QnUux2//5gCZqmMxsZZyCIovslzHDrGIZY
	iOozycvWxmgTeMDSOmE+u1MXpu6dvYi/apIogAKK4kvJHNz87goK4jt8dbIhvHk9
X-Gm-Gg: AeBDietqJLfwokgWbrrewI/9R6VN8HD1nFVXSarGAbNFvbwaGsLgipGA7Qtg6nRQOls
	ieH3pm0nl8ZciD+vybaQKnOfoYLIYrN7OQyMKN5Ds4C0txVvcovvLCpMcJ9OZ8Os3Sza+oudTLa
	D9Am+v2I8ziBIjj1iI6MN9RNRmpHNLobc2YYF51GtO7o+LjuPMvzUll6SWTxsVSrhpu3hOTZOSW
	NtPV2Gw2iQq32sBaCUxrIQLbMbpkp+AJXPP25D+xtPzqEh/viIZf4fmWkp6K2LNVUeORgB8xOdU
	cCkL8y9Hljt60QrTvR8PVN9LkSOh+rR23bpRFxQkIKNl54XRYZQZ43wzfN3G2CoNpN4TgWn8sJD
	L421F9foqCfcdRXG78RAqS1SZDdqjAjb7WSbmrd+Pu2lbbDvdyn5+hMIW/fSeh4aYOdeVvGdFaP
	zT7VUQgXj14GstrZ6CjcuEXcGYvvqv1gTUEVizL1f0YOJyPok=
X-Received: by 2002:a17:903:3b45:b0:2aa:d5e5:b136 with SMTP id d9443c01a7336-2b5f9fb3568mr197423765ad.38.1776948574232;
        Thu, 23 Apr 2026 05:49:34 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa14487sm204043415ad.18.2026.04.23.05.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:49:33 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 11/19] libgphoto2: patch CVE-2026-40336
Date: Fri, 24 Apr 2026 00:48:09 +1200
Message-ID: <20260423124823.1983261-11-ankur.tyagi85@gmail.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126587

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-40336

Backport the patch referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 078f26b084d7a7e4ac61521f73188249b9bdd39a)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gphoto2/libgphoto2/CVE-2026-40336.patch   | 44 +++++++++++++++++++
 .../gphoto2/libgphoto2_2.5.33.bb              |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40336.patch

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40336.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40336.patch
new file mode 100644
index 0000000000..1a809b4f25
--- /dev/null
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40336.patch
@@ -0,0 +1,44 @@
+From e19c45d3530f1585805711e14aa4ea788e499f46 Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <marcus@jet.franken.de>
+Date: Wed, 8 Apr 2026 15:13:51 +0200
+Subject: [PATCH] Fixed Sony DPD Secondary Enum List Memory Leak
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Finding 4: Sony DPD Secondary Enum List Memory Leak (CWE-401) — LOW
+
+File: ptp-pack.c:884-885
+
+When processing a secondary enumeration list (2024+ Sony cameras), line
+884–885 overwrites dpd->FORM.Enum.SupportedValue with a new calloc()
+without freeing the previous allocation from line 857. The original
+array and any string values it contains are leaked.
+
+CVE-2026-40336
+
+Reported-By: Sebastián Alba <sebasjosue84@gmail.com>
+
+CVE: CVE-2026-40336
+Upstream-Status: Backport [https://github.com/gphoto/libgphoto2/commit/404ff02c75f3cb280196fc260a63c4d26cf1a8f6]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ camlibs/ptp2/ptp-pack.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/camlibs/ptp2/ptp-pack.c b/camlibs/ptp2/ptp-pack.c
+index 7fc120d..fc51d77 100644
+--- a/camlibs/ptp2/ptp-pack.c
++++ b/camlibs/ptp2/ptp-pack.c
+@@ -879,6 +879,11 @@ ptp_unpack_Sony_DPD (PTPParams *params, const unsigned char* data, PTPDeviceProp
+ 		/* check if we have a secondary list of items, this is for newer Sonys (2024) */
+ 		if (val < 0x200) {	/* if a secondary list is not provided, this will be the next property code - 0x5XXX or 0xDxxx */
+ 			if (dpd->FormFlag == PTP_DPFF_Enumeration) {
++				/* free old enum variables */
++				for (i=0;i<dpd->FORM.Enum.NumberOfValues;i++)
++					ptp_free_propvalue (dpd->DataType, dpd->FORM.Enum.SupportedValue+i);
++				free (dpd->FORM.Enum.SupportedValue);
++
+ 				N = dtoh16o(data, *poffset);
+ 				dpd->FORM.Enum.SupportedValue = calloc(N,sizeof(dpd->FORM.Enum.SupportedValue[0]));
+ 				if (!dpd->FORM.Enum.SupportedValue)
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
index 84ce802ea4..85c86a03a6 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
@@ -15,6 +15,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.xz;name=libgphoto2 \
            file://CVE-2026-40333.patch \
            file://CVE-2026-40334.patch \
            file://CVE-2026-40335.patch \
+           file://CVE-2026-40336.patch \
            "
 SRC_URI[libgphoto2.sha256sum] = "28825f767a85544cb58f6e15028f8e53a5bb37a62148b3f1708b524781c3bef2"
 

