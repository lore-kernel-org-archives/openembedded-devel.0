Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07CD1C05027
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 20:26:31 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.5135.1676838384149606650
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Feb 2023 12:26:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AnkPlsQY;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id j14so871150wms.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Feb 2023 12:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hpCu/huiVkKBNOsZsl7DQZuIhO0eAD+8ta0j8qSyA6M=;
        b=AnkPlsQY/zmX2ZHlfNWUdSkInwqb4ltBtQczLZwMG5/YqSgK/1PBQfacgztAeJw2T5
         bWRwfUVtIyD7P9cFIrKDJ7ZeEWQw8rM9t73uvGjJBaXbxD5DFM0Vfrw3+ciYVKI+vzMX
         GaFIKKe471faXB6z2Bn+LqfMfg5If+QVsdGWhp3LyBmSmnlaCnFG7lspy4ExAU8D4aK/
         1b0NNPLZ9ZuN0qp+oycFNetDEfAOpEzIsODu5AB/oXGBQ785wvuNlZ8w+LEE5hLixMrV
         q4IcPbFzGDCb+SRjNSnkjK70AnZ7TVdJTwznUaWLcA9wWg7XPYD0m5kDCaeBwm510aCE
         Ipyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hpCu/huiVkKBNOsZsl7DQZuIhO0eAD+8ta0j8qSyA6M=;
        b=KlZfXzSqzpCESDbYjM0aNm6psX15XVjN3IbP5RdUOFdRGgOT1Tq1ZyUcIRuEFqd4Bd
         zdWgSp1ATD1nrfI+CUiQNzSvEbxfx72QSgLtZTteBAx6UHmH8HGOINolZgxRlbMiGqfk
         +LgGNIgOVdb2VfwMdYJVQyEKNvg8StHK0Uz98zH+qgrP2UwScxif/NRig3leojemWQ2q
         BTVq4W+pEtSFr9UxzBIVvfXzL7s7V2J0LzJbX8elUHGjiDVLy3pmW+Re05PNgHjh7F7o
         DJ9UaMryCVCcAH+VCyQzHJvzXYQhwKFkgdzx7BTjxaZvMJCFIJBKWZgQsqun0qL++g9J
         qdsg==
X-Gm-Message-State: AO0yUKXQNNZ86pErJerPnRsdnPjxQg7cZO2MnzrbgH5UxPemQzGoHvdz
	Nn6+fePmbhMtoXB7N8tUt5Xq1NxjJEUjpMHuSPw=
X-Google-Smtp-Source: AK7set8z9b8HzXLrAsi+UVB6wQhN3maErp95q2RJRnsHTHpiYekw75UBAZ2fONX1LG4RvBlfe8X60Xv7syHJxw2B/kc=
X-Received: by 2002:a05:600c:4f81:b0:3df:e60d:c374 with SMTP id
 n1-20020a05600c4f8100b003dfe60dc374mr988713wmq.52.1676838382430; Sun, 19 Feb
 2023 12:26:22 -0800 (PST)
MIME-Version: 1.0
References: <20230219201053.86040-1-marex@denx.de>
In-Reply-To: <20230219201053.86040-1-marex@denx.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 19 Feb 2023 21:26:11 +0100
Message-ID: <CA+chaQeFXYEgE5WRjCXbunm6nxfcSc6dgbmTvJ_J5Jk41qW+xA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] v4l-utils: Update 1.23.0+fd544473 -> 1.23.0+9431e4b2
To: Marek Vasut <marex@denx.de>
Cc: openembedded-devel@lists.openembedded.org, Daniel Gomez <daniel@qtec.com>, 
	Khem Raj <raj.khem@gmail.com>, Peter Kjellerstedt <pkj@axis.com>
Content-Type: multipart/alternative; boundary="00000000000021702c05f5135c91"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Feb 2023 20:26:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101154

--00000000000021702c05f5135c91
Content-Type: text/plain; charset="UTF-8"

Shouldn't +git${SRCPV} be included in PV to distinguish these 2 versions?
Now both will claim 1.23.0 version which is incorrect, right?

It should be included in
https://git.openembedded.org/meta-openembedded/commit/?id=ff7666cae8b3e6cca45e5d0652b16d6caa6be7a5
already as the summary says 1.23.0+fd544473, so probably wasn't exactly
1.23.0 as well.

On Sun, Feb 19, 2023 at 9:11 PM Marek Vasut <marex@denx.de> wrote:

> Update V4L2 utils to latest git HEAD and drop patches now upstream:
> 575e0a9f ("media-info: Include missing <cstdint> for uintptr_t")
> 96022d88 ("configure.ac, Makefile.am: Support building without NLS")
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Daniel Gomez <daniel@qtec.com>
> Cc: Khem Raj <raj.khem@gmail.com>
> Cc: Peter Kjellerstedt <pkj@axis.com>
> ---
>  ...nclude-missing-cstdint-for-uintptr_t.patch | 31 -------------
>  ...efile.am-Support-building-without-NL.patch | 45 -------------------
>  .../v4l2apps/v4l-utils_1.23.0.bb              |  4 +-
>  3 files changed, 1 insertion(+), 79 deletions(-)
>  delete mode 100644
> meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-info-Include-missing-cstdint-for-uintptr_t.patch
>  delete mode 100644
> meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0005-configure.ac-Makefile.am-Support-building-without-NL.patch
>
> diff --git
> a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-info-Include-missing-cstdint-for-uintptr_t.patch
> b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-info-Include-missing-cstdint-for-uintptr_t.patch
> deleted file mode 100644
> index 032bf00c7..000000000
> ---
> a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-info-Include-missing-cstdint-for-uintptr_t.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 1d9ce7cd799770981043f656373cbd1bf7558b9a Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 26 Jan 2023 17:00:00 -0800
> -Subject: [PATCH] media-info: Include missing <cstdint> for uintptr_t
> -
> -gcc 13 moved some includes around and as a result <cstdint> is no longer
> -transitively included [1]. Explicitly include it.
> -
> -[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
> -
> -Upstream-Status: Submitted [
> https://lore.kernel.org/linux-media/20230127010741.3883339-1-raj.khem@gmail.com/
> ]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - utils/common/media-info.cpp | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/utils/common/media-info.cpp b/utils/common/media-info.cpp
> -index 53e132f5..1a25a4b6 100644
> ---- a/utils/common/media-info.cpp
> -+++ b/utils/common/media-info.cpp
> -@@ -3,6 +3,7 @@
> -  * Copyright 2018 Cisco Systems, Inc. and/or its affiliates. All rights
> reserved.
> -  */
> -
> -+#include <cstdint>
> - #include <cstring>
> - #include <fstream>
> - #include <iostream>
> ---
> -2.39.1
> -
> diff --git
> a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0005-configure.ac-Makefile.am-Support-building-without-NL.patch
> b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0005-configure.ac-Makefile.am-Support-building-without-NL.patch
> deleted file mode 100644
> index 0548e4fba..000000000
> ---
> a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0005-configure.ac-Makefile.am-Support-building-without-NL.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -From 4fe9f6071cd24bcab157a9398adcca474f619f8d Mon Sep 17 00:00:00 2001
> -From: Peter Kjellerstedt <pkj@axis.com>
> -Date: Sat, 15 Oct 2022 02:45:26 +0200
> -Subject: [PATCH] configure.ac, Makefile.am: Support building without NLS
> -
> -Avoid entering the v4l-utils-po and libdvbv5-po directories if NLS
> -support is disabled, as the generated Makefiles in those directories are
> -empty then.
> -
> -Upstream-Status: Submitted [
> https://patchwork.linuxtv.org/project/linux-media/patch/20221015010541.688322-1-pkj@axis.com/
> ]
> -Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ----
> - Makefile.am  | 6 +++++-
> - configure.ac | 1 +
> - 2 files changed, 6 insertions(+), 1 deletion(-)
> -
> -diff --git a/Makefile.am b/Makefile.am
> -index 7fb443ab..8e924af8 100644
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -2,7 +2,11 @@ AUTOMAKE_OPTIONS = foreign
> - ACLOCAL_AMFLAGS = -I m4
> - AM_MAKEFLAGS = $(word 1, $(subst 1, -w, $(filter 1, $(V)))
> --no-print-directory)
> -
> --SUBDIRS = v4l-utils-po libdvbv5-po lib
> -+SUBDIRS = lib
> -+
> -+if USE_NLS
> -+SUBDIRS += v4l-utils-po libdvbv5-po
> -+endif
> -
> - if WITH_V4LUTILS
> - SUBDIRS += utils contrib
> -diff --git a/configure.ac b/configure.ac
> -index 05298981..7c78467f 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -99,6 +99,7 @@ DX_INIT_DOXYGEN($PACKAGE_NAME, doxygen_libdvbv5.cfg)
> - ALL_LINGUAS=""
> -
> m4_ifdef(AM_GNU_GETTEXT_REQUIRE_VERSION,[AM_GNU_GETTEXT_REQUIRE_VERSION([0.19.8])],[AM_GNU_GETTEXT_VERSION([0.19.8])])
> - AM_GNU_GETTEXT([external])
> -+AM_CONDITIONAL([USE_NLS], [test "$USE_NLS" = "yes"])
> -
> - LIBDVBV5_DOMAIN="libdvbv5"
> - AC_DEFINE([LIBDVBV5_DOMAIN], "libdvbv5", [libdvbv5 domain])
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb
> b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb
> index b42300f09..ad9ef2bab 100644
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb
> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb
> @@ -31,11 +31,9 @@ SRC_URI = "\
>      file://0002-original-patch-mediactl-pkgconfig.patch \
>      file://0003-original-patch-export-mediactl-headers.patch \
>      file://0004-Do-not-use-getsubopt.patch \
> -
> file://0005-configure.ac-Makefile.am-Support-building-without-NL.patch \
> -    file://0001-media-info-Include-missing-cstdint-for-uintptr_t.patch \
>  "
>
> -SRCREV = "fd544473800d02e90bc289434cc44e5aa8fadd0f"
> +SRCREV = "9431e4b26b4842d1401e80ada9f14593dca3a94c"
>
>  S = "${WORKDIR}/git"
>  B = "${S}"
> --
> 2.39.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101153):
> https://lists.openembedded.org/g/openembedded-devel/message/101153
> Mute This Topic: https://lists.openembedded.org/mt/97072896/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000021702c05f5135c91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Shouldn&#39;t +git${SRCPV} be included in PV to distinguis=
h these 2 versions? Now both will claim 1.23.0 version which is incorrect, =
right?<div><br></div><div>It should be included in=C2=A0<a href=3D"https://=
git.openembedded.org/meta-openembedded/commit/?id=3Dff7666cae8b3e6cca45e5d0=
652b16d6caa6be7a5">https://git.openembedded.org/meta-openembedded/commit/?i=
d=3Dff7666cae8b3e6cca45e5d0652b16d6caa6be7a5</a> already as the summary say=
s=C2=A01.23.0+fd544473, so probably wasn&#39;t exactly 1.23.0 as well.</div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Sun, Feb 19, 2023 at 9:11 PM Marek Vasut &lt;<a href=3D"mailto:marex@de=
nx.de">marex@denx.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Update V4L2 utils to latest git HEAD and drop patches n=
ow upstream:<br>
575e0a9f (&quot;media-info: Include missing &lt;cstdint&gt; for uintptr_t&q=
uot;)<br>
96022d88 (&quot;<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a>, Makefile.am: Support building without NLS&quo=
t;)<br>
<br>
Signed-off-by: Marek Vasut &lt;<a href=3D"mailto:marex@denx.de" target=3D"_=
blank">marex@denx.de</a>&gt;<br>
---<br>
Cc: Daniel Gomez &lt;<a href=3D"mailto:daniel@qtec.com" target=3D"_blank">d=
aniel@qtec.com</a>&gt;<br>
Cc: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">ra=
j.khem@gmail.com</a>&gt;<br>
Cc: Peter Kjellerstedt &lt;<a href=3D"mailto:pkj@axis.com" target=3D"_blank=
">pkj@axis.com</a>&gt;<br>
---<br>
=C2=A0...nclude-missing-cstdint-for-uintptr_t.patch | 31 -------------<br>
=C2=A0...efile.am-Support-building-without-NL.patch | 45 ------------------=
-<br>
=C2=A0.../v4l2apps/<a href=3D"http://v4l-utils_1.23.0.bb" rel=3D"noreferrer=
" target=3D"_blank">v4l-utils_1.23.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 4 +-<br>
=C2=A03 files changed, 1 insertion(+), 79 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001=
-media-info-Include-missing-cstdint-for-uintptr_t.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0005=
-configure.ac-Makefile.am-Support-building-without-NL.patch<br>
<br>
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-info-=
Include-missing-cstdint-for-uintptr_t.patch b/meta-oe/recipes-multimedia/v4=
l2apps/v4l-utils/0001-media-info-Include-missing-cstdint-for-uintptr_t.patc=
h<br>
deleted file mode 100644<br>
index 032bf00c7..000000000<br>
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-info-Include=
-missing-cstdint-for-uintptr_t.patch<br>
+++ /dev/null<br>
@@ -1,31 +0,0 @@<br>
-From 1d9ce7cd799770981043f656373cbd1bf7558b9a Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Thu, 26 Jan 2023 17:00:00 -0800<br>
-Subject: [PATCH] media-info: Include missing &lt;cstdint&gt; for uintptr_t=
<br>
-<br>
-gcc 13 moved some includes around and as a result &lt;cstdint&gt; is no lo=
nger<br>
-transitively included [1]. Explicitly include it.<br>
-<br>
-[1] <a href=3D"https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-chang=
es" rel=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/gcc-13/porting=
_to.html#header-dep-changes</a><br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://lore.kernel.org/linux-media=
/20230127010741.3883339-1-raj.khem@gmail.com/" rel=3D"noreferrer" target=3D=
"_blank">https://lore.kernel.org/linux-media/20230127010741.3883339-1-raj.k=
hem@gmail.com/</a>]<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- utils/common/media-info.cpp | 1 +<br>
- 1 file changed, 1 insertion(+)<br>
-<br>
-diff --git a/utils/common/media-info.cpp b/utils/common/media-info.cpp<br>
-index 53e132f5..1a25a4b6 100644<br>
---- a/utils/common/media-info.cpp<br>
-+++ b/utils/common/media-info.cpp<br>
-@@ -3,6 +3,7 @@<br>
-=C2=A0 * Copyright 2018 Cisco Systems, Inc. and/or its affiliates. All rig=
hts reserved.<br>
-=C2=A0 */<br>
- <br>
-+#include &lt;cstdint&gt;<br>
- #include &lt;cstring&gt;<br>
- #include &lt;fstream&gt;<br>
- #include &lt;iostream&gt;<br>
--- <br>
-2.39.1<br>
-<br>
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0005-configure.a=
c-Makefile.am-Support-building-without-NL.patch b/meta-oe/recipes-multimedi=
a/v4l2apps/v4l-utils/0005-configure.ac-Makefile.am-Support-building-without=
-NL.patch<br>
deleted file mode 100644<br>
index 0548e4fba..000000000<br>
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0005-configure.ac-Makef=
ile.am-Support-building-without-NL.patch<br>
+++ /dev/null<br>
@@ -1,45 +0,0 @@<br>
-From 4fe9f6071cd24bcab157a9398adcca474f619f8d Mon Sep 17 00:00:00 2001<br>
-From: Peter Kjellerstedt &lt;<a href=3D"mailto:pkj@axis.com" target=3D"_bl=
ank">pkj@axis.com</a>&gt;<br>
-Date: Sat, 15 Oct 2022 02:45:26 +0200<br>
-Subject: [PATCH] <a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a>, Makefile.am: Support building without NLS<br>
-<br>
-Avoid entering the v4l-utils-po and libdvbv5-po directories if NLS<br>
-support is disabled, as the generated Makefiles in those directories are<b=
r>
-empty then.<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://patchwork.linuxtv.org/proje=
ct/linux-media/patch/20221015010541.688322-1-pkj@axis.com/" rel=3D"noreferr=
er" target=3D"_blank">https://patchwork.linuxtv.org/project/linux-media/pat=
ch/20221015010541.688322-1-pkj@axis.com/</a>]<br>
-Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt=
@axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
----<br>
- Makefile.am=C2=A0 | 6 +++++-<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 1 +<br>
- 2 files changed, 6 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/Makefile.am b/Makefile.am<br>
-index 7fb443ab..8e924af8 100644<br>
---- a/Makefile.am<br>
-+++ b/Makefile.am<br>
-@@ -2,7 +2,11 @@ AUTOMAKE_OPTIONS =3D foreign<br>
- ACLOCAL_AMFLAGS =3D -I m4<br>
- AM_MAKEFLAGS =3D $(word 1, $(subst 1, -w, $(filter 1, $(V))) --no-print-d=
irectory)<br>
- <br>
--SUBDIRS =3D v4l-utils-po libdvbv5-po lib<br>
-+SUBDIRS =3D lib<br>
-+<br>
-+if USE_NLS<br>
-+SUBDIRS +=3D v4l-utils-po libdvbv5-po<br>
-+endif<br>
- <br>
- if WITH_V4LUTILS<br>
- SUBDIRS +=3D utils contrib<br>
-diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
-index 05298981..7c78467f 100644<br>
---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-@@ -99,6 +99,7 @@ DX_INIT_DOXYGEN($PACKAGE_NAME, doxygen_libdvbv5.cfg)<br>
- ALL_LINGUAS=3D&quot;&quot;<br>
- m4_ifdef(AM_GNU_GETTEXT_REQUIRE_VERSION,[AM_GNU_GETTEXT_REQUIRE_VERSION([=
0.19.8])],[AM_GNU_GETTEXT_VERSION([0.19.8])])<br>
- AM_GNU_GETTEXT([external])<br>
-+AM_CONDITIONAL([USE_NLS], [test &quot;$USE_NLS&quot; =3D &quot;yes&quot;]=
)<br>
- <br>
- LIBDVBV5_DOMAIN=3D&quot;libdvbv5&quot;<br>
- AC_DEFINE([LIBDVBV5_DOMAIN], &quot;libdvbv5&quot;, [libdvbv5 domain])<br>
diff --git a/meta-oe/recipes-multimedia/v4l2apps/<a href=3D"http://v4l-util=
s_1.23.0.bb" rel=3D"noreferrer" target=3D"_blank">v4l-utils_1.23.0.bb</a> b=
/meta-oe/recipes-multimedia/v4l2apps/<a href=3D"http://v4l-utils_1.23.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">v4l-utils_1.23.0.bb</a><br>
index b42300f09..ad9ef2bab 100644<br>
--- a/meta-oe/recipes-multimedia/v4l2apps/<a href=3D"http://v4l-utils_1.23.=
0.bb" rel=3D"noreferrer" target=3D"_blank">v4l-utils_1.23.0.bb</a><br>
+++ b/meta-oe/recipes-multimedia/v4l2apps/<a href=3D"http://v4l-utils_1.23.=
0.bb" rel=3D"noreferrer" target=3D"_blank">v4l-utils_1.23.0.bb</a><br>
@@ -31,11 +31,9 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://0002-original-patch-mediactl-pkgconfig.patch \<b=
r>
=C2=A0 =C2=A0 =C2=A0file://0003-original-patch-export-mediactl-headers.patc=
h \<br>
=C2=A0 =C2=A0 =C2=A0file://0004-Do-not-use-getsubopt.patch \<br>
-=C2=A0 =C2=A0 file://0005-configure.ac-Makefile.am-Support-building-withou=
t-NL.patch \<br>
-=C2=A0 =C2=A0 file://0001-media-info-Include-missing-cstdint-for-uintptr_t=
.patch \<br>
=C2=A0&quot;<br>
<br>
-SRCREV =3D &quot;fd544473800d02e90bc289434cc44e5aa8fadd0f&quot;<br>
+SRCREV =3D &quot;9431e4b26b4842d1401e80ada9f14593dca3a94c&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
=C2=A0B =3D &quot;${S}&quot;<br>
-- <br>
2.39.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#101153): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/101153" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/101153</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97072896/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97072896/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000021702c05f5135c91--

