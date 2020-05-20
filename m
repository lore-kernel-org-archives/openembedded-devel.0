Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.847.1590010451591029905
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2020 14:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pHuUz+ck;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id c75so2066699pga.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2020 14:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=laBAahZER+HiPLrNyukOtr17tDgRBwp8OyYPIoAswzw=;
        b=pHuUz+ckJ0//VD8g4ll58j3S5+1sU6EpFbzJvNR+hJ84e0VprumsgitnmdKutyPOZW
         Kr4PgG8RPSGL8ZrR7LUzfzWC+J2Ntx5UP/hwCTt3lO+NpomBOyt/z4jWeY2YU4h5Hy5r
         PN9ZsUVx9C1tf8B6KLkux3k2o0DiSlUsYFRXQOcCKOTGLSJp9c+a7xvg3mTJfut1Gm6i
         GQb1kyQSoRoJd5ynKgfFBO9Yx2JGYXyjX8mC7mVCzVnSpXDs0B7XSbWYM36zaa5VEtbh
         9vShegRGDuugLoPGDwsczk2uObsBKeLhqUki28klXVs1HjbFgELWMzbfGQFJm/1/XNXb
         pl8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=laBAahZER+HiPLrNyukOtr17tDgRBwp8OyYPIoAswzw=;
        b=aOmWF8LOpFV2b+jpu6lINdrPVrPQDoITLytXPa1LgNIHeNQTRsyy1bjUbevvMv4pYR
         P/Mo5qzx0bfBn0U+7rFL0UjBZg/bUHF9igy2HLOJod7UL073DWdET7yE/bfOaRruTaGk
         PIG3FqdJyqFJ8jPaaA1TpbQyfRRX5hgsqOoA+LufjUO+rAmrAzrbCAG56k5m1oG+WvXX
         Nf1e0X5IdjgXYDc1eZJ5UZq5fs6ZGvf/1xhszm/x3DTFkCcYJ7c1ufsPXpa+pFkD97ZX
         hxl6ZWVKNZQAl24P/gdLL2fD/uHcUIA0RGB7YTuZ7l+OtLWaMzUpcHpjWj3QTg83Excv
         LZZw==
X-Gm-Message-State: AOAM530FxDbALCr08TI2uXHLLdGQquSBNC29fV1u3NZ8UgaynnUh2A5b
	RvS4UmEdAZLJlGEVeJ/6iigoFB4qgWI=
X-Google-Smtp-Source: ABdhPJzAVDAPeOfn0qrRCyXr5qssiAhzXMBLhHCHWqRM9YzKDnyNS4yDANFw+FWhupGrRTaDkZP/jw==
X-Received: by 2002:a63:3c0a:: with SMTP id j10mr6035282pga.35.1590010450778;
        Wed, 20 May 2020 14:34:10 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e62a])
        by smtp.gmail.com with ESMTPSA id t188sm2608786pgc.3.2020.05.20.14.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 14:34:10 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Miartus <adam.miartus@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] toybox: rename to prepare version bump
Date: Wed, 20 May 2020 14:34:07 -0700
Message-Id: <20200520213408.140096-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Adam Miartus <adam.miartus@gmail.com>

Signed-off-by: Adam Miartus <adam.miartus@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/toybox/{toybox_0.7.5.bb => toybox_0.8.2.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-core/toybox/{toybox_0.7.5.bb => toybox_0.8.2.bb} (100%)

diff --git a/meta-oe/recipes-core/toybox/toybox_0.7.5.bb b/meta-oe/recipes-core/toybox/toybox_0.8.2.bb
similarity index 100%
rename from meta-oe/recipes-core/toybox/toybox_0.7.5.bb
rename to meta-oe/recipes-core/toybox/toybox_0.8.2.bb
-- 
2.26.2

