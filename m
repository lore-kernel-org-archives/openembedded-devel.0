Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F53EB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 17:26:04 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.1024.1688577956331634649
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jul 2023 10:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=qnCxm2Gv;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-666e64e97e2so3506698b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Jul 2023 10:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688577955; x=1691169955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txbZWotzreSCRT9knn0N7wnWv2D5uw2jYW0Y8zYl0Zo=;
        b=qnCxm2Gv8fvxpZCfIkCMUzdPEP0HV/qKQKZOzclMJbwKYGSTZtyZ5qrkY2Sa1my3PT
         592q1HxBIMmvRooGuoQLyoPXyKbQitnpr6Skiz6RsIKnRc1YBb/fsOf4c4VKQv5MxquF
         UXbckID8jdXQ2uoA+AN1Lk/1Y4W8uQnsShapTwvCqINHElpKRgDAJ58+k/qjLknkinkA
         zRFGj2pNfR18hy7RG+VOf/Vot+9wT1lE9GNn6t5iMH5HhhDWTA8XDLxYqBgG9uttfjdv
         sqPp4CjpMLt9lE0MTKglu1F2VAp2Yrt78P/noAuZkPERzjZizYzyEqP4zNuP54icVJLN
         Uiug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688577955; x=1691169955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=txbZWotzreSCRT9knn0N7wnWv2D5uw2jYW0Y8zYl0Zo=;
        b=TjNnexM8ky6ri65O1yiAy6N0sq7pU5iXmTL0kApUBueCqAHjT2ZSvCSlH/k9QY/gjY
         w/wjlFF6zZN4C9UVAjpHUKPqSUTuJioOQ/QqYCil0G9jM2QaGluT8gXSahalySGx10Yc
         iBmwFlOlTqXIdGymUmRv8d/j4Lb1e9n/LMFcxpxI9x1+ulYa2yrHRKxob5CEgYLXCmHZ
         BlEGBiG8ZBj4lLVcmfw9YkkIowDm9jiXIfsSE7n2tDEEuFn1ATeUC40Sqe06AdbF8ssS
         ry7vf6RU5/NYulOMrSr/hX95eJkklYL256v1gd3C9g3PlN5tRXn14p5Z0NOoi4XmHZQ7
         euOw==
X-Gm-Message-State: ABy/qLZDS8+5+rC76oxB1i0sIGekJfYGbS5p5hkh7vGt+Ycub2JNx8x/
	y7h5PuKFk0qicNAPDKKzBQefu4p3shY=
X-Google-Smtp-Source: APBJJlEO/9fQsoly8Xp3Yn1EFY+ydVwXHsjgTHy49aWTyRPpiwZyfVAOuUykfHvCz8Au8YCxqhJe8g==
X-Received: by 2002:a05:6a00:c8a:b0:65b:351a:e70a with SMTP id a10-20020a056a000c8a00b0065b351ae70amr17207957pfv.29.1688577955323;
        Wed, 05 Jul 2023 10:25:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::81d4])
        by smtp.gmail.com with ESMTPSA id w6-20020aa78586000000b0067b384d5955sm13869174pfn.26.2023.07.05.10.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 10:25:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] geos: Use cmake directly
Date: Wed,  5 Jul 2023 10:25:49 -0700
Message-ID: <20230705172550.3371930-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230705172550.3371930-1-raj.khem@gmail.com>
References: <20230705172550.3371930-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jul 2023 17:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103670

configure is a wrapper script around cmake invocations which are
already taken care of by cmake bbclass. e.g. specifying
CMAKE_INSTALL_PREFIX or CMAKE_BUILD_TYPE

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-navigation/geos/geos_3.12.0.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-navigation/geos/geos_3.12.0.bb b/meta-oe/recipes-navigation/geos/geos_3.12.0.bb
index b77f3af2a8..95cb29775a 100644
--- a/meta-oe/recipes-navigation/geos/geos_3.12.0.bb
+++ b/meta-oe/recipes-navigation/geos/geos_3.12.0.bb
@@ -8,9 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SRC_URI = "http://download.osgeo.org/${BPN}/${BP}.tar.bz2"
 SRC_URI[sha256sum] = "d96db96011259178a35555a0f6d6e75a739e52a495a6b2aa5efb3d75390fbc39"
 
-inherit autotools pkgconfig binconfig
-
-EXTRA_OECONF += "--enable-inline=no"
+inherit cmake pkgconfig binconfig
 
 PACKAGES =+ "geoslib ${PN}-c1"
 
-- 
2.41.0


