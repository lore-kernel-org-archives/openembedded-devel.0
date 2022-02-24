Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A859C433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 09:23:58 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.8135.1645694637671764018
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 01:23:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=eTjLaRVx;
 spf=pass (domain: mvista.com, ip: 209.85.214.178,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-pl1-f178.google.com with SMTP id q11so1149588pln.11
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 01:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pwguSb8X/3h8wFLKxsbL0ssSv68vQXO9q5bm2962whY=;
        b=eTjLaRVxiaYJqAW0Ttr8tN4IThKGBuSvW2L9wXFdivkAaMYUohT6Q2/X0wS8ZFzt+b
         yXCSmGZehGdJLEGeortuHWxuQ7whoJIeAdkUHgA/dQvpQW7VzZyf0v0DwbYblw8TQM0C
         8Ef10rEPfqbJaKKnxjf0M3DT0nTkXqAU8gNyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pwguSb8X/3h8wFLKxsbL0ssSv68vQXO9q5bm2962whY=;
        b=hoHJ6hksDRIs+vZXeVKCNJKESVTRcmSi6X3I/pd8ClpJAQHxZL/DoDvLUgAyEW0CqC
         fQ+AXP6YIoLFTrGrDqWYIdp/UNA5cXIj2hGevs++AgaoLIr6DD3YeaA7Fhohhjs3sa9I
         tv0SSTiUmGnqWZbn9I7c6VNWkRvvmxQMEVHGgij1aWXUpsc5mNHNNHCLmumSlmRdCVp4
         6i/RkfaeL72PcF1L93MwPHGwwGAJEql+aqCmmOrVu+yF40Ogs1Y/Dklb7tR5fUxcGSvx
         EM9p+EdkqNzWCg2fVeLXeYPWXFaY+ledfXueW+0b50yzgmss9CzyFWFv9V841p/RLwBL
         5HIA==
X-Gm-Message-State: AOAM533d9Ic4/Q5Kwhsf+QoVTLOQUI3FWzOinwfqUEPuXPWsSrKKm4xP
	UL1o5o5p721bWPXZeL/qXId2J0cD/DgguA==
X-Google-Smtp-Source: 
 ABdhPJyZalnWrNslaBxDlWMas3oNdj8mb/3H11ii7fwycu94MvcauZxTwV9UUd8URzEavVCCes5CIg==
X-Received: by 2002:a17:90a:2f41:b0:1bc:46ce:6364 with SMTP id
 s59-20020a17090a2f4100b001bc46ce6364mr1840006pjd.159.1645694636982;
        Thu, 24 Feb 2022 01:23:56 -0800 (PST)
Received: from red (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 v18sm1054911pga.19.2022.02.24.01.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 01:23:56 -0800 (PST)
Received: by red (sSMTP sendmail emulation); Thu, 24 Feb 2022 04:23:54 -0500
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [meta-java][PATCH 2/5] jaxme: update variable names
Date: Thu, 24 Feb 2022 04:23:36 -0500
Message-Id: <20220224092339.2711524-3-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220224092339.2711524-1-jpuhlman@mvista.com>
References: <20220224092339.2711524-1-jpuhlman@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Feb 2022 09:23:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95505

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 recipes-core/xml-commons/jaxme_0.5.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/xml-commons/jaxme_0.5.2.bb b/recipes-core/xml-commons/jaxme_0.5.2.bb
index cf0377a..8411255 100644
--- a/recipes-core/xml-commons/jaxme_0.5.2.bb
+++ b/recipes-core/xml-commons/jaxme_0.5.2.bb
@@ -21,7 +21,7 @@ SRC_URI = "\
 # SGFactoryChain cannot be resolved to a type
 # ----------
 # ... and many more
-PNBLACKLIST[jaxme] ?= "BROKEN: do_compile fails"
+SKIP_RECIPE[jaxme] ?= "BROKEN: do_compile fails"
 
 S = "${WORKDIR}/ws-${P}"
 
-- 
2.33.0


