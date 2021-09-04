Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.1034.1630777510410937934
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Sep 2021 10:45:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gSqGkGcG;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id fz10so1706951pjb.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Sep 2021 10:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z5zeLItKFgcQA4QodxKblRWxF9TUIe8nifDVQn5yJEM=;
        b=gSqGkGcGq4NXkOQpxlFmd+ADM3LksDbBarH8dFZZZHuZh0lDbDCKwyp7m8MpJWxaJO
         1WHraU1CZ4seUXTOqBbDkGMp+IxL9hBe65gk0wBUnTJlILuys54TzOTad1U/FRj6yCSA
         dVRK77H3uUkXEshiS0/tNMJVPRbts9nEQqBXaY4hXbYmY53D1lccfAcbm4rllJT4Argk
         /vN/wVnZH0WJF8Op6D2Lg07+JwX06MPA29vJ044cb+TIOsU9DOW2O9OfAsTcn9bGMtYk
         hMlvt60x2ol7/58vsVtgeTBqUEpVNEAD6SL5z+myCbBbGmfQ1Yb4LVv4NyqPy8YK9tCK
         /TUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z5zeLItKFgcQA4QodxKblRWxF9TUIe8nifDVQn5yJEM=;
        b=Jv/ay6R/e3t/xx9w0mcPZ4KMP34sAI/JT3ClgbJsPAu8RzDjO1Re4qxDb1unTGWO+q
         Vc/f+IbD9PefcIUEa3IZS3MgmUJyN1yDypAXES5I+kmDDME1YLa9GFeHefQI/WiArUqj
         UcgB7N0LLIncm/JRpoFku7/uYaxwvq82UvpJVvpLeV/qkuNj1MOb0iLx0P3OO+Gsdgoq
         wH/uXCo1aqiNH8QjEGSEgea1qIr0JPtT43AhsR/oluosRWVkrxDTYqMlx2vqdAlYMqlZ
         U318x0gnkUWs3hPWp9PLXVjsw3yNWqcNMODPtq3zh1dffFislwQONSnCrnjztzW0FX+B
         WOJQ==
X-Gm-Message-State: AOAM531aaN58bDuzu12iTaqWkNshkbtXv5OeHkp59LHadvr2BSoEo9Xe
	lkTzZxpaEMVqAlQGXnb2PuBBXIv3euXgng==
X-Google-Smtp-Source: ABdhPJzJVz3/VuM4ryZEpaCXDLNZgdciWLqcCCwf4zmOVlFoAbxLxzpLyWqBK0nD/Ux/+FbjqBi++w==
X-Received: by 2002:a17:90a:12ca:: with SMTP id b10mr5239791pjg.180.1630777509512;
        Sat, 04 Sep 2021 10:45:09 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1d09])
        by smtp.gmail.com with ESMTPSA id w4sm3052250pjj.15.2021.09.04.10.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 10:45:09 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	William Huang <whuang8933@gmail.com>
Subject: [meta-python][PATCH 1/3] python3-kivy: Remove hardcoded include paths
Date: Sat,  4 Sep 2021 10:45:04 -0700
Message-Id: <20210904174506.2263139-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use RECIPE_SYSROOT instead of synthesizing the sysroot

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: William Huang <whuang8933@gmail.com>
---
 .../0001-add-support-for-glesv2.patch         | 20 ++++++++++++++++---
 .../python/python3-kivy_2.0.0.bb              |  2 +-
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for-glesv2.patch b/meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for-glesv2.patch
index e50c7e7e24..bb236b4195 100644
--- a/meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for-glesv2.patch
+++ b/meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for-glesv2.patch
@@ -1,8 +1,6 @@
-diff --git a/setup.py b/setup.py
-index 9a507c6c4..3f5b70866 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -680,7 +680,18 @@ def determine_gl_flags():
+@@ -695,7 +695,18 @@ def determine_gl_flags():
          c_options['use_x11'] = True
          c_options['use_egl'] = True
      else:
@@ -22,3 +20,19 @@ index 9a507c6c4..3f5b70866 100644
      return flags, base_flags


+@@ -723,14 +734,13 @@ def determine_sdl2():
+             sdl_inc = join(include, 'SDL2')
+             if isdir(sdl_inc):
+                 sdl2_paths.append(sdl_inc)
+-        sdl2_paths.extend(['/usr/local/include/SDL2', '/usr/include/SDL2'])
+
+     flags['include_dirs'] = sdl2_paths
+     flags['extra_link_args'] = []
+     flags['extra_compile_args'] = []
+     flags['library_dirs'] = (
+         sdl2_paths if sdl2_paths else
+-        ['/usr/local/lib/'])
++        [''])
+
+     if sdl2_flags:
+         flags = merge(flags, sdl2_flags)
diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb b/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
index 3f6bafda81..63c2ae7334 100644
--- a/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
@@ -39,7 +39,7 @@ export USE_X11
 KIVY_GRAPHICS = "gles"
 export KIVY_GRAPHICS

-KIVY_CROSS_SYSROOT="${WORKDIR}/recipe-sysroot"
+KIVY_CROSS_SYSROOT="${RECIPE_SYSROOT}"
 export KIVY_CROSS_SYSROOT

 DEPENDS += " \
--
2.33.0
