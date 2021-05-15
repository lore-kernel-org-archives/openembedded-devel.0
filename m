Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web08.572.1621121960674559399
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 May 2021 16:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sfEJ1pcO;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id p24so2523270ejb.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 May 2021 16:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0cxf8cuSeM/Yfehxjius05eZ2L3K31PpGoJGFFu4GTs=;
        b=sfEJ1pcOeFFJLWIlY7UwMAtHofMx86+n/IK/Zlzp0rmrlCDBOB3nYvGZeRX61ItnsC
         Xoh64ji0NRrABVLHB9Q0h22FYHNynJj3i3NZpVDNmRAXDlhJZ7rQyM0U0KDWW63gRtu9
         ABbSV2Oz3v6g7uGikQI2geSIQ9jaOTflU114RqwqrVHmVqzzsKkbeA+OKgufWwkgy2Cv
         6GZGkxgjtdQQkj4LTXo99SjmB+y/HWwRVIvr72PF8/kqjX+zOp509FbM4IyCCMsvPbh+
         59bJO59IHKfwbgfi51zd7FNJPbuWLheNdFgLBooKQG0EHiUq4kwD+KyTqYg9/kGR2x6b
         9o/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0cxf8cuSeM/Yfehxjius05eZ2L3K31PpGoJGFFu4GTs=;
        b=YGjF32ScAIbDz0xndJ0iIfi6JjJ+AWMIOecb53zONXcTlCZphppRP84XeP39kCrjrL
         gyS9Rqkifxka9Z44cEYzfVxFArDTuvXN0Kg6sWD1+vRPMATmcziUrnE8QVvoPohTfYdA
         Um8w7gD6RwmDLeiAl7h3Fxizuymgamemm91oWbCSuW66MBewOCXctu6lxH0R8TNf/iLC
         0pkxw3y5g5BRHLZbe85CuUCsDOnwwLxcFxuzB8PvXRVO3WUA6ZZqbVMGm54qfH0WmPfK
         GNvScJUlYZD4VHi5eA7OrFpdZa9c8sXQmKi41YKWxguW2tpOHrZV3UsVvybryQ+OVaiC
         HMkA==
X-Gm-Message-State: AOAM530hOPoYwaJUrbTdNXGofLP6sXj2pgrT6ZzpLQq6ghUPMb1NfOuY
	hkhJP4x5xn6HIwupckwJUHlKJNHlB0s=
X-Google-Smtp-Source: ABdhPJxrWl1FIKrOYhUY1yd7kQjRQv8s5jkQlddsmPGfogL2CVuZBsU1Fq+1u7tegexl61UKKuqBFA==
X-Received: by 2002:a17:906:507:: with SMTP id j7mr54259220eja.151.1621121959341;
        Sat, 15 May 2021 16:39:19 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f174d19e31b0fdffece5e2b.dip0.t-ipconnect.de. [2003:f0:7f17:4d19:e31b:fdf:fece:5e2b])
        by smtp.gmail.com with ESMTPSA id r25sm7668986edv.78.2021.05.15.16.39.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 16:39:18 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 18/20] grilo-plugins: initial add 0.3.13
Date: Sun, 16 May 2021 01:38:51 +0200
Message-Id: <20210515233853.583490-18-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515233853.583490-1-schnitzeltony@gmail.com>
References: <20210515233853.583490-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../0001-Avoid-running-trackertestutils.patch | 34 +++++++++++++++++++
 .../grilo/grilo-plugins_0.3.13.bb             | 22 ++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/grilo/grilo-plugins/0001-Avoid-running-trackertestutils.patch
 create mode 100644 meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.13.bb

diff --git a/meta-gnome/recipes-gnome/grilo/grilo-plugins/0001-Avoid-running-trackertestutils.patch b/meta-gnome/recipes-gnome/grilo/grilo-plugins/0001-Avoid-running-trackertestutils.patch
new file mode 100644
index 000000000..a07cd49fd
--- /dev/null
+++ b/meta-gnome/recipes-gnome/grilo/grilo-plugins/0001-Avoid-running-trackertestutils.patch
@@ -0,0 +1,34 @@
+From 9deaed70221a12e26f968be26233b75fa5669476 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Sat, 15 May 2021 23:25:09 +0200
+Subject: [PATCH] Avoid running trackertestutils
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+It breaks configuration:
+| ../grilo-plugins-0.3.13/tests/tracker3/meson.build:5:0: ERROR: Program '/usr/lib/tracker-3.0/trackertestutils/tracker-sandbox' not found
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 6a03778..17ef1e1 100644
+--- a/meson.build
++++ b/meson.build
+@@ -78,7 +78,7 @@ totem_plparser_dep = dependency('totem-plparser', version: '>= 3.4.1', required:
+ totem_plparser_mini_dep = dependency('totem-plparser-mini', version: '>= 3.4.1', required: false)
+ tracker_sparql_dep = dependency('tracker-sparql-2.0', version: '>= 2.3.0', required: false)
+ tracker3_dep = dependency('tracker-sparql-3.0', required: false)
+-tracker3_testutils_dep = dependency('tracker-testutils-3.0', required: false)
++tracker3_testutils_dep = dependency('tracker-testutils-3.0-avoid-find', required: false)
+ 
+ lua_dep = dependency('lua', version: '>= 5.3.0', required: false)
+ if not lua_dep.found()
+-- 
+2.31.1
+
diff --git a/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.13.bb b/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.13.bb
new file mode 100644
index 000000000..4ead998c7
--- /dev/null
+++ b/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.13.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Grilo is a framework forsearching media content from various sources"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+
+DEPENDS = " \
+    glib-2.0-native \
+    gperf-native \
+    itstool-native \
+    grilo \
+    tracker \
+    lua \
+    liboauth \
+"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase gnome-help vala
+
+SRC_URI += "file://0001-Avoid-running-trackertestutils.patch"
+SRC_URI[archive.sha256sum] = "1c4305d67364a930543836cc1982f30e946973b8ff6af3efe31d87709ab520f8"
+
+FILES_${PN} += "${libdir}/grilo-0.3"
-- 
2.31.1

