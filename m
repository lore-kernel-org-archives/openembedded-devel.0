Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.875.1613689058858859985
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Feb 2021 14:57:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h277QnUP;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id b8so2113449plh.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Feb 2021 14:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jglb1e0lTG2VFSLnSfar8tTCEXZ69LbmYU2CiD4s31s=;
        b=h277QnUPBIuXnAZPV3O7Rh4jjVqmMxfKMqXVY3pJSPSPfx9W5M1gabbaxRcfZiFSe2
         d0IQ9A9IqgeA0+E4SJN5gLNKw7YLz2Tu0RCynJ/iAjTKm9x4u07Ba8I8CfvuRX1AL+Fm
         Zqh8kdKW/4jJ/ed5BLNzpe8CcaSmzxr1PJDQNaQlXd+wizQ0JdMm+4RctCsUB3THiJjv
         6BfC+uJHG80l3tl3dlyJkfzwQMfPc930jVqPByflm3/JCWCjEWnFFxoq51FyqwWEK9U6
         2GszetrYir513WWDeAducbAwuWi3vyAmv+fKa9A2oovF0lfVKQvkRwyfS4ix4lwFjs3Y
         t18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jglb1e0lTG2VFSLnSfar8tTCEXZ69LbmYU2CiD4s31s=;
        b=pxQTA82wh42duLIxGQJ+E9pz+8LZuw0ShNF/49Z9T1EaUoZTygPMFE7xwagHlo4QX2
         qabZEIjHLLbhaUDl40ZCmbjkJp+7iGS3h6DeiZu846ASP5rPGNXUvrETk24ITYI0ENW5
         o+PSeLDGeprtBjfbKz2Os++c3X/QvveRjw2Kbpf29+bk8Y2NUNpiAgtgqZ6KDhxwZ2wB
         vNQdhX8lAv5F4qGGr1iFFrBV2KUZOZmTKze7OB/bAdOZ0C60gucOJ1YvSLjMgyBtRaRg
         EucuxWXfeT5EVIzCHXjuROzmBZ1VxyGc2GJkIk1qrxugKu6GtHXWylWZ9VYGrW4C1MW6
         OelA==
X-Gm-Message-State: AOAM530Iobk2UlqaAkc+wg+KJbmwV66fiYlFak2v/+Ava+L3yowh5FrI
	hD1mCGRq8XELg6iw+UWB7qpPnVTEpXK7gA==
X-Google-Smtp-Source: ABdhPJzIvN2L0yLrp+wE068+Tg+O1Qg0wXgdmyvfZS/tFVHnIP0c/+AsJCKqOIkSkRhAL621i9lyBg==
X-Received: by 2002:a17:90a:eacd:: with SMTP id ev13mr6008585pjb.85.1613689058195;
        Thu, 18 Feb 2021 14:57:38 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::54b4])
        by smtp.gmail.com with ESMTPSA id k128sm7187215pfd.137.2021.02.18.14.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 14:57:37 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-multimedia][PATCH] aom: Disable neon when not present in TUNE_FEATURES
Date: Thu, 18 Feb 2021 14:57:35 -0800
Message-Id: <20210218225735.1149143-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some older arm32 cores are without neon units e.g. armv6 (rpi0 fame)
therefore check for neon feature before enabling it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-multimedia/recipes-multimedia/aom/aom_2.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/aom/aom_2.0.0.bb b/meta-multimedia/recipes-multimedia/aom/aom_2.0.0.bb
index c5ad1f8062..41ade08791 100644
--- a/meta-multimedia/recipes-multimedia/aom/aom_2.0.0.bb
+++ b/meta-multimedia/recipes-multimedia/aom/aom_2.0.0.bb
@@ -18,3 +18,5 @@ DEPENDS = " yasm-native"
 EXTRA_OECMAKE = " -DBUILD_SHARED_LIBS=1 -DENABLE_TESTS=0 \
                   -DPERL_EXECUTABLE=${HOSTTOOLS_DIR}/perl \
                 "
+
+EXTRA_OECMAKE += "${@bb.utils.contains("TUNE_FEATURES","neon","-DENABLE_NEON=ON","-DENABLE_NEON=OFF",d)}"
-- 
2.30.1

