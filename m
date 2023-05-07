Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D6C7C7EE30
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 16:33:33 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.69136.1683477206950664595
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 09:33:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=KEIQX7ns;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-55a00da4e53so66330527b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 09:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683477206; x=1686069206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nnTfVTJFNr7Bc+bxqBipwx/dV86dMIzWgQrUF62FJSw=;
        b=KEIQX7nsNWdCmUe8r7wdBZoCiwDMxRUxjQ9vvPUfau3hWdadk2zy1YcXbiYVTGU/qB
         BgLSHeLRHJlvL9koxFGuk/uec182beyUXLZIU9pxL9r18YQ2K+r4NT1SIb1QzGK4O0Qt
         RthGnc1IfiPbp9jVOYTEsoexf9bWbhxbJyBBTJEoeUOWHZP7xY65t74SI/QZwrScvJIj
         FyeiQh+pk6jo59YbkGg2y7zY7k1HQqPbRbmJjgxMq4kGpWkFRD5fSqMswDyzzf4yHKlv
         S/XoQ92cvm8UByZPQS3Pb6QWgC3FaWzlQ82+tyAmXxUJQubnyT6C2M3CfG13qc7tcrSM
         nhNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683477206; x=1686069206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnTfVTJFNr7Bc+bxqBipwx/dV86dMIzWgQrUF62FJSw=;
        b=Tqh+W1mcX9FG7LCsE/oW44bFwSgOn1WjqIb+Qxg4WDrcQi4UTgqBoVDugGzrXKDGi1
         1MF4AK45B2tLmc3uc0jHpjjxTtjYcwZloae7KKy2IEtC6WO1SfPURt00bvqkHjqbbovd
         qZpfNv2vnYWa/7126yJUlw5bbTvEuC/CbB28FJGbaKi9RN8WtlDg5bnrvw2tSCK3rDAK
         9XqMEZob/Tesv+YpA5jo1AObGmvUJ9VgYxkCxi2jZ5R7rn3YTirZeOMsZZI6UlwOKT7d
         IJ1T5c6su9ds45MgLFHSLRAeaiEewunB41iZglQ8MOkZ/uzKrF1XCQvEK04qtQ1cM+3L
         r8aQ==
X-Gm-Message-State: AC+VfDyBspvJm4kkFLJm0WclG34TBdCeNNB+BZvqqXcPA6nuRHm9hdCh
	lG9guzFEPM8r6tJHyzCAVmKd7qvXxes=
X-Google-Smtp-Source: ACHHUZ6u08VPC5tBdztmLJIvWBma6GuIj+XqCckBMHuZ3pROozvY9O1GmEZ+nFaUGRnLmyI1lUU9Dw==
X-Received: by 2002:a0d:f302:0:b0:55d:83ec:e0a2 with SMTP id c2-20020a0df302000000b0055d83ece0a2mr8038291ywf.31.1683477205906;
        Sun, 07 May 2023 09:33:25 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b2f5:e641:5b7c:2972])
        by smtp.gmail.com with ESMTPSA id q82-20020a817555000000b0055dbeb68f7asm1113524ywc.69.2023.05.07.09.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 09:33:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 18/29] ttf-mplus: Point to valid download location for SRC_URI
Date: Sun,  7 May 2023 12:32:54 -0400
Message-Id: <20230507163305.3261044-18-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230507163305.3261044-1-akuster808@gmail.com>
References: <20230507163305.3261044-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 16:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102348

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6ca9f1c2e5d105096a438389a3431633c3e0cc07)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
index d8236ce434..a048075fc4 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
@@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE_E;md5=ac161e96eda00db9a3aec7870b5d9658 \
                     file://LICENSE_J;md5=a120ca8d7c8e4a475d5277c9aeb95221 \
 "
 PR = "r4"
-
-SRC_URI = "http://osdn.dl.sourceforge.jp/mplus-fonts/6650/mplus-TESTFLIGHT-${PV}.tar.gz"
+SRC_URI = "http://downloads.sourceforge.jp/mplus-fonts/6650/mplus-TESTFLIGHT-${PV}.tar.gz"
 S = "${WORKDIR}/mplus-TESTFLIGHT-${PV}"
 
 PACKAGESPLITFUNCS:prepend = "split_ttf_mplus_packages "
-- 
2.25.1


