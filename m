Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC89CCA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:11:28 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5079.1791839481998679206
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:11:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HJKRsTVx;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ab9268d90eso943392a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839481; x=1792444281; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E5JilhUTxMtWz8C+tADtofg5K8PQsEMD8sLFp2LpaKc=;
        b=HJKRsTVx4VihyfqK72EMAW3mlyiGap8gPQuEZ2DAubcb25tA5p/e3GLJjr2jSDAHhf
         tSlqf9Vt3X5Js/Tgz0rr2c2JVuwKbiLgxe/1wNB74+MZ7iCIMYF8hN7gXvEM1/HYSbcp
         4yHgeuoG4Uq/iI0fYliPfvT+BtpiVrla5gKeQeUp5yw9vK9wSBf2Foep7M1XRZ9O3aVJ
         xz7T+w4wzGRWewiIqjJeRaJK1MNYIx/zQnC2WrNGpwFpkFFxeGrEI+kNmH/42IVq6Oz7
         6qB4OsEhpap1uHqVbPzkdEXKEzQv6RTidn4Sbn0wuk+hfpMN6jqPj+wBe6mBdPoqteNN
         bZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839481; x=1792444281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E5JilhUTxMtWz8C+tADtofg5K8PQsEMD8sLFp2LpaKc=;
        b=SDUACDP1VnZk0wonCIceLEjK1PQuAe6UViwZLCAkMc3B2wAsX5eaPPMokGkBOiWLUN
         45We88Td6P6p5FilrpHnXwSfpgZfziBEo2HtU0vkb+GL3Ezr1N20ubNqOfs2Dc/jVYg7
         KdAkYaggV0rOtwb/TRs1XdaDsTEcW+vF/2HeDDn6deRNIWXIylfl3HL+ykFeF1LvJGR8
         XMa6920+JlJdDLRHmH/Wp+ado1ekP35GABU1Fj3W34dzyJ0u6xFBIuQ0+bSc/Z/aGw5P
         gjg9wOpsPkFJYcWJvY7PmgD3+R+29GG6BjRF7OezIPgL5vmUu0gfM5iVEmZXkMKON17Y
         zksQ==
X-Gm-Message-State: AFq9FYKK6HuoxRpNj/OEprdCRxUjDs3umweeMIPbSImNdNb7ln6fJQ1T
	9/ueNhJB20H/DoYk160EEkUg/qjT4UNhKT/ThXWksWHpbpaGKTl3vAsieexmdDP2
X-Gm-Gg: AYBFou16qTXCcj4rWLzlTnNqwb0BtnUqOq0+QaLpwUjZpcEp8u4KLfsttFJ2zl8tSGF
	SDh0qG/JsqCWpe4trYZmEcojVqxsVJdxaPcAvuGffDpMaErqbiFnT87EvTxxDCnC7r2GxCsorWe
	TZdbC/sKX9EhpsPhXFe9UCq2cG+H3gjfA0LC6bUGDxAZfcNeJf5pc+5p33nPtwgGSgtINS5cW9E
	MZHxCm9z3dzevE8y81/H2AjnE7FG4iTSCvRCaWySvVSf2cXfX/c9moJczcUdn/ItM5qEOfZPf3n
	hOEodH0v+5PVr43bnCHupEWApny51VITP69wwnYTzyMBlI1U7tow/Bujo0wdEZ4K032H58fEP94
	QcR2ZOhz21ZG3kLQpIr5j/NhqHcmD6EbWzJh0O3Rub532Xm5fAEY6xjIkGseNn9d8yRCo9ASuJE
	ALkVxszDOXX7TZtgYfaKeK1KpvTcDivQqNDvB4H9jbb/mZHUTSroEAYEL/C1mIDiCEHsmQMWK4h
	5pcSt66UrHYjfz3HiVEz6e5U1QB3gfKtsqT1MAFqNGj7EdWGQ==
X-Received: by 2002:a17:90b:258f:b0:3a5:c08:4c41 with SMTP id 98e67ed59e1d1-3ab3ae368c6mr7775049a91.50.1791839481370;
        Mon, 12 Oct 2026 14:11:21 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:11:20 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][blacksail][PATCH 25/43] libssh: ignore CVE-2025-14821
Date: Tue, 13 Oct 2026 10:09:49 +1300
Message-ID: <20261012211009.3352822-25-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130795

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2025-14821

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 6541aefe606686445b5f7c7feb7eb4dd78ce5543)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/libssh/libssh_0.11.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.5.bb b/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
index d2f5072d1e1..738f8b17311 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
@@ -48,3 +48,5 @@ do_install_ptest () {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2025-14821] = "not-applicable-platform: issue only applies on Windows"

