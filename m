Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC96C433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 15:23:36 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.11753.1639668214774519519
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XAbtb5Sy;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id v19so19696380plo.7
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3nrXPr4PJKERjdmkyLkrABkWElO7LSMU3FAxey/SvRo=;
        b=XAbtb5SybnPOa6D/ZxbMoEgFFOOp8keNxvmKj4x9pCrHhYg9JBsmdD/JvItOPlbPNm
         mUQRDR3Hr1esEj2RWm5AY9CxvvGMlwjsQA3Rf2yaHm72cP6k3P6TEdc0PqmhD5Ow6lwv
         89tprDxd4GzpaIC6ZjDV2T8aEI3cT1EhZMeW4/b8GcwOipYE2SnGvah6ZymvxTwWVcdb
         LMetigqHV5i7SHurHYi0odRURWVgNTqq7jv9xj3YFa1hDf1aIectsHJuQu/XSL5RZ1+s
         0yfxyWJZDubaA4MeIjtMSNax0CrfnkSXXjSPaAAPQWoxH3dMChmNpo2H6yo78ItnXpLT
         385Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3nrXPr4PJKERjdmkyLkrABkWElO7LSMU3FAxey/SvRo=;
        b=aRpgAseHs9/1Pyp9UnBF6U/o8EEQJ3uBwJ573QTbm9Lt0oV6T+5qJOGaz87mqZZcFD
         z2Ijq4FsnJws7xZKEt3IDQQYfLZYArkod9QavIpqTn6qk6SL6rOpEGXjHP0ecvB7N3Kp
         Ug1bsdWJyxx4qSioyGU3BUkMsAmIL6yUMpIbIGF0Ma7KXf2dInDCE5d4CbqzS/q6Mads
         /SgpY73fmCCd0lPDjq0XqYrxOXylpUsZQgp0jtGGsMhZxcAWmdbExS+Jf/zGo/o3emin
         ooqIuExApptV2DJJSbRDl9jYPbYuQK36dvsG46OtR2PPuUsba0ojAWtOuTksiWAKZItt
         zshw==
X-Gm-Message-State: AOAM530Fzj+ntHqc5I8Citln7TkBUVzJ4MLgo08MSUk682NDruJjMCgs
	/FCcGBHAyVYlL1bvBr25OIO9B/uv6l8=
X-Google-Smtp-Source: 
 ABdhPJwrSABlDuW77sZlWv39I4/mX8AYZEd6yZK4MljQT/OOhXgJIwcDe7MEeyAFG2lcihyQagyTpg==
X-Received: by 2002:a17:90b:4a01:: with SMTP id
 kk1mr6662320pjb.7.1639668214210;
        Thu, 16 Dec 2021 07:23:34 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7d7:ca51:b150:8ee7])
        by smtp.gmail.com with ESMTPSA id
 k15sm6795703pff.215.2021.12.16.07.23.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 07:23:33 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [honister 08/18] libkcapi: set precise BSD license
Date: Thu, 16 Dec 2021 07:23:13 -0800
Message-Id: 
 <bc97389fa8d3cda9990b2ef0006f6a190a8e30b0.1639668121.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639668121.git.akuster808@gmail.com>
References: <cover.1639668121.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 15:23:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94393

From: Ross Burton <ross@burtonini.com>

"BSD" is ambiguous, use the precise license BSD-3-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c8384c874f804d591427ab1d70b08a7881285b15)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.1.bb b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.1.bb
index a66504dd83..ad68dc926d 100644
--- a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.1.bb
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Linux Kernel Crypto API User Space Interface Library"
 HOMEPAGE = "http://www.chronox.de/libkcapi.html"
-LICENSE = "BSD | GPL-2.0"
+LICENSE = "BSD-3-Clause | GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c78be93ed8d1637f2a3f4a83ff9d5f54"
 
 DEPENDS = "libtool"
-- 
2.25.1


