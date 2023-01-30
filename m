Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47321C61DA4
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 13:54:18 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.41229.1675086854291774631
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Jan 2023 05:54:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lh/uAdHk;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id h16so11096428wrz.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Jan 2023 05:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Gh7mcjkriQ8KP36CctMmnhE5p+H6UCIbjjioSZMzzo=;
        b=lh/uAdHk77czUSvImKyaE+heLTXXYcK+YQh/xxElPmA7QrlsnCoq3JoNhBWt1aSrPH
         uTbXevOk3RKPqAnqVdB0rErN7QF7/742Gbr5ddb3Xxpae5VTXg7cqHiR9t1MxMB6Uu6e
         3tOyrMYuNsvFA3wxQmkWw9ygaiQYjVQ9cHGl8UVogqHZxggUH3CwhBO+gLMjlyUUMV8w
         ZrHkgXArXZ61Rox61QumNFtluS2mZiHpWjvzbOVbn4ViCddYIykjzi/fg13h02l0kDG/
         6SpT+pqFNcOmAN94yYUGDr56Lnzn1Cb85tC0SeZ1C1mfaS8RTEJUfi4FRJc/8zuS5+Kw
         cUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Gh7mcjkriQ8KP36CctMmnhE5p+H6UCIbjjioSZMzzo=;
        b=smecZjJh1oYy3Tzd4+oqxgbGm01vtErotxEWBNAeoM/d9KESoqBYweZWMcoRIDV9cP
         /hFAI+vJ10Vy5FHUd7u1qfV8blhM01cSTYJs1zpECB5h/X2gA5jJ2+TyvTiqFWiGVYPu
         dFW1wLvM6R/w979N2tHz244kmhJ6wpOizfcA4wySVrISoNVqmJiAyAkfHUmYzO5EMlfP
         MeTVguFSEPTTwZ+obODamTipPTI+EWnjpEyIgCUkQ2EfRjPLjj6Zo/XklzckpSa49e3G
         p75j1gSPFT3P974hOaoBUywEdrds9ZulgnWXdfZtR9oDcInQON+buBrPWQH4VCyxTHTZ
         KJ4Q==
X-Gm-Message-State: AFqh2krfsz0pR4irY4iDdR8J35FQYr+3kUMcTNOjo2WQTbFFrIePt/MI
	/RZ+jL42z13b/GrLeiNnBrTitZaoHIo=
X-Google-Smtp-Source: AMrXdXu+c8yGBNedrX1G8G9HRi88hQnT06w4IlP9m46U1cRFQVDLxjiEGZ65nPe/Xsh5Jh4rEN6XHg==
X-Received: by 2002:adf:e9d2:0:b0:2bd:e6f5:5122 with SMTP id l18-20020adfe9d2000000b002bde6f55122mr41915098wrn.65.1675086852535;
        Mon, 30 Jan 2023 05:54:12 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id e28-20020a5d595c000000b002bfd8ad20a0sm7948400wri.44.2023.01.30.05.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 05:54:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] hunspell: move ispellaff2myspell script to separate package
Date: Mon, 30 Jan 2023 14:34:05 +0100
Message-Id: <20230130133405.3224735-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Jan 2023 13:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100861

* ispellaff2myspell: A program to convert ispell affix tables to myspell format
  pulls perl into the images

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/hunspell/hunspell_1.7.2.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/hunspell/hunspell_1.7.2.bb b/meta-oe/recipes-support/hunspell/hunspell_1.7.2.bb
index 910bd4c158..afe75472a5 100644
--- a/meta-oe/recipes-support/hunspell/hunspell_1.7.2.bb
+++ b/meta-oe/recipes-support/hunspell/hunspell_1.7.2.bb
@@ -13,6 +13,9 @@ S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig gettext
 
-RDEPENDS:${PN} = "perl"
+# ispellaff2myspell: A program to convert ispell affix tables to myspell format
+PACKAGES =+ "${PN}-ispell"
+FILES:${PN}-ispell = "${bindir}/ispellaff2myspell"
+RDEPENDS:${PN}-ispell = "perl"
 
 BBCLASSEXTEND = "native"
-- 
2.39.1


