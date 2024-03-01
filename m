Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13ADAC5478C
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 18:59:06 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.32261.1709319542810283820
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Mar 2024 10:59:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CJuSSP6c;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-21ffac15528so1014225fac.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 10:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709319542; x=1709924342; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jW8UAl7/Bp3vA4uTg1vw/CC/k8ilWLzGKnyr8ssVdw=;
        b=CJuSSP6cFpY3VEqMvE7fsV/XmuUY3Cj6LPm0YsmdJrcb+EUi4fVqppyGBeREn9OxGo
         LNJq9XbEWxuYJC0fFL3nguy5oxisI16pnYmsbblV0+EuWUgx3RINZR8iEJNVOw9UDA4n
         zxNdeFFtMSu0OHIZCq2pN4a2elMjlXofsINHBQjtEx6nKJZrXEVszYxHPdADqUyd1+vY
         d/h6sO9ZH7MGHUKNve1lBFZIKB+sAGyYL13iisRHUTW93EGfnq0bJwYrqpQNNH2TuCIS
         Iie8pw/bbaaAYodqObB9V/H+EzspmQBueWalL1h1MrRcDW8O0+o0Pvj1lfugeigZk0lx
         C5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709319542; x=1709924342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5jW8UAl7/Bp3vA4uTg1vw/CC/k8ilWLzGKnyr8ssVdw=;
        b=mNq0mv7VSl5uPMSDaACnaC3Zq+bdiSeiIaKwXARQMVUBM5TNaS12T1JOz0XddMFkZE
         pYfAAOXyHnTx/QJiGB9tF0SqLCN7AoeLqzoUjnir9HZekbKMaKgbIDl4/Z1kpmaadxVz
         GoRvzTq9CFS4SNTwuPf6SgIK+p/oVFsop+/dH52a7AddR6LAp6YlVryNl5MskC39mIUH
         0cI65fWPZmFe5wGnZZkD3/bzge1zrLuVIEYPEYB4fYR2pZdXA667jl1ElJgianxk11ts
         jL+UlUBsIV40eqdK5SJaQ8agRLtMQVJtlBSgMJPn1WoCkJ7ob+2YVP8WrD54xPVaHA1R
         /zJA==
X-Gm-Message-State: AOJu0Yythvsnaqs3vNqK3MoJxDIKQP6+ehlwbqbuE0obqTJQ8DkLvQ52
	R3xUEAprwWL61aQWdZX3sZBgJB/UEm47gvcPs6QKJafaYieCAVWkxTqGihwfwmiKtdaSdUbJms4
	5dbfnfxq7GTqGR8Dd/2ovwcyTfElwLErvh5k=
X-Google-Smtp-Source: AGHT+IF9kCDxilBzEZX7UhlDibMV9E0u03xFp/51K85MFIrASDngcOUAJI53t2gNQK0sBE/3qjNR5x1vHgh2cP/Vc0w=
X-Received: by 2002:a05:6870:9d14:b0:21f:d149:7e9b with SMTP id
 pp20-20020a0568709d1400b0021fd1497e9bmr2714545oab.15.1709319541878; Fri, 01
 Mar 2024 10:59:01 -0800 (PST)
MIME-Version: 1.0
References: <20240301045338.2655388-1-xiangyu.chen@eng.windriver.com>
In-Reply-To: <20240301045338.2655388-1-xiangyu.chen@eng.windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Mar 2024 10:58:36 -0800
Message-ID: <CAMKF1sqFdisJYEWHRzCA+p=yhEVQJ7frZOvO8VncKRv+o5cbRA@mail.gmail.com>
Subject: Re: [oe][meta-networking][PATCH] drbd-utils: upgrade 9.22.0 -> 9.27.0
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 18:59:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109082

I see it failing to compile for riscv/clang-18

https://errors.yoctoproject.org/Errors/Details/755164/

On Thu, Feb 29, 2024 at 8:14=E2=80=AFPM Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> rebased patches:
> 0001-drbd-utils-support-usrmerge.patch
> 0001-drbdmon-add-LDFLAGS-when-linking.patch
>
> removed patches that already in upstream code repository
> 0001-replace-off64_t-with-off_t.patch
> 0002-drbdadm-drop-use-of-GLOB_MAGCHAR-use-strchr-heuristi.patch
>
> add keyutils depends
>
> Change log
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  9.27.0
>  * adjust,v9: retry for diskless primaries
>  * tests: sanitize env (e.g., TZ)
>  * drbdmeta: dump and restore the members field
>  9.26.0
>  * config,v9: new config option load-balance-paths
>  * config,v9: new config options rdma-ctrls-(snd|rcv)buf-size
>  * drbdadm,v9: fix segfault if proxy has no path
>  * drbd: increase maximum CPU mask size
>  * systemd: introduce drbd-graceful-shutdown.service
>  * drbdmeta,v9: fix regression, allow attach after offline resize
>  * drbdsetup,v9: add path established information to JSON status
>  * events2: terminate on module unload even under --poll
>  * events2: specif exit code if module unload
>  * docs: add spdx license file
>  * drbdmon: various smaller improvements
>  * drbdsetup,v9: support for TLS/kTLS
>  9.25.0
>  * drbdsetup,v9,show: fix meta disk format for json
>  * drbdmon: various updates
>  * build: fix RHEL6 spec builds
>  * drbdmeta: {hex,}dump superblock
>  * drbdmon: major rewrite
>  * build: gcc v12 cleanups
>  * misc: put locks into separate dir
>  * selinux: add fowner fsetsid, they dropped a global noaudit rule
>  9.24.0
> * windrbd: various fixes
>  * v9: Support user-defined block-size
>  * doc,v9: improvements all over the place
>  * drbdadm,v9: implement drbdadm role <res:peer>
>  * drbdadm,v9: pass --verbose/--statistics to drbdsetup status
>  * drbd{adm,meta}: add repair-md subcommand
>  9.23.1
>  * drbdadm,v9,resync-after: fix too strict check
>  9.23.0
>  * drbdadm,v9,floating: fixup fake uname for 9.2.x strict_names=3D1
>  * drbdadm,v9,parser: fixup globs, also rm GNU libc specific extensions
>  * drbdadm,v9,parser: allow via outside-address for NATed peers
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  .../0001-drbd-utils-support-usrmerge.patch    | 17 ++--
>  ...001-drbdmon-add-LDFLAGS-when-linking.patch | 14 +--
>  .../0001-replace-off64_t-with-off_t.patch     | 48 ----------
>  ...-of-GLOB_MAGCHAR-use-strchr-heuristi.patch | 96 -------------------
>  ...d-utils_9.22.0.bb =3D> drbd-utils_9.27.0.bb} |  8 +-
>  5 files changed, 18 insertions(+), 165 deletions(-)
>  delete mode 100644 meta-networking/recipes-support/drbd/drbd-utils/0001-=
replace-off64_t-with-off_t.patch
>  delete mode 100644 meta-networking/recipes-support/drbd/drbd-utils/0002-=
drbdadm-drop-use-of-GLOB_MAGCHAR-use-strchr-heuristi.patch
>  rename meta-networking/recipes-support/drbd/{drbd-utils_9.22.0.bb =3D> d=
rbd-utils_9.27.0.bb} (90%)
>
> diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-ut=
ils-support-usrmerge.patch b/meta-networking/recipes-support/drbd/drbd-util=
s/0001-drbd-utils-support-usrmerge.patch
> index 4e1f68be09..27f0a9b54a 100644
> --- a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-sup=
port-usrmerge.patch
> +++ b/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-sup=
port-usrmerge.patch
> @@ -1,4 +1,4 @@
> -From 69011c7227ad1aaf08d5ab28e46f85dac951c597 Mon Sep 17 00:00:00 2001
> +From 264ae7b062ac52a5545a8a562b51001f7ce7369d Mon Sep 17 00:00:00 2001
>  From: Changqing Li <changqing.li@windriver.com>
>  Date: Thu, 21 Apr 2022 17:22:35 +0800
>  Subject: [PATCH] drbd-utils: support usermerge
> @@ -21,10 +21,10 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com=
>
>   10 files changed, 32 insertions(+), 32 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index ae575586..3d7deeae 100644
> +index f1d69ea3..3289ac7d 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -180,7 +180,7 @@ AC_ARG_WITH(tmpfilesdir,
> +@@ -183,7 +183,7 @@ AC_ARG_WITH(tmpfilesdir,
>   AC_SUBST(tmpfilesdir)
>
>   # set default early
> @@ -34,12 +34,12 @@ index ae575586..3d7deeae 100644
>      test x"$with_udev" =3D xyes ; then
>         if test x"$PKG_CONFIG" !=3D x; then
>  diff --git a/scripts/Makefile.in b/scripts/Makefile.in
> -index fcd298e9..bab441a5 100644
> +index aca15a22..a1cd2ffe 100644
>  --- a/scripts/Makefile.in
>  +++ b/scripts/Makefile.in
> -@@ -88,11 +88,11 @@ ifeq ($(subst both,systemd,$(initscripttype)),system=
d)
> +@@ -91,11 +91,11 @@ ifeq ($(subst both,systemd,$(initscripttype)),system=
d)
>         install -d $(DESTDIR)$(systemdunitdir)
> -       install -m 644 drbd.service $(DESTDIR)$(systemdunitdir)/
> +       install -m 644 $(SYSTEMD_UNITS) $(DESTDIR)$(systemdunitdir)/
>         install -m 644 $(SYSTEMD_TEMPLATES) $(DESTDIR)$(systemdunitdir)/
>  -      install -d $(DESTDIR)/lib/drbd/scripts
>  -      install -m 755 drbd $(DESTDIR)/lib/drbd/scripts
> @@ -110,7 +110,7 @@ index 96c599e7..c81e95a6 100644
>   [Install]
>   WantedBy=3Dmulti-user.target
>  diff --git a/scripts/drbd@.service b/scripts/drbd@.service
> -index 76514c5b..e2e500ba 100644
> +index 0fad10be..556f3857 100644
>  --- a/scripts/drbd@.service
>  +++ b/scripts/drbd@.service
>  @@ -35,8 +35,8 @@ RemainAfterExit=3Dyes
> @@ -199,6 +199,3 @@ index 0fcefc5f..81f7d5ec 100644
>
>   spell:
>         for f in drbdadm_adjust.c drbdadm_main.c drbdadm_parser.c drbdadm=
_usage_cnt.c drbdsetup.c drbdtool_common.c; do \
> ---
> -2.25.1
> -
> diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbdmon=
-add-LDFLAGS-when-linking.patch b/meta-networking/recipes-support/drbd/drbd=
-utils/0001-drbdmon-add-LDFLAGS-when-linking.patch
> index 0bf4b2fce1..c7766067a1 100644
> --- a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbdmon-add-LD=
FLAGS-when-linking.patch
> +++ b/meta-networking/recipes-support/drbd/drbd-utils/0001-drbdmon-add-LD=
FLAGS-when-linking.patch
> @@ -1,15 +1,17 @@
> -From a61b9ff2d2cb7387a5cd347b2201535ee45a46ee Mon Sep 17 00:00:00 2001
> +From bb044160faf4ae7615ddfdb17641dd88c33cde57 Mon Sep 17 00:00:00 2001
>  From: Sakib Sajal <sakib.sajal@windriver.com>
>  Date: Thu, 31 Mar 2022 15:09:58 -0400
>  Subject: [PATCH] drbdmon: add LDFLAGS when linking
>
> -Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ----
>  Upstream-Status: Pending
>
> - user/drbdmon/Makefile.in | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + user/drbdmon/Makefile.in | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
>
> +diff --git a/user/drbdmon/Makefile.in b/user/drbdmon/Makefile.in
> +index 7bd8987e..115a81b8 100644
>  --- a/user/drbdmon/Makefile.in
>  +++ b/user/drbdmon/Makefile.in
>  @@ -1,6 +1,6 @@
> @@ -20,7 +22,7 @@ Upstream-Status: Pending
>   CXX =3D @CXX@
>   LIBS =3D @LIBS@
>
> -@@ -51,7 +51,7 @@ $(dsaext-obj): $(basename $(dsaext-obj))
> +@@ -72,7 +72,7 @@ $(dsaext-obj): $(basename $(dsaext-obj)).cpp $(basenam=
e $(dsaext-obj)).h
>   $(integerparse-obj): $(basename $(integerparse-obj)).cpp $(basename $(i=
ntegerparse-obj)).h
>
>   drbdmon: $(ls-obj)
> diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-replace=
-off64_t-with-off_t.patch b/meta-networking/recipes-support/drbd/drbd-utils=
/0001-replace-off64_t-with-off_t.patch
> deleted file mode 100644
> index 2841d0feaf..0000000000
> --- a/meta-networking/recipes-support/drbd/drbd-utils/0001-replace-off64_=
t-with-off_t.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From 5adae6737e919d957a08df437951ccb6996f9882 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 21 Dec 2022 19:16:03 -0800
> -Subject: [PATCH 1/2] replace off64_t with off_t
> -
> -off_t is already 64-bits when _FILE_OFFSET_BITS=3D64
> -using off_t also makes it portable on musl systems
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - user/v9/drbdadm_main.c | 10 +++++-----
> - 1 file changed, 5 insertions(+), 5 deletions(-)
> -
> -diff --git a/user/v9/drbdadm_main.c b/user/v9/drbdadm_main.c
> -index 91e9507d..2030946c 100644
> ---- a/user/v9/drbdadm_main.c
> -+++ b/user/v9/drbdadm_main.c
> -@@ -1264,11 +1264,11 @@ static int adm_resource(const struct cfg_ctx *ct=
x)
> -       return ex;
> - }
> -
> --static off64_t read_drbd_dev_size(int minor)
> -+static off_t read_drbd_dev_size(int minor)
> - {
> -       char *path;
> -       FILE *file;
> --      off64_t val;
> -+      off_t val;
> -       int r;
> -
> -       m_asprintf(&path, "/sys/block/drbd%d/size", minor);
> -@@ -1289,9 +1289,9 @@ int adm_resize(const struct cfg_ctx *ctx)
> -       char *argv[MAX_ARGS];
> -       struct d_option *opt;
> -       bool is_resize =3D !strcmp(ctx->cmd->name, "resize");
> --      off64_t old_size =3D -1;
> --      off64_t target_size =3D 0;
> --      off64_t new_size;
> -+      off_t old_size =3D -1;
> -+      off_t target_size =3D 0;
> -+      off_t new_size;
> -       int argc =3D 0;
> -       int silent;
> -       int ex;
> ---
> -2.39.0
> -
> diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0002-drbdadm=
-drop-use-of-GLOB_MAGCHAR-use-strchr-heuristi.patch b/meta-networking/recip=
es-support/drbd/drbd-utils/0002-drbdadm-drop-use-of-GLOB_MAGCHAR-use-strchr=
-heuristi.patch
> deleted file mode 100644
> index 45f7d6d415..0000000000
> --- a/meta-networking/recipes-support/drbd/drbd-utils/0002-drbdadm-drop-u=
se-of-GLOB_MAGCHAR-use-strchr-heuristi.patch
> +++ /dev/null
> @@ -1,96 +0,0 @@
> -From b70e5bf5bfa5fa2c2fffe08bcf300da1d3583602 Mon Sep 17 00:00:00 2001
> -From: Lars Ellenberg <lars.ellenberg@linbit.com>
> -Date: Wed, 9 Nov 2022 11:01:54 +0100
> -Subject: [PATCH 2/2] drbdadm: drop use of GLOB_MAGCHAR, use strchr heuri=
stic only
> -
> -Fixup for
> -2022-09-05 4a1b5900 drbdadm: allow files from an expanded include glob t=
o vanish
> -
> -When using the `include` statement, if the glob did not match any file,
> -there is nothing to do, silently ignore.  Unless it was no glob, but a l=
iteral,
> -which we would expect to exist.
> -
> -Also, there is a race between expanding a glob and accessing the file.
> -That also should not happen for literals, though.
> -
> -Since we still had the heuristic anyways, because apparently |GLOB_MAGCH=
AR
> -does not happen for GLOB_NOMATCH returns, and there exist non-GNU libc t=
hat
> -don't (and likely won't) implement that extension, just forget about
> -(gl_flags & GLOB_MAGCHAR) but use the incomplete strchr heuristic only.
> -
> -Sourced From Alpine: https://git.alpinelinux.org/aports/tree/main/drbd-u=
tils/drop_use_of_GLOB_MAGCHAR.patch
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - user/v9/drbdadm_parser.c | 35 ++++++++++++++++++++---------------
> - 1 file changed, 20 insertions(+), 15 deletions(-)
> -
> -diff --git a/user/v9/drbdadm_parser.c b/user/v9/drbdadm_parser.c
> -index b2f6ed8a..9a0a775d 100644
> ---- a/user/v9/drbdadm_parser.c
> -+++ b/user/v9/drbdadm_parser.c
> -@@ -1947,14 +1947,29 @@ void include_stmt(char *str)
> -       size_t i;
> -       int r;
> -
> --      cwd =3D pushd_to_current_config_file_unless_stdin();
> --
> --      /* """
> -+      /*
> -+       * If the glob did not match any file,
> -+       * there is nothing to do, silently ignore.
> -+       * Unless it was no glob, but a literal,
> -+       * which we would expect to exist.
> -+       *
> -+       * """
> -        * As a GNU extension, pglob->gl_flags is set to the
> -        * flags specified, ored with GLOB_MAGCHAR if any
> -        * metacharacters were found.
> -        * """
> -+       *
> -+       * But apparently |GLOB_MAGCHAR does not happen for GLOB_NOMATCH =
returns,
> -+       * at least not consistently :-(
> -+       * Also, there exist non-GNU libc
> -+       * So we have this incomplete strchr heuristic anyways.
> -        */
> -+      bool contains_glob_magic_char =3D
> -+                      strchr(str, '*') ||
> -+                      strchr(str, '?') ||
> -+                      strchr(str, '[');
> -+
> -+      cwd =3D pushd_to_current_config_file_unless_stdin();
> -       r =3D glob(str, 0, NULL, &glob_buf);
> -       if (r =3D=3D 0) {
> -               for (i=3D0; i<glob_buf.gl_pathc; i++) {
> -@@ -1965,7 +1980,7 @@ void include_stmt(char *str)
> -                       if (f) {
> -                               include_file(f, strdup(glob_buf.gl_pathv[=
i]));
> -                               fclose(f);
> --                      } else if (errno =3D=3D ENOENT && glob_buf.gl_fla=
gs & GLOB_MAGCHAR) {
> -+                      } else if (errno =3D=3D ENOENT && contains_glob_m=
agic_char) {
> -                               /* Noisily ignore race between glob expan=
sion
> -                                * and actual open. */
> -                               err("%s:%d: include file vanished after g=
lob expansion '%s'.\n",
> -@@ -1979,17 +1994,7 @@ void include_stmt(char *str)
> -               }
> -               globfree(&glob_buf);
> -       } else if (r =3D=3D GLOB_NOMATCH) {
> --              /*
> --               * If the glob did not match any file,
> --               * there is nothing to do, silently ignore.
> --               * Unless it was no glob, but a literal,
> --               * which we would expect to exist.
> --               * Apparently |GLOB_MAGCHAR does not happen for GLOB_NOMA=
TCH returns,
> --               * at least not consistently :-(
> --               * So we have this strchr heuristic anyways.
> --               */
> --              /* if (!(glob_buf.gl_flags & GLOB_MAGCHAR)) { */
> --              if (!strchr(str, '?') && !strchr(str, '*') && !strchr(str=
, '[')) {
> -+              if (!contains_glob_magic_char) {
> -                       err("%s:%d: Failed to open include file '%s'.\n",
> -                           config_save, line, str);
> -                       config_valid =3D 0;
> ---
> -2.39.0
> -
> diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.22.0.bb b/=
meta-networking/recipes-support/drbd/drbd-utils_9.27.0.bb
> similarity index 90%
> rename from meta-networking/recipes-support/drbd/drbd-utils_9.22.0.bb
> rename to meta-networking/recipes-support/drbd/drbd-utils_9.27.0.bb
> index 89bf529165..c50d326224 100644
> --- a/meta-networking/recipes-support/drbd/drbd-utils_9.22.0.bb
> +++ b/meta-networking/recipes-support/drbd/drbd-utils_9.27.0.bb
> @@ -11,12 +11,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5574c6965a=
e5f583e55880e397fbb018"
>  SRC_URI =3D "git://github.com/LINBIT/drbd-utils;name=3Ddrbd-utils;branch=
=3Dmaster;protocol=3Dhttps \
>             git://github.com/LINBIT/drbd-headers;name=3Ddrbd-headers;dest=
suffix=3Dgit/drbd-headers;branch=3Dmaster;protocol=3Dhttps \
>             file://0001-drbdmon-add-LDFLAGS-when-linking.patch \
> -           file://0001-replace-off64_t-with-off_t.patch \
>             ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://000=
1-drbd-utils-support-usrmerge.patch','',d)} \
>             "
> -SRC_URI:append:libc-musl =3D " file://0002-drbdadm-drop-use-of-GLOB_MAGC=
HAR-use-strchr-heuristi.patch "
> -SRCREV_drbd-utils =3D "409097fe02187f83790b88ac3e0d94f3c167adab"
> -SRCREV_drbd-headers =3D "9a0f151fa0085f57910a2dcbbd658d6069554f62"
> +SRCREV_drbd-utils =3D "fdd9a4d603a9dc99d110d8bd0e288d7c0b6f586e"
> +SRCREV_drbd-headers =3D "0349f00825b4198d4ec3248f43884114a187676a"
>
>  SRCREV_FORMAT =3D "drbd-utils_drbd-headers"
>
> @@ -27,7 +25,7 @@ UPSTREAM_CHECK_URI =3D "https://github.com/LINBIT/drbd-=
utils/releases"
>  SYSTEMD_SERVICE:${PN} =3D "drbd.service"
>  SYSTEMD_AUTO_ENABLE =3D "disable"
>
> -DEPENDS =3D "flex-native"
> +DEPENDS =3D "flex-native keyutils"
>
>  inherit autotools-brokensep systemd
>
> --
> 2.35.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109066): https://lists.openembedded.org/g/openembedde=
d-devel/message/109066
> Mute This Topic: https://lists.openembedded.org/mt/104658401/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

