Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB11EC43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 08:00:11 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.3629.1657094405763899621
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:00:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KTrJ4BnA;
 spf=pass (domain: gmail.com, ip: 209.85.208.53,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id v12so5578537edc.10
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sOd5LjKroX5BIf8Gw18Rrr9mITayYfG6E5ZC1HELPM4=;
        b=KTrJ4BnAP+H1YeTRXIyKOdN5T3ne8SnmDX05pmIV/f2cXMz3pA4WCT4i9WVBuY+9Qs
         CasaisZAdzIs61H5aScRTNhdSFyWMgctasjqccL6NpS49ll8ZAG6jPb2zhuUalWvHaLK
         UXS/35Jv+yQKyKeNsJ4SggeN8e7YX68xAaAdfTdxSF9EaFJt0nysaHENMH/FIZEbZ19c
         sPnrBEXTqVyfbAqbh+6mdZ/lFEPs56FCc7qQqkL75UPPC3qi1lrON+gkSTZVnDzdRUNZ
         NhcWShOJq/NQo5WzAObzC4y7KSCE2zNifn+1FMHgdToAYqzrgkBPCBVfbPcatj4JIDE7
         qZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sOd5LjKroX5BIf8Gw18Rrr9mITayYfG6E5ZC1HELPM4=;
        b=XVP7sg3xOaBF08SPVRwNM7rX75VwUJFYj++/sV0UbBO73j0oG/8e715bqAOvRS2fB2
         GJ3v06eU7ecc2/M2vQug2fYaU05wTUvOcEE4/OYx5Jb5KypZBcD5oxT0GelsGLBoWyIQ
         VsNNJC92se3A+Zrbx1TiX0+MyLOHLc7L0HqeZ8KWQg72jyuCtcZmu22mcZ1V/aUnlQGZ
         O2ZR/Bria/d137LadiuAy5JKtnPsmb5MnT+/w96UTzVRbx0t8raAky5yYV2uc77SFhNu
         jIwnzFa/ZHjdw7cBmGyb/Mtn1GzsVkhWEN3Gds1uUGUtW4VemsI1XxS+UETK4znNLCje
         TgUQ==
X-Gm-Message-State: AJIora+6cpMztfjWlY28/ZyK+TbXP8boylxhWhbP9FN1lgH57SGKgfG/
	CdFFD6w3qxKoLHfbdUx6mMIqkU70FLA=
X-Google-Smtp-Source: 
 AGRyM1vxAO/ALmdZmQSd+MUbQ3ffM3wXxHI1QCCSQQIBa+ITvSvLvpxBycYGwyWwJwdsqO40Lp19KQ==
X-Received: by 2002:aa7:c45a:0:b0:435:d7a4:99bc with SMTP id
 n26-20020aa7c45a000000b00435d7a499bcmr51963056edr.158.1657094403787;
        Wed, 06 Jul 2022 01:00:03 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-82-60-178-162.retail.telecomitalia.it. [82.60.178.162])
        by smtp.gmail.com with ESMTPSA id
 es25-20020a056402381900b0043a6b86f024sm5764788edb.67.2022.07.06.01.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 01:00:03 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-devel@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [meta-oe][kirkstone][master][PATCH] thrift: add CVE_PRODUCT to fix
 CVE reporting
Date: Wed,  6 Jul 2022 09:59:57 +0200
Message-Id: <20220706075957.16116-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Jul 2022 08:00:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97723

Without CVE_PRODUCT set to apache:thrift cve-check was catching
CVEs form facebook:thrift that are not related with this product.
Now the report is correct.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta-oe/recipes-connectivity/thrift/thrift_0.16.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.16.0.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.16.0.bb
index 2d601a2f9..8141abef5 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.16.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.16.0.bb
@@ -15,6 +15,8 @@ SRC_URI[sha256sum] = "f460b5c1ca30d8918ff95ea3eb6291b3951cf518553566088f3f2be898
 
 BBCLASSEXTEND = "native nativesdk"
 
+CVE_PRODUCT = "apache:thrift"
+
 inherit pkgconfig cmake python3native
 
 export STAGING_INCDIR
-- 
2.34.1


