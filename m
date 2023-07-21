Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14DFCC04A6A
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 19:25:42 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.15581.1689967535898360660
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jul 2023 12:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=SlWjiCnm;
 spf=pass (domain: baylibre.com, ip: 209.85.219.50, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-634a3682c25so16429216d6.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Jul 2023 12:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689967535; x=1690572335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kNLVSy0JQcofFqbHfVDJyVSOkWCgoAFqWIFgcaR2MWw=;
        b=SlWjiCnm3fpDUGhdJQOj2I2nTq1did8Jk1GqdZmhtG1kH2G44Lil6UogTZqg7qEGeE
         4O6ALv81kH1fC+2ULtYvxrGcSmERzCIcB7tFPwyTkA76uLTKGNynnSEUrAZhT2MpojiK
         uu10xsijxfFwtr+545kf77Ja0lfGQde0mclPBBfkDNBMI7jV4L3e3aLJfD4JQGKZHmLY
         nFWwIyUCPENwnHBs3kPJyvhYiRxBpMhnJ7XwibwL/wlJ5AYv6qFyZrDebUHGdoDaTyPS
         559pssilki1uq1DIne8NpoFAFKl0+kqTNgb1bQ6D/44eUC4gWf1IBfqNkomB9OdqGur5
         /llw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689967535; x=1690572335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNLVSy0JQcofFqbHfVDJyVSOkWCgoAFqWIFgcaR2MWw=;
        b=jmSDoWtrI6V47Tx9DoaEgQEKpUs514yESLHZSqWM5nas24E6LNQ2gZwhHjFn5qYtJ+
         IhwEN4OdMdLS1jc2FcPCmmpc22yJErVKiDuFj26L//koabVKhPOIYMEwe6QdwolsfrMQ
         4VKNrg9nJTcveDVIv94qSJvUu4ViOLTeAlMXwAESoeCtygyhOFT8lBWMQvk3nMYio4YG
         nBfIuOtAYkvT/P/JFU+edV8ARCi7v070ejupYkXWIZmKg1rOJ9hrZKWvxqMCaoD3GHAN
         9Yyayu9tRVWD6MNnDez/WwQeu9bDIi332KuxAuLEsOYxU9sbM6Z3s1JHIxahDAbpGW55
         Iegg==
X-Gm-Message-State: ABy/qLbSE3hQw3g5B1It428eMQqYCv4TxV2lAVqx8BaeE1swXzgiV/Yi
	40kUjl7On7LHeSf7y2k4PYgbG0xU2MDmeZDdbJ4=
X-Google-Smtp-Source: APBJJlEdoucvtxVQwWHnC/xQZbeqXqmu6VvBYGQ6aGwiF0ktD6MnUursakt4DBuwkE5SNrw9Lx8Zxg==
X-Received: by 2002:a0c:ebc9:0:b0:631:f06b:823e with SMTP id k9-20020a0cebc9000000b00631f06b823emr887419qvq.65.1689967534929;
        Fri, 21 Jul 2023 12:25:34 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id k30-20020a0cb25e000000b0063cdcd5699csm676669qve.118.2023.07.21.12.25.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 12:25:34 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 6/9] python3-blinker: add python3-asyncio to RDEPENDS
Date: Fri, 21 Jul 2023 15:25:27 -0400
Message-ID: <20230721192530.2515633-6-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721192530.2515633-1-tgamblin@baylibre.com>
References: <20230721192530.2515633-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jul 2023 19:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103979

The module fails to import without this.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta-python/recipes-devtools/python/python3-blinker_1.6.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-blinker_1.6.2.bb b/meta-python/recipes-devtools/python/python3-blinker_1.6.2.bb
index 8e77df088d..b0728e66cd 100644
--- a/meta-python/recipes-devtools/python/python3-blinker_1.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-blinker_1.6.2.bb
@@ -8,6 +8,10 @@ inherit pypi python_setuptools_build_meta ptest
 
 SRC_URI += "file://run-ptest"
 
+RDEPENDS:${PN} += "\
+        ${PYTHON_PN}-asyncio \
+"
+
 RDEPENDS:${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
 "
-- 
2.41.0


