Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30966D116F8
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 20:19:01 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3257.1764361131238731070
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 12:18:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M3gGErpy;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-429c82bf86bso1448472f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 12:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764361130; x=1764965930; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5r3Ahh1SVyTq9jEleRHP+3AWSO/1XIdkOc4bnU5tRjA=;
        b=M3gGErpyv7Hd27BbUIorSJxDjStdN3nPqFSxOlx2dJsqv41ifKTKdMLekMy97H8JuK
         wBXsYQ3CqvX2EY/SFiJiZWOx/GhcUvY+4Z7DxkeNFppIqRE87xX96G4iGMnmryx7awgK
         aYe6UK3aXT0qpT3yPx58h8ewYrZ1cqFSi13agCtWl/qmN7RdRApA0Rni0nHkhEmK61s4
         Pt0evTjkXDBUj0K8n9/r4A1KwXNvEse2UP+O+J6CTL1gW/Wnoot2c9Spryf7AZSS5bkF
         BugImBwSE9qhVT5P4TcA9fbSrblaB4hMbncfq7t7EYIDNDkuXgx2tbTWCHiPqGZuo19v
         tB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764361130; x=1764965930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5r3Ahh1SVyTq9jEleRHP+3AWSO/1XIdkOc4bnU5tRjA=;
        b=E36XZxuwPRfK6/BBUji9rCUpr7YQmsZ2Q0rtvPNPkoo9dTpJGeX82IAhSLDP/iOSQj
         uWwNUBKicJPsz9qPpLMZJ0HOMCjhBTN+qK+lLWQfXHk7PU4jrYJ4Dd4x/mAMhISxOse2
         cnbVqhFw0nrsAqMR+P28d70CUDZYuG5rDlZXinK8K/whHwThu36n8OmjLxNx7T/W7+5B
         plb3RskKtimrDNcn3/f1hgEDC8l6Nw6k20O0isdk/UlsnNWlie1WHxQfTABeKyJVnmDR
         FoasVzu9o5rmgW+Hxf8EZur63/B1zA88xpkXE2LrE3tpEfCkLKPWgC2vPqL9RD/GF+2v
         7QOw==
X-Gm-Message-State: AOJu0YzD3LEGWGe1qlx/jAlwg1Dz62JMEfD9LKam6JWb2Hi8r+MhHE+3
	Rg4uMwk8MePkDp/OCFg44vbYUPsPfa6AkCQAX8tPDGrhOAtmf3T5D1eH3HSyjg==
X-Gm-Gg: ASbGncsw9tCgV8qFk5WsY9Y6JfGRQT6MZR8qX37rGSSkpMu2iNk4F8+9SHSL0gDE8pC
	172Atz+qbhlvrwwCMCht8Eod/4fHAeyVWvBUIYj/g2S4bQ13YvPP61zxxkSYwANypTu4Ef8Nyly
	zBPq0aPeVdGMRC9iTSGvnGLwzIGH+/kUQvncEB3PfXAWdNr9M9ccaJiReOdMbfiFdK6B1GAUley
	3Vqf56iWfWOyNRXocNm0jHVg3ThU0kIfFyu2ZYG7sgsDrlRJ8dElHH3RymtROVmevd4GOXlAKaU
	KhtO3oTtNRtpDJWyx8H6ZW3U41B7D04jwlalX/L2XpPDqZCfzaRJ7iJjOj85T/+RVGzt24jixbU
	Tj5H0tVNPxRkpBfq+UUkrgUICpqQ+IQ/Jv18frpJ+WrunbCh4wR4x860oohsc4LGgoKhFT1CxGs
	on9e7zc/1e
X-Google-Smtp-Source: AGHT+IH0Ar/MGrkX3WVXWgbiiZv8ngXktiqzW12eq1T2G8ogz7gmCHJ82r9p7gkzUMeI3RibcB/vlw==
X-Received: by 2002:a5d:5c89:0:b0:42b:3ee9:4775 with SMTP id ffacd0b85a97d-42cc1abe271mr32402483f8f.11.1764361129553;
        Fri, 28 Nov 2025 12:18:49 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d6064sm11674324f8f.13.2025.11.28.12.18.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 12:18:49 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 06/14] libraw: ignore CVE-2020-35531
Date: Fri, 28 Nov 2025 21:18:37 +0100
Message-ID: <20251128201845.2578315-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251128201845.2578315-1-skandigraun@gmail.com>
References: <20251128201845.2578315-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 20:19:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122138

Details: https://nvd.nist.gov/vuln/detail/CVE-2020-35531

The fix is already included in the currently used revision.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/libraw/libraw_0.20.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libraw/libraw_0.20.2.bb b/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
index d842501ab4..d87c78f46b 100644
--- a/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
+++ b/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
@@ -10,5 +10,5 @@ inherit autotools pkgconfig
 
 DEPENDS = "jpeg jasper lcms"
 
-# The fix is already included in the current versin (0.20.2)
-CVE_CHECK_IGNORE += "CVE-2020-35530"
+# The fixes are already included in the current versin (0.20.2)
+CVE_CHECK_IGNORE += "CVE-2020-35530 CVE-2020-35531"

