Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2806ECAAA1
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 03:41:36 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.3705.1662954088479425642
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Sep 2022 20:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OcyDGHWj;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id u132so7357609pfc.6
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Sep 2022 20:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=hhQJ3XJX1rCcIH1mMFORHP9Nd8aU7qWiPbHkM7PyJFI=;
        b=OcyDGHWjVD4FLxYjXFQc5Kt0Q504WyZx7xNq4dNYvK/J2lU51k7X8uZ9UkZXUPT73y
         cvCpCampTzM1rlN1tXRHYlGJRQHBGdZSva3qDOVTcnnAWmTYP/uXu04pK1kNcqaJXGa8
         9qu/ujhuKTi+Moj4O6n77I9g74+R1kE5Tqpm+9Aa/myDAayD7JT52iadp2JFiJoqXV2I
         dq2MeSuZ0pGBwAZVp7Emi0PgEo7iiJT/4F0KiJSm8d+11ptgZtpzl+25IYjhGBfB1+1Y
         DrZb8pm8JCdYoDCr/bRhYMbEgDrS4E2Q9rDG5VGly28dsrCStCHPYBWZb7+hy5P50Gn0
         aCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=hhQJ3XJX1rCcIH1mMFORHP9Nd8aU7qWiPbHkM7PyJFI=;
        b=PAK93U/DTpd12+kySw97289hzc2E8DCw6L8FX6jINawosU8AZ2MNVlMyzjMGPKTKc/
         zF7QpONY8sr8ytiWDgLj297iNFgmEudMMyMKoZb+1oBAik9v+W9jCBH5UJzXHb+vbEic
         98KF76p2v8N/gD4gdTkI7jU4B1GmGvNGdZCl654nrDq2/TS1VWE2Z+wbh+S+3CWi7Fzo
         Vc6fGSxGN5pBVaq8xzEGUxMvgmv4hkhyZVdTFZH5/fvUxTvgJM17cYLS1wbz58FrKR0b
         Zsz/xhr7mbXdRz3j9h0J/AY1tUOy3XOjHtBBQ6Mbz1+78OZjL/RUTy3oGJiw5hmi9hL+
         Khyg==
X-Gm-Message-State: ACgBeo3jyx/rwD3SSOyplPBCbX4kdPbSoSF+yD0cQk57+AOM2SJ9Keck
	jdbMSnn0KRiVu0s8cOMne4Js59Uj5vfovw==
X-Google-Smtp-Source: 
 AA6agR5o8UBjfu1MPJeL6+gkjOZgOHUXUHtjpRgzlYWhae2IqTKuS/boVHsP4QpK2ri1soN2NdebAw==
X-Received: by 2002:a63:6948:0:b0:433:5e5b:54b2 with SMTP id
 e69-20020a636948000000b004335e5b54b2mr21468421pgc.286.1662954087386;
        Sun, 11 Sep 2022 20:41:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8fc7])
        by smtp.gmail.com with ESMTPSA id
 d7-20020a170902cec700b00176ea6ce0efsm4664940plg.109.2022.09.11.20.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 20:41:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/7] libcdio: Define _LARGEFILE64_SOURCE
Date: Sun, 11 Sep 2022 20:41:17 -0700
Message-Id: <20220912034123.1885229-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Sep 2022 03:41:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98741

This package tries to use fseek/fseeko/fseeko64 based on a local logic
where it sees a need to use largefile supported fseeko on 32bit however
is a transparent implementation of fseeko, so to get explicit
definitions of fseeko64/lseek64 etc. serve the definition on 32bit
architectures via cmdline

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb b/meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb
index 1facd47d8f..62004ac440 100644
--- a/meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb
+++ b/meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb
@@ -18,6 +18,9 @@ PACKAGECONFIG[cdda-player] = "--with-cdda-player,--without-cdda-player,ncurses"
 PACKAGECONFIG[cddb] = "--enable-cddb,--disable-cddb,libcddb"
 PACKAGECONFIG[vcd-info] = "--enable-vcd-info,--disable-vcd-info,vcdimager"
 
+# add -D_LARGEFILE64_SOURCE for 32bit targets
+CFLAGS += "${@['-D_LARGEFILE64_SOURCE',''][d.getVar('SITEINFO_BITS') != '32']}"
+
 PACKAGES += "${PN}-utils"
 
 FILES:${PN} = "${libdir}/${BPN}${SOLIB}"
-- 
2.37.3


