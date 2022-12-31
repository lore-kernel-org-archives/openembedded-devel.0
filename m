Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3EAC4332F
	for <webhook@archiver.kernel.org>; Sat, 31 Dec 2022 18:07:03 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.47370.1672510016203433891
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Dec 2022 10:06:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iZzs8YNY;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id h16so22829916wrz.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 31 Dec 2022 10:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YNeqg5Jy1cZVhlBEwyeZzqByu5IJGehAyYSRt+8J3uo=;
        b=iZzs8YNYGYf1AQrifSmb43gRl3LYe/SUT4oD4vqLwMwfIvnTQ8f5greoFK+vjLWCli
         u9W36+Xlh6xohuUQKRDeT7XF6IRbKi78leF5cdXW1Ubd2Io0Egy2itJE8/H4Fnf0Jno0
         30BSuQdQTaWJSGa0KY4nVF6Q7WLL0/417CqlFAsutDAbux4pvkEPgQeGsL9OsNx0WrXL
         MQVz2tzx7Apgv57RV4ZjUOT+a/ZLa2+6y2CDmX5N5wprqYd6vFuNFgwjYZDQLXUzUOo/
         bIScYFTNmwhZjYpzY6QrYeaoMCySsoHFOXT/mOENt2sW6CVR5/Nzty026BnY3yk2eNQS
         ge5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YNeqg5Jy1cZVhlBEwyeZzqByu5IJGehAyYSRt+8J3uo=;
        b=bo87mGfbcBSQg5mikCT9e1ziArsopZXxq+5Fk8ldS51cQp19GEvmDK+Oh7krvs7EHd
         21vy2pOz/Q3plnJNUGJKc7eLmfeGNr3LwQNp/4ww97ateth4D9gTHzRDdo9fmwy50L+h
         59f/pucSnO9ZTISClhV+GalIkQpMZ5BSxudsKz9Y+CWMqaOWIreLjAWRwCd6xMNsmIO3
         tFLDfjD7IRLpwDURJ6qcYVDHw1RKGZaduGiUIuDE7I8jyvcCkqlaJ7hkd76TN8awmSSd
         xLKp0VUx7W4dVQJ0FyNtyPqWaUlDqgnPHFJ2Q1QZ0dfFlmEjF7GNif6vlF9YKtFsu8hx
         IZsQ==
X-Gm-Message-State: AFqh2kqXnFdU08vkL26FoDC0v4GsGCjCdz3//D877LkGB9Pfrk6Y8itA
	wfIElrqAKWqgZDOou0EpDICxPNs+0hk=
X-Google-Smtp-Source: AMrXdXud9QyxFWaQ8xiDsLFygLyBLHgt0y/u/gavP8jzzOL/w8eANzZlSEp6byqP3T/mCDOVedbhVw==
X-Received: by 2002:a05:6000:11cd:b0:27b:5c94:d52c with SMTP id i13-20020a05600011cd00b0027b5c94d52cmr16865516wrx.12.1672510014266;
        Sat, 31 Dec 2022 10:06:54 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id q1-20020adffec1000000b00281b594c725sm14259288wrs.38.2022.12.31.10.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Dec 2022 10:06:53 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH v2] ostree: Upgrade 2022.5 -> 2022.7
Date: Sat, 31 Dec 2022 18:06:45 +0000
Message-Id: <20221231180645.11206-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 Dec 2022 18:07:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100324

Convert to tarballs which are now being published. Drop backported
fixes, drop s390 bash patch (done differently upstream), drop glibc 2.36
sys/mount fix (done differently upstream), add patch for musl and
ALLPERMS.

v2022.7
(Some of these commits are actually only for the Rust bindings;
will try to enhance the release flow to more clearly filter
those out)

On the feature front, there's new APIs for idempotent delete operations on
kernel arguments, and for handling unshare() to
manipulate (otherwise) read-only sysroot.

A few very small memory leak fixes.

Many people will be happy that we now retry HTTP requests after
receiving HTTP 500 errors.

There's a notable bugfix avoiding rebuilding SELinux policy
when creating a first deployment.

Thanks to all contributors!

Colin Walters (18):
      Remove readdir-rand
      deploy: Don't rebuild selinux policy on first deployment
      ci: Bump memory for ISO testing flow
      rust: Update to cap-std 1.0
      rust: Drop `openat` dependency
      ci: Fix case where cosa != buildroot
      rust: Update to gio 0.16
      repo: Avoid potential double unwind when writing panic value
      Allow missing docs on two `glib::wrapper` functions
      sysroot: Add an API to initialize with mountns
      rust: Regenerate with latest gir and C sources
      tests/inst: Update to latest ostree-ext
      tests/inst: Drop nix dependency
      tests/inst: Update cap-std-ext to 1.0
      tests/inst: Update sh-inline
      tests: Require OSTREE_TEST_SUDO to be set to use `sudo`
      ci: Add a flow that combines C build and Rust integration tests
      Release 2022.7

Jonathan Lebon (4):
      ci: Bump memory request, use fcosKolaTestIso
      ci: Drop unnecessary outer stage
      ci: Use new names for custom kola steps
      ci: bump cosaPod memory requirement to 5Gi

Luca BRUNO (20):
      configure: post-release version bump
      lib/repo-checkout: fix typo in error message
      lib/bootloader-zipl: check for errors when opening initrd
      lib/static-delta: document and check parameters format
      rust/tests: fix static delta generation testcase
      lib/sign-ed25519: convert invariant checks to assertions
      rust: regenerate bindings after latest release (2022.6)
      ostree: manually patch generated files
      rust: update manual helpers
      ci/rust: bump linting toolchain to latest stable (1.64)
      lib/repo-refs: properly return an error value
      rust: update pinned gir tool to 0.15
      rust/ostree-sys: regenerate for gtk-rs 0.15
      rust/ostree: regenerate for gtk-rs 0.15
      ci/rust: test from git using latest feature
      cargo: prepare ostree 0.16.0 and ostree-sys 0.11.0
      copr: only use libostree tags
      ci: adjust git tags filtering
      cargo: bump minimum Rust version to 1.63
      ostree: manually patch generated files

Manuel Stühn (1):
      Add test for generating static delta to file

Philip Withnall (4):
      ot-builtin-commit: Fix a typo in a command line help string
      ot-builtin-commit: Don’t mention a C function name in a help string
      lib/pull: Fix a small leak when a variable is reused
      ot-builtin-pull: Fix a minor leak with progress reporting

Rafael Garcia Ruiz (2):
      ostree_kernel_args_contains for OstreeKernelArgs
      Idempotent delete operation for  OstreeKernelArgs

Ricardo Noriega (2):
      Enabling retry for HTTP 500 internal server error
      Add tests for cases under random 500s

Simon McVittie (2):
      readdir-rand: Copy full size of struct dirent
      Replace calls to g_memdup() with g_memdup2()

dependabot[bot] (2):
      build(deps): bump libglnx from `26375b5` to `e701578`
      build(deps): bump libglnx from `e701578` to `4e44fd9`

2022.6
This release contains a collection of bugfixes and enhancements. Notable
fixes concern finalize-staged, which should now better support
automounted partitions and skip waiting for termination signal.

A file descriptor leak has been fixed in the commit logic. The codebase
has also been fixed to avoid conflicting declarations when building with
latest glibc (>= 2.36). Thanks @GeorgesStavracas for both fixes!

On the feature side, there is now basic support for handling overlayfs
whiteouts on checkout through a new --process-passthrough-whiteouts
flag. This is useful for users that need to carry container storage
embedded into ostree commits. Thanks @mangelajo for that!

The ostree rev-parse command gained a new --single flag to better
support repositories containing exactly one commit.  Overall, the s390x
Secure Execution (SE) logic has been reworked to stop relying on glue
scripts.

Thanks to all contributors!

Andrea Perotti (1):
      Fix recursive git archive reference

Colin Walters (12):
      configure: post-release version bump
      rust-bindings: Fix `cargo fmt`
      deny.toml: Add `Unicode-DFS-2016`
      Remove unused `linux/fs.h` includes
      Move FIFREEZE/FITHAW ioctl invocations into linuxfsutil.c
      cli/rev-parse: Port to new code style
      cli/rev-parse: Add `--single` option
      rust: Update to latest git
      ci: Also drop seccomp on debian testing
      rust: Bind `ostree_repo_list_commits_starting_with`
      finalize-staged: Don't listen to `SIGTERM`, just let kernel exit us
      README.md: Link otto

Dan Nicholson (3):
      main: Factor out sysroot loading
      finalize-staged: Ensure /boot automount doesn't expire
      lib/pull: Fix max-metadata-size documentation

Georges Basile Stavracas Neto (1):
      lib/commit: Unref repo on success

Huijing Hei (1):
      Fix `ostree admin kargs edit-in-place` assertion when deployments are pending

Jon Oster (1):
      docs: Add aktualizr and TorizonCore to related projects

Jonathan Lebon (3):
      lib/commit: Directly use FICLONE for payload link
      tests/kolainst/staged-deploy: parse `rpm-ostree status --json` instead
      docs: Add section about staged deployments

Luca BRUNO (7):
      libostree: fix a typo in annotation
      lib/bootloader: assert invariants
      lib/mtree: drop redundant name checks
      otutil: add error handling to variant builders
      lib/sign: convert invariant checks to assertions
      lib/repo: properly initialize boolean variable
      lib/sysroot-deploy: explicitly handle `g_variant_lookup` results

Lukas Kalbertodt (1):
      Update to `libtest-mimic` 0.5.0

Miguel Angel Ajo (1):
      Support overlayfs whiteouts on checkout

Nikita Dubrovskii (3):
      s390x: ensure both 'root' and 'boot' luks keys exist
      s390x: simplify 's390x-se-luks-gencpio' script
      s390x: use 'libarchive' to modify initrd in SE case

Sam James (1):
      buildutil/glibtests.m4: fix bashism

dependabot[bot] (1):
      build(deps): bump libglnx from `c59eb27` to `26375b5`

git-bruh (1):
      ostree-fetcher-curl: check for HTTP2 support before trying to use it

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- Fix musl build, drop sys/mount fix for glibc 2.36 (fixed upstream)

 ...01-Remove-unused-linux-fs.h-includes.patch | 42 ------------------
 ...uild-selinux-policy-on-first-deploym.patch | 44 -------------------
 ...-repo-checkout-Add-ALLPERMS-for-musl.patch | 32 ++++++++++++++
 ...bostree-Remove-including-sys-mount.h.patch | 29 ------------
 ...-se-luks-gencpio-There-is-no-bashism.patch | 25 -----------
 .../{ostree_2022.5.bb => ostree_2022.7.bb}    | 11 ++---
 6 files changed, 36 insertions(+), 147 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-Remove-unused-linux-fs.h-includes.patch
 delete mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-deploy-Don-t-rebuild-selinux-policy-on-first-deploym.patch
 create mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-lib-repo-checkout-Add-ALLPERMS-for-musl.patch
 delete mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-libostree-Remove-including-sys-mount.h.patch
 delete mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-s390x-se-luks-gencpio-There-is-no-bashism.patch
 rename meta-oe/recipes-extended/ostree/{ostree_2022.5.bb => ostree_2022.7.bb} (94%)

diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-Remove-unused-linux-fs.h-includes.patch b/meta-oe/recipes-extended/ostree/ostree/0001-Remove-unused-linux-fs.h-includes.patch
deleted file mode 100644
index 2659e4696d61..000000000000
--- a/meta-oe/recipes-extended/ostree/ostree/0001-Remove-unused-linux-fs.h-includes.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 7d32c352f628747cfadabf9fe7fcc13608e5dfe6 Mon Sep 17 00:00:00 2001
-From: Colin Walters <walters@verbum.org>
-Date: Wed, 3 Aug 2022 10:37:40 -0400
-Subject: [PATCH] Remove unused `linux/fs.h` includes
-
-Prep for fixing conflicts introduced by newer glibc.
-cc https://github.com/ostreedev/ostree/issues/2685
-
-Upstream-Status: Backport [https://github.com/ostreedev/ostree/commit/edba4b33be10c05253bfa94895dfbc8477e44d76]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/libostree/ostree-repo-commit.c | 1 -
- src/ostree/ot-main.c               | 1 -
- 2 files changed, 2 deletions(-)
-
-diff --git a/src/libostree/ostree-repo-commit.c b/src/libostree/ostree-repo-commit.c
-index afab3fdf..35b16c71 100644
---- a/src/libostree/ostree-repo-commit.c
-+++ b/src/libostree/ostree-repo-commit.c
-@@ -30,7 +30,6 @@
- #include <sys/xattr.h>
- #include <glib/gprintf.h>
- #include <sys/ioctl.h>
--#include <linux/fs.h>
- #include <ext2fs/ext2_fs.h>
- 
- #include "otutil.h"
-diff --git a/src/ostree/ot-main.c b/src/ostree/ot-main.c
-index b7b50d67..7a4405a5 100644
---- a/src/ostree/ot-main.c
-+++ b/src/ostree/ot-main.c
-@@ -28,7 +28,6 @@
- #include <string.h>
- #include <sys/statvfs.h>
- #include <sys/mount.h>
--#include <linux/fs.h>
- 
- #include "ot-main.h"
- #include "ostree.h"
--- 
-2.37.1
-
diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-deploy-Don-t-rebuild-selinux-policy-on-first-deploym.patch b/meta-oe/recipes-extended/ostree/ostree/0001-deploy-Don-t-rebuild-selinux-policy-on-first-deploym.patch
deleted file mode 100644
index 248dcf49b864..000000000000
--- a/meta-oe/recipes-extended/ostree/ostree/0001-deploy-Don-t-rebuild-selinux-policy-on-first-deploym.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From bd325061dc9585886f7e60e58d9fc0c8b37e71db Mon Sep 17 00:00:00 2001
-From: Colin Walters <walters@verbum.org>
-Date: Wed, 9 Nov 2022 11:18:36 -0500
-Subject: [PATCH] deploy: Don't rebuild selinux policy on first deployment
-
-Basically, it should not be necessary - the policy should be
-up-to-date.  We don't want to force on continual policy rebuilds.
-
-Even trying to run bwrap when we're *not* in a booted
-root can cause failures in nested containerization scenarios.
-
-Closes: https://github.com/ostreedev/ostree/issues/2758
-
-Upstream-Status: Backport
-[https://github.com/ostreedev/ostree/commit/bd325061dc9585886f7e60e58d9fc0c8b37e71db]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- src/libostree/ostree-sysroot-deploy.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/libostree/ostree-sysroot-deploy.c b/src/libostree/ostree-sysroot-deploy.c
-index f27ae0e1..26b07080 100644
---- a/src/libostree/ostree-sysroot-deploy.c
-+++ b/src/libostree/ostree-sysroot-deploy.c
-@@ -2987,12 +2987,12 @@ sysroot_finalize_deployment (OstreeSysroot     *self,
-       if (!merge_configuration_from (self, merge_deployment, deployment, deployment_dfd,
-                                      cancellable, error))
-         return FALSE;
--    }
- 
- #ifdef HAVE_SELINUX
--  if (!sysroot_finalize_selinux_policy(deployment_dfd, error))
--    return FALSE;
-+      if (!sysroot_finalize_selinux_policy (deployment_dfd, error))
-+        return FALSE;
- #endif /* HAVE_SELINUX */
-+    }
- 
-   const char *osdeploypath = glnx_strjoina ("ostree/deploy/", ostree_deployment_get_osname (deployment));
-   glnx_autofd int os_deploy_dfd = -1;
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-lib-repo-checkout-Add-ALLPERMS-for-musl.patch b/meta-oe/recipes-extended/ostree/ostree/0001-lib-repo-checkout-Add-ALLPERMS-for-musl.patch
new file mode 100644
index 000000000000..1502f1d4fd5e
--- /dev/null
+++ b/meta-oe/recipes-extended/ostree/ostree/0001-lib-repo-checkout-Add-ALLPERMS-for-musl.patch
@@ -0,0 +1,32 @@
+From 6aef666a2911c15b31efeed08d89fe9997d89e04 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Sat, 31 Dec 2022 11:11:14 +0000
+Subject: [PATCH] lib/repo-checkout: Add ALLPERMS for musl
+
+ALLPERMS is glibc specific, add a definition for musl.
+
+Upstream-Status: Submitted [https://github.com/ostreedev/ostree/pull/2797]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ src/libostree/ostree-core-private.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/libostree/ostree-core-private.h b/src/libostree/ostree-core-private.h
+index 2bd2f9848718..48b2b8ab307f 100644
+--- a/src/libostree/ostree-core-private.h
++++ b/src/libostree/ostree-core-private.h
+@@ -34,6 +34,11 @@ G_BEGIN_DECLS
+ #define DEFAULT_DIRECTORY_MODE 0775
+ #define DEFAULT_REGFILE_MODE 0660
+ 
++/* This exists in glibc's sys/stat.h, but not on musl */
++#ifndef ALLPERMS
++#define ALLPERMS (S_ISUID|S_ISGID|S_ISVTX|S_IRWXU|S_IRWXG|S_IRWXO)
++#endif
++
+ /* This file contains private implementation data format definitions
+  * read by multiple implementation .c files.
+  */
+-- 
+2.39.0
+
diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-libostree-Remove-including-sys-mount.h.patch b/meta-oe/recipes-extended/ostree/ostree/0001-libostree-Remove-including-sys-mount.h.patch
deleted file mode 100644
index 5c2792cf8934..000000000000
--- a/meta-oe/recipes-extended/ostree/ostree/0001-libostree-Remove-including-sys-mount.h.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 7ff956e4088e0bdc6bfd429f99124a8a9256c181 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 6 Aug 2022 21:44:11 -0700
-Subject: [PATCH] libostree: Remove including sys/mount.h
-
-This conflicts with linux/mount.h which is included by linux/fs.h
-with glibc 2.36+
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/libostree/ostree-sysroot-deploy.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/src/libostree/ostree-sysroot-deploy.c b/src/libostree/ostree-sysroot-deploy.c
-index 2dc9f58b..61b19e42 100644
---- a/src/libostree/ostree-sysroot-deploy.c
-+++ b/src/libostree/ostree-sysroot-deploy.c
-@@ -23,7 +23,6 @@
- #include <gio/gunixoutputstream.h>
- #include <glib-unix.h>
- #include <stdint.h>
--#include <sys/mount.h>
- #include <sys/statvfs.h>
- #include <sys/socket.h>
- #include <sys/ioctl.h>
--- 
-2.37.1
-
diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-s390x-se-luks-gencpio-There-is-no-bashism.patch b/meta-oe/recipes-extended/ostree/ostree/0001-s390x-se-luks-gencpio-There-is-no-bashism.patch
deleted file mode 100644
index 5cf5784f145d..000000000000
--- a/meta-oe/recipes-extended/ostree/ostree/0001-s390x-se-luks-gencpio-There-is-no-bashism.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From dd55633e49aa43dede3c8e1770ae8761487f050e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 6 Aug 2022 21:52:31 -0700
-Subject: [PATCH] s390x-se-luks-gencpio: There is no bashism
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/libostree/s390x-se-luks-gencpio | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libostree/s390x-se-luks-gencpio b/src/libostree/s390x-se-luks-gencpio
-index e821e2fe..96c1d123 100755
---- a/src/libostree/s390x-se-luks-gencpio
-+++ b/src/libostree/s390x-se-luks-gencpio
-@@ -1,4 +1,4 @@
--#!/bin/bash
-+#!/bin/sh
- # This script creates new initramdisk with LUKS config within
- set -euo pipefail
- 
--- 
-2.37.1
-
diff --git a/meta-oe/recipes-extended/ostree/ostree_2022.5.bb b/meta-oe/recipes-extended/ostree/ostree_2022.7.bb
similarity index 94%
rename from meta-oe/recipes-extended/ostree/ostree_2022.5.bb
rename to meta-oe/recipes-extended/ostree/ostree_2022.7.bb
index c6ac7cbea4fa..771b17b34b35 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2022.5.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2022.7.bb
@@ -18,18 +18,15 @@ DEPENDS = " \
 "
 
 SRC_URI = " \
-    gitsm://github.com/ostreedev/ostree;branch=main;protocol=https \
-    file://0001-Remove-unused-linux-fs.h-includes.patch \
-    file://0001-libostree-Remove-including-sys-mount.h.patch \
-    file://0001-s390x-se-luks-gencpio-There-is-no-bashism.patch \
-    file://0001-deploy-Don-t-rebuild-selinux-policy-on-first-deploym.patch \
+    https://github.com/ostreedev/ostree/releases/download/v${PV}/libostree-${PV}.tar.xz \
+    file://0001-lib-repo-checkout-Add-ALLPERMS-for-musl.patch \
     file://run-ptest \
 "
-SRCREV = "15740d042c9c5258a1c082b5e228cf6f115edbb0"
+SRC_URI[sha256sum] = "8be2a9261c94e8b9ec4113380ffc480f8598245fb321a009bad4fae4b822411f"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+)"
 
-S = "${WORKDIR}/git"
+S = "${WORKDIR}/libostree-${PV}"
 
 inherit autotools bash-completion gobject-introspection gtk-doc manpages pkgconfig ptest-gnome systemd
 
-- 
2.39.0


