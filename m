Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43333CC6B03
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:10:44 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5060.1791839440112578495
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Q4r0jEww;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so942016a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839439; x=1792444239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8+1OKLLfY0HM+hYdXDzeeA60NjAWoNrRG1H/m8ZLgSM=;
        b=Q4r0jEwwOBKO5+lc9JiedGidGSu+AeZlCdp+oncFBEkHbBvkrgtot9ldH5IxPJ7vQi
         HileGERI5fVBqFr71DJ/zGBk1hXOC+Q4NV/sic9h5Ovdz56rVHmimttyGWetOcO0+/Wv
         ObBPRepCEszbso9guTTgPSFk0r5jLkm4p5MEvA/O/Zhkf1DuXz+DMnSbscItAeUL3W+Y
         RLVu+tQaoV9eTdet8uQvuNizCo/WfZcETp/LWMsaYqYmr7H2I/AXVzxHf6TMG26PRatU
         /dH1HyFletQGiro2bbyGMnr9wDfvCVJyd+SrBP4lhT5Wn0bQZ7NYXgYdqNLH9JxybI4Q
         g6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839439; x=1792444239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8+1OKLLfY0HM+hYdXDzeeA60NjAWoNrRG1H/m8ZLgSM=;
        b=W3CHynLGUIqXWJEqBIKdDGtpyx0Ry/qxurvPsrfVCNukJJCN9iHrzV2XyUvLPvR0EH
         iVMq2qchGlbQn9grlyU+swhVp+JImZjWxj23sHVWZdMJQ0xT4EQh/0hiG7oH4XRqMYWq
         Kndji04pZ6psO3pxtkwXxe0sDZfOK85W3fr5If0dL3roqm8rdguvFydlEu0+4quZOU72
         RdanykyjxMT1bu2qvxAA/dnfOgofdgJ36UqOfswDC0kPm4hqxpRsbuP0cnCvAE1C1Gyz
         eB0h9nCwDFbLz/sOmrrfejpSNP+Y68l3PUJ4MxETM9j6vQ2N6d5OZ8qw1VlJtFCwdkec
         KuGg==
X-Gm-Message-State: AFq9FYL3MgfXqphoxBO7DQbW257hujkjdPQ+LZHlUkKiRQOXF5ssMh8f
	CHwEqL7n+8CIap4QuaB+1cevp+8cCHVZlPw2Kd2hfZV0AfLiCPQlij9E8BD2YsTm
X-Gm-Gg: AYBFou2N8xxLcSqnWCZU7oxRntnW/2axsQIFPantKVUTJFTQ5ZTETg5bcaoDXwzpgDQ
	TPPqBBokX1u5swhAK/3N2Zgz+OYSgjJbgyY3QAy0H99HZCCXVtGIt8MWyjc9rFHObSGVtgRAEyd
	Hb3bpCwCQgHrxdV2zfMaWKoTd3Asd8Q+gkZCWB4tViAoBI4tXK8YPHJ85cFxAKmIckI2xnahgso
	d4to29HMP2nMxfsB5if0ROOHuNd3bttw/UUv6SiQnmJV9v+4w3HryV5CIeNZjPVxW8F9MyRvVE3
	t+OJGtAiYnGUeOxMm5C1ulW1e3aweirc5i3CmiVAVqPinJKe2wJ+w2AuyD34dtM1S9R5Tyvg1Pq
	ZbHozTMMJUvP1lqkc4XTVP2ePDVUBvbUarxarQJrn2w4H1oM/Jmyb8FtL8KJUy1BsSxP36rYcp/
	z5L7mrZb5psBkw6FDAlX6EMxaJUhGRTmcVlL4Rj4rjHXsvxdt5PdERFA47KK39bDvDxlIGmdSkE
	t0ZycGBThRVXSF3QtyJz4vFj1huRL6guUlcZkBcJg==
X-Received: by 2002:a17:90b:5343:b0:39e:4c81:6c5f with SMTP id 98e67ed59e1d1-3ab3a953758mr7956500a91.26.1791839439497;
        Mon, 12 Oct 2026 14:10:39 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:10:39 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][blacksail][PATCH 9/43] haveged: ignore CVE-2026-41054
Date: Tue, 13 Oct 2026 10:09:33 +1300
Message-ID: <20261012211009.3352822-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130779

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Debian[1] also confirms the fixed version.

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-41054

[1] https://security-tracker.debian.org/tracker/CVE-2026-41054

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 086a780db02e001946bba0ecd337ee7834da1823)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-extended/haveged/haveged_1.9.26.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.26.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.26.bb
index fbebb158eee..727f8563799 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.26.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.26.bb
@@ -21,3 +21,5 @@ EXTRA_OECONF = "\
 "
 
 MIPS_INSTRUCTION_SET = "mips"
+
+CVE_STATUS[CVE-2026-41054] = "fixed-version: fixed since v1.9.21"

