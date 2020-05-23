Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web10.2139.1590203270579443051
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2020 20:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WbcJoaol;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id t7so5172452plr.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2020 20:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=+n0ZkwgKAxIaukyVuCA9+IBYIBqzeNeL4JLVLiwSDCo=;
        b=WbcJoaolu6M2whO8odwg5fg0aONRVZ8oa6Z2B6FGAFQ0fD1jkEZODcldbmjnnTX9LO
         PjeZ3J4jN4GppaX0UEVVELMaXPKy9599CglEAHs3AuzWGNWLLTyLl50nPgVmZKkj+lpD
         yiJE/mAdFCl7pb5aMihtgWDmBJB3AuSqsWCu47GTN+kmCtpUvB1FEKeVF/ETsB096NV4
         UAqE/vDGAxzJ5e2JWy/PF+X9uVmn//7cU8TwqL/qiuvWvFM0Wc/zWh3ZFlSNHUxQ28CX
         ZCHii4HJlcX0kY7eWAhhfozZirvBU4+VvmZm9VfaMSwbM6ukIeFce7Dn7m7+eIigPoMo
         pptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=+n0ZkwgKAxIaukyVuCA9+IBYIBqzeNeL4JLVLiwSDCo=;
        b=br5Dfe28WvbfzODdoRV0c3vroZ/qL2t7j55O7n6e2AZepK/JGiPhIkVZNYrjYYv+3P
         ZPzbzkFIRhlb4D9i8Hiu3ERouCP7XVaP15Y2TXad+H73ZLbIj7vI4pKO5/zClSbDdLpR
         n+f90IPPDkl1wEZ6DhSysEZSdWDZx6+i81ORT1HjuBKf2Qsm8ucioJWWU9zL0w51AJtG
         enL+2OIBUVZHL8are65GM7tH58x7vkDoxEvwMuWsNeRH0mDF/VAnp+fRuXh1ZJ/vHWlv
         nQQxB+C/SuBV7d74G4MVPWsZ605Qr+5MgSFqAusvkBq/BtrX4VStWcn88JS8bQX3be13
         YXWA==
X-Gm-Message-State: AOAM533WQ9455/KaEdi7XKoTBXb5dCVQufpkZSyrhT9ZwJyaMgySC2lE
	3X3xcCN3eQnciDWyu+3RMNFPrsjO
X-Google-Smtp-Source: ABdhPJy4ssfcBQKoKX9hOc5WDaJl6t5rFmdPqAszG7miodKqqAQSyZoSgfnZopb+HcWr/H1USptb8Q==
X-Received: by 2002:a17:902:207:: with SMTP id 7mr17409292plc.331.1590203269719;
        Fri, 22 May 2020 20:07:49 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from localhost.localdomain (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id j21sm5998541pfn.202.2020.05.22.20.07.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 20:07:49 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [master][dunfell][v2][PATCH] tremor: update SRC_URI as project moved to gitlab
Date: Sat, 23 May 2020 03:07:47 +0000
Message-Id: <20200523030747.3387-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

It appears Xiph.Org is now on gitlab
https://gitlab.xiph.org/xiph

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb b/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
index 28bb5d924..6abf6080b 100644
--- a/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
+++ b/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=db1b7a668b2a6f47b2af88fb008ad555 \
                     file://os.h;beginline=3;endline=14;md5=5c0af5e1bedef3ce8178c89f48cd6f1f"
 DEPENDS = "libogg"
 
-SRC_URI = "git://git.xiph.org/tremor.git;protocol=https \
+SRC_URI = "git://gitlab.xiph.org/xiph/tremor.git;protocol=https \
            file://obsolete_automake_macros.patch;striplevel=0 \
            file://tremor-arm-thumb2.patch \
 "
-- 
2.17.1

