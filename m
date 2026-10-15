Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13FCBCC6B2F
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:43:37 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33237.1792043007481652523
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pGt1mVcO;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e5d0ee1951so30922195ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043007; x=1792647807; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qDt2FLp+TMVuVM/EB32L1w8SQfeIqCLI/G+Yf3nPJ0A=;
        b=pGt1mVcOkOq+Tb5xCUvFpxGUYNJNoklsfvfUboCLNdoPpBeMEsdDpRvKGpzONzbDG1
         /GI1+pQj8mQxT9ZdA6aGw4kQzgIfLC7+5bpVTEfjy6Ks0oBetc9Q2z0ZeSsyxyv0thGc
         Nmhn7agroOI7rOIvibFdEADLEeaBOocq+gzWY+Yxhe4s0ZliPTIdB2twNHxB3pbbItcw
         3SwJTcrTByzodHALNoMvbxW6F9a05tfFMLdEeVDecPzbCX3rTJNelvSVBboLUcJmPYn+
         MWR0AJi+kiux993P6ljdznlUcJoTJGJtu8dAquTVFbX0LsbKKYm8LnPpQ53dLXMAl0Ul
         ewtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043007; x=1792647807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qDt2FLp+TMVuVM/EB32L1w8SQfeIqCLI/G+Yf3nPJ0A=;
        b=2CtMP3yPz8gJh0KwEXrf0S0YVn8Y8ZV6jI0LCnCzMaGW1QZiAlARG3u7xxWlnvzaaE
         gSbRqNO0emwtw2Ze8Dv9HjHloMPZMX2R8o8Yk7Pj5HDBIJSM7D91aChBdP+j7ROmnzb2
         iOtw9L9Mcm4cARvwlrkMzfznyX6Hu1pwjQ9/WSYfBtI+39aYJ6Je2XiaaXVZyHuQvtV2
         83hoZiQ8vOWV8/FCYaiG7VAhte/Yq+iIE7AN7njcXQbpz1yvzF8I2VMrNpfjU5ftjRpH
         vZrvbUsJtx4YBJi2YDJydodQV4oLTdmIYeYzYS4NuBTO8pnM595+Z04mjdBUnm9RxQge
         KMCA==
X-Gm-Message-State: AFq9FYJTsK7jiDCm5x2i1pSw76Npku8oW3natFvt+36SnsorcoUWn7os
	uCejePDNQyjvkLS6ZbSIJxReH54enkxUlv5kOyBru/+dUmIko33kbONd/d7vuQ==
X-Gm-Gg: AYBFou1nY0SfH9vxtgMuZuPW4ykgyaoaS17Ce8mpVXgHt52vdUNqLPc+yVaxp1dsjE+
	KHC0Mu6FV0V+Uznk55wvCoDO4uFjBrLfKdHSX6neHATrz2xqwnPyjTojdyuJ8PPtnf/yT5vFACx
	KAKo+5xhUd0+i55szGz/qR9lOXHe2FyykLuW+yTGU5M26jUfPH2Q6xePtoOwYZvis71f7/UIioh
	nt1UzR0i2oTH/+q4m8oKCEQdIE89AMeGe4tQJRqpOyX5HH1ScWR8/crkjdwkmaIGr0GK0JDu89T
	81SpnSBC5HKEm2GHBnHfe9/WDkuo5rEYyeDtoOL4QEQbMWGrZEZ4CvuBHheTPoBDDlNKRErXBEm
	Ms/Ei3YHksVY25l7ralJJBuzmut/lurji3YfMZAUnEjSbDWLQNrDz2NohkrXfDUUWcYntFccabB
	3Yb914MzgTIIqFHxPr9STllRkbTYkqPV2UwT/ZcfGVfyf4Kztcz9Ar/0ig8IT6tjS98yfiZbFzL
	oFW08vbAYyE4WHgdgtnLos=
X-Received: by 2002:a17:902:ce0d:b0:2e9:5714:6082 with SMTP id d9443c01a7336-2e957148c0bmr15239885ad.55.1792043006787;
        Wed, 14 Oct 2026 22:43:26 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.43.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:43:26 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 18/82] haveged: ignore CVE-2026-41054
Date: Thu, 15 Oct 2026 18:41:06 +1300
Message-ID: <1ea608311d774be4d8ff87b8ff40fd190ae85058.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:43:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130938

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
index fbebb158ee..727f856379 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.26.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.26.bb
@@ -21,3 +21,5 @@ EXTRA_OECONF = "\
 "
 
 MIPS_INSTRUCTION_SET = "mips"
+
+CVE_STATUS[CVE-2026-41054] = "fixed-version: fixed since v1.9.21"

