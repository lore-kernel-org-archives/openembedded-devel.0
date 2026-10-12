Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3548ACA9ED2
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:10:44 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5062.1791839442586023428
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Gfp4zA4C;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3a7cfe8f761so2581564a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839442; x=1792444242; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MR39kHT8Rwj5ttSiVFLB95sc/8LyJ4pAhvdYOC3+C/U=;
        b=Gfp4zA4C66j1piakr1i5XZd2xIOm81mUZcuzrt7zouugIlMfGrZHgkeW8vnRrSQ4gx
         9nIn1ll+mC4oJa6/rw6XjmUYk3Pr4QzOMVPvM5DYcbTAV3m46VumEKtauYflEPqynQrK
         p2N1/T6o85L2pwiJ/Bp3g5aDGYu7aWnOmg+pIkShiI9AUAlslQZEsC5iE91iz13M5OnS
         U2HxcbMXpSf/VXJp0pyFu3tzVKWtuWluqLS8pqCEFfywQ17qRRLpwRTXbs3u/gs7C3tS
         V1Y00swJv6REi7V9o4lFbZFEMo7xzTWisyCfCln3AC75MlBmJudutxUtS2Kkak7VNei1
         Oy8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839442; x=1792444242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MR39kHT8Rwj5ttSiVFLB95sc/8LyJ4pAhvdYOC3+C/U=;
        b=iMvcQ9QYFtutM1A03kz8xiY3W7W9LCXQSbwfXIJs1Qh8EjSmvncdRpu7m3qZjtdiPK
         5ThIwQT3PkCuxytFvsgJTdeY9D4vm/ym0JyNKqFQtaXz0m0m1sSSagZOfD0ff7nlLcTQ
         qBeUQspUJxpAehE++gzbQuiEeZIIf3y7gJBZ12PYkQ5yxkpH1llcsetPZsdrZ8VljKmN
         L5WD90DFjn9en/8fagYrjV7GaVhJDEnaPb73BN1J+P7YDLTBJQTd5FIZeydRclO4CJOi
         aNZ9jjQhuVSHty+92yqTB6/XQ9KDmeY64uHCpEN5wCGqVYg/gUcQQH/YVBZN5D5uaEEO
         clvQ==
X-Gm-Message-State: AFq9FYKupQh8jb9upB1AJ+I/67p/2S+SNTxLhnBpYL46oFg5HvK+nF7j
	qy1Q/mJRqrGLGX0WKn4VpJyavp/UYWQQTHGTzKevYnkiMzwMZn32AJ8IJ48Asw==
X-Gm-Gg: AYBFou0gO6La1/M9EwhviM7X38nVmEwxgz6dkS6E2IpcXgXIPU85hhdsTAisxJ1cm+o
	I2030BWl0JDoe2b0N8NIGV+ghHv1LfZuZbRPa3KG3o3bb/Q5ktvpjHj1GP69R0HMUzCC53/Z1tq
	T7yXY6EXyOs60vvqMb5M1UkhPTUozCw6S1A0i481m0/7YQy+rPB/ibPIMdeT+7NQMWMmf35f9MP
	byiYg5IZE9onGF29Bh4KvvxIGysjq2K8jcXcGuZ43q3i4IavNxl7NIYDetMy4H4GYf7gEnvmpLX
	k6Oqf92mzKfrxwhTNkEkqOCJ4JtMiBASm1UbhyKiwiunYMV/elq1yGlIDy7XPTIwLy/ERgzkS6n
	GqIl5AzyEz0H5/s1E8jxyDyFubzhAqKz6QPH9A6v6jZvZnlToT6r0llKyM7rINqsfdcS4HPWSjh
	/MRQfJ3nvEbHdL6POqHNoUjqyTjE9UoftlIHZZF6KZXW2tDiB9T1CHrZN3Nq/kVIOrVHK7vSwQu
	bv0QqsdrM+6xmMPC2rfy5C7/XqeGYRtIe43uJw=
X-Received: by 2002:a17:90b:4b82:b0:3ab:a09c:f858 with SMTP id 98e67ed59e1d1-3aba09d4a0cmr3514498a91.33.1791839441976;
        Mon, 12 Oct 2026 14:10:41 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:10:41 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][blacksail][PATCH 10/43] gpm: ignore CVE-2025-4558
Date: Tue, 13 Oct 2026 10:09:34 +1300
Message-ID: <20261012211009.3352822-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130780

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2025-4558

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit e134adc8f3e5ff7359d7df04c4a841e4d5eeff15)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/gpm/gpm_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/gpm/gpm_git.bb b/meta-oe/recipes-support/gpm/gpm_git.bb
index 155e56bdefe..9c07f334b0e 100644
--- a/meta-oe/recipes-support/gpm/gpm_git.bb
+++ b/meta-oe/recipes-support/gpm/gpm_git.bb
@@ -42,3 +42,5 @@ do_install:append () {
 }
 
 SYSTEMD_SERVICE:${PN} = "gpm.service"
+
+CVE_STATUS[CVE-2025-4558] = "cpe-incorrect: this CVE is for GPM from WormHole Tech"

