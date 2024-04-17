Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC3AC4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 23:34:09 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.614.1713396840481335168
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Apr 2024 16:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: danismostlikely@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-23333dddd8aso230709fac.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 16:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713396839; x=1714001639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aBuanri+4dBkNWEA1JQobWw2V9e8Sc3vbaL2PeyxwmA=;
        b=WH6NkXpS+CGk37YiJY0fMgJyudITd4DGRcfuYp1g46go1KyA5C52d93RNaOEz+LaBg
         QZQJdkutavc62Ug8nmktr26G2ycQIoEnsJU9vGuy4a1kDrZg9zmQhXE1m3Z+qdjE3pMn
         NdTxFxVKBW6NzGZ8d5GRgk2vPl/yI+hyX5GOkjGjT9uHI7gyK3aw72A7YCRS/keEwAWD
         gLbfAmwnxVCXIcNTmFCEgj4JVRBsGPrNyFpdkLxdp1Z+F9ssyVNRGd5+sx9q+gtwRlcE
         smXExE72mp4n3ES32slgk6g84J3Q223tYvmo0DqCRg3YYA3qDI9xzypUkrlCGU4yvqmf
         jOUw==
X-Gm-Message-State: AOJu0Yy9OWctm+kDItB83jW2C6QQoLnWFSf40IwwOk3ThEMWNr+OJPOc
	zGFKjQOYHrYVRgTOvw1C4Zj0splrgrp6bgbJtzPCJIS7mb0Wj6J+5EJhwA==
X-Google-Smtp-Source: AGHT+IEBL2n5hhkJSgNgq1R4dZPibhQyv26I3kGPXUKsBe2cR8iUJjiqqwri9C7GLfDiOLOs4m2Buw==
X-Received: by 2002:a05:6870:891a:b0:238:f752:b1f with SMTP id i26-20020a056870891a00b00238f7520b1fmr81788oao.59.1713396839609;
        Wed, 17 Apr 2024 16:33:59 -0700 (PDT)
Received: from nebuchadnezzar.home.arpa ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id s10-20020a056638218a00b00482cd74e958sm77826jaj.85.2024.04.17.16.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 16:33:59 -0700 (PDT)
From: Dan McGregor <dan.mcgregor@usask.ca>
To: openembedded-devel@lists.openembedded.org
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: [meta-oe][PATCH] libcbor: use shared libraries
Date: Wed, 17 Apr 2024 17:33:27 -0600
Message-ID: <20240417233327.321386-1-dan.mcgregor@usask.ca>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 23:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110048

libfido2 requires cbor be position independent. When PIE's the default
this isn't a problem, but not all build configurations do that. Instead
of relying on that, just make shared libraries.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta-oe/recipes-extended/libcbor/libcbor_0.11.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libcbor/libcbor_0.11.0.bb b/meta-oe/recipes-extended/libcbor/libcbor_0.11.0.bb
index 28bd5b5ae2f..0e15393dd59 100755
--- a/meta-oe/recipes-extended/libcbor/libcbor_0.11.0.bb
+++ b/meta-oe/recipes-extended/libcbor/libcbor_0.11.0.bb
@@ -11,4 +11,4 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
-EXTRA_OECMAKE += " -DCMAKE_BUILD_TYPE=Release"
+EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS:BOOL=ON"
-- 
2.43.0


