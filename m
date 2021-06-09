Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.4426.1623220724731101162
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 23:38:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TfS4Qd9E;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id c10so36635369eja.11
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 23:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K5d3YQDTVREOq/l8CRZZPcwN1/6saM0j46BamPeD61Q=;
        b=TfS4Qd9EyMVxYa+yI4cOuJDgpEWELGX/ypqM9kAgeNS7xj/z9ymvGTzwes4INseT/l
         stK3kcFP7ISvhzp2uZps6f/IDtRGDEi+2x2z5aFl3QJU+kXmcCm/iMhs9NUQGuJ9u4nq
         Z0g3qCkkKS3rvIWhXHiecYhIyuP6mg3U09rWjM8U0yZUjsVqyWt8A/97Ru2bl9VFdtfd
         lmcTx6FsaDfJ16wi821id4BbUm3zeNXJYeEb5SBZjShwyIvye2oPfqLiV/1x17RgN9bU
         fIG+FGyk/IQsmYCNTAAiil9UoB6sFg84kNmZO2DX/hz7Gvf7mfpcZLrNhRU+LcWELpxM
         od7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K5d3YQDTVREOq/l8CRZZPcwN1/6saM0j46BamPeD61Q=;
        b=aqxrMk1EVfBjc0ugUJlVuGVB+yIL7bs/jULYorXYWjSqhlYWBLFEUfSaKmGJAoDvWX
         tc/7Y2WZF4P0l8SmzxeliPjKxjU1R+joIjHWcw3GmtzD8uNy6WhEOKnRj4f44LS5HG/h
         kHjXXsEsYVrPdCnCPGIyTD0sWdy2BoLX9GXtC57/TZASmmceYSpWgrpOAzH1LF/dCe5R
         XdZ3vIYiMrB1lRJgkqzZZRxG0x8yWCjyq2j44gZ25xrg4f4U5GDTS7wHnEqLc6O7R3FU
         PRjSwzTvNUd//Ljkn7y1X3dVt+aMUmphql+LYmArmZHibLlLiQ0H4vesxU5TBQ3N9YRa
         wb8w==
X-Gm-Message-State: AOAM531G59iGKHWTgiou9XNUP+UcVD/GJT1u5zSKqO5fUL8GNJFg/5Bv
	kbB4zWqbyknVf//I+So9V1oigckNH513HQ==
X-Google-Smtp-Source: ABdhPJyqCtUZhi6YAk0U2u4AJ7UcYpJE7mQFBszmhU0Y2A/GqZJRAjfUKoneABYEdv651PyKRk0D9A==
X-Received: by 2002:a17:906:bc2:: with SMTP id y2mr25055881ejg.489.1623220723184;
        Tue, 08 Jun 2021 23:38:43 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e89b85a8a6897bdbe62.dip0.t-ipconnect.de. [2003:f0:7f29:7e89:b85a:8a68:97bd:be62])
        by smtp.gmail.com with ESMTPSA id o4sm690810edc.94.2021.06.08.23.38.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 23:38:42 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 01/28] atkmm: upgrade 2.28.0 -> 2.28.2
Date: Wed,  9 Jun 2021 08:38:04 +0200
Message-Id: <20210609063831.3400611-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

atkmm 2.28.2 (stable):

Build:
* Meson build: Use relative paths to untracked/
  (Kjell Ahlstedt) Merge request gtkmm!61 (Mingli Yu)
* atkmmconfig.h.*: Don't dllimport on MinGW
  (Chun-wei Fan) Issue gtkmm#90 (Lukas K.)
* Meson build: Make it possible to use atkmm as a subproject
  (Kjell Ahlstedt)
* Meson build: No implicit_include_directories
  (Kjell Ahlstedt)

atkmm 2.28.1 (stable):

The tarball for 2.28.1 has been created with 'meson dist'.
If you build with Autotools from the tarball, please read the relevant
part of the README file.

Build:
* Improve NMake support
  (Chun-wei Fan)
* Use __declspec(dllexport) when building with Visual Studio
  (Chun-wei Fan) Merge request !3
* Add Meson support
  (Chun-wei Fan, Kjell Ahlstedt) Merge request !8
* doc/reference/: Update for Doxygen >= 1.8.16
  (Kjell Ahlstedt)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-gnome/atk/{atkmm_2.28.0.bb => atkmm_2.28.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-gnome/atk/{atkmm_2.28.0.bb => atkmm_2.28.2.bb} (74%)

diff --git a/meta-oe/recipes-gnome/atk/atkmm_2.28.0.bb b/meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb
similarity index 74%
rename from meta-oe/recipes-gnome/atk/atkmm_2.28.0.bb
rename to meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb
index 0e09c3a64..edcc4769a 100644
--- a/meta-oe/recipes-gnome/atk/atkmm_2.28.0.bb
+++ b/meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb
@@ -11,8 +11,7 @@ inherit features_check gnomebase autotools pkgconfig
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "6194ac577f15567adfa3c923944c6651"
-SRC_URI[archive.sha256sum] = "4c4cfc917fd42d3879ce997b463428d6982affa0fb660cafcc0bc2d9afcedd3a"
+SRC_URI[archive.sha256sum] = "a0bb49765ceccc293ab2c6735ba100431807d384ffa14c2ebd30e07993fd2fa4"
 
 EXTRA_OECONF = " --disable-documentation "
 
-- 
2.31.1

