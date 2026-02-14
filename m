Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 240B8EF99EA
	for <webhook@archiver.kernel.org>; Sat, 14 Feb 2026 01:13:28 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4038.1771031606784986965
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Feb 2026 17:13:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BeFs+PLx;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-354a2a7d90fso863369a91.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 17:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771031606; x=1771636406; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J12UNTW7yOgEI2/iAeY+CN74d+TEIYP3QMCwBal18U8=;
        b=BeFs+PLxkDc3/9uGLILsCyRItMLARddznTjDgjSoKUBX1MgmGEFQYHSTPsK+r2ZBxD
         XIeSNp75uuDJ0l78qLYUyhYDWrrC/K5vSO2cizcMowUB8y5Btyq+ol7lZcrhoS3PidO6
         XJqecmSkTRyyXAoLwd18xVfoDMCH2zXI0QhzmmwMc0EYrOgnn+DSCFDCiAXTUrUYS6v4
         G4CPqSnYitn7I+Ct2EcMvnJKCWYUCRssAIklzoazND3qSQnwhiSzCbgDvUNkcf+KYG2g
         rm8OYo85lSLmABaghoY7fzxS8dHxlw5DfAKm+2Bh8LZF4iPHiuxuxKZg2x/Fv3dG27A6
         JgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771031606; x=1771636406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J12UNTW7yOgEI2/iAeY+CN74d+TEIYP3QMCwBal18U8=;
        b=SQdWFYBHsdrAFjua7nmyBF1B2mCTnfi+wJs0m4st1p4uBG6DWLELE2Pz+A4vJRPMQy
         u5HmrIwaPiSAbIeIf6xkY1Fd1EvYxQjoss9Zf6qHhA4GERZm6kHPItwbkhVL1eguQGYS
         pAy8ER4HQqAwg9dnqnKc1aAjvD9xqDmllL8DnG30ZQMSfA5eMRrd/Ftss+YgmO+Jrvkn
         4obctbfOflQ9L2GmGkFMTUs/nXoqKxE7qSwXB24T90ZcXvkamKfxNMdXCvJaxCpbbyUk
         ke0Yf7DqPypHMjO19i+1mpDmdtqlLmwWGCEGb/GBZ2E3tuAUNuSSKcBECsjMkE6do7Lk
         pskQ==
X-Gm-Message-State: AOJu0YxSnBPOEyEdpVd3XjaMvpm3mmQM/4RRyqHyyCqkJvOHh1DNmx5E
	Rq53HlIkvRrbKP8opYPuiKmWwTBpNwHHIdfa9pCLnGMAHGRvegucx5EB1jmrHCIW
X-Gm-Gg: AZuq6aKo4cPbtVcRCEblZheV57sU87gDDOebSOY6RiVRsbTmnspPm4E9b3SliXWyP31
	MPN3UWp/XsHmDgRtjhEn5mRPCy9pkfdE9fFuxINz9kwsOBbCi/zZy+N6YZ1P+gJeoEz5CHH+XXP
	3ng5c9S4taDhlFW8snbbrUrIitzj6NdqyKyYcOSA5Jw4ifRHPijN478gXaNvdplS+du0RWlVDYN
	Le9TXHZTxqETMtC5z1d5HxlPjvq0pvQ98cP2GzycU8pMFHTRF2MeO+Uy0ZuUuYzbVocwMNMmJLR
	hWqUwJ/pOPG9h/K89dr00qmzKfmYhGjdMXnrwEvTbNU1RoYJ4zl5hL/iIsFjEVAMsySwb7apbGV
	Iw7xY4dH55xCm1gQ14fTJdT88FqyawVZKTio3CPnVepBABAxlHzaUuPpSVVEPfn0mA0YVcbDzro
	nxnalX7kNzFgDorBysT31U8iecMpJAzHybj+I=
X-Received: by 2002:a17:90a:e18b:b0:354:a1b8:24a6 with SMTP id 98e67ed59e1d1-356aad7a8f0mr3177004a91.31.1771031605869;
        Fri, 13 Feb 2026 17:13:25 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3567ebc34c4sm9522227a91.13.2026.02.13.17.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 17:13:25 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH] dovecot: ignore CVE-2025-30189
Date: Sat, 14 Feb 2026 14:13:16 +1300
Message-ID: <20260214011317.179127-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Feb 2026 01:13:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124399

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Vulnerable versions are 2.4.0, 2.4.1 according to the full disclosure[1]

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-30189

[1] https://seclists.org/fulldisclosure/2025/Oct/29

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-support/dovecot/dovecot_2.3.21.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.3.21.1.bb b/meta-networking/recipes-support/dovecot/dovecot_2.3.21.1.bb
index 48e1e8a832..696257930a 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.3.21.1.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.3.21.1.bb
@@ -73,3 +73,4 @@ FILES:${PN}-dev += "${libdir}/dovecot/libdovecot*.so"
 FILES:${PN}-dbg += "${libdir}/dovecot/*/.debug"
 
 CVE_STATUS[CVE-2016-4983] = "not-applicable-platform: Affects only postinstall script on specific distribution."
+CVE_STATUS[CVE-2025-30189] = "cpe-incorrect: The current version (2.3.21.1) is not affected."

