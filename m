Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.8759.1612035468039773250
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Jan 2021 11:37:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qy1uwQja;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id e9so8597901pjj.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Jan 2021 11:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=naivObMqS9OgQa08f52QYqv7ZI3gj2QdjFuN4Tl5Z3I=;
        b=qy1uwQjaC4jSiCkfeltH719kbsZ1ubFXbPFBpfu7AHGsdl4nX+hf+OYWAQ8/1RnjZV
         dDN8d5tMMl9Bh8UYbwtlihbG5/I9+3VdjeFeIU8eWB6mtRHLPaEkJTuVvAgD5TmASN4O
         4sA6G5G2NUcqHB2ea2jhUgZZ4mtbcBwQW0n/82Yalyzj9AM09qVeuZ6HPVnZ4RKHNneo
         1qf8iCyHHOTHt16FCP/o8IU12RKegOKlsk7I2IGwW772ivdV72bPHiaEtIb8CsV+8Dm5
         x3xyAXMau/dStY16fx6vCsDNR8cCi113TrbL/HojwjtNaUPkBYDbrhrFtN/zqprP98/a
         mp5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=naivObMqS9OgQa08f52QYqv7ZI3gj2QdjFuN4Tl5Z3I=;
        b=CIDkQdwfMYYluCLT6CAbjPx6jDootxMnNaRnY/FdLmahnIwS4bdat/UURLCuYqPq8h
         IAL2uJgxvxryhYM1FrMl+Gmq2ByBldUAInygAsoaIouLPt38Ev0yTDQonpisvJZY+n/s
         MiqGtEyK97545OQq9taOuEA06OThqku+Ly96un5UzDzFL+XFbJaLzltMiE+9CA/fQ1lf
         u4DwbFRxaiwm8h8iNVGdbiuBDu4rhIMI9hZS7aM8dsFAI0BkXbtz8s0UCVnT6cKG/QCr
         C8X9NKwwq8OnQixSOTyk/KQalmM9PsctS+woMBLn3AdpNc+oR6tqZcYda2rVO86VDvwy
         ECZQ==
X-Gm-Message-State: AOAM531e1OVDH1X+wGrn3h1tDAvxQ3qt7jFjUIJHDmXiakpm7mfKksOD
	/dhgi8S+h+3SosqSvPivqbe0yRihfBuXgg==
X-Google-Smtp-Source: ABdhPJwPMll8jS5ejXymP2Mv6OjJvbAEyeiFAOtbYrfIrrU6axl+AOArnRC54xvQ51XicvzjZhD1xQ==
X-Received: by 2002:a17:902:778e:b029:de:b475:c430 with SMTP id o14-20020a170902778eb02900deb475c430mr11012442pll.53.1612035467338;
        Sat, 30 Jan 2021 11:37:47 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:315d:c5e7:1295:54a9])
        by smtp.gmail.com with ESMTPSA id q197sm12518096pfc.155.2021.01.30.11.37.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jan 2021 11:37:46 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 01/13] xterm: install xterm and uxterm desktop files
Date: Sat, 30 Jan 2021 11:37:26 -0800
Message-Id: <8a87397cd740b0075047d0b03e751c076a1e05bf.1612035229.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612035229.git.akuster808@gmail.com>
References: <cover.1612035229.git.akuster808@gmail.com>

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Modify recipe to install application desktop files for xterm.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 593f21eda5b119f6408975c6b15e94fb168cc9dc)
(cherry picked from commit a653238398d483c805c3d026d890162f131ecc01)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/xorg-app/xterm_353.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_353.bb b/meta-oe/recipes-graphics/xorg-app/xterm_353.bb
index 6de704d0b7..6376388c27 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_353.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_353.bb
@@ -1,6 +1,6 @@
 require recipes-graphics/xorg-app/xorg-app-common.inc
 SUMMARY = "xterm is the standard terminal emulator for the X Window System"
-DEPENDS = "libxaw xorgproto libxext libxau libxinerama libxpm ncurses"
+DEPENDS = "libxaw xorgproto libxext libxau libxinerama libxpm ncurses desktop-file-utils-native"
 
 LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=996b1ce0584c0747b17b57654cc81e8e"
 
@@ -13,6 +13,9 @@ SRC_URI[sha256sum] = "e521d3ee9def61f5d5c911afc74dd5c3a56ce147c7071c74023ea24cac
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
 
+# Let xterm install .desktop files
+inherit mime-xdg
+
 EXTRA_OECONF = " --x-includes=${STAGING_INCDIR} \
                  --x-libraries=${STAGING_LIBDIR} \
                  FREETYPE_CONFIG=${STAGING_BINDIR_CROSS}/freetype-config \
@@ -30,6 +33,10 @@ do_configure() {
     oe_runconf
 }
 
+do_install_append() {
+    oe_runmake install-desktop DESTDIR="${D}" DESKTOP_FLAGS="--dir=${D}${DESKTOPDIR}"
+}
+
 # busybox can supply resize too
 inherit update-alternatives
 
-- 
2.17.1

