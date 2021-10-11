Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76174C43219
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 18:42:05 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.2784.1633977724025340060
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:42:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RfqRcx/P;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id e12so59141957wra.4
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u4AJSZ2PZ2TvSPJ4/wbpGG58ci1rlPm6UeSBvLWfwB4=;
        b=RfqRcx/PuyftsCNf7fCfeBdzhsRtGWUILDYofiMT47Vh3vY0IeTc/OipShqs5ofbcP
         NPBYTtzack9jl05Zq5vvg6AS20Cjwu+zoIKWPQ28tFJ/Cw0PWlG+cQFzIaXn9ChhhueJ
         vEPqbucTRnJgquvm+TJcFZOyVX2uyEHRY5HOEURQl6FsynuLwPRhm3NWWDMS0VGFlP03
         /vnSJBCJVpQW2K4mzQJWQyYYRH7XYrC1B02/lLgjUI4yzSM59Q7rFoxnJxK5TAj9zXY7
         Id8pDGgEKVNO5HCWOjWHMBeC41ztS6wgN3gnj4mWVyVWKnd/ra0nVLM7wzLcR1dRZ3xh
         ywUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u4AJSZ2PZ2TvSPJ4/wbpGG58ci1rlPm6UeSBvLWfwB4=;
        b=jmbkPDaktpFwbTU+zH1EIBIWuSOuxtY3kwwUainybo1MPwzLwNY3atQVkZSJCUrWye
         3xBrFnA1DxDh0TVp5FyO5M/CQ7xVW4cLs1IlkGoamXXc+C0FOK0pU10V9SMkx7F5Ziwo
         Z9eQxdKnzJZwUU8x+YVw9WAYIbvNHH4Qm45xOdHOMkKKsakB9eBxJy/72GrxiacLGJ3L
         rvFGMJC5jKcOpss0AZ9vIeHHc2Y99Pxb7WVjX60V1IjmQzDss/+mCJDSzBnopQIefsAy
         viP0UV5sEHKWWGhtMVlwY0m4G2xvciAxF+oLYN/fYQcHqgTlW0bn+Z3CMuMMpaCJVXzW
         Y9+A==
X-Gm-Message-State: AOAM5319gmNWN6UCnDGCLlxq1x0Io3PfNOV1X7KPUFQCpH/EnUWayrQr
	sA7CN5t28XDGdd582Uc6iGC3N2Dsjlta7w==
X-Google-Smtp-Source: 
 ABdhPJy1Negv3X0gQNVcNRsocnW+PWTTAGzgMNna+xhqdkpaT3a9XhumhI+qr61/jjTEOAMgc5VuMA==
X-Received: by 2002:a5d:6d86:: with SMTP id l6mr27029589wrs.293.1633977722690;
        Mon, 11 Oct 2021 11:42:02 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id u5sm272936wmm.39.2021.10.11.11.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 11:42:02 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 22/24] opensc: do not use -Werror
Date: Mon, 11 Oct 2021 20:41:38 +0200
Message-Id: <20211011184140.653609-22-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011184140.653609-1-alex@linutronix.de>
References: <20211011184140.653609-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Oct 2021 18:42:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93236

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-oe/recipes-support/opensc/opensc_0.22.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
index e8bb505e4..44a0dccbb 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
@@ -24,6 +24,7 @@ EXTRA_OECONF = " \
     --disable-static \
     --disable-ctapi \
     --disable-doc \
+    --disable-strict \
 "
 EXTRA_OEMAKE = "DESTDIR=${D}"
 
-- 
2.20.1


