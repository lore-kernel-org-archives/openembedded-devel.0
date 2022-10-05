Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B8AAC43217
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 09:40:04 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.21463.1664962797754648292
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Oct 2022 02:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B/CN90NP;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id bq9so25084465wrb.4
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Oct 2022 02:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=xw+wqS25eNq6PXc2hYliXRCcBBrHYpj9VJ8x8N07eF4=;
        b=B/CN90NPXjIsw5KWmMbgU2GrayevpZ7K3wb8susMa5WsqgTRCttivPuNDwZBKJrgxW
         lQVY8YdDEBO8mVb+sUNLCq28WBDsl/dKrB61sUEjVjqOYucGRBaiZXSWdZm146LXldhw
         OwGJk+DKQrGe3l0LC3HnA+HrP9Zfj2siSHcvZ755uOwbHtyCwHfUrIrVa9jA/L9+ZfbV
         zl1UnrDjLIYuIW8jTdvKMoymzexglNck3mjnflit4F6GwnenZzKkFQZpmIf/L28mqxGF
         pqM6U3AuIjHixM88qfZ0rzKsEMJPHLNv3cTa7RKe8po5T5wZNBBdkStLdNlNCkQX+gEn
         DORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=xw+wqS25eNq6PXc2hYliXRCcBBrHYpj9VJ8x8N07eF4=;
        b=RjPrUD3/Y4o7AifP2hBZTMBk0mPcTZQ4Ghf6tCP14ZpLO1xRPRC1bKuqpy783udl+c
         MIY7QUBxVX8xfNAMb1mJSAX1brdrSg0gsK+logfYOpT0M+KNn9hrhrvMMkJqdAKBEQQL
         0msrCq/Cav8LQZlL6hrh3wg+7HkTXw8yd4jWJ4qwjtgG8vYic6RzjoyTkmF6HXRI6QOI
         360OiWYbx+6WbNzmUwLPmjxsV1Dwh5DsVjUSPKKAlcgWqNOp63GScnL1RoDhD3a6QM2k
         RtQDVrzRPLfRyzjHsWUPBE2QLijHMjDu50A+lCIN17w/CGYzhM7SlThrDUt9PF7X0CfA
         v+bg==
X-Gm-Message-State: ACrzQf1BR5RTi3tRCvfpCM/cuvTXAYcpXFqFhN9uJucqCZu177z1rVQZ
	1uRSx4/wLBr3qHxHeHPpkrUu8PBREQk=
X-Google-Smtp-Source: 
 AMsMyM4AdWRG+o9tcNMtWSYFFXc+mBwlIeUqJkhpaNM99S6riEN4myWXGgtz+2mC9IFw26csdR5vTw==
X-Received: by 2002:adf:9dd0:0:b0:22c:d6cc:b387 with SMTP id
 q16-20020adf9dd0000000b0022cd6ccb387mr20020574wre.353.1664962795914;
        Wed, 05 Oct 2022 02:39:55 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 d10-20020a5d6dca000000b0022917d58603sm14641736wrz.32.2022.10.05.02.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 02:39:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/3] python3-cchardet: depend on cython
Date: Wed,  5 Oct 2022 11:39:47 +0200
Message-Id: <20221005093949.1527779-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Oct 2022 09:40:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99065

pre-generated cython files in the tarball are not compatible
with python 3.11, and adding a dependency will regenerate them.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb b/meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb
index d6d96965e..3d9194c21 100644
--- a/meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb
@@ -8,3 +8,5 @@ SRC_URI[sha256sum] = "c428b6336545053c2589f6caf24ea32276c6664cb86db817e03a94c60a
 inherit pypi setuptools3
 
 BBCLASSEXTEND = "native nativesdk"
+
+DEPENDS += "python3-cython-native"
-- 
2.30.2


