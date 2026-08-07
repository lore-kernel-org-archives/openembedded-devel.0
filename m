Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C0C4C5AC7C
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 07:10:26 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37225.1786086624718655916
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Aug 2026 00:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ImhrfV/W;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso3802463b3a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Aug 2026 00:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786086624; x=1786691424; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8/aApFbVdIsCjwn+Ts7ljoHTTr1FCW8XIWjfpic4/TI=;
        b=ImhrfV/WPCTxbVxLsGu8bQfOLVTR8zWtewU4qstwuyKFJqVk7o8gBNFtmFAtSxpgH3
         xQu9ymHU1XgHO8yZi0msUPidkwB/KEAF4BTHufbE/h7MB85CVaP9W3cIUNp5bmnZWdwJ
         b0olNEH+trZb/+6V5BH8rmkpWl1lJpLrQPwvHGjsZwuOx1CLKOTKNjAxWdZSCSzqSGeg
         d5Ub4iKV4CS0eDpImpfFaEt2R/QgJBFg7Q7TPnft05O4ycQTUNvAzpeh/htv1k5/0EPi
         9IwuH16RiXGh68oO2q9ho8Mdeanj+NqjWQlqiZ2sQjG3fjxQjTUlF/2PL1q6tzHtjFUL
         P7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786086624; x=1786691424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8/aApFbVdIsCjwn+Ts7ljoHTTr1FCW8XIWjfpic4/TI=;
        b=mjc/LKTTI2CvhkAs9dDf9lvpzJn4oTFmPXENL7N7jyF4KrR3dG9aWPFefqscDylTHg
         6NaCehVCrCKKnLBuIYRtBXEdHFHI9UITsBm+E0CMelht5kVmA5FGPNqqXV8gG4Ahmn74
         j0uAVPjf2+HR/EMqMpADDcLHsZHYeuAj0lbvB3nK/+ntyCtNbziIPS1hSDGQbRs5KU4e
         2eX+Ggt7HQkbqHr9NBsiMiLFDwFr1vT8fDA+Qr6tEXliv3pTf76N7siwneh6fCD3Wwxl
         YMSqnsXNJlrqY1ym6mEeB7EcYLDK18W8snBqFvlTl/oczWrS6nHQgUqjVjhszVBOEOlQ
         4J9Q==
X-Gm-Message-State: AOJu0YxYpxznDGkzsBNIdU4K12HtxTQUriQqhNhR9JAydXrm1rVmwZ7B
	yBLrBTDJQnc1/iT4AunxPNARwXgzCDOQeTKl6BA1ayWQZRIcoDpuWYcQRDciOnhz
X-Gm-Gg: AR+sD10rHfjWnqUxUZv26ksRM7uku/Qon2SfyiyZonkwG3nlWuefCkE420LChJ4OWgC
	DGRRmNWc1O1XaOR0PtFK+z9YC4IJ6NdqRn17+kTGI85QR4xEFlfCYjxi4CenQlqCAf4pWxVwuzM
	CspItGCzg0iSHa7en18dkPFdeLPdDMxh21N3gUwrr1EjVS2LaeaeqGSjfWh8gxUQ95BZEEIZ66R
	1mn/YlfspGSmJN3NDamcqsXZjuVOvE2bOt+Pd9UEGi9rochVgbXrHiZZdjc45WVF9esaYvXwJgG
	NAZLOKVVEwpTrtK070ZDUjs0qs82yDqJLx6q2DfGMzR8FTJVh4tZlx8naUdCtnylSUPq8nTRjtT
	inZsJEsRo9cNE7x4hxTkltfmgkqYXdj00EaqgNNWrH2DZGJqwGesgo+JvhtMhkHQNAuNEoMQkDe
	t7aniUbdsdbJK/5h1s7xJkV2rk8kTt32ijSLByqeHwv0aroVKvIdlclxHgFKhVemWg0sUfBQUGn
	r6bdBtw9mFslQ==
X-Received: by 2002:a05:6a00:4b05:b0:848:56ff:6ced with SMTP id d2e1a72fcca58-84f2e0148a8mr21943980b3a.8.1786086624115;
        Fri, 07 Aug 2026 00:10:24 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a51e99asm520440b3a.33.2026.08.07.00.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:10:22 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 6/6] jsoncpp: upgrade 1.9.5 -> 1.9.7
Date: Fri,  7 Aug 2026 19:09:51 +1200
Message-ID: <20260807070953.2275518-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807070953.2275518-1-ankur.tyagi85@gmail.com>
References: <20260807070953.2275518-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Aug 2026 07:10:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128863

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://github.com/open-source-parsers/jsoncpp/releases/tag/1.9.6
https://github.com/open-source-parsers/jsoncpp/releases/tag/1.9.7

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../jsoncpp/{jsoncpp_1.9.5.bb => jsoncpp_1.9.7.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.9.5.bb => jsoncpp_1.9.7.bb} (93%)

diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.5.bb b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
similarity index 93%
rename from meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.5.bb
rename to meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
index c54dc94666..8194c554da 100644
--- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.5.bb
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d73c165a0f9e86a1342f32d19ec5926"
 
 PE = "1"
 
-SRCREV = "5defb4ed1a4293b8e2bf641e16b156fb9de498cc"
+SRCREV = "3455302847cf1e4671f1d8f5fa953fd46a7b1404"
 SRC_URI = "git://github.com/open-source-parsers/jsoncpp;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"

