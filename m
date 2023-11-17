Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8286C54FB9
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 18:12:35 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.2597.1700244746425655113
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Nov 2023 10:12:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OOcED30w;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1f03db0a410so1184284fac.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 10:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700244745; x=1700849545; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gQlvWLxl9t8zEJ4YSgaWKSMlIVR/WKrAlRegbg7MqA=;
        b=OOcED30wV0nWTrryD9DuaS9PW2pe/C3MQYspzGvICP7pND2/JCiWag1cWopQ5c+udl
         7gbbowJGkp8TnGMpnmb1Q98+hQwCBxfRoiGoNqSN+/R7SMWaORgVlMdof8tuQRztJ+Wg
         cf3RN2Le460bN8s5pzIyG+0dVOQiDUB7Gy0lPl31OzpbMcok8c8i7NuIqOlvMJ22TkQg
         qvxXjEapSOsTb5TLTOO3JuwerhToJOQtL5vFLyvIYNs3eMUUWrghXVVYgAJWgCqS3OLL
         oqzSrQTNssPxE2+krMuxG3UVqlrpYx4zLb2qJdNeXpXUAO6RJkkLQnue8dLUI+PupFCz
         uBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700244745; x=1700849545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gQlvWLxl9t8zEJ4YSgaWKSMlIVR/WKrAlRegbg7MqA=;
        b=giILhN6I1VuxPDZnEz8eeIkRnZbpVsEOysnOXyFyvljx5tZcfLsPx/AOMr0tzP8WPx
         X8PTJlZRBOhewqKMPGayPhPTwRKbMTrxOdD97W0nUwpqHIPEekC29nwDrjs0I8Kgnr5+
         6/vxt+l6YniNIwfzXSVUiPK71iBDcqCnNZtgn0VGiIDVqi+2LgIGp1IKFAxTL0p/WX/8
         UXJlj/VX5xWgppXHtEskMA5VfIU8Fu4IGHpNsI044nAzA4wvO3kTBlDj4ETSoQsygNpW
         SqoAtZjRPlm5RPezIa2Aca+7orCR1EzCTfR+ZCCOxWB9oHvsePtSMXM2OeN6CKQ7xa1D
         FTFg==
X-Gm-Message-State: AOJu0Yxql5tOL8lw+vsUfaP0gd7j7enGjKzLxTKasgc4K6Vb35NeKc/v
	zPAXyqcDEhOOSTSgwUhyHSyhTCgDEsbyiwB6oJ4=
X-Google-Smtp-Source: AGHT+IHGbUrihpPDCBurv1mTHt6gwrX7e4e6yulaUbQPEiumSjGMWWIhS84/PIMU6JR9/CyIDimEUpH6FDWIFiSGTKY=
X-Received: by 2002:a05:6871:460a:b0:1ef:c082:ecbe with SMTP id
 nf10-20020a056871460a00b001efc082ecbemr26526334oab.55.1700244745486; Fri, 17
 Nov 2023 10:12:25 -0800 (PST)
MIME-Version: 1.0
References: <20231116083050.132470-1-alperyasinak1@gmail.com>
In-Reply-To: <20231116083050.132470-1-alperyasinak1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 17 Nov 2023 10:11:59 -0800
Message-ID: <CAMKF1sqB1zNV68uamtdNSaZdMt_spUr-55TwUAKzPLNZVbDUtg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] ledmon: upgrade 0.93 -> 0.97
To: Alper Ak <alperyasinak1@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 18:12:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106873

This fails to build with clang for 32bit x86 e.g. qemux86

https://errors.yoctoproject.org/Errors/Details/742597/

On Thu, Nov 16, 2023 at 12:31=E2=80=AFAM Alper Ak <alperyasinak1@gmail.com>=
 wrote:
>
> * License changed GPL-2.0-only -> LGPL-2.0-only
>
>   - LIC_FILES_CHKSUM changed COPYING -> COPYING.LIB for LGPL-2.0-only
>   - Changed license headers in required source files.
>   - Changed copyright years to 2022 in modified files.
>
> * 0001-Don-t-build-with-Werror-to-fix-compile-error.patch removed because=
 fixed in the new version.
>
> * libpci was added as depends following this error -> configure: error: P=
ackage requirements (libpci) were not met: No package 'libpci' found
>
> * pkgconfig added as inherit following this error -> PKG_PROG_PKG_CONFIG:=
 command not found
>
> Changelog:
>
> It can be followed here: https://github.com/intel/ledmon/releases
>
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
>  ...ild-with-Werror-to-fix-compile-error.patch | 30 -------------------
>  .../ledmon/{ledmon_git.bb =3D> ledmon_0.97.bb}  | 17 +++++------
>  2 files changed, 7 insertions(+), 40 deletions(-)
>  delete mode 100644 meta-oe/recipes-bsp/ledmon/ledmon/0001-Don-t-build-wi=
th-Werror-to-fix-compile-error.patch
>  rename meta-oe/recipes-bsp/ledmon/{ledmon_git.bb =3D> ledmon_0.97.bb} (7=
1%)
>
> diff --git a/meta-oe/recipes-bsp/ledmon/ledmon/0001-Don-t-build-with-Werr=
or-to-fix-compile-error.patch b/meta-oe/recipes-bsp/ledmon/ledmon/0001-Don-=
t-build-with-Werror-to-fix-compile-error.patch
> deleted file mode 100644
> index 09f4993a2..000000000
> --- a/meta-oe/recipes-bsp/ledmon/ledmon/0001-Don-t-build-with-Werror-to-f=
ix-compile-error.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -Subject: [PATCH] Don't build with -Werror to fix compile error.
> -
> -|   550 |  _dump_sgpio_amd(&amd_reg->amd);
> -|       |                  ^~~~~~~~~~~~~
> -| amd_sgpio.c: In function '_write_amd_register':
> -| amd_sgpio.c:558:18: error: taking address of packed member of 'struct =
amd_register' may result in an unaligned pointer value [-Werror=3Daddress-o=
f-packed-member]
> -
> -Upstream-Status: Submitted
> -https://github.com/intel/ledmon/pull/48/commits
> -
> -Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ----
> - configure.ac | 1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 7bc20f8..7e01bd5 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -22,7 +22,6 @@ AX_AM_CFLAGS_ADD([-Werror=3Dformat-truncation=3D1])
> - AX_AM_CFLAGS_ADD([-Werror=3Dshift-negative-value])
> - AX_AM_CFLAGS_ADD([-Werror=3Dalloca])
> - AX_AM_CFLAGS_ADD([-Werror=3Dmissing-field-initializers])
> --AX_AM_CFLAGS_ADD([-Werror])
> - AX_AM_CFLAGS_ADD([-Werror=3Dformat-signedness])
> -
> - AC_SUBST([AM_CFLAGS])
> ---
> -2.7.4
> -
> diff --git a/meta-oe/recipes-bsp/ledmon/ledmon_git.bb b/meta-oe/recipes-b=
sp/ledmon/ledmon_0.97.bb
> similarity index 71%
> rename from meta-oe/recipes-bsp/ledmon/ledmon_git.bb
> rename to meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb
> index dbfd1e7bc..158342dbc 100644
> --- a/meta-oe/recipes-bsp/ledmon/ledmon_git.bb
> +++ b/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb
> @@ -5,28 +5,25 @@ DESCRIPTION =3D "The utilities are designed primarily t=
o be used on storage server
>  "
>  HOMEPAGE =3D "https://github.com/intel/ledmon"
>
> -LICENSE =3D "GPL-2.0-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317=
bb3 \
> -"
> +LICENSE =3D "LGPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b=
364516c"
>
> -DEPENDS =3D "sg3-utils udev"
> +DEPENDS =3D "sg3-utils udev pciutils"
>
> -inherit autotools systemd
> +inherit autotools systemd pkgconfig
>
>  SYSTEMD_SERVICE:${PN} =3D "ledmon.service"
>
> -# 0.93
>  SRC_URI =3D "git://github.com/intel/ledmon;branch=3Dmaster;protocol=3Dht=
tps \
> -           file://0002-include-sys-select.h-and-sys-types.h.patch \
> -           file://0001-Don-t-build-with-Werror-to-fix-compile-error.patc=
h \
> -          "
> +          file://0002-include-sys-select.h-and-sys-types.h.patch"
>
> -SRCREV =3D "1d72f9cb5c9163b2ecdf19709935720e65f5b90e"
> +SRCREV =3D "b0edae14e8660b80ffe0384354038a9f62e2978d"
>
>  COMPATIBLE_HOST =3D "(i.86|x86_64).*-linux"
>  COMPATIBLE_HOST:libc-musl =3D "null"
>
>  S =3D "${WORKDIR}/git"
> +
>  EXTRA_OEMAKE =3D "CC=3D'${CC}' LDFLAGS=3D'${LDFLAGS}' CFLAGS=3D'${CFLAGS=
}'"
>
>  # The ledmon sources include headers in ${S}/config to build but not in =
CFLAGS.
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106797): https://lists.openembedded.org/g/openembedde=
d-devel/message/106797
> Mute This Topic: https://lists.openembedded.org/mt/102623591/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

