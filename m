Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD36DC61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:06:27 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9069.1788343586200755004
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZrzIrf6m;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc1a4c62804so916513a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 03:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788343585; x=1788948385; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ogbGGh9jtlIZq/Ale7HOJ+sENbia9HNrq2dTUIgrP2Y=;
        b=ZrzIrf6mTXubBYzIN37szaOTYVwvabd9M6UyofCcWTjBg+uJzR9wEeRwxlCdOeuZuk
         0yTRqb0WlHsSJGzrI4RmQkOP5htCAkAaw00akDNrgP5LUwysF1xfrZz2evA7CiexnBz+
         XmWStAV3xAdwWR5pAM2hRh2UR9OoxdBX06oyV3Whlzi2bVdJf5x27Fnolh/LnbltHJCg
         9qYj0j/UKLcVw7FwnR6Bf+B+NpffuYXUGoRTwwGpKpc8seVfp18zXMxOCzDuPzBrROOU
         LXMOfXVEvkO0lGIR0TfWVTaHI14/jIr6Ix+2NA83IAih4STVdAdPq85mFVocfqZhVqCg
         zWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343585; x=1788948385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ogbGGh9jtlIZq/Ale7HOJ+sENbia9HNrq2dTUIgrP2Y=;
        b=dz91l3+mgWhtsjPm3odTThwNwtQQZC+AV0w9ME0agE7KjBvcMnY7KiIJUy24+Vv1aR
         RW/JPvCGQ/puYs379nl9p3XccXhlHgxSkOPG2LFwOtzasqudXTN03BfmTbx9BdSMNmMU
         Zs8q70YvR2LN8I+k+9RKvAaK+7ZjjyZUV4RXzIx+VqnkzaFt/Bex2/tpan4qBeID700P
         c0V5s1UnGmtXkni97pszeTMYHFbISlV7uHxvR68GP0BGKPENsCudrBJRcEOc4HVjwiTp
         8Q123SXckfcsRcxUmSUMghJcTU4SAxZzwpsctbhRsG7Bsm4SzJJ9l5A3hckAZwVuYbm8
         3oYQ==
X-Gm-Message-State: AFuF++nueHWSzSAcnXiDaSAg0gSxO02GXXI57xhX1aqHAwqqbWIEr0w+
	kQqV5v8N/58bMvQhVFud/dvPszEkiO2rg95q5f+D7Cj0h1SM0plcWofFZcofwA==
X-Gm-Gg: AYBFou1gMox5g0mJ+ee4jUv2kyOyVcTTCPNYDT/pj066aEneU2NUjpJD+eo85RZIjGt
	9K8ditBBm0W48zAuYLrsbyzsO6yYf4tGHjenzk7OrcsZYXhIfVwStxkUKm8yvD3zA6PpsSrmqGT
	PLdgqHsLdksqG4IkwEwfz0v2rSyndDb/QlbMo+bcuR6xZToyt9k6mtqtrUacx/tsYfy/xx4+inu
	yk289DWBf7jfjHTjTzgFwI32bsEgjYNnL2afj5UCTOSvXKZUHtdU1HkCk+/dDz+mmZudmIgr77C
	IKvm0djueF+F+pa40DXolhSjkC45hLl9lM1geM7ydvdRzVLULuY++T9DrKRz5K8KXNJTcJFuokm
	OQfg1hB1ZbcsrzN+buNZe0GmYWepH4Kbab69cBTdIuxD3qDi2+PA792V1l9goADKdzk0Ju9zilJ
	6CnkrrkysnqnfmbAcUsrhaRGzaYXTmhijSJkvx5n4a6tYmSon2+sAxpCnhTH00q3XR5j+g+ACO
X-Received: by 2002:a17:90b:28cd:b0:398:e96a:8999 with SMTP id 98e67ed59e1d1-39aee0e6633mr5467600a91.16.1788343585569;
        Wed, 02 Sep 2026 03:06:25 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1dcfbsm10766784a91.2.2026.09.02.03.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:06:25 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 27/28] iftop: ignore CVE-2026-3824, CVE-2026-3825 and CVE-2026-3826
Date: Wed,  2 Sep 2026 22:05:09 +1200
Message-ID: <20260902100511.2105916-27-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
References: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129658

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-3824
https://nvd.nist.gov/vuln/detail/cve-2026-3825
https://nvd.nist.gov/vuln/detail/cve-2026-3826

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-support/iftop/iftop_1.0pre4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/iftop/iftop_1.0pre4.bb b/meta-networking/recipes-support/iftop/iftop_1.0pre4.bb
index 4d9fea58e0..5971af2b3c 100644
--- a/meta-networking/recipes-support/iftop/iftop_1.0pre4.bb
+++ b/meta-networking/recipes-support/iftop/iftop_1.0pre4.bb
@@ -15,3 +15,6 @@ SRC_URI[sha256sum] = "f733eeea371a7577f8fe353d86dd88d16f5b2a2e702bd96f5ffb2c197d
 
 inherit autotools-brokensep
 
+CVE_STATUS[CVE-2026-3824] = "cpe-incorrect: this CVE is for WellChoose"
+CVE_STATUS[CVE-2026-3825] = "cpe-incorrect: this CVE is for WellChoose"
+CVE_STATUS[CVE-2026-3826] = "cpe-incorrect: this CVE is for WellChoose"

