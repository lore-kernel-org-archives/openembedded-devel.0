Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C50ABCC6B3A
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:43:16 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33232.1792042990974683323
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MM0DEOCV;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e5fb79ce82so27171605ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792042990; x=1792647790; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6lwJNj3bBLCP99d622u60HYHiBJYer0AB7ZaE+Q0pUs=;
        b=MM0DEOCVMWNl1OpaGYsKkJcoU5BwrwGSkoXicX7tpyL/y4m4FfotHRIj6r8VEcgh2e
         EIKFjl76IsxrfptAAcIwg8IKNHBhkIbogguIMOhxEkUhpOPOYj/3sSPloprt3pV1wOdr
         WAo+dYOcx8G7JyrdQiR9HRpykokmo14Ttomdn+MJDDeLid+tmbjkaMZTDGZpllr9xbTJ
         iEHICRJ4xQCWv6iI154YHiEqIFj29PCBaPDTB2yrLqh+2duTrK0pKWeyfoY/hL/n9v8b
         7P59MAdL2877qYK5M75AIvNXKf7qA8myKRFLpGsuT1HFifB6gx4GwhKefDDwE76IosD/
         aREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792042990; x=1792647790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6lwJNj3bBLCP99d622u60HYHiBJYer0AB7ZaE+Q0pUs=;
        b=HeXPUDc0bSyRpuIz0D+NHXWD07cUXo33N/HgVbra++L9PdUMurPNy/Al0eICqHj7+D
         sqsqi81uINJSpr33Gi6u2NdUYPWGfWciTVjjADv24OVqW2/gsxVCU4jZRNb4CpePq0sP
         LVVDxs8PXmq50VtCLkWNu6o2Q11zeP984sFuB/abvAzXhY1MVKv/g1hJwY3avX2O+ZR2
         uN7kVomnoPxzerIx8tsOP6DitkLUwJhsotdslZzWV1XqZzTidFbrEIcZ7SgXWJg2Vglh
         5WHeH5QGsJBEGy42Iz2707Cad8wtMiAxDh1H3tlTH8L3vlbOBxSwpDFs2zzlWUaUWNXI
         IasQ==
X-Gm-Message-State: AFq9FYJxWfhT3nVNtQleE+23Cs/hfZMV45gC/W3UQ6SdGK+oBfdAEyjG
	BLics0tK1mDQUitQxcrOOMkua+FXXjljTeKC45L1isTwbelKsZW4Tq3VMz5MkQ==
X-Gm-Gg: AYBFou0CURbzBdZYKB9J+VgfwsJThC76yPbS2pWF7IVxu0fAQqcQs83qUi07m+QrLP+
	1nPzK48tW6FWXbZ7RZ3ogYZo1BSefSr40k/le7c+27n9tO/Svh9FDiTgM7g9AwtUfVaiONU4eUY
	prWCMBGtcFrYp5dZ3FoaYA8bUPpFzpWzHZrG9/vW4PnrHquY7qVr9YRlriK1lMAo++e/HwTUCvE
	WOlsTeoFHzmy/M0ffFa0l1PxyT7VYhMAH8kUF4qki9o6l/dLZjU+YGdcJvonbhhNc6/MppR7wae
	XWMVR4FsYZbHCplyaggrLTRcSmVfL56pzrTxlAWMU1zdLDY2drHXT3NfusulrIhXeMZFIrOobpb
	9mkXnwnDW/mirfnsDp1HE+TZsVGTZhhnsG4bDIHfmV2+E/jM8rqczPKkCkYOgmApajqUO0CyHYk
	YoNJQHfbZkdzcDJZLadytZnlvR6AWsnkSU/dPhkwDMDptMhq1db1N8U7tY0vX/9cgnfLFPw9OR1
	8PdwE1hOCi2mHMxtdy+9lY=
X-Received: by 2002:a17:902:c946:b0:2e7:e73e:7091 with SMTP id d9443c01a7336-2e842bc6d99mr170698245ad.31.1792042990287;
        Wed, 14 Oct 2026 22:43:10 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.43.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:43:09 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 11/82] civetweb: ignore CVE-2026-5789
Date: Thu, 15 Oct 2026 18:40:59 +1300
Message-ID: <fb5b535db7deadeb01fa7bd4a711ffe4a2f06725.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:43:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130931

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-5789

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit db080436aa68c50b0500aadd33a366916b12c782)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
index d9ca7ccd53..df64d4cd35 100644
--- a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/civetweb/civetweb.git;branch=master;protocol=https \
 
 CVE_STATUS[CVE-2025-55763] = "fixed-version: The vulnerability is fixed in the used revision"
 CVE_STATUS[CVE-2025-9648] = "fixed-version: The vulnerability is fixed in the used revision"
+CVE_STATUS[CVE-2026-5789] = "not-applicable-platform: Issue only applies on Windows"
 
 # civetweb supports building with make or cmake (although cmake lacks few features)
 inherit cmake

