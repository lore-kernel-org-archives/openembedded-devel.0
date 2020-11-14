Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web09.10897.1605383759329622068
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2020 11:55:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vVRQb5jF;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id y22so6146701plr.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2020 11:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oxvENvS2omJD2BzIehfndxrw0cBgeNNVLP5dKquOmA4=;
        b=vVRQb5jFrmkXrUtujgg4cLnoitLqSkhsbQ9afCbI9Iar5nWZn745UrDqdQyJ9WEGnr
         3AvdMG40EARvusxJc9kfGJnJGoXHxOg5INBOqfiVH4Jr1roBVvhcDpDsMQLgFI8YO+Eh
         4j10i8aCvbyKgkZ6Y8BECiObltcVQAyr6oGR8G9pCs95OKMNTfLfj98Pp69qRyEPmHtE
         IanSMzI3oktS2CZXfwLRH9+rujEW2WOaZ/iedbaI1IdBm1G4NR1oSdO9ZQIpl3xtHrC+
         /fElL7TlWv7vWoVqoqcM8H03fz4JZOiiFFPyzSJOAZ6giZI7axlXhX+CQJqLqh4Tr+7u
         MLnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oxvENvS2omJD2BzIehfndxrw0cBgeNNVLP5dKquOmA4=;
        b=t9b55+NAj0As5xBLcwN7vqClhOBHv+4nLfKDn8ae2x39QMK44HFB3NQVUW9P9WjKNO
         eNYQMuS6liBrzPRdpf3V4dq5ykcpm06zhMMNRNVJXOlureG0xAScLE5d7IXKw0vwtJk1
         rFR+ntZfJX/t2Evg4dfPhHe0VXzuRvQwfsLQbzWgg/FykgSacIO252cylWjuuvYhwJ8w
         zDvjiSyC+2Pg9PuqZgSAY4xMbNUIrGLoPd2kuW2ywudAZmbjVzV2Y7Sh4grKrUJQFpHp
         Zcr5dRafmagMx9GwQSDb5GsxjWwH2mRLlKCIbTvVWe86U+sCLVoAIEWL6PFBjgTldx8K
         S1AQ==
X-Gm-Message-State: AOAM532EYpI0TCorwcfqOBdbBH2e+0ey9+PlE8nBWi9CVBuq+p0PkEys
	mQBJ8x/YPSx7HAc1G/fcCaSBIvmmp6Svh6Qq
X-Google-Smtp-Source: ABdhPJxScWit7ZKcJghlBrzBklxOss6oKjprmtB26DtsgKg75m7iLP/ZOXQuPIOTb7bai6KDh0VEDw==
X-Received: by 2002:a17:90a:bd0d:: with SMTP id y13mr8486551pjr.236.1605383758562;
        Sat, 14 Nov 2020 11:55:58 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id z9sm11486467pji.48.2020.11.14.11.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 11:55:58 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libgusb: Update to 0.3.5
Date: Sat, 14 Nov 2020 11:55:55 -0800
Message-Id: <20201114195555.2944938-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes are here [1]

[1] https://github.com/hughsie/libgusb/commit/1f712812327091c42c62b1ab1148d738d1a22b51

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-script-Don-t-hard-code-the-path-of-.patch | 53 -------------------
 .../{libgusb_0.3.4.bb => libgusb_0.3.5.bb}    |  3 +-
 2 files changed, 1 insertion(+), 55 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libgusb/libgusb/0001-generate-version-script-Don-t-hard-code-the-path-of-.patch
 rename meta-oe/recipes-support/libgusb/{libgusb_0.3.4.bb => libgusb_0.3.5.bb} (69%)

diff --git a/meta-oe/recipes-support/libgusb/libgusb/0001-generate-version-script-Don-t-hard-code-the-path-of-.patch b/meta-oe/recipes-support/libgusb/libgusb/0001-generate-version-script-Don-t-hard-code-the-path-of-.patch
deleted file mode 100644
index 41e64d7d80..0000000000
--- a/meta-oe/recipes-support/libgusb/libgusb/0001-generate-version-script-Don-t-hard-code-the-path-of-.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 76c23503ed1002d3aad0118795006fe2128006ae Mon Sep 17 00:00:00 2001
-From: Ting-Wei Lan <lantw@src.gnome.org>
-Date: Sat, 21 Mar 2020 22:13:57 +0800
-Subject: [PATCH] generate-version-script: Don't hard-code the path of python3
-
-Python can be installed in different directories on different operating
-systems, so we can't hard-code the path of it. Instead, use meson to
-find it to avoid 'no such file or directory' error on the bad path.
-
-Upstream-Status: Backport [https://github.com/hughsie/libgusb/pull/36]
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- contrib/generate-version-script.py | 1 -
- gusb/meson.build                   | 4 ++++
- 2 files changed, 4 insertions(+), 1 deletion(-)
- mode change 100755 => 100644 contrib/generate-version-script.py
-
-diff --git a/contrib/generate-version-script.py b/contrib/generate-version-script.py
-old mode 100755
-new mode 100644
-index c4ee238ab0ab..0fe2b24e47e3
---- a/contrib/generate-version-script.py
-+++ b/contrib/generate-version-script.py
-@@ -1,4 +1,3 @@
--#!/usr/bin/python3
- # pylint: disable=invalid-name,missing-docstring
- #
- # Copyright (C) 2017 Richard Hughes <richard@hughsie.com>
-diff --git a/gusb/meson.build b/gusb/meson.build
-index 10a6f537a642..28ca3c63e595 100644
---- a/gusb/meson.build
-+++ b/gusb/meson.build
-@@ -142,6 +142,9 @@ libgusb_girtarget = gnome.generate_gir(gusb,
- libgusb_gir = libgusb_girtarget[0]
- libgusb_typelib = libgusb_girtarget[1]
- 
-+pymod = import('python')
-+py_installation = pymod.find_installation('python3')
-+
- # Verify the map file is correct -- note we can't actually use the generated
- # file for two reasons:
- #
-@@ -154,6 +157,7 @@ mapfile_target = custom_target('gusb_mapfile',
-   input: libgusb_girtarget[0],
-   output: 'libgusb.ver',
-   command: [
-+    py_installation,
-     join_paths(meson.source_root(), 'contrib', 'generate-version-script.py'),
-     'LIBGUSB',
-     '@INPUT@',
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-support/libgusb/libgusb_0.3.4.bb b/meta-oe/recipes-support/libgusb/libgusb_0.3.5.bb
similarity index 69%
rename from meta-oe/recipes-support/libgusb/libgusb_0.3.4.bb
rename to meta-oe/recipes-support/libgusb/libgusb_0.3.5.bb
index bd88c8ed4c..c4b0ff3723 100644
--- a/meta-oe/recipes-support/libgusb/libgusb_0.3.4.bb
+++ b/meta-oe/recipes-support/libgusb/libgusb_0.3.5.bb
@@ -7,7 +7,6 @@ DEPENDS = "glib-2.0 libusb"
 inherit meson gobject-introspection gtk-doc gettext vala
 
 SRC_URI = "git://github.com/hughsie/libgusb.git \
-           file://0001-generate-version-script-Don-t-hard-code-the-path-of-.patch \
            "
-SRCREV = "377917fed85476d615f72279d0c97bc391d0f191"
+SRCREV = "1f712812327091c42c62b1ab1148d738d1a22b51"
 S = "${WORKDIR}/git"
-- 
2.29.2

