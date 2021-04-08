Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web08.246.1617899786072069133
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ApONnSm2;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id l12-20020a9d6a8c0000b0290238e0f9f0d8so2876706otq.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3QJeU0r8thy7aVa25HTJKiA8Stox8uIJRR0EjCf58Bg=;
        b=ApONnSm2pDx90Slf7MdLrUHX4S6xA/EMgleVUVBA+fQCS+Nzxz3iXjeXLX9nrx/wvY
         8fsZhLV6Nq2cj9BDE3nt4M0wdWReMWzATDUr9+pXcAupAim3V2c4ZRektJUMN+sw/PCu
         TZC7I81i4cKD64RBR1MWhWdV9rb2sc6QjICZ5SNCWlVh2K2rZXQtQ+57WbGRuP0gUwi3
         iKhgA3uhpMdLDXPOD4TU9xrzGDjgH0ClVR9rLYT3F03fD7Ur7Vwl9mkc+Bo8mPA7/KNf
         RO7hexDLlgTf2S5iLo/Y6kIggOEUwZ1bANcJcHfN9LRlT1YFPlIrPVeT2hbDBY93K7RF
         5zzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3QJeU0r8thy7aVa25HTJKiA8Stox8uIJRR0EjCf58Bg=;
        b=mptAXmwM65Ac7Fjow2rEsc2wfpDD96Utfr9V3CPvzQNv//duNqF6Xg1sqNxMKZPbaq
         y5HDzKpUwPyOmgCLDS5RUMcVB7AMyL/2sYcBJ3ljp2tW4C9oRR8XPSz9/yuzKg/9rb3q
         gsifDWl7Y3pVx9shKlSqDTk8xbBitwAQSDKLPBkoqnLcBGBnn1rx9opzHzLeyKQNznCc
         ot1gW5Xj0G028rBhpFMwyVoe6016aph1rQ5SzV5suiBoQCzFS+mD0NdjQqN3iZ2N/ruK
         JWRxeFzsMn13ZcBSBAdPSXEe1jTQ4FmMEmWruyG3oLCn5VGCwrRfvBEpo9Tn4MyCMGJq
         /19Q==
X-Gm-Message-State: AOAM531aCTDsomdiaUUo1Ixi/qdAD045DEOIRBVPKIAOkxKjSS56eiuX
	9FBQRXn8PdwuABZ97c8gPOnJxavVtDw=
X-Google-Smtp-Source: ABdhPJxyMH/qgFBKOjWfVjDUWGp37eATgL5C30Rdc9cFLE0azihq2AOMuPWB5NjvczXDx1ynmDPf0A==
X-Received: by 2002:a9d:ec4:: with SMTP id 62mr8527608otj.277.1617899785313;
        Thu, 08 Apr 2021 09:36:25 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:25 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 12/64] vlc: Exclude from world if commercial is not in inclusion list
Date: Thu,  8 Apr 2021 09:35:19 -0700
Message-Id: <0bcc3f89f11a6f72a3b32fcb2e68d98291d647c5.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Remove LICENSE_FLAGS setting as its no longer needed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
(cherry picked from commit dbd662de1ca670459ddc88cf68c9a3f888ba71ee)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc_3.0.12.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.12.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.12.bb
index c0074aabb5d..cb796a00fa4 100644
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
2.17.1

