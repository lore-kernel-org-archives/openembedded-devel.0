Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A1EEF433EA
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 05:51:19 +0000 (UTC)
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7045.1776318678497026664
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 22:51:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NAPs3JIM;
 spf=pass (domain: gmail.com, ip: 74.125.82.51, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12c555f886dso77179c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 22:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776318678; x=1776923478; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21gqQiRuYIsLFrRaDXJOXUEyVg6XPmtpUERUsSd7KBI=;
        b=NAPs3JIMY4suCLV2p29iS/fDE8rAYwnUuedvJ1G4opzY7S2k02D5dDWpnQi2bEOmLw
         AGQVzhnVdoE7FooUM3ZNSM706YMqCdX0mk7Zt0/FsirbNrvBMbKMBFgbacoQVOFtGUHN
         pntgtBoGCUbegn4P/jobuT6caIyV7Q+LpsJ2shCCZBYMukX12INXGJHN8Gs1fZ2noC0G
         aBPqxInNvMrSflCCjSOBcA2n48tzXu5ucsG7Kwn24E2she17yMZ3Q4Hb++Dke7t2mdjL
         mngBSe0ySoRI1iOBs/HwlBeiLxpaOj/aW0beSpVUFGlFsXVVR6dSoHvTuJOTFTOK5RXw
         qv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776318678; x=1776923478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=21gqQiRuYIsLFrRaDXJOXUEyVg6XPmtpUERUsSd7KBI=;
        b=GHgUj0tQgo8vL1yrV8iDK43+Hcm/GQStDDbnb8osPvNe8T/5NezsqH89MPL4qIvGX0
         KeQoA5pxhFHVrS1XTueJXZJGmeHNCnf1dYjRslGa4ZEcIwcNK5qismSxNdIhknU0iONH
         zYFastoiFBW/ffRvLqPlYsYI3fiqYHxPVMHePkkKzgbJht5LDKSPCFzpKPs2EejZADM4
         JOngZVRuFKpZSAqb92dIIQXzy302k82jWLm/OVGBI9b/inlKZK0qr8jpKpdZJkg8QWst
         2OkrVj85J6kOVsz+IE3soHCvkmJNrn7whfRwIYWJ9mGYxhaRqSXu9ae/frbyBGKoXJdi
         fZ5w==
X-Gm-Message-State: AOJu0Yyw92krL0FI8dyqWG75N0VPDlGIVaWlfVoPj7CRwX/dKM6YBtBk
	CZ1u9rhm25dO/ZCaqtbXPl8lpDukyJRiqCHG7BdSZGmFZ9XXgnYmcZXJgk8nkcjs
X-Gm-Gg: AeBDievxMlZJINEu0zG774QbvMhS7MiShleNOEGqJhRRRWpJiS0OhmOKc0qAxHUpfqJ
	FkrvQ1f/QfB9TW38z/UmNxIehLOhlgxVS0mc2L9TPbfavHtuHrJIeU6v9ca6togm+NoRGZuRjo3
	YLrJA5EAkS+ixfkl2gHfVYN5feHnJ5RFfN2uJ2wRLHVThQ0M2l77b5fOL+yzRny3hm/heYMzMIm
	Rg15RnCxdnKTXema36/t3N4V2Q3rOu2+ozfZxYBSOxMyMI0SpYysVk3PXXl9LHDEzv2x4FeLwjd
	uTWCrRZwfsWOWXGo1FpCKXDc8V6D7OsbEnjD9VfHtkpreIcwOImy2xMZurRy4CcArSSaOdDhvuO
	1INblmYc+lgAwyEuW4TQiGENJmNCTyiKhUbXbgvEO6ItOoF9/v6ZwThpFaVwdAKMt+bGjBClnAl
	3cV20bZUSUYVgL/UrkbKhah6NDgUXAP/ISt5bTNqJiQWLLV5bu0uUMGPNgrukAsFaYTqIe8oVCy
	rlkMQLh6VjXQogMu3wwFnbpgbgKtPQ+ldK0JZXXmRSRI/763aryS0Tjahic2f82rC+I4BXPiYt4
	nodr94bHYeNTCwxq689PqI1UbHP8IaZkYMjT8zOhVw4X5cU7okhqZUNk+vA+yA==
X-Received: by 2002:a05:7022:f9d:b0:119:e56b:c75c with SMTP id a92af1059eb24-12c34f069edmr13957256c88.33.1776318677424;
        Wed, 15 Apr 2026 22:51:17 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e61db6bsm4810182c88.1.2026.04.15.22.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 22:51:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 14/18] taisei: Fix build with glibc 2.43 + c23
Date: Wed, 15 Apr 2026 22:50:54 -0700
Message-ID: <20260416055058.792189-14-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
References: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 05:51:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126393

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ed-const-qualifiers-in-char-pointer-.patch | 56 +++++++++++++++
 ...necessary-recursion-in-vfs_mkparents.patch | 71 +++++++++++++++++++
 .../recipes-graphics/taisei/taisei_1.4.4.bb   |  5 +-
 3 files changed, 131 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-misc-fix-discarded-const-qualifiers-in-char-pointer-.patch
 create mode 100644 meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-vfs-avoid-unnecessary-recursion-in-vfs_mkparents.patch

diff --git a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-misc-fix-discarded-const-qualifiers-in-char-pointer-.patch b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-misc-fix-discarded-const-qualifiers-in-char-pointer-.patch
new file mode 100644
index 0000000000..1b37633a36
--- /dev/null
+++ b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-misc-fix-discarded-const-qualifiers-in-char-pointer-.patch
@@ -0,0 +1,56 @@
+From d0326cd89b01600a6d8ba5e32e8e090f2ea29f2d Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Wed, 15 Apr 2026 16:28:28 -0700
+Subject: [PATCH] misc: fix discarded const qualifiers in char pointer
+ assignments
+
+These show up with glibc 2.43 + clang-22, glibc-2.43 has C23 versions
+of str* mem* functions
+
+Upstream-Status: Backport [https://github.com/taisei-project/taisei/commit/1c8f773912cbbd72b4a4df271fda1bd6d2aeb27f]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/log.c           | 2 +-
+ src/pixmap/pixmap.c | 2 +-
+ src/vfs/pathutil.c  | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/log.c b/src/log.c
+index 8194535a..88f34386 100644
+--- a/src/log.c
++++ b/src/log.c
+@@ -161,7 +161,7 @@ static void add_debug_info(StringBuffer *buf) {
+ static size_t modname(const char *filename, size_t filename_len, char *mod) {
+ 	size_t mlen = filename_len;
+
+-	char *dot = memchr(filename, '.', mlen);
++	const char *dot = memchr(filename, '.', mlen);
+ 	if(dot) {
+ 		mlen = dot - filename;
+ 	}
+diff --git a/src/pixmap/pixmap.c b/src/pixmap/pixmap.c
+index 25105215..9717f22a 100644
+--- a/src/pixmap/pixmap.c
++++ b/src/pixmap/pixmap.c
+@@ -49,7 +49,7 @@ void *pixmap_alloc_buffer_for_conversion(const Pixmap *src, PixmapFormat format,
+ }
+
+ static PixmapFileFormatHandler *pixmap_handler_for_filename(const char *file) {
+-	char *ext = strrchr(file, '.');
++	const char *ext = strrchr(file, '.');
+
+ 	if(!ext || !*(++ext)) {
+ 		return NULL;
+diff --git a/src/vfs/pathutil.c b/src/vfs/pathutil.c
+index f6bd6a80..85ccf5ee 100644
+--- a/src/vfs/pathutil.c
++++ b/src/vfs/pathutil.c
+@@ -14,7 +14,7 @@ char *vfs_path_normalize(const char *path, char *out) {
+ 	const char *p = path;
+ 	char *o = out;
+ 	char *last_sep = out - 1;
+-	char *path_end = strchr(path, 0);
++	const char *path_end = strchr(path, 0);
+
+ 	#define IS_SEP_OR_NUL(chr) (VFS_IS_PATH_SEPARATOR(chr) || (chr == '\0'))
+
diff --git a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-vfs-avoid-unnecessary-recursion-in-vfs_mkparents.patch b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-vfs-avoid-unnecessary-recursion-in-vfs_mkparents.patch
new file mode 100644
index 0000000000..9f5d7a17d4
--- /dev/null
+++ b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-vfs-avoid-unnecessary-recursion-in-vfs_mkparents.patch
@@ -0,0 +1,71 @@
+From c9c00a88c10db4ce93ffcc043c661727d2ec9758 Mon Sep 17 00:00:00 2001
+From: laochailan <239670+laochailan@users.noreply.github.com>
+Date: Fri, 13 Feb 2026 20:21:44 -0500
+Subject: [PATCH] vfs: avoid unnecessary recursion in vfs_mkparents
+
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+Upstream-Status: Backport [https://github.com/taisei-project/taisei/commit/f2e074f4a6aecf78b980014ed98f12fc6ddfd016]
+---
+ src/vfs/public.c | 43 +++++++++++++++++--------------------------
+ 1 file changed, 17 insertions(+), 26 deletions(-)
+
+diff --git a/src/vfs/public.c b/src/vfs/public.c
+index abaa050f..cfeef83a 100644
+--- a/src/vfs/public.c
++++ b/src/vfs/public.c
+@@ -146,38 +146,29 @@ void vfs_mkdir_required(const char *path) {
+ 	}
+ }
+
+-static bool vfs_mkparents_recurse(const char *path) {
+-	// FIXME this has stupid space complexity and is probably silly in general; optimize if you care
+-
+-	char *psep = strrchr(path, VFS_PATH_SEPARATOR);
+-
+-	if(!psep) {
+-		// parent is root
+-		return true;
+-	}
++bool vfs_mkparents(const char *path) {
++	char p[strlen(path)+1];
++	path = vfs_path_normalize(path, p);
+
+-	char p[strlen(path) + 1];
+-	strcpy(p, path);
+-	psep += p - path;
+-	*psep = 0;
++	// loop over all parent directories
++	char *psep = p;
++	while((psep = strchr(psep, VFS_PATH_SEPARATOR))) {
++		*psep = 0;
+
+-	VFSInfo i = vfs_query(p);
++		VFSInfo i = vfs_query(p);
++		if(i.error) {
++			return false;
++		}
+
+-	if(i.error) {
+-		return false;
+-	}
++		if(!i.exists || !i.is_dir) {
++			vfs_mkdir(p);
++		}
+
+-	if(i.exists) {
+-		return i.is_dir;
++		*psep = VFS_PATH_SEPARATOR;
++		psep++;
+ 	}
+
+-	return vfs_mkparents_recurse(p) && vfs_mkdir(p);
+-}
+-
+-bool vfs_mkparents(const char *path) {
+-	char p[strlen(path)+1];
+-	path = vfs_path_normalize(path, p);
+-	return vfs_mkparents_recurse(p);
++	return true;
+ }
+
+ char* vfs_repr(const char *path, bool try_syspath) {
diff --git a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.4.bb b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.4.bb
index bb08ad4a1c..844e735b69 100644
--- a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.4.bb
+++ b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.4.bb
@@ -20,7 +20,10 @@ DEPENDS = "\
 DEPENDS:append:libc-musl = " libucontext"
 LDFLAGS:append:libc-musl = " -lucontext"

-SRC_URI = "gitsm://github.com/taisei-project/taisei.git;branch=v1.4.x;protocol=https;tag=v${PV}"
+SRC_URI = "gitsm://github.com/taisei-project/taisei.git;branch=v1.4.x;protocol=https;tag=v${PV} \
+           file://0001-misc-fix-discarded-const-qualifiers-in-char-pointer-.patch \
+		   file://0001-vfs-avoid-unnecessary-recursion-in-vfs_mkparents.patch \
+		  "
 SRCREV = "6a484e6e61cc51a22a9943762dc2ff6883914f38"

 inherit features_check meson mime mime-xdg pkgconfig

