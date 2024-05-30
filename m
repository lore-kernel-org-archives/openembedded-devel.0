Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94CA1C25B7E
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 20:29:43 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.1947.1717100975309869128
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 May 2024 13:29:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bb2OdvBn;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5241b49c0daso1621265e87.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 13:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717100973; x=1717705773; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/DBIrgU49GnbsJEAIIptb/W7o/CP/6CEGec08CLOR8I=;
        b=Bb2OdvBnOGYqXFWho16BBQzbrCT437QGc5c/W+agTtC2cBUDCLDh/yeijduoG/lJyi
         0K52+Ynig2JKvDigJ7gbAsT5kO92rFl3DUBVR5LkUtCTSbd+G1S0aSc7R3feJo4+kzQg
         1vdXGI+BRzgk+h8A7YPJrR5o36EKE3JFWPUcaXjhcYk4/Q8XkPSH1M5EdmbTpUmgMpgT
         TyXK0N/xLGOSY7Y1DG8pviQNnxWjP09fwLAHwoAivdKz4C1Jw/Tkt00TMAqarv10ue5F
         t+WnKp3Er3xFwVlypH+hIqkyO1Uawc8Nx5Jlgw2PQVwIvsA9HqBIo6anra3VmV5IH5U2
         ddEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717100973; x=1717705773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/DBIrgU49GnbsJEAIIptb/W7o/CP/6CEGec08CLOR8I=;
        b=IBVq5mXANieExHgfQyHryqQ9aOJlWWkI+7/skdBVuWGyWUDShQNWam1AyKOoGKJl5C
         N/3PfSl3GYmaqhTqoqAiB5PK66PcCPWKOajoq2ghS0myte0w1MBqUtHJuSKIE2nyvCI7
         ECA2njJNltLD4gciMOksIxlf8hwoYA9gez9cpuG0TLrgU9gXEFQUW41j5o3LSKjyaPGu
         KCA8gavs/PksXhvuLMWC+5AckhlOfs5FegDeh38mSemlDakyn+amx20aVA10c5lQyXxL
         hSBkGaft3252xkYBQoJUBzUsmvWsM6tTiOAlpjrSNfHQZqdDprtp2J9K2vpq8kaJp20Y
         EzNQ==
X-Gm-Message-State: AOJu0YwrIpZbJTfAJKB0ItIqWNz/hWZNqMBoicmkIK2WD4GOs0spNAom
	br6L/p493AaTiTbpNmEhYBXsHEE6dFRYsfGaR0nH6U5D9e6e8kUz6dpggH97iN8JMnlGB6IwMNP
	g5idLMwD0W2bftoRoRm/wxkOabfc=
X-Google-Smtp-Source: AGHT+IFkR4cenyLzmlHpN3UQiEZRu3lnfdOAlXhSndy0FwhRDeiWh3du24LrC11CutOvwjqHH358VVh8swFsc1DyWvM=
X-Received: by 2002:a05:6512:2c97:b0:52a:d07f:48c4 with SMTP id
 2adb3069b0e04-52b7d47adadmr2354544e87.52.1717100972758; Thu, 30 May 2024
 13:29:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240528081807.642396-1-f_l_k@t-online.de>
In-Reply-To: <20240528081807.642396-1-f_l_k@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 30 May 2024 22:29:08 +0200
Message-ID: <CA+chaQfKFweAegvotF=MdBtqHBqj4BnuNNHm3ooT2Ri=So1n8g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] lvm2: remove subitted patch
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 20:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110647

This causes:

ERROR: QA Issue: Missing Upstream-Status in patch
TOPDIR/meta-oe/meta-oe/recipes-support/lvm2/files/0001-implement-libc-speci=
fic-reopen_stream.patch
Please add according to
https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#pat=
ch-upstream-status
. [patch-status]

On Tue, May 28, 2024 at 10:17=E2=80=AFAM Markus Volk via
lists.openembedded.org <f_l_k=3Dt-online.de@lists.openembedded.org>
wrote:
>
> devmapper update also updated lvm2. Thus build fails with:
> patching file daemons/lvmdbusd/utils.py
> Hunk #1 FAILED at 778.
> 1 out of 1 hunk FAILED -- rejects in file daemons/lvmdbusd/utils.py
>
> - Drop the submitted patch
> - Move PV to lvm2.inc to ensure we keep it in sync for libdevmapper and l=
vm2
> - refresh patches
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../0001-Avoid-bashisms-in-init-scripts.patch | 17 +++++-----
>  .../files/0001-configure.ac-check-egrep.patch | 12 +++----
>  ...mplement-libc-specific-reopen_stream.patch | 31 +++++++++----------
>  .../0001-include-libgen.h-for-basename.patch  |  9 ++----
>  ...tweak-MODPROBE_CMD-for-cross-compile.patch | 11 +++----
>  .../lvm2/files/0005-do-not-build-manual.patch | 15 ++++-----
>  ...lvm2-monitor.service-after-tmp.mount.patch |  7 ++---
>  .../lvm2/files/reproducible-build.patch       | 15 ++++++---
>  ...ibdevmapper_2.03.24.bb =3D> libdevmapper.bb} |  0
>  .../lvm2/{lvm2_2.03.22.bb =3D> lvm2.bb}         |  1 -
>  meta-oe/recipes-support/lvm2/lvm2.inc         |  1 +
>  ...findmnt-bin-lsblk-bin-sort-not-found.patch | 11 +++----
>  ...1-lvmdbusd-create-dirs-for-lock-file.patch | 29 -----------------
>  .../lvm2/lvm2/tweak-for-lvmdbusd.patch        | 13 +++++---
>  14 files changed, 67 insertions(+), 105 deletions(-)
>  rename meta-oe/recipes-support/lvm2/{libdevmapper_2.03.24.bb =3D> libdev=
mapper.bb} (100%)
>  rename meta-oe/recipes-support/lvm2/{lvm2_2.03.22.bb =3D> lvm2.bb} (98%)
>  delete mode 100644 meta-oe/recipes-support/lvm2/lvm2/0001-lvmdbusd-creat=
e-dirs-for-lock-file.patch
>
> diff --git a/meta-oe/recipes-support/lvm2/files/0001-Avoid-bashisms-in-in=
it-scripts.patch b/meta-oe/recipes-support/lvm2/files/0001-Avoid-bashisms-i=
n-init-scripts.patch
> index 3c4a3a151..fb58793a1 100644
> --- a/meta-oe/recipes-support/lvm2/files/0001-Avoid-bashisms-in-init-scri=
pts.patch
> +++ b/meta-oe/recipes-support/lvm2/files/0001-Avoid-bashisms-in-init-scri=
pts.patch
> @@ -1,7 +1,7 @@
> -From ea66faf68c93735edb1f2691cd7364b8cab83fef Mon Sep 17 00:00:00 2001
> +From 44695f332e206e1db43d50163e1bce0bedf75fb7 Mon Sep 17 00:00:00 2001
>  From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>  Date: Mon, 26 Nov 2018 14:53:09 +0800
> -Subject: [PATCH 1/3] Avoid bashisms in init scripts
> +Subject: [PATCH] Avoid bashisms in init scripts
>
>  Upstream-Status: Inappropriate
>
> @@ -19,7 +19,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>   5 files changed, 10 insertions(+), 10 deletions(-)
>
>  diff --git a/scripts/blk_availability_init_red_hat.in b/scripts/blk_avai=
lability_init_red_hat.in
> -index 347c395..b2e9cf9 100644
> +index 347c39574..b2e9cf932 100644
>  --- a/scripts/blk_availability_init_red_hat.in
>  +++ b/scripts/blk_availability_init_red_hat.in
>  @@ -1,4 +1,4 @@
> @@ -37,7 +37,7 @@ index 347c395..b2e9cf9 100644
>         ;;
>   esac
>  diff --git a/scripts/cmirrord_init_red_hat.in b/scripts/cmirrord_init_re=
d_hat.in
> -index c82f8f5..a3a321d 100755
> +index c82f8f547..a3a321d9c 100755
>  --- a/scripts/cmirrord_init_red_hat.in
>  +++ b/scripts/cmirrord_init_red_hat.in
>  @@ -1,4 +1,4 @@
> @@ -56,7 +56,7 @@ index c82f8f5..a3a321d 100755
>   esac
>
>  diff --git a/scripts/lvm2_lvmpolld_init_red_hat.in b/scripts/lvm2_lvmpol=
ld_init_red_hat.in
> -index 176ff5d..825f6ad 100644
> +index 176ff5dcb..825f6ad84 100644
>  --- a/scripts/lvm2_lvmpolld_init_red_hat.in
>  +++ b/scripts/lvm2_lvmpolld_init_red_hat.in
>  @@ -1,4 +1,4 @@
> @@ -75,7 +75,7 @@ index 176ff5d..825f6ad 100644
>   esac
>
>  diff --git a/scripts/lvm2_monitoring_init_red_hat.in b/scripts/lvm2_moni=
toring_init_red_hat.in
> -index 95e4125..dff89cd 100644
> +index 95e4125a0..dff89cd38 100644
>  --- a/scripts/lvm2_monitoring_init_red_hat.in
>  +++ b/scripts/lvm2_monitoring_init_red_hat.in
>  @@ -1,4 +1,4 @@
> @@ -94,7 +94,7 @@ index 95e4125..dff89cd 100644
>   esac
>
>  diff --git a/scripts/lvm2_monitoring_init_rhel4 b/scripts/lvm2_monitorin=
g_init_rhel4
> -index 8eb06c5..2e8d0f7 100644
> +index 8eb06c509..2e8d0f71e 100644
>  --- a/scripts/lvm2_monitoring_init_rhel4
>  +++ b/scripts/lvm2_monitoring_init_rhel4
>  @@ -1,4 +1,4 @@
> @@ -112,6 +112,3 @@ index 8eb06c5..2e8d0f7 100644
>         ;;
>   esac
>
> ---
> -2.7.4
> -
> diff --git a/meta-oe/recipes-support/lvm2/files/0001-configure.ac-check-e=
grep.patch b/meta-oe/recipes-support/lvm2/files/0001-configure.ac-check-egr=
ep.patch
> index 474c2f8ac..f4b0f913d 100644
> --- a/meta-oe/recipes-support/lvm2/files/0001-configure.ac-check-egrep.pa=
tch
> +++ b/meta-oe/recipes-support/lvm2/files/0001-configure.ac-check-egrep.pa=
tch
> @@ -1,4 +1,7 @@
> -configure.ac: check egrep
> +From f261b2f1bc16c32a55a22e28bf1b2f15ac6c7a88 Mon Sep 17 00:00:00 2001
> +From: Kai Kang <kai.kang@windriver.com>
> +Date: Wed, 6 Dec 2023 10:24:46 +0800
> +Subject: [PATCH] configure.ac: check egrep
>
>  The macro AC_HEADER_STDC which requires AC_PROG_EGREP has been removed
>  from configure.ac, then it fails to substitute '@EGREP@':
> @@ -17,10 +20,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
>   1 file changed, 1 insertion(+)
>
>  diff --git a/configure.ac b/configure.ac
> -index 2e52498f9..d9462e22c 100644
> +index c2dbf3c9f..d9e7964c3 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -78,6 +78,7 @@ AC_PROG_LN_S
> +@@ -88,6 +88,7 @@ AC_PROG_EGREP
>   AC_PROG_MAKE_SET
>   AC_PROG_MKDIR_P
>   AC_PROG_RANLIB
> @@ -28,6 +31,3 @@ index 2e52498f9..d9462e22c 100644
>   AC_CHECK_TOOL([READELF], [readelf])
>   AC_CHECK_TOOL(AR, ar)
>   AC_PATH_TOOL(CFLOW_CMD, cflow)
> ---
> -2.34.1
> -
> diff --git a/meta-oe/recipes-support/lvm2/files/0001-implement-libc-speci=
fic-reopen_stream.patch b/meta-oe/recipes-support/lvm2/files/0001-implement=
-libc-specific-reopen_stream.patch
> index f46d7f701..a064516e3 100644
> --- a/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reo=
pen_stream.patch
> +++ b/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reo=
pen_stream.patch
> @@ -1,4 +1,4 @@
> -From e3103459416616d3b8508e7176e897b0ae6c90f2 Mon Sep 17 00:00:00 2001
> +From a86919ed5468f3c152114446c189b00f5f656d59 Mon Sep 17 00:00:00 2001
>  From: Dengke Du <dengke.du@windriver.com>
>  Date: Tue, 25 Oct 2016 11:49:40 +0000
>  Subject: [PATCH] implement libc specific reopen_stream
> @@ -13,19 +13,16 @@ http://git.alpinelinux.org/cgit/aports/tree/main/lvm2=
/fix-stdio-usage.patch
>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  Signed-off-by: Dengke Du <dengke.du@windriver.com>
> -
>  ---
> -Upstream-Status: Pending
> -
>   lib/log/log.c      | 6 ++++++
>   tools/lvmcmdline.c | 6 +++---
>   2 files changed, 9 insertions(+), 3 deletions(-)
>
> -Index: LVM2.2.02.177/lib/log/log.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- LVM2.2.02.177.orig/lib/log/log.c
> -+++ LVM2.2.02.177/lib/log/log.c
> -@@ -161,6 +161,7 @@ static void _check_and_replace_standard_
> +diff --git a/lib/log/log.c b/lib/log/log.c
> +index 7b88252f0..e1720098a 100644
> +--- a/lib/log/log.c
> ++++ b/lib/log/log.c
> +@@ -165,6 +165,7 @@ static void _check_and_replace_standard_log_streams(=
FILE *old_stream, FILE *new_
>    * Close and reopen standard stream on file descriptor fd.
>    */
>   int reopen_standard_stream(FILE **stream, const char *mode)
> @@ -33,7 +30,7 @@ Index: LVM2.2.02.177/lib/log/log.c
>   {
>         int fd, fd_copy, new_fd;
>         const char *name;
> -@@ -207,6 +208,11 @@ int reopen_standard_stream(FILE **stream
> +@@ -211,6 +212,11 @@ int reopen_standard_stream(FILE **stream, const cha=
r *mode)
>         *stream =3D new_stream;
>         return 1;
>   }
> @@ -45,11 +42,11 @@ Index: LVM2.2.02.177/lib/log/log.c
>
>   void init_log_fn(lvm2_log_fn_t log_fn)
>   {
> -Index: LVM2.2.02.177/tools/lvmcmdline.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- LVM2.2.02.177.orig/tools/lvmcmdline.c
> -+++ LVM2.2.02.177/tools/lvmcmdline.c
> -@@ -3095,7 +3095,7 @@ static int _check_standard_fds(void)
> +diff --git a/tools/lvmcmdline.c b/tools/lvmcmdline.c
> +index 3fd23a521..c2ee39905 100644
> +--- a/tools/lvmcmdline.c
> ++++ b/tools/lvmcmdline.c
> +@@ -3380,7 +3380,7 @@ static int _check_standard_fds(void)
>         int err =3D is_valid_fd(STDERR_FILENO);
>
>         if (!is_valid_fd(STDIN_FILENO) &&
> @@ -58,7 +55,7 @@ Index: LVM2.2.02.177/tools/lvmcmdline.c
>                 if (err)
>                         perror("stdin stream open");
>                 else
> -@@ -3105,7 +3105,7 @@ static int _check_standard_fds(void)
> +@@ -3390,7 +3390,7 @@ static int _check_standard_fds(void)
>         }
>
>         if (!is_valid_fd(STDOUT_FILENO) &&
> @@ -67,7 +64,7 @@ Index: LVM2.2.02.177/tools/lvmcmdline.c
>                 if (err)
>                         perror("stdout stream open");
>                 /* else no stdout */
> -@@ -3113,7 +3113,7 @@ static int _check_standard_fds(void)
> +@@ -3398,7 +3398,7 @@ static int _check_standard_fds(void)
>         }
>
>         if (!is_valid_fd(STDERR_FILENO) &&
> diff --git a/meta-oe/recipes-support/lvm2/files/0001-include-libgen.h-for=
-basename.patch b/meta-oe/recipes-support/lvm2/files/0001-include-libgen.h-=
for-basename.patch
> index 7add3a7bb..83a7f936b 100644
> --- a/meta-oe/recipes-support/lvm2/files/0001-include-libgen.h-for-basena=
me.patch
> +++ b/meta-oe/recipes-support/lvm2/files/0001-include-libgen.h-for-basena=
me.patch
> @@ -1,4 +1,4 @@
> -From 1b9677f40ac547ba19d1cdbfd700901eab0a0d0b Mon Sep 17 00:00:00 2001
> +From 4e7f4ea0bf89726255612a2a382c064e5923fbcd Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 25 Mar 2024 13:07:28 -0700
>  Subject: [PATCH] include libgen.h for basename
> @@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 1 insertion(+)
>
>  diff --git a/lib/device/device_id.c b/lib/device/device_id.c
> -index 1422f5d05..8215811bd 100644
> +index 2b183810a..53467cbbb 100644
>  --- a/lib/device/device_id.c
>  +++ b/lib/device/device_id.c
> -@@ -25,6 +25,7 @@
> +@@ -26,6 +26,7 @@
>   #include "lib/datastruct/str_list.h"
>   #include "lib/metadata/metadata-exported.h"
>
> @@ -27,6 +27,3 @@ index 1422f5d05..8215811bd 100644
>   #include <sys/stat.h>
>   #include <fcntl.h>
>   #include <unistd.h>
> ---
> -2.44.0
> -
> diff --git a/meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROBE_CMD-f=
or-cross-compile.patch b/meta-oe/recipes-support/lvm2/files/0004-tweak-MODP=
ROBE_CMD-for-cross-compile.patch
> index ed9972a5f..6435c3fd9 100644
> --- a/meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROBE_CMD-for-cros=
s-compile.patch
> +++ b/meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROBE_CMD-for-cros=
s-compile.patch
> @@ -1,7 +1,7 @@
> -From 3bba45890985b877b823836e78a1c8ac3c878856 Mon Sep 17 00:00:00 2001
> +From b30f842d5d200a8217a47465d6cdd99d3805ba76 Mon Sep 17 00:00:00 2001
>  From: Hongxu Jia <hongxu.jia@windriver.com>
>  Date: Tue, 31 Jul 2018 15:04:29 +0800
> -Subject: [PATCH 4/4] tweak MODPROBE_CMD for cross compile
> +Subject: [PATCH] tweak MODPROBE_CMD for cross compile
>
>  Lvm uses variable MODPROBE_CMD at runtime, so build time detection of mo=
dprobe
>  is incorrect.
> @@ -21,10 +21,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>   1 file changed, 2 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index b43d8b9be..efe3062c1 100644
> +index c8d81e16c..7c1c04627 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -1646,8 +1646,6 @@ AS_IF([test "$BUILD_DMFILEMAPD" =3D "yes"], [
> +@@ -1689,8 +1689,6 @@ AS_IF([test "$BUILD_DMFILEMAPD" =3D "yes"], [
>   ])
>
>   #######################################################################=
#########
> @@ -33,6 +33,3 @@ index b43d8b9be..efe3062c1 100644
>   AS_IF([test -n "$MODPROBE_CMD"], [
>         AC_DEFINE_UNQUOTED([MODPROBE_CMD], ["$MODPROBE_CMD"], [The path t=
o 'modprobe', if available.])
>   ])
> ---
> -2.7.4
> -
> diff --git a/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.=
patch b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
> index 7979efbef..e7aaad4d0 100644
> --- a/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
> +++ b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
> @@ -1,7 +1,7 @@
> -From 103ac1c1200df8190372d973e004776cffe8e659 Mon Sep 17 00:00:00 2001
> +From e0e06b77e067da6a01dd9b0d5582a0a1709c655d Mon Sep 17 00:00:00 2001
>  From: Hongxu Jia <hongxu.jia@windriver.com>
>  Date: Mon, 26 Nov 2018 14:59:55 +0800
> -Subject: [PATCH 2/3] do not build manual
> +Subject: [PATCH] do not build manual
>
>  On some host (ubuntu 1404), build manual failed.
>  ...
> @@ -26,7 +26,7 @@ Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>   2 files changed, 3 insertions(+), 4 deletions(-)
>
>  diff --git a/Makefile.in b/Makefile.in
> -index 3b7e0ec..37f14eb 100644
> +index 06c4b1823..90df7b09c 100644
>  --- a/Makefile.in
>  +++ b/Makefile.in
>  @@ -18,7 +18,7 @@ top_builddir =3D @top_builddir@
> @@ -47,7 +47,7 @@ index 3b7e0ec..37f14eb 100644
>       libdaemon lib tools daemons libdm \
>       udev po
>   tools.distclean: test.distclean
> -@@ -59,7 +59,7 @@ unit-test  run-unit-test: test
> +@@ -59,7 +59,7 @@ unit-test  run-unit-test: test libdm
>
>   daemons.device-mapper: libdm.device-mapper
>   tools.device-mapper: libdm.device-mapper
> @@ -57,10 +57,10 @@ index 3b7e0ec..37f14eb 100644
>
>   ifeq ("@INTL@", "yes")
>  diff --git a/configure.ac b/configure.ac
> -index 6def519..18a5c97 100644
> +index 7c1c04627..5364dd68e 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2018,7 +2018,6 @@ libdaemon/server/Makefile
> +@@ -2022,7 +2022,6 @@ libdaemon/server/Makefile
>   libdm/Makefile
>   libdm/dm-tools/Makefile
>   libdm/libdevmapper.pc
> @@ -68,6 +68,3 @@ index 6def519..18a5c97 100644
>   po/Makefile
>   scripts/lvm2-pvscan.service
>   scripts/blkdeactivate.sh
> ---
> -2.25.1
> -
> diff --git a/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.s=
ervice-after-tmp.mount.patch b/meta-oe/recipes-support/lvm2/files/0006-star=
t-lvm2-monitor.service-after-tmp.mount.patch
> index 5b9b2d574..2d4982005 100644
> --- a/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-=
after-tmp.mount.patch
> +++ b/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-=
after-tmp.mount.patch
> @@ -1,4 +1,4 @@
> -From e213ed33a28704f6f538df41a91b7ce95594a4f8 Mon Sep 17 00:00:00 2001
> +From 20a110ade91c73f4cb3883a3a9676708a93ca786 Mon Sep 17 00:00:00 2001
>  From: Hongxu Jia <hongxu.jia@windriver.com>
>  Date: Tue, 15 Oct 2019 18:12:54 +0800
>  Subject: [PATCH] start lvm2-monitor.service after tmp.mount
> @@ -19,7 +19,7 @@ Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/scripts/lvm2_monitoring_systemd_red_hat.service.in b/script=
s/lvm2_monitoring_systemd_red_hat.service.in
> -index c0c96e3..2a99a37 100644
> +index c0c96e316..2a99a379d 100644
>  --- a/scripts/lvm2_monitoring_systemd_red_hat.service.in
>  +++ b/scripts/lvm2_monitoring_systemd_red_hat.service.in
>  @@ -2,7 +2,7 @@
> @@ -31,6 +31,3 @@ index c0c96e3..2a99a37 100644
>   Before=3Dlocal-fs-pre.target shutdown.target
>   DefaultDependencies=3Dno
>   Conflicts=3Dshutdown.target
> ---
> -2.25.1
> -
> diff --git a/meta-oe/recipes-support/lvm2/files/reproducible-build.patch =
b/meta-oe/recipes-support/lvm2/files/reproducible-build.patch
> index 3f53db9e5..ca632d213 100644
> --- a/meta-oe/recipes-support/lvm2/files/reproducible-build.patch
> +++ b/meta-oe/recipes-support/lvm2/files/reproducible-build.patch
> @@ -1,14 +1,21 @@
> -configure.ac:  override CONFIGURE_LINE
> +From f5c6fabbdf2e7bfa105658b9dfe45d2ab86f34bb Mon Sep 17 00:00:00 2001
> +From: Joe Slater <joe.slater@windriver.com>
> +Date: Fri, 17 Jul 2020 13:59:56 -0700
> +Subject: [PATCH] configure.ac:  override CONFIGURE_LINE
>
>  For reproducible binaries, we need to report a constant CONFIGURE_LINE.
>
>  Upstream-Status: Pending
>
>  Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +---
> + configure.ac | 10 +++++++++-
> + 1 file changed, 9 insertions(+), 1 deletion(-)
>
> -
> ---- git.orig/configure.ac
> -+++ git/configure.ac
> +diff --git a/configure.ac b/configure.ac
> +index 5364dd68e..c2dbf3c9f 100644
> +--- a/configure.ac
> ++++ b/configure.ac
>  @@ -15,7 +15,15 @@ AC_PREREQ(2.69)
>   #######################################################################=
#########
>   dnl -- Process this file with autoconf to produce a configure script.
> diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.24.bb b/meta-=
oe/recipes-support/lvm2/libdevmapper.bb
> similarity index 100%
> rename from meta-oe/recipes-support/lvm2/libdevmapper_2.03.24.bb
> rename to meta-oe/recipes-support/lvm2/libdevmapper.bb
> diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.03.22.bb b/meta-oe/recip=
es-support/lvm2/lvm2.bb
> similarity index 98%
> rename from meta-oe/recipes-support/lvm2/lvm2_2.03.22.bb
> rename to meta-oe/recipes-support/lvm2/lvm2.bb
> index 200457c69..868f5a249 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2_2.03.22.bb
> +++ b/meta-oe/recipes-support/lvm2/lvm2.bb
> @@ -3,7 +3,6 @@ require lvm2.inc
>  SRC_URI +=3D " \
>              file://0001-fix-command-bin-findmnt-bin-lsblk-bin-sort-not-f=
ound.patch \
>              file://tweak-for-lvmdbusd.patch \
> -            file://0001-lvmdbusd-create-dirs-for-lock-file.patch \
>             "
>
>  DEPENDS +=3D "autoconf-archive-native"
> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-supp=
ort/lvm2/lvm2.inc
> index 0351eb6b3..29cc7425b 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> @@ -21,6 +21,7 @@ SRC_URI =3D "git://sourceware.org/git/lvm2.git;branch=
=3Dmain \
>
>  SRCREV =3D "90ec2cd92f6367c431dd8dae55d0cbe7e196734f"
>  S =3D "${WORKDIR}/git"
> +PV =3D "2.03.24"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\_\d+)+)"
>
> diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-fix-command-bin-findm=
nt-bin-lsblk-bin-sort-not-found.patch b/meta-oe/recipes-support/lvm2/lvm2/0=
001-fix-command-bin-findmnt-bin-lsblk-bin-sort-not-found.patch
> index c0cf836ce..96a3d64fd 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2/0001-fix-command-bin-findmnt-bin-=
lsblk-bin-sort-not-found.patch
> +++ b/meta-oe/recipes-support/lvm2/lvm2/0001-fix-command-bin-findmnt-bin-=
lsblk-bin-sort-not-found.patch
> @@ -1,4 +1,4 @@
> -From ddf36613f3408ce42f15b03b4e9c6ad8478b97f8 Mon Sep 17 00:00:00 2001
> +From 2ff2a867db8d3e1c660d191a1805f9e355169c80 Mon Sep 17 00:00:00 2001
>  From: Hongxu Jia <hongxu.jia@windriver.com>
>  Date: Tue, 2 Mar 2021 01:33:05 -0800
>  Subject: [PATCH] fix command /bin/findmnt, /bin/lsblk, /bin/sort not fou=
nd
> @@ -15,10 +15,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>   2 files changed, 7 insertions(+), 3 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index 991a0cf85..e59c82472 100644
> +index d9e7964c3..9dfdcfe01 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -1660,6 +1660,8 @@ AS_IF([test -n "$MODPROBE_CMD"], [
> +@@ -1704,6 +1704,8 @@ AS_IF([test -n "$MODPROBE_CMD"], [
>
>   SYSCONFDIR=3D"$(eval echo $(eval echo $sysconfdir))"
>
> @@ -27,7 +27,7 @@ index 991a0cf85..e59c82472 100644
>   SBINDIR=3D"$(eval echo $(eval echo $sbindir))"
>   LVM_PATH=3D"$SBINDIR/lvm"
>   AC_DEFINE_UNQUOTED(LVM_PATH, ["$LVM_PATH"], [Path to lvm binary.])
> -@@ -1886,6 +1888,7 @@ AC_SUBST(PYTHON2DIR)
> +@@ -1944,6 +1946,7 @@ AC_SUBST(PYTHON2DIR)
>   AC_SUBST(PYTHON3)
>   AC_SUBST(PYTHON3DIR)
>   AC_SUBST(RT_LIBS)
> @@ -68,6 +68,3 @@ index 7c517b87b..7ef1bb766 100644
>
>   # Do not show tool errors by default (only done/skipping summary
>   # message provided by this script) and no verbose mode by default.
> ---
> -2.29.2
> -
> diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-lvmdbusd-create-dirs-=
for-lock-file.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-lvmdbusd-creat=
e-dirs-for-lock-file.patch
> deleted file mode 100644
> index f6b293553..000000000
> --- a/meta-oe/recipes-support/lvm2/lvm2/0001-lvmdbusd-create-dirs-for-loc=
k-file.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -lvmdbusd: create dirs for lock file
> -
> -Create leading dirs for lvmdbusd lock file, otherwise it fails to start:
> -
> -| systemd[1]: Starting LVM2 D-Bus service...
> -| lvmdbusd[1602]: [1602]: Error during creation of lock file(/var/lock/l=
vm/lvmdbusd): errno(2), exiting!
> -
> -Upstream-Status: Submitted [https://gitlab.com/lvmteam/lvm2/-/merge_requ=
ests/7]
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> - daemons/lvmdbusd/utils.py | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/daemons/lvmdbusd/utils.py b/daemons/lvmdbusd/utils.py
> -index d479175f6..830648659 100644
> ---- a/daemons/lvmdbusd/utils.py
> -+++ b/daemons/lvmdbusd/utils.py
> -@@ -778,6 +778,7 @@ class LockFile(object):
> -
> -       def __enter__(self):
> -               try:
> -+                      os.makedirs(os.path.dirname(self.lock_file))
> -                       self.fd =3D os.open(self.lock_file, os.O_CREAT | =
os.O_RDWR, stat.S_IRUSR | stat.S_IWUSR)
> -
> -                       # Get and set the close on exec and lock the file
> ---
> -2.34.1
> -
> diff --git a/meta-oe/recipes-support/lvm2/lvm2/tweak-for-lvmdbusd.patch b=
/meta-oe/recipes-support/lvm2/lvm2/tweak-for-lvmdbusd.patch
> index 3b85a17b6..200f2f044 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2/tweak-for-lvmdbusd.patch
> +++ b/meta-oe/recipes-support/lvm2/lvm2/tweak-for-lvmdbusd.patch
> @@ -1,3 +1,8 @@
> +From 34f5a21afae759d48fa11e77b622ca35a4feabaa Mon Sep 17 00:00:00 2001
> +From: Kai Kang <kai.kang@windriver.com>
> +Date: Wed, 6 Dec 2023 10:24:46 +0800
> +Subject: [PATCH] lvm2: 2.03.16 -> 2.03.22
> +
>  Not check python modules pyudev and dbus during configure that they are =
runtime
>  dependencies. Deal with them in the package config setting in the recipe=
.
>
> @@ -13,10 +18,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
>   2 files changed, 4 insertions(+), 6 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index ee088b3f5..b94ef4e56 100644
> +index 9dfdcfe01..fcf5c8b78 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -1262,8 +1262,8 @@ AS_IF([test "$BUILD_LVMDBUSD" =3D "yes"], [
> +@@ -1282,8 +1282,8 @@ AS_IF([test "$BUILD_LVMDBUSD" =3D "yes"], [
>         AS_IF([test "$PYTHON3_BINDINGS" =3D "yes"], [PYTHON_BINDINGS=3D"y=
es"])
>
>         # To get this macro, install autoconf-archive package then run au=
toreconf
> @@ -28,7 +33,7 @@ index ee088b3f5..b94ef4e56 100644
>
>   #######################################################################=
#########
>  diff --git a/daemons/lvmdbusd/Makefile.in b/daemons/lvmdbusd/Makefile.in
> -index 9c2629279..a79daabf7 100644
> +index 08b061fb2..e2b1c3209 100644
>  --- a/daemons/lvmdbusd/Makefile.in
>  +++ b/daemons/lvmdbusd/Makefile.in
>  @@ -16,7 +16,7 @@ top_srcdir =3D @top_srcdir@
> @@ -41,7 +46,7 @@ index 9c2629279..a79daabf7 100644
>   LVMDBUS_SRCDIR_FILES =3D \
>         automatedproperties.py \
>  @@ -55,11 +55,9 @@ install_lvmdbusd: $(LVMDBUSD)
> -       @echo "    [INSTALL] $<"
> +       $(SHOW) "    [INSTALL] $<"
>         $(Q) $(INSTALL_DIR) $(sbindir)
>         $(Q) $(INSTALL_SCRIPT) $(LVMDBUSD) $(sbindir)
>  -      $(Q) $(INSTALL_DIR) $(lvmdbusdir) $(lvmdbusdir)/__pycache__
> --
> 2.45.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110578): https://lists.openembedded.org/g/openembedde=
d-devel/message/110578
> Mute This Topic: https://lists.openembedded.org/mt/106345032/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

