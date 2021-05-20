Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.10704.1621526941273817367
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 May 2021 09:09:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iroQL8G7;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d78so11835439pfd.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 May 2021 09:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P5+jG6hAKg7g19hPiu1akftxDV30WCkTdW+0+pQ0RWI=;
        b=iroQL8G7joVlCVdXtXN/NrEZQ/zsr+qw64+p+iXdmSD66ETJ+8SLRmKzFef4fgw+t4
         YQ+OiY4u0O5kbPcxbyOpi/FVFcsCZBMaAxyFpYe4xGAcS9KUnI5lfvlz51S5D6MLbAQs
         qYpzh+F0PAwzv8ZkSooh6KYaa41whKicEhL+v9jzriJ3a9pA/SnEY3v93wt4Z04y+5w6
         g11zr1i5XbRDIf8MGWTULs+PUuay6C6xQzqZPuZAoRgM3mffI1YfmWsQz5TVQEU20/k1
         g9fVPZwv8C9x06YD3I5RCkn+dCN60kIER3cSyVV+ML5sov6mwRFYNNA+1M3JxiUWKFYG
         4xAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P5+jG6hAKg7g19hPiu1akftxDV30WCkTdW+0+pQ0RWI=;
        b=XDrczNivXZnIPK95PMvtMHss9Z75fLYgx7K9sFSWDegu0aNSFQxo7m89mwIrlJ3X7D
         vWa4pAaoI2KI/MyGtMa1dsMn6+hWCMQvls7nLOl+Q8lAW6tQQ4r9Qf3wAd5wbZD+WXIN
         WKyx5e2LTVd2JJ0B2EFYTWNLjATaeMPqR64vXKMXQGwsHhc6vdWgIpFAhOHKLbSnB77V
         1WvFlJOXDSZgMldlKR5gIJZG+pDEjdHl6AsNDWTu6ux8Z38qbsynMWtknWNidxHIsAQQ
         9419LgWVyRBjq4PRjAYzi8aNiFTf3cFuvHEKzejFWLlg10LXpwDpOnydWJrLn0Tr+eZ9
         12mA==
X-Gm-Message-State: AOAM531fky4ufcBGrnZPAE1Rl0rC7No/8rgzVlzmx19yyHbzhuP6ULqc
	84nRPND/ZpkeSDqemPTXskCWwHaS/lQIgQ==
X-Google-Smtp-Source: ABdhPJwMzcxhDEsQg0uwP5gfD4MCEU5ILm8sunW+iGdVysjR/UvLDP1Cl95ASgerzwEPieVV/2vwwg==
X-Received: by 2002:aa7:9f8f:0:b029:2dc:76bc:edce with SMTP id z15-20020aa79f8f0000b02902dc76bcedcemr5218627pfr.29.1621526940378;
        Thu, 20 May 2021 09:09:00 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a746])
        by smtp.gmail.com with ESMTPSA id s16sm2528802pga.5.2021.05.20.09.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 09:09:00 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] opencv: Disable tbb on riscv/musl
Date: Thu, 20 May 2021 09:08:58 -0700
Message-Id: <20210520160858.1809113-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

getcontext|setcontext functionality is provided via libucontext for musl
but this library is not yet ported to RISCV

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_4.5.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.5.2.bb b/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
index 1dcd8586cd..226bad5778 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
@@ -108,6 +108,9 @@ PACKAGECONFIG ??= "gapi python3 eigen jpeg png tiff v4l libv4l gstreamer samples
 
 # TBB does not build for powerpc so disable that package config
 PACKAGECONFIG_remove_powerpc = "tbb"
+# tbb now needs getcontect/setcontext which is not there for all arches on musl
+PACKAGECONFIG_remove_libc-musl_riscv64 = "tbb"
+PACKAGECONFIG_remove_libc-musl_riscv32 = "tbb"
 
 PACKAGECONFIG[gapi] = "-DWITH_ADE=ON -Dade_DIR=${STAGING_LIBDIR},-DWITH_ADE=OFF,ade"
 PACKAGECONFIG[amdblas] = "-DWITH_OPENCLAMDBLAS=ON,-DWITH_OPENCLAMDBLAS=OFF,libclamdblas,"
-- 
2.31.1

