Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12A7CA0ED3
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 05:33:15 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.43318.1725427987627944861
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Sep 2024 22:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V6zTq40Y;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-714302e7285so5540514b3a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Sep 2024 22:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725427987; x=1726032787; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1k9VQWFdMtm1eJlPcP7wU69AUMe4pRqNSo5mHVotzY=;
        b=V6zTq40Y3WG1XIwezcgt7iqLxzelcfqDGhoDiw3w+LNQU2HSwVy9ls32/6U/o1Fthr
         kyUas7ACDKwIeeZHtCEZNFiG8hNEL9Bb1CCx9Fh0XBtfGhffwzTZlhTALIiLouQasve+
         O25XeUGlrrEIhqhOKvnIV1Z81ERa7SKXcD2REeGXovr6M06tmQKSMkRiTF/buF/FDxYK
         qkG4Xo7hQwtc+N+TA1ODBWci9S36o7bn711PpHpK8EEoxGlcqXpCcPgCER8ZIW00NL4j
         DKaexzyfcO5d/f1P62OipdN3a8AEV/WmNW4jtnkJEVs0pR2dUGzb6hXcTOqjknSuFTI0
         2tFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725427987; x=1726032787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i1k9VQWFdMtm1eJlPcP7wU69AUMe4pRqNSo5mHVotzY=;
        b=bN6tcggsPVMtul6/No5hUSI+bllMO4XAscrKtGignDq4UgrkOzZ6jw6GG39RaJ/uBY
         EN6qf7H6oPEZhLjLRpoQMJunZ6fG2pyteI2yxPZXivy5KwNb5xg4KBbW0ZSou+fsDO2D
         rKdHxBpZm72iho6g3o7hIm8+hFjM7Xl7okCq13HQ15ueDkFm2ooVXfCdBuXdmafHkz4N
         v4XX8jpKn7ibD2KTESKCm0x8DbF2mFvRSA0F4Lz4wIItfu1HX2QhVxNVTfnqS2ruK7Fe
         woE0QU/1ouyMdnfZ012fseqPle6uaXrR2D2ZoaZnJ01FQ8GonVwZZJXF1GHrbzz/Czql
         Rpzg==
X-Gm-Message-State: AOJu0YxFOF5xpEi3qDUNdASByShq03ypAe8Z3awfpt6ks+P2nQuC4FyF
	32RxEdtTCV0M//S3/tSzikDTsXMEBgSuvkvbpPiAn6z5yyaxRLURPJgkMVCW
X-Google-Smtp-Source: AGHT+IFYP68yxzn6TX+IhAmI1crovxm4Ifz7oDfwpCi4buHJ0otK6rdCt7T57a4JekfqC8X8LXd4vw==
X-Received: by 2002:aa7:88cf:0:b0:714:15ff:a2a4 with SMTP id d2e1a72fcca58-715dfc042a7mr23116629b3a.13.1725427986720;
        Tue, 03 Sep 2024 22:33:06 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71778589896sm776515b3a.128.2024.09.03.22.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 22:33:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/5] grpc: Upgrade to 1.66.1 release
Date: Tue,  3 Sep 2024 22:33:00 -0700
Message-ID: <20240904053300.2085710-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904053300.2085710-1-raj.khem@gmail.com>
References: <20240904053300.2085710-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Sep 2024 05:33:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112088

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/grpc/{grpc_1.60.1.bb => grpc_1.66.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/grpc/{grpc_1.60.1.bb => grpc_1.66.1.bb} (97%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.60.1.bb b/meta-oe/recipes-devtools/grpc/grpc_1.66.1.bb
similarity index 97%
rename from meta-oe/recipes-devtools/grpc/grpc_1.60.1.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.66.1.bb
index 63c696a623..7968d63a87 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.60.1.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.66.1.bb
@@ -20,8 +20,8 @@ RDEPENDS:${PN}-dev:append:class-native = " ${PN}-compiler"
 # RDEPENDS:${PN}-dev += "${PN}-compiler"
 
 S = "${WORKDIR}/git"
-SRCREV_grpc = "e5ae3b6b44bf3b64d24bfb4b4f82556239b986db"
-BRANCH = "v1.60.x"
+SRCREV_grpc = "e821cdc231bda9ee93139a6daab6311dd8953832"
+BRANCH = "v1.66.x"
 SRC_URI = "gitsm://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
            file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
            "

