Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10282.1795752834177904492
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:13:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=vmma1Yt9;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-386b8f2f671so4410495eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752833; x=1796357633; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n+jn0f5dWe/CT/aUNhIqEKo4XZAjNsM1LMZOkI2Bhtc=;
        b=vmma1Yt9BSp5dFUueYKoU/A9SVPIUiESmrq6Fh/nVOg/6kdp++4MlAIa+Cuy52zaJ9
         zVJ4OBLM39dj11VvhDNOjiGdtDgUrPXGZeg+zXMPKOncE8uu4J7TVNTHFMGQuVhrd1+K
         +WygCoVXfCtB58ulWt9TY6xW4N5AQTTZyQ5eZowtofdwNwlnnHBo/pwsUwj+/35f+mdi
         K1yVXUm9oeIjLd7R5sI35NW7BywJPpZ9D1MHBSCGEimFTZr/kBaBxOYzC7gkVRJSqs20
         n4n3793mzTuFjcOmMHK7Xx0NFEzDb6wUjYueitIeKAj93IQhEjU4WLaN1OvOy5oGYffG
         obVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752833; x=1796357633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n+jn0f5dWe/CT/aUNhIqEKo4XZAjNsM1LMZOkI2Bhtc=;
        b=iSDF++1/lLvYzZ2IuTym/9Z1iB98lOsogcWpRJ5uP7eUMqHKiBqCyr+6d9RlLYXVgI
         6INpe1pYnJnxw7BNMSpTm0igx4h8MmjQ0L6hcs6TWi/3USVF62BbjAWNLJE3N0hnS8Vi
         2Sozqzc1GXQ12/FwNccwQv0hmsVzOrbv+x/c3WSYnxLKxEziLKXU6tm9Fii4P1DxLcg1
         CG3qdtnrcF6TYfkpJUlvlvxYKwaZZAi6vxnaGCZ6SN/vpfxQemDBUuFh/ozI3QTBS8JW
         cU1iLpZuwBs6kgJI7BMO0Ih7XQ3EZfN0Rlmjk3r+nJgPQhYNCP8N5XjVPhQw1d5/2Q7Z
         GvGQ==
X-Gm-Message-State: APuU4Z+p7tELsgfVOQLSwWWD7NLJMBR0YH2Qaaiax6RmFIP8pq0/cQH7
	rAjpCvOkCaw1RQ972sv70EsayaJ0kpsUKQEm65kj6gE4j9It/4u/yGDaX0ViK/1Q
X-Gm-Gg: AZFdTZe+0nNZzCY+BvIDO1nK7hhJsUrPxxxCVVkWHdBPa9SaDG+NhrfBLNbObeC+LUk
	cqIzBFN8g3xQkbDU5odbTFsfqU9+7ddxTmKLJ4kYdlwIxJp3c96jtEdUJzUw4jQNeNbm+wdLgZo
	TdLGkHDi3NsumZNDigz/lY9R/FSMdvNOwneNiGEiIlcxSLhY2HDuamWV/SDpD7s+Uexc6HJlKf5
	oC/7tsfEUTC+u4duFqZCCoPA6ME5u6mBDsW5nRFwKaQNFoQuj+9a0pO9WRtU4bFR78CQEJetnED
	Dn2YJFRyfdaEYH76uxpmeLc6L7oN+7BDKS9D6ZcrMtQ+rPUN43TPZDB2BUl3sftrjBK9drOKim0
	fGX8JExAsq/APklzZs0qBVrT990Q2luOcMwXxInMKnQmkiqX3WPA42Uzmjz2VVvl8Jh4BGysRKm
	onx2+7ZnC8Mz+JJQK2J2N9wnLNJ7bT86jMv0OetUfqh1wbs8lBnzCfU7QV9CNfqBdtBkk8LRCYe
	5hhTU3wzIUW67UnAJqscFgrmiQ2UG3PKOG4+47pPOVAPCHbZvuyd9PnsPQnbOxqUCVXgVNmPNw6
	+SAHODltEgheXefmRbdVjDVnolsT38w9unnHpXKTdtX5pPtIvF43Plarg0cB+WsUbuo9awcBUKH
	OjsL3Hx5w8yqCaF93yKhg9Sbe5OrU9gZubRq75Hrz4LYI0i+dL5W4JqOMnalnevD4ZB+FT8YJIF
	Pg8Mv+so3w0Nux+jqtXrdprIKeColGlB46XfC8rAcE5uUXULNb1vDQry1VUwINGIK6eS78ejMX4
	ompGTJ5TM4xhBohvQhuD/lkL9H6akG6Lv7xwXFa28Eocelyc25L81o+J8V1dQHqA+/RwunZl+Y5
	Jbcx
X-Received: by 2002:a05:7301:4309:b0:385:fa10:ee3d with SMTP id 5a478bee46e88-385fa10eefemr21937832eec.19.1795752833276;
        Thu, 26 Nov 2026 20:13:53 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm70674179eec.6.2026.11.26.20.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:13:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 31/39] taisei: upgrade 1.4.4 -> 1.4.6
Date: Thu, 26 Nov 2026 20:13:35 -0800
Message-ID: <20261127041343.1772294-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041343.1772294-1-khem.raj@oss.qualcomm.com>
References: <20261127041343.1772294-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:14:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133201
Content-Type: text/plain; charset="utf-8"

1.4.5 and 1.4.6 add i18n support (gettext-style translations, language
option, French, German and Chinese translations), a new stage and
spell practice menu, improved text line wrapping, a built-in zip
loader replacing libzip, optional libpng, and many renderer, VFS and
resource fixes. The build now requires meson >= 1.8, SDL >= 3.4,
libunibreak and gettext tools.

Drop both backported patches (const qualifiers in char pointers, and
vfs_mkparents recursion): their fixes are in 1.4.6. Add libunibreak and
gettext-native to DEPENDS. COPYING moved to COPYING.txt.

License-Update: COPYING renamed to COPYING.txt, copyright years updated
to 2026

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ed-const-qualifiers-in-char-pointer-.patch | 56 ---------------
 ...necessary-recursion-in-vfs_mkparents.patch | 71 -------------------
 .../{taisei_1.4.4.bb => taisei_1.4.6.bb}      | 11 ++-
 3 files changed, 5 insertions(+), 133 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-misc-fix-discarded-const-qualifiers-in-char-pointer-.patch
 delete mode 100644 meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-vfs-avoid-unnecessary-recursion-in-vfs_mkparents.patch
 rename meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/{taisei_1.4.4.bb => taisei_1.4.6.bb} (81%)

diff --git a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-misc-fix-discarded-const-qualifiers-in-char-pointer-.patch b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-misc-fix-discarded-const-qualifiers-in-char-pointer-.patch
deleted file mode 100644
index 1b37633a36..0000000000
--- a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-misc-fix-discarded-const-qualifiers-in-char-pointer-.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From d0326cd89b01600a6d8ba5e32e8e090f2ea29f2d Mon Sep 17 00:00:00 2001
-From: Khem Raj <khem.raj@oss.qualcomm.com>
-Date: Wed, 15 Apr 2026 16:28:28 -0700
-Subject: [PATCH] misc: fix discarded const qualifiers in char pointer
- assignments
-
-These show up with glibc 2.43 + clang-22, glibc-2.43 has C23 versions
-of str* mem* functions
-
-Upstream-Status: Backport [https://github.com/taisei-project/taisei/commit/1c8f773912cbbd72b4a4df271fda1bd6d2aeb27f]
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- src/log.c           | 2 +-
- src/pixmap/pixmap.c | 2 +-
- src/vfs/pathutil.c  | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/log.c b/src/log.c
-index 8194535a..88f34386 100644
---- a/src/log.c
-+++ b/src/log.c
-@@ -161,7 +161,7 @@ static void add_debug_info(StringBuffer *buf) {
- static size_t modname(const char *filename, size_t filename_len, char *mod) {
- 	size_t mlen = filename_len;
-
--	char *dot = memchr(filename, '.', mlen);
-+	const char *dot = memchr(filename, '.', mlen);
- 	if(dot) {
- 		mlen = dot - filename;
- 	}
-diff --git a/src/pixmap/pixmap.c b/src/pixmap/pixmap.c
-index 25105215..9717f22a 100644
---- a/src/pixmap/pixmap.c
-+++ b/src/pixmap/pixmap.c
-@@ -49,7 +49,7 @@ void *pixmap_alloc_buffer_for_conversion(const Pixmap *src, PixmapFormat format,
- }
-
- static PixmapFileFormatHandler *pixmap_handler_for_filename(const char *file) {
--	char *ext = strrchr(file, '.');
-+	const char *ext = strrchr(file, '.');
-
- 	if(!ext || !*(++ext)) {
- 		return NULL;
-diff --git a/src/vfs/pathutil.c b/src/vfs/pathutil.c
-index f6bd6a80..85ccf5ee 100644
---- a/src/vfs/pathutil.c
-+++ b/src/vfs/pathutil.c
-@@ -14,7 +14,7 @@ char *vfs_path_normalize(const char *path, char *out) {
- 	const char *p = path;
- 	char *o = out;
- 	char *last_sep = out - 1;
--	char *path_end = strchr(path, 0);
-+	const char *path_end = strchr(path, 0);
-
- 	#define IS_SEP_OR_NUL(chr) (VFS_IS_PATH_SEPARATOR(chr) || (chr == '\0'))
-
diff --git a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-vfs-avoid-unnecessary-recursion-in-vfs_mkparents.patch b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-vfs-avoid-unnecessary-recursion-in-vfs_mkparents.patch
deleted file mode 100644
index 9f5d7a17d4..0000000000
--- a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-vfs-avoid-unnecessary-recursion-in-vfs_mkparents.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From c9c00a88c10db4ce93ffcc043c661727d2ec9758 Mon Sep 17 00:00:00 2001
-From: laochailan <239670+laochailan@users.noreply.github.com>
-Date: Fri, 13 Feb 2026 20:21:44 -0500
-Subject: [PATCH] vfs: avoid unnecessary recursion in vfs_mkparents
-
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
-Upstream-Status: Backport [https://github.com/taisei-project/taisei/commit/f2e074f4a6aecf78b980014ed98f12fc6ddfd016]
----
- src/vfs/public.c | 43 +++++++++++++++++--------------------------
- 1 file changed, 17 insertions(+), 26 deletions(-)
-
-diff --git a/src/vfs/public.c b/src/vfs/public.c
-index abaa050f..cfeef83a 100644
---- a/src/vfs/public.c
-+++ b/src/vfs/public.c
-@@ -146,38 +146,29 @@ void vfs_mkdir_required(const char *path) {
- 	}
- }
-
--static bool vfs_mkparents_recurse(const char *path) {
--	// FIXME this has stupid space complexity and is probably silly in general; optimize if you care
--
--	char *psep = strrchr(path, VFS_PATH_SEPARATOR);
--
--	if(!psep) {
--		// parent is root
--		return true;
--	}
-+bool vfs_mkparents(const char *path) {
-+	char p[strlen(path)+1];
-+	path = vfs_path_normalize(path, p);
-
--	char p[strlen(path) + 1];
--	strcpy(p, path);
--	psep += p - path;
--	*psep = 0;
-+	// loop over all parent directories
-+	char *psep = p;
-+	while((psep = strchr(psep, VFS_PATH_SEPARATOR))) {
-+		*psep = 0;
-
--	VFSInfo i = vfs_query(p);
-+		VFSInfo i = vfs_query(p);
-+		if(i.error) {
-+			return false;
-+		}
-
--	if(i.error) {
--		return false;
--	}
-+		if(!i.exists || !i.is_dir) {
-+			vfs_mkdir(p);
-+		}
-
--	if(i.exists) {
--		return i.is_dir;
-+		*psep = VFS_PATH_SEPARATOR;
-+		psep++;
- 	}
-
--	return vfs_mkparents_recurse(p) && vfs_mkdir(p);
--}
--
--bool vfs_mkparents(const char *path) {
--	char p[strlen(path)+1];
--	path = vfs_path_normalize(path, p);
--	return vfs_mkparents_recurse(p);
-+	return true;
- }
-
- char* vfs_repr(const char *path, bool try_syspath) {
diff --git a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.4.bb b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.6.bb
similarity index 81%
rename from meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.4.bb
rename to meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.6.bb
index c099619124..2d39088c34 100644
--- a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.4.bb
+++ b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.6.bb
@@ -7,12 +7,14 @@ DESCRIPTION = "Taisei Project is an open source fan-game set in the world of \
 HOMEPAGE = "https://taisei-project.org"
 BUGTRACKER = "https://github.com/taisei-project/taisei/issues"
 LICENSE = "CC-BY-4.0 AND CC0-1.0 AND MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1a11ffd7e1bdd1d3156cecec60a2846f"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=23a03cac0907277013b7af25f8ed1494"
 
 DEPENDS = "\
     cglm \
     freetype \
+    gettext-native \
     libsdl3 \
+    libunibreak \
     libwebp \
     opusfile \
     zstd \
@@ -20,11 +22,8 @@ DEPENDS = "\
 DEPENDS:append:libc-musl = " libucontext"
 LDFLAGS:append:libc-musl = " -lucontext"
 
-SRC_URI = "gitsm://github.com/taisei-project/taisei.git;branch=v1.4.x;protocol=https;tag=v${PV} \
-           file://0001-misc-fix-discarded-const-qualifiers-in-char-pointer-.patch \
-		   file://0001-vfs-avoid-unnecessary-recursion-in-vfs_mkparents.patch \
-		  "
-SRCREV = "6a484e6e61cc51a22a9943762dc2ff6883914f38"
+SRC_URI = "gitsm://github.com/taisei-project/taisei.git;branch=v1.4.x;protocol=https;tag=v${PV}"
+SRCREV = "5bfc9b842fe6d9bb8d1610f76f442ba07c72c4cf"
 
 UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 
