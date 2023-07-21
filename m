Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F68FC04FE0
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 19:25:42 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.15562.1689967534842747465
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jul 2023 12:25:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=1FyRAxrM;
 spf=pass (domain: baylibre.com, ip: 209.85.219.43, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-636274ce31eso15529406d6.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Jul 2023 12:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689967534; x=1690572334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7GuM/Yr+FVtnkJ3GxlxGxDEsPAySY4U6QCj+/m7pXg=;
        b=1FyRAxrMG6m2asrMd5OJSGztyz2U2OpcMMVUaoGKiO0znTndx/VGspgnj+2IJngum7
         Hs0aaVNfaVLQjZ80z+dPQPgCHy2i8ybwsz+zDOyrGD4O290NMMJnf0k5VLJYqRE5kKbk
         79FyiT29egzGyFHqDMSOnx5KCQ9x/CGk1cVvA9sAbZbGsk2YFVGAl8OEEfqPj0dM9N4+
         JX4l0Sv3KQr1Oo1nTK6CP731g7ftbz9iv7u8YWcIQft1bU6Iz66NNwnj6B4ekc27zZ8k
         EgI7j4AlKZ5YCFfU1fTnbg9me7robcVyWYvjLm//eQ37VnH07xdjbLgiRUAfv1y6EDGJ
         xxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689967534; x=1690572334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z7GuM/Yr+FVtnkJ3GxlxGxDEsPAySY4U6QCj+/m7pXg=;
        b=KE3Mlnlz94u8ZLzW/7FfE7c32gG7IhSeGdH1EsVrNfRKovBIs+lzRnXrrxTsoMW4ru
         g2gGdxWSHDVVYevTxvqSqat0BmZDC9sX8s3rQchNGs6rodrc8yUdXfTUoFZqjfx9LZN2
         hBYa0U9SgRFXwdwUFEpKGA5MtXqvDX3S3QYQSm/OPMIWWMjI4FqEJWBBYmpVUFggj1po
         dgoAZ5zjZdeZG7Mh/R6eqp3Z7wxIIQufaRhOr8418hPDFAmZ4ZdvpFTTkQC8y5L4AgEh
         8v8x6DgFnWTgxP+GqP+bsRRMVgcXb2r9e+T57v8MR65ZObAGzWOfbmc/uoCTRcbytUd8
         YGrA==
X-Gm-Message-State: ABy/qLbk/+gw5roSPpp5kabcSJAh7Fiarv5uVrnudvQ7Q9Yhb5XgzFqd
	X+v672qn4ERTqvwi+fciy6HlFWLBsEAWkvBF8UA=
X-Google-Smtp-Source: APBJJlHEuWp5+fd4EYmOKOGiZo54MBPj+X1PR14gmgBJF/gwto49j4KOBHEFwV5sHcpyjHSC8TLSgw==
X-Received: by 2002:a0c:b317:0:b0:630:198c:3c60 with SMTP id s23-20020a0cb317000000b00630198c3c60mr1037841qve.23.1689967533771;
        Fri, 21 Jul 2023 12:25:33 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id k30-20020a0cb25e000000b0063cdcd5699csm676669qve.118.2023.07.21.12.25.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 12:25:33 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 4/9] python3-bitstring: add python3-io to RDEPENDS, alphabetize
Date: Fri, 21 Jul 2023 15:25:25 -0400
Message-ID: <20230721192530.2515633-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721192530.2515633-1-tgamblin@baylibre.com>
References: <20230721192530.2515633-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jul 2023 19:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103977

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta-python/recipes-devtools/python/python3-bitstring_4.0.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-bitstring_4.0.2.bb b/meta-python/recipes-devtools/python/python3-bitstring_4.0.2.bb
index 243504b666..a4d59913f8 100644
--- a/meta-python/recipes-devtools/python/python3-bitstring_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstring_4.0.2.bb
@@ -12,8 +12,9 @@ inherit pypi python_poetry_core
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-core \
-    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-io \
     ${PYTHON_PN}-mmap \
+    ${PYTHON_PN}-numbers \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.41.0


