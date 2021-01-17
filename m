Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.21177.1610905030155893656
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:37:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HbDlDyz4;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id e9so3183010plh.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=uhrUXTSRuKEcmuLBdIrx1yExQLTr5vI7FpiZjnnxya4=;
        b=HbDlDyz4+f47vRK0Q+48iP+d4Ql7CVl8bUNgWaSJIgwD5Yub58xvbqqMAaN8p5rHlL
         sjij6zdnrsTcjiaQLdefufBaNN+R+uG1OKD2EQNy6OzUuairhI1H+W1118lraEXjqEK8
         SKm7Wv2hzAL03/YPQW885gt/7UOysvnl5+ShnOTJoeOy6+AhuZxay1qhYVDEvR7awEL+
         d6yCMIm9m16PEzNk7CaZ51fyFhBZW97+6vVpQEMmVlZApS6e7aT7lvWnnqolEOa8n0dh
         F9baXVTBCIrfWFnhPO0lkTs1EIKfRmgy/YrNiQmt3kZUtNg+/0bvCjsXZ1yOW25IXgGS
         qb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=uhrUXTSRuKEcmuLBdIrx1yExQLTr5vI7FpiZjnnxya4=;
        b=pzI9OW1fim1YMEMCZdVzWfJm1ecm2N3opaR/bpIABXnD34xha/dqM1ij3mcJ9TD2nF
         V4xFLxYJJ7FAfw2Yy83ohMsGTJhy40/Y/YtBO4oVAdPrzhNrI83eWi79VEJjj7yloZUJ
         1stGGMah87TYdFp4w3v6vYib6/xSCUajiUCWD8g9eRVmN9er9rEJwewNxZcaUUSZ7565
         uTsJWaEdEuaeGKETBvhgE/z6vu0C1Tt4V+Ujo6w0XuPe3pm2Pe1qh1evsnnTzXE3B9uR
         sSZGPJKvSl9/bHFRxx0D70P1pItlx5gadddAH59z4TIvARjM0PR8iqUeOTpZHmnfoXxv
         8Cbg==
X-Gm-Message-State: AOAM533/NIXiDsQs0HsyewPOtw2YJYk/0LX75OTIUkMlGC3UNuvrezsy
	xgQ5o/xD+2ZCeez+SbfTtBvWc7JZVcraWg==
X-Google-Smtp-Source: ABdhPJy1IUHX7pcZupoEdWMK+A1/mD+YN5G0R3QEdpDHXgQ4gSHaX1sj7mjd1ZgH8+cf+N3wvZOr8A==
X-Received: by 2002:a17:90b:3711:: with SMTP id mg17mr4474496pjb.163.1610905029563;
        Sun, 17 Jan 2021 09:37:09 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id t4sm13661338pfe.212.2021.01.17.09.37.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:37:09 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 28/31] libsdl2-mixer: set --disable-music-ogg-shared to link statically
Date: Sun, 17 Jan 2021 09:36:33 -0800
Message-Id: <27626b4eea4428e60972796ec2d0678670b6f7be.1610904793.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610904792.git.akuster808@gmail.com>
References: <cover.1610904792.git.akuster808@gmail.com>

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

