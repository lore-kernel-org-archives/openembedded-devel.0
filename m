Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.3448.1619140247733893780
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Apr 2021 18:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rIgixPEF;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id f11-20020a17090a638bb02901524d3a3d48so307501pjj.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Apr 2021 18:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fpr2RUEESpT/0Px8yJ0KlonqQot2pSpTzYE4rrtfW+E=;
        b=rIgixPEF4E1z3gpIaEtReCGAEep9/Uzf7G3VDPGUCHEOxZbkRPZAhoqeHhVN0cwlBw
         cJ+VygxZ0H69uJWNMb5Gj9tXPSi9KxsoY9cG9Z3Hke9s4g5Vl9O1Awu5tXBr0dv/pBhl
         OOSPldihMevDGvLcoVWv5on2OpqEhbtsGn45lCN9FR6WUNa1cqIfOHxrZgtWx+m6FmEB
         QuOuJePE5tCd+3e6LCZ9bUDBLIgSnyDOsZnSNmIGyw7tyPe05Pp1dgVMrNA34dV8PUGY
         zxkFCVYzFn7AVhiMVFsjkdHWKYhJMvcS9dgYutCFsbFlsh/el5rB/dMxeaLsJgHVEOlD
         KFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fpr2RUEESpT/0Px8yJ0KlonqQot2pSpTzYE4rrtfW+E=;
        b=EMg0JquNL8d5Y+kICzvN5tuPLVr6xRMjnOkP1XPHqpkvweGQCF8PTkepo0kcUT9yLS
         g51lYDELtVYChmi3j/QJHBchCMl5oFH8uhfoQummgSXWIzKmOMmhhmoc95Ar3+SEYfrR
         sF+V+eX3rbBEnq8UE333m7qJeTXlcsvdM7Ke0+fxMFBnmOnqviidr12+t38sq5rOp4qw
         3+OvfCiYjcSMjdOWkHxM/AgwGbaCG6kwGsv+3ibIhPpIscj8I8je38oVNL+ghhsqMm2g
         j77z7E2KZq6b8GDz7kfh1D9y9KEuG11BVfL0aJW+ofuyr3kRLye40EAOuHiSJLk+w/r3
         BhYA==
X-Gm-Message-State: AOAM532P9ZOuW+xySNCiTxLXai6AHkRPegGMzftMkxkV+4+CHbDRtvZQ
	qCVNO1YpqT9FNBHV3lwi/EaYw+E5hjBMKA==
X-Google-Smtp-Source: ABdhPJxoPK8G9nNKmhPn0QW8Jj6cTO4JBy1IH33EFKoDRDDf9DEmBp0yOuTt0lf2+YS/5vWpZdxQOA==
X-Received: by 2002:a17:90b:60a:: with SMTP id gb10mr2964086pjb.71.1619140246809;
        Thu, 22 Apr 2021 18:10:46 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id 187sm2939200pff.139.2021.04.22.18.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 18:10:46 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-gnome][PATCH v2 1/3] libchamplain: Require opengl distro feature
Date: Thu, 22 Apr 2021 18:10:42 -0700
Message-Id: <20210423011044.3627373-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It has hard dependency on clutter-gtk-1.0 which needs opengl

Fixes

clutter-gtk-1.0 was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'libchamplain', 'clutter-gtk-1.0']

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
v2: Also inherit features_check

 meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.20.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.20.bb b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.20.bb
index 90e5533015..24312c78a3 100644
--- a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.20.bb
+++ b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.20.bb
@@ -3,7 +3,9 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "glib-2.0 gtk+3 gdk-pixbuf clutter-1.0 clutter-gtk-1.0 libsoup-2.4"
 
-inherit meson gobject-introspection
+inherit features_check gobject-introspection meson
+
+REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRCREV = "145e417f32e507b63c21ad4e915b808a6174099e"
 SRC_URI = "git://github.com/gnome/libchamplain.git"
-- 
2.31.1

