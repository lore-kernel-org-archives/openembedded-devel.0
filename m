Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C27C55ABA
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:41:22 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24822.1785872481967027413
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sowO0SQw;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so219153a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872481; x=1786477281; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AhA6rCirKz5MGlKJF0IEA6hYUdzauaApV3mnm3ew5is=;
        b=sowO0SQwNMZEZBWdYC9BZoSFP7uFYB9fg3xySnLJ5mJoSyTFbYJSTjf/fhpcZF7aYi
         LgIx0qyZj/ABnUp2xJNcZFsLsiE3MMsCEU2XPiLGIVwND+ncJekx1ysD41LcAbRih2sq
         6p+wUSYRZURnbPl2MNJIjUniNamSroNR79VE5Jzll+OwnzPRCJDgAhHh5wYT3603Pu/F
         OmZQQDcHwJUW2Mhu24xl4GQPJE13FKWYkHfeUNkMlKKME9ugq7Cc47k0F51vNvb/YIm2
         MS36HBpWp/1F/eRyP6Swz3vCqsW27opCzf7xnGaU72/JoC8Ga1JldJvstLzC6Yxl2FLh
         KzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872481; x=1786477281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AhA6rCirKz5MGlKJF0IEA6hYUdzauaApV3mnm3ew5is=;
        b=SJHdbQcihDt9y3elUM50TNWqGsJevjqEb+jQ5msB09gqJ5Ug86Aev/HCphKhGok48o
         1EIKKLSC80fxeivrU9mFAONlzBWuVF9Hr4buHMYUX7+oilk60W6lzMcYfBvpp8+5K5sv
         xd0zsRJLNyIbc+GrHPrTqD5cj37l0CFaKHShRxywazoj2dKg+5uMN+Tll0U4XIa+FFu/
         /QC+82C+ztu6gWbLxm1MzznHnTVfXZcSD33z5+ZR4jCuTGUwzQQBjiQtZCwjfXPgisND
         Z0tw245Zr1O+xZGBsDhwF6kGlcr/icOZsKtfrdk+BHWg0jVgDKdyi11kg2151xHahGuQ
         uZ9Q==
X-Gm-Message-State: AOJu0YyUBN1UWWqySpUcQHzQjnjQOluXUJxEsPKwbOuUEs4cF65ViLub
	Ysfe7PbKaBhMmZcht8gn7uUktNnWaiFSIVU2+V73K8rNSSzdSG7YW7gre5SzEyTH
X-Gm-Gg: AR+sD11jU6voGGvXeOxD//pRq6CfLqWMnqbY4Iq9UtRiuRwpGuv/dnLk3EDOtXubV7P
	DtuFOsGznbYsH1ZV/+gI08ELcL8XSf6Ha8DusLA8NnluSEy44hnJC69Z/f+nVBnG7dlDUoZpYmy
	QZ6658vgHLxmeVh6Bq2oCyqhF1sMze2mL+5UuBGqdeGNEB7DjWw31snk4Xr9nV44jbT8zLGXmZZ
	Ln40/1CUN9KcpnMUslhfzxHzvKmPgVA3VGxhRJYdh7Mz3TM9IFfmI6MTVZp+cdipj+Xo3Yr63BP
	6YfkEEaSW5+ePWKvKV/hLY0+yYDHIXr1ehWmovS3Qr/P7r68rAmTuNN/rCwa3K1el+/7ic8c8kV
	EHtPF+cxjhZFzmIW1SPLArwVhTf+C8xRDktIAZHzv1WqhGcQ/xE9YYB7QM3V88FvHPqEBFC2y5B
	teGRxh5jdt+CZ/aUaYMAv1ElYdjUqWn+UjMeyr25lacqA9S8if1JMz9pXOfHT3tYUVhyUGYuqGh
	Q==
X-Received: by 2002:a17:90a:d010:b0:38d:eaec:4396 with SMTP id 98e67ed59e1d1-3903c58bdd2mr1194903a91.11.1785872481311;
        Tue, 04 Aug 2026 12:41:21 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:41:20 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][wrynose][PATCH 28/36] libsrtp: upgrade 2.7.0 -> 2.8.0
Date: Wed,  5 Aug 2026 07:39:55 +1200
Message-ID: <20260804194003.3158916-28-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:41:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128775

From: Khem Raj <khem.raj@oss.qualcomm.com>

Upstream changes (CHANGES, 2.8.0):
 * Backport cryptex support to the v2 branch (#778).
 * Fix AES-192 KDF (#770).
 * Properly support the null-crypto and null-auth scenario (#760).

Version-only bump (git tag v2.8.0); recipe unchanged.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 41619e7ac44867960becf486d74befeb565a8101)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libsrtp/{libsrtp_2.7.0.bb => libsrtp_2.8.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-support/libsrtp/{libsrtp_2.7.0.bb => libsrtp_2.8.0.bb} (94%)

diff --git a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.7.0.bb b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.8.0.bb
similarity index 94%
rename from meta-multimedia/recipes-support/libsrtp/libsrtp_2.7.0.bb
rename to meta-multimedia/recipes-support/libsrtp/libsrtp_2.8.0.bb
index 3e992c403b..19cb9ae061 100644
--- a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.7.0.bb
+++ b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.8.0.bb
@@ -9,7 +9,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2909fcf6f09ffff8430463d91c08c4e1"
 
 SRC_URI = "git://github.com/cisco/libsrtp.git;branch=2_x_dev;protocol=https;tag=v${PV}"
-SRCREV = "ee1a77c9f9dc02c42bda9901038c500c5efe4cfa"
+SRCREV = "24b3bf8f19b6f5ab4cd2bcceb4f4064efca86fd5"
 
 
 PACKAGECONFIG ?= ""

