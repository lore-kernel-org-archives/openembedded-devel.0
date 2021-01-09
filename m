Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.4436.1610205108803374620
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Jan 2021 07:11:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SwgSKMOG;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id d13so11763951wrc.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 Jan 2021 07:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yW8LfhP+73kAxUB/aPRU641o/+tPLC3vftbj2DgYnqE=;
        b=SwgSKMOGrpKdvG83c1Y8H7uJZ9Yda5psBwTmeEMiM/oLK1Y53mGKEPDu54rUh9B2K0
         qXU0hSD0w5snTxv/oTLcSd2pS3L5swQXm9CctkB7jMXUsoTSoNWpJ3xYxqVrraS3Jcx2
         ZX/XAqyCoGR6uhJg91T5jlLZ+ARYlgkGpYmMMCRk2/swV3ZEor95i8jNycLexliGb0JE
         AcmcOkRNnkBetAE+BceXCZL9c9T1F8jy9RBFH8ykSRurkU/MQMMMALzbmMzBotsptd+l
         KHtcbMcXxVt695rJRZ57p0cbr0iq54Xqzd38UR6KXKZuinVjeuAcCud6wvXcDuKUEMFy
         Doag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yW8LfhP+73kAxUB/aPRU641o/+tPLC3vftbj2DgYnqE=;
        b=Vx0pNfV2+veJmO7+PIDt5KnAEOMg3CLcCsiTjZRgM7lEqnYDtM3MFP5SwZCzC6AZ9G
         2ytx29mDphpkhmoTvZOBzSvHZDQOt7q3NXLecf/gKSK2Y3LCEikoT43IOUyUcd4DAmzE
         5HVE4wzAWag21O2cTQEw7frPRWprTLjFh+s+/DPkl2pJUaY7czXzCYc4Dr/rCUCNWxr3
         kQrklY/FVeGxEo1IaegQuSD3vsxVlYlJIbNoiaf4c8kZSjvMrDbgWNsayDQeefk3D3Kx
         BR/c/moChehnzRfztKclwDfnaoc9lDzZ2caoxP5A3ir89xmXJniS51Gnpi5DLHvfj4t/
         hMRA==
X-Gm-Message-State: AOAM530zzvfNdILwbkBZn4QumhftCFZzshlZXEMZznk4HbBgXHRXsgTh
	yx0cebRaQo60+D76y/UV3A/CDEz9Qyb/0A==
X-Google-Smtp-Source: ABdhPJyNzgk03yA1iabotCJdXkKXQ/LyPAesoLq3BMVS/LKUEkC+5uPG1jWZc/0ybjUe5hw611vQyw==
X-Received: by 2002:a5d:5049:: with SMTP id h9mr8832966wrt.404.1610205106957;
        Sat, 09 Jan 2021 07:11:46 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f09bb3762d71a5d34ee0918.dip0.t-ipconnect.de. [2003:f0:7f09:bb37:62d7:1a5d:34ee:918])
        by smtp.gmail.com with ESMTPSA id u83sm16673912wmu.12.2021.01.09.07.11.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Jan 2021 07:11:46 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/3] libxfce4ui: Fix sporadic install error
Date: Sat,  9 Jan 2021 16:11:30 +0100
Message-Id: <20210109151130.417269-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210109151130.417269-1-schnitzeltony@gmail.com>
References: <20210109151130.417269-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ate-xfce4-keyboard-shortcuts.xml-fix.patch |  0
 .../0002-Remove-GTK2-leftovers.patch          | 44 +++++++++++++++++++
 .../libxfce4ui/libxfce4ui_4.16.0.bb           |  7 ++-
 3 files changed, 49 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/libxfce4ui/{files => libxfce4ui}/0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch (100%)
 create mode 100644 meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui/0002-Remove-GTK2-leftovers.patch

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/files/0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui/0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch
similarity index 100%
rename from meta-xfce/recipes-xfce/libxfce4ui/files/0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch
rename to meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui/0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch
diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui/0002-Remove-GTK2-leftovers.patch b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui/0002-Remove-GTK2-leftovers.patch
new file mode 100644
index 000000000..cd6ca32d0
--- /dev/null
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui/0002-Remove-GTK2-leftovers.patch
@@ -0,0 +1,44 @@
+From fb7bd8511d55cf0d24f6f93768f51773cf434a59 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Fri, 8 Jan 2021 21:59:45 +0100
+Subject: [PATCH] Remove GTK2 leftovers
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+It seems that these cause install performed twice causing natsy races -
+see [1] and search for 'TOPDIR/build/tmpfs/hosttools/install -c -m 644
+../../libxfce4ui-4.16.0/libxfce4ui/libxfce4ui.h'
+
+[1] https://errors.yoctoproject.org/Errors/Details/540832/
+
+Upstream-Status: Submitted [https://gitlab.xfce.org/xfce/libxfce4ui/-/merge_requests/29]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ libxfce4ui/Makefile.am | 9 ---------
+ 1 file changed, 9 deletions(-)
+
+diff --git a/libxfce4ui/Makefile.am b/libxfce4ui/Makefile.am
+index 935eece..bc5afac 100644
+--- a/libxfce4ui/Makefile.am
++++ b/libxfce4ui/Makefile.am
+@@ -51,15 +51,6 @@ libxfce4ui_sources = \
+ 	xfce-filename-input.c \
+ 	xfce-titled-dialog.c
+ 
+-libxfce4ui_includedir = \
+-	$(includedir)/xfce4/libxfce4ui-$(LIBXFCE4UI_VERSION_API)/libxfce4ui
+-
+-libxfce4ui_include_HEADERS = \
+-	$(libxfce4ui_headers)
+-
+-
+-
+-
+ ##
+ ## GTK+ 3 support library
+ ##
+-- 
+2.26.2
+
diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.0.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.0.bb
index 7a269ad66..6fbf1cf25 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.0.bb
@@ -8,8 +8,11 @@ inherit xfce gtk-doc gobject-introspection features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-# TODO: Check if this can go
-SRC_URI += "file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch"
+# TODO: Check if 0001-... can go
+SRC_URI += " \
+    file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch \
+    file://0002-Remove-GTK2-leftovers.patch \
+"
 SRC_URI[sha256sum] = "8b06c9e94f4be88a9d87c47592411b6cbc32073e7af9cbd64c7b2924ec90ceaa"
 
 EXTRA_OECONF += "--with-vendor-info=${DISTRO}"
-- 
2.26.2

