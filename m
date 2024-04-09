Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB552C67861
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:54:58 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.131380.1712649290620525948
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:54:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=nzHI+Vj/;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: fathi.boudra@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-516d09bd434so5574174e87.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Apr 2024 00:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712649288; x=1713254088; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mtP0j68Gk1KwN2D89MonWQwMH0UvXQQ7DyiESxk+RQY=;
        b=nzHI+Vj/5WzbDrWk0GozOPAy6lzphKJ12TuxIjr9RAdDx6wDruOGWLNt6TlAEksa7q
         DpGmjGM/g37k9XyaeGlHnQ6lXN85IMkK2BqXY25ukWMRC66sJCP8Vg8kVHqtWbN6KTY0
         iI3PV2oLQtWe9HmrImqGon2Icr8rqeci9LPXJ5Q+e2v338r43AVbkATc556KTDfrq7QT
         j6LHKRrYj22w5A04aIeAZEk6JAAB9N9LMTR2hNdJPSK226x2H1PSjC0HKJf5iEmd4hJB
         FoSgJ/sLs12faXi8bn/PFrez9Pvq+e/gVJBj7zjsJeG0KxOVjnAsbIhSxtTaRWWUbL+H
         SK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712649288; x=1713254088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mtP0j68Gk1KwN2D89MonWQwMH0UvXQQ7DyiESxk+RQY=;
        b=Yzy0wKU0U46rITjjBq88VgqVfqyMW1ioTOx7kqNLKnKNfwGIue8h0q4R9/ARm4kKEd
         URNOxIN2RoVKuWFQm9q2yrz+1sXY7CoPfDNhfNghKjBtuWQo8Amj56VxuBcqoBHpYos5
         kL+TyKzZst2tKtQ3KPyF5pt5qv4csctMzUZ76fXwVk9q/DuHP8GH90gydfXqFrk4Zv1t
         UoKSalQzytOB64/DH/NhaM5brQ2y68keqxVD3PfHZZaLdrzUWQN2VBz4NfFU5XQnljyn
         G0Lsi1Bc8Sq9S1+7sAgpi8QwMo65TI0v3qz865+AT3QHOC/TjqNAztzIYAE37e/T7ahA
         Nh5A==
X-Gm-Message-State: AOJu0YzCkLSId+8nzJe0KfSsVtwLPFRINAsP/J7jSMmoWaF5LYKy9i96
	ZFZkQzOR/XufcWWj+4z0sxsRPr2ccGhjL2V1RAYk8Plms2Xae5WHTNaQHH+dmYDbJj8XeGqvz7O
	8LV8=
X-Google-Smtp-Source: AGHT+IGBran8fAE4lGEkC/fz+SRKdRhqA4ub/f+S4RFpCadGLP/+tAV6FL7oS6ReEJNeLnhyKSK5Nw==
X-Received: by 2002:a05:6512:ac5:b0:515:c195:d6b8 with SMTP id n5-20020a0565120ac500b00515c195d6b8mr8807050lfu.60.1712649288206;
        Tue, 09 Apr 2024 00:54:48 -0700 (PDT)
Received: from corsair.. (88-169-167-85.subs.proxad.net. [88.169.167.85])
        by smtp.gmail.com with ESMTPSA id cg6-20020a5d5cc6000000b00345e730aa7csm2951418wrb.11.2024.04.09.00.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 00:54:47 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [PATCH] [oe][meta-filesystem][PATCH v2] composefs: add a new recipe
Date: Tue,  9 Apr 2024 09:54:44 +0200
Message-ID: <20240409075444.27196-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Apr 2024 07:54:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109876

Tools to handle creating and mounting composefs images

Flexible mechanism to support read-only mountable filesystem trees,
stacking on top of Linux filesystem.

It will allow to enable filesystem integrity by leveraging the stack:
ostree -> composefs -> fs-verity

For reference:
https://github.com/containers/composefs?tab=readme-ov-file#filesystem-integrity
https://ostreedev.github.io/ostree/composefs/#using-composefs-with-ostree

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---

Changes since v1:
 * move the recipe to meta-filesystem due to fuse3 dependency.
 * add a patch to support latest musl due to the basename function
   https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7

 .../composefs/composefs_1.0.3.bb              | 23 ++++++
 ...e-portable-implementation-for-basena.patch | 75 +++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 meta-filesystems/recipes-support/composefs/composefs_1.0.3.bb
 create mode 100644 meta-filesystems/recipes-support/composefs/files/0001-musl-basename-use-portable-implementation-for-basena.patch

diff --git a/meta-filesystems/recipes-support/composefs/composefs_1.0.3.bb b/meta-filesystems/recipes-support/composefs/composefs_1.0.3.bb
new file mode 100644
index 0000000000..7607b0a12c
--- /dev/null
+++ b/meta-filesystems/recipes-support/composefs/composefs_1.0.3.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Tools to handle creating and mounting composefs images"
+HOMEPAGE = "https://github.com/containers/composefs"
+LICENSE = "GPL-3.0-or-later & LGPL-2.0-or-later & Apache-2.0"
+LIC_FILES_CHKSUM = "\
+    file://BSD-2-Clause.txt;md5=121c8a0a8fa5961a26b7863034ebcce8 \
+    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+    file://COPYING.LESSERv3;md5=6a6a8e020838b23406c81b19c1d46df6 \
+    file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
+    file://COPYINGv3;md5=d32239bcb673463ab874e80d47fae504 \
+    file://LICENSE.Apache-2.0;md5=3b83ef96387f14655fc854ddc3c6bd57 \
+"
+DEPENDS = "fuse3 openssl"
+SRCREV = "2d5cdcb9176cfe4ccf1761ef6d78e1c48de35649"
+PV = "1.0.3"
+
+SRC_URI = "\
+    git://github.com/containers/composefs.git;protocol=https;branch=main \
+    file://0001-musl-basename-use-portable-implementation-for-basena.patch \
+"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
diff --git a/meta-filesystems/recipes-support/composefs/files/0001-musl-basename-use-portable-implementation-for-basena.patch b/meta-filesystems/recipes-support/composefs/files/0001-musl-basename-use-portable-implementation-for-basena.patch
new file mode 100644
index 0000000000..49a0b21c6e
--- /dev/null
+++ b/meta-filesystems/recipes-support/composefs/files/0001-musl-basename-use-portable-implementation-for-basena.patch
@@ -0,0 +1,75 @@
+From b21a9d4f10a066cac76bb345d31fdd24afcf3e6f Mon Sep 17 00:00:00 2001
+From: Fathi Boudra <fathi.boudra@linaro.org>
+Date: Tue, 9 Apr 2024 08:47:37 +0200
+Subject: [PATCH] musl: basename: use portable implementation for basename API
+
+musl has removed the non-prototype declaration of basename from string.h which
+now results in build errors with newer clang compilers.
+
+Implement GNU basename behavior using strchr which is portable across libcs.
+
+Fixes:
+| ../../git/tools/mountcomposefs.c:43:20:
+| error: call to undeclared function 'basename'; ISO C99 and later do not
+| support implicit function declarations [-Wimplicit-function-declaration]
+|    43 |         const char *bin = basename(argv0);
+|       |                           ^
+| ../../git/tools/mountcomposefs.c:43:14:
+| error: incompatible integer to pointer conversion initializing 'const char *'
+| with an expression of type 'int' [-Wint-conversion]
+|    43 |         const char *bin = basename(argv0);
+|       |                     ^     ~~~~~~~~~~~~~~~
+
+For reference:
+https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
+
+Closes: https://github.com/containers/composefs/issues/272
+
+Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
+
+Upstream-Status: Submitted [https://github.com/containers/composefs/pull/273]
+---
+ libcomposefs/lcfs-utils.h |    6 ++++++
+ tools/mkcomposefs.c       |    2 +-
+ tools/mountcomposefs.c    |    3 ++-
+ 3 files changed, 9 insertions(+), 2 deletions(-)
+
+--- a/tools/mountcomposefs.c
++++ b/tools/mountcomposefs.c
+@@ -37,10 +37,11 @@
+ #include <linux/fsverity.h>
+ 
+ #include "libcomposefs/lcfs-mount.h"
++#include "libcomposefs/lcfs-utils.h"
+ 
+ static void usage(const char *argv0)
+ {
+-	const char *bin = basename(argv0);
++	const char *bin = gnu_basename(argv0);
+ 	fprintf(stderr,
+ 		"usage: %s [-t type] [-o opt[,opts..]] IMAGE MOUNTPOINT\n"
+ 		"Example:\n"
+--- a/libcomposefs/lcfs-utils.h
++++ b/libcomposefs/lcfs-utils.h
+@@ -161,4 +161,10 @@ static inline void *steal_pointer(void *
+ /* type safety */
+ #define steal_pointer(pp) (0 ? (*(pp)) : (steal_pointer)(pp))
+ 
++static inline const char *gnu_basename(const char *filename)
++{
++	const char *p = strrchr(filename, '/');
++	return p ? p+1 : filename;
++}
++
+ #endif
+--- a/tools/mkcomposefs.c
++++ b/tools/mkcomposefs.c
+@@ -315,7 +315,7 @@ static int fill_store(struct lcfs_node_s
+ 
+ static void usage(const char *argv0)
+ {
+-	const char *bin = basename(argv0);
++	const char *bin = gnu_basename(argv0);
+ 	fprintf(stderr,
+ 		"Usage: %s [OPTIONS] SOURCE IMAGE\n"
+ 		"Options:\n"
-- 
2.43.0


