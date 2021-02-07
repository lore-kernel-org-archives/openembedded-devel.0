Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.24604.1612725013717477860
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 11:10:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ObGYjtV2;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id gx20so7543931pjb.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Feb 2021 11:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=GkNA4hMGuV53132xVumyra8A3rwJjXHn8Enm3WrM7+A=;
        b=ObGYjtV2J7i1z+ncDypEcNMz/sTc+pwLhRUeC63qSnNTOpiQGdfmOzOtmo6f38xrjd
         Rd4rDuGV5mxFzHdvUE8IbaGMXz5K4MtsgX/gUb3ChbHd1tXpX1hhjZXEd+gPwLA5Mkcx
         jz+JbJxju3HUeI8tP2eiX8VAkpl1+tcJ6L6tE8/YJyI7rcECx2vcQi4ZZx2ECRHVotLW
         h9ATKznshOIOPbhbPgeoqK/CFj10ccNVJVH36LSJCQX7vL8eFw3+CzVGn6uQULyOW8Bw
         d1iHv7Uy7LbY4fn3c0vZmTid1eCHRFRghzP5NJtYbUVeIHZpSlZ/AQU/sCPqslELAIYc
         9DRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=GkNA4hMGuV53132xVumyra8A3rwJjXHn8Enm3WrM7+A=;
        b=Rea9jxuQImXR//FyHIpazeLT+Sp6t/Q419yE3t+z/Y+oEMvRiVDqXzoZOvWNr28rCr
         PorjKhd8gUpi8GU2I2hE13bzl6tnLPqD8vfb09TnSQKta/aYRTnhvyBxDpfBQevRTnAs
         WLY+auU6NWxQaLIyd24wclhw5os9b3FR9UItwRvF+ddmwHzfTcePGt6h5Wm94ZBwZUxF
         rT0Zw4tSgToyPAa3FP9Rz6GJLxr9dNGs2LiIDaww0CnWZf4sy9MUY5QQkoL4lXpojNkm
         mdtbhB37K/SlgH51xsYN+yfE6StnYNdq+QwvlfN6bHUXWFguPU8ZKgjO2JMJ+oAUmbbn
         Za/w==
X-Gm-Message-State: AOAM533gaeOkgShjzYbdqfTgVWPZE21kHRjTKXHivjF15HhCDlQ33tK6
	U/nOIDRyZ6qiMAIoiUzdgU/ytsmrkmEPbA==
X-Google-Smtp-Source: ABdhPJyprMFExWHDsaozm7wTk7EMO5+0xqr6cKJmgfT7E1jKmK9x69OmjxBTBcKUOcXh0uEuxthe3w==
X-Received: by 2002:a17:902:724c:b029:e2:d560:30b6 with SMTP id c12-20020a170902724cb02900e2d56030b6mr2344766pll.60.1612725012789;
        Sun, 07 Feb 2021 11:10:12 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:1d07:684d:b210:7d14])
        by smtp.gmail.com with ESMTPSA id 123sm16371911pfd.91.2021.02.07.11.10.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 11:10:12 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 01/10] xterm: install xterm and uxterm desktop files
Date: Sun,  7 Feb 2021 11:09:59 -0800
Message-Id: <a653238398d483c805c3d026d890162f131ecc01.1612724878.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612724878.git.akuster808@gmail.com>
References: <cover.1612724878.git.akuster808@gmail.com>

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Modify recipe to install application desktop files for xterm.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 593f21eda5b119f6408975c6b15e94fb168cc9dc)
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

