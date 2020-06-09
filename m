Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.324.1591714696055240455
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2020 07:58:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=IhxSzTNN;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.169, mailfrom: fabio.berton@ossystems.com.br)
Received: by mail-qk1-f169.google.com with SMTP id v79so21005316qkb.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2020 07:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version:organization
         :content-transfer-encoding;
        bh=h6tCbJL2m9nXLuRAlL0FWlAkWW0m822sFExFky1D4YU=;
        b=IhxSzTNNyqr/tbI1xTAg6eNfEQDY69lWiPXdEDCp0fjdwp5BUHLFhDyMZY/OoVtxxT
         L/N7ov2VwhSppy/eS5cK0nzrIufkqu13I8qlhumfVsSB8DFw7JgtyS0RuHQSnuBtqo42
         h+3FCmU+azynxPuEjip88dJk3vb88sLHYz1/SheIEQDRex6K3+K6nhX+UXePWO6LYKYr
         VLazcAynJ1DwN5hHwbOyqatGquD40EbnqnmSvxf/JcM9nRS+cFSxP4CPyCbnXwRxCBk4
         BNcM43B06ezTM6JelYnjcVfzKs+UkTGlEUuJdEW7Y+JUMdnDP9mbxrT/C/CA21rs5HRT
         YxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :organization:content-transfer-encoding;
        bh=h6tCbJL2m9nXLuRAlL0FWlAkWW0m822sFExFky1D4YU=;
        b=SYzgdu6Lp1M24g5Q4ZNi/eUWvBLQQxyRBveT3QEFF6RltyfDWUnI/McL89US5yrfM8
         4vON6BoChJnD+ClvKgGEDRhzta2qGlCty85l7dHUifHVMtEcVZGg82UIJP/ZVPk0yV0c
         wcs/eoPDQ9qEzAiy7/1yCsmBSF9mjOdiYmO0d24ehXrU4Pv18BvS+uQC0ikJ6nfouiS5
         ZIFlrswGCa/Eh5jzqD+MSAcdT/7H5yQ2yyDLPBeCJIGZT4hf4GqIR9IbtR4SWR0CV+PR
         LSPqhmPjZO/TnsP/hsyzqKwMRtQXNhlJsdldcKUohPhekfxOslHBlWMtra8RBkUwKH5k
         vsXw==
X-Gm-Message-State: AOAM5302ksfiQ3S49uva3giWvqpvPnF9kxM3miD0KnQvMtIdo/2yfrQA
	nDi7PE8UHX1bVlxoMo4nhyufl0iBdKA=
X-Google-Smtp-Source: ABdhPJw16OptKc3iLQtifdnh5rlaFLavBPzosE3myxLYxi5dUqgMDAozN9MA6mv/gsUA8xJSpwpH4g==
X-Received: by 2002:a37:64c2:: with SMTP id y185mr29266470qkb.186.1591714694309;
        Tue, 09 Jun 2020 07:58:14 -0700 (PDT)
Return-Path: <fabio.berton@ossystems.com.br>
Received: from pikachu.lab.ossystems ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id j5sm10557995qtr.73.2020.06.09.07.58.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 07:58:13 -0700 (PDT)
From: "Fabio Berton" <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-java][PATCH 1/2] openjdk-8-native: Add libxtst-native to x11 packageconfig
Date: Tue,  9 Jun 2020 11:58:09 -0300
Message-Id: <20200609145810.4058137-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

libxtst-native it's needed to build openjdk-8-native.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 recipes-core/openjdk/openjdk-8-native.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/openjdk/openjdk-8-native.inc b/recipes-core/openjdk/openjdk-8-native.inc
index 321a43d..f6d617a 100644
--- a/recipes-core/openjdk/openjdk-8-native.inc
+++ b/recipes-core/openjdk/openjdk-8-native.inc
@@ -8,8 +8,8 @@ DEPENDS = "\
 "
 
 PACKAGECONFIG ??= "gif jpeg png zlib"
-PACKAGECONFIG[x11] = "--with-x,,libx11-native xorgproto-native libxt-native libxext-native libxrender-native"
 PACKAGECONFIG[cups] = "--with-cups,,cups"
+PACKAGECONFIG[x11] = "--with-x,,libx11-native xorgproto-native libxt-native libxext-native libxrender-native libxtst-native"
 PACKAGECONFIG[alsa] = "--with-alsa,,alsa-lib-native"
 PACKAGECONFIG[gif] = "--with-giflib=system,--with-giflib=bundled,giflib-native"
 PACKAGECONFIG[jce] = "--enable-unlimited-crypto,,"
-- 
2.26.2

