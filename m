Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16994C4707C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 22:03:36 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web10.7191.1705097015077471100
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jan 2024 14:03:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-36082f3cb05so23819385ab.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 14:03:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705097013; x=1705701813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wo2WdcdoadI9O914ax/BYB+9w7SNNfmzKS+OqgjmJ/U=;
        b=cyTRfHEfBeRo0JBa8rCHoDm1YAniIrMacU67DpSgjyaJQIkw01+3Ut0U8SZxpa3JjT
         ET1YjnQd71dfz2sQswAjjk14E7MOjDZVd9yQkO0+cP6C7qXUdGedQRAlD/fhMy5pScEl
         PjGIDaa4hG8wJlNn+T2GTHtA/Wt/pg7nK0IHVTqzR3A8N1snDsaM2mjoMViOz7RZl6Ec
         DCsKr9fZtFjICqfyfQVcKqhTLv548o8nk4hX5vg96qpk2XHiR9mpQo9FOkrzu5qQ70EG
         VMGtfTae92PCqPusuQllOZDrqapmt1RMRVQZS15UDwh0OdABsouZJ2Sj/FB3kOLWPEEp
         ortg==
X-Gm-Message-State: AOJu0Yz7BlEe0i4g/nENOMDwLBxF2R4R58tg3i5mI16FCXJLMTW2ulSJ
	G4q+HyYM8FJcu5tNFf4X0tanVXLynaibhQ==
X-Google-Smtp-Source: AGHT+IHtUz1owz3VsaoZHxIMy9EWzrOInKCPgMLrZOrIjPd04D/DIhO5QovPK6raae1tGChCLZiVaw==
X-Received: by 2002:a05:6602:1213:b0:7bb:ef56:2daa with SMTP id y19-20020a056602121300b007bbef562daamr2604371iot.3.1705097013440;
        Fri, 12 Jan 2024 14:03:33 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id t35-20020a05663836e300b0046dd0059a11sm1110536jau.114.2024.01.12.14.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 14:03:32 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-marshmallow: update to version 3.20.2
Date: Fri, 12 Jan 2024 22:03:24 +0000
Message-Id: <20240112220324.3031539-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 22:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108255

Convert recipe to pypi
Update license checksum for copyright year and verify MIT still applies

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...hmallow_3.20.1.bb => python3-marshmallow_3.20.2.bb} | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_3.20.1.bb => python3-marshmallow_3.20.2.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_3.20.1.bb b/meta-python/recipes-devtools/python/python3-marshmallow_3.20.2.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-marshmallow_3.20.1.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_3.20.2.bb
index f0ca630cc..c08aec5be 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_3.20.1.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_3.20.2.bb
@@ -3,16 +3,12 @@ DESCRIPTION = "Marshmallow is an ORM/ODM/framework-agnostic library for converti
 HOMEPAGE = "https://github.com/marshmallow-code/marshmallow"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "\
-                    file://LICENSE;md5=5bccd400dedfa74364481e56aacc0b4a \
+                    file://LICENSE;md5=653847350fed2e0e7b02791a35b98d59 \
                     file://docs/license.rst;md5=13da439ad060419fb7cf364523017cfb"
 
-SRC_URI = "git://github.com/marshmallow-code/marshmallow.git;protocol=https;branch=dev"
+SRC_URI[sha256sum] = "4c1daff273513dc5eb24b219a8035559dc573c8f322558ef85f5438ddd1236dd"
 
-SRCREV = "dda9a8014dfe1bcb35e21307cfd5a8e19615a284"
-
-S = "${WORKDIR}/git"
-
-inherit setuptools3
+inherit setuptools3 pypi
 
 PIP_INSTALL_PACKAGE = "marshmallow"
 
-- 
2.34.1


