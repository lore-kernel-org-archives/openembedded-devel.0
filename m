Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B366EF9EDFD
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 23:03:25 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.938.1776899003701984673
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2026 16:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gNEYrSyX;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64e87a81639so5565474d50.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 16:03:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776899003; cv=none;
        d=google.com; s=arc-20240605;
        b=ew9wmoP8lfQvskVQ1gSN6lOt0mGZ3p/w46g+rwgmM8mYCBdAESaEfRYCS8RIHJyof0
         JXgxyRtvmGAqhnorW0fa5Y6Ae0o2tJsFAZHgCSrRqSZvq5CXMbdKvnhYtSOc0APRradR
         sn0Dru+LfyJZMVEer75zx6UOvzkowmWL59kdfBGdz7M+F/5xlQ3PIf5v4NHReylUv388
         cw99CY/OFMOOl1oOrFpLd/Bcnff4LLKtFuAuMxl4VirkhcLUgFK0tH3GnrbwF8X9Nu+h
         tDiBNYaAAj4V6fhlyuELxjJLUZ6VqJEhVQm/clBhRrY5H36DYy2LjxpQ74GZK1bq6m0x
         XYaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4+9EIQvXwR1BUlJrkHaVXEOvBqRuG5Rt3i8peNVwWDA=;
        fh=egekEd7aMyGRDXyx4Y31HVxYou6pS4/nmcmXXjhG6Kw=;
        b=kryjj6ZDV9Uxa3Jb9WF0LGprOCk65+m7V9HbdsfyYayvhFDfJn8H/Gnuc+uOjT31X3
         YJNvgdIH/fb5H976/jw8pWH0prUGYoAIXC3jmKywRzziultUsmlLSo1Jvt6MSLTiir/Q
         apnzN1J0uQIedtQXLFbkNtoAPImFrUwuZ6ULeYMZ9eqYEfZZCZ4ChpzW5/iQu6udxWL2
         0KNftENQCjRs2eBEr5DQv69m2ayaf7922jSEOxFa4rgW7G8/LuV186bWIgXlK+fnh6nK
         4m9DfW2Lm+gVrIdmm3R4A4OmJvWQL+2B1ZDVDABwiw/U3KdzUk8N8b4PYijYsDtZXJL1
         L31A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776899003; x=1777503803; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4+9EIQvXwR1BUlJrkHaVXEOvBqRuG5Rt3i8peNVwWDA=;
        b=gNEYrSyX3GIxWyZjSa3f17zrtk1KQqAs+B27fNcfNdfHWHzD1LgnUsIAkTm4kzmDgh
         0WmoNhv90Jk6TfWOynypswU0TNU8EMSp6WiLjyT1EcyK9umD7P++OdsW8wtNdS1Xa/WA
         hOtE+sEdSmMME6JDP1VPyohsxLhPHGN53+vnUHzTXZISB+frNJWxpTs98ECleTI5oHps
         oZfBpFUJA83PVvsZ9NwHWCTUXGFmZSgka1gql9BxukBbJMP03+4KE7AFRuXagIX1uBN+
         tOMXR4XM54OsESSpgLkt0gYbAAF0emEoyM4ZSlPnYX3Gcvgp3zDZipm7oewxaHgsNpH/
         w9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776899003; x=1777503803;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+9EIQvXwR1BUlJrkHaVXEOvBqRuG5Rt3i8peNVwWDA=;
        b=hQ2z//Bs6pWQhzRwbZvfL6s8ZjyAKJRZOUzTINehDzz00eGeznxBrsQ6R7Zl0gw/Tb
         bu6pNeMxwv1f0UnFTZ91nlk3dZqmSIIbyf0tsjgwTeuwVpeNdoJBtGWEKKJ01OCBCzn9
         4qGlFJSTfXio9FZrwGSpl4OC6kf22zLlYxs2gBi71axmI77/XhuhDS7jCjS5/pHz4EzD
         aAo9PlBYia7AgTQLxFIak/Lg08aW6H64A7/fIMu6YEO/LGeqHkbk/dpL8Sn4nqInH9Ho
         7n4gcxEzP1LnHaKaGpMjbE6YZZwNK8wQLsQuSkIbxf+MG7CgWGx8JGAU/Xt1xHwx6KC9
         83sw==
X-Gm-Message-State: AOJu0Yz0XUOoh55dfE5Cvogtiop+cvTEPJtIUpAWWTrunc9TSY/ocM2p
	ZH3pQUg8wMypYsBB+cZkh4iF0VZ+qENFTq7CAB4SE6fRRYz2D3vLVNyUMBXVG/8f8x8+DZp03JN
	fUKlcJPHZV9Bf/O/f9YMbxVe59FoHNFo=
X-Gm-Gg: AeBDieuAqefENDUEzpCWiM5n9e2ntRxP4QfkOAeZGj8j22vkjj5QKHqyuoxIjHBOuvO
	BIxQFboUd6iVgocBi8OZ7+48ANpJtutfFsL787VZ3bqUx7e349rWuni0UVaQoV0nEoKhjDzx8tr
	TAExXv32rpuucvC7V94cBDj9n4VRVtcDSwJHmRBXclRhiHD+SXOdItiBKmNrGsiIDpeVa4sX9CK
	SprP+yJThxEXrFI5tRgHG5U9T8HEBIjKfnaHeI8ywTmoYJK5tVq4Vvucis/lnlFalukQUUv7Yug
	PJvm17TgaeVr4EAdFO8LXRb8Y5ubeFhr2aUkrCq9p/93sXT2CchaC2zfcxjZR5SqYQXZHd7luCh
	c3yWYNzSluKQ91Sik2gb0s0Ns5cxVFasV7Sqs/P6wJeUFLD3Y2ivJ4E5mbhKiukG7Dc25RJmPSi
	rpnn8R+KHV1jLASW1kltf7N1stwA==
X-Received: by 2002:a05:690e:b44:b0:654:63e0:d1e0 with SMTP id
 956f58d0204a3-65463e0ee66mr2226275d50.44.1776899002509; Wed, 22 Apr 2026
 16:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260422220922.1697938-1-philip@balister.org>
In-Reply-To: <20260422220922.1697938-1-philip@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Apr 2026 16:02:54 -0700
X-Gm-Features: AQROBzARhhtBMv_c0A9x6_4gmMsIlqfgLujc_e69obW1nIOXB0g3V5uRK3Y9nVw
Message-ID: <CAMKF1soior63k94mKMVKzw8pHwwEwCozJw1rPNJDE_A-DjPnvA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] fftw_3.3.11.bb: Update version.
To: philip@balister.org
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d8ae27065014897d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 23:03:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126560

--000000000000d8ae27065014897d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 3:09=E2=80=AFPM Philip Balister via lists.openembed=
ded.org
<philip=3Dbalister.org@lists.openembedded.org> wrote:

> Apr 21st, 2026
> New API fftw_copy_plan()
> Support for SVE SIMD instructions.
> Support for LoongArch LSX and LASX SIMD instructions.
> Support for Apple ARM, RISCV, and LoongArch cycle counters.
>
> The patch is needed to remove build system paths creeping in
> via the compiler define. Enabling the cycle counters needs a
> kernel module to permit access from user space. We need to add
> SVE (and other architectures) support to the recipe.
>
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  ...ove-the-CC-and-CFLAGS-from-the-build.patch | 31 +++++++++++++++++++
>  .../fftw/{fftw_3.3.10.bb =3D> fftw_3.3.11.bb}   |  3 +-
>  2 files changed, 33 insertions(+), 1 deletion(-)
>  create mode 100644
> meta-oe/recipes-support/fftw/fftw/0001-Remove-the-CC-and-CFLAGS-from-the-=
build.patch
>  rename meta-oe/recipes-support/fftw/{fftw_3.3.10.bb =3D> fftw_3.3.11.bb}
> (95%)
>
> diff --git
> a/meta-oe/recipes-support/fftw/fftw/0001-Remove-the-CC-and-CFLAGS-from-th=
e-build.patch
> b/meta-oe/recipes-support/fftw/fftw/0001-Remove-the-CC-and-CFLAGS-from-th=
e-build.patch
> new file mode 100644
> index 0000000000..5b52377940
> --- /dev/null
> +++
> b/meta-oe/recipes-support/fftw/fftw/0001-Remove-the-CC-and-CFLAGS-from-th=
e-build.patch
> @@ -0,0 +1,31 @@
> +From f65d89c082fa4b886f9f5aaa08f4defd5fd0e207 Mon Sep 17 00:00:00 2001
> +From: Philip Balister <philip@balister.org>
> +Date: Wed, 22 Apr 2026 16:52:47 -0400
> +Subject: [PATCH] Remove the CC and CFLAGS from the build.
> +
> +With 3.3.11, this started injecting build system paths into binaries.
> +
> +Upstream-Status: Inappropriate [I didn't try hard enough to figure out
> what changed]
>

ugh, can you try doing something like below instead of this patch.

diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.11.bb
b/meta-oe/recipes-support/fftw/fftw_3.3.11.bb
index dd6dce206b..e33d12af10 100644
--- a/meta-oe/recipes-support/fftw/fftw_3.3.11.bb
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.11.bb
@@ -58,7 +57,7 @@ do_configure() {
 do_compile() {
     for lib in fftw fftwl fftwf; do
         cd ${WORKDIR}/build-$lib
-        test -n "${TOOLCHAIN_OPTIONS}" && sed -i -e
's|${TOOLCHAIN_OPTIONS}||g' config.h
+        sed -i -e 's|${DEBUG_PREFIX_MAP}||g;
s|--sysroot=3D${STAGING_DIR_TARGET}||g' config.h
         autotools_do_compile
     done
 }


> +
> +Signed-off-by: Philip Balister <philip@balister.org>
> +
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 616cdcc4..bd7edbf2 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -793,7 +793,7 @@ fi
> +
> + dnl
> -----------------------------------------------------------------------
> +
> +-AC_DEFINE_UNQUOTED(FFTW_CC, "$CC $CFLAGS", [C compiler name and flags])
> ++AC_DEFINE_UNQUOTED(FFTW_CC, "", [C compiler name and flags])
> +
> + AC_CONFIG_FILES([
> +    Makefile
> +--
> +2.53.0
> +
> diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
> b/meta-oe/recipes-support/fftw/fftw_3.3.11.bb
> similarity index 95%
> rename from meta-oe/recipes-support/fftw/fftw_3.3.10.bb
> rename to meta-oe/recipes-support/fftw/fftw_3.3.11.bb
> index 52122b9c0c..dd6dce206b 100644
> --- a/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
> +++ b/meta-oe/recipes-support/fftw/fftw_3.3.11.bb
> @@ -6,10 +6,11 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552"
>  SRC_URI =3D " \
>      http://www.fftw.org/fftw-${PV}.tar.gz \
>      file://0001-NEON-autodetection-segfaults-assume-neon-present.patch \
> +    file://0001-Remove-the-CC-and-CFLAGS-from-the-build.patch \
>      file://install-bench.patch \
>      file://run-ptest \
>  "
> -SRC_URI[sha256sum] =3D
> "56c932549852cddcfafdab3820b0200c7742675be92179e59e6215b340e26467"
> +SRC_URI[sha256sum] =3D
> "5630c24cdeb33b131612f7eb4b1a9934234754f9f388ff8617458d0be6f239a1"
>
>  UPSTREAM_CHECK_URI =3D "http://www.fftw.org/download.html"
>
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126559):
> https://lists.openembedded.org/g/openembedded-devel/message/126559
> Mute This Topic: https://lists.openembedded.org/mt/118963268/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d8ae27065014897d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 22,=
 2026 at 3:09=E2=80=AFPM Philip Balister via <a href=3D"http://lists.openem=
bedded.org">lists.openembedded.org</a> &lt;philip=3D<a href=3D"mailto:balis=
ter.org@lists.openembedded.org">balister.org@lists.openembedded.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Apr 21st=
, 2026<br>
New API fftw_copy_plan()<br>
Support for SVE SIMD instructions.<br>
Support for LoongArch LSX and LASX SIMD instructions.<br>
Support for Apple ARM, RISCV, and LoongArch cycle counters.<br>
<br>
The patch is needed to remove build system paths creeping in<br>
via the compiler define. Enabling the cycle counters needs a<br>
kernel module to permit access from user space. We need to add<br>
SVE (and other architectures) support to the recipe.<br>
<br>
Signed-off-by: Philip Balister &lt;<a href=3D"mailto:philip@balister.org" t=
arget=3D"_blank">philip@balister.org</a>&gt;<br>
---<br>
=C2=A0...ove-the-CC-and-CFLAGS-from-the-build.patch | 31 ++++++++++++++++++=
+<br>
=C2=A0.../fftw/{<a href=3D"http://fftw_3.3.10.bb" rel=3D"noreferrer" target=
=3D"_blank">fftw_3.3.10.bb</a> =3D&gt; <a href=3D"http://fftw_3.3.11.bb" re=
l=3D"noreferrer" target=3D"_blank">fftw_3.3.11.bb</a>}=C2=A0 =C2=A0|=C2=A0 =
3 +-<br>
=C2=A02 files changed, 33 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/fftw/fftw/0001-Remove-the-=
CC-and-CFLAGS-from-the-build.patch<br>
=C2=A0rename meta-oe/recipes-support/fftw/{<a href=3D"http://fftw_3.3.10.bb=
" rel=3D"noreferrer" target=3D"_blank">fftw_3.3.10.bb</a> =3D&gt; <a href=
=3D"http://fftw_3.3.11.bb" rel=3D"noreferrer" target=3D"_blank">fftw_3.3.11=
.bb</a>} (95%)<br>
<br>
diff --git a/meta-oe/recipes-support/fftw/fftw/0001-Remove-the-CC-and-CFLAG=
S-from-the-build.patch b/meta-oe/recipes-support/fftw/fftw/0001-Remove-the-=
CC-and-CFLAGS-from-the-build.patch<br>
new file mode 100644<br>
index 0000000000..5b52377940<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/fftw/fftw/0001-Remove-the-CC-and-CFLAGS-from-=
the-build.patch<br>
@@ -0,0 +1,31 @@<br>
+From f65d89c082fa4b886f9f5aaa08f4defd5fd0e207 Mon Sep 17 00:00:00 2001<br>
+From: Philip Balister &lt;<a href=3D"mailto:philip@balister.org" target=3D=
"_blank">philip@balister.org</a>&gt;<br>
+Date: Wed, 22 Apr 2026 16:52:47 -0400<br>
+Subject: [PATCH] Remove the CC and CFLAGS from the build.<br>
+<br>
+With 3.3.11, this started injecting build system paths into binaries.<br>
+<br>
+Upstream-Status: Inappropriate [I didn&#39;t try hard enough to figure out=
 what changed]<br></blockquote><div><br></div><div>ugh, can you try doing s=
omething like below instead of this patch.</div><div><br></div><div>diff --=
git a/meta-oe/recipes-support/fftw/<a href=3D"http://fftw_3.3.11.bb">fftw_3=
.3.11.bb</a> b/meta-oe/recipes-support/fftw/<a href=3D"http://fftw_3.3.11.b=
b">fftw_3.3.11.bb</a><br>index dd6dce206b..e33d12af10 100644<br>--- a/meta-=
oe/recipes-support/fftw/<a href=3D"http://fftw_3.3.11.bb">fftw_3.3.11.bb</a=
><br>+++ b/meta-oe/recipes-support/fftw/<a href=3D"http://fftw_3.3.11.bb">f=
ftw_3.3.11.bb</a><br>@@ -58,7 +57,7 @@ do_configure() {<br>=C2=A0do_compile=
() {<br>=C2=A0 =C2=A0 =C2=A0for lib in fftw fftwl fftwf; do<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0cd ${WORKDIR}/build-$lib<br>- =C2=A0 =C2=A0 =C2=A0 =
=C2=A0test -n &quot;${TOOLCHAIN_OPTIONS}&quot; &amp;&amp; sed -i -e &#39;s|=
${TOOLCHAIN_OPTIONS}||g&#39; config.h<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -=
i -e &#39;s|${DEBUG_PREFIX_MAP}||g; s|--sysroot=3D${STAGING_DIR_TARGET}||g&=
#39; config.h<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0autotools_do_compile<br>=
=C2=A0 =C2=A0 =C2=A0done<br>=C2=A0}<br></div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
+<br>
+Signed-off-by: Philip Balister &lt;<a href=3D"mailto:philip@balister.org" =
target=3D"_blank">philip@balister.org</a>&gt;<br>
+<br>
+---<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
+index 616cdcc4..bd7edbf2 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
+@@ -793,7 +793,7 @@ fi<br>
+ <br>
+ dnl ---------------------------------------------------------------------=
--<br>
+ <br>
+-AC_DEFINE_UNQUOTED(FFTW_CC, &quot;$CC $CFLAGS&quot;, [C compiler name and=
 flags])<br>
++AC_DEFINE_UNQUOTED(FFTW_CC, &quot;&quot;, [C compiler name and flags])<br=
>
+ <br>
+ AC_CONFIG_FILES([<br>
+=C2=A0 =C2=A0 Makefile<br>
+-- <br>
+2.53.0<br>
+<br>
diff --git a/meta-oe/recipes-support/fftw/<a href=3D"http://fftw_3.3.10.bb"=
 rel=3D"noreferrer" target=3D"_blank">fftw_3.3.10.bb</a> b/meta-oe/recipes-=
support/fftw/<a href=3D"http://fftw_3.3.11.bb" rel=3D"noreferrer" target=3D=
"_blank">fftw_3.3.11.bb</a><br>
similarity index 95%<br>
rename from meta-oe/recipes-support/fftw/<a href=3D"http://fftw_3.3.10.bb" =
rel=3D"noreferrer" target=3D"_blank">fftw_3.3.10.bb</a><br>
rename to meta-oe/recipes-support/fftw/<a href=3D"http://fftw_3.3.11.bb" re=
l=3D"noreferrer" target=3D"_blank">fftw_3.3.11.bb</a><br>
index 52122b9c0c..dd6dce206b 100644<br>
--- a/meta-oe/recipes-support/fftw/<a href=3D"http://fftw_3.3.10.bb" rel=3D=
"noreferrer" target=3D"_blank">fftw_3.3.10.bb</a><br>
+++ b/meta-oe/recipes-support/fftw/<a href=3D"http://fftw_3.3.11.bb" rel=3D=
"noreferrer" target=3D"_blank">fftw_3.3.11.bb</a><br>
@@ -6,10 +6,11 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D59530bdf3=
3659b29e73d4adb9f9f6552&quot;<br>
=C2=A0SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0<a href=3D"http://www.fftw.org/fftw-$%7BPV%7D.tar.gz" r=
el=3D"noreferrer" target=3D"_blank">http://www.fftw.org/fftw-${PV}.tar.gz</=
a> \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-NEON-autodetection-segfaults-assume-neon-pr=
esent.patch \<br>
+=C2=A0 =C2=A0 file://0001-Remove-the-CC-and-CFLAGS-from-the-build.patch \<=
br>
=C2=A0 =C2=A0 =C2=A0file://install-bench.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
=C2=A0&quot;<br>
-SRC_URI[sha256sum] =3D &quot;56c932549852cddcfafdab3820b0200c7742675be9217=
9e59e6215b340e26467&quot;<br>
+SRC_URI[sha256sum] =3D &quot;5630c24cdeb33b131612f7eb4b1a9934234754f9f388f=
f8617458d0be6f239a1&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"http://www.fftw.org/download.=
html" rel=3D"noreferrer" target=3D"_blank">http://www.fftw.org/download.htm=
l</a>&quot;<br>
<br>
-- <br>
2.53.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#126559): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/126559" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/126559</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118963268/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118963268/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000d8ae27065014897d--

