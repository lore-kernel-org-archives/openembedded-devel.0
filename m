Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0838DC54F5E
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 02:44:49 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3037.1785293078916524433
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 19:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=STTrY+41;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so397110b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 19:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785293078; x=1785897878; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3/RLBCwnXlGrLtaPFKcwXZp9pR5/7iiOlO/BBs3Y4cE=;
        b=STTrY+41Asj1SWaiZnfq0KhnlKaaSrTaVKBT1t8mUyGUtacDMI4QyP+uMX48h4dLsv
         3qr/VpeANxN+qGSc6SyGU5svH6mAR81/5o0YM8jNF3qibm1RLf0BUgy8nFifxA6Ycnnw
         Qh76Z06E2dW+tiAn0cCqcy9z7lqCslo1xUKlc1qRN6LCN3/R2n8KaC4co4bqCV0wuAN5
         UICh1EQA2EP41ODWat8IN+2tbnaJ2TleTTHSZzLvCbyMThQfchAiazeV6KET37S0+r5S
         aRM5Orhz9nATjc7oZojlff2Z7W0C7u47T63wmXlxGklNKzPdf20uefgiQdG4KKsMfW2b
         ZnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785293078; x=1785897878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3/RLBCwnXlGrLtaPFKcwXZp9pR5/7iiOlO/BBs3Y4cE=;
        b=lQP4ajTcwIVlTBhKfkHdBfMpMYkWaOi9xM1piNXrsR11FgljZD8hg4RPF0eVf0mFoK
         nzg53LiFsNYdn3ZzzDkCVv+gMzb7NTu7Mn3D/2YW24SaO86UQCvCyXgtQxMi97N0tFT1
         PzdUimZkPMAakKbj8XEqmTZLtZ6xdq2tbJ/VcB6CSDvMKxpWQ2fDvm8PRDv27cPYs3St
         UhGGbRT7Q4uU7DHr1wIXRtAEcZGKS7CC6G+1IPntR4MsAAxLKXf3vSe6YdLQ4qBFa5RJ
         DmC1j97N2xAAXY/0wdNCWcO/SAXFd66nkeUS+TolyfKfj/KZZjDx7yUtCdXQjzaGY1dv
         AtZQ==
X-Gm-Message-State: AOJu0YynfR/wMGF7mxcOlBbL4ir1FByltHD0/gkHUBXtej4fLBa0GMDW
	fF1AqBcunPRSIcUuY9juEWvO31M3kHFxEB3VsXtFZmemlxFDv4OE0tQCTe/uh1Ki
X-Gm-Gg: AR+sD11f8Wh0rEsA0KQwbzg9OCMCMKckGvc463Takxlte++rvjjBOgIfWzBrt7zPgtW
	NOPB5VoWsrg65rIkhWej5wcu+1ApDPs0eH5redSC25thfJzyNUQUaQ9u0233idMOoXmhYI9UyNf
	wsMlJ641txv6QLFjdLED+w8Rb3CIfxWQuuoUszgGyY3J/VHftOYuY75PDNedSN9IsZrdBV4FE6s
	TbY1w4maa5nxoPfUpIn+mReaVpZ+Z9AQDbIKbk820KGjyecYB+Ov1U9Pm1IOn/Baxvmx38ecsY1
	2YtHlo173TU4AOKB3gUu94pOhBvu/IYBfGn0TN0Awwmgo2R8IgFKTo6gNa+ACxSepp8tEXQAUTA
	nt62Ln5RijvomcKf/ZdjWK5WjFZQjcEK9mEbgPaKKJcwC3cnz5OJl79GZfdLHbjbYLXDWnQChXI
	fcnHJR45tDKFDQxMc+BdooQyHkaKt2SwmTFAmM6wsg6qDUOnl6Tlz9GurUzonXvojvaQAYDLHmB
	KsageqT+BMCyVOhJQyN7MlQTCuGSbsp6DGchdquSWNPgjCW/r+pKUi4jnx02QZl2EcNKGdd4RiH
	1veylKfY0w4MipvdKsUnOvuEoDxXzMLKmZlG58BIUVsfsBdC104JICDinvCiTa2VpqrLecDUZY3
	4XX7crFmHQnDAk6QGBKcQLtjC
X-Received: by 2002:a05:6a21:7a82:b0:3c3:994f:b4f5 with SMTP id adf61e73a8af0-3c8ab0db549mr6050586637.28.1785293078304;
        Tue, 28 Jul 2026 19:44:38 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm5787402c88.5.2026.07.28.19.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:44:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 14/18] cloc: upgrade 2.08 -> 2.10
Date: Tue, 28 Jul 2026 19:44:16 -0700
Message-ID: <20260729024420.2328180-14-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
References: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 02:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128530

Changes (2.10; 2.09 shipped no separate release notes):
- Recognize new languages and file types: Beluga, C3, CodeQL, DAML, Quxlang,
  Rhai and Slang.
- Skip the contents of .venv directories.
- Add --by-percent support with the --fmt formatting styles.
- Support process substitution as input to --sum-reports (Unix-like systems).
- Treat wscript as a filename rather than an extension; assorted bug fixes.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-devtools/cloc/{cloc_2.08.bb => cloc_2.10.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/cloc/{cloc_2.08.bb => cloc_2.10.bb} (74%)

diff --git a/meta-oe/recipes-devtools/cloc/cloc_2.08.bb b/meta-oe/recipes-devtools/cloc/cloc_2.10.bb
similarity index 74%
rename from meta-oe/recipes-devtools/cloc/cloc_2.08.bb
rename to meta-oe/recipes-devtools/cloc/cloc_2.10.bb
index 106c72974d..611a351a9b 100644
--- a/meta-oe/recipes-devtools/cloc/cloc_2.08.bb
+++ b/meta-oe/recipes-devtools/cloc/cloc_2.10.bb
@@ -4,8 +4,8 @@ in many programming languages."
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
 
-SRC_URI = "https://github.com/AlDanial/cloc/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "ce3c86d1edb448728278079eff6d99687477b3c1fe84b2f1a4dc14cfb2f811dc"
+SRC_URI = "git://github.com/AlDanial/cloc.git;protocol=https;branch=master"
+SRCREV = "eb5cef64db2b2d4380f501568cc584b7cab4ba50"
 
 UPSTREAM_CHECK_URI = "https://github.com/AlDanial/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"

