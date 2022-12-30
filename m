Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D7DC3DA7C
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 21:35:56 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.29023.1672436150571651416
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Dec 2022 13:35:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ox+jfB2t;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id c133so20371712oif.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Dec 2022 13:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmaEoS74KSdj1uf4qfx7qiAP/Caw+iCeWqNYc38k6j0=;
        b=ox+jfB2t3Ez1C5rp/AUeHLdvoB77fxfMAOHVdAXIb/GsgV+QO6F5mDJv7175M2LmFG
         1YrE6rBBmWOn7vB1SnWoWD5geNUMezi/hj9M3x+yBSCfhPJUT9CspfyMew+OfRaggwFH
         jiXnin2d0a/4xZtbBhZQmnFSGPbX1P/KBkBMUNuYMofw344kfgqRQZbBZDwG8bQl0wEX
         PXlhzW9tYU1CImKcMwSvssNjTaGiPHvvUdxGgI064GQ4NTxZOUxMEhQa4f3srvDAVbV4
         CekgdpHCN6IWWAOt71YnKMIAGveI2kUXv/aZ+XN1YyRwu11WEVM1Y1bGzuNFmNkGFcel
         2VMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GmaEoS74KSdj1uf4qfx7qiAP/Caw+iCeWqNYc38k6j0=;
        b=gzGxOLnijarkVp6HxYqyTdX+JK3PgbstlmahsCmKM/6XFVvkZjg8doygGeMSX7iB39
         Eu1XXs6rsHH4WIqn64GBeggx7L8kXquMIphhz9DURck91kP0MgmMaOcykCWADQcfS7di
         urh66YYs+CS9oIiPIltMtjDG0hpK+HvMGtDZigH62Hv6KUnbDXKNjuxTzvsKaHCZpoxX
         KKqwMkXv3n3cdxBMxfUANb6ledC3d/usa7uL5GXfWl4t+kVFyBVrz/0IdJJGzBPS3UFa
         dMTqFIbMyDqayMkzRQChAUBa1zafuYvAzsQA9gFBPFzzcCt5vA3SHla4VpRvWdwalmHl
         ffSA==
X-Gm-Message-State: AFqh2kr/CdEg/9Y5TKewRe2ePn/cXBecmfiq7x1TFGswZCN7s9uCT9qT
	yWtG7hffjyoaa6dKx3qetsvb9+/CVBC/iXWb4iA=
X-Google-Smtp-Source: AMrXdXsr46evw3Q7b6n1TN5ENEzd+3EGAouwWrQkSmhSBpBkoHOPQA0qMq/sKXsYPDFDggL5SzkKWryz9ey8fehFtpQ=
X-Received: by 2002:aca:3855:0:b0:35c:53a9:5513 with SMTP id
 f82-20020aca3855000000b0035c53a95513mr1763504oia.262.1672436149519; Fri, 30
 Dec 2022 13:35:49 -0800 (PST)
MIME-Version: 1.0
References: <20221229094515.15178-1-alex.kiernan@gmail.com>
In-Reply-To: <20221229094515.15178-1-alex.kiernan@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Dec 2022 13:35:23 -0800
Message-ID: <CAMKF1spAW_gQ=3oQ4xtnubJjAogwrtkaz_HjcFV1xnqo6rNZdw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] ostree: Upgrade 2022.5 -> 2022.7
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Dec 2022 21:35:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100315

This fails to build on musl see

https://errors.yoctoproject.org/Errors/Details/685878/

ALLPERMS is not available on musl.  Perhaps add

#ifndef ALLPERMS
#define ALLPERMS (S_ISUID|S_ISGID|S_ISVTX|S_IRWXU|S_IRWXG|S_IRWXO)
#endif
in src/libostree/ostree-repo-checkout.c

On Thu, Dec 29, 2022 at 1:45 AM Alex Kiernan <alex.kiernan@gmail.com> wrote=
:
>
> Convert to tarballs which are now being published. Drop backported
> fixes, drop s390 bash patch (done differently upstream).
>
> v2022.7
> (Some of these commits are actually only for the Rust bindings;
> will try to enhance the release flow to more clearly filter
> those out)
>
> On the feature front, there's new APIs for idempotent delete operations o=
n
> kernel arguments, and for handling unshare() to
> manipulate (otherwise) read-only sysroot.
>
> A few very small memory leak fixes.
>
> Many people will be happy that we now retry HTTP requests after
> receiving HTTP 500 errors.
>
> There's a notable bugfix avoiding rebuilding SELinux policy
> when creating a first deployment.
>
> Thanks to all contributors!
>
> Colin Walters (18):
>       Remove readdir-rand
>       deploy: Don't rebuild selinux policy on first deployment
>       ci: Bump memory for ISO testing flow
>       rust: Update to cap-std 1.0
>       rust: Drop `openat` dependency
>       ci: Fix case where cosa !=3D buildroot
>       rust: Update to gio 0.16
>       repo: Avoid potential double unwind when writing panic value
>       Allow missing docs on two `glib::wrapper` functions
>       sysroot: Add an API to initialize with mountns
>       rust: Regenerate with latest gir and C sources
>       tests/inst: Update to latest ostree-ext
>       tests/inst: Drop nix dependency
>       tests/inst: Update cap-std-ext to 1.0
>       tests/inst: Update sh-inline
>       tests: Require OSTREE_TEST_SUDO to be set to use `sudo`
>       ci: Add a flow that combines C build and Rust integration tests
>       Release 2022.7
>
> Jonathan Lebon (4):
>       ci: Bump memory request, use fcosKolaTestIso
>       ci: Drop unnecessary outer stage
>       ci: Use new names for custom kola steps
>       ci: bump cosaPod memory requirement to 5Gi
>
> Luca BRUNO (20):
>       configure: post-release version bump
>       lib/repo-checkout: fix typo in error message
>       lib/bootloader-zipl: check for errors when opening initrd
>       lib/static-delta: document and check parameters format
>       rust/tests: fix static delta generation testcase
>       lib/sign-ed25519: convert invariant checks to assertions
>       rust: regenerate bindings after latest release (2022.6)
>       ostree: manually patch generated files
>       rust: update manual helpers
>       ci/rust: bump linting toolchain to latest stable (1.64)
>       lib/repo-refs: properly return an error value
>       rust: update pinned gir tool to 0.15
>       rust/ostree-sys: regenerate for gtk-rs 0.15
>       rust/ostree: regenerate for gtk-rs 0.15
>       ci/rust: test from git using latest feature
>       cargo: prepare ostree 0.16.0 and ostree-sys 0.11.0
>       copr: only use libostree tags
>       ci: adjust git tags filtering
>       cargo: bump minimum Rust version to 1.63
>       ostree: manually patch generated files
>
> Manuel St=C3=BChn (1):
>       Add test for generating static delta to file
>
> Philip Withnall (4):
>       ot-builtin-commit: Fix a typo in a command line help string
>       ot-builtin-commit: Don=E2=80=99t mention a C function name in a hel=
p string
>       lib/pull: Fix a small leak when a variable is reused
>       ot-builtin-pull: Fix a minor leak with progress reporting
>
> Rafael Garcia Ruiz (2):
>       ostree_kernel_args_contains for OstreeKernelArgs
>       Idempotent delete operation for  OstreeKernelArgs
>
> Ricardo Noriega (2):
>       Enabling retry for HTTP 500 internal server error
>       Add tests for cases under random 500s
>
> Simon McVittie (2):
>       readdir-rand: Copy full size of struct dirent
>       Replace calls to g_memdup() with g_memdup2()
>
> dependabot[bot] (2):
>       build(deps): bump libglnx from `26375b5` to `e701578`
>       build(deps): bump libglnx from `e701578` to `4e44fd9`
>
> 2022.6
> This release contains a collection of bugfixes and enhancements. Notable
> fixes concern finalize-staged, which should now better support
> automounted partitions and skip waiting for termination signal.
>
> A file descriptor leak has been fixed in the commit logic. The codebase
> has also been fixed to avoid conflicting declarations when building with
> latest glibc (>=3D 2.36). Thanks @GeorgesStavracas for both fixes!
>
> On the feature side, there is now basic support for handling overlayfs
> whiteouts on checkout through a new --process-passthrough-whiteouts
> flag. This is useful for users that need to carry container storage
> embedded into ostree commits. Thanks @mangelajo for that!
>
> The ostree rev-parse command gained a new --single flag to better
> support repositories containing exactly one commit.  Overall, the s390x
> Secure Execution (SE) logic has been reworked to stop relying on glue
> scripts.
>
> Thanks to all contributors!
>
> Andrea Perotti (1):
>       Fix recursive git archive reference
>
> Colin Walters (12):
>       configure: post-release version bump
>       rust-bindings: Fix `cargo fmt`
>       deny.toml: Add `Unicode-DFS-2016`
>       Remove unused `linux/fs.h` includes
>       Move FIFREEZE/FITHAW ioctl invocations into linuxfsutil.c
>       cli/rev-parse: Port to new code style
>       cli/rev-parse: Add `--single` option
>       rust: Update to latest git
>       ci: Also drop seccomp on debian testing
>       rust: Bind `ostree_repo_list_commits_starting_with`
>       finalize-staged: Don't listen to `SIGTERM`, just let kernel exit us
>       README.md: Link otto
>
> Dan Nicholson (3):
>       main: Factor out sysroot loading
>       finalize-staged: Ensure /boot automount doesn't expire
>       lib/pull: Fix max-metadata-size documentation
>
> Georges Basile Stavracas Neto (1):
>       lib/commit: Unref repo on success
>
> Huijing Hei (1):
>       Fix `ostree admin kargs edit-in-place` assertion when deployments a=
re pending
>
> Jon Oster (1):
>       docs: Add aktualizr and TorizonCore to related projects
>
> Jonathan Lebon (3):
>       lib/commit: Directly use FICLONE for payload link
>       tests/kolainst/staged-deploy: parse `rpm-ostree status --json` inst=
ead
>       docs: Add section about staged deployments
>
> Luca BRUNO (7):
>       libostree: fix a typo in annotation
>       lib/bootloader: assert invariants
>       lib/mtree: drop redundant name checks
>       otutil: add error handling to variant builders
>       lib/sign: convert invariant checks to assertions
>       lib/repo: properly initialize boolean variable
>       lib/sysroot-deploy: explicitly handle `g_variant_lookup` results
>
> Lukas Kalbertodt (1):
>       Update to `libtest-mimic` 0.5.0
>
> Miguel Angel Ajo (1):
>       Support overlayfs whiteouts on checkout
>
> Nikita Dubrovskii (3):
>       s390x: ensure both 'root' and 'boot' luks keys exist
>       s390x: simplify 's390x-se-luks-gencpio' script
>       s390x: use 'libarchive' to modify initrd in SE case
>
> Sam James (1):
>       buildutil/glibtests.m4: fix bashism
>
> dependabot[bot] (1):
>       build(deps): bump libglnx from `c59eb27` to `26375b5`
>
> git-bruh (1):
>       ostree-fetcher-curl: check for HTTP2 support before trying to use i=
t
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>
>  ...01-Remove-unused-linux-fs.h-includes.patch | 42 ------------------
>  ...uild-selinux-policy-on-first-deploym.patch | 44 -------------------
>  ...-se-luks-gencpio-There-is-no-bashism.patch | 25 -----------
>  .../{ostree_2022.5.bb =3D> ostree_2022.7.bb}    |  9 ++--
>  4 files changed, 3 insertions(+), 117 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-Remove-un=
used-linux-fs.h-includes.patch
>  delete mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-deploy-Do=
n-t-rebuild-selinux-policy-on-first-deploym.patch
>  delete mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-s390x-se-=
luks-gencpio-There-is-no-bashism.patch
>  rename meta-oe/recipes-extended/ostree/{ostree_2022.5.bb =3D> ostree_202=
2.7.bb} (95%)
>
> diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-Remove-unused-li=
nux-fs.h-includes.patch b/meta-oe/recipes-extended/ostree/ostree/0001-Remov=
e-unused-linux-fs.h-includes.patch
> deleted file mode 100644
> index 2659e4696d61..000000000000
> --- a/meta-oe/recipes-extended/ostree/ostree/0001-Remove-unused-linux-fs.=
h-includes.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 7d32c352f628747cfadabf9fe7fcc13608e5dfe6 Mon Sep 17 00:00:00 2001
> -From: Colin Walters <walters@verbum.org>
> -Date: Wed, 3 Aug 2022 10:37:40 -0400
> -Subject: [PATCH] Remove unused `linux/fs.h` includes
> -
> -Prep for fixing conflicts introduced by newer glibc.
> -cc https://github.com/ostreedev/ostree/issues/2685
> -
> -Upstream-Status: Backport [https://github.com/ostreedev/ostree/commit/ed=
ba4b33be10c05253bfa94895dfbc8477e44d76]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/libostree/ostree-repo-commit.c | 1 -
> - src/ostree/ot-main.c               | 1 -
> - 2 files changed, 2 deletions(-)
> -
> -diff --git a/src/libostree/ostree-repo-commit.c b/src/libostree/ostree-r=
epo-commit.c
> -index afab3fdf..35b16c71 100644
> ---- a/src/libostree/ostree-repo-commit.c
> -+++ b/src/libostree/ostree-repo-commit.c
> -@@ -30,7 +30,6 @@
> - #include <sys/xattr.h>
> - #include <glib/gprintf.h>
> - #include <sys/ioctl.h>
> --#include <linux/fs.h>
> - #include <ext2fs/ext2_fs.h>
> -
> - #include "otutil.h"
> -diff --git a/src/ostree/ot-main.c b/src/ostree/ot-main.c
> -index b7b50d67..7a4405a5 100644
> ---- a/src/ostree/ot-main.c
> -+++ b/src/ostree/ot-main.c
> -@@ -28,7 +28,6 @@
> - #include <string.h>
> - #include <sys/statvfs.h>
> - #include <sys/mount.h>
> --#include <linux/fs.h>
> -
> - #include "ot-main.h"
> - #include "ostree.h"
> ---
> -2.37.1
> -
> diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-deploy-Don-t-reb=
uild-selinux-policy-on-first-deploym.patch b/meta-oe/recipes-extended/ostre=
e/ostree/0001-deploy-Don-t-rebuild-selinux-policy-on-first-deploym.patch
> deleted file mode 100644
> index 248dcf49b864..000000000000
> --- a/meta-oe/recipes-extended/ostree/ostree/0001-deploy-Don-t-rebuild-se=
linux-policy-on-first-deploym.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From bd325061dc9585886f7e60e58d9fc0c8b37e71db Mon Sep 17 00:00:00 2001
> -From: Colin Walters <walters@verbum.org>
> -Date: Wed, 9 Nov 2022 11:18:36 -0500
> -Subject: [PATCH] deploy: Don't rebuild selinux policy on first deploymen=
t
> -
> -Basically, it should not be necessary - the policy should be
> -up-to-date.  We don't want to force on continual policy rebuilds.
> -
> -Even trying to run bwrap when we're *not* in a booted
> -root can cause failures in nested containerization scenarios.
> -
> -Closes: https://github.com/ostreedev/ostree/issues/2758
> -
> -Upstream-Status: Backport
> -[https://github.com/ostreedev/ostree/commit/bd325061dc9585886f7e60e58d9f=
c0c8b37e71db]
> -
> -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ----
> - src/libostree/ostree-sysroot-deploy.c | 6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/src/libostree/ostree-sysroot-deploy.c b/src/libostree/ostre=
e-sysroot-deploy.c
> -index f27ae0e1..26b07080 100644
> ---- a/src/libostree/ostree-sysroot-deploy.c
> -+++ b/src/libostree/ostree-sysroot-deploy.c
> -@@ -2987,12 +2987,12 @@ sysroot_finalize_deployment (OstreeSysroot     *=
self,
> -       if (!merge_configuration_from (self, merge_deployment, deployment=
, deployment_dfd,
> -                                      cancellable, error))
> -         return FALSE;
> --    }
> -
> - #ifdef HAVE_SELINUX
> --  if (!sysroot_finalize_selinux_policy(deployment_dfd, error))
> --    return FALSE;
> -+      if (!sysroot_finalize_selinux_policy (deployment_dfd, error))
> -+        return FALSE;
> - #endif /* HAVE_SELINUX */
> -+    }
> -
> -   const char *osdeploypath =3D glnx_strjoina ("ostree/deploy/", ostree_=
deployment_get_osname (deployment));
> -   glnx_autofd int os_deploy_dfd =3D -1;
> ---
> -2.25.1
> -
> diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-s390x-se-luks-ge=
ncpio-There-is-no-bashism.patch b/meta-oe/recipes-extended/ostree/ostree/00=
01-s390x-se-luks-gencpio-There-is-no-bashism.patch
> deleted file mode 100644
> index 5cf5784f145d..000000000000
> --- a/meta-oe/recipes-extended/ostree/ostree/0001-s390x-se-luks-gencpio-T=
here-is-no-bashism.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -From dd55633e49aa43dede3c8e1770ae8761487f050e Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 6 Aug 2022 21:52:31 -0700
> -Subject: [PATCH] s390x-se-luks-gencpio: There is no bashism
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/libostree/s390x-se-luks-gencpio | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/libostree/s390x-se-luks-gencpio b/src/libostree/s390x-s=
e-luks-gencpio
> -index e821e2fe..96c1d123 100755
> ---- a/src/libostree/s390x-se-luks-gencpio
> -+++ b/src/libostree/s390x-se-luks-gencpio
> -@@ -1,4 +1,4 @@
> --#!/bin/bash
> -+#!/bin/sh
> - # This script creates new initramdisk with LUKS config within
> - set -euo pipefail
> -
> ---
> -2.37.1
> -
> diff --git a/meta-oe/recipes-extended/ostree/ostree_2022.5.bb b/meta-oe/r=
ecipes-extended/ostree/ostree_2022.7.bb
> similarity index 95%
> rename from meta-oe/recipes-extended/ostree/ostree_2022.5.bb
> rename to meta-oe/recipes-extended/ostree/ostree_2022.7.bb
> index c6ac7cbea4fa..9e81e93d6eca 100644
> --- a/meta-oe/recipes-extended/ostree/ostree_2022.5.bb
> +++ b/meta-oe/recipes-extended/ostree/ostree_2022.7.bb
> @@ -18,18 +18,15 @@ DEPENDS =3D " \
>  "
>
>  SRC_URI =3D " \
> -    gitsm://github.com/ostreedev/ostree;branch=3Dmain;protocol=3Dhttps \
> -    file://0001-Remove-unused-linux-fs.h-includes.patch \
> +    https://github.com/ostreedev/ostree/releases/download/v${PV}/libostr=
ee-${PV}.tar.xz \
>      file://0001-libostree-Remove-including-sys-mount.h.patch \
> -    file://0001-s390x-se-luks-gencpio-There-is-no-bashism.patch \
> -    file://0001-deploy-Don-t-rebuild-selinux-policy-on-first-deploym.pat=
ch \
>      file://run-ptest \
>  "
> -SRCREV =3D "15740d042c9c5258a1c082b5e228cf6f115edbb0"
> +SRC_URI[sha256sum] =3D "8be2a9261c94e8b9ec4113380ffc480f8598245fb321a009=
bad4fae4b822411f"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+\.\d+)"
>
> -S =3D "${WORKDIR}/git"
> +S =3D "${WORKDIR}/libostree-${PV}"
>
>  inherit autotools bash-completion gobject-introspection gtk-doc manpages=
 pkgconfig ptest-gnome systemd
>
> --
> 2.39.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100296): https://lists.openembedded.org/g/openembedde=
d-devel/message/100296
> Mute This Topic: https://lists.openembedded.org/mt/95934519/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

