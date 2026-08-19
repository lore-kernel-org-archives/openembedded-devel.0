Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81808C5DF87
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 11:26:17 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4907.1787138774009146268
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 04:26:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tI/1lxCm;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so987388a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 04:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787138773; x=1787743573; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m2dpzGG9fCb5s4J2J8k/u4LcAqreKUx53f9t2jXSr1c=;
        b=tI/1lxCmU+nOGDbDslYg0S4Ztm4ULEQQix84Bzc9DemW0vr1mFIRtO4wRbbKb1waJw
         9kD7nbznjFCWw7HhFQ6K/9WudklmmqbWDTt+CcrJaJA/ZL5ZnABI0of0IGMhiHM4JGeU
         2FXHjGjIvEUSUP4gBDEZ2rRXn9WNakSYzeKuMFKc2vXzHbd6qYEbugO9A7hhcrr5FeBQ
         U08WX2gMGYb6phbERLTDNUHOUtg9xtIrd2pxWWebi8V/4mEOdnAMONtWlppb4qkGTemV
         yIT7SWBXXYB/qSBYRViN19MauRBmVATF2R+BYYvzjmi335oibmAIfmBDFcaPqzDFcd16
         cfSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787138773; x=1787743573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m2dpzGG9fCb5s4J2J8k/u4LcAqreKUx53f9t2jXSr1c=;
        b=PvAsYCZdSigRwm4P8GXU/KDvWY4VvfZcdyoNM6Tr9Yc+CMUhHqf25fwSOZOyHTyFbF
         raSA+2MPBXxJMBvG6NJU4H9IIq5izhtRbJkrPFx63bBoelBZIlsK/fO+DpN3KzI/8jXc
         CyT5MDvj1l3ixUrDnAgErRUauLGSUuJ+mwvCJrUEL1VaRz3X41DbSHFpT03saTycHsEs
         DnwnmBziH46QJGuxrt2owvf7ABkjlnw1EoJsuvejHE3/Zn9ziVQ7EUVfQFBortokpRH/
         6hiMJ8EspqfUS2c1KAVfqJV3nR1zsDDUVdUwf2/GcIWUsus3T+oRH27F/h2Jmp4wSnRX
         /Hcg==
X-Gm-Message-State: AFuF++nW2/acn6VOLppEiRePOvK3yApvAdJ/W4RK1fWeyPrqjtRvp7OR
	391Jsf3Sxu6cAvm5eLWDzRDbVRr+rBHV/B7TyQO1SMIpsdg8ngX1mvPLoTBMbg==
X-Gm-Gg: AR+sD1215sotbJKNCPr4espcUDENr+Cxkf72vCe4BUpGaDNt3+JJmDO8Hvj2a51c34g
	8O1iP7dBo/hqsoluGP3TS21jeEHQTj55jOuIr1lx20e5wjfwKR2dCbzUHxoiT7MP6wyXWqoKfxl
	ABjUnWTYbR/gi+Ojxi9afVDA6XYnbCCyW3mkpSCsjSWtxlsnYBvc84g3SrkCoqdMozpvzHmxdQX
	ukhjc1oLjgj+cB1D3a2lzA7U3xo4kaZadWwrnEWhc6RYuncimxiYoYFMhFmorndpRd2G0nS8VZM
	s3wCqKiUOUPrecvsUWwJ6IWzfW48tQdCUVBHtOyI+NTHSRhlgWxKU/1XshUbrNjEDrRwkhe5241
	WofYncfvXulpO0XMcNz8cWQtryozkcExuX+0Emtq5S+XQ/ab1Lx4UFr9ey81sNP0HqtqbNQPbVn
	oOX6QzRpyvghe/4m31MB95blh4Gs472sbIGamCumf/JDRQWuaE+3/ZMJnMRlEPKTvqpqpmTG/wu
	bNvR5YRRGPs72TkGjwuN9K8
X-Received: by 2002:a17:90b:2b8e:b0:395:4de4:92be with SMTP id 98e67ed59e1d1-395810c60ffmr7832829a91.13.1787138773244;
        Wed, 19 Aug 2026 04:26:13 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327c2a92406sm5073764eec.11.2026.08.19.04.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 04:26:12 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 6/7] openbox: update UPSTREAM_CHECK_REGEX
Date: Wed, 19 Aug 2026 23:25:52 +1200
Message-ID: <20260819112553.971109-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819112553.971109-1-ankur.tyagi85@gmail.com>
References: <20260819112553.971109-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 11:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129359

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version openbox
...
INFO: Current version: 3.6.1
INFO: Latest version: 11.28

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb b/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
index 5b62b9b2a7..244df0e657 100644
--- a/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
+++ b/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
@@ -14,7 +14,7 @@ SRC_URI = " \
 SRC_URI[sha256sum] = "8b4ac0760018c77c0044fab06a4f0c510ba87eae934d9983b10878483bde7ef7"
 
 UPSTREAM_CHECK_URI = "https://github.com/Mikachu/openbox/tags"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_REGEX = "release-(?P<pver>\d+(\.\d+)+)$"
 
 inherit autotools gettext update-alternatives pkgconfig features_check
 # depends on virtual/libx11

