Return-Path: <sam.van.den.berge@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B6CC54E64
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 14:07:23 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.53101.1711375641120167255
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 07:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YjSB6BK6;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: sam.van.den.berge@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-341cf77b86dso678621f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 07:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711375639; x=1711980439; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aEZbqSdxZjnAddwAw04VpL5pKrrcpSWJ3EGsrQNK9bY=;
        b=YjSB6BK60tIJcdphXmnYnNdSw3sCLIG2p/g+/iSjWjM9glB9/bC8GVhWjteSIZOpoG
         xHerle3IzLhX9V7Yif6oYXzNaDVbXwntqxE+D5/bs0qE0f4Ue8yU3CQ4KwUMCdQKDl2v
         utsLc1ksAL5+wtPuMX17BmPNG9ZhM8BePxLwKNFxYXpFR/3g/a3a3H2qGCb50pXP9vaW
         SRp1vSqo3MtFqCcMPHQyoEUvbb4UvY2/GgBksNXtxuykFITKWwovS9bfcgMUI/LzCniQ
         E9l08sF8wmXxlzo5ycEa4qlZD3oe4YCSbGfEJNK4DBFQybKND/FXD705ZRIC9501ZI4G
         6UcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711375639; x=1711980439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aEZbqSdxZjnAddwAw04VpL5pKrrcpSWJ3EGsrQNK9bY=;
        b=aModcwGmBjps3IHlP7KwC75NdrO/Ndli6dXj9fCQnHqxfY45HmdSCus0c5ii5CWtuP
         LrmtsnvJE1mPPl6Ie9Tda0JMkthf+GjNoIi5TKzhBKi/+qmYGI4XtIcDZSY1hD6/5IHh
         KaXlnI0z6OtREDcqvgAZe9V0b17s0A10drD1GK7lTL2Ion6DVqee9y+b0EvgSDxVqBXm
         41XcDQv41krIQBkX9gngDMtSB68ITEN3ldmwWTaexmZKkfgSVZ42nbuSN5aHEtrqHueY
         G41IKSPSoFLRUkPuZk9D1QVr3LmsEPDdJ/W1xbjlZZv3a9358bQzNUB/G8oSJCUktSky
         2SNw==
X-Gm-Message-State: AOJu0YyTP7DVE1M7xHYJ5PXAgIgJK17QDGasKl4kSs9ndgvq1Ux0HfNT
	S6Eu5tC3vWAnmK7H5/Gq5xigOlQxonq4Bz6yP1A8EZbQqJ7JwCiJlFx5EcM=
X-Google-Smtp-Source: AGHT+IEZoFsR88My1KmfwDBjCs4RzivCs5X7lupnsNO0k9atWv4hMaRTRzYX53Kl1rLZjzY50u9i/Q==
X-Received: by 2002:a5d:60c9:0:b0:341:865b:65c9 with SMTP id x9-20020a5d60c9000000b00341865b65c9mr6323639wrt.22.1711375638985;
        Mon, 25 Mar 2024 07:07:18 -0700 (PDT)
Received: from OP01518NB.WTSOUT.OIP.LOCAL (mail.oip.be. [81.246.50.154])
        by smtp.gmail.com with ESMTPSA id t14-20020a0560001a4e00b0033e96fe9479sm9586005wry.89.2024.03.25.07.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 07:07:18 -0700 (PDT)
From: sam.van.den.berge@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Sam Van Den Berge <sam.van.den.berge@gmail.com>
Subject: [meta-python][PATCH] python3-aiohttp: add missing dependencies
Date: Mon, 25 Mar 2024 15:07:16 +0100
Message-Id: <20240325140716.6064-1-sam.van.den.berge@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 14:07:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109588

From: Sam Van Den Berge <sam.van.den.berge@gmail.com>

* attrs is in install_requires of setup.cfg in 3.9 branch
* python3-misc is required to include netrc which is imported in
  aiohttp.helpers

Signed-off-by: Sam Van Den Berge <sam.van.den.berge@gmail.com>
---
 meta-python/recipes-devtools/python/python3-aiohttp_3.9.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.3.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.3.bb
index 2cdd352e5..10a3085ef 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.3.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.3.bb
@@ -13,7 +13,9 @@ RDEPENDS:${PN} = "\
     python3-aiohappyeyeballs \
     python3-aiosignal \
     python3-async-timeout \
+    python3-attrs \
     python3-frozenlist \
+    python3-misc \
     python3-multidict \
     python3-yarl \
     python3-aiodns \
-- 
2.34.1


