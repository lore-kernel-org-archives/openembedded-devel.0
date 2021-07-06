Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.3754.1625562822262820155
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jul 2021 02:13:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vhvJmpr1;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id gb6so16424230ejc.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jul 2021 02:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/vHW6L43GPGdH9C2jCWx0iExzGo1spYyYyIQkQvAX24=;
        b=vhvJmpr1QmJOoI5Px7DGbpuTBZU8R4ZH3hpqy81WrWxN0yTNjZpXDV0NPiSsciZDCv
         MVfRn+BZ+jR9LyCeRZxYuDsFGHhXbAtTh1A88mST8ISDGpZm0NRjSa+2VTbF6VxhuLyW
         7ZBxzW2TsTNGBnzwb4CMCCW9w8n0ioqs4O839lUJ19yHKEv6bFcgMbdzU3JaFTdOQtoR
         7zURd+AJwswX3YMa4wTb783M7AKfc9QxBxDwtRDYth9vxjTRwwswc+IVSkx4waDggRTu
         cHxJ1Mn7hB8YaY3ICSeLJy64+CFWgYNjPalUwwSSBmG079hBryifnMTT4Kv7QvPAyb6Q
         1teA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/vHW6L43GPGdH9C2jCWx0iExzGo1spYyYyIQkQvAX24=;
        b=Z9Y2L8Z2KaQE3JIlo/r7qLStLT4nPjFWCKME6ZKcW7GarewbnC/qhxP02+0doF7lLq
         MTJYUSPPOIKaoySlBdzAv449oHtuAY9QeR7SAsOWXECp7Xq6dDfI8xgxEDOs4QllJE8f
         xedINv1J1acCOiLxB9t9y96U9MtqA0L+3q4u5ec1Rev+uK8E3wTnYZicYKlpEei6mVyH
         piiNzUy7Kbl8msiWyIBT4C3MA8WhPJZ5yomSkND/VCe6WZDXRgGrdw7wb60+LEfWCmCA
         nRz+qoCydOYNDwX1ygGJCRszpfoaBQExd4GMeUBsVuBpdcB0Vw0IwQVeQ1O38CZXVwor
         fZXQ==
X-Gm-Message-State: AOAM533ntljJSB+KAR48HiOMeSyLeL/7RDCFsTFwqUCToLECfpU6cYNP
	3gEVMxrioG1vBmB4A00iAZ+S+4Il5DQ=
X-Google-Smtp-Source: ABdhPJzxxK0G3ksvMKiWizDdEpeLoEv05Cf36Yt6YRvd5ZPHC+nwTOw1/MQ/HMCAM/RwpeT/SbQdlQ==
X-Received: by 2002:a17:907:3c81:: with SMTP id gl1mr17836284ejc.136.1625562820794;
        Tue, 06 Jul 2021 02:13:40 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f3d4039af027e3874c3f08b.dip0.t-ipconnect.de. [2003:f0:7f3d:4039:af02:7e38:74c3:f08b])
        by smtp.gmail.com with ESMTPSA id p5sm5358273ejm.115.2021.07.06.02.13.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 02:13:40 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 8/9] gegl: Disable pango on native build to fix gimp build segfaults
Date: Tue,  6 Jul 2021 11:13:26 +0200
Message-Id: <20210706091327.1513939-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706091327.1513939-1-schnitzeltony@gmail.com>
References: <20210706091327.1513939-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Achieve by adding a PACKAGECONFIG for pango and keep that out of native.

* pango support is not required for gimp build
* pango support caused random segmentation faults building gimp. To work around
  vector support was disabled for many arches.
  Am not sure but segfaults might be caused by missing font configuration on
  native:
  | Fontconfig error: Cannot load default config file
  Now with upcoming pango 1.48.7 build of gimp build is broken completely: All
  calls of gegl caused segfaults.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb
index bb0cd1f8a..1fc883225 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb
@@ -6,7 +6,6 @@ DEPENDS = " \
     intltool-native \
     babl \
     glib-2.0 \
-    pango \
     cairo \
     expat \
     zlib \
@@ -28,7 +27,7 @@ SRC_URI = " \
 "
 SRC_URI[sha256sum] = "c112782cf4096969e23217ccdfabe42284e35d5435ff0c43d40e4c70faeca8dd"
 
-PACKAGECONFIG ??= "gexiv2 jpeg libpng libraw librsvg poppler sdl2"
+PACKAGECONFIG ??= "gexiv2 jpeg libpng libraw librsvg pango poppler sdl2"
 PACKAGECONFIG_class-native = "libpng librsvg"
 
 PACKAGECONFIG[jasper] = "-Djasper=enabled,-Djasper=disabled,jasper"
@@ -40,6 +39,7 @@ PACKAGECONFIG[libav] = "-Dlibav=enabled,-Dlibav=disabled,libav"
 PACKAGECONFIG[libpng] = "-Dlibpng=enabled,-Dlibpng=disabled,libpng"
 PACKAGECONFIG[libraw] = "-Dlibraw=enabled,-Dlibraw=disabled,libraw"
 PACKAGECONFIG[librsvg] = "-Dlibrsvg=enabled,-Dlibrsvg=disabled,librsvg"
+PACKAGECONFIG[pango] = "-Dpango=enabled -Dpangocairo=enabled,-Dpango=disabled -Dpangocairo=disabled,pango"
 PACKAGECONFIG[poppler] = "-Dpoppler=enabled,-Dpoppler=disabled,poppler"
 PACKAGECONFIG[sdl] = "-Dsdl1=enabled,-Dsdl1=disabled,virtual/libsdl"
 PACKAGECONFIG[sdl2] = "-Dsdl2=enabled,-Dsdl2=disabled,virtual/libsdl2"
-- 
2.31.1

