Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web09.962.1632338552790360488
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Eh1hjbZK;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id t1so3806992pgv.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GpuKZCLAIcQZqKzYCyYLvQCoiJ4qFSxqt3NUnfQKWQY=;
        b=Eh1hjbZK6LXHMOZOiLRamMZjDj04gpcUIhFBGvlpT/LaCfRxTgbxt8kaW86G3H9fJ8
         /474JbRwjE8Q/D5Uts/gSzoxwk+o+r5+poFdS1aV+lIe1gff4xNhCVFfoT/70lxF+k33
         QbJiNPXfXkZUiYfThN7egv+ONcKOjyI8QP3EBlHr1/YkW8S2P/cplnQGfKMlHlD2Hrfa
         xMoj0xVT/Z1+mNTTQOBg1kbm2CLhWfxtgVRb8jnoGP19B7gR7jzid9/oh3yLU40gAQTI
         QrA1unFbcqYgn85kYg0RY/0YSszYxxX/12Wr6n959pbyy7k4O6B/Zm+lynVaSHk8nMU8
         M1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GpuKZCLAIcQZqKzYCyYLvQCoiJ4qFSxqt3NUnfQKWQY=;
        b=7zeqiQbB5b7kzkWi1Y1ETREzCMpGvabTM0r+7qw28zaSEjTScG48oXgdKDrP7v/1K1
         PXKLZmS70mlXFgFBMAkxCaQkHZOuHFPpyZmx+cRnEUIy5s/OGn3HLGqDSYPRlhCW2RMl
         8BGz7Kkz9GDsyS60dSBHGw3gDxdFCiMlTv2fJoMu5apmMqF5uZl37s404EOuXElLycJT
         aqR7xRCuSiJ6RBSITWZTQl3TKkaraz8O1ap5anE/pzqTFXf1bxpl3QW7+xqVELzr76lv
         VGMqDuhK7n3kIkB2qQpcVpdKRAjbD1//Jebe7YbPByX1RV8jD6xEe3klGKzVRYbetYDT
         Df1Q==
X-Gm-Message-State: AOAM531Ty1ltkSXORsNpVPm7YNcb5w4nXqnkzL3L+CQykPyFmEkZNZ1O
	Rmvwx9VTaKerpXfgMUxTPgw4l3HxTM4lGQ==
X-Google-Smtp-Source: ABdhPJzLfkXU2AuVhvfXxH2nnho0yE4b6jSqhFyGA/Yc2QYCvcoiDP2rgfMODIg1VMGAJISrQuEjsA==
X-Received: by 2002:a05:6a00:2410:b0:40e:7d8:ad7f with SMTP id z16-20020a056a00241000b0040e07d8ad7fmr376934pfh.25.1632338552155;
        Wed, 22 Sep 2021 12:22:32 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:31 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 19/39] libchamplain: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:21:53 -0700
Message-Id: <20210922192213.3062719-19-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
Did not find pkg-config by name 'pkg-config'
Found Pkg-config: NO

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.20.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.20.bb b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.20.bb
index 24312c78a3..9b99bbc4e2 100644
--- a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.20.bb
+++ b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.20.bb
@@ -3,7 +3,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "glib-2.0 gtk+3 gdk-pixbuf clutter-1.0 clutter-gtk-1.0 libsoup-2.4"
 
-inherit features_check gobject-introspection meson
+inherit features_check gobject-introspection meson pkgconfig
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-- 
2.33.0

