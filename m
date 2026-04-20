Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB5D6F36C24
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 06:28:03 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14180.1776666482632439512
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Apr 2026 23:28:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ODaWB6Ja;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso3320585e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Apr 2026 23:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776666481; x=1777271281; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qfRTzyXB2WrrdPvboFq9hgu2POK9zd2fVfP5AYmfV98=;
        b=ODaWB6Ja0z/d3lErGRzmW7E9gPoI73SCojc8cnpigU/yiEQyl9tavNZ6eo6SrhYKoz
         OlL4rXv8BiTWNzVSnZUJYQDZqvH4IxlmDupCAraB593tXBQ5OmE8WZ+tymijfcgGthcD
         t0n+ScYJLz8grKkfce4pzJOasa7Bcf6/dJlCS95x7jAAua/xGLI/ibsFpqYNukmff8kV
         8tk+0r1L1TWrAM+oVJeD/FqrqpMAZjnVsHo0vhX6SL3BJeuR87j5HqCxvVljroqZUeqA
         lGiStnUeD2WC+lvDr7hzbPQdDtGoLtqp9aNnpS6BH0mtbQTgfKg0fV2sqeMmazWhj/gA
         uiSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776666481; x=1777271281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qfRTzyXB2WrrdPvboFq9hgu2POK9zd2fVfP5AYmfV98=;
        b=lKmXkIdRSxGONRDJqHC1ZWLekOrQkm/NignZVU+oSysKHp8v4NQ6/cs2pHA4vHSyKI
         UHgfLjcki0250BmokbMyOgq9TE3B69gcwjocYn8BoCpdtSJ2/2qLcByvb7FqsYlmVlmL
         OVYWgX0WUoL2rYScFYt7hbCqyhwwM2ZgkAknvbleP52hK0iNntcMZ0zzdaU7vEX1X2m/
         k6c2tSMRGIO37IDTf6AnoET1kmX5EjhYBsZYK3J8dEWhU5v/TjFo08b+3RHNSAkqgRPv
         3Il86h2EiX/YERlXhdsRXx5xABjY84b1qBvQ35ri5CluzqWOz9XIYorpgjJ94BNn9xkI
         Xiog==
X-Gm-Message-State: AOJu0YyiS+wUKIXXXLWJAQmX/GBJ0q8j3w3os32FREUMDj6GXyhg1PC+
	SCu48rNSAmM8GPd0skjReE/QeMLMPU0BeRLNMS24HoWgIqq+dVfKzxKFpFgzQQ==
X-Gm-Gg: AeBDieup6NuGVqSXGe+r/ZvfJU0ncH422Lh6FE1OACfjBNL5BQ9HzLndG0jaFz/cRJK
	oBrvFtxqGy/ANU8WSA2pg2CsZEp5+ncjo5gVXZfRKr2tpl6ZDhfznh1jRpO3nGESEOQokv68fTt
	ZmCMMWOY2sNr4kGOggby64gN5uS+wXZHUzXo4btyD2tJwhJiKIAURc3HlY9Wgt9/m6watM3ovdQ
	yokJiaxsfVJpdfxMhcmXtl/x/j6/oNSs+YM4tdpkyHF2u6+tUtFSmm0JxqqnvvYv13oMSPv6Axg
	grfhezGaZvDhzKD38g/oehC8quoK65xubxtPIAAGki783KJogjxSjiRVIpaYhJmIEc8FPQiOCYn
	IEnd/GWfn/lmCEiOUR5LBQv8AxUcD0nf+4NX7lXNfXD8CwcIe0Jfbtc9cR50ZWLjTAyrl+8EZUc
	au+ZAb5rD7Alj/bZ4Q9j64b5xruZvHcu8=
X-Received: by 2002:a05:600c:8207:b0:485:3193:6ddb with SMTP id 5b1f17b1804b1-488fb73cf74mr182854695e9.3.1776666480852;
        Sun, 19 Apr 2026 23:28:00 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc17f642sm238296665e9.5.2026.04.19.23.28.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:28:00 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 13/17] libgphoto2: patch CVE-2026-40338
Date: Mon, 20 Apr 2026 08:27:45 +0200
Message-ID: <20260420062750.3795917-13-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420062750.3795917-1-skandigraun@gmail.com>
References: <20260420062750.3795917-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 06:28:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126477

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-40338

Backport the patch referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
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
index bb5470fa7a..df23932535 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
@@ -17,6 +17,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.xz;name=libgphoto2 \
            file://CVE-2026-40334.patch \
            file://CVE-2026-40335.patch \
            file://CVE-2026-40336.patch \
+           file://CVE-2026-40338.patch \
            "
 SRC_URI[libgphoto2.sha256sum] = "28825f767a85544cb58f6e15028f8e53a5bb37a62148b3f1708b524781c3bef2"
 

