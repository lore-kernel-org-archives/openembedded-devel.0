Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE7BC433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 17:22:20 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.425.1634750539309204389
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fuGViWOQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id q5so23122134pgr.7
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F5nRzFTenQLXQW/tYu1BihEr4WzYJkbnnb3gYsiBrgM=;
        b=fuGViWOQNlOmVanNA+XDRQSZ50lwPYl/CwCMb7rH30dfrny8RC6z+eYlUj1tJE5Wi1
         r9m0Qb7YTzPNtXLE26o0oazFWUKKMGbW0YaGB0DVagIgZJb2oMvuZtqR1vEoXIDkW/Zb
         ccUGXJHApFBeq4vFXtAElaMPVyK2QYowoKPme1wg1fwv7usJ/LPYr5NujY2XAfQbHP+t
         PQJhG9vYTuBYFV9lOQUBe74Dyazv4zSu+XGlfesFF9YJixMxz8fgvEmeC6KHCwk/g1mY
         d16SpYncCq3DI2T1g19nVvyFBp4wdxiizosIVMvF0kjgMnCooKnNm1zZrmXhD/y23iJq
         jIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F5nRzFTenQLXQW/tYu1BihEr4WzYJkbnnb3gYsiBrgM=;
        b=BWRKlCC1jRF0rha47I4eoWgsfQc6KuxRn1TlqgUCuL7Xg2x2wZeryk4gIZAVJ8s3HJ
         DVDvKOsr286rad1XdPeMdGPAU7OY6sWqh6YWID5zuNZX1hTAemKijSpvg33pjNt9Vqj9
         sPAP8F3UcWSWabG5qC78NlW2jeT1/BuT6LC4bea9wxoZ44YEnjLmEBcTylierVWfeQLe
         weP0/N/w7S1kPDosho+SEYzO7eki+XN1ZwdG7QsQ5lEyew4IVLGyVWHlWl1josgsgcRo
         lBuRJWfFCSg2DyIdE40Utjms6NbDAQ36uxqfV2Fji4phDwKXryQWunpXWEpBMYN6n6V0
         bmpQ==
X-Gm-Message-State: AOAM530zTp0OvFVcz3vHap30DGMoA3eOOvxp5ZorlZXm82cIW5vaPpJp
	bCugAdqkOBZfEMaT477ccvtrb61iOC0fuQ==
X-Google-Smtp-Source: 
 ABdhPJxLXswQji6RcmfNywMw9t2nqgZwrPxns+KN0ZQ74Ebaxo6UOaG1MylrQt8czG+IJPrVC6Hdvg==
X-Received: by 2002:a05:6a00:1309:b0:44d:4d1e:c930 with SMTP id
 j9-20020a056a00130900b0044d4d1ec930mr154421pfu.65.1634750538652;
        Wed, 20 Oct 2021 10:22:18 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8f6a])
        by smtp.gmail.com with ESMTPSA id
 q10sm2899730pgn.31.2021.10.20.10.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 10:22:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	William Huang <whuang8933@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-kivy: Use new override syntax in
 RDEPENDS
Date: Wed, 20 Oct 2021 10:22:14 -0700
Message-Id: <20211020172214.394631-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211020172214.394631-1-raj.khem@gmail.com>
References: <20211020172214.394631-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Oct 2021 17:22:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93491

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Cc: William Huang <whuang8933@gmail.com>
---
 meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb b/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
index d046489021..a4ec62626b 100644
--- a/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
@@ -56,7 +56,7 @@ DEPENDS += " \
     python3-cython-native \
 "
 
-RDEPENDS_${PN} = " \
+RDEPENDS:${PN} = " \
     gstreamer1.0 \
     gstreamer1.0-python \
     libsdl2 \
-- 
2.33.1


