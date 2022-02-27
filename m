Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A3FC433FE
	for <webhook@archiver.kernel.org>; Sun, 27 Feb 2022 07:58:53 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.7184.1645948732378735028
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 23:58:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LZZkF8Ec;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id g21so2043469pfj.11
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 23:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bJiDEnV+feyMeNuL7sm2opkrGhoYQWLMB/dMQ/Seg70=;
        b=LZZkF8Ecyy/0/KruwrHMjmCY7/PtWi4rWcD4VdbBBSxQZcQyY7cdn95GruB1U6OrJw
         nkdPSc3zMkjZYAiJGS8N/IpPxerNjqd3QKJhqQgo+aBQLeBvF2wPVwZNVt0oLnVHsaOV
         hlvfOdDZZMLwpPbDM10vX9QrErjWXADfbDvn29FSxJ/430MiImJADSVJFMqJR9IOlFE1
         RSm92I1W+GQ94NUm8ad0slwqOQZs2qfUMveu1aMlKmpRd2jjmyNci6UAMAea/ivN7l6M
         BavBfw46xSJit9Jmoh8kBHgiPcW+Bk0iyVyRAUwn/0QmXm4Mu2XyoT0FMLxwiUXHaT+7
         jqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bJiDEnV+feyMeNuL7sm2opkrGhoYQWLMB/dMQ/Seg70=;
        b=q3DofOz4p5CZhafp+n9T8NwRrBJsmtVb0hnkpEJlI5jeyji4OsYmVWzphTB/DKWyZ0
         f0i7qDfqhPfqyJV9Pxy1qLNOeziY8wLBivlhc8LR2oTHr3apSz3g+fEv6UQycuricuUL
         vgFLkHgsrRtsJYyudaCPgQMQg8yBbZOjv8r/eoKa35XSu3jFhz9+pFZZhBaB3nBdKV8d
         oOlRC+VZYpDu1h6yTqMQNSM9Y7cmu2WHypU+3FTN8mSI6pNuRCGAj2S8BBwS4IEPrWv6
         5P4oFpXa4bs8djMyly9sEJ6FNwGE/nwqojW4NJf/5cAKLer/u4mqrXIGUU1NMBAZvgE6
         asXw==
X-Gm-Message-State: AOAM532mCuYidWixZmcbHkPIwTzPd8SbX0Klmj6rjPZ8C6bQNx+pQ6Df
	RgvS5/a8zjETbC1PjMLG8z0sJUv4ZWAt1A==
X-Google-Smtp-Source: 
 ABdhPJy93dl+TMy2iFin+nDsOQ5/moMryecOP9g1la8bE4ETOly/5VUQ+JiJTaxWFDhGPnAxvABpkw==
X-Received: by 2002:a63:407:0:b0:373:a770:b1c with SMTP id
 7-20020a630407000000b00373a7700b1cmr12921938pge.93.1645948731690;
        Sat, 26 Feb 2022 23:58:51 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1a20])
        by smtp.gmail.com with ESMTPSA id
 a22-20020a056a000c9600b004f10137a096sm9012845pfv.50.2022.02.26.23.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 23:58:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/6] cxxtest: Define PIP_INSTALL_DIST_PATH
Date: Sat, 26 Feb 2022 23:58:44 -0800
Message-Id: <20220227075848.610467-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220227075848.610467-1-raj.khem@gmail.com>
References: <20220227075848.610467-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Feb 2022 07:58:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95555

Helps to find the wheel file

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb b/meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb
index 65b54ed548..b87972f413 100644
--- a/meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb
+++ b/meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb
@@ -10,6 +10,8 @@ SRC_URI[sha256sum] = "1c154fef91c65dbf1cd4519af7ade70a61d85a923b6e0c0b007dc7f489
 
 inherit setuptools3
 
+PIP_INSTALL_DIST_PATH = "${B}/python/python3/dist"
+
 SETUPTOOLS_SETUP_PATH = "${S}/python"
 
 do_install:append() {
-- 
2.35.1


