Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.1845.1586814318112747330
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2020 14:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vggC6lle;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id a23so3893884plm.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2020 14:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jEDJgNslgrGOnzNo3JKhE8siN8aI7pqQdF55MhLcA3Q=;
        b=vggC6lleWLYKZglbEnohreWCk+ipC0IpHYNxWn8DyI+JBmAc18tVo9dxOIico5TfmD
         qzA0uQnMGOgeGiyi4iJjUmDFhICrYLkoD+2VlTgSd7EUAy20hpmwGAXiJLVKxMjHFcGw
         K+fGX1VHLbSM4Q5zPmUBM79vlPeEi/H8IglY+OYHCyJ0lz7sABurqyyuFY3xzIqbTlXL
         T5EgWWtHFcyT3Kl1QQadKnVUpi8Dj3qOUsy5Dsfz0bmtTmIALQL2yQGlzF5TMLdcGSFj
         3RzFFPmDfdqMrqGK7xM7YV/gCJr2QTkymK20kvGpqzcQCxPF4wsJPmyp1CZ+w9TCx5Vj
         MKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jEDJgNslgrGOnzNo3JKhE8siN8aI7pqQdF55MhLcA3Q=;
        b=O8AfuFq8GWMxY+liBExChg1Zm11zlafXZugIe2sprVTNk3C5/T6R3gMtcJ38gmm9mo
         wrWr7P/27W3YS5pIRY5AAyZucFvU6cLQ4Y3uI8EhUAyTBw00vKcN5WXQzIGFv2OzbH7n
         RKYHyDasbC5AbEvs/9sGrserMZyqsBRXbZm7j4Of8UtnlpCIhs15J8QX5UAHqfccrfMW
         Mllxfm2uB/Ln/WSuXtTPO1dI7ZU4nMdqwGiylyziOA8vzAD6u85syaGXWkc3sHTvllOe
         O7wJX2IfFfpAm1CyfIUO5pUW9vmLIc+WeC7cpHqWs06fM9s8+7s1voEenNBhENKdVA5Q
         i6Tg==
X-Gm-Message-State: AGi0PuaeCcxwgRkEJwDghDzPHjAkMFzs6FsT5IEK8Lqw4Xd4DkU1u/9t
	Z7BXVqVGJyGnT7bnjROI0RENzvhmUYk=
X-Google-Smtp-Source: APiQypJ37NP/vsGeK8+CuS9+IWRnZIVwLnVutCdJYuXpcGkiIxSkfksZevoDhD0q69vFAJAcJ20VOw==
X-Received: by 2002:a17:90a:a40d:: with SMTP id y13mr24237950pjp.116.1586814317219;
        Mon, 13 Apr 2020 14:45:17 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::58e0])
        by smtp.gmail.com with ESMTPSA id s15sm6650165pfh.17.2020.04.13.14.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 14:45:16 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 3/3] vlc: Add check to require X11
Date: Mon, 13 Apr 2020 14:45:13 -0700
Message-Id: <20200413214513.1793854-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200413214513.1793854-1-raj.khem@gmail.com>
References: <20200413214513.1793854-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It needs X11 as of now to build. there is a possiblily to build it
without X11, but lets keep this check until that path is fixed

Also fixes

TOPDIR/build/tmp/work/aarch64-yoe-linux/vlc/3.0.9.2-r0/recipe-sysroot-native/usr/bin/aarch64-yoe-linux/aarch64-yoe-linux-ld: cannot find -lGL

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
index 9e41512c3e..556e79c7e6 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
@@ -25,7 +25,9 @@ SRC_URI = "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.xz \
 "
 SRC_URI[sha256sum] = "a9bdad293d81cd48516abad8d490d8ab4012964ae541ff19e00021e071e47601"
 
-inherit autotools gettext pkgconfig features_check mime-xdg
+inherit autotools features_check gettext pkgconfig features_check mime-xdg
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 ARM_INSTRUCTION_SET = "arm"
 export BUILDCC = "${BUILD_CC}"
-- 
2.26.0

