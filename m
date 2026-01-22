Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D7CD625EB
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 05:44:06 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31040.1769060644505359088
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 21:44:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AMvS+XJX;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47ee0291921so4611525e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 21:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769060643; x=1769665443; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WyaRnZ37tQn4BW3UnQmS4wmnC8BhvsmaFtiQHkfFlfE=;
        b=AMvS+XJXm3H4tXAWjr7xPkXwqesHb9hOwiSGm+1HloZm2md2d05iel7ydU93FYS8zx
         MCnYbUqY5aN297cceNuICRZY7czRnzALn3VERyBUuy75vlLX0x+o+54jBC1HF+2QLNST
         /P1t+bO6O0gJc5cd++Qlr1sZIVGuP/Pt3w0rl1e0EJ2j1d6ZSqVlC8iIMltiX0eSusNw
         ekoSrMI4pi+07YwOnr33wpbSlGlA+L+/BcdYQOePPdFlrplX21PiDf7OfAVyEBdaHisS
         SEOnSSz6BD0nYqucXhLBo3b00CE8zZWJeDeoaSEzioo5Y3f004HJGbkbm2xLRSGFIBhR
         yEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769060643; x=1769665443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WyaRnZ37tQn4BW3UnQmS4wmnC8BhvsmaFtiQHkfFlfE=;
        b=tMRIFQB1XtD8CAnZ4Os9OlpRKNcOv9GeiTgDwLidzJ9ksSUTingk0kC847PwEpD7Yy
         hjPNuJnZsbM3V1HCQsjmrGGUHL5T1Gu09Ny9ByFwuewxcDf/jszVR1+y6wGzV37BRiT5
         ZlGWu9ngekK06Ragr3M8tlOUEDprsa5qntRqW1pWXxmurmvCfhB6uMJstjTAL4zfvLZR
         DHLwCL0MbC9ZkTsLSklmLkg7Se0RfVvkfVs3kHsQ53agg9rvAtrA8859R35x3NwDamSU
         ayVllVKe5dczohG98UzDd0DnO6Lc32ceNGavwVTOtKviaP3FFTLlBUg5Vq6PH68hJjxB
         yl0A==
X-Gm-Message-State: AOJu0Yz4eG15aSFIIK8d2z14YswrgltmzN7406/KVeTrzYcTd5W/vnPE
	myO/yonNlzPdOH4dajjjBs9d5oglIjM8Pp01c7CE78a3mA0CxoRJIJorwdvQcg==
X-Gm-Gg: AZuq6aJiKk0xCH9la6I1ETeF6Ajus4thcMFV6Ayhdkk12RaaLILIQUCVe1TJ+HemQ/5
	Is/zJhEUW+6fNSlUxypTLHlDyOov4DnCjAnIgFQyJ/9ggHg7MrWFDT02q7sCZGH8rXT1Poa5/tE
	AqjIc6AW55eFjMlfd2x0ZzoIwxvTLaaGygUB7QDK8/+YfO2l4jYm4jsS6tk05MujJ6ARiCFEu82
	Q0ICYXIr1ZnUnVpVKy9vq18bEHeU3KmordWwEk+qtfBETxqzDkB00fpVifK85Tum6ZSxlvTj/I0
	NINFAMTPpHJQuKA0UUoHb1evdWUBDfiQED0LiO/yCQmqwKIY0hKXMNooxIkmiexgHy4iDH4c/TS
	tWyIvbN3TC60567ZzP1YpB5Jtw9XBim0KVLtm86BB8ikGH2i70EmMzHpCR4KjsP+RmzOVDRfRM2
	mt11MfXZyH
X-Received: by 2002:a05:600c:45d1:b0:477:7ae0:cd6e with SMTP id 5b1f17b1804b1-4801eab5602mr273750755e9.5.1769060642771;
        Wed, 21 Jan 2026 21:44:02 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480424aa344sm43912035e9.3.2026.01.21.21.44.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 21:44:02 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 5/5] freerdp: patch CVE-2024-32040
Date: Thu, 22 Jan 2026 06:43:56 +0100
Message-ID: <20260122054356.3570391-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122054356.3570391-1-skandigraun@gmail.com>
References: <20260122054356.3570391-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 05:44:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123729

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-32040

Pick the patch that is marked to resolve this vulnerability, from
the related Github advisory[1].

[1]: https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-23c5-cp23-h2h5

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/freerdp/CVE-2024-32040.patch      | 30 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp_2.6.1.bb  |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32040.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32040.patch b/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32040.patch
new file mode 100644
index 0000000000..670cad23f0
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32040.patch
@@ -0,0 +1,30 @@
+From a7e801f42a3a71332cca22aedccfcda378b8dfcc Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Tue, 16 Apr 2024 08:26:37 +0200
+Subject: [PATCH] fix missing check
+
+in nsc_rle_decode abort if there are more bytes to be read then there
+are left.
+
+(cherry picked from commit fb4f2d6e4db563077afcae4d270ba78ff905f6cf)
+
+CVE: CVE-2024-32040
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/5893b5f277db38b0040c572b078de838b84cfc07]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libfreerdp/codec/nsc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libfreerdp/codec/nsc.c b/libfreerdp/codec/nsc.c
+index dc3a978ed..007364ee7 100644
+--- a/libfreerdp/codec/nsc.c
++++ b/libfreerdp/codec/nsc.c
+@@ -147,7 +147,7 @@ static BOOL nsc_rle_decode(BYTE* in, BYTE* out, UINT32 outSize, UINT32 originalS
+ 				len |= ((UINT32)(*in++)) << 24U;
+ 			}
+ 
+-			if (outSize < len)
++			if ((outSize < len) || (left < len))
+ 				return FALSE;
+ 
+ 			outSize -= len;
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
index c616a55958..06aac0325f 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
@@ -33,6 +33,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https
            file://CVE-2023-40589.patch \
            file://CVE-2024-22211.patch \
            file://CVE-2024-32039.patch \
+           file://CVE-2024-32040.patch \
            "
 
 S = "${WORKDIR}/git"

