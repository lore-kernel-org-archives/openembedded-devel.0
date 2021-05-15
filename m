Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web09.607.1621121959136498351
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 May 2021 16:39:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b/daNFRu;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id k10so3751331ejj.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 May 2021 16:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PifM+X7DaMWC9RdaBxuNJkVBj8jVN/tEwR+yHYtNadY=;
        b=b/daNFRuewf5Wv9wwitq0qKVmTGtTcE+nnuBumlTQMnbelehBpVUtAdFP5hi6VkTJH
         QL/X+TaLyyVqGds3ROGIsYtnVz5pZJwWUU7DTGPHWCH6MgyFmJOk1qZ5O1xLTDk/0PQ+
         LKETm7mZGhXbiPWZY7llb/VLI+929kz1UynY+P0qy2A6Ox/scSldZ8oF1GZ84mOCTSND
         +G8XzdDBM29kGmDW6nHB3kkOis06I/Zxfk0ZwcDoKuEycZO/IcGJ9fHL00el9An1mdMb
         hfZ3c4m/LKrqA5hUDSjQSJBtwhowHyw6eX7BrnmAlY0U0olhhyZgJFo1mUy6yx95CCTD
         IXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PifM+X7DaMWC9RdaBxuNJkVBj8jVN/tEwR+yHYtNadY=;
        b=AT/VsBAKnFLntlzGoeIutAcfco2nT57XqZT5IOX9Xh4+YM9MEr19SqFl4PkxQ1u3u9
         d6CZBRkHl3sgIegQCbNGcR36s35Mo6cVCxpU9xeeEWI8y2wqDGU6dnDQ5VoD0iDYNeJP
         0YAXBJgay2OGll2timldgQgzvXCBNpMg9lX1hsp53oo8OK7J5dRDKS08OsU4g5nWwq0k
         UwSk3S3uo/+CKk+d4sGWQTxHfBsCpBLVY7j8GnxfZxgoa9YZ7MRsJKYAocU029eHblXp
         38ut4QCgB/mb4an4GYpcHkzkQJZjfTJJrgqc0zjnuDWtHGUTd4YGVLqzBiXwo/DSPDJH
         MfRg==
X-Gm-Message-State: AOAM533V0ZPId/EAE40z9gfY+wzKE6DndxaBETyFN3js1qN4uj0gRMLU
	s77AeujBFVnUSasEykt+brfCRTpDQlc=
X-Google-Smtp-Source: ABdhPJxgfjY/H2n70x1wRSpPSp/I/1oQZ/zzBW4+dG/OmGkp24KpzukbY2Hs3o5zR1zhz1fNuVnIQA==
X-Received: by 2002:a17:907:d13:: with SMTP id gn19mr10357273ejc.134.1621121957785;
        Sat, 15 May 2021 16:39:17 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f174d19e31b0fdffece5e2b.dip0.t-ipconnect.de. [2003:f0:7f17:4d19:e31b:fdf:fece:5e2b])
        by smtp.gmail.com with ESMTPSA id r25sm7668986edv.78.2021.05.15.16.39.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 16:39:17 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 16/20] gegl: add poppler PCAKAGECONFIG and enable it by default
Date: Sun, 16 May 2021 01:38:49 +0200
Message-Id: <20210515233853.583490-16-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515233853.583490-1-schnitzeltony@gmail.com>
References: <20210515233853.583490-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb
index 06abf799e..bb0cd1f8a 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb
@@ -28,7 +28,7 @@ SRC_URI = " \
 "
 SRC_URI[sha256sum] = "c112782cf4096969e23217ccdfabe42284e35d5435ff0c43d40e4c70faeca8dd"
 
-PACKAGECONFIG ??= "gexiv2 jpeg libpng libraw librsvg sdl2"
+PACKAGECONFIG ??= "gexiv2 jpeg libpng libraw librsvg poppler sdl2"
 PACKAGECONFIG_class-native = "libpng librsvg"
 
 PACKAGECONFIG[jasper] = "-Djasper=enabled,-Djasper=disabled,jasper"
@@ -40,6 +40,7 @@ PACKAGECONFIG[libav] = "-Dlibav=enabled,-Dlibav=disabled,libav"
 PACKAGECONFIG[libpng] = "-Dlibpng=enabled,-Dlibpng=disabled,libpng"
 PACKAGECONFIG[libraw] = "-Dlibraw=enabled,-Dlibraw=disabled,libraw"
 PACKAGECONFIG[librsvg] = "-Dlibrsvg=enabled,-Dlibrsvg=disabled,librsvg"
+PACKAGECONFIG[poppler] = "-Dpoppler=enabled,-Dpoppler=disabled,poppler"
 PACKAGECONFIG[sdl] = "-Dsdl1=enabled,-Dsdl1=disabled,virtual/libsdl"
 PACKAGECONFIG[sdl2] = "-Dsdl2=enabled,-Dsdl2=disabled,virtual/libsdl2"
 PACKAGECONFIG[tiff] = "-Dlibtiff=enabled,-Dlibtiff=disabled,tiff"
-- 
2.31.1

