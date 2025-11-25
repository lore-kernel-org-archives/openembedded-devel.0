Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41AFBD1036C
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 23:32:41 +0000 (UTC)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.806.1764113552423370674
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 15:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OjqJRgYT;
 spf=pass (domain: gmail.com, ip: 74.125.224.46, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-640c9c85255so8637108d50.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 15:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764113551; x=1764718351; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Rtiep4cSIOfLeL9LTeHlioJ36Axp1eoV35xJG8w05kY=;
        b=OjqJRgYTUt+b4Ct31qgpkznVGEOCpzAaxNWHt5kO3gZWAzKRhVpUe2sBXZWQeZu7cB
         HR0tGlGcZYG/CVrFeuP11Y4tY+CobFAOFiaQLoVrTO14BGYYMzs9krUw1++Vkg9DAHGK
         K1zBFZ+qU13h7M+HsNuEZmCbsHL0LZ5XfBlV7isjEAQvXChPEKIahNrEd0ywv8vqutoN
         yagC0f2D0U16NlB9k78EgCvnr1estfjxfaCHrGNx7nmP+BD+ukzhj6YgLlBuhLmR8b/Y
         kfq4IV3CpHLFZ6Pn4C71rJKR6A9Qetg49pKw/p8iSocz5mBCk9x8MN9e7TWwPcAhRORd
         4UtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764113551; x=1764718351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rtiep4cSIOfLeL9LTeHlioJ36Axp1eoV35xJG8w05kY=;
        b=nmTz/iCo4BxDKvYoLvzYf0GLb8zj9v2pIZ0x8WCNfCcAA/2pdIllQslTHdfjEx05/O
         zs8GWo79znevESa9qhM4C1/yuhTw8ybYRXcc+8m4tf7xOenpGsCZHMLOqcxa5+9EPdAf
         HLPsDD13NbXEHimRfvyG7yeAU2MzB5fCx6AnGCOITeCbCMeqxZwPVO0T5Ug3yxOjl+1J
         bcvAgrO3BcZDwtvWnZwElAL0pumt3CJGNI0MiK/EAScENKIDlcE3/ggYhlY9eiJ/aNcB
         4jxC6u4VzNdYMXtX/t98kxEiTr197ghBtEO3b09pyGhV1tY4ABHupcxP7sMLVVa29xcK
         fnsw==
X-Gm-Message-State: AOJu0YwTE/VvF/blzPFjhtZkOGXFcom9d+MeSiSKsm8Ii/GjtcfTChC1
	sGhDByIdN2tppg9A713kVc4hiXdjToVoA6w8l/98YSBDSb5XqODnWme0Hj8FQ8WrJnGY5Wd7b+f
	4aNstRjCgir1+xkB2rA0nRl5lIb+ga0w=
X-Gm-Gg: ASbGncttQ+8GWWJS+K27jNwuwe7wBJDkMMljTgk2j57UZi5dJWE0H2KQUh1jdyAZuY8
	+tH6+jmeIfW3XUrYKfQwgEBPmDw+2wdJd8/Qy5DJm6eFZD4RVL7zav5n9v7/jIzfoocFJYwIRUU
	ekjBAaDUfKIQHsvXqE9yHRTFsXMHv7cVCOhYYsp7vt/jc4cmEjg1j1DeMtXHHfI5Mt4XRKksbR6
	d0qjXVXpDup6dJYM80r9Kx+vTppXbXhT6IZub3eFQJzIR0dPieftLNZDz4I8jil5TWOc6gPwp53
	VzPx39RAnkM9KaLXeAK2SYnsRe5aYr5I4rvvJVZmiILCLFCn8TqQM38Uco85FZk/c1IkAaXfija
	FgdM+O3PR79h/8d8IRZpZV/arXnPgj6NzmdK2ZZeC/mvwAa4HmWoVFbib
X-Google-Smtp-Source: AGHT+IFKow77ieQusXvKaWxZE79j6PwarYmWFkLDxIqw80iKoJef2Sm4hxi0M/Yr6N6poaxqOht/gEibBSW9O6Z715U=
X-Received: by 2002:a05:690e:12c9:b0:63f:a4d7:b523 with SMTP id
 956f58d0204a3-64329320ad2mr3057118d50.28.1764113551281; Tue, 25 Nov 2025
 15:32:31 -0800 (PST)
MIME-Version: 1.0
References: <20251125165528.1991859-1-skandigraun@gmail.com>
In-Reply-To: <20251125165528.1991859-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Nov 2025 15:32:05 -0800
X-Gm-Features: AWmQ_bnmzRQ8T5DtDtiYJufvZCHEwTZ3z4FfNQxD6FMxIKqmGrh9pd8VUoMqyd8
Message-ID: <CAMKF1sp+9D+YhJtMsYU2e36xvKbLhWEvxOnX8GEqVhrdyJDfYQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] xrdp: upgrade 0.9.20 -> 0.10.4.1
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009152b6064473b103"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 23:32:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122066

--0000000000009152b6064473b103
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

this breaks xorgxrdp recipe

https://errors.yoctoproject.org/Errors/Details/889900/

On Tue, Nov 25, 2025 at 8:55=E2=80=AFAM Gyorgy Sarvari via lists.openembedd=
ed.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> Contains fixes for the following vulnerabilities:
> CVE-2022-23468, CVE-2022-23477, CVE-2022-23478, CVE-2022-23479,
> CVE-2022-23480, CVE-2022-23481, CVE-2022-23482, CVE-2022-23483,
> CVE-2022-23484, CVE-2022-23493, CVE-2023-40184, CVE-2023-42822,
> CVE-2024-39917
>
> Added a new patch to fix compiling with musl.
>
> Dropped 0001-Fix-the-compile-error.patch: it's an 8 years old patch,
> claiming to fix a compile error. I did not see an error when I removed
> it (tried glibc and musl, gcc and clang).
>
> Changelogs:
> 0.10.4.1: https://github.com/neutrinolabs/xrdp/releases/tag/v0.10.4.1
> 0.10.4: https://github.com/neutrinolabs/xrdp/releases/tag/v0.10.4
> 0.10.3: https://github.com/neutrinolabs/xrdp/releases/tag/v0.10.3
> 0.10.2: https://github.com/neutrinolabs/xrdp/releases/tag/v0.10.2
> 0.10.1: https://github.com/neutrinolabs/xrdp/releases/tag/v0.10.1
> 0.10.0: https://github.com/neutrinolabs/xrdp/releases/tag/v0.10.0
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../xrdp/0001-Fix-the-compile-error.patch     | 37 -------------------
>  .../xrdp/xrdp/fix-compiling-with-musl.patch   | 27 ++++++++++++++
>  .../xrdp/{xrdp_0.9.20.bb =3D> xrdp_0.10.4.1.bb} | 20 ++++++----
>  3 files changed, 39 insertions(+), 45 deletions(-)
>  delete mode 100644
> meta-oe/recipes-support/xrdp/xrdp/0001-Fix-the-compile-error.patch
>  create mode 100644
> meta-oe/recipes-support/xrdp/xrdp/fix-compiling-with-musl.patch
>  rename meta-oe/recipes-support/xrdp/{xrdp_0.9.20.bb =3D> xrdp_0.10.4.1.b=
b}
> (87%)
>
> diff --git
> a/meta-oe/recipes-support/xrdp/xrdp/0001-Fix-the-compile-error.patch
> b/meta-oe/recipes-support/xrdp/xrdp/0001-Fix-the-compile-error.patch
> deleted file mode 100644
> index 1bb84001f3..0000000000
> --- a/meta-oe/recipes-support/xrdp/xrdp/0001-Fix-the-compile-error.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From 2fa575c3171688ceb0dc867a52628046b3f60d91 Mon Sep 17 00:00:00 2001
> -From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> -Date: Tue, 12 Dec 2017 22:36:50 +0800
> -Subject: [PATCH] Fix the make error
> -
> -Fix the compile error:
> - *** No rule to make target '../librfxcodec/src/.libs/librfxencode.a',
> needed by 'xrdp'.  Stop..
> -
> -Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ----
> -Upstream-Status: Pending
> -
> - xrdp/Makefile.am | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/xrdp/Makefile.am b/xrdp/Makefile.am
> -index 71d0f76..f41751b 100644
> ---- a/xrdp/Makefile.am
> -+++ b/xrdp/Makefile.am
> -@@ -21,7 +21,7 @@ XRDP_EXTRA_LIBS =3D
> - if XRDP_RFXCODEC
> - AM_CPPFLAGS +=3D -DXRDP_RFXCODEC
> - AM_CPPFLAGS +=3D -I$(top_srcdir)/librfxcodec/include
> --XRDP_EXTRA_LIBS +=3D $(top_builddir)/librfxcodec/src/.libs/librfxencode=
.a
> -+XRDP_EXTRA_LIBS +=3D $(top_builddir)/librfxcodec/src/.libs/librfxencode=
.la
> - endif
> -
> - if XRDP_PIXMAN
> -@@ -33,7 +33,7 @@ endif
> - if XRDP_PAINTER
> - AM_CPPFLAGS +=3D -DXRDP_PAINTER
> - AM_CPPFLAGS +=3D -I$(top_srcdir)/libpainter/include
> --XRDP_EXTRA_LIBS +=3D $(top_builddir)/libpainter/src/.libs/libpainter.a
> -+XRDP_EXTRA_LIBS +=3D $(top_builddir)/libpainter/src/.libs/libpainter.la
> - endif
> -
> - sbin_PROGRAMS =3D \
> diff --git
> a/meta-oe/recipes-support/xrdp/xrdp/fix-compiling-with-musl.patch
> b/meta-oe/recipes-support/xrdp/xrdp/fix-compiling-with-musl.patch
> new file mode 100644
> index 0000000000..c716229ab6
> --- /dev/null
> +++ b/meta-oe/recipes-support/xrdp/xrdp/fix-compiling-with-musl.patch
> @@ -0,0 +1,27 @@
> +
> +sys/signal.h does almost the same in both glibc and musl: it includes
> "signal.h"
> +
> +However with musl there is also a warning macro about this, which is
> interpreted as
> +an error during building.
> +
> +Fixes error:
> +
> +| In file included from ../../sources/xrdp-0.10.4.1/waitforx/waitforx.c:=
5:
> +| <...>/usr/include/sys/signal.h:1:2: error: #warning redirecting
> incorrect #include <sys/signal.h> to <signal.h> [-Werror=3Dcpp]
> +|     1 | #warning redirecting incorrect #include <sys/signal.h> to
> <signal.h>
> +|       |  ^~~~~~~
> +| cc1: all warnings being treated as errors
> +
> +Upstream-Status: Submitted [
> https://github.com/neutrinolabs/xrdp/pull/3678]
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +
> +--- ./waitforx/waitforx.c.orig 2025-11-25 14:38:46.464337398 +0100
> ++++ ./waitforx/waitforx.c      2025-11-25 14:38:52.007441093 +0100
> +@@ -2,7 +2,6 @@
> + #include <signal.h>
> + #include <stdio.h>
> + #include <stdlib.h>
> +-#include <sys/signal.h>
> + #include <unistd.h>
> +
> + #include "config_ac.h"
> diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
> b/meta-oe/recipes-support/xrdp/xrdp_0.10.4.1.bb
> similarity index 87%
> rename from meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
> rename to meta-oe/recipes-support/xrdp/xrdp_0.10.4.1.bb
> index a60c125d06..cd45d27fe4 100644
> --- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
> +++ b/meta-oe/recipes-support/xrdp/xrdp_0.10.4.1.bb
> @@ -13,20 +13,20 @@ REQUIRED_DISTRO_FEATURES =3D "x11 pam"
>  SRC_URI =3D "
> https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN}-${=
PV}.tar.gz
> \
>             file://xrdp.sysconfig \
>
> file://0001-Added-req_distinguished_name-in-etc-xrdp-openssl.con.patch \
> -           file://0001-Fix-the-compile-error.patch \
>             file://0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch \
>             file://0001-mark-count-with-unused-attribute.patch \
>             "
> +SRC_URI:append:libc-musl =3D " file://fix-compiling-with-musl.patch"
>
> -SRC_URI[sha256sum] =3D
> "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"
> +SRC_URI[sha256sum] =3D
> "52eadf3e86c57be0de0b9d5c184b52a7946a070746d3eb04b5089dd6d42f8f5f"
>
>  UPSTREAM_CHECK_URI =3D "https://github.com/neutrinolabs/xrdp/releases"
>  UPSTREAM_CHECK_REGEX =3D "releases/tag/v(?P<pver>\d+(\.\d+)+)"
>
>  CFLAGS +=3D " -Wno-deprecated-declarations"
>
> -PACKAGECONFIG ??=3D ""
> -PACKAGECONFIG[fuse] =3D " --enable-fuse, --disable-fuse, fuse"
> +PACKAGECONFIG ??=3D "fuse"
> +PACKAGECONFIG[fuse] =3D " --enable-fuse, --disable-fuse, fuse3"
>
>  USERADD_PACKAGES =3D "${PN}"
>  GROUPADD_PARAM:${PN} =3D "--system xrdp"
> @@ -36,10 +36,14 @@ USERADD_PARAM:${PN}  =3D "--system --home /var/run/xr=
dp
> -g xrdp \
>  FILES:${PN} +=3D "${datadir}/dbus-1/services/*.service \
>                  ${datadir}/dbus-1/accessibility-services/*.service "
>
> -FILES:${PN}-dev +=3D "${libdir}/xrdp/libcommon.so \
> -                    ${libdir}/xrdp/libxrdp.so \
> -                    ${libdir}/xrdp/libscp.so \
> -                    ${libdir}/xrdp/libxrdpapi.so "
> +FILES:${PN}-dev +=3D " \
> +    ${libdir}/xrdp/libcommon.so \
> +    ${libdir}/xrdp/libxrdp.so \
> +    ${libdir}/xrdp/libxrdpapi.so \
> +    ${libdir}/xrdp/libtoml.so \
> +    ${libdir}/xrdp/libsesman.so \
> +    ${libdir}/xrdp/libipm.so \
> +    "
>
>  EXTRA_OECONF =3D "--enable-pam-config=3Dsuse --enable-fuse \
>                  --enable-pixman --enable-painter --enable-vsock \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122058):
> https://lists.openembedded.org/g/openembedded-devel/message/122058
> Mute This Topic: https://lists.openembedded.org/mt/116471889/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009152b6064473b103
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">this=C2=A0breaks=C2=A0xorgxrdp recipe<div><br></div><div><=
a href=3D"https://errors.yoctoproject.org/Errors/Details/889900/">https://e=
rrors.yoctoproject.org/Errors/Details/889900/</a></div></div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Tue, Nov 25, 2025 at 8:55=E2=80=AFAM Gyorgy Sarvari via <a href=3D"htt=
p://lists.openembedded.org">lists.openembedded.org</a> &lt;skandigraun=3D<a=
 href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembed=
ded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Contains fixes for the following vulnerabilities:<br>
CVE-2022-23468, CVE-2022-23477, CVE-2022-23478, CVE-2022-23479,<br>
CVE-2022-23480, CVE-2022-23481, CVE-2022-23482, CVE-2022-23483,<br>
CVE-2022-23484, CVE-2022-23493, CVE-2023-40184, CVE-2023-42822,<br>
CVE-2024-39917<br>
<br>
Added a new patch to fix compiling with musl.<br>
<br>
Dropped 0001-Fix-the-compile-error.patch: it&#39;s an 8 years old patch,<br=
>
claiming to fix a compile error. I did not see an error when I removed<br>
it (tried glibc and musl, gcc and clang).<br>
<br>
Changelogs:<br>
<a href=3D"http://0.10.4.1" rel=3D"noreferrer" target=3D"_blank">0.10.4.1</=
a>: <a href=3D"https://github.com/neutrinolabs/xrdp/releases/tag/v0.10.4.1"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/neutrinolabs/xrdp/=
releases/tag/v0.10.4.1</a><br>
0.10.4: <a href=3D"https://github.com/neutrinolabs/xrdp/releases/tag/v0.10.=
4" rel=3D"noreferrer" target=3D"_blank">https://github.com/neutrinolabs/xrd=
p/releases/tag/v0.10.4</a><br>
0.10.3: <a href=3D"https://github.com/neutrinolabs/xrdp/releases/tag/v0.10.=
3" rel=3D"noreferrer" target=3D"_blank">https://github.com/neutrinolabs/xrd=
p/releases/tag/v0.10.3</a><br>
0.10.2: <a href=3D"https://github.com/neutrinolabs/xrdp/releases/tag/v0.10.=
2" rel=3D"noreferrer" target=3D"_blank">https://github.com/neutrinolabs/xrd=
p/releases/tag/v0.10.2</a><br>
0.10.1: <a href=3D"https://github.com/neutrinolabs/xrdp/releases/tag/v0.10.=
1" rel=3D"noreferrer" target=3D"_blank">https://github.com/neutrinolabs/xrd=
p/releases/tag/v0.10.1</a><br>
0.10.0: <a href=3D"https://github.com/neutrinolabs/xrdp/releases/tag/v0.10.=
0" rel=3D"noreferrer" target=3D"_blank">https://github.com/neutrinolabs/xrd=
p/releases/tag/v0.10.0</a><br>
<br>
Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" =
target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../xrdp/0001-Fix-the-compile-error.patch=C2=A0 =C2=A0 =C2=A0| 37 ---=
----------------<br>
=C2=A0.../xrdp/xrdp/fix-compiling-with-musl.patch=C2=A0 =C2=A0| 27 ++++++++=
++++++<br>
=C2=A0.../xrdp/{<a href=3D"http://xrdp_0.9.20.bb" rel=3D"noreferrer" target=
=3D"_blank">xrdp_0.9.20.bb</a> =3D&gt; <a href=3D"http://xrdp_0.10.4.1.bb" =
rel=3D"noreferrer" target=3D"_blank">xrdp_0.10.4.1.bb</a>} | 20 ++++++----<=
br>
=C2=A03 files changed, 39 insertions(+), 45 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/xrdp/xrdp/0001-Fix-the-com=
pile-error.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/xrdp/xrdp/fix-compiling-wi=
th-musl.patch<br>
=C2=A0rename meta-oe/recipes-support/xrdp/{<a href=3D"http://xrdp_0.9.20.bb=
" rel=3D"noreferrer" target=3D"_blank">xrdp_0.9.20.bb</a> =3D&gt; <a href=
=3D"http://xrdp_0.10.4.1.bb" rel=3D"noreferrer" target=3D"_blank">xrdp_0.10=
.4.1.bb</a>} (87%)<br>
<br>
diff --git a/meta-oe/recipes-support/xrdp/xrdp/0001-Fix-the-compile-error.p=
atch b/meta-oe/recipes-support/xrdp/xrdp/0001-Fix-the-compile-error.patch<b=
r>
deleted file mode 100644<br>
index 1bb84001f3..0000000000<br>
--- a/meta-oe/recipes-support/xrdp/xrdp/0001-Fix-the-compile-error.patch<br=
>
+++ /dev/null<br>
@@ -1,37 +0,0 @@<br>
-From 2fa575c3171688ceb0dc867a52628046b3f60d91 Mon Sep 17 00:00:00 2001<br>
-From: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.com" targ=
et=3D"_blank">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
-Date: Tue, 12 Dec 2017 22:36:50 +0800<br>
-Subject: [PATCH] Fix the make error<br>
-<br>
-Fix the compile error:<br>
- *** No rule to make target &#39;../librfxcodec/src/.libs/librfxencode.a&#=
39;, needed by &#39;xrdp&#39;.=C2=A0 Stop..<br>
-<br>
-Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.=
com" target=3D"_blank">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
----<br>
-Upstream-Status: Pending<br>
-<br>
- xrdp/Makefile.am | 4 ++--<br>
- 1 file changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/xrdp/Makefile.am b/xrdp/Makefile.am<br>
-index 71d0f76..f41751b 100644<br>
---- a/xrdp/Makefile.am<br>
-+++ b/xrdp/Makefile.am<br>
-@@ -21,7 +21,7 @@ XRDP_EXTRA_LIBS =3D<br>
- if XRDP_RFXCODEC<br>
- AM_CPPFLAGS +=3D -DXRDP_RFXCODEC<br>
- AM_CPPFLAGS +=3D -I$(top_srcdir)/librfxcodec/include<br>
--XRDP_EXTRA_LIBS +=3D $(top_builddir)/librfxcodec/src/.libs/librfxencode.a=
<br>
-+XRDP_EXTRA_LIBS +=3D $(top_builddir)/librfxcodec/src/.libs/<a href=3D"htt=
p://librfxencode.la" rel=3D"noreferrer" target=3D"_blank">librfxencode.la</=
a><br>
- endif<br>
- <br>
- if XRDP_PIXMAN<br>
-@@ -33,7 +33,7 @@ endif<br>
- if XRDP_PAINTER<br>
- AM_CPPFLAGS +=3D -DXRDP_PAINTER<br>
- AM_CPPFLAGS +=3D -I$(top_srcdir)/libpainter/include<br>
--XRDP_EXTRA_LIBS +=3D $(top_builddir)/libpainter/src/.libs/libpainter.a<br=
>
-+XRDP_EXTRA_LIBS +=3D $(top_builddir)/libpainter/src/.libs/<a href=3D"http=
://libpainter.la" rel=3D"noreferrer" target=3D"_blank">libpainter.la</a><br=
>
- endif<br>
- <br>
- sbin_PROGRAMS =3D \<br>
diff --git a/meta-oe/recipes-support/xrdp/xrdp/fix-compiling-with-musl.patc=
h b/meta-oe/recipes-support/xrdp/xrdp/fix-compiling-with-musl.patch<br>
new file mode 100644<br>
index 0000000000..c716229ab6<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/xrdp/xrdp/fix-compiling-with-musl.patch<br>
@@ -0,0 +1,27 @@<br>
+<br>
+sys/signal.h does almost the same in both glibc and musl: it includes &quo=
t;signal.h&quot;<br>
+<br>
+However with musl there is also a warning macro about this, which is inter=
preted as<br>
+an error during building.<br>
+<br>
+Fixes error:<br>
+<br>
+| In file included from ../../sources/xrdp-0.10.4.1/waitforx/waitforx.c:5:=
<br>
+| &lt;...&gt;/usr/include/sys/signal.h:1:2: error: #warning redirecting in=
correct #include &lt;sys/signal.h&gt; to &lt;signal.h&gt; [-Werror=3Dcpp]<b=
r>
+|=C2=A0 =C2=A0 =C2=A01 | #warning redirecting incorrect #include &lt;sys/s=
ignal.h&gt; to &lt;signal.h&gt;<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 ^~~~~~~<br>
+| cc1: all warnings being treated as errors<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/neutrinolabs/xrd=
p/pull/3678" rel=3D"noreferrer" target=3D"_blank">https://github.com/neutri=
nolabs/xrdp/pull/3678</a>]<br>
+Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com"=
 target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
+<br>
+--- ./waitforx/waitforx.c.orig 2025-11-25 14:38:46.464337398 +0100<br>
++++ ./waitforx/waitforx.c=C2=A0 =C2=A0 =C2=A0 2025-11-25 14:38:52.00744109=
3 +0100<br>
+@@ -2,7 +2,6 @@<br>
+ #include &lt;signal.h&gt;<br>
+ #include &lt;stdio.h&gt;<br>
+ #include &lt;stdlib.h&gt;<br>
+-#include &lt;sys/signal.h&gt;<br>
+ #include &lt;unistd.h&gt;<br>
+ <br>
+ #include &quot;config_ac.h&quot;<br>
diff --git a/meta-oe/recipes-support/xrdp/<a href=3D"http://xrdp_0.9.20.bb"=
 rel=3D"noreferrer" target=3D"_blank">xrdp_0.9.20.bb</a> b/meta-oe/recipes-=
support/xrdp/<a href=3D"http://xrdp_0.10.4.1.bb" rel=3D"noreferrer" target=
=3D"_blank">xrdp_0.10.4.1.bb</a><br>
similarity index 87%<br>
rename from meta-oe/recipes-support/xrdp/<a href=3D"http://xrdp_0.9.20.bb" =
rel=3D"noreferrer" target=3D"_blank">xrdp_0.9.20.bb</a><br>
rename to meta-oe/recipes-support/xrdp/<a href=3D"http://xrdp_0.10.4.1.bb" =
rel=3D"noreferrer" target=3D"_blank">xrdp_0.10.4.1.bb</a><br>
index a60c125d06..cd45d27fe4 100644<br>
--- a/meta-oe/recipes-support/xrdp/<a href=3D"http://xrdp_0.9.20.bb" rel=3D=
"noreferrer" target=3D"_blank">xrdp_0.9.20.bb</a><br>
+++ b/meta-oe/recipes-support/xrdp/<a href=3D"http://xrdp_0.10.4.1.bb" rel=
=3D"noreferrer" target=3D"_blank">xrdp_0.10.4.1.bb</a><br>
@@ -13,20 +13,20 @@ REQUIRED_DISTRO_FEATURES =3D &quot;x11 pam&quot;<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://github.com/neutrinolabs/$%7BBPN%=
7D/releases/download/v$%7BPV%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"norefer=
rer" target=3D"_blank">https://github.com/neutrinolabs/${BPN}/releases/down=
load/v${PV}/${BPN}-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://xrdp.sysconfig \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Added-req_distinguish=
ed_name-in-etc-xrdp-openssl.con.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-the-compile-error=
.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-arch-Define-NO_NEED_A=
LIGN-on-ppc64.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-mark-count-with-unuse=
d-attribute.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+SRC_URI:append:libc-musl =3D &quot; file://fix-compiling-with-musl.patch&q=
uot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;db693401da95b71b4d4e4c99aeb569a546dbdbde343f6=
d3302b0c47653277abb&quot;<br>
+SRC_URI[sha256sum] =3D &quot;52eadf3e86c57be0de0b9d5c184b52a7946a070746d3e=
b04b5089dd6d42f8f5f&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/neutrinola=
bs/xrdp/releases" rel=3D"noreferrer" target=3D"_blank">https://github.com/n=
eutrinolabs/xrdp/releases</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;releases/tag/v(?P&lt;pver&gt;\d+(\.\d+=
)+)&quot;<br>
<br>
=C2=A0CFLAGS +=3D &quot; -Wno-deprecated-declarations&quot;<br>
<br>
-PACKAGECONFIG ??=3D &quot;&quot;<br>
-PACKAGECONFIG[fuse] =3D &quot; --enable-fuse, --disable-fuse, fuse&quot;<b=
r>
+PACKAGECONFIG ??=3D &quot;fuse&quot;<br>
+PACKAGECONFIG[fuse] =3D &quot; --enable-fuse, --disable-fuse, fuse3&quot;<=
br>
<br>
=C2=A0USERADD_PACKAGES =3D &quot;${PN}&quot;<br>
=C2=A0GROUPADD_PARAM:${PN} =3D &quot;--system xrdp&quot;<br>
@@ -36,10 +36,14 @@ USERADD_PARAM:${PN}=C2=A0 =3D &quot;--system --home /va=
r/run/xrdp -g xrdp \<br>
=C2=A0FILES:${PN} +=3D &quot;${datadir}/dbus-1/services/*.service \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/db=
us-1/accessibility-services/*.service &quot;<br>
<br>
-FILES:${PN}-dev +=3D &quot;${libdir}/xrdp/libcommon.so \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${li=
bdir}/xrdp/libxrdp.so \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${li=
bdir}/xrdp/libscp.so \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${li=
bdir}/xrdp/libxrdpapi.so &quot;<br>
+FILES:${PN}-dev +=3D &quot; \<br>
+=C2=A0 =C2=A0 ${libdir}/xrdp/libcommon.so \<br>
+=C2=A0 =C2=A0 ${libdir}/xrdp/libxrdp.so \<br>
+=C2=A0 =C2=A0 ${libdir}/xrdp/libxrdpapi.so \<br>
+=C2=A0 =C2=A0 ${libdir}/xrdp/libtoml.so \<br>
+=C2=A0 =C2=A0 ${libdir}/xrdp/libsesman.so \<br>
+=C2=A0 =C2=A0 ${libdir}/xrdp/libipm.so \<br>
+=C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--enable-pam-config=3Dsuse --enable-fuse \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-pixm=
an --enable-painter --enable-vsock \<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122058): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122058" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122058</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116471889/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116471889/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000009152b6064473b103--

