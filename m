Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5A6E9D80C
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 15:39:49 +0000 (UTC)
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37046.1775403585985017238
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2026 08:39:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kgdP1cXt;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-126ea4e9694so7030436c88.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 08:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775403585; x=1776008385; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3wWymsKv6nQoc45Wy515Qfr+mBELcP92P+q0J7YI3Y=;
        b=kgdP1cXtWEUmN/X2jGNdYDWzo8Ta6aKGVARmc0mYyAGJfL629xsO9MOb6xrcu4MmRs
         Z5qSFl48ELcadKE9ZBQ70FVxpk8xxelX0jorVeW7vHhDgJIbMtYqqwp6aVrtKDLeNUiY
         isgyNfl+pl3DlqgUPuJKcWiOHAIDmk15gYi23gxnNKrJo4RCtnmmphREMDJLIhR99zQl
         c2YI23DIj2XosuMOSDB8IxdzfVlyC9sHv65NsZIbUKouYQbQP1XUBqJIMaL5fmZsvHVZ
         1UoGzf16fZUfgSmw30pp0svUwfBW0SU3nQ7fu9qeUIbb3xs6Ci6MPBgNvb9WwdChm3Tu
         jNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775403585; x=1776008385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j3wWymsKv6nQoc45Wy515Qfr+mBELcP92P+q0J7YI3Y=;
        b=cKF3ciWPtnubs0rPz3xknKBlm/sUPjYcDeR1B/GRU3auvMlRX/K4CjRaLiJVnyePYn
         RmuvgDzl1Z/eFZxRlyQYmA9rwF+7+Xuc54bEzGHxZkfPytOhmG0Y4mYE7kSwRG2I33dI
         jkcOHXYIVdZLYX9DZZdP2LymJYJgi/BON4Ju/MmtpaWzbZHB/ic/7q08tPaflyc6lLmP
         DLbjRlmr2GAzgX4RrSiEvaPaoTdkY8ZOXLKaR+UD/XaAKCaYHdCL4QAdwpVL+O/4oNx6
         YNNPprvUhglzuDTawch7O5wFfAs6yKkkOnCCgH93D7RAqHxyRQiX/6uBNdzeRAVjAjm8
         1sfw==
X-Gm-Message-State: AOJu0YytQWy9m7TYdrzwJPlsJkXpFopRD4uqQdYjhrmbTrmCcqZxRITD
	9bGur8Gy18vd9nii9rt1ZT/pHGnPqex5N7sAmia7Ad4Zy4Pv0X9+pAyZWgEmiA==
X-Gm-Gg: AeBDiesCsWbz2SKwVm0LmOZJyjyzu0sZ+4KhGnRwCl7a+9PKfUMa9HgJ2Gm+Pt1I/OK
	9NdUuQQsyT/N4wKZk21Rpq8C2bZQAVlp3T1Dt66Vh8sNJvd1ZYaYIO/LXpw5flhnzkdo0wdwpJ/
	TFjhLwIvdc/flxiV256yhkryF19T5V5sTa5UkqX6J+lpg9FaBV/6adxr6TXIMlLz0glYcoKWF1o
	BkBRiB152snB+aTy1tSyoU4QNl9CHmqiaQeHqm/TA5Wu81y1XIUYdI0xcoe5JIFExd9nf0OGLlH
	YNLVpyCDDGfvQcB2nJ6jsg8U6gSJ1qay0oScZ5LyHPEZCV5pzItwJG9tTwDmf1b29CPUd47IThY
	dplW2X/EP0p6ajkNsAcqdgrUNz+7ICCrBiXypZRdEDh9Bil/Vhylrd8yS4JivCFcThtt8d5Oxse
	dmTq8vb6qBtOqQLUDgC+6zNZGMQ8eWngOpTL9HVkd6wLv+m6wSYla4x2xQcMaP11/PDsdQTrS1B
	2j2hM3+MmkaCojP2xPEqO1c+SMybgDmhvMHNW4DY6txrtpoJT9Wq34g4c82
X-Received: by 2002:a05:7300:6ca1:b0:2be:2953:fd74 with SMTP id 5a478bee46e88-2cbfa4c471amr4900368eec.14.1775403584855;
        Sun, 05 Apr 2026 08:39:44 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ce39d13decsm3298121eec.8.2026.04.05.08.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 08:39:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 3/3] libgphoto2: Fix c23 build errors
Date: Sun,  5 Apr 2026 08:39:36 -0700
Message-ID: <20260405153936.1093103-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260405153936.1093103-1-khem.raj@oss.qualcomm.com>
References: <20260405153936.1093103-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 15:39:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126018

Fixes errors e.g.

error: assigning to 'char *' from 'const char *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
  131 |         dot = strrchr(filename, '.');
      |             ^ ~~~~~~~~~~~~~~~~~~~~~~
1 error generated.

They are latent and brought to fore with autoconf 2.73 which switches
defaults to use -std=gnu23

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...fix-const-correctness-for-c23-builds.patch | 84 +++++++++++++++++++
 .../gphoto2/libgphoto2_2.5.33.bb              |  1 +
 2 files changed, 85 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/0001-libgphoto2-fix-const-correctness-for-c23-builds.patch

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/0001-libgphoto2-fix-const-correctness-for-c23-builds.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/0001-libgphoto2-fix-const-correctness-for-c23-builds.patch
new file mode 100644
index 0000000000..9ded174095
--- /dev/null
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2/0001-libgphoto2-fix-const-correctness-for-c23-builds.patch
@@ -0,0 +1,84 @@
+From bfa786a260bfd4660e8186ebad8778718e85e8cd Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sat, 4 Apr 2026 14:56:01 -0700
+Subject: [PATCH] libgphoto2: fix const-correctness for c23 builds
+
+C23 treats the return values of strrchr() and strchr() as const char *
+when the input string is const-qualified. Update local variables to use
+const char * where appropriate to avoid discarded-qualifier warnings and
+build failures with -std=gnu23.
+
+No functional change intended.
+
+Upstream-Status: Submitted [https://github.com/gphoto/libgphoto2/pull/1235]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ camlibs/directory/directory.c         | 2 +-
+ libgphoto2/gphoto2-file.c             | 6 +++---
+ libgphoto2/gphoto2-filesys.c          | 2 +-
+ packaging/generic/print-camera-list.c | 2 +-
+ 4 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/camlibs/directory/directory.c b/camlibs/directory/directory.c
+index 790405d54..cc63c6684 100644
+--- a/camlibs/directory/directory.c
++++ b/camlibs/directory/directory.c
+@@ -125,7 +125,7 @@ static const char *
+ get_mime_type (const char *filename)
+ {
+
+-	char *dot;
++	const char *dot;
+ 	int x=0;
+
+ 	dot = strrchr(filename, '.');
+diff --git a/libgphoto2/gphoto2-file.c b/libgphoto2/gphoto2-file.c
+index 04d4d5e3e..1a9dbc193 100644
+--- a/libgphoto2/gphoto2-file.c
++++ b/libgphoto2/gphoto2-file.c
+@@ -610,7 +610,7 @@ int
+ gp_file_open (CameraFile *file, const char *filename)
+ {
+ 	FILE *fp;
+-	char *name, *dot;
++	const char *name, *dot;
+ 	long size, size_read;
+ 	int  i;
+ 	struct stat s;
+@@ -906,8 +906,8 @@ gp_file_get_name (CameraFile *file, const char **name)
+ int
+ gp_file_get_name_by_type (CameraFile *file, const char *basename, CameraFileType type, char **newname)
+ {
+-	char *prefix = NULL, *s, *new, *slash = NULL;
+-	const char *suffix = NULL;
++	char *prefix = NULL, *new;
++	const char *suffix = NULL, *s, *slash = NULL;
+ 	int i;
+
+ 	C_PARAMS (file && basename && newname);
+diff --git a/libgphoto2/gphoto2-filesys.c b/libgphoto2/gphoto2-filesys.c
+index 45f957292..07decff24 100644
+--- a/libgphoto2/gphoto2-filesys.c
++++ b/libgphoto2/gphoto2-filesys.c
+@@ -521,7 +521,7 @@ append_to_folder (CameraFilesystemFolder *folder,
+ 	CameraFilesystemFolder **newfolder
+ ) {
+ 	CameraFilesystemFolder	*f;
+-	char	*s;
++	const char	*s;
+
+ 	GP_LOG_D ("Append to folder %p/%s - %s", folder, folder->name, foldername);
+ 	/* Handle multiple slashes, and slashes at the end */
+diff --git a/packaging/generic/print-camera-list.c b/packaging/generic/print-camera-list.c
+index 1707b4e87..44530b4ae 100644
+--- a/packaging/generic/print-camera-list.c
++++ b/packaging/generic/print-camera-list.c
+@@ -1138,7 +1138,7 @@ escape_html(const char *str) {
+ 	newstr = malloc(strlen(str)+1+inc);
+ 	s = str; ns = newstr;
+ 	do {
+-		char *x;
++		const char *x;
+ 		x = strchr(s,'&');
+ 		if (x) {
+ 			memcpy (ns, s, x-s);
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
index 6b5e6c21b9..3644bd9bf4 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
@@ -12,6 +12,7 @@ DEPENDS = "libtool jpeg virtual/libusb0 libexif zlib libxml2"
 SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.xz;name=libgphoto2 \
            file://40-libgphoto2.rules \
            file://0001-configure-Filter-out-buildpaths-from-CC.patch \
+		   file://0001-libgphoto2-fix-const-correctness-for-c23-builds.patch \
 "
 SRC_URI[libgphoto2.sha256sum] = "28825f767a85544cb58f6e15028f8e53a5bb37a62148b3f1708b524781c3bef2"


