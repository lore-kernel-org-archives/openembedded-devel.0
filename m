Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C023BCCF9E3
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 01:02:43 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.4835.1761872553896833203
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Oct 2025 18:02:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H6GdQiFL;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3408c9a8147so287569a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 18:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761872553; x=1762477353; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xCvRYu1bviUwXQaBRvZ2K6srzVquskf8gfZCMLEN788=;
        b=H6GdQiFLcHPw5t0qElkUHO1ND73kWdlXA+e59BdVRuIMOFlAkmItVD8+aQbNJxnp/y
         naYuDMsPTq/DO7ecKLIiPq88f1eCMtv9DXYVkZ2UA/Jyow7EzWmYiCKOt36YjvMV1qH8
         xjimZCGMYHWvNz/JDzkvERt6qNLRpuAPaLVTHAsc85bwf99hTI3D2rMJGYHsxtaqB6Bn
         Mq1H1Qp3qIRvDCAJE3j+OoIMUFNS8J9lrklYnlpGoT6iov10d5FayinT6wuHpw5q0R0K
         aPPOfDFghD5nI++spjrVG5D5dijvkYrxs6y0vedkMlfKxSy+PjSGYll9wDUlm/Sr9LtT
         5xNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761872553; x=1762477353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCvRYu1bviUwXQaBRvZ2K6srzVquskf8gfZCMLEN788=;
        b=w/PzD4AdCRuVVYYjBJIDGj6S/wzozUyPz3nbXyflelUB1PqRAGBQr4emFrQxa3mXmD
         MCKsXAgDWeLMItkg3naMuWvoaQfJPBUFt9NMe+LM71BnhqhmjyRsz3/hrOp+CxVYoSdo
         omZUreLCrlV50rTw5LDf1/TgPEeJGZhvbxpHqydgMRKusOE+TlXtfO3UcpoxNkflMmtU
         adPTc87luKDL5g0KSVd6Iv9AFjhwKwxgNX/Eb7GsOhUl8pHk28uD3Ot3BJ5TtapYbdm9
         0Bt+5y6njwdb3bAFRwgFw0jXsZc4o+LmxvvbJrgHKF6Da0bemcVvl/RI1ye0h+dA/wph
         5c2w==
X-Gm-Message-State: AOJu0Yy5DdAQduVn5oK17VqOuf1vQeXGi8/qrUwQ9fAn7XFlvqr8pnJ2
	KO+SzI8oE6es2rquUdv9OIEuBDU7kW9o1l4YMLuJW8vgLdd5UxZ2DyTa8zIGePzSDik=
X-Gm-Gg: ASbGncsRXNZRI13UJ5lbL8M/sRK94wxn3iUWAH/hgvgex3KyN2ZukmdNAPBNT96Au5k
	uYWZAYftW+rxVVLNjybL7FDJUSDCLxW0ei9dXp2ftaM7WUKjJz5hQSXEgkJPXfjJkNhe6iUgbYO
	f+CxmYKLHl21RgshjvK5AfdxDZihPBmmbEQDgrVtGAXF6BNSqTClp4Cxhq6Jcray/2Ow1NWH+SA
	NqqRIQJfb+2FITyuwoQZDH8qXDTnmnYUZYnzNsTM1cOWWGszbQ/G28WSkFQ5kb8QLPPrNYlcBhd
	EdWKsKEU0GqVxwQsH0HHZbMcKJN0xgKdVsZiSNQhXjwNsPcWIYkVQIH+pwQS7/hJ+Dboixqt1TN
	36XMXtu8rekw3RK2HegQVgctByfeWcP2SebLLlXWVxR8QlDpd/SmkZyGJns+OYGRha3N0hcyFcB
	3GoKWcfrdWxa/2X8SD+ay58VEU
X-Google-Smtp-Source: AGHT+IE2MinDFZGGpdtR7FzpkUajeYN5laBbnQVhF/wiEF+bU3viC+bFSj0/gb2aKpgkF5WZY2sT7A==
X-Received: by 2002:a17:90b:4f4e:b0:335:2d25:7a7a with SMTP id 98e67ed59e1d1-3404ac7e680mr6109394a91.10.1761872552823;
        Thu, 30 Oct 2025 18:02:32 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7db678f67sm132334b3a.57.2025.10.30.18.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 18:02:32 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH] mercurial: set CVE_PRODUCT to "mercurial-scm:mercurial mercurial:mercurial"
Date: Fri, 31 Oct 2025 14:02:24 +1300
Message-ID: <20251031010224.2876415-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 01:02:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121214

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Other product "mercurial" introduce false CVE finding like:

https://nvd.nist.gov/vuln/detail/CVE-2022-43410

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/mercurial/mercurial_6.6.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/mercurial/mercurial_6.6.3.bb b/meta-oe/recipes-devtools/mercurial/mercurial_6.6.3.bb
index a312be4aa7..3fa692029e 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial_6.6.3.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial_6.6.3.bb
@@ -34,4 +34,4 @@ PACKAGES =+ "${PN}-python"
 FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR} ${datadir}"
 FILES:${PN}-python = "${nonarch_libdir}/${PYTHON_DIR}"
 
-CVE_STATUS[CVE-2022-43410] = "cpe-incorrect: The recipe used in the `meta-openembedded` is a different mercurial package compared to the one which has the CVE issue."
+CVE_PRODUCT = "mercurial-scm:mercurial mercurial:mercurial"

