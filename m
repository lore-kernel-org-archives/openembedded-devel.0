Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1704FC7EE24
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 16:33:23 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.69131.1683477200606026431
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 09:33:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=XmYabECm;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-55a10577911so53110297b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 09:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683477199; x=1686069199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Bk2X6CKSS9kjkXffji4z96sIs0WwBS4VVXRrGtM3Fw=;
        b=XmYabECmMLOIu5d9sXlPB/NdaMFsOWObXD4UlFvNWhH201vZ+HgZKZ0DBUyju7u3B9
         tWRDDNfjIFf1cbWYlzCdlF9aY4V3HI4+9/EDRnx/I6TYM0yLCfqDmZYaWvpSuwmJ1S4p
         pvd4fRCSKUxs7u9nH/UsEwhGsYEveO5j1/jFgJnIg8dMz7FhkEGJkmiMO72ZcfZTEOJf
         3zj5F1Mtvs+/VUlZ3OuWrhoZD8EPUfn9XkBdtDf/SFKKaWOrQB3Wzzc7LneiOUNmkZhO
         Oy+8BJvctWwWqvD/tW678I9C1uGM9x28ghc5VNvGzgSol1/w3qD9Hiv/nxp1g89cJEnX
         74OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683477199; x=1686069199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Bk2X6CKSS9kjkXffji4z96sIs0WwBS4VVXRrGtM3Fw=;
        b=AKifsUD8utDYKHUMWCjOkHFX8m95u8rDP11tBe40BtUblNLu5UUlRLt2UT12WRg3pI
         p9MRPkY34XX2mte9vh7jw0w1cD+MC1uWEm8NZQQMLGnmjmxdg1MIid6e/dZ5+WeSw9UP
         Slzx7YsmH4ud4BxB/dvhK8pdN4o3Li4YTCD/8F5wPgd1NAcrRiGoBmDUvdQ50odB0jjO
         Holkz7iGpZOUWneyK1Q0LPmlszyTaJ33zyPxQ6JsvcWdhNVEYqRzdc2eg7mJQjPRJUSJ
         xRKGMtbtm2seSQOxsX8m/RQsV3Rb7PspYzBnAWSca5h0ITYXYMOE/UZ3XtS71lvcSTSo
         O6PQ==
X-Gm-Message-State: AC+VfDx6s3IUxfoigX+E8mB4okXkZKPVaCAYc269Tkk3ehB1CaXXnc2O
	WS59h94uziCf5MH4fpM0VYkpDS32XfE=
X-Google-Smtp-Source: ACHHUZ6KpSl6tCWtQ8KOSJOMRPofCvJD4KACJBZ6yQk+SV9F1h3imgcp8L/DxVKkkbdFbM430iEKtg==
X-Received: by 2002:a81:7586:0:b0:54f:b244:fef9 with SMTP id q128-20020a817586000000b0054fb244fef9mr9032646ywc.0.1683477199585;
        Sun, 07 May 2023 09:33:19 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b2f5:e641:5b7c:2972])
        by smtp.gmail.com with ESMTPSA id q82-20020a817555000000b0055dbeb68f7asm1113524ywc.69.2023.05.07.09.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 09:33:18 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 13/29] libx86: Point to working SRC_URI
Date: Sun,  7 May 2023 12:32:49 -0400
Message-Id: <20230507163305.3261044-13-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230507163305.3261044-1-akuster808@gmail.com>
References: <20230507163305.3261044-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 16:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102343

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit cef731b6748f3d8cf661d11b35db3dcef2be8b71)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb b/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb
index b646162c26..f11c52dd11 100644
--- a/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb
+++ b/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb
@@ -7,15 +7,13 @@ LICENSE = "MIT & BSD-3-Clause"
 SECTION = "libs"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=633af6c02e6f624d4c472d970a2aca53"
 
-SRC_URI = "http://www.codon.org.uk/~mjg59/libx86/downloads/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://mirrors.slackware.com/slackware/slackware-current/source/ap/libx86/libx86-${PV}.tar.gz \
            file://libx86-mmap-offset.patch \
            file://0001-assume-zero-is-valid-address.patch \
            file://makefile-add-ldflags.patch \
            file://0001-Fix-type-of-the-void-pointer-assignment.patch \
            file://0001-Define-CARD32-as-uint-as-it-is-32-bit.patch \
 "
-
-SRC_URI[md5sum] = "41bee1f8e22b82d82b5f7d7ba51abc2a"
 SRC_URI[sha256sum] = "5bf13104cb327472b5cb65643352a9138646becacc06763088d83001d832d048"
 
 BPN = "libx86"
-- 
2.25.1


