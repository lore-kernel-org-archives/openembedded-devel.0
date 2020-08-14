Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web11.12376.1597383434557252725
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 22:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ekZonZSa;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id j21so3986870pgi.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 22:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VnVYKygGScjbqXD0rMYCDl5TU9pyWnzSXrdG1OQc9vk=;
        b=ekZonZSay7C3+hJI31vryHcRkh2oz6WGL3AHZ0B3SFPxYX6ieTXA1l4BXHPSofRjtd
         pVlKaGeF4UQMd2d+MmEYd2LI8ji0rtcAT3BPzpSOa+/lNOpDLV5CTbfdid9ZdDNrVmj5
         INV403Dar/dDIb/XKuCdr/aj38owaAVc9ky1Ua+LpH5oy7bgdrE0riwehW1gqxNrKSRP
         5IgAXyHQVwKGSBtQvFC8ssKmFfytlXXR9536o7chynejZFaqaeT1k63uvKItcOQa/oN7
         z0sD2EiaIuCD8KeWrefrqe8ybY+kw8ZRwK2ImsGO3A3XFdkAziVQAwnHqJ3ZfaYY5E8q
         SvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VnVYKygGScjbqXD0rMYCDl5TU9pyWnzSXrdG1OQc9vk=;
        b=Nihs+OUkRzuxIIeKffLJtZeovpNJhxodYvmjLypadwJKbhO0AoI/2K5+rREUEdZAvN
         pZXAQ5iU6Cqb6hNIYB6BAUa0Tnue+Y8Fji0HmjjHxJ84yu1z80kt6vWg+PIC++eXXSyK
         pcWpT80I7BLEn6nC8AEH9zQMMSuM/0MZDaoI6oVegQfBOm5QJJW4cWMiQxSp01lvx0+0
         EVnpnTDqPGa965v+Vgc51unsjpv1eZ02dXMHX/sEnJv+RYXz6Q6/TTNUTVhpFfC7HySf
         lwh5lFui5H/1OzZyfLB74TwFOHg3wEcww2RITE+J2N4O8HgPgMeOlR7uwctPl5NhCS0Q
         f5vw==
X-Gm-Message-State: AOAM530aGF6AiMxnuiZk6RI4hkazRjyXsup6yu8SJCq3+UnleVPjSRBp
	6rlhL0S71N3LFgxS6HBBTRV95f7gB41mpA==
X-Google-Smtp-Source: ABdhPJwWnf9USqPBnwhqts/4LgzYQQU3jqhLhXW28QqWG2+JrYW8A5JYVuGglbhZhjomMhzpOOI06w==
X-Received: by 2002:a65:6644:: with SMTP id z4mr720961pgv.391.1597383433730;
        Thu, 13 Aug 2020 22:37:13 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id k21sm7013974pgl.0.2020.08.13.22.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 22:37:12 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 14/21] xf86-video-ati: Fix link failure with gcc 10
Date: Thu, 13 Aug 2020 22:36:50 -0700
Message-Id: <20200814053657.1701247-14-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814053657.1701247-1-raj.khem@gmail.com>
References: <20200814053657.1701247-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-link-failure-with-gcc-10.patch   | 34 +++++++++++++++++++
 .../xorg-driver/xf86-video-ati_19.0.1.bb      |  2 ++
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-ati/0001-Fix-link-failure-with-gcc-10.patch

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati/0001-Fix-link-failure-with-gcc-10.patch b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati/0001-Fix-link-failure-with-gcc-10.patch
new file mode 100644
index 0000000000..7dfa233423
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati/0001-Fix-link-failure-with-gcc-10.patch
@@ -0,0 +1,34 @@
+From cebbeaa9d0bdc18377faef27ea9ffd38e509d180 Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Tue, 4 Feb 2020 16:38:06 -0500
+Subject: [PATCH] Fix link failure with gcc 10
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Without the 'extern' this looks like a definition not just a
+declaration, in every file that includes the header. gcc 10 is stricter
+about this kind of multiple definition.
+
+Upstream-Status: Backport [https://cgit.freedesktop.org/xorg/driver/xf86-video-ati/commit/?id=f223035f4ffcff2a9296d1e907a5193f8e8845a3]
+Reviewed-by: Michel Dänzer <mdaenzer@redhat.com>
+---
+ src/drmmode_display.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/drmmode_display.h b/src/drmmode_display.h
+index 96eaef0..8cd8a0a 100644
+--- a/src/drmmode_display.h
++++ b/src/drmmode_display.h
+@@ -262,7 +262,7 @@ Bool drmmode_wait_vblank(xf86CrtcPtr crtc, drmVBlankSeqType type,
+ 			 uint64_t *ust, uint32_t *result_seq);
+ 
+ 
+-miPointerSpriteFuncRec drmmode_sprite_funcs;
++extern miPointerSpriteFuncRec drmmode_sprite_funcs;
+ 
+ 
+ #endif
+-- 
+2.28.0
+
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_19.0.1.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_19.0.1.bb
index 4042150b1a..d3395496af 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_19.0.1.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_19.0.1.bb
@@ -12,6 +12,8 @@ DEPENDS += "virtual/libx11 libxvmc drm \
 inherit features_check
 REQUIRED_DISTRO_FEATURES += "opengl"
 
+SRC_URI += "file://0001-Fix-link-failure-with-gcc-10.patch"
+
 SRC_URI[md5sum] = "47eccf71823206ade9629cba69de7ef6"
 SRC_URI[sha256sum] = "5cb6015d8664546ad1311bc9c363d7bc41ebf60e7046ceb44dd38e5b707961b0"
 
-- 
2.28.0

