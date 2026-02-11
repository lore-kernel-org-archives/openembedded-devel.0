Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FE9E9E2FA
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 12:01:06 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17599.1770811264129246778
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Feb 2026 04:01:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GnSjtELa;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-81f5381d168so1945843b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Feb 2026 04:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770811263; x=1771416063; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMkTEtWoL5pzYyAcD9UCK1XSh9eWnvBuIhHmaXLNw7k=;
        b=GnSjtELaVX1eYU3JdFFNrrY0R314RruR3zDv0L55zy+qarNw42WHdfEp3taYZEmsQO
         arX9HJNFpZCX2wRq4khTRmQt+sLusmL4793pCJGWerHk+KjfXDtli9mFtQtxrr7p0xoL
         YMRhDkKYH7lQFrvVZZMAXdr2YkL7puOEd5OoG75Kffr1gPWayQM/Jvupaq7IWBSY/yIJ
         NxokJoaGLVMQahUm9ZEazDLGtSgOXTgUVAbHQl4fYX+6dLlAQS+dodSoGkpzJM/22MO2
         hOhOeM9C/LMEW3uTSHsEV6L1Iz6mXcGUay59UT98oVHQfegDNPcEG+Co27CG2hpNfm2c
         rQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770811263; x=1771416063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LMkTEtWoL5pzYyAcD9UCK1XSh9eWnvBuIhHmaXLNw7k=;
        b=HhFBgC/c+/gzPoMZcMPsAcI+chl7LcNW1RS1VIvfb5N8FTEWqTLrA3ST/2zHfmf5vL
         dJq/ykB57c0Hv0trpJPFWTF2m0eZTJBSip+quKrTVdPvIXRDyg46J22s5WEOoos3ZXgZ
         uf1JD8fwSqMNrqD2+AHmjjQ+fDVIZ8byEu1sbY+XGbPQQ1iGhYQK8IWnuYACbo8dzLdt
         fXNA0Vw5VJmwSki1bq/Tn7RccKGaWvKJzo74meyGWW5bv2sLdop+c9VHxbqROAGO/elC
         hTXIu3ZYEn5DrpZDcmZAjQGxxtrL9d4ArXfG3UOT/69+ot+jcZkVtDuE2A3NzbjOUwZ9
         RyLA==
X-Gm-Message-State: AOJu0Yxgo4fm0thZil+A6Qs3g8mgLlCJD4sKVIUQWAMIznhoNB3UYYZL
	VZm8A6zu3AHH50xzu0Yv33SbjS8lMjw7daEPT0xWo5HoSfzficUjsEjargEgfA==
X-Gm-Gg: AZuq6aITM6KWwq64tXO9XCle3zVCQmK+V8IQVNqKqwcGzhcsJsFtvj7bceMKoNeudTU
	ZZ8vpwMi8vR/5cLq+T+hVIR5bY3W8pLSnrIQclQMFN12OxuQ/2vqz8LfAKq1q7f3RELfNO4mJRY
	x+MbN38ILxdqp2PvelruvVbDSXgmctSMTQeIaGTAKnN/KPLj3ji1J9yRyrxNZJ/6+SSAakv5bIF
	83c7tnrqCNjFvvaW8LOksPK+MihPG6u+u7sXi/ekKP2My4WbU4PlxNKD0liXzn94DS3KfDcli4t
	O1e7/GRZfT1ooWRVxtzncgPSeNlvcYOu4E0bhsP2/bkcMg4QVW6Vg1zqWD3v6uz5mPUL1dkwEDI
	qdV+Gev8SmInED9hBnFK5ctqjVey61XLM23xUNQvbGwatE5aaWcqly8F0WUJZhcWre8WwVhfwhw
	ddFy+UnQ8Oy0ZouPdBPkVsJdrWedaq+bFlVfw=
X-Received: by 2002:a05:6a00:2e07:b0:81e:711d:b26f with SMTP id d2e1a72fcca58-824416f7a4bmr13884328b3a.43.1770811263308;
        Wed, 11 Feb 2026 04:01:03 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e3669d8sm1805831b3a.2.2026.02.11.04.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 04:01:02 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 8/8] tomoyo-tools: update SRC_URI
Date: Thu, 12 Feb 2026 01:00:25 +1300
Message-ID: <20260211120025.4190831-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211120025.4190831-1-ankur.tyagi85@gmail.com>
References: <20260211120025.4190831-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Feb 2026 12:01:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124336

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

The previous one became inaccessible.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
index f172168335..a90a33ada4 100644
--- a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
+++ b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
@@ -5,9 +5,10 @@ being useful purely as a system analysis tool."
 HOMEPAGE = "http://tomoyo.sourceforge.jp/"
 SECTION = "System Environment/Kernel"
 
-SRC_URI = "http://jaist.dl.sourceforge.jp/tomoyo/70710/${BP}-20210910.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/tomoyo/${BP}.tar.gz"
 SRC_URI[sha256sum] = "47a12cdb1fe7bbd0b2e3486150fe1e754fa9c869aeefd42fd311c4022b78010a"
 
+PV .= "-20210910"
 S = "${UNPACKDIR}/${BPN}"
 
 LICENSE = "GPL-2.0-only"

