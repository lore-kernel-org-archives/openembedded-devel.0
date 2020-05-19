Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web11.12943.1589899428109671265
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2020 07:43:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NugXllZf;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id 23so6637485pfy.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2020 07:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JMvo0y2u9sFM7+mMZXT0a/z4AjBZyuDGjStzN17S+QE=;
        b=NugXllZfRcnWKbS3XihA18+Cmh0St5MRaou7Fbsf4rycutjxz+n3pYqwOtw9rXDxKG
         UmFSPTjIHfxPIlCCi9UFHS+GTEYp4WBGQJI4puxJgWgV22vQWnuaHvBPM+kDdwoTe0Va
         NO2LBY4zaJVvFnOaBpc2t2rSwb93ysbl/HTRjv/4eJjAvN3yCBkFsfEeI46ydFK26qKd
         ZeM0aS6h9wFHAaqJQV2g9Lxajvouiptgq4sjaayv7V5NfiNs/ki2o2tZGiMphNKm10B+
         lV7Tl4jG2wPhCBBecG9lfEVROVpgn1xyXhoJqZOQycEny74q+WgbO2VO3e01AdnNHAX3
         LRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JMvo0y2u9sFM7+mMZXT0a/z4AjBZyuDGjStzN17S+QE=;
        b=c7ejq84Bcx59p58DFlTMpwCwxQTWu8VbufG8V71qgDiI+pa5jNNkbuWectdTOSyfsH
         GVJRBWLvcNQQAzQYtiNX7WjDWiVb8JjXXN/Eo4MS9PxLmRW/UwtwyyDqnNwoFP0pNiiZ
         501F1dmwmmeFq6ioxwNumw1HLgaWs+vdDgsQdSaBlRrxDzjWH5CjIj8KCC+LkbXtdIum
         hO8ivx91OVZnLOMGrEExftw5qmopKpbIM949NTM3nu5jCr50t0903rUPAdNlqzXoID6f
         1wqQZwsMIznrxmvqgffWvMMXfhast40YGHuhhWW1YdvcfxS9LMM84TejA7xsqTW6p4uX
         gitQ==
X-Gm-Message-State: AOAM531C4cUp6jcYuGMpvh0XbMlZFmgGzzgy8uKRxd7KAaeOyw8ROddy
	AtfCBiYIHIUf+JMreX3b+u36OMWs
X-Google-Smtp-Source: ABdhPJz2hjWmD2G3S4VuI47uqTp+tAsKi5F/wO8kPnKkY/3DHGd/oexQkidWePuGW60NaiMfIfurGA==
X-Received: by 2002:a62:3856:: with SMTP id f83mr22168190pfa.2.1589899427248;
        Tue, 19 May 2020 07:43:47 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9de6:6921:ec78:716d])
        by smtp.gmail.com with ESMTPSA id h3sm2382099pjk.10.2020.05.19.07.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 07:43:46 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Mingli Yu <mingli.yu@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [dunfell][PATCH 11/18] gnome-themes-extra: correct the recipe name
Date: Tue, 19 May 2020 07:43:25 -0700
Message-Id: <20200519144332.12822-11-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519144332.12822-1-akuster808@gmail.com>
References: <20200519144332.12822-1-akuster808@gmail.com>

From: Mingli Yu <mingli.yu@windriver.com>

Per https://gitlab.gnome.org/GNOME/gnome-themes-extra/-/blob/master/README.md,
gnome-themes-extra ever named as gnome-themes-standard.

So rename the recipe name to reflect the
current status to avoid confusion.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7c02c7d41175f62b7ef6859dfc069d83751b656d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...nome-themes-standard_3.28.bb => gnome-themes-extra_3.28.bb} | 3 ---
 1 file changed, 3 deletions(-)
 rename meta-oe/recipes-gnome/gnome-themes/{gnome-themes-standard_3.28.bb => gnome-themes-extra_3.28.bb} (94%)

diff --git a/meta-oe/recipes-gnome/gnome-themes/gnome-themes-standard_3.28.bb b/meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.bb
similarity index 94%
rename from meta-oe/recipes-gnome/gnome-themes/gnome-themes-standard_3.28.bb
rename to meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.bb
index 2fa754e79d..ac594711cd 100644
--- a/meta-oe/recipes-gnome/gnome-themes/gnome-themes-standard_3.28.bb
+++ b/meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.bb
@@ -6,9 +6,6 @@ SECTION = "x11/gnome"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-# Upstream renamed this package to gnome-themes-extra at some point
-BPN = "gnome-themes-extra"
-
 inherit gnomebase gettext gtk-icon-cache upstream-version-is-even features_check
 
 ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
-- 
2.17.1

