Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4DB7EB64D7
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 01:36:03 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.17651.1687138562810196844
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jun 2023 18:36:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=rqMBOEB+;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-19fa4346498so2667579fac.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Jun 2023 18:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687138562; x=1689730562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C4MQD0aWG5rY7HsMt9SjLAeOxMOCyaAoLc/N6x7tGqQ=;
        b=rqMBOEB+hSdGAUOt74H99LUOrQILviNiJbxH+c9srWrSWanTUX827WmtYPwXn3n8nI
         isK4flAc3b3FSEwAargDr0sa1ECQxdAI/F7AfLs7jq2ApzoUhZ8D6NR/I0uXXSwVFC5I
         21yf9y1ovVQGJ8MHin4orqC3IyXyG029qPYnCjMw/DE9l87tZHi6uKno9irfHIvGPq6I
         3c9ZRjqW+azMO9wXvjXqXgh/hFREzP3sknKH0xx9GkZk30/sT2cbQ8T7j/070XqFl7Je
         A//574LdeVfH3wk5mU5UNWxMas/ZRqEHsAqQ+LnEGxXvauEYU0qUUK1K38CnCX/jykKr
         kUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687138562; x=1689730562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C4MQD0aWG5rY7HsMt9SjLAeOxMOCyaAoLc/N6x7tGqQ=;
        b=jI/JzZQJwzgTN0bFvdJJg/jQPcqErMBG4p415yfFsJtHltGMcdQRw5um7EHt4Qi2Wb
         mc9Ib/u4Z97NB/2QIkXqxOhuV/ItfY8dCC9XWYywSppn1VmreB7qOo/F04FQcz2FxJ01
         pms+IKsi4DjNjK6CJuEZvTPSUoJfan3uEd8cVLntHmavW2mMwLc9XXzrYuavtC15y6W5
         tJszjg/GMB1eYZVrEPuklUG5u1jdl3gzvk7B9DXIWV8YuJySjZFSCqLCDXG1XzODu/n/
         VIIbqNL1pXfCpO+pc+WgHnsRyXXFLk9wzyadi4jsEsUv36lqBei4QLj3TBnKRhjfzZZ3
         1F9Q==
X-Gm-Message-State: AC+VfDwaJ1s1Ts3jhrw2rcQr3C/jygLbfrpLRejKTeRxQvYXeEm1HL4j
	bPVMvPKCIOHFDiBM2tzEFIuQ8Jxw1rQ=
X-Google-Smtp-Source: ACHHUZ5qzKGE4690CMpM/dWI3ZvKMTKjojgu8ol52L9wmzzwheeouDCvPWYc2dKKkYh2FkIRGHhxBA==
X-Received: by 2002:aca:bc45:0:b0:39a:b787:1ae2 with SMTP id m66-20020acabc45000000b0039ab7871ae2mr9836116oif.52.1687138561834;
        Sun, 18 Jun 2023 18:36:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id 4-20020a17090a198400b0025643e5da99sm272210pji.37.2023.06.18.18.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 18:36:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libforms: Replace hardcoded dep on mesa with virtual/libgl
Date: Sun, 18 Jun 2023 18:35:58 -0700
Message-ID: <20230619013558.3206367-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 01:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103356

This ensures that it can be built on machines with non-mesa graphics
drivers

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb b/meta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb
index 52bddbd0de..251c07adf0 100644
--- a/meta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb
+++ b/meta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb
@@ -20,7 +20,7 @@ REQUIRED_DISTRO_FEATURES = "opengl x11"
 
 S = "${WORKDIR}/xforms-${PV}"
 
-DEPENDS = "libxpm jpeg libx11 mesa"
+DEPENDS = "libxpm jpeg libx11 virtual/libgl"
 RDEPENDS:${PN} = "bash"
 
 EXTRA_OECONF = "--with-extra-inc=${S}/lib" 
-- 
2.41.0


