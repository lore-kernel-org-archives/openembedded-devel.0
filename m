Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EC13C369AB
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 03:10:45 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web11.20765.1745723442614313212
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Apr 2025 20:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PyJtVoZs;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3fefbbc7dd4so2501759b6e.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Apr 2025 20:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745723442; x=1746328242; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rs4a97H6gcqcAukVf64eT4b+jgXNslKsDc/JpZYyVlc=;
        b=PyJtVoZsIZgmK5iNLa4pLoTSDzPwcosbWQ5eN5X02nlsgbICaNwI/7xtTgf4lES6az
         YhHsJOTEUXL+hVAv21Uaa89OViQUf1IETiK//RX2ISyK7XiltPauo/5hh1Ucstci8UZN
         5/9T/k1Xnj3m5zr/jX2BpWzX7b585timpf3EqkgBsX1RyBNHIbzXfUiMSAO6OQ0nApeg
         4OehuoZZ0+iCWgb2E6HFUtSDUk2i1yO3LPlwx7wF8M/dDM/GrGWekfVuvD57HtbcmbET
         uGoych0XfVMPnC5qNWAeK1nC8A84KYJ3iSdc1d9jiYAuSG2L8LcWDwIVL57fsSjqsZ+E
         TFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745723442; x=1746328242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rs4a97H6gcqcAukVf64eT4b+jgXNslKsDc/JpZYyVlc=;
        b=rVXE5E3ALlNbKtXvMeEBaUxTThFXkXlP2tYejNYff9qVvyAnDaSQFar0WDdB9lkRvb
         oYSB6CWMKsybLCoCg2fhqX57MOHNbk2xmMu8zNhI2e77NQKHl21NDadL0SG538VwyNhr
         KRmBQTo4mMhRWSE2Z/XLFhfOmwG0mmtBswAyMHrMRh44G8TlbbLcrFYnYlLDSTYhClqs
         DBZbCFqShbQI6TPuSCR/l+XsZdKcWuCI/gTMrZ4kWoGJLiCR03prS2JkgW/POH7xNq0O
         2wPNNNSYhe+fvMA7Lj0O9XciZmG8fwTKvHkgrj9u5Y2klcSRM9IZas46FuQyoUfS+wcI
         qAzQ==
X-Gm-Message-State: AOJu0Yw3B5QSEJp9DtaqMEAVhog+a6Ih8gqhPU2qQ1eNFFkhi+uCn7xj
	SyUmf3mkBa+Y5T0e4lBJJKFclypPqMnXCJPExYUVZ+dRWGNYrCiAKSvEYQl+ZfipaIDvRg0oD/s
	Isjw/x44C8vMmO6msXN32Gfc96WaerVmK+7c=
X-Gm-Gg: ASbGncuR/6FuI5viNeM8p2XE/or9M/+vNMrWKg/otIZzGfmnQSkJPR04yxIcSpXa32Z
	VlotuKQc6F+B6WPNsDQqBfFfp/hdRLtBruNOUzsQwMsaZHdOl7CJXVuJluyLtyKERlU0g5/YUo1
	b76k0dlv9W8U7m82HFgt1hwA==
X-Google-Smtp-Source: AGHT+IHe6766B1op4mD0jaO+rJa2Ohlh6i4hSlYfsm2vV86XAsYYttRCQz9CVztDSxbHKnv1oOn1sPgGzC4rf7cYyG0=
X-Received: by 2002:a05:6808:6b47:b0:401:e8e1:7167 with SMTP id
 5614622812f47-401fd72456cmr2158127b6e.10.1745723441791; Sat, 26 Apr 2025
 20:10:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250426115623.2732743-1-martin.jansa@gmail.com> <20250426115623.2732743-5-martin.jansa@gmail.com>
In-Reply-To: <20250426115623.2732743-5-martin.jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 Apr 2025 20:10:15 -0700
X-Gm-Features: ATxdqUFzfFoUsQFn-JsYdUfUA6nrPnVdXVib1lZaeFo0CLSm8cezz_yOCNb-LKU
Message-ID: <CAMKF1sog3kL70C08gkrM69XVV017QRMY+COCP+xoxjG7SeDUkg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 5/8] xfstests: upgrade to 2025.03.30 to fix
 build with gcc-15
To: martin.jansa@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 03:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117157

I am seeing failures on musl on 32bit architecrtures eg. riscv32 like below

| bstat.c:65:33: error: unknown type name '__uint32_t'
   |    65 | static inline int xfs_highbit32(__uint32_t v)

On Sat, Apr 26, 2025 at 4:56=E2=80=AFAM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Martin Jansa <martin.jansa@gmail.com>
>
> * switched to gnu11 in:
>   https://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git/commit/?id=3D77a=
ab5c2bfc9135fde66c17286ca4be87b417f39
>
> * add one more commit to unionmount-testsuite
>   https://github.com/amir73il/unionmount-testsuite/commit/c6ab621ac19f2b9=
6d34cd98f244e611750e2bb23
>
> * fixes:
>   http://errors.yoctoproject.org/Errors/Details/852985/
>
> * add pkgconfig used since:
>   https://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git/commit/?id=3D1ba=
4f6f4bcd2aaef18e9549da89c3f0976f3fd01
>   to fix:
>   http://errors.yoctoproject.org/Errors/Details/852995/
>
>   configure:15434: error: possibly undefined macro: AC_DEFINE
>       If this token and others are legitimate, please use m4_pattern_allo=
w.
>       See the Autoconf documentation.
>   configure:15435: error: possibly undefined macro: AC_DEFINE_UNQUOTED
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  ...-detached_mounts_propagation-and-remove-sys-moun.patch | 8 ++++----
>  .../{xfstests_2024.03.03.bb =3D> xfstests_2025.03.30.bb}    | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
>  rename meta-filesystems/recipes-utils/xfstests/{xfstests_2024.03.03.bb =
=3D> xfstests_2025.03.30.bb} (92%)
>
> diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0002-Drop-d=
etached_mounts_propagation-and-remove-sys-moun.patch b/meta-filesystems/rec=
ipes-utils/xfstests/xfstests/0002-Drop-detached_mounts_propagation-and-remo=
ve-sys-moun.patch
> index e823297343..9fdf69ff46 100644
> --- a/meta-filesystems/recipes-utils/xfstests/xfstests/0002-Drop-detached=
_mounts_propagation-and-remove-sys-moun.patch
> +++ b/meta-filesystems/recipes-utils/xfstests/xfstests/0002-Drop-detached=
_mounts_propagation-and-remove-sys-moun.patch
> @@ -1,4 +1,4 @@
> -From 79c4715a46b80653eb98b61731c094c85e969220 Mon Sep 17 00:00:00 2001
> +From 340e708f79b824816aacfa74e330d8acdafc5129 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sun, 14 Aug 2022 13:33:05 -0700
>  Subject: [PATCH] Drop detached_mounts_propagation and remove sys/mount.h=
 from
> @@ -17,15 +17,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/src/Makefile b/src/Makefile
> -index e7442487..970f087a 100644
> +index 6ac72b36..5472ba66 100644
>  --- a/src/Makefile
>  +++ b/src/Makefile
> -@@ -33,7 +33,7 @@ LINUX_TARGETS =3D xfsctl bstat t_mtab getdevicesize pr=
eallo_rw_pattern_reader \
> +@@ -34,7 +34,7 @@ LINUX_TARGETS =3D xfsctl bstat t_mtab getdevicesize pr=
eallo_rw_pattern_reader \
>         dio-invalidate-cache stat_test t_encrypted_d_revalidate \
>         attr_replace_test swapon mkswap t_attr_corruption t_open_tmpfiles=
 \
>         fscrypt-crypt-util bulkstat_null_ocount splice-test chprojid_fail=
 \
>  -      detached_mounts_propagation ext4_resize t_readdir_3 splice2pipe \
>  +      ext4_resize t_readdir_3 splice2pipe \
> -       uuid_ioctl t_snapshot_deleted_subvolume
> +       uuid_ioctl t_snapshot_deleted_subvolume fiemap-fault min_dio_alig=
nment
>
>   EXTRA_EXECS =3D dmerror fill2attr fill2fs fill2fs_check scaleread.sh \
> diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2024.03.03.=
bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2025.03.30.bb
> similarity index 92%
> rename from meta-filesystems/recipes-utils/xfstests/xfstests_2024.03.03.b=
b
> rename to meta-filesystems/recipes-utils/xfstests/xfstests_2025.03.30.bb
> index 86f5b29bf0..94d37c03a9 100644
> --- a/meta-filesystems/recipes-utils/xfstests/xfstests_2024.03.03.bb
> +++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2025.03.30.bb
> @@ -2,11 +2,11 @@ SUMMARY =3D "File system QA test suite"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSES/GPL-2.0;md5=3D74274e8a218423e49eef=
dea80bc55038"
>
> -SRCREV =3D "088e5bd4cb6d7295612430a56ae84ff5c8f54730"
> -SRCREV_unionmount =3D "e3825b16b46f4c4574a1a69909944c059835f914"
> +SRCREV =3D "b59671d2b894040bd355ddbf1ff03285607de16f"
> +SRCREV_unionmount =3D "c6ab621ac19f2b96d34cd98f244e611750e2bb23"
>  SRCREV_FORMAT =3D "default_unionmount"
>
> -SRC_URI =3D "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=
=3Dmaster \
> +SRC_URI =3D "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=
=3Dmaster;tag=3Dv${PV} \
>             git://github.com/amir73il/unionmount-testsuite.git;branch=3Dm=
aster;protocol=3Dhttps;name=3Dunionmount;destsuffix=3Dunionmount-testsuite =
\
>             file://0001-add-missing-FTW_-macros-when-not-available-in-lib=
c.patch \
>             file://0002-Drop-detached_mounts_propagation-and-remove-sys-m=
oun.patch \
> @@ -17,7 +17,7 @@ SRC_URI =3D "git://git.kernel.org/pub/scm/fs/xfs/xfstes=
ts-dev.git;branch=3Dmaster \
>  S =3D "${WORKDIR}/git"
>
>  # brokensep because m4/package_globals.m4 calls ". ./VERSION" (and that'=
s not the only issue)
> -inherit autotools-brokensep useradd
> +inherit autotools-brokensep useradd pkgconfig
>
>  DEPENDS +=3D "xfsprogs acl"
>  RDEPENDS:${PN} +=3D "\
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117146): https://lists.openembedded.org/g/openembedde=
d-devel/message/117146
> Mute This Topic: https://lists.openembedded.org/mt/112466579/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

