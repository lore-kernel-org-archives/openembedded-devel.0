Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web09.3612.1619494133579613894
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Apr 2021 20:28:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q3Ho3OrW;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so6379554pjh.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Apr 2021 20:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gTEXpYp6ZS+TnpmBZd/cSFemJBcAukrIP6Iqr+U10k4=;
        b=q3Ho3OrWRNyOKPjB+weGmHjCRDiXEkPG6QTS5df/Y/GdwAUCrF3z+sBaw0xJa+kZyE
         YXwFoANZeOaDUv4jpzJSqG+QFz4CK6x1kbtHy8WtzrEIo0suPGOurVIIBELBOJ+MVE8V
         tzBndGXr2LuxB3a/AkHUkQC1wAQg0lQDjYaxeAyWVT1xsS+uIOoK82AVptUC8SoJTWrh
         vOIUmnvyvS6TF0ijYK+JDZCiajRUayh6IrPwBKslnfB5GxdMQC22IPUYkzuOGlm7PlJh
         BsmHCILw61+RzC1wzXXvl8CSmeYnzzE1KwKkMaYI2cobIUQCkxow+eKCXKtMmCdwXEeZ
         y+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gTEXpYp6ZS+TnpmBZd/cSFemJBcAukrIP6Iqr+U10k4=;
        b=OxK/DRophgeP3QPtfZEA57S3xDFH0CAp0S8kALKra2QmN5rYDlDRv1BrGj5OavzLF/
         wvGHdOvlLrRp3ojOBJP5X1bqT5+DZ7MlmYTz0lMMv/rjVT1tLpGoTT9kRNDaUGdjS6Tv
         Co/9aEbm9uCDre52hkvShzdTdZdNdBUc4A1Ip19wJ2DzqQIzM6kUFb0tW3jH7BrhLpYk
         PThZ28emHlshJPAv7SLAv4rv98mQODPoUYbFawoxVAfcfHxLh0CrZ+FHByXZZ+W4XbJJ
         umLThJoeAHROrXbV0m51STIYQzBCRCYcjqGUlruUyTAmVCNdmd7rAI0U2eExGAbdfbnU
         PkPQ==
X-Gm-Message-State: AOAM531ePll0nftujsrXSGAJDCAMhP64YBIpOnelSGweGoFnRsif6lJU
	1W8qX5ZszoNY01MvVYlsBIQgeBloew1GdA==
X-Google-Smtp-Source: ABdhPJxNltVrukKdSHoakWsBXRJz7JUHfWA6Si73QKGrGIXzGkANVkOlRrLKsoxtBA3GwmO8HLHWvg==
X-Received: by 2002:a17:90a:c3:: with SMTP id v3mr2685956pjd.55.1619494132834;
        Mon, 26 Apr 2021 20:28:52 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ef3])
        by smtp.gmail.com with ESMTPSA id c125sm944231pfa.74.2021.04.26.20.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 20:28:52 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Persian Prince <persianpros@yahoo.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] libdvdnav 6.1.1
Date: Mon, 26 Apr 2021 20:28:49 -0700
Message-Id: <20210427032850.4087312-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Persian Prince <persianpros@yahoo.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libdvdnav/{libdvdnav_5.0.3.bb => libdvdnav_6.1.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/libdvdnav/{libdvdnav_5.0.3.bb => libdvdnav_6.1.1.bb} (72%)

diff --git a/meta-multimedia/recipes-multimedia/libdvdnav/libdvdnav_5.0.3.bb b/meta-multimedia/recipes-multimedia/libdvdnav/libdvdnav_6.1.1.bb
similarity index 72%
rename from meta-multimedia/recipes-multimedia/libdvdnav/libdvdnav_5.0.3.bb
rename to meta-multimedia/recipes-multimedia/libdvdnav/libdvdnav_6.1.1.bb
index c2dd96f9d8..06308d96c3 100644
--- a/meta-multimedia/recipes-multimedia/libdvdnav/libdvdnav_5.0.3.bb
+++ b/meta-multimedia/recipes-multimedia/libdvdnav/libdvdnav_6.1.1.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "libdvdread"
 
 SRC_URI = "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.bz2"
-SRC_URI[md5sum] = "e9ea4de3bd8f204e61301d407d09f033"
-SRC_URI[sha256sum] = "5097023e3d2b36944c763f1df707ee06b19dc639b2b68fb30113a5f2cbf60b6d"
+SRC_URI[md5sum] = "46c46cb0294fbd1fcb8a0181818dad15"
+SRC_URI[sha256sum] = "c191a7475947d323ff7680cf92c0fb1be8237701885f37656c64d04e98d18d48"
 
 inherit autotools lib_package binconfig pkgconfig
 
-- 
2.31.1

