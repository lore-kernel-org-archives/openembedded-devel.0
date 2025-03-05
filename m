Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3448AC19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 14:28:54 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.14319.1741184927214931074
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Mar 2025 06:28:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=VgA4yZEP;
 spf=pass (domain: snapchat.com, ip: 209.85.218.45, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac202264f9cso270828566b.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 06:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1741184925; x=1741789725; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=56+zbIq8ujHN51K4WlvfMH727ZpM88rNKOFo74LL2WI=;
        b=VgA4yZEPrDdg30QiMVlctTxUe7mIvLW9BqTYMf4zm7kAuLtJSiU3CbttvnabAsEkvJ
         LpfIpeM/NGzFyrLiIesaTQxcupOmjRPzoWQKW+e/xMeC7EZxBk7xSZqWqzUWGK9uKhnU
         m1qCigfbJXx4Dlu5Mz/ay6ucseD+hzrFvS2Ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741184925; x=1741789725;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=56+zbIq8ujHN51K4WlvfMH727ZpM88rNKOFo74LL2WI=;
        b=EXEEMfQgGXTlwNLQ4VPOME4j74B5BWznM7/91PB0wvvDjsfWekCMH5rSwnPFWyDeBb
         95nf88wBriFUFKC1TfXVgBT5lT09qNIEu0pao6NHlqvi6pqQzrqufMx048OPtvxuvFOV
         63ijTaCO2FxR/vnqcGwfhoGOMyBGD8jEvDAhIAWd1nuYQuxrWlqAV+1Swx1i+nhf/ZkI
         VxJ5+ZmLWmx9RIvP/Sut6xnzME9YPjalH/Nlaf9HgyLwH2kCrSDi5SVuA9/xDiEDO7tW
         w23oznKxWssh5z/u6w/XcatsE3H8m8KpCYMvG8aLDwzj3Uj+d4+kR3czr6I8mnpKaCw1
         Uzbg==
X-Gm-Message-State: AOJu0YxQRU6M7NasF0XyCOg3F2bmN1rywqTPUZm4a35TOUM3J7g47WhB
	9nlRy7i0gVZTQcKqHLjy9TVTxLdlnL5lAVrYmS8Iuhdwo665DCneFyH7wizdedZQ14NK2fnDVY3
	1ihG6M175kwnqHmce5nFbhvKIukbsw/ciaioTzw==
X-Gm-Gg: ASbGnctdpuFbe53FjH0VU3ijtp0rW2PcZxGkm9XDFr4TsNV2JundoABXqOKkZwPfBcD
	xvHk25rVyDY8MdGKHSZbjYikf1INrxQmY8rwk467hygjSySxfXIb0voZnZaQufKjLOPZSxzjH1p
	dAoYd486ZLrpMubpoC3xRtyl15Ug==
X-Google-Smtp-Source: AGHT+IHapM63CuzVxJrjRc0looOHAWRBzvUWrDCM0CoGefVc4vviq1cN5mhbZalTQb80zB6/vboLv+BmFAV79Ouh8S8=
X-Received: by 2002:a17:907:7e8f:b0:ac1:e14a:19d6 with SMTP id
 a640c23a62f3a-ac20d330704mr320449766b.0.1741184925302; Wed, 05 Mar 2025
 06:28:45 -0800 (PST)
MIME-Version: 1.0
References: <20250305105253.3545398-1-martin.jansa@gmail.com>
In-Reply-To: <20250305105253.3545398-1-martin.jansa@gmail.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Wed, 5 Mar 2025 15:28:32 +0100
X-Gm-Features: AQ5f1JoXry4P34oaLlMRKu6VJIBqxS3wRK6UOCFBiZkfg8xKrLtqCQnse0Em3LE
Message-ID: <CAHUKmYYEF972DY5sKtG3iUOQPB9Y9YNTHJicMF_xOVP0j4F4rQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] uutils-coreutils: use correct variables
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f6305d062f993477"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 14:28:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115756

--000000000000f6305d062f993477
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Martin,
regarding SELINUX_INCLUDE_DIR, it was definitely needed as I implemented
the recipe. During implementation I submitted this patch to selinux-sys (
https://github.com/koutheir/selinux-sys/commit/a6667c404ecc33266f66e9516bb8=
e30150c41ec2
) to correctly use this variable, and was getting a build error without
this fix because the rust crate selinux-sys was not finding the selinux
header-file (specifically, the bindgen tool).

However, this was in 2022, and since then there has been this patch in
selinux-sys:
https://github.com/koutheir/selinux-sys/commit/d3ea4674e18c5240918348bea4ec=
6248e50516e5
, and it seems that the variable is not needed any more.
At least I'm not able to reproduce the build error which I was getting,
even with commenting out SELINUX_LIB_DIR and SELINUX_INCLUDE_DIR.

The header-file is used for generating rust code from the C header-file
using bindgen, so I don't think it makes a difference whether the native
version or the target version is used.

This is the old build error I was getting:
  process didn't exit successfully:
`/workdir/build/tmp-glibc/work/armv8a-linux/uutils-coreutils/0.0.14.AUTOINC=
+43a5b8c7d7-r0/build/target/release/build/selinux-sys-0849198bc1fef4a4/buil=
d-script-build`
(exit status: 101)
  --- stdout

cargo:root=3D/workdir/build/tmp-glibc/work/armv8a-linux/uutils-coreutils/0.=
0.14.AUTOINC+43a5b8c7d7-r0/build/target/aarch64-snap-linux/release/build/se=
linux-sys-d96748d49908959f/out
  cargo:rerun-if-env-changed=3DSELINUX_STATIC_aarch64-snap-linux
  cargo:rerun-if-env-changed=3DSELINUX_STATIC_aarch64_snap_linux
  cargo:rerun-if-env-changed=3DTARGET_SELINUX_STATIC

|   --- stderr
|   src/selinux-sys.h:1:10: fatal error: 'selinux/selinux.h' file not found
|   src/selinux-sys.h:1:10: fatal error: 'selinux/selinux.h' file not
found, err: true

=C3=89tienne


On Wed, Mar 5, 2025 at 11:53=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:

> * use STAGING_LIBDIR_NATIVE variable for LIBCLANG_PATH and SELINUX_LIB_DI=
R
>   and STAGING_INCDIR_NATIVE variable for SELINUX_INCLUDE_DIR
>   not sure why it uses native version and not target, but at least use
>   correct variable
>
> * hardcoding:
>   ${WORKDIR}/recipe-sysroot-native${libdir}
>   is just wrong when there is a better variable
>
> * This path won't be correct for multilib builds where target ${libdir}
>   might be e.g. /usr/lib32 while native libdir is /usr/lib.
>
> * even with meta-selinux added to my builds I don't see any failure
>   maybe these variables aren't really used?
>
> * use STAGING_LIBDIR_NATIVE variable which uses correct ${libdir_native}
>
> OE qemuarm64-multilib@ /OE/build/oe-core $ bitbake-getvar LIBCLANG_PATH
> -r uutils-coreutils
>   #
>   # $LIBCLANG_PATH [2 operations]
>   #   exported
> /OE/build/oe-core/meta-openembedded/meta-oe/recipes-core/uutils-coreutils=
/
> uutils-coreutils_0.0.29.bb:33
>   #     [export] "1"
>   #   set
> /OE/build/oe-core/meta-openembedded/meta-oe/recipes-core/uutils-coreutils=
/
> uutils-coreutils_0.0.29.bb:33
>   #     "${WORKDIR}/recipe-sysroot-native${libdir}"
>   # pre-expansion value:
>   #   "${WORKDIR}/recipe-sysroot-native${libdir}"
> export
> LIBCLANG_PATH=3D"/OE/build/oe-core/tmp/work/cortexa57-oe-linux/uutils-cor=
eutils/0.0.29/recipe-sysroot-native/usr/lib64"
>
> OE qemuarm64-multilib@ /OE/build/oe-core $ bitbake-getvar
> STAGING_LIBDIR_NATIVE -r uutils-coreutils
>   #
>   # $STAGING_LIBDIR_NATIVE
>   #   set /OE/build/oe-core/openembedded-core/meta/conf/bitbake.conf:425
>   #     "${STAGING_DIR_NATIVE}${libdir_native}"
>
> STAGING_LIBDIR_NATIVE=3D"/OE/build/oe-core/tmp/work/cortexa57-oe-linux/uu=
tils-coreutils/0.0.29/recipe-sysroot-native/usr/lib"
>
> OE qemuarm64-multilib@ /OE/build/oe-core $ bitbake-getvar LIBCLANG_PATH
> -r lib32-uutils-coreutils
>   #
>   # $LIBCLANG_PATH [2 operations]
>   #   exported
> /OE/build/oe-core/meta-openembedded/meta-oe/recipes-core/uutils-coreutils=
/
> uutils-coreutils_0.0.29.bb:33
>   #     [export] "1"
>   #   set
> /OE/build/oe-core/meta-openembedded/meta-oe/recipes-core/uutils-coreutils=
/
> uutils-coreutils_0.0.29.bb:33
>   #     "${WORKDIR}/recipe-sysroot-native${libdir}"
>   # pre-expansion value:
>   #   "${WORKDIR}/recipe-sysroot-native${libdir}"
> export
> LIBCLANG_PATH=3D"/OE/build/oe-core/tmp/work/armv7at2-neon-oemllib32-linux=
-gnueabi/lib32-uutils-coreutils/0.0.29/recipe-sysroot-native/usr/lib32"
>
> OE qemuarm64-multilib@ /OE/build/oe-core $ bitbake-getvar
> STAGING_LIBDIR_NATIVE -r lib32-uutils-coreutils
>   #
>   # $STAGING_LIBDIR_NATIVE
>   #   set /OE/build/oe-core/openembedded-core/meta/conf/bitbake.conf:425
>   #     "${STAGING_DIR_NATIVE}${libdir_native}"
>
> STAGING_LIBDIR_NATIVE=3D"/OE/build/oe-core/tmp/work/armv7at2-neon-oemllib=
32-linux-gnueabi/lib32-uutils-coreutils/0.0.29/recipe-sysroot-native/usr/li=
b"
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  .../uutils-coreutils/uutils-coreutils_0.0.29.bb             | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-core/uutils-coreutils/
> uutils-coreutils_0.0.29.bb b/meta-oe/recipes-core/uutils-coreutils/
> uutils-coreutils_0.0.29.bb
> index 19d628f735..d0a7532984 100644
> --- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.29.bb
> +++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.29.bb
> @@ -30,9 +30,9 @@ CARGO_BUILD_FLAGS +=3D
> "${@bb.utils.contains('PACKAGECONFIG', 'selinux', '--featur
>
>  DEPENDS +=3D "${@bb.utils.contains('PACKAGECONFIG', 'selinux',
> 'clang-native libselinux-native', '', d)}"
>
> -export LIBCLANG_PATH =3D "${WORKDIR}/recipe-sysroot-native${libdir}"
> -export SELINUX_LIB_DIR =3D "${WORKDIR}/recipe-sysroot-native${libdir}"
> -export SELINUX_INCLUDE_DIR =3D
> "${WORKDIR}/recipe-sysroot-native${includedir}"
> +export LIBCLANG_PATH =3D "${STAGING_LIBDIR_NATIVE}"
> +export SELINUX_LIB_DIR =3D "${STAGING_LIBDIR_NATIVE}"
> +export SELINUX_INCLUDE_DIR =3D "${STAGING_INCDIR_NATIVE}"
>
>  # The code which follows is strongly inspired from the GNU coreutils
> bitbake recipe:
>
> --
> 2.48.1
>
>

--000000000000f6305d062f993477
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Martin,<br>regarding SELINUX_INCLUDE_DIR, it was defini=
tely needed as I implemented the recipe. During implementation I submitted =
this patch to selinux-sys (=C2=A0<a href=3D"https://github.com/koutheir/sel=
inux-sys/commit/a6667c404ecc33266f66e9516bb8e30150c41ec2">https://github.co=
m/koutheir/selinux-sys/commit/a6667c404ecc33266f66e9516bb8e30150c41ec2</a> =
) to correctly use this variable, and was getting a build error without thi=
s fix because the rust crate selinux-sys was not finding the selinux header=
-file (specifically, the bindgen tool).<br><br>However, this was in 2022, a=
nd since then there has been this patch in selinux-sys:=C2=A0<a href=3D"htt=
ps://github.com/koutheir/selinux-sys/commit/d3ea4674e18c5240918348bea4ec624=
8e50516e5">https://github.com/koutheir/selinux-sys/commit/d3ea4674e18c52409=
18348bea4ec6248e50516e5</a> , and it seems that the variable is not needed =
any more.<br>At least I&#39;m not able to reproduce the build error which I=
 was getting, even with commenting out SELINUX_LIB_DIR and SELINUX_INCLUDE_=
DIR.<br><br>The header-file is used for generating rust code from the C hea=
der-file using bindgen, so I don&#39;t think it makes a difference whether =
the native version or the target version is used.<br><br>This is the old bu=
ild error I was getting:<br>=C2=A0 process didn&#39;t exit successfully: `/=
workdir/build/tmp-glibc/work/armv8a-linux/uutils-coreutils/0.0.14.AUTOINC+4=
3a5b8c7d7-r0/build/target/release/build/selinux-sys-0849198bc1fef4a4/build-=
script-build` (exit status: 101)<br>=C2=A0 --- stdout<br>=C2=A0 cargo:root=
=3D/workdir/build/tmp-glibc/work/armv8a-linux/uutils-coreutils/0.0.14.AUTOI=
NC+43a5b8c7d7-r0/build/target/aarch64-snap-linux/release/build/selinux-sys-=
d96748d49908959f/out<br>=C2=A0 cargo:rerun-if-env-changed=3DSELINUX_STATIC_=
aarch64-snap-linux<br>=C2=A0 cargo:rerun-if-env-changed=3DSELINUX_STATIC_aa=
rch64_snap_linux<br>=C2=A0 cargo:rerun-if-env-changed=3DTARGET_SELINUX_STAT=
IC<br>=C2=A0 <br>| =C2=A0 --- stderr<br>| =C2=A0 src/selinux-sys.h:1:10: fa=
tal error: &#39;selinux/selinux.h&#39; file not found<br>| =C2=A0 src/selin=
ux-sys.h:1:10: fatal error: &#39;selinux/selinux.h&#39; file not found, err=
: true=C2=A0<br><br>=C3=89tienne<br><br></div><br><div class=3D"gmail_quote=
 gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 5=
, 2025 at 11:53=E2=80=AFAM Martin Jansa &lt;<a href=3D"mailto:martin.jansa@=
gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">* use STAGING_LIBDIR_NATIVE variable for L=
IBCLANG_PATH and SELINUX_LIB_DIR<br>
=C2=A0 and STAGING_INCDIR_NATIVE variable for SELINUX_INCLUDE_DIR<br>
=C2=A0 not sure why it uses native version and not target, but at least use=
<br>
=C2=A0 correct variable<br>
<br>
* hardcoding:<br>
=C2=A0 ${WORKDIR}/recipe-sysroot-native${libdir}<br>
=C2=A0 is just wrong when there is a better variable<br>
<br>
* This path won&#39;t be correct for multilib builds where target ${libdir}=
<br>
=C2=A0 might be e.g. /usr/lib32 while native libdir is /usr/lib.<br>
<br>
* even with meta-selinux added to my builds I don&#39;t see any failure<br>
=C2=A0 maybe these variables aren&#39;t really used?<br>
<br>
* use STAGING_LIBDIR_NATIVE variable which uses correct ${libdir_native}<br=
>
<br>
OE qemuarm64-multilib@ /OE/build/oe-core $ bitbake-getvar LIBCLANG_PATH -r =
uutils-coreutils<br>
=C2=A0 #<br>
=C2=A0 # $LIBCLANG_PATH [2 operations]<br>
=C2=A0 #=C2=A0 =C2=A0exported /OE/build/oe-core/meta-openembedded/meta-oe/r=
ecipes-core/uutils-coreutils/<a href=3D"http://uutils-coreutils_0.0.29.bb:3=
3" rel=3D"noreferrer" target=3D"_blank">uutils-coreutils_0.0.29.bb:33</a><b=
r>
=C2=A0 #=C2=A0 =C2=A0 =C2=A0[export] &quot;1&quot;<br>
=C2=A0 #=C2=A0 =C2=A0set /OE/build/oe-core/meta-openembedded/meta-oe/recipe=
s-core/uutils-coreutils/<a href=3D"http://uutils-coreutils_0.0.29.bb:33" re=
l=3D"noreferrer" target=3D"_blank">uutils-coreutils_0.0.29.bb:33</a><br>
=C2=A0 #=C2=A0 =C2=A0 =C2=A0&quot;${WORKDIR}/recipe-sysroot-native${libdir}=
&quot;<br>
=C2=A0 # pre-expansion value:<br>
=C2=A0 #=C2=A0 =C2=A0&quot;${WORKDIR}/recipe-sysroot-native${libdir}&quot;<=
br>
export LIBCLANG_PATH=3D&quot;/OE/build/oe-core/tmp/work/cortexa57-oe-linux/=
uutils-coreutils/0.0.29/recipe-sysroot-native/usr/lib64&quot;<br>
<br>
OE qemuarm64-multilib@ /OE/build/oe-core $ bitbake-getvar STAGING_LIBDIR_NA=
TIVE -r uutils-coreutils<br>
=C2=A0 #<br>
=C2=A0 # $STAGING_LIBDIR_NATIVE<br>
=C2=A0 #=C2=A0 =C2=A0set /OE/build/oe-core/openembedded-core/meta/conf/bitb=
ake.conf:425<br>
=C2=A0 #=C2=A0 =C2=A0 =C2=A0&quot;${STAGING_DIR_NATIVE}${libdir_native}&quo=
t;<br>
STAGING_LIBDIR_NATIVE=3D&quot;/OE/build/oe-core/tmp/work/cortexa57-oe-linux=
/uutils-coreutils/0.0.29/recipe-sysroot-native/usr/lib&quot;<br>
<br>
OE qemuarm64-multilib@ /OE/build/oe-core $ bitbake-getvar LIBCLANG_PATH -r =
lib32-uutils-coreutils<br>
=C2=A0 #<br>
=C2=A0 # $LIBCLANG_PATH [2 operations]<br>
=C2=A0 #=C2=A0 =C2=A0exported /OE/build/oe-core/meta-openembedded/meta-oe/r=
ecipes-core/uutils-coreutils/<a href=3D"http://uutils-coreutils_0.0.29.bb:3=
3" rel=3D"noreferrer" target=3D"_blank">uutils-coreutils_0.0.29.bb:33</a><b=
r>
=C2=A0 #=C2=A0 =C2=A0 =C2=A0[export] &quot;1&quot;<br>
=C2=A0 #=C2=A0 =C2=A0set /OE/build/oe-core/meta-openembedded/meta-oe/recipe=
s-core/uutils-coreutils/<a href=3D"http://uutils-coreutils_0.0.29.bb:33" re=
l=3D"noreferrer" target=3D"_blank">uutils-coreutils_0.0.29.bb:33</a><br>
=C2=A0 #=C2=A0 =C2=A0 =C2=A0&quot;${WORKDIR}/recipe-sysroot-native${libdir}=
&quot;<br>
=C2=A0 # pre-expansion value:<br>
=C2=A0 #=C2=A0 =C2=A0&quot;${WORKDIR}/recipe-sysroot-native${libdir}&quot;<=
br>
export LIBCLANG_PATH=3D&quot;/OE/build/oe-core/tmp/work/armv7at2-neon-oemll=
ib32-linux-gnueabi/lib32-uutils-coreutils/0.0.29/recipe-sysroot-native/usr/=
lib32&quot;<br>
<br>
OE qemuarm64-multilib@ /OE/build/oe-core $ bitbake-getvar STAGING_LIBDIR_NA=
TIVE -r lib32-uutils-coreutils<br>
=C2=A0 #<br>
=C2=A0 # $STAGING_LIBDIR_NATIVE<br>
=C2=A0 #=C2=A0 =C2=A0set /OE/build/oe-core/openembedded-core/meta/conf/bitb=
ake.conf:425<br>
=C2=A0 #=C2=A0 =C2=A0 =C2=A0&quot;${STAGING_DIR_NATIVE}${libdir_native}&quo=
t;<br>
STAGING_LIBDIR_NATIVE=3D&quot;/OE/build/oe-core/tmp/work/armv7at2-neon-oeml=
lib32-linux-gnueabi/lib32-uutils-coreutils/0.0.29/recipe-sysroot-native/usr=
/lib&quot;<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" t=
arget=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../uutils-coreutils/<a href=3D"http://uutils-coreutils_0.0.29.bb" re=
l=3D"noreferrer" target=3D"_blank">uutils-coreutils_0.0.29.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-core/uutils-coreutils/<a href=3D"http://uutils=
-coreutils_0.0.29.bb" rel=3D"noreferrer" target=3D"_blank">uutils-coreutils=
_0.0.29.bb</a> b/meta-oe/recipes-core/uutils-coreutils/<a href=3D"http://uu=
tils-coreutils_0.0.29.bb" rel=3D"noreferrer" target=3D"_blank">uutils-coreu=
tils_0.0.29.bb</a><br>
index 19d628f735..d0a7532984 100644<br>
--- a/meta-oe/recipes-core/uutils-coreutils/<a href=3D"http://uutils-coreut=
ils_0.0.29.bb" rel=3D"noreferrer" target=3D"_blank">uutils-coreutils_0.0.29=
.bb</a><br>
+++ b/meta-oe/recipes-core/uutils-coreutils/<a href=3D"http://uutils-coreut=
ils_0.0.29.bb" rel=3D"noreferrer" target=3D"_blank">uutils-coreutils_0.0.29=
.bb</a><br>
@@ -30,9 +30,9 @@ CARGO_BUILD_FLAGS +=3D &quot;${@bb.utils.contains(&#39;PA=
CKAGECONFIG&#39;, &#39;selinux&#39;, &#39;--featur<br>
<br>
=C2=A0DEPENDS +=3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39=
;selinux&#39;, &#39;clang-native libselinux-native&#39;, &#39;&#39;, d)}&qu=
ot;<br>
<br>
-export LIBCLANG_PATH =3D &quot;${WORKDIR}/recipe-sysroot-native${libdir}&q=
uot;<br>
-export SELINUX_LIB_DIR =3D &quot;${WORKDIR}/recipe-sysroot-native${libdir}=
&quot;<br>
-export SELINUX_INCLUDE_DIR =3D &quot;${WORKDIR}/recipe-sysroot-native${inc=
ludedir}&quot;<br>
+export LIBCLANG_PATH =3D &quot;${STAGING_LIBDIR_NATIVE}&quot;<br>
+export SELINUX_LIB_DIR =3D &quot;${STAGING_LIBDIR_NATIVE}&quot;<br>
+export SELINUX_INCLUDE_DIR =3D &quot;${STAGING_INCDIR_NATIVE}&quot;<br>
<br>
=C2=A0# The code which follows is strongly inspired from the GNU coreutils =
bitbake recipe:<br>
<br>
-- <br>
2.48.1<br>
<br>
</blockquote></div>

--000000000000f6305d062f993477--

