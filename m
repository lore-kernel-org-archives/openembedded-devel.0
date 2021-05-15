Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web09.606.1621121958420220914
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 May 2021 16:39:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ny/DSqqg;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id l1so3770884ejb.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 May 2021 16:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Zvr/9/2Yv0XtXoaS9wmLL9SkffVNPqxnGTYjOl6mWxs=;
        b=ny/DSqqgS0E3zCdGi4vQiaBmUX7sjXrvXAkOJ3Zw2kEgxtSJ/6YdwGlzObZ4+H1yWO
         5FS5YwN86/rGfOFZJwzY3yyPfTmYFdJbcgmgLsqmu91euTnB7R5KcrqYeJSzwiTekcCn
         YmkjAtmQ7dzY2U5+usXfDuFcPsZZJNN7Dq0xOv6WXkgvU4ULv0EC2fUYSsJoLSoMnGgk
         qE4v3wmb1kmtLoQ4IDPA0h97L6G+vHZx9InWbjDhorCg4mjCtfFl5BprikVb1I30UlIt
         pQqD8MyzSY7FXk2ugnulYFK2cMi5wNE6GbDncFwaSp0CWxHJC8Z9E6djdpEb56XPzwni
         F4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zvr/9/2Yv0XtXoaS9wmLL9SkffVNPqxnGTYjOl6mWxs=;
        b=eE/JYvDPFE13Ai3gLU2jDPfgKqZmFRA2sH05J5RQOCF6O8EoshYDrSjTIzFS1AwBCf
         edk0XuIiw5vdMC6WPWrnhHBBkRYvtNopIcIDVfVqQAI38eeBILh2VC6jmYIWvv06D7xp
         b5MH9xQW6X3wGTiqbUPb0Q+LGgdMm7NYKTePqb1t+mEt3KnO91GUEvJrX0+9IWkMfV/W
         Gjc7eKR9+OYQJqVlpZ9Gu2SEkKciOm7mAqVVwzrZaZO3f/uFgtTt18mgL1uGhiTdPwRf
         5peSBUwNC1F8SI5R7mclNJAfUvLKdmrGVcct5kFfSTJjW4UIwjobmtOYHu58PBZIAnAV
         eWMw==
X-Gm-Message-State: AOAM533mtO0FfuUl/u+TRK/g2m7SujMBK3kD7CHX0FE61hjxfvcWTIBH
	OKknQXxjGp/HplJ7/8e/FrdPzB+XyyQ=
X-Google-Smtp-Source: ABdhPJyz6KoBFqG4gk0t0u5U8lrt7FGZhQNuPqT+4McDjnVzy9lCOi0bZysaygA+bjwU7tS1DB5Bdg==
X-Received: by 2002:a17:906:3bc6:: with SMTP id v6mr55548574ejf.165.1621121957052;
        Sat, 15 May 2021 16:39:17 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f174d19e31b0fdffece5e2b.dip0.t-ipconnect.de. [2003:f0:7f17:4d19:e31b:fdf:fece:5e2b])
        by smtp.gmail.com with ESMTPSA id r25sm7668986edv.78.2021.05.15.16.39.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 16:39:16 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 15/20] gegl: add PACKAGECONFIG libraw and enable it by default
Date: Sun, 16 May 2021 01:38:48 +0200
Message-Id: <20210515233853.583490-15-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515233853.583490-1-schnitzeltony@gmail.com>
References: <20210515233853.583490-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Without gnome-photos fails to start and complains:
| (org.gnome.Photos:952): gnome-photos-WARNING **: 08:02:54.154: Unable to find GEGL operation gegl:raw-load: Check your GEGL install
| (org.gnome.Photos:952): gnome-photos-CRITICAL **: 08:02:54.154: photos_application_create_window: assertion 'gegl_sanity_checked' failed

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb
index d08a3a3c9..06abf799e 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb
@@ -28,7 +28,7 @@ SRC_URI = " \
 "
 SRC_URI[sha256sum] = "c112782cf4096969e23217ccdfabe42284e35d5435ff0c43d40e4c70faeca8dd"
 
-PACKAGECONFIG ??= "gexiv2 jpeg libpng librsvg sdl2"
+PACKAGECONFIG ??= "gexiv2 jpeg libpng libraw librsvg sdl2"
 PACKAGECONFIG_class-native = "libpng librsvg"
 
 PACKAGECONFIG[jasper] = "-Djasper=enabled,-Djasper=disabled,jasper"
@@ -38,6 +38,7 @@ PACKAGECONFIG[jpeg] = "-Dlibjpeg=enabled,-Dlibjpeg=disabled,jpeg"
 PACKAGECONFIG[lcms] = "-Dlcms=enabled,-Dlcms=disabled,lcms"
 PACKAGECONFIG[libav] = "-Dlibav=enabled,-Dlibav=disabled,libav"
 PACKAGECONFIG[libpng] = "-Dlibpng=enabled,-Dlibpng=disabled,libpng"
+PACKAGECONFIG[libraw] = "-Dlibraw=enabled,-Dlibraw=disabled,libraw"
 PACKAGECONFIG[librsvg] = "-Dlibrsvg=enabled,-Dlibrsvg=disabled,librsvg"
 PACKAGECONFIG[sdl] = "-Dsdl1=enabled,-Dsdl1=disabled,virtual/libsdl"
 PACKAGECONFIG[sdl2] = "-Dsdl2=enabled,-Dsdl2=disabled,virtual/libsdl2"
-- 
2.31.1

