Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8AEC05027
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 05:20:36 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.28058.1676784035778856167
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Feb 2023 21:20:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jGTpD3lX;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id o5so1663084wri.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 21:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0UZfCOozkEWIt7vIKzla4QTuG0geW55nM4D3U9z2Vkk=;
        b=jGTpD3lXYbpwkG/kjsU0hN5us+hb4HEoQDXabjIT/CvH+aAbq7ydqChVQcBXOLeiLT
         Y+z0ZZ3p/EbhD32E8arPsKH5rf5mdQfmX3k5fKsN8EncOD8pcFJi9oNu7eZQKCBe+dxm
         U87mfYpE0dBB8euCwwbih5wRatnoShaSc0KF9NViVS3FlfkpmBEIqkoqcr3co8r5UcOe
         X1aOfzyoR5Y/vZcjGxrQ+U6HTD22gaJzLeXCaGUtUX/w2VTLmu8uk7k5MBs3ePHLUGDS
         3SdDXBTERmlthNH+WWnUxkGocNgqckUzw+HWynWvEy7Cr3jSzAWsWIVIYIcJhjn/k/VT
         fcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0UZfCOozkEWIt7vIKzla4QTuG0geW55nM4D3U9z2Vkk=;
        b=gJbkTsw/4HenNDaYfuDTz4OHTbX3lTs85k2SsLcdxmqA3MmYgqLtSRU6ORkklGKKgA
         8csRI0z7nh+PsY4MCmqUJu7ShIVvs9kOsq5QcAE5v8ZQPq81CfzrzcGoLuzJSZEKkGNR
         nNdR19Hc23mJo6g8M9SdcQ2Io8EJKvacqRdSsq6swXZF3hups2QJgi9oM5wcfjSqqQ+O
         S/4xAYrnrXPRgQL0OdmZSGzRHQeAWOgAhWd8R/IrEl1wY490R9Z/f8dwmWtTetaUdX6s
         i6B2wj5wpBIgV+yFP1QWQ/GGWbNjYvly34lp9GszilJFTV6rzMHMjKan2QJbA9AqeN3D
         RaHQ==
X-Gm-Message-State: AO0yUKXkQKOzJN4slXWC4f1ehAek5iLrMEc6/rOBO/NNOkc9xBqVR9EL
	fHYmWyNP6/5pgMvYXRFZn7MlVYNz+68=
X-Google-Smtp-Source: AK7set/U8euO50/vrJzJ8FP1xwv4qaFUUm0HGrBl3kM57ixUCqGoVhu6JjCn6dAS0AZnT4hZgI98Uw==
X-Received: by 2002:a5d:6a42:0:b0:2c3:e5e6:f0d8 with SMTP id t2-20020a5d6a42000000b002c3e5e6f0d8mr666565wrw.11.1676784033669;
        Sat, 18 Feb 2023 21:20:33 -0800 (PST)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id a17-20020a056000101100b002c54911f50bsm2017252wrx.84.2023.02.18.21.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Feb 2023 21:20:33 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH] ostree: Upgrade 2022.7 -> 2023.1
Date: Sun, 19 Feb 2023 05:20:26 +0000
Message-Id: <20230219052026.28589-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Feb 2023 05:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101151

Drop upstreamed patches, switch to github-releases for upstream checks,
update comments regarding making ptest pass as C.UTF-8 is default in
glibc now.

Alex Kiernan (2):
      lib/repo-checkout: Add ALLPERMS for musl
      tests: Handle musl's ERANGE mapping

Benno Rice (1):
      Replace the radix64 crate with base64

Colin Walters (5):
      fetcher: Avoid too large queues for metadata processing
      configure: post-release version bump
      rust: Bump to 0.17
      bindings: Consistently check for `dox` feature
      Release 2023.1

Dan Nicholson (16):
      tests/inst: Update hyper-staticfile to 0.9.4
      Strip trailing whitespace on all C files
      repo: Add API to regenerate and sign repo metadata
      bin/summary: Use ostree_repo_regenerate_metadata
      commit: Allow skipping automatic summary generation
      repo: Create metadata commit in ostree_repo_regenerate_metadata
      lib: Provide internal summary signing with separate directory
      repo: Prevent publishing summary without matching signature
      bin: Cleanup documentation of --cache-dir option
      bin/refs: Sort listing
      bin/refs: Add option to print revisions
      bin/remote-refs: Add option to print revisions
      bin/show: Add options to list metadata keys
      ostree/dump: Add support for summary metadata keys
      bin/summary: Add options to show metadata
      bin/remote-summary: Add options to show metadata

Eric Curtin (1):
      bootloader: Add an aboot (Android) bootloader backend

Jonathan Lebon (1):
      ostree/prune: Calculate reachability under exclusive lock

Luca BRUNO (4):
      lib: assert more invariants
      configure: use pkg-config with newer gpgme and gpg-error
      lib/repo: fix an 'unused-function' warning
      lib/sysroot-upgrader: add some 'nullable' annotations

Tareque Md Hanif (1):
      docs: Fix link to ostree-rs

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 ...-repo-checkout-Add-ALLPERMS-for-musl.patch | 32 -------------------
 ...1-tests-Handle-musl-s-ERANGE-mapping.patch | 29 -----------------
 .../{ostree_2022.7.bb => ostree_2023.1.bb}    | 14 +++-----
 3 files changed, 5 insertions(+), 70 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-lib-repo-checkout-Add-ALLPERMS-for-musl.patch
 delete mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-tests-Handle-musl-s-ERANGE-mapping.patch
 rename meta-oe/recipes-extended/ostree/{ostree_2022.7.bb => ostree_2023.1.bb} (93%)

diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-lib-repo-checkout-Add-ALLPERMS-for-musl.patch b/meta-oe/recipes-extended/ostree/ostree/0001-lib-repo-checkout-Add-ALLPERMS-for-musl.patch
deleted file mode 100644
index 1502f1d4fd5e..000000000000
--- a/meta-oe/recipes-extended/ostree/ostree/0001-lib-repo-checkout-Add-ALLPERMS-for-musl.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 6aef666a2911c15b31efeed08d89fe9997d89e04 Mon Sep 17 00:00:00 2001
-From: Alex Kiernan <alex.kiernan@gmail.com>
-Date: Sat, 31 Dec 2022 11:11:14 +0000
-Subject: [PATCH] lib/repo-checkout: Add ALLPERMS for musl
-
-ALLPERMS is glibc specific, add a definition for musl.
-
-Upstream-Status: Submitted [https://github.com/ostreedev/ostree/pull/2797]
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- src/libostree/ostree-core-private.h | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/libostree/ostree-core-private.h b/src/libostree/ostree-core-private.h
-index 2bd2f9848718..48b2b8ab307f 100644
---- a/src/libostree/ostree-core-private.h
-+++ b/src/libostree/ostree-core-private.h
-@@ -34,6 +34,11 @@ G_BEGIN_DECLS
- #define DEFAULT_DIRECTORY_MODE 0775
- #define DEFAULT_REGFILE_MODE 0660
- 
-+/* This exists in glibc's sys/stat.h, but not on musl */
-+#ifndef ALLPERMS
-+#define ALLPERMS (S_ISUID|S_ISGID|S_ISVTX|S_IRWXU|S_IRWXG|S_IRWXO)
-+#endif
-+
- /* This file contains private implementation data format definitions
-  * read by multiple implementation .c files.
-  */
--- 
-2.39.0
-
diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-tests-Handle-musl-s-ERANGE-mapping.patch b/meta-oe/recipes-extended/ostree/ostree/0001-tests-Handle-musl-s-ERANGE-mapping.patch
deleted file mode 100644
index d0a8447e3da4..000000000000
--- a/meta-oe/recipes-extended/ostree/ostree/0001-tests-Handle-musl-s-ERANGE-mapping.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From bd182584a1e2f820493d9db689598a20c5700ba5 Mon Sep 17 00:00:00 2001
-From: Alex Kiernan <alex.kiernan@gmail.com>
-Date: Mon, 2 Jan 2023 10:37:49 +0000
-Subject: [PATCH] tests: Handle musl's ERANGE mapping
-
-musl uses "Result not representable" for ERANGE, support this in
-addition to glibc's "Numerical result out of range".
-
-Upstream-Status: Backport [https://github.com/ostreedev/ostree/commit/2d4ee168d7eae0afcce356a3f8135294e6d7fe6f]
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- tests/test-commit-timestamp.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/test-commit-timestamp.sh b/tests/test-commit-timestamp.sh
-index 0688c63a4bdb..de105b768a9c 100755
---- a/tests/test-commit-timestamp.sh
-+++ b/tests/test-commit-timestamp.sh
-@@ -40,6 +40,6 @@ fi
- ${CMD_PREFIX} ostree --repo=./testrepo show env > show-env.txt
- rm -rf testrepo testrepo-files
- assert_file_has_content_literal commit-invalid.txt 'Failed to convert SOURCE_DATE_EPOCH'
--assert_file_has_content_literal commit-overflowing.txt 'Parsing SOURCE_DATE_EPOCH: Numerical result out of range'
-+assert_file_has_content commit-overflowing.txt 'Parsing SOURCE_DATE_EPOCH: \(Numerical result out of range\|Result not representable\)'
- assert_file_has_content_literal show-env.txt 'Date:  2009-02-13 23:31:30 +0000'
- echo "ok commit with env timestamp"
--- 
-2.39.0
-
diff --git a/meta-oe/recipes-extended/ostree/ostree_2022.7.bb b/meta-oe/recipes-extended/ostree/ostree_2023.1.bb
similarity index 93%
rename from meta-oe/recipes-extended/ostree/ostree_2022.7.bb
rename to meta-oe/recipes-extended/ostree/ostree_2023.1.bb
index 61e208b3b718..bd566e1c282a 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2022.7.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2023.1.bb
@@ -17,19 +17,16 @@ DEPENDS = " \
     bison-native \
 "
 
+GITHUB_BASE_URI = "https://github.com/ostreedev/ostree/releases"
 SRC_URI = " \
-    https://github.com/ostreedev/ostree/releases/download/v${PV}/libostree-${PV}.tar.xz \
-    file://0001-lib-repo-checkout-Add-ALLPERMS-for-musl.patch \
-    file://0001-tests-Handle-musl-s-ERANGE-mapping.patch \
+    ${GITHUB_BASE_URI}/download/v${PV}/libostree-${PV}.tar.xz \
     file://run-ptest \
 "
-SRC_URI[sha256sum] = "8be2a9261c94e8b9ec4113380ffc480f8598245fb321a009bad4fae4b822411f"
-
-UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+)"
+SRC_URI[sha256sum] = "dd792b167693a1971c9f6e3168013d906ac035100ff6c719a3b322eb44b96f55"
 
 S = "${WORKDIR}/libostree-${PV}"
 
-inherit autotools bash-completion gobject-introspection gtk-doc manpages pkgconfig ptest-gnome systemd
+inherit autotools bash-completion gobject-introspection github-releases gtk-doc manpages pkgconfig ptest-gnome systemd
 
 # Workaround compile failure:
 # |../git/src/libotutil/zbase32.c:37:1: error: function returns an aggregate [-Werror=aggregate-return]
@@ -183,7 +180,7 @@ RDEPENDS:${PN}:class-target = " \
 #   ostree-trivial-httpd (requires soup - note soup and curl can coexist)
 #   overlayfs in your kernel
 #   busybox built statically
-#   C.UTF-8 locale available
+#   C.UTF-8 locale available (default)
 #   Sufficient disk space/RAM (e.g. core-image-sato-sdk)
 #
 # Something like this in your local.conf:
@@ -191,7 +188,6 @@ RDEPENDS:${PN}:class-target = " \
 # PACKAGECONFIG:append:pn-ostree = " static soup"
 # KERNEL_EXTRA_FEATURES:append = " features/overlayfs/overlayfs.scc"
 # TARGET_CFLAGS:append:pn-busybox = " -static"
-# IMAGE_LINGUAS:append:libc-glibc = " c"
 #
 RDEPENDS:${PN}-ptest += " \
     attr \
-- 
2.39.0


