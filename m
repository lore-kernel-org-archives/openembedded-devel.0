Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web12.63716.1595878065638362828
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2020 12:27:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=aOWLegcR;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.171, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f171.google.com with SMTP id h19so18504665ljg.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2020 12:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tl4zMb1fEEIE26UdjQruQITTv6oPSgtk1fJIHrW0Bjg=;
        b=aOWLegcRQ/Pc/GwFSN5AwZb82iOIfV4EQX5QOWtGHVUCDpH0lKYZ2CsgQstTyRxtxz
         NbRUhRYUJS2CXQiAmeLb4mDRxOapcDO1lZV47Y2aG+4/fy72EA4qzUwoetj4UAGDhBTg
         iO6PmpG0Ry82R3A91HGAlIte3SLvYhq3A687b/dGt4uZpmFhDScJrdO8PdxuPT++vjd5
         PveRwwAdXf3PMX/+eXpCx8H3bFDlM1RCPZbUKbYOpBSVFJpQWrLunCUJzH3sVZaWMorG
         YDrLyuKM0te0J6+AJUrwQWYtheblypCdw4OFMgzPC9fcLZ0INfRhQ/JQTDuwfDwsa8CU
         9Cbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tl4zMb1fEEIE26UdjQruQITTv6oPSgtk1fJIHrW0Bjg=;
        b=M7KP1Mzx2KkPAAjiIgY7PozIcrtfYme2SCyuQqN6vPNuCMvaySCKKZbXj+7SfLKsur
         QHUAqwakXcCTkgTbpslQtP0CdIGrM9AHqs3dmGN/c+1QkVKSVNlWLsDsPQvYajejhFhN
         FGjUGE4vqXt9Cbj3NMDfxKvtMkh6waibc/LhlK+eeXHImgJZyLLPNVXKji5A7GC+hiep
         /Gv2ETRhVTmoWd24pY8P/9TuyV8G+m+THUNg6tzx43nIRsMKoHAmycGQ7ZqTBS8TwJ0L
         j7mbBg1RiCBYwYx5djhEfAE95kzeDQHMdPjUU8/uWB99ovCaYRUqolGNrusNKhoRi1+p
         Cflw==
X-Gm-Message-State: AOAM533yg1b5zKGnEVjV5XJ4liKX6P3zhIs3doyf3TZxeSrzrf1z39pY
	ooqrnVSJQdV7AX2OmvMCPVrIo/DmLME=
X-Google-Smtp-Source: ABdhPJxRUOK2u8JiESnW6DA7LoQGSZzKujAoowleG7asauD04f50sETQZ91X3Fhsdhnmo4wfwIqGzw==
X-Received: by 2002:a2e:b4bb:: with SMTP id q27mr6535488ljm.277.1595878063469;
        Mon, 27 Jul 2020 12:27:43 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id u19sm2910311ljk.0.2020.07.27.12.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 12:27:42 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2][meta-oe 5/5] ifuse: update to 1.1.4
Date: Mon, 27 Jul 2020 21:27:22 +0200
Message-Id: <20200727192722.2488841-5-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200727192722.2488841-1-open.source@oleksandr-kravchuk.com>
References: <20200727192722.2488841-1-open.source@oleksandr-kravchuk.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../ifuse/{ifuse_1.1.2.bb => ifuse_1.1.4.bb}              | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-filesystems/recipes-filesystems/ifuse/{ifuse_1.1.2.bb => ifuse_1.1.4.bb} (54%)

diff --git a/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb b/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.4.bb
similarity index 54%
rename from meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb
rename to meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.4.bb
index f0b58b9673..8a317cddbe 100644
--- a/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb
+++ b/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.4.bb
@@ -5,11 +5,9 @@ HOMEPAGE ="http://www.libimobiledevice.org/"
 
 DEPENDS = "fuse libimobiledevice"
 
-SRC_URI = " \
-    http://www.libimobiledevice.org/downloads/ifuse-${PV}.tar.bz2 \
-"
+SRC_URI = "https://github.com/libimobiledevice/ifuse/releases/download/${PV}/ifuse-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "4152526b2ac3c505cb41797d997be14d"
-SRC_URI[sha256sum] = "47835c8afb72588b3202fe0b206d7ea37a68663d9aa4eaf73f0a4bcb6215fc05"
+SRC_URI[md5sum] = "cd31fbd0ea945b2ff1e39eac8d198fdd"
+SRC_URI[sha256sum] = "3550702ef94b2f5f16c7db91c6b3282b2aed1340665834a03e47458e09d98d87"
 
 inherit autotools pkgconfig
-- 
2.25.1

