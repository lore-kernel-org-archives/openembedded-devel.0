Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2304C61DA4
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 12:28:19 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.8797.1676550490640717436
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Feb 2023 04:28:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LAQi6Cqg;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id f10so1867413qtv.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 04:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/bpihLZDGHEnMsnMRz95+cUTxCec6AbQk6nV5AQrYc=;
        b=LAQi6Cqgp7dJ9eDK6M53BiodPRQkp0ZRbyTVta5tSxYC3r8JP6j2tHXuv2/o06vAYw
         iKdQlF8mJK8HxldiipKwcuNIdIPdhYlwjfmS2hXU+U0JdzU8Vx33D6ViaOrUZfMvIEAu
         a1H1464qtnkMpHAUT7Ko0Rc69bciqGukwAlTxOb80rvsBYjV9O70bsoFUdh6kw2RDUuh
         F+Mo0V9MkD8QTtVn390S1iRXG6DWkGFYSsmLaQ1tOdtZVxGdrvQpP54hYTnXaq+thN5V
         26A65fKKyEOzAVo/OLaJn53t8t6kTD/4wSxnKmt0N4I1kKr3KygoD5FEf3cgyRwSitKv
         gbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/bpihLZDGHEnMsnMRz95+cUTxCec6AbQk6nV5AQrYc=;
        b=KfkFZ5ixgTz9GqGTMhgAsDDL5duWoUV9UVikqVgvDRI7KEw/a/v3oLvSnVhWdjllJg
         4JJ4zEVwwrHL7cs2aZ1sQrooVtX5y0Rew1n1oZgFB6BaxiKLcLHmwQIwN1qbfRJ5rpSV
         GNaVYRSS/FMgwgJ+zkG7re02QcB5tG67wGmjz+ZiLdQAcJP4vd6R5pHYQOfmyQ6yTKBV
         +EnKpGCQ7a7WVzU+cuJ/F+LEBlRUJUfA3ynrY7FLjUuh2dghNWdco1djMCyY0pGivNwQ
         6f3iBu3ZojSQin/yAdszN1GRS+ZOw/MWeX+YjL2PJAY/MY7qjLTbmEppDUhHoX9PnvbP
         HJmA==
X-Gm-Message-State: AO0yUKWEwSqW74wSnaIVqdNbv43xJ8xL/fCVOfXJZw45LtWRWmSKxrVf
	r3JRvoHfCQ8oeGDmbfisZR02awZtUrc=
X-Google-Smtp-Source: AK7set9halZi+Idur4jkFuwxQVui8O1MigRlM2M2rGV+GJZw6e/XN0nQXK9FbA7IqHZe1hHtBb9g9Q==
X-Received: by 2002:ac8:5b86:0:b0:3b8:6763:c25f with SMTP id a6-20020ac85b86000000b003b86763c25fmr10133396qta.13.1676550489614;
        Thu, 16 Feb 2023 04:28:09 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:2ead:d6b6:b6e2:9e85])
        by smtp.gmail.com with ESMTPSA id t127-20020a379185000000b0073b4d9e2e8dsm1102362qkd.43.2023.02.16.04.28.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 04:28:09 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 14/15] exiv2: fix SRC_URI
Date: Thu, 16 Feb 2023 07:27:24 -0500
Message-Id: <5785e5ddd86cc1ce8add5936c020a166f65d8c88.1676550369.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1676550369.git.akuster808@gmail.com>
References: <cover.1676550369.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 12:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101116

From: Martin Jansa <Martin.Jansa@gmail.com>

* https://exiv2.org/releases returns 404 now, use github releases
* it's already fixed in master with upgrade to 0.27.6 in:
  https://git.openembedded.org/meta-openembedded/commit/?id=00a7d4b284c1afccfa26021111384d2184b82e5b

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index 1380638ba7..64b132e006 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=625f055f41728f84a8d7938acc35bdc2"
 
 DEPENDS = "zlib expat"
 
-SRC_URI = "https://exiv2.org/releases/${BPN}-${PV}-Source.tar.gz"
+SRC_URI = "https://github.com/Exiv2/${BPN}/releases/download/v${PV}/${BP}-Source.tar.gz"
 SRC_URI[sha256sum] = "a79f5613812aa21755d578a297874fb59a85101e793edc64ec2c6bd994e3e778"
 
 # Once patch is obsolete (project should be aware due to PRs), dos2unix can be removed either
-- 
2.25.1


