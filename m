Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web09.21199.1610905620087008762
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:47:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KpukLyQH;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id v19so9459317pgj.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=uhrUXTSRuKEcmuLBdIrx1yExQLTr5vI7FpiZjnnxya4=;
        b=KpukLyQHW5AkScU5T6arBcSvqwXScECb5DLGEKzPNTroIzeNg3rny/vl9cmxTQWYlM
         ZdpeLfNHLTS5X8kr+64cXCmbzTZAhr/lYQzuTXi4YRuwdFzJSFF9dSPQPj5Hz4tD7rUr
         eaFSULF/3oWGxAYBZJEfpEOv6vIO6F0edWOtNJmIVRmeDBzbA48I2IaNtaHn1bNaH5jo
         FVpwFWAEGUiXVwd9zC/WwuD7kcatIsqMsrKuY2FshgfGyjanLuv2YqhIbwWkT8A3YZfD
         GWK/Scbd3l0LBb9S+a3hQnbD0KubBZ/jce+LZx1XkSuUk+1ddMQGkTlkKrI1+8D0hAxg
         hYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=uhrUXTSRuKEcmuLBdIrx1yExQLTr5vI7FpiZjnnxya4=;
        b=By46gMWbvwgOW2j9I/RU+QBiQJsvwNwAPF4zxOiW6ZLSnU9Fdu8rp9wpS6pAV8GhCB
         CFz4tteDWDT+69Du1UvnaZakr4z0JJoii2CjgATQtQP9kPm21IO/FlFIP18DxPx4obWP
         mi5zu6PEu/kvN6cNoiEhi57oBKmyqR6Kxn69rSjhrCGozEk6m8f4K279oS7/3S2nLIX+
         9x5+X/PMgoiT+TKLZefJgBOqDAbon+gXpNnD6EkFymh7HTn0fxnkdHd5/5SDYu54lK8t
         VSLN1CQyKpcukMD9NMsRbE33PKZuQ3GrRxYTRF0UqHCeIEy9qiEujni+rZSb/xt7Zc2w
         Qsyw==
X-Gm-Message-State: AOAM531eDdt9FK/OV/0jSglDps+CDQG22lJoLEqUC8Aa7IsIrR9bxZRl
	yxFLbFwJ0aUz8hOS1kd9m0erin/FKfTF4Q==
X-Google-Smtp-Source: ABdhPJzDH6M4me+fgPBtAkbyrnxA93GJm+/Ch6jb+3DaxeeFKAdY4ZZ0wYYvjt1hvcQFiT7JZCQ27w==
X-Received: by 2002:aa7:8eda:0:b029:19e:c8c3:ed74 with SMTP id b26-20020aa78eda0000b029019ec8c3ed74mr22354981pfr.66.1610905619556;
        Sun, 17 Jan 2021 09:46:59 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id bk18sm10427870pjb.41.2021.01.17.09.46.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:46:59 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 27/28] libsdl2-mixer: set --disable-music-ogg-shared to link statically
Date: Sun, 17 Jan 2021 09:46:25 -0800
Message-Id: <d3cb0e1645e7894a2cfeadd53892690d90b726ca.1610905441.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610905441.git.akuster808@gmail.com>
References: <cover.1610905441.git.akuster808@gmail.com>

From: jabdoa2 <jabdoa2@users.noreply.github.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 69bae2a2360643805de2ae1cd9ebc4202cd5a2fb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb
index 77e50d3841..8f1960d8ad 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb
@@ -14,7 +14,7 @@ S = "${WORKDIR}/SDL2_mixer-${PV}"
 inherit autotools-brokensep pkgconfig
 
 EXTRA_AUTORECONF += "--include=acinclude"
-EXTRA_OECONF = "--disable-music-mp3 --enable-music-ogg LIBS=-L${STAGING_LIBDIR}"
+EXTRA_OECONF = "--disable-music-mp3 --enable-music-ogg --disable-music-ogg-shared LIBS=-L${STAGING_LIBDIR}"
 
 PACKAGECONFIG[mad] = "--enable-music-mp3-mad-gpl,--disable-music-mp3-mad-gpl,libmad"
 
-- 
2.17.1

