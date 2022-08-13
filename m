Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73FDC25B0F
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 04:38:21 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.2013.1660365493275883897
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Aug 2022 21:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hWqtk+W3;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id ha11so2645538pjb.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Aug 2022 21:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=PZqrlz6v5BmzvDW45D8/VUsy7be5YwacxlbQWkZRoaQ=;
        b=hWqtk+W34lLKscJn5nuswZJbxxe1Lx/9pm58iRNdZmKg9o47lLO+XJLKcqTGCW0K9g
         uiumRpf4HlWnn3BREl8FwK5NTNTeUgB4CTg8E/7Aqu6+K+OyhW94ibO/DOvlh7MsFHv3
         rb1Du8VWHTpg9R82mLlmGAb6TBHH1IC55+Mm4H5m9tkyWp/sOLj2lQPXrKNFqM2UJySx
         iJ47s0NizLlWWHxy0xr2r6mc9Z9Bc1XPoUEJa7rnf0z63yQu0AXaVIKXZI8L26OXntVA
         NcwKFYmFH7sZ2/8yVzD6ZiptXyQyAN+OXm5/+q0BLZYR1JYnJLSPrugMTPm5q60e3iq5
         Zw/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=PZqrlz6v5BmzvDW45D8/VUsy7be5YwacxlbQWkZRoaQ=;
        b=3+DrWFzx9XNstTrVzMwL7oaMLvtAvFiCikqr1IZKEkfeuiTbuJfFJUdeeyrG2a3Hfh
         J2uIviQVAJaVgsjQog29V+OUmTr8aHgatFbnQ9USaAZlZW6QsdYEjpitLtl17VGl7S3P
         3tJtTCd0J2EVLZ1F7BXTUi1FWijh1teNWw7OiIhdKvuFgCFoYNJDMfoozLG43FnDFuwb
         MbPOE3fDdtxjGAFfSG/R0f9vn3dnkWmtXAeBjewYrqRi8QnS6Le/QVNbNlKnsr7o7JED
         A7Eoic1y3D45Sy+2eU19F377MkUj88g1jfsWN8+8ftRVwhmSEW3DvwreqfPM6I+LsLVJ
         XhqQ==
X-Gm-Message-State: ACgBeo16oyfENM6ftz164M2LwxMWyqnH4WQUKUchUWJAlQLbwkkpadbY
	irnYEfc+QuiEnxOvUdjysV3dv9LEcEw=
X-Google-Smtp-Source: 
 AA6agR5inK5ubh2mODLNt3JDQOgnYEe/OdetocbEUxYguJnthVeQpKqQzm0UQIjsdbVC2yBmzOGYCw==
X-Received: by 2002:a17:902:e887:b0:16e:ef31:416b with SMTP id
 w7-20020a170902e88700b0016eef31416bmr7098235plg.51.1660365492464;
        Fri, 12 Aug 2022 21:38:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 j4-20020a170902758400b0016d62ba5665sm2601694pll.254.2022.08.12.21.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 21:38:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 6/6] libmtp: Always enable largefile support
Date: Fri, 12 Aug 2022 21:38:03 -0700
Message-Id: <20220813043803.3548501-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220813043803.3548501-1-raj.khem@gmail.com>
References: <20220813043803.3548501-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Aug 2022 04:38:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98224

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/libmtp/libmtp_1.1.20.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.20.bb b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.20.bb
index f7a7507b8c..41fc46c31e 100644
--- a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.20.bb
+++ b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.20.bb
@@ -25,12 +25,12 @@ inherit autotools pkgconfig lib_package
 
 EXTRA_OECONF += " \
     --disable-rpath \
+    --enable-largefile \
     --with-udev=${nonarch_base_libdir}/udev \
 "
 
-PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'largefile', d)}"
+PACKAGECONFIG ?= ""
 PACKAGECONFIG[doxygen] = "--enable-doxygen,--disable-doxygen,doxygen-native"
-PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile"
 PACKAGECONFIG[mtpz] = "--enable-mtpz,--disable-mtpz,libgcrypt"
 
 PACKAGES =+ "${BPN}-common ${BPN}-runtime"
-- 
2.37.1


