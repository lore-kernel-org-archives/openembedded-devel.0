Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web09.21064.1610905029254621282
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:37:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YyLoDb3I;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id c12so8801162pfo.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=4As/Uqivo8nQ1z2LCyLw1yoTAT10ifZFGrdXeEssygw=;
        b=YyLoDb3IvOSi3fWrNUV4m3fjxgBVqhXsqTZ8vJS+pkp8iZNJ72JLIGMH8Epe2XnLZG
         Cg8/O7S8K39L7WUSO7HMYpE3WhYSUi+bec3tYgT/ZLKeiJG5gUfKxrKQMUI/NMaZTFHp
         N1LYZqAg447XNMpJy4EQ+6JZwLOUodSXG8s8M2UUioL+QyPTgAeR0teS1XBhm2M8ZpVQ
         oFTcSLjzoKuGFAShDkIOj29MT/Dc7CgNpA0ZfYKKfO6uGIxsGb2LjB8O/EnFE/3GQ7TR
         gT+9yR2h14ex2i4yaWk0jJcGPffLyuOhQZPPJDa6D3j/+wsh/3Z5mKiJcFXyDfRrKf2T
         7lnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=4As/Uqivo8nQ1z2LCyLw1yoTAT10ifZFGrdXeEssygw=;
        b=X1FERQcc2MLS2BxlIXcNPZYEytIhXp19jRJRBc6upxDec70aCVsdtLnN1K7o3KYx5e
         TpLA1hc72bRZ8jtDC4+cIIsButBDdW1SV3on91tCrcXXr2+1HQx/Sw4LblTaccYK1PmD
         V6dG2AK3kb2r9EArmrYq3oJi325guoo1RK3tJ+skEV2qjVhGtesuTygYYEy9OuddtUeJ
         sZQvay5yj4f0sZQ/6870SAX47kbvhCfkcq1899lHz/4hY26XZWdCVjN7j5/K5L0nw4yY
         bWLG8Bt7QcdTAW5gu4ryAc7WK/eapLlYSqILfLFLhxz+hxRKlOxb4PocRNphGukveJvg
         rxYQ==
X-Gm-Message-State: AOAM531CjJPm72Hi04QNaX+EDyeaxSQRuEPzKdCBAR0+oOFGjjAe4HG5
	tvKtHqW0LJ9+2E1qy/3/oagjhpSP3eFZ3Q==
X-Google-Smtp-Source: ABdhPJzlFpsJ+C7Mtj41poz95d12i1rQA7/HzOuarpx+tdGpft/9Nz5iLWJhy45yw961F1WgjSqi5A==
X-Received: by 2002:a63:66c3:: with SMTP id a186mr22480737pgc.198.1610905028678;
        Sun, 17 Jan 2021 09:37:08 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id t4sm13661338pfe.212.2021.01.17.09.37.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:37:08 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 27/31] libsdl2-mixer: Fix ogg/vorbis support in libsdl2-mixer
Date: Sun, 17 Jan 2021 09:36:32 -0800
Message-Id: <af0c3a62d6faba0f0a9d8cc09e8b72845575346b.1610904793.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610904792.git.akuster808@gmail.com>
References: <cover.1610904792.git.akuster808@gmail.com>

From: jabdoa2 <jabdoa2@users.noreply.github.com>

Remove --enable-music-ogg-tremor  as it broke vorbis support:

checking tremor/ivorbisfile.h usability... no
checking tremor/ivorbisfile.h presence... no
checking for tremor/ivorbisfile.h... no
checking for ov_open_callbacks in -lvorbisidec... no
configure: WARNING: *** Unable to find Ogg Vorbis Tremor library (http://www.xiph.org/)
configure: WARNING: Ogg Vorbis support disabled

With this change:

checking vorbis/vorbisfile.h usability... yes
checking vorbis/vorbisfile.h presence... yes
checking for vorbis/vorbisfile.h... yes
checking for ov_open_callbacks in -lvorbisfile... yes
-- dynamic libvorbisfile -> libvorbisfile.so.3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 074c7d9a1ebb86674f02d8a5545e1ed54f6d87fe)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb
index aa246f9995..77e50d3841 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb
@@ -14,7 +14,7 @@ S = "${WORKDIR}/SDL2_mixer-${PV}"
 inherit autotools-brokensep pkgconfig
 
 EXTRA_AUTORECONF += "--include=acinclude"
-EXTRA_OECONF = "--disable-music-mp3 --enable-music-ogg --enable-music-ogg-tremor LIBS=-L${STAGING_LIBDIR}"
+EXTRA_OECONF = "--disable-music-mp3 --enable-music-ogg LIBS=-L${STAGING_LIBDIR}"
 
 PACKAGECONFIG[mad] = "--enable-music-mp3-mad-gpl,--disable-music-mp3-mad-gpl,libmad"
 
-- 
2.17.1

