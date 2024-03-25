Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A98C54E58
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 18:23:40 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.2896.1711391017012272954
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 11:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XASFwvHP;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33ececeb19eso3062747f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 11:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711391015; x=1711995815; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPnsk5Tv/260bfCyR6zqAqjCQOjw3fMLE3rX8N5MaPc=;
        b=XASFwvHPSt9ZCpyabRHH2XvUTEfg125KtrbIZN7+d7+rDyQkuZrdoMek8bBsWTSQGL
         h5fEbsWtq9HRPCYp6U+gdDUAeySiMIzTx5nXGvjgsEfERw3CZSdwWUi+ZrTX0Y3mIySN
         hdCDQad/ghSwPqs8KdLH6iRYpswAFt3NmRgyxxijIktqXr7HEK6C2PK/TEwnlyZjm2Gw
         6YYGjbNsHm8BiZ2AbvTGUC6I16Ch5y7XXGz+UM4HKcpiAdPpM8jqieJ1OJqrqDDXst4t
         6GxLFV479Z8b6VoMVQm+PjuSxvoCEoVFYZEbiTifbCw0u/bDkMWHvAUG6hSQ0VNQFB+n
         3y0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711391015; x=1711995815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XPnsk5Tv/260bfCyR6zqAqjCQOjw3fMLE3rX8N5MaPc=;
        b=i78PbrGEPmGuLvGsXDCYaYtbxI+Qjg/2/eYoDK52QWiHFLqEzCBfMVsnH0AWU+IRpG
         fzKTFpFCe2lI043xtSWu4uu/VE54Dm1ObO0h+ZQJcPC9m6f2ryaE10dcMLtPkHDPHwFi
         wrlLAq9tY3OjMC6cbW/J3ZliDX1poNA8tNiyxUQi0vzVETpCZ82VyoGQHfpPg3EPGR4t
         Jdpug1AS6u0/h52Okjfk9yQb2TvrNpzBhA752YeXP6E3z/9R417BGZRhHgcG5UW3BAKT
         1hnveZlSuEl75NCRjRpdNiZPAd8GZUfO61nep+WI3+jRoZmk9BBw+5mIDymzkVpmhRSn
         rjwg==
X-Gm-Message-State: AOJu0Yzdc/0JR9uXnQUWHr94By13PiCEs3VYNvvvhFW/SMBs5X4kf42K
	5NJa+iQK2qb19pRf8MXf4fUPkKNA8W+LD3gOt1T+/9AAGyaEgHH9jI3EQdH3YXuJXzAnSNvxUQ+
	B8M2e7L6V8Elvx8SHrzz1oHHEOpU=
X-Google-Smtp-Source: AGHT+IH0fBm63VK6GWcqc0Rww19gfiso2chwX79xINZC9kJhm7dsN+J45JyvTJgWC1vPy/dFphAeJa0drW6TtjxyU/c=
X-Received: by 2002:adf:e011:0:b0:33e:c604:dd50 with SMTP id
 s17-20020adfe011000000b0033ec604dd50mr5273718wrh.51.1711391015072; Mon, 25
 Mar 2024 11:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240325175753.3507115-1-raj.khem@gmail.com> <20240325175753.3507115-2-raj.khem@gmail.com>
In-Reply-To: <20240325175753.3507115-2-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 25 Mar 2024 19:23:22 +0100
Message-ID: <CA+chaQe+9CVNQU6gJZNX5KGZRaPYBAVN0Y76af9njuCP4Lcsrw@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH 2/2] xfstests: Fix build with musl
 >= 1.2.5
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 18:23:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109598

On Mon, Mar 25, 2024 at 6:57=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...-libgen.h-for-basename-API-prototype.patch | 84 +++++++++++++++++++
>  ...X_ATTR_-defines-from-musl-sys-stat.h.patch | 42 ++++++++++
>  .../xfstests/xfstests_2024.03.03.bb           |  2 +
>  3 files changed, 128 insertions(+)
>  create mode 100644 meta-filesystems/recipes-utils/xfstests/xfstests/0001=
-include-libgen.h-for-basename-API-prototype.patch
>  create mode 100644 meta-filesystems/recipes-utils/xfstests/xfstests/0002=
-Add-missing-STATX_ATTR_-defines-from-musl-sys-stat.h.patch
>
> diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0001-includ=
e-libgen.h-for-basename-API-prototype.patch b/meta-filesystems/recipes-util=
s/xfstests/xfstests/0001-include-libgen.h-for-basename-API-prototype.patch
> new file mode 100644
> index 0000000000..1f7ae32f04
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/xfstests/xfstests/0001-include-libge=
n.h-for-basename-API-prototype.patch
> @@ -0,0 +1,84 @@
> +From 37caab7a43da5ede0ff1eb700f0257a213ac4b18 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 25 Mar 2024 10:46:50 -0700
> +Subject: [PATCH 1/2] include libgen.h for basename API prototype
> +
> +basename prototype has been removed from string.h from latest musl [1]
> +compilers e.g. clang-18 flags the absense of prototype as error. therefo=
re
> +include libgen.h for providing it.
> +
> +[1] https://git.musl-libc.org/cgit/musl/commit/?id=3D725e17ed6dff4d0cd22=
487bb64470881e86a92e7
> +
> +Upstream-Status: [https://lore.kernel.org/fstests/20240325175323.3450750=
-1-raj.khem@gmail.com/T/#t]

You forgot "Submitted" here.

> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/splice-test.c                   | 1 +
> + src/stat_test.c                     | 1 +
> + src/t_ext4_dax_inline_corruption.c  | 1 +
> + src/t_ext4_dax_journal_corruption.c | 1 +
> + src/t_mmap_collision.c              | 1 +
> + 5 files changed, 5 insertions(+)
> +
> +diff --git a/src/splice-test.c b/src/splice-test.c
> +index eb863673..7b7094f5 100644
> +--- a/src/splice-test.c
> ++++ b/src/splice-test.c
> +@@ -11,6 +11,7 @@
> + #include <unistd.h>
> + #include <fcntl.h>
> + #include <err.h>
> ++#include <libgen.h>
> +
> + #include <stdlib.h>
> + #include <stdio.h>
> +diff --git a/src/stat_test.c b/src/stat_test.c
> +index 95cfdc4f..77e1acdd 100644
> +--- a/src/stat_test.c
> ++++ b/src/stat_test.c
> +@@ -4,6 +4,7 @@
> +  * Written by David Howells (dhowells@redhat.com)
> +  */
> +
> ++#include <libgen.h>
> + #include <stdarg.h>
> + #include <stdio.h>
> + #include <stdlib.h>
> +diff --git a/src/t_ext4_dax_inline_corruption.c b/src/t_ext4_dax_inline_=
corruption.c
> +index e1a39a6c..a40c5df5 100644
> +--- a/src/t_ext4_dax_inline_corruption.c
> ++++ b/src/t_ext4_dax_inline_corruption.c
> +@@ -2,6 +2,7 @@
> + /* Copyright (c) 2018 Intel Corporation. */
> + #include <errno.h>
> + #include <fcntl.h>
> ++#include <libgen.h>
> + #include <stdio.h>
> + #include <stdlib.h>
> + #include <string.h>
> +diff --git a/src/t_ext4_dax_journal_corruption.c b/src/t_ext4_dax_journa=
l_corruption.c
> +index ba7a96e4..53be10c2 100644
> +--- a/src/t_ext4_dax_journal_corruption.c
> ++++ b/src/t_ext4_dax_journal_corruption.c
> +@@ -2,6 +2,7 @@
> + /* Copyright (c) 2018 Intel Corporation. */
> + #include <errno.h>
> + #include <fcntl.h>
> ++#include <libgen.h>
> + #include <stdio.h>
> + #include <stdlib.h>
> + #include <string.h>
> +diff --git a/src/t_mmap_collision.c b/src/t_mmap_collision.c
> +index c872f4e2..d9315fcf 100644
> +--- a/src/t_mmap_collision.c
> ++++ b/src/t_mmap_collision.c
> +@@ -15,6 +15,7 @@
> +  */
> + #include <errno.h>
> + #include <fcntl.h>
> ++#include <libgen.h>
> + #include <pthread.h>
> + #include <stdbool.h>
> + #include <stdio.h>
> +--
> +2.44.0
> +
> diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0002-Add-mi=
ssing-STATX_ATTR_-defines-from-musl-sys-stat.h.patch b/meta-filesystems/rec=
ipes-utils/xfstests/xfstests/0002-Add-missing-STATX_ATTR_-defines-from-musl=
-sys-stat.h.patch
> new file mode 100644
> index 0000000000..20095c86ab
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/xfstests/xfstests/0002-Add-missing-S=
TATX_ATTR_-defines-from-musl-sys-stat.h.patch
> @@ -0,0 +1,42 @@
> +From 052818e91314b797d96d87672c60f6784160f935 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 25 Mar 2024 10:50:59 -0700
> +Subject: [PATCH 2/2] Add missing STATX_ATTR_* defines from musl sys/stat=
.h
> +
> +These defines are not provided by sys/stat.h on musl but are
> +in glibc's sys/stat.h, therefore to compile the tests on musl
> +based systems add the missing defines from linux/stat.h
> +if they are not provided
> +
> +Upstream-Status: Submitted [https://lore.kernel.org/fstests/202403251753=
23.3450750-2-raj.khem@gmail.com/T/#u]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/statx.h | 12 ++++++++++++
> + 1 file changed, 12 insertions(+)
> +
> +diff --git a/src/statx.h b/src/statx.h
> +index 3f239d79..12599f5b 100644
> +--- a/src/statx.h
> ++++ b/src/statx.h
> +@@ -12,6 +12,18 @@
> + #define AT_STATX_DONT_SYNC      0x4000  /* - Don't sync attributes with=
 the server */
> + #endif
> +
> ++#ifndef STATX_ATTR_COMPRESSED
> ++#define STATX_ATTR_COMPRESSED         0x00000004 /* [I] File is compres=
sed by the fs */
> ++#define STATX_ATTR_IMMUTABLE          0x00000010 /* [I] File is marked =
immutable */
> ++#define STATX_ATTR_APPEND             0x00000020 /* [I] File is append-=
only */
> ++#define STATX_ATTR_NODUMP             0x00000040 /* [I] File is not to =
be dumped */
> ++#define STATX_ATTR_ENCRYPTED          0x00000800 /* [I] File requires k=
ey to decrypt in fs */
> ++#define STATX_ATTR_AUTOMOUNT          0x00001000 /* Dir: Automount trig=
ger */
> ++#define STATX_ATTR_MOUNT_ROOT         0x00002000 /* Root of a mount */
> ++#define STATX_ATTR_VERITY             0x00100000 /* [I] Verity protecte=
d file */
> ++#define STATX_ATTR_DAX                        0x00200000 /* File is cur=
rently in DAX state */
> ++#endif
> ++
> + #ifndef AT_NO_AUTOMOUNT
> + #define AT_NO_AUTOMOUNT               0x800   /* Suppress terminal auto=
mount traversal */
> + #endif
> +--
> +2.44.0
> +
> diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2024.03.03.=
bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2024.03.03.bb
> index 2d5fedb417..c8a80523dd 100644
> --- a/meta-filesystems/recipes-utils/xfstests/xfstests_2024.03.03.bb
> +++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2024.03.03.bb
> @@ -10,6 +10,8 @@ SRC_URI =3D "git://git.kernel.org/pub/scm/fs/xfs/xfstes=
ts-dev.git;branch=3Dmaster \
>             git://github.com/amir73il/unionmount-testsuite.git;branch=3Dm=
aster;protocol=3Dhttps;name=3Dunionmount;destsuffix=3Dunionmount-testsuite =
\
>             file://0001-add-missing-FTW_-macros-when-not-available-in-lib=
c.patch \
>             file://0002-Drop-detached_mounts_propagation-and-remove-sys-m=
oun.patch \
> +           file://0001-include-libgen.h-for-basename-API-prototype.patch=
 \
> +           file://0002-Add-missing-STATX_ATTR_-defines-from-musl-sys-sta=
t.h.patch \
>             "
>
>  S =3D "${WORKDIR}/git"
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109597): https://lists.openembedded.org/g/openembedde=
d-devel/message/109597
> Mute This Topic: https://lists.openembedded.org/mt/105143486/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

