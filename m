Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.6669.1616721827365707365
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 18:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Vy90B5NV;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id i22so3529352pgl.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Mar 2021 18:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nsSTap9Kw20zep5CbZenn/Ita/EduLnkcSUNaDxygRM=;
        b=Vy90B5NVOaZKiUMSdHEWLLHE+eywNHF6a14E7fW3Iw2DIPLbdghFEOwTCuPkL4ck7P
         WvDUlJ4ncWoRW/MSGpvddUEY752JeNYzDGQKZ+AsTcrmZzbstUKKEtxRC8GiYlbydWYZ
         LxyWOUTPMd/9kpTD9ESVUlHPU/IFDBK/6Khor9ZfVYWV9UcNgptgYlZGZ5hHsHLfJmx7
         8XHj+h/vD17jiGJTJo6chyMdnS6bD4fvs5p6BHHILtEitos0x/8oZA82IBIY2P4Cx8EX
         K+7G3iGU/V3LPWGNJmKtD0SpXmGkUDgOanvbNILWimJB55xwqNsfdbm9gVo87ZQwYhCC
         ORpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nsSTap9Kw20zep5CbZenn/Ita/EduLnkcSUNaDxygRM=;
        b=rmyL1bUJNc7YdsBxetSVQTn5PzhHdUZBJx6R/d+tm983TP9M+M9+wD70oyz9MHzYGo
         Rm178PPFbsogSUjWrjMAJJ9L8hXXmYKgk7TeLlwaDY2YFGH3SpRN/RHFj5cH5b6W8cjH
         XkYL221kI9wrWuGOSfI0lkwHm9XMTiHtCm+P+cla3wSrQBZNelhQghWSn/54uf7IaXwv
         MwYHm1qNHbCTzbqalFTtZmGduEsQTbTlw+WBbI8AhhpW/4x8OnmCpJK3khY1336m2Xij
         2dJFziBLLSCDsHVVj6JCSBhIa9NShPJ50IFb+b4X8RwbhKOe2C2wrcglMQeVqdT/3VZH
         UjHA==
X-Gm-Message-State: AOAM533CXh4SyovUE2eAW/yGg1KDxcDjvW1Z3HMyBRf0PBS6yzrXB3vG
	fFDvcddTUb391HnCQVo8sRLZ9IIY914QlQ==
X-Google-Smtp-Source: ABdhPJyKcmyIHLLwU5jwXT0XyLogyn/Mpxagcob/vRMrA+9msp+lZLnsMKhYngrjecDKf62Ljeb3UA==
X-Received: by 2002:a62:1c86:0:b029:205:5428:41eb with SMTP id c128-20020a621c860000b0290205542841ebmr10706543pfc.33.1616721826736;
        Thu, 25 Mar 2021 18:23:46 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::aebb])
        by smtp.gmail.com with ESMTPSA id i8sm6688720pjl.32.2021.03.25.18.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 18:23:46 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-multimedia][PATCH] vlc: Exclude from world if commercial is not in inclusion list
Date: Thu, 25 Mar 2021 18:23:44 -0700
Message-Id: <20210326012344.1063960-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove LICENSE_FLAGS setting as its no longer needed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc_3.0.12.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.12.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.12.bb
index c0074aabb5..cb796a00fa 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.12.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.12.bb
@@ -16,9 +16,6 @@ DEPENDS = "coreutils-native fribidi libtool libgcrypt libgcrypt-native \
 LDFLAGS_append_riscv64 = " -latomic"
 LDFLAGS_append_riscv32 = " -latomic"
 
-# While this item does not require it, it depends on ffmpeg which does
-LICENSE_FLAGS = "commercial"
-
 SRC_URI = "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.xz \
            file://0001-make-opencv-configurable.patch \
            file://0002-use-vorbisidec.patch \
@@ -134,3 +131,4 @@ FILES_${PN}-staticdev += "\
 
 INSANE_SKIP_${PN} = "dev-so"
 
+EXCLUDE_FROM_WORLD = "${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "0", "1", d)}"
-- 
2.31.0

