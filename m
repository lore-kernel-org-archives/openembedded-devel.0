Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D40DC55184
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 23:52:11 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6194.1785801122009443136
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 16:52:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oA/FCEVK;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6611669cd16so5469104d50.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 16:52:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785801121; cv=none;
        d=google.com; s=arc-20260327;
        b=k5v2zrV6T9VI6vYWnJe8KylHIafCkz4ykM1cxTXOsb7Vpas1xVCUmhnJRpGPw3Pf4B
         A7/YxjaMsKBGNNdyJZBZeFtlqZCsTzK42FnwyEPgxc66dk0FHQJMExOSxNFGR38t6RTW
         orYHLCicnXR56Y1qsgymoIT5M8HyIF98U3mtgFOS6q3rZ9NXX5Uijfr8bJ0118LaGoYY
         f8c1l2OOZcALaV3sJY3vo2lv5r75iI7gUABRDN1YqP+kIlDJLJh8RoqFflq/ZG8eRgJB
         uG+NevTjGZLMoed/EWPhG5ezz2S3IWfYXwVhsOmy8WLDeEuHxA2hKFFVbWZae6KKVAfA
         gU1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MsAqgDSnIKfter7U28x4+sU0pSLKNCMPSX0owmrXxNQ=;
        fh=zZ9YUynVN9G273RPAJouLFE6ZT8DhYeil1e0fR2zEQY=;
        b=jb2cNCtkDeQMbkFRy3F2O/tIHuiNa4ijvbURa6RtpZPQG3rEpp3cPhN59O/lJf2l00
         bLAQlaMsmbdaaMR+V8U8yfMd16NIzcU3W2gPe/gMdq+xkeHXKQ42o8sLnSyuyg8hz0zd
         QmIg3JSIZB3WibqGiWy9bnE4Inlttn6sx2xAsoh+Ic1MDlvfaTUGVL8ZhNC/9VEo/c1C
         ScqSrB5kqWSyZ1gJ2G//e849xTNDEO9f399bRvTFxFB4sOibeDa1Xa/VPXOrkKvGCNam
         bK7a2VorQK3+BIKr1SMfCi4r3Q3dY7mHIu97RlGP5M6qoH2n5jd3tm+JqkCJilHs3C3o
         i7nQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785801121; x=1786405921; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MsAqgDSnIKfter7U28x4+sU0pSLKNCMPSX0owmrXxNQ=;
        b=oA/FCEVK32Mq2toWq06vtycFY798pt6gS39S2kxJWwOF/Auz1rZd9wTG8hFpre3ExX
         xbYHuRyEe0fc1QaPXLe7PyNBqbYQ0w/VY7WCVGaR7MLg2x7d/KgZLpxA2vGKhtLCQ4AY
         MsvB0krOhecA1OTMQAizMhQZTOb1mbBNm9/Hg7P+/oPaNggcV/vCLSda/Dktud0aBawM
         Qo4RsGVsFPavEweexha1w+uz8i8IkvxlDZs3+YX5OBBPPPjwEn65qs4osAV1Kj9cAZ2M
         u1XcoQ+Znu7ozquEDlEbYsFRtTHS2eiRmda2z4PN3Phdpwgu7fqueELuEJ7dB+Irm6C+
         gR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785801121; x=1786405921;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MsAqgDSnIKfter7U28x4+sU0pSLKNCMPSX0owmrXxNQ=;
        b=dlNI24VrX7zW03jT9mE0rUTPuH6uLxsyeZ4vS8hW9aIFROTI97NWYgVRyIY9tRIviH
         mjACkobTl/7bqJsr+hrh0IISdaPT0HVqX9uIWhj12j4se3JD/sMzH2wEnjc8gpnto+8n
         +zLMY61wY4FNIOyX99iC48BG70rISTjirR3HWEMVNfYjtfhHN9OP+NvR18OyT5iZ1Q9D
         SqIdCDCQIypQ0GXNqx4o/vKCtnFM/o4QFdaFiX4gKT5PNzIuUg1CX/oZvNjpNkB0fDcq
         q0BxA3Ohg47zRr3c+cLaYyZEVb0yCzi9K4hwdELElR9kEBuuqFv67yHyH4626C5fAhQZ
         tzUw==
X-Gm-Message-State: AOJu0YwTAL5UbkJ7c+7kszwq2NHtdIHLpa0fH87w2dcLOYv4vuJ3+cFh
	OJzCaSSYeHzkcdmWrGcppAQkmT9HHBel4dp/VauUGhOiHINz9Ipx+z/7EVIBCs/EW2m++9ZM/Qb
	s3WeWteZU31qUfYFtYU7PA+T8W1a1BnPy+0Iurxs=
X-Gm-Gg: AR+sD119do3aoSugrnxUANg7q5mrvMGkGK7lmCd89262VDwbzTletN3Ij9ATfj+Vxz8
	BHfCaFiiFIDpEaaU+DgWlidUY36gBx30FLwaX9ByRIDVLOy5oyHHUUjTvPYpwJyiE0qf5Usjeav
	8VxdSV+Y56Hj/jrF0uPN3WSnzlAiiLpGXWwoxMswTp0TpC9ij9BYhbsBRO0Wri4z6w4pioY0IdQ
	/PQ7LDSvYPLrBREgQVJQez8xPGqnCEvCTZ6NSs4cQG/a0bBZJz3/1AGK+uL3SANVT61T1iAhXEg
	dTkwo1InBIzXXOuK5VvYuqn5BCDpiAhbMAZTckPvpZPe0SyeuBTLwDbaTOJtg3QOGF/1Xk/yxPp
	Wo8bYXpoHgvp3BN81VkGsVOy9OkyXbkjkZnwdShscaRglPAx5wxY4B+fa7d61SS1i880hH2+PRM
	jAgGCI8o/TgMZfsfVHjGxZjXPXowM+nu7/BoYgD1rsv/RaxgCWBjhNiAI=
X-Received: by 2002:a05:690e:4093:b0:660:4936:95d5 with SMTP id
 956f58d0204a3-6696043b46fmr10684221d50.40.1785801120929; Mon, 03 Aug 2026
 16:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260803171813.318922-1-rouven.rastetter.ext@karlstorz.com>
In-Reply-To: <20260803171813.318922-1-rouven.rastetter.ext@karlstorz.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Aug 2026 16:51:34 -0700
X-Gm-Features: AUfX_mxAE9RjIh8ze62_r0C3lDKdCJX1Ihsyo5dJKfV4_puWg7JOHgpQqiEHFk4
Message-ID: <CAMKF1sqR1+U6Afm7DWYSB1CEbxVAFhTrR2zOVN6WLGgooOe8Xg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] vboxguestdrivers: Provide target kernel version
To: rouven.rastetter.ext@karlstorz.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000073dc3506582d398b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 23:52:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128697

--00000000000073dc3506582d398b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 10:19=E2=80=AFAM Rouven Rastetter via lists.openembe=
dded.org
<rouven.rastetter.ext=3Dkarlstorz.com@lists.openembedded.org> wrote:

> The Makefile uses `uname` to determine the kernel version. We must
> override this with the actual target kernel version.
>
> The kernel version might be empty during parsing (e.g. when using
> linux-dummy), therefore `or ''` is needed.
> ---
>  .../vboxguestdrivers/vboxguestdrivers_7.2.14.bb               | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_7.2.14.bb b/meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_7.2.14.bb
> index 18fda0393d..6a870c267c 100644
> --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.14.bb
> +++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.14.bb
> @@ -14,7 +14,7 @@ DEPENDS =3D "virtual/kernel"
>  # compiler-runtime deps needed to compile and link the userspace utility=
.
>  DEPENDS +=3D "virtual/compilerlibs virtual/libc"
>
> -inherit module kernel-module-split
> +inherit linux-kernel-base module kernel-module-split
>

linux-kernel-base is deprecated in oe-core/master now. I would suggest to
use the new ways of using it via oe.kernel.get_version_file


>
>  COMPATIBLE_MACHINE =3D "(qemux86|qemux86-64|qemuarm64)"
>
> @@ -32,7 +32,7 @@ S:task-patch =3D "${UNPACKDIR}/${BP}"
>  export VBOX_KBUILD_TARGET_ARCH =3D "${ARCH}"
>  export VBOX_KBUILD_TARGET_ARCH:x86-64 =3D "amd64"
>
> -EXTRA_OEMAKE +=3D "KERN_DIR=3D'${WORKDIR}/${KERNEL_VERSION}/build'
> KBUILD_VERBOSE=3D1 CC=3D'${CC} ${DEBUG_PREFIX_MAP}
> -ffile-prefix-map=3D${STAGING_KERNEL_DIR}=3D${KERNEL_SRC_PATH}
> -ffile-prefix-map=3D${STAGING_KERNEL_BUILDDIR}=3D${KERNEL_SRC_PATH}'"
> +EXTRA_OEMAKE +=3D "KERN_DIR=3D'${WORKDIR}/${KERNEL_VERSION}/build'
> KERN_MAJ=3D'${@(get_kernelversion_file('${STAGING_KERNEL_BUILDDIR}') or
> '').split('.')[0]}' KBUILD_VERBOSE=3D1 CC=3D'${CC} ${DEBUG_PREFIX_MAP}
> -ffile-prefix-map=3D${STAGING_KERNEL_DIR}=3D${KERNEL_SRC_PATH}
> -ffile-prefix-map=3D${STAGING_KERNEL_BUILDDIR}=3D${KERNEL_SRC_PATH}'"
>
>  # otherwise 5.2.22 builds just vboxguest
>  MAKE_TARGETS =3D "all"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128696):
> https://lists.openembedded.org/g/openembedded-devel/message/128696
> Mute This Topic: https://lists.openembedded.org/mt/120580604/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000073dc3506582d398b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 3, =
2026 at 10:19=E2=80=AFAM Rouven Rastetter via <a href=3D"http://lists.opene=
mbedded.org">lists.openembedded.org</a> &lt;rouven.rastetter.ext=3D<a href=
=3D"mailto:karlstorz.com@lists.openembedded.org">karlstorz.com@lists.openem=
bedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">The Makefile uses `uname` to determine the kernel version. We mu=
st<br>
override this with the actual target kernel version.<br>
<br>
The kernel version might be empty during parsing (e.g. when using<br>
linux-dummy), therefore `or &#39;&#39;` is needed.<br>
---<br>
=C2=A0.../vboxguestdrivers/<a href=3D"http://vboxguestdrivers_7.2.14.bb" re=
l=3D"noreferrer" target=3D"_blank">vboxguestdrivers_7.2.14.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"http://vbo=
xguestdrivers_7.2.14.bb" rel=3D"noreferrer" target=3D"_blank">vboxguestdriv=
ers_7.2.14.bb</a> b/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"htt=
p://vboxguestdrivers_7.2.14.bb" rel=3D"noreferrer" target=3D"_blank">vboxgu=
estdrivers_7.2.14.bb</a><br>
index 18fda0393d..6a870c267c 100644<br>
--- a/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"http://vboxguestd=
rivers_7.2.14.bb" rel=3D"noreferrer" target=3D"_blank">vboxguestdrivers_7.2=
.14.bb</a><br>
+++ b/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"http://vboxguestd=
rivers_7.2.14.bb" rel=3D"noreferrer" target=3D"_blank">vboxguestdrivers_7.2=
.14.bb</a><br>
@@ -14,7 +14,7 @@ DEPENDS =3D &quot;virtual/kernel&quot;<br>
=C2=A0# compiler-runtime deps needed to compile and link the userspace util=
ity.<br>
=C2=A0DEPENDS +=3D &quot;virtual/compilerlibs virtual/libc&quot;<br>
<br>
-inherit module kernel-module-split<br>
+inherit linux-kernel-base module kernel-module-split<br></blockquote><div>=
<br></div><div>linux-kernel-base is deprecated in oe-core/master now. I wou=
ld suggest to use the new ways of using it via=C2=A0oe.kernel.get_version_f=
ile</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
=C2=A0COMPATIBLE_MACHINE =3D &quot;(qemux86|qemux86-64|qemuarm64)&quot;<br>
<br>
@@ -32,7 +32,7 @@ S:task-patch =3D &quot;${UNPACKDIR}/${BP}&quot;<br>
=C2=A0export VBOX_KBUILD_TARGET_ARCH =3D &quot;${ARCH}&quot;<br>
=C2=A0export VBOX_KBUILD_TARGET_ARCH:x86-64 =3D &quot;amd64&quot;<br>
<br>
-EXTRA_OEMAKE +=3D &quot;KERN_DIR=3D&#39;${WORKDIR}/${KERNEL_VERSION}/build=
&#39; KBUILD_VERBOSE=3D1 CC=3D&#39;${CC} ${DEBUG_PREFIX_MAP} -ffile-prefix-=
map=3D${STAGING_KERNEL_DIR}=3D${KERNEL_SRC_PATH} -ffile-prefix-map=3D${STAG=
ING_KERNEL_BUILDDIR}=3D${KERNEL_SRC_PATH}&#39;&quot;<br>
+EXTRA_OEMAKE +=3D &quot;KERN_DIR=3D&#39;${WORKDIR}/${KERNEL_VERSION}/build=
&#39; KERN_MAJ=3D&#39;${@(get_kernelversion_file(&#39;${STAGING_KERNEL_BUIL=
DDIR}&#39;) or &#39;&#39;).split(&#39;.&#39;)[0]}&#39; KBUILD_VERBOSE=3D1 C=
C=3D&#39;${CC} ${DEBUG_PREFIX_MAP} -ffile-prefix-map=3D${STAGING_KERNEL_DIR=
}=3D${KERNEL_SRC_PATH} -ffile-prefix-map=3D${STAGING_KERNEL_BUILDDIR}=3D${K=
ERNEL_SRC_PATH}&#39;&quot;<br>
<br>
=C2=A0# otherwise 5.2.22 builds just vboxguest<br>
=C2=A0MAKE_TARGETS =3D &quot;all&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128696): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128696" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128696</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120580604/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120580604/1997914</a><br>
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

--00000000000073dc3506582d398b--

