Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.21308.1610905619325200287
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:46:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TlMig6UC;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id y205so2990251pfc.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=4As/Uqivo8nQ1z2LCyLw1yoTAT10ifZFGrdXeEssygw=;
        b=TlMig6UCroPt5xTA8WrMuUIOEK6REbtdsTi/Q50+XkuuRaabmwxZxp1KytF6tzLzar
         IVVrnFOh1Aptme8d986/O8Nvr66bnwy4zmGzIuLz+HvzjIwvn+EYtWEU3W7661IrrKnD
         59/A6z8q4DkVyK+ySuAzFagDETCoHmLVpPC7QmNUdc76htILbQkhAgjF779Da1J+9dd1
         osWOJ+duxyxMjknWhzoEthHAEA080oohWvt8XEVVxQu2ogYrOjvCjiWBqO2Bkk+fljmz
         daxxrNSMSZNtGNMFJd1+MbFfNVSZxgw9dKxMNnW62Ih5SQRO4tyJbAYhTTeIdi6TWTlk
         wBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=4As/Uqivo8nQ1z2LCyLw1yoTAT10ifZFGrdXeEssygw=;
        b=FQrtcNkFPDhu85y6mjNT7x0eekg3BhKITdnMO4SS9VvXqNmj48BL2iYLdKZRQNz2QN
         BNLA3QpIJoq2/w6xH/xtMoHlFMNTMFwnGZuVQjsGCYcVjKy1KBLHa82jaqTqi6xNZ69m
         zeCMgv3OjHnSHz+DIvU01qaF23ofqd0xv9GrlGVpPdMXt4KURw3gXiF0JUb+k9sL0jn9
         EDkPigeKBh7up/buxkNzBpw+7iP6FGm+VGHvt1ilhl1mqe3BHt5m+v2bHuyDdV4A7MuE
         PA9AUeMolWfmQVSPhk8I6TqSK+SSNL2AjFYRHvROFi2iO+jg10bPCl+iPuSz3lfWoxaZ
         WQng==
X-Gm-Message-State: AOAM530QKKUphesX+cWrOKLHifScM+pqmkc1uaRd3XeLMCkpk841KDNh
	5+1cl9skT3Pb64h6bpgEJqqBMref8cWRKQ==
X-Google-Smtp-Source: ABdhPJx6EbmMwwHx5hzX+/xNpVGKbmK9/yi512ydaVVYWKQTOclkTmyTbvd+999oOEnPsozJMnnCrg==
X-Received: by 2002:a63:597:: with SMTP id 145mr22323167pgf.252.1610905618801;
        Sun, 17 Jan 2021 09:46:58 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id bk18sm10427870pjb.41.2021.01.17.09.46.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:46:58 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 26/28] libsdl2-mixer: Fix ogg/vorbis support in libsdl2-mixer
Date: Sun, 17 Jan 2021 09:46:24 -0800
Message-Id: <6f1f055f62dbc86a34deaed3bc95cc8cb767622c.1610905441.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610905441.git.akuster808@gmail.com>
References: <cover.1610905441.git.akuster808@gmail.com>

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

