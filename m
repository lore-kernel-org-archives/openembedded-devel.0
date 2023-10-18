Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A47CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 09:19:15 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web11.277202.1697620753217119604
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Oct 2023 02:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iE+R940R;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-55b5a37acb6so1053440a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 02:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697620752; x=1698225552; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y7HE4xTXKplfVS2QbAnMJu4Lg6DKqbMCfLj3XNr4L2o=;
        b=iE+R940RSBKRdHZOMGrJsb76bt2vdZJON/DnFbm7kR94ViSdMkkPylhdaZrk5bti7R
         e5sEh069txLSaWHLM9fCzIwXpSElEmlq9v37zYJEGj+eWBcjq51spw96SMTsyd/hCz1B
         diKlx6N/bYCfOvyM7IKGYtsHGh3qLAa5XzKi0THciM6iZiQCsGN0/fWy9LpTvS950axc
         KAUwxz3Cv3xrRh3hT/52i7V6zduwxK2bPrAkG45g1aFFRc9keyQuanz/TUViHLBHEbQw
         cx+KwSCTofFCKJ2jnOpEqkpwcHR32HTVy6OL+sZEcFUsryOEVWIvIxdRIkdGDfiFgqGD
         7t/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697620752; x=1698225552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7HE4xTXKplfVS2QbAnMJu4Lg6DKqbMCfLj3XNr4L2o=;
        b=WNbPad/82XKISWLO0LDoEH6m7i3CVwr0XW4yDeQPSavT9D1jCkrCuG6efKJJ2iHred
         Ey2N6nvWafGPRuCDGuRu6+3TlO8edME9+jOQpihJQAlaxOTmLAdjpdMXlnHYSgl4yiLk
         0OPgq6zHSOduVhiwkKNSmjBkbkmdyQaRlmsb5q1NkIi5Sgv+ZelRdrs2JaRCSl+GT+o5
         O66wKrkHuEfFFVTH44t9rysZahS+tqouFgmU6wqVGEvnC3gYO4Z3+iA2sOc9p2HrYZsg
         MGunCqxU6Yv4/lOcPEOtoe9/3knq0IKuvvRgvLhR51KF6j1+R7+KOEooL0/IMMNaFDhu
         JjvA==
X-Gm-Message-State: AOJu0YwLAMmO65yUoX4eChHF6jQRwUyYDb6lDhYjB+FbT/CkQxdWw+pf
	D75lio4vCVdnBtCApp4PjsRmGHumbKYa2g==
X-Google-Smtp-Source: AGHT+IGPf0JGroG5aFcTY8ng0ROdQduUaoeR+uoZSwV91TFp8dI2lzGC2WbR+z0Z9pEuxauDGV4jEg==
X-Received: by 2002:a17:903:290c:b0:1c6:2902:24f9 with SMTP id lh12-20020a170903290c00b001c6290224f9mr4849944plb.1.1697620752218;
        Wed, 18 Oct 2023 02:19:12 -0700 (PDT)
Received: from L-18010.kpit.com ([2401:4900:1c17:cf4:b6e8:1680:2a6e:78e2])
        by smtp.gmail.com with ESMTPSA id u12-20020a170902e80c00b001b8b2a6c4a4sm3019544plg.172.2023.10.18.02.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 02:19:10 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com
Subject: [oe][meta][kirkstone][PATCH] libcroco: Adapt LICENSE as SPDX identifiers
Date: Wed, 18 Oct 2023 14:48:37 +0530
Message-Id: <20231018091837.474169-1-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 09:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105566

As per Yocto 4.0 migration, LICENSE variables should use SPDX
identifiers
Convert this by a tool present at below location
poky/scripts/contrib/convert-spdx-licenses.py

Link: https://docs.yoctoproject.org/migration-guides/migration-4.0.html#license-changes

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 meta/recipes-support/libcroco/libcroco_0.6.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libcroco/libcroco_0.6.13.bb b/meta/recipes-support/libcroco/libcroco_0.6.13.bb
index fd5927e01..00a85c2f1 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.13.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.13.bb
@@ -2,7 +2,7 @@ SUMMARY = "Cascading Style Sheet (CSS) parsing and manipulation toolkit"
 HOMEPAGE = "http://www.gnome.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 
-LICENSE = "LGPLv2 & LGPLv2.1"
+LICENSE = "LGPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
                     file://src/cr-rgb.c;endline=22;md5=31d5f0944d556c8589d04ea6055fcc66 \
                     file://tests/cr-test-utils.c;endline=21;md5=2382c27934cae1d3792fcb17a6142c4e"
-- 
2.25.1


