Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C697AF588EF
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 15:49:27 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22981.1776700158505940962
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 08:49:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bFmFoGbA;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488d2079582so37847045e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 08:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776700157; x=1777304957; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tZrSMS618K00l+awSnaOGryXHOgNOmtoxitDozLA1Mw=;
        b=bFmFoGbAUW5SkFcCCRmBEQaIXAyHdSs9tEmZ2TmekIwh9GnszFvLlsKbAEcXcxMjiB
         TS78RepOYP+QH10SPFJbQLZSWBYdubHGHk9y+dBMRKqkJ0u/kcdl4txJtIh8N03QFQE3
         LutOV7QQLlFjvX6riVRZ9gI705XyS9y/zvzKZH7MBPs+vcroUEc4J9GEvXOR8WQZeAiS
         Q9Q4x5XMrbGh7Rb8z6Wh4WpDHK3Hg3riRZvtgaP13cgDqFkbog2dzJysalbsa7TMgajE
         goQG9Il0l+8iPqVZGTPeg+XQYudGLeRkiLFmTJXOHbCGEsSP4UFoDEOEvVf/vo7JkiAp
         SRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776700157; x=1777304957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tZrSMS618K00l+awSnaOGryXHOgNOmtoxitDozLA1Mw=;
        b=kzGJdJOZZDn4qeEM7K2AIRFJmhXH9KWUmCnUYQKMsxRSvnEOxZ+1aEOvrAMWJIllkc
         mVvY9jEwpZNdX7hj/5ZSClHtMsWElr8rY7wsC1PqlRf8/qb50u2UPtxCWRe2GVA4u40Q
         6yP+pWtmAWRtBztztLxzIZjNCgMZuxjgOBfcsYcTKnTORfdlxzAjCxs0U5keKqT3Si53
         E4rQWcMkG8It+Ndcyjzoz+Tv9MjwBomTOHHv7rkgfpMY/Awckf1nHog9ST01aU43zHUY
         r2XkNs2qyP4Pl3v71I0nD3zUmqkgJEidSqqWwP0EBUwyBSgA8WQOFWU0lLVa8IVGY9gq
         QKPw==
X-Gm-Message-State: AOJu0YwBF2EGJ/fip5LI17tgmjD76r+rKBe/nhd2XQWUoR1A3W7tadjq
	mH39Kc7kj8muQ90g7pxTwND/dO8rlJN1bHdUfG6V5onNftUzw2UxDb+pIqPGog==
X-Gm-Gg: AeBDievy73m/7SwiiQs3B+11xU/UUky09xGWtcI5sdta9J4/5qIWXIfASp0YdUG/1/4
	8TpJ4h225dfyph9z4ZbsV9+Ji/H9l+8pl63uoG/brp8u1alMoWbFMxgjOSlbnHKDAY7duvaAp7B
	w1XKB9QC2xFDiiPRMBXpYqxTMlV9WTiFhFISRIanjp0kVrkHAWjmgb1HRPxO0feF9xSHuNP0JMa
	RYAs4eYBcbdIc0oBlhYmp8/geQJbSKaRiqAH454mSLdFACF7LZwY7DIo1tfYROdnU2AVjSFutCf
	WagJNoANCjjRn9aMna2hQuTHDU++NEdcewybTJleCArti5pJpvtH1BB5wRmLo6d52QlBQY+dG6X
	ud3sQlJb/G49AJjukd/PhMdU80fnjA9Eekh2xekWl7sh2WsiPQcyb8+ViljyaQEpRa0ty0AaHM8
	BaQPegG9g+PlI/PVVfa1yArZqSqztgfo4=
X-Received: by 2002:a05:600c:1e28:b0:483:7903:c3b1 with SMTP id 5b1f17b1804b1-488fb77fbf3mr196331795e9.20.1776700156549;
        Mon, 20 Apr 2026 08:49:16 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm85279255e9.9.2026.04.20.08.49.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 08:49:15 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 01/12] tomoyo-tools: fix SRC_URI
Date: Mon, 20 Apr 2026 17:49:04 +0200
Message-ID: <20260420154915.952359-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 15:49:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126504

The previous one stopped working.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.5.0.bb b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.5.0.bb
index 2fcdb6bd61..ea9913abba 100644
--- a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.5.0.bb
+++ b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.5.0.bb
@@ -5,7 +5,7 @@ being useful purely as a system analysis tool."
 HOMEPAGE = "http://tomoyo.sourceforge.jp/"
 SECTION = "System Environment/Kernel"
 
-SRC_URI = "http://jaist.dl.sourceforge.jp/tomoyo/53357/${BP}-20170102.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/tomoyo/53357/${BP}-20170102.tar.gz"
 SRC_URI[sha256sum] = "00fedfac5e514321250bbe69eaccc732c8a8158596f77a785c2e3ae9f9968283"
 
 S = "${WORKDIR}/${BPN}"

