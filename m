Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2397E728C9
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 16:22:21 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.22057.1696004532025261071
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 09:22:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HkFPVglm;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1dcfb2a3282so5646021fac.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 09:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696004531; x=1696609331; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=152w/GzrXrnXQcMu2Iw0ASaBAVilf0LUOpCWLUyvZGA=;
        b=HkFPVglmWCo7EFaPHvHTqKs+jId21jqllcVKpQW7+zHyTSMhp6CkJzvlOX/JcBC3YL
         xS462tXQysGSzKAzfzv+wk9xjyLvImBeiry75ZzMIOdbucIX9P5OAqUyptqcnFOHw4EP
         02FipueYBNFdrYBzGNigQdGZsy+dhE3YH586yRQwJTn1JGprpEZijXQBKCbDoEAkt91N
         hU2aLxf2SPESe5WOOFsfsaAE5o9vigKtnukeDUrXos9X+/0KFN8bAVqTFTKGIfpth40+
         Z/fWpMTwja9q10gwT4KVUkkWl6a8ZxBD554qdwm5XeY1MrPnqF3s8BX36sIfz6gYIl3N
         G3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696004531; x=1696609331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=152w/GzrXrnXQcMu2Iw0ASaBAVilf0LUOpCWLUyvZGA=;
        b=rPBXgI2t4M/MgVu2J4SF4vq37j5YFOscizqoloNJvYvmuE/kRfnIUYy4nFUUxDa5wD
         duLvqvT5Y0/LJPj3nYZjGc3/dGpW1u9LPMSo7CIE0seC3UygYlCdGeeSuMFjMBRYWaRo
         4xIST0YGyBKodLKVNUIgVz9KQ31Zijsw//B8lUcCmb+wL/rMyxT7gjnp+JD9ZHH0uwSx
         cW/fnM57YfGq5byaLoUY/JP3Hpl79yZgpD5tPPmQimJopxVmvx2zmM6E/OsmyW8ueuqc
         znOpOAmaROzR4QqSQQCOgG0JAFEtBK+6ZGM66bIuZ3sGWBHdb1ZQSuL0hu3pHR0gfxdd
         vILA==
X-Gm-Message-State: AOJu0YzaGbGMEMDD4vMRhddkQsPM8t04sjdR6rvOaa4qYUJXiq2uSRA/
	3Z0TQXNoqp2T8tTgO6OKzRa9XJOb26J53VQUsXG2ML0GB+LMUA==
X-Google-Smtp-Source: AGHT+IFznE7bFNDzPZVQoP5Xdjwq4rpHZYHELD5YBCDze9VsGon9900TLpAySX3PP0k4846vZObDlN8BaY7l1BOkX9w=
X-Received: by 2002:a05:6870:1ca:b0:1c8:baa5:a50f with SMTP id
 n10-20020a05687001ca00b001c8baa5a50fmr5547348oad.27.1696004531008; Fri, 29
 Sep 2023 09:22:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230929133724.56928-1-uvv.mail@gmail.com> <20230929133724.56928-3-uvv.mail@gmail.com>
In-Reply-To: <20230929133724.56928-3-uvv.mail@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Sep 2023 09:21:44 -0700
Message-ID: <CAMKF1sqO58Z6DwJyymo85ButXsc42mdciH_CpCCw8N-Ymbi5hA@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH 3/3] overlayfs-tools: Install fsck binary
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 16:22:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105250

On Fri, Sep 29, 2023 at 6:38=E2=80=AFAM Vyacheslav Yurkov <uvv.mail@gmail.c=
om> wrote:
>
> Two projects, overlayfs-tools and overlayfs-progs, were combined
> upstream.

Merging into one is fine however there are dependencies on
overlayfs-progs so perhaps we need to add
RPROVIDES =3D "overlayfs-progs" to overlayfs-tools_git.bb and then
update the recipes e.g. xftests to depend on overayfs-tools

>
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  ...-Makefile-proper-location-of-LDFLAGS.patch | 32 -------------------
>  .../overlayfs/overlayfs-progs_git.bb          | 32 -------------------
>  .../overlayfs/overlayfs-tools_git.bb          |  5 +--
>  3 files changed, 1 insertion(+), 68 deletions(-)
>  delete mode 100644 meta-filesystems/recipes-utils/overlayfs/overlayfs-pr=
ogs/0001-Makefile-proper-location-of-LDFLAGS.patch
>  delete mode 100644 meta-filesystems/recipes-utils/overlayfs/overlayfs-pr=
ogs_git.bb
>
> diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs/000=
1-Makefile-proper-location-of-LDFLAGS.patch b/meta-filesystems/recipes-util=
s/overlayfs/overlayfs-progs/0001-Makefile-proper-location-of-LDFLAGS.patch
> deleted file mode 100644
> index 2c001834b..000000000
> --- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs/0001-Makef=
ile-proper-location-of-LDFLAGS.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 8eeaee82dcfdf47f16ad880e416b722827f41bdb Mon Sep 17 00:00:00 2001
> -From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
> -Date: Mon, 23 May 2022 19:37:32 +0200
> -Subject: [PATCH] Makefile: proper location of LDFLAGS
> -
> -Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
> ----
> -Upstream-Status: Pending
> -
> - Makefile | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index e3c5207..14b155e 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -1,5 +1,5 @@
> - CFLAGS =3D -Wall -g
> --LFLAGS =3D -lm
> -+LDFLAGS =3D -lm
> - CC =3D gcc
> -
> - all: overlay
> -@@ -7,7 +7,7 @@ all: overlay
> - objects =3D fsck.o common.o lib.o check.o mount.o path.o overlayfs.o
> -
> - overlay: $(objects)
> --      $(CC) $(LFLAGS) $(objects) -o fsck.overlay
> -+      $(CC) $(objects) -o fsck.overlay $(LDFLAGS)
> -
> - .c.o:
> -       $(CC) $(CFLAGS) -c $<
> diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs_git=
.bb b/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs_git.bb
> deleted file mode 100644
> index 9d58b9a63..000000000
> --- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs_git.bb
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -SUMMARY =3D "File system check utility for OverlayFS"
> -HOMEPAGE =3D "https://github.com/hisilicon/overlayfs-progs"
> -LICENSE =3D "PD"
> -LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/PD;m=
d5=3Db3597d12946881e13cb3b548d1173851"
> -
> -SRC_URI =3D "\
> -    git://github.com/hisilicon/overlayfs-progs.git;protocol=3Dhttps;bran=
ch=3Dmaster \
> -    file://0001-Makefile-proper-location-of-LDFLAGS.patch \
> -"
> -
> -PV =3D "1.0+git${SRCPV}"
> -SRCREV =3D "e10ef686570d9c7eff42f52461593a5c15da56bd"
> -
> -S =3D "${WORKDIR}/git"
> -B =3D "${S}"
> -
> -# Required to have the fts.h header for musl
> -DEPENDS:append:libc-musl =3D " fts"
> -# Fix the missing fts libs when using musl
> -EXTRA_OEMAKE:append:libc-musl =3D " LDFLAGS=3D'-lfts'"
> -
> -EXTRA_OEMAKE +=3D "'CC=3D${CC} -O2' "
> -TARGET_CC_ARCH +=3D "${LDFLAGS}"
> -
> -do_compile () {
> -    oe_runmake
> -}
> -
> -do_install () {
> -    install -d ${D}${bindir}
> -    install -m 0755 ${B}/fsck.overlay ${D}${bindir}
> -}
> diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git=
.bb b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
> index de5155133..ca2ec9cc4 100644
> --- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
> +++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
> @@ -21,11 +21,8 @@ EXTRA_OEMAKE +=3D "'CC=3D${CC} -O2'"
>  EXTRA_OEMAKE:append:libc-musl =3D " LDLIBS=3D-lfts"
>  TARGET_CC_ARCH +=3D "${LDFLAGS}"
>
> -do_compile () {
> -    oe_runmake
> -}
> -
>  do_install () {
>      install -d ${D}${bindir}
>      install -m 0755 ${B}/overlay ${D}${bindir}
> +    install -m 0755 ${B}/fsck.overlay ${D}${bindir}
>  }
> --
> 2.35.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105245): https://lists.openembedded.org/g/openembedde=
d-devel/message/105245
> Mute This Topic: https://lists.openembedded.org/mt/101657502/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

