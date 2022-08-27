Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2511DECAAD5
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 18:15:34 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.51434.1661624128161814483
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:15:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z+sBZ6Ev;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id t5so4418424pjs.0
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=ANFSWWtUVR9QFpQ5TrrVE4i0FFeHFkE2eWzF5C6ZG+M=;
        b=Z+sBZ6EvSEtIem3gl6niGggaa8+J0bVZpjJBpsII4+bkbnfXAxZtVM42dzXSFNQnkV
         wg08bnh1W8r3Vj7Oev1n9eWky4AW2ykoG1rpsXAWSbpWIfJ0UGUihAHYdm6svNFDNFHC
         IlPqKHOCT5jbfz44KhfEA2QFSFEFn+2eWIDwIv7f5UGMAFlRPoVX/lEW0YKKXsVW4pv4
         xBraYTji9Gm7fJUe13U7nOGVpj3Sr2BDzYkNNqwGAbVrIW73B1azG9PE+LJmTGvrPC04
         amJxZoilc4/NtXVO6P6DtGipaV2r0U7Cks1geKQgWQx7GG56k1GjYecKTi7KFY7CSCKw
         4ZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=ANFSWWtUVR9QFpQ5TrrVE4i0FFeHFkE2eWzF5C6ZG+M=;
        b=SGkmPeOeTfh7pRF1vL+uoym9MQfeZuQrfW5ylneRwsXxH/emM8fGm5nOb1H+aG94Un
         c8D/L9mqh1M+75DaoIJbnRwssHZI9NrqTR0V5p3jC7hwBh3/4ahFsAeKb/ANxwtio2IV
         gGD7fvQFRr2QsN1tAD8OeyQUF4RbD3J2sY3L9dC3sB155iXJ9cKr73m97ldTRcCxFBSE
         dKKZYyv+pX7qqcWC+PVz1AqBuOGSbgcqt+S9Zw0bUp09u/c9XFMhw8L/ID7CRTL9Y/WH
         5Y0YNTsaxLZcMGZ6UFOEHgqAfiV98Q8liz1yuCsQsdfXaf+E5U6vwSRXm+oh2U/um8Ot
         p0XA==
X-Gm-Message-State: ACgBeo2rWxgjyyuL0qpgElwhsdXnH7OGRgF/psMvRu78cfgCXM9LQylG
	GsW35QaMTHNCN9wS77fJeueNQ/ryDrqqXA==
X-Google-Smtp-Source: 
 AA6agR6WrusZUvc+pqgupk3V1UGBhhJl9RBd+ITcHE3Na/p0tn03hdHjf2VrHXDEpHEoxVNygDzzjg==
X-Received: by 2002:a17:902:d4c1:b0:174:3ce8:dd96 with SMTP id
 o1-20020a170902d4c100b001743ce8dd96mr7696952plg.80.1661624126783;
        Sat, 27 Aug 2022 11:15:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 126-20020a620484000000b0053617cbe2d2sm3997477pfe.168.2022.08.27.11.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 11:15:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-multimedia][PATCH 1/3] aom: Upgrade to 3.4.0
Date: Sat, 27 Aug 2022 11:15:22 -0700
Message-Id: <20220827181524.2847883-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Aug 2022 18:15:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98494

This fix brings in following changes [1]
Add -D_GNU_SOURCE on musl to fix ftello()

[1] https://aomedia.googlesource.com/aom/+/refs/tags/v3.4.0
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/aom/{aom_3.0.0.bb => aom_3.4.0.bb}    | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/aom/{aom_3.0.0.bb => aom_3.4.0.bb} (87%)

diff --git a/meta-multimedia/recipes-multimedia/aom/aom_3.0.0.bb b/meta-multimedia/recipes-multimedia/aom/aom_3.4.0.bb
similarity index 87%
rename from meta-multimedia/recipes-multimedia/aom/aom_3.0.0.bb
rename to meta-multimedia/recipes-multimedia/aom/aom_3.4.0.bb
index 778dc192c8..36db45e265 100644
--- a/meta-multimedia/recipes-multimedia/aom/aom_3.0.0.bb
+++ b/meta-multimedia/recipes-multimedia/aom/aom_3.4.0.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6ea91368c1bbdf877159435572b931f5 \
                     file://PATENTS;md5=e69ad12202bd20da3c76a5d3648cfa83 \
                    "
 
-SRC_URI = "git://aomedia.googlesource.com/aom;protocol=https;branch=master"
+SRC_URI = "git://aomedia.googlesource.com/aom;protocol=https;branch=main"
 
-SRCREV = "307ce06ed82d93885ee8ed53e152c9268ac0d98d"
+SRCREV = "fd0c9275d36930a6eea6d3c35972e7cf9c512944"
 
 S = "${WORKDIR}/git"
 
@@ -19,4 +19,5 @@ EXTRA_OECMAKE = " -DBUILD_SHARED_LIBS=1 -DENABLE_TESTS=0 \
                   -DPERL_EXECUTABLE=${HOSTTOOLS_DIR}/perl \
                 "
 
+CFLAGS:append:libc-musl = " -D_GNU_SOURCE"
 EXTRA_OECMAKE:append:arm = " ${@bb.utils.contains("TUNE_FEATURES","neon","-DENABLE_NEON=ON","-DENABLE_NEON=OFF",d)}"
-- 
2.37.2


