Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66456C25B74
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 09:31:49 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.6142.1715247100882790128
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 May 2024 02:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lDK92tPJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-41c1b75ca31so4881645e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 02:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715247099; x=1715851899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVlgGQe1ZCQ0ll2tuGkFfOksYDiEFx8DeUh8kToZleM=;
        b=lDK92tPJpMaOwV4bztBoH273+AtzOvUfiMMiQHefsXojxujZ5VrIJKRN9cangsGneJ
         nmqc4fKGdHz+HXOrdA1qKNI96gXNYk4/BEhXlo0l6DZb6UwZaV9i1CynZ0aQDFWm38aS
         X6QE0yLYRRnPKpC9YZHIWfn85I5djhLPM2wwqka8g65oiLl900lBegFeLqzanUbWUML+
         ItD77LwDudtw1q9/ne/HYDgtoThikJuiwhEc9XtUNs6NxOgFAxhdbSTsVmVYF44dns4Z
         BPzniEDFwrUTf8BizKKgduyltwN43tI9hDnL9MTw6kv1suSnASd9qRM4zijm+sUutEw7
         J+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715247099; x=1715851899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVlgGQe1ZCQ0ll2tuGkFfOksYDiEFx8DeUh8kToZleM=;
        b=JQUHxkeNyHrH9oKQEmBMHi6F9qs9EdkDrnnm82BhMhM99l5WTbBoZuus9HlaCs4SZ+
         UYguu61SfXZ2JlagqvX6kfCldYpfn7HJHFcP4qC5H69H+RNI8mzg7QNA7dM+A/7Fki+G
         IkRTI3AvRClVFKa9GAH4I3dW9EdsNpvR5OzKTmoGkWF/iJuN5Xp+YPDiSewBg90HpfxX
         livqDmGzlhBunOL4yVJS6YxPeJmvxjzROp5FyLoQz2WVS+muWQx3bH/4hZMO0DHL1n8o
         SpQkmEEM94INPPSLQyL6mZGEF/FZAAGH44E5JCt7/L0GZFnaaDX+RqgWp1CLOUsLH49S
         brew==
X-Gm-Message-State: AOJu0YxyntljiEqWjHuN1uWiKz11MDNJpo/mwXJP2VAfJnpDCHGMgtGs
	bMoh1m8IYlv8F6dE/glLexti9jzwW6CZGiBSzGjD83l8ggIw2Jj3/GYNYg==
X-Google-Smtp-Source: AGHT+IECUwaalyRequKZFjJbLdUVYxDbKIHJJLAMyPczYnsI8B+pMML5b7dwtm1KIS+DN2JXIoVH7w==
X-Received: by 2002:a05:600c:198d:b0:41a:6229:396b with SMTP id 5b1f17b1804b1-41f71cd12b6mr44834045e9.10.1715247098723;
        Thu, 09 May 2024 02:31:38 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f42e74625sm62391655e9.0.2024.05.09.02.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 02:31:38 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [oe][master][scarthgap][PATCH 4/5] composefs: bump ecef20c1
Date: Thu,  9 May 2024 10:31:25 +0100
Message-ID: <20240509093126.503764-4-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240509093126.503764-1-jose.quaresma@foundries.io>
References: <20240509093126.503764-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 09:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110289

- This is required to add the native target support.

- Drop upstream merged patch:
0001-musl-basename-use-portable-implementation-for-basena.patch
https://github.com/containers/composefs/pull/273

Changelog:

$ git --no-pager log --oneline HEAD...v1.0.3
ecef20c (HEAD -> main, origin/main, origin/HEAD) Merge pull request #276 from wahtari/copy_file_range
e78c7a4 Merge pull request #277 from alexlarsson/fix-newline-error
1d82bc1 mkcomposefs: Drop newline from error string
3e38d73 Added copy_file_range for faster file copy.
85a693d Merge pull request #273 from fboudra/musl-basename
31afa13 musl: basename: use portable implementation for basename API
4776580 Merge pull request #275 from eriksjolund/fix-spelling-in-error-message
4a68a42 Merge pull request #269 from wahtari/threading-for-mkcomposefs
7266546 fuse: fix spelling in error message
b49499b added threads in mkcomposefs for digest calculation and file copy
d144db0 refactored lcfs_load_node_from_file to enable multi-threading in mkcomposefs
af69922 Merge pull request #266 from eriksjolund/erofs-add-missing-free
1eecf38 Merge pull request #267 from eriksjolund/mkcomposefs-add-missing-free
a880713 mkcomposefs: Add missing free()
456d618 erofs: Add missing free() and lcfs_node_unref()
1179638 Merge pull request #265 from eriksjolund/handle-empty-basedir-option
301b78f Merge pull request #268 from eriksjolund/set-errno-for-unknown-format
09ca740 writer: Set errno for unknown format
a96f786 mountcomposefs: Handle empty basedir option
fc9a526 Merge pull request #260 from eriksjolund/handle-error-from-build-node
9b85011 Merge pull request #262 from eriksjolund/add-error-check-and-rearrange
2cb505b Merge pull request #263 from eriksjolund/writer-set-errno
9b417be writer: Set errno
d5ffbeb Merge pull request #261 from eriksjolund/add-missing-node-unref
9c393a4 Merge pull request #259 from eriksjolund/handle-error-from-node-set-content
396a3b8 mkcomposefs: Handle NULL from lcfs_node_new()
238a94a lib: Set errno in lcfs_node_new()
c1181fa erofs: Handle error from lcfs_build_node_from_image()
49288d5 erofs, mkcomposefs: Handle error from lcfs_node_set_content()
4e0b147 lib: Add missing lcfs_node_unref()
9bc76dd Merge pull request #258 from eriksjolund/fix-missing-options
d59dd9b mountcomposefs, mkcomposefs: Add missing options to usage information
418f4f7 Merge pull request #255 from cgwalters/mount-minor-tweaks
72c602a Merge pull request #256 from eriksjolund/fix-error-message
770cc36 fuse: Fix filepath argument in error message
465c079 man/mount.composefs: Fix a typo and two markdown lint warnings
8565a8b Merge pull request #254 from edbaunton/edbaunton/man-mkcomposefs-inline
b99a978 man mkcomposefs: detail inlining logic
47f6949 Merge pull request #253 from rborn-tx/support-older-linux-headers
453eaef ci: Add build test for Ubuntu Focal
384f306 mount: Allow building when macro LOOP_CONFIGURE is not available
f163eba mount: Allow building when macro MOUNT_ATTR_IDMAP is not available
80e99bd Merge pull request #250 from cgwalters/doc-verification
f6e8510 README.md: Fix markdownlint warnings
3b7e567 README.md: Drop removed `signed` mount option
091b51f Merge pull request #247 from cgwalters/readlinkat-overflow
232336d Merge pull request #248 from cgwalters/more-analyzer
a6904d6 writer: Close mmap leak
e9632ca Merge pull request #246 from eriksjolund/handle-null-from-strndup
6b2192b writer: Fix (almost certainly unreachable) overflow
bdc2c4c mkcomposefs: Handle NULL from strndup()
e63786d Merge pull request #245 from giuseppe/run-distcheck-ci
5d3fe92 tests: do not hardcode number of threads
d6e55bf .github: run make distcheck as part of the CI
f6bbf54 Merge pull request #244 from alexlarsson/mount-api
4e5883b mount.composefs: Add tryverity option
15bdcd6 lib: Add TRY_VERITY mount option
f884f57 mount: Use the new lowerdir+ and datadir+ options
bd6ce95 Merge pull request #243 from giuseppe/add-fuzzing
171eae0 mkcompose: fix crash if no target for hardlink
7b1518f mkcomposefs: tree_from_dump does not exit(2) on errors
a8ac3d5 mkcomposefs: reject dump without root node
28a9d6b tests: add fuzzing tests for mkcomposefs
932f748 tools: add fuzzing entrypoint for mkcomposefs

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../composefs/composefs_1.0.3.bb              |  8 +-
 ...e-portable-implementation-for-basena.patch | 75 -------------------
 2 files changed, 3 insertions(+), 80 deletions(-)
 delete mode 100644 meta-oe/recipes-support/composefs/files/0001-musl-basename-use-portable-implementation-for-basena.patch

diff --git a/meta-oe/recipes-support/composefs/composefs_1.0.3.bb b/meta-oe/recipes-support/composefs/composefs_1.0.3.bb
index 76c85ce93..5d4fa9c31 100644
--- a/meta-oe/recipes-support/composefs/composefs_1.0.3.bb
+++ b/meta-oe/recipes-support/composefs/composefs_1.0.3.bb
@@ -13,11 +13,9 @@ LIC_FILES_CHKSUM = "\
     file://LICENSE.Apache-2.0;md5=3b83ef96387f14655fc854ddc3c6bd57 \
 "
 
-SRCREV = "2d5cdcb9176cfe4ccf1761ef6d78e1c48de35649"
-SRC_URI = "\
-    git://github.com/containers/composefs.git;protocol=https;branch=main \
-    file://0001-musl-basename-use-portable-implementation-for-basena.patch \
-"
+PV .= "+git${SRCPV}"
+SRCREV = "ecef20c18c81943bd17b489ad1484f361b99c792"
+SRC_URI = "git://github.com/containers/composefs.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-support/composefs/files/0001-musl-basename-use-portable-implementation-for-basena.patch b/meta-oe/recipes-support/composefs/files/0001-musl-basename-use-portable-implementation-for-basena.patch
deleted file mode 100644
index 49a0b21c6..000000000
--- a/meta-oe/recipes-support/composefs/files/0001-musl-basename-use-portable-implementation-for-basena.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From b21a9d4f10a066cac76bb345d31fdd24afcf3e6f Mon Sep 17 00:00:00 2001
-From: Fathi Boudra <fathi.boudra@linaro.org>
-Date: Tue, 9 Apr 2024 08:47:37 +0200
-Subject: [PATCH] musl: basename: use portable implementation for basename API
-
-musl has removed the non-prototype declaration of basename from string.h which
-now results in build errors with newer clang compilers.
-
-Implement GNU basename behavior using strchr which is portable across libcs.
-
-Fixes:
-| ../../git/tools/mountcomposefs.c:43:20:
-| error: call to undeclared function 'basename'; ISO C99 and later do not
-| support implicit function declarations [-Wimplicit-function-declaration]
-|    43 |         const char *bin = basename(argv0);
-|       |                           ^
-| ../../git/tools/mountcomposefs.c:43:14:
-| error: incompatible integer to pointer conversion initializing 'const char *'
-| with an expression of type 'int' [-Wint-conversion]
-|    43 |         const char *bin = basename(argv0);
-|       |                     ^     ~~~~~~~~~~~~~~~
-
-For reference:
-https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
-
-Closes: https://github.com/containers/composefs/issues/272
-
-Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
-
-Upstream-Status: Submitted [https://github.com/containers/composefs/pull/273]
----
- libcomposefs/lcfs-utils.h |    6 ++++++
- tools/mkcomposefs.c       |    2 +-
- tools/mountcomposefs.c    |    3 ++-
- 3 files changed, 9 insertions(+), 2 deletions(-)
-
---- a/tools/mountcomposefs.c
-+++ b/tools/mountcomposefs.c
-@@ -37,10 +37,11 @@
- #include <linux/fsverity.h>
- 
- #include "libcomposefs/lcfs-mount.h"
-+#include "libcomposefs/lcfs-utils.h"
- 
- static void usage(const char *argv0)
- {
--	const char *bin = basename(argv0);
-+	const char *bin = gnu_basename(argv0);
- 	fprintf(stderr,
- 		"usage: %s [-t type] [-o opt[,opts..]] IMAGE MOUNTPOINT\n"
- 		"Example:\n"
---- a/libcomposefs/lcfs-utils.h
-+++ b/libcomposefs/lcfs-utils.h
-@@ -161,4 +161,10 @@ static inline void *steal_pointer(void *
- /* type safety */
- #define steal_pointer(pp) (0 ? (*(pp)) : (steal_pointer)(pp))
- 
-+static inline const char *gnu_basename(const char *filename)
-+{
-+	const char *p = strrchr(filename, '/');
-+	return p ? p+1 : filename;
-+}
-+
- #endif
---- a/tools/mkcomposefs.c
-+++ b/tools/mkcomposefs.c
-@@ -315,7 +315,7 @@ static int fill_store(struct lcfs_node_s
- 
- static void usage(const char *argv0)
- {
--	const char *bin = basename(argv0);
-+	const char *bin = gnu_basename(argv0);
- 	fprintf(stderr,
- 		"Usage: %s [OPTIONS] SOURCE IMAGE\n"
- 		"Options:\n"
-- 
2.45.0


