Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.6207.1591908718394833439
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 13:51:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MTQEY/8Y;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id j10so7595141wrw.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2020 13:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Fw/ll6mGBQ+6fsDrTVnC8M4L48JW2aFfBgRzwKy8Mtg=;
        b=MTQEY/8YTMcxtjiwJQ/CrLYuhkftWFtzsa4OsuT0Ne7GEWYTqwNRTT+xhnPzAsOsAE
         w81sDj0erfqD7CJSKCS2hsHjU550sH7YB3Bn79GLT3MEscbAQv62oyOmyIjzHeO7Mn+X
         RZsbIKShtO+rM6HijCopPevzHNOVNsQe+SJTVFHyebBXKhPU1uFx9CFEZ2J/4XyK/0HC
         MoBYxAfv5F9a0+w8gBWyeM5qCEjR0dYs7BbBxfmEKx95VfRr1NZ8YmL7IlBYEXrtDAwA
         Sx5woQFtI6rgd1KUd8NkAipSVJiaoexpNSgShJu7VdmxEnhWp27bcmJllXiy3WfypXhr
         icSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fw/ll6mGBQ+6fsDrTVnC8M4L48JW2aFfBgRzwKy8Mtg=;
        b=pDEjw2PrMo8O8rAwhwjUCgxHSwS+TR0m4z4Pw6E1Gb8pRbhgR8qcOARBP//eUtKcq6
         5lrpA7gpIdRbmWaTEh+YkvOpOS7mXVeG9Ig97Km7e7Smo7j65rpeqAtRGpKCcw3VQFDy
         MoIH0QJ+yP0o3M5hw+BbJHzbepdSCO00luzCyOrHAnVRDPclbHVVujkvkOWmgqWeJ3MN
         6MoL+e4ku3+6KHSHUS9MCgtqZhYpJPvJrIxqArI0zmRiSQ9kjh1S7LZx++2/uCbRFefO
         3LwiPBt0cFzeJlFj4eD3lTYRJ9OjAmStajolaugaELRNOk559V1p/SrVCTE9io0ZW4gO
         ldlQ==
X-Gm-Message-State: AOAM533Z4YF+EjCqTIZ6Iv0knIYYyP0oR+3IsPpZcHEvqK936ASlxUDB
	7YulJyaZ7tUOAbIxr5tjB5PmlXs1euw=
X-Google-Smtp-Source: ABdhPJx+N4r/TOMGrVJ6cgH8BJIfpLcXWE4IiBphsvDolZdLAei18bltDzqiXYgwmbo96SdTYxCGng==
X-Received: by 2002:a5d:5092:: with SMTP id a18mr11193701wrt.42.1591908716546;
        Thu, 11 Jun 2020 13:51:56 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0ec768c1921725f2fd1a21.dip0.t-ipconnect.de. [2003:f0:7f0e:c768:c192:1725:f2fd:1a21])
        by smtp.gmail.com with ESMTPSA id n7sm6827825wrx.82.2020.06.11.13.51.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 13:51:56 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/5] gegl: upgrade 0.4.22 -> 0.4.24
Date: Thu, 11 Jun 2020 22:51:42 +0200
Message-Id: <20200611205145.793353-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200611205145.793353-1-schnitzeltony@gmail.com>
References: <20200611205145.793353-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gimp/gegl/{gegl_0.4.22.bb => gegl_0.4.24.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gimp/gegl/{gegl_0.4.22.bb => gegl_0.4.24.bb} (93%)

diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.22.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.24.bb
similarity index 93%
rename from meta-gnome/recipes-gimp/gegl/gegl_0.4.22.bb
rename to meta-gnome/recipes-gimp/gegl/gegl_0.4.24.bb
index ca73e66f3..77c30f7de 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.22.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.24.bb
@@ -26,8 +26,8 @@ SRC_URI = " \
     https://download.gimp.org/pub/${BPN}/${SHPV}/${BP}.tar.xz \
     file://0001-meson.build-Give-note-if-sdl2-was-found.patch \
 "
-SRC_URI[md5sum] = "1776ac26792de0de3c3d680872e94b72"
-SRC_URI[sha256sum] = "1888ec41dfd19fe28273795c2209efc1a542be742691561816683990dc642c61"
+SRC_URI[md5sum] = "3a8062add20effb6f92b4b614facbbd5"
+SRC_URI[sha256sum] = "7765499f27341b0d16032e665319cbc12876483ff6a944fcdf24a9c58e3e254a"
 
 PACKAGECONFIG ??= "gexiv2 jpeg libpng librsvg sdl2"
 PACKAGECONFIG_class-native = "libpng librsvg"
-- 
2.26.2

