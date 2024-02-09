Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18062C48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 18:19:28 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.19644.1707502766937770203
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Feb 2024 10:19:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=khgnlqIm;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: festevam@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d3ae9d1109so2177335ad.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Feb 2024 10:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707502766; x=1708107566; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+1p5dkjq7l+Fzueocm9c5O1ow6oV6jXL+XDSBngq+cI=;
        b=khgnlqIm4pchft8x8+hG7laxw1mFGDmTC+/IWnfltzl1FnAXGitgHxNb+8odiZXFJX
         niOw2Tyfe8aQcGGsZPd/FSmo4MQQWXguK90zXNEHDiq38ByPcYrBse5bmnyr0o60P/qa
         YynDFv/ArlzV089x+S1nEbH8+im8TWwwR9GPPZZfe6E3HQwtHmkf3hD7mgXTP9ThIcvv
         2ZRwxuEvyiBmXa192qBhHJJAqi/6XLlli2fhZC3McDvxtSOHRPAa4i169HxqQ5HMMOP4
         l8tvcn/5grl4GpTtYSnlQHmUdJY/I99/cEO9oFSHTgjpOfvwBuiCJYC18i7wWsQYNwjU
         /WVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707502766; x=1708107566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+1p5dkjq7l+Fzueocm9c5O1ow6oV6jXL+XDSBngq+cI=;
        b=Ldm/PqTmHFfBfOfuMJjZhcidavQvlanu/zZnTCjiD/UJknZsylwjQWvctUCviO0uqB
         NxONCnmHzDAgzOUwyGWNB8Y29jQwop+AVMytlmoTZ2ehQfTEGJEBcw5vSJzNhNeNOwvf
         Dl1dUffs8rZ4QaFkOgXWRGII2sBosw+1+p+9xnQxQl8oNp8mi/z9aTeiLqPoYjdXXJGA
         5JsWi18Opp3MxqzwDVPUDUDl7EpYY8JWCm6I4MClDgBgZVtZ/1qc7m49s8T6yjbPDP6n
         a6QdXIi5dyhkhdTb8wZNvMLNGPUFbp039n9B7YX+3cYhR67fVR9ziNKaxVge5l3b/cse
         4mcQ==
X-Gm-Message-State: AOJu0YxIV7SyAAdTmzaWWReGi/3BwF3c36VjguUl67h+Dc7FahFzOUPR
	+cuhgJAS6NhRgW2DaunnH4h30knU0L4nCkyrpNt1WVWIHXnIE9Mq/Wd26Ovb
X-Google-Smtp-Source: AGHT+IEPjLDfe5hTvNT00NTAlpTx1bLfp72xM8y7drhgZu+LVi2iQuT6FQoHxp7FIJL37ZSx6hj5Yw==
X-Received: by 2002:a17:902:ea09:b0:1da:7d4:3410 with SMTP id s9-20020a170902ea0900b001da07d43410mr81690plg.0.1707502765891;
        Fri, 09 Feb 2024 10:19:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXv2HCC6IbO6Owo9xPMKf62dzO8WW3btlcHC2uIaP8AV8HfQ0HNfZyKgFJ2BS/xuuaDD/sZk1OSIor3a0CZ5wTJ6FtTBmLZvl5iejhKczctUg6B2JvkmBprNQ==
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:d37e:ce72:3699:77e7])
        by smtp.gmail.com with ESMTPSA id lc7-20020a170902fa8700b001d8fcbbd6e7sm1798941plb.79.2024.02.09.10.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 10:19:25 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: richard.leitner@skidata.com,
	tim.orling@konsulko.com,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] [meta-java] xml-commons: xom: Update github entry
Date: Fri,  9 Feb 2024 15:19:17 -0300
Message-Id: <20240209181917.1941840-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Feb 2024 18:19:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108690

From: Fabio Estevam <festevam@denx.de>

Switch to using https, pass protocol and the branch name to fix
the following warnings:

WARNING: .../meta-java/recipes-core/xml-commons/xom_1.2.10.bb: URL: git://github.com/codehaus/jaxen;name=jaxen uses git protocol which is no longer supported by github. Please change to ;protocol=https in the url.
WARNING: .../meta-java/recipes-core/xml-commons/xom_1.2.10.bb: URL: git://github.com/codehaus/jaxen;name=jaxen does not set any branch parameter. The future default branch used by tools and repositories is uncertain and we will therefore soon require this is set in all git urls.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 recipes-core/xml-commons/xom_1.2.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/xml-commons/xom_1.2.10.bb b/recipes-core/xml-commons/xom_1.2.10.bb
index 42ad957..2eed0fe 100644
--- a/recipes-core/xml-commons/xom_1.2.10.bb
+++ b/recipes-core/xml-commons/xom_1.2.10.bb
@@ -14,7 +14,7 @@ PV_jaxen = "1.1.6"
 
 SRC_URI = "\
 	http://www.cafeconleche.org/XOM/${P}-src.tar.gz;name=archive \
-	git://github.com/codehaus/${SRCNAME_jaxen};name=jaxen \
+	https://github.com/codehaus/${SRCNAME_jaxen};protocol=https;branch=master \
 	file://04_remove_sun_import.patch \
 "
 SRC_URI[archive.md5sum] = "9f3a2ae827a9f6826fe76e4b7b0c22b3"
-- 
2.37.3


