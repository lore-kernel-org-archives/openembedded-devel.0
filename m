Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A2E2CF45AF
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 16:56:15 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37482.1768236974122027793
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 08:56:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q2EL7NxU;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-78fba1a1b1eso81718097b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 08:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768236973; x=1768841773; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UFKYlNPabQecTQhLGXJgoMQL2QcWFcoY5PTaY6t55Jk=;
        b=Q2EL7NxU2uU2jKxGi9TDvt50JR7RjP5s4ZTdo7S7fPgGqAObINsJ1WXHgIlhxrXykV
         R9ccj1qQanGNrSEmx3wYT9Q0p9+q75reg2ecebyeswCuJSTleqjSuiRMH25U/KYQGNq6
         PPOn+n17aVMiQuiuZ/fWpAKrbwdzkL0tWe1sP/j2wUVOZtg1wITXcw4R+Za1W9QbJ+u3
         los2ZKG5J+iVgrp4oV48Y3oDhPJp3Q5UtnOQyNwWDxS96Fkin6jdfnbsM5NbqIBg7xFB
         wwjB+yRj/4fivDSRDzKuv2tGukN1NEyAfHl4VVeyzUoTScJfg5ALa4Zhs2hdPA3GUU2k
         6nKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768236973; x=1768841773;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFKYlNPabQecTQhLGXJgoMQL2QcWFcoY5PTaY6t55Jk=;
        b=uONiAX1GB6d6xO2ogdYUd7dzCT/3Px6Vk5NSAV29Vg/cCH8JNknKSsFxpf45elaiit
         7aFeuA1uVU7jFVBf2gkJNUuGOTpoMHhhGktrbdzcDvrHJlig1bkhbbno45LXRySs6kUV
         H1RvrIXYmByBiFhSNBRoKTmwQiYn+AUf0gC198pWYU/fY4Yf+svpwNE0/QW8Ugo21d77
         9tdvcJgGIXQy4qw1Eu/9lXNHLXD0r60oTG+5dFxMG7ymauy0j4V+aeoUmMJkg6zA9bwe
         Lb92ChjuIR1cpWnmNatDjFn4ty1RDzomrk2Kx3B2ySpNWKKxcsL0/tZjDrgJC7CIWuCx
         +jUw==
X-Gm-Message-State: AOJu0YxNDE9AAEtYPOJQ9O7T5Q+ZkUfIMcvnvY8ihBBVnFNG7hwHHRrT
	PdOpWlRQs+PSyMNWHUgf9PYbmmLMhtunO7/YbiXLaeDtnkJn9xFLXvg+s7LrFlrbmUp8dUbVsty
	vtPBO9j8g7KNVqBkOwf+5auXwMe4Vxg8Wf75A
X-Gm-Gg: AY/fxX7DZ/KTi5ZeWj76Hee97Mfy587M//dgT23rgtO3W6I5577WYjfFoJFiDc8qYTV
	kIzWGDsAolFVih60EMbsK10GJrcDVRLLhZEUS5+uBpn5AjIXxx+rkURaB74BWXuXy0o4fN2+axz
	Bq4cqFXBPTG521UrmIrski2OCkTzw1CFF7op+RetU9D8qvMweNRFN/jvXNUPtbnY4Dxw62021kg
	R1kZnqGE87v8NcqltFtxd24EdWEFh4M8+LaBCXwZu8T1BHTOu2XLPlOrqm5ve6uaXMtLBxFTcWw
	pZivrnSkytYGoP58SW8vpfkGIN8ay/XT/+BqpAeuRomz/TLIZKL4pSit8RaqM5bnVR0jsLkxGhQ
	gEHLAdoebvVo317iVk/+qKjaC2af5jaaJi9ig6QtwNBJOVg==
X-Google-Smtp-Source: AGHT+IEU9kXQoIWf0XnuvUl0iuMtNUrbXzPrGHF2BGAsEQNwH7SVbJyZdyWpJNfQ8EC99zDSLk0ZIYftD/rJzKzKUnk=
X-Received: by 2002:a05:690e:1518:b0:63f:96d7:a369 with SMTP id
 956f58d0204a3-648f62ad090mr41864d50.28.1768236972947; Mon, 12 Jan 2026
 08:56:12 -0800 (PST)
MIME-Version: 1.0
References: <20260112082438.1529670-1-mingli.yu@windriver.com>
In-Reply-To: <20260112082438.1529670-1-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Jan 2026 08:55:45 -0800
X-Gm-Features: AZwV_Qjpj0OuZCnhhg3EdnPZCKY_SyWaVsrbnfysAK8NfjSNJAaEHkwf2yitquA
Message-ID: <CAMKF1sq+LMsEcU8Vfi_nf_Xui4jDvpsrPaee-=0OU05h_nTgBA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nodejs: Make libuv related patch conditionally
To: mingli.yu@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a6bc9a064833c0dc"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 16:56:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123385

--000000000000a6bc9a064833c0dc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I wonder if its better to change

do_unpack[postfuncs] +=3D "prune_sources"

to

do_patch[postfuncs] +=3D "prune_sources"

conditional patching is error prone on upgrades etc.

On Mon, Jan 12, 2026 at 12:24=E2=80=AFAM Yu, Mingli via lists.openembedded.=
org
<mingli.yu=3Deng.windriver.com@lists.openembedded.org> wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
>
> Fixes:
>   ERROR: nodejs-22.21.1-r0 do_patch: Applying patch
> '0001-deps-disable-io_uring-support-in-libuv.patch' on target directory
> '/build/tmp/work/core2-32-poky-linux/nodejs/22.21.1/sources/node-v22.21.1=
'
>   CmdError('quilt --quiltrc
> /build/tmp/work/core2-32-poky-linux/nodejs/22.21.1/recipe-sysroot-native/=
etc/quiltrc
> push', 0, "stdout: Applying patch
> 0001-deps-disable-io_uring-support-in-libuv.patch
>   can't find file to patch at input line 27
>
> The sources which related to libuv as deps/uv/ are removed when depends o=
n
> libuv.
>
> So make the 0001-deps-disable-io_uring-support-in-libuv.patch conditional=
ly
> to fix the gap.
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb
> b/meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb
> index ccaf9f7bb2..489fcbde45 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb
> @@ -27,7 +27,7 @@ SRC_URI =3D "
> https://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
>             file://system-c-ares.patch \
>             file://0001-liftoff-Correct-function-signatures.patch \
>             file://libatomic.patch \
> -           file://0001-deps-disable-io_uring-support-in-libuv.patch \
> +           ${@bb.utils.contains('PACKAGECONFIG', 'libuv', '',
> 'file://0001-deps-disable-io_uring-support-in-libuv.patch', d)} \
>             file://0001-positional-args.patch \
>             file://0001-custom-env.patch \
>             file://0001-build-remove-redundant-mXX-flags-for-V8.patch \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123364):
> https://lists.openembedded.org/g/openembedded-devel/message/123364
> Mute This Topic: https://lists.openembedded.org/mt/117220566/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000a6bc9a064833c0dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I wonder if its better to change<div><br></div><div>do_unp=
ack[postfuncs] +=3D &quot;prune_sources&quot;=C2=A0 =C2=A0=C2=A0</div><div>=
<br></div><div>to=C2=A0</div><div><br></div><div>do_patch[postfuncs] +=3D &=
quot;prune_sources&quot;</div><div><br></div><div>conditional patching is e=
rror prone=C2=A0on upgrades etc.</div></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 12,=
 2026 at 12:24=E2=80=AFAM Yu, Mingli via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;mingli.yu=3D<a href=3D"mailto:eng.wi=
ndriver.com@lists.openembedded.org">eng.windriver.com@lists.openembedded.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" target=3D"_=
blank">mingli.yu@windriver.com</a>&gt;<br>
<br>
Fixes:<br>
=C2=A0 ERROR: nodejs-22.21.1-r0 do_patch: Applying patch &#39;0001-deps-dis=
able-io_uring-support-in-libuv.patch&#39; on target directory &#39;/build/t=
mp/work/core2-32-poky-linux/nodejs/22.21.1/sources/node-v22.21.1&#39;<br>
=C2=A0 CmdError(&#39;quilt --quiltrc /build/tmp/work/core2-32-poky-linux/no=
dejs/22.21.1/recipe-sysroot-native/etc/quiltrc push&#39;, 0, &quot;stdout: =
Applying patch 0001-deps-disable-io_uring-support-in-libuv.patch<br>
=C2=A0 can&#39;t find file to patch at input line 27<br>
<br>
The sources which related to libuv as deps/uv/ are removed when depends on<=
br>
libuv.<br>
<br>
So make the 0001-deps-disable-io_uring-support-in-libuv.patch conditionally=
<br>
to fix the gap.<br>
<br>
Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" tar=
get=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_22.21.1.bb" =
rel=3D"noreferrer" target=3D"_blank">nodejs_22.21.1.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_22.21=
.1.bb" rel=3D"noreferrer" target=3D"_blank">nodejs_22.21.1.bb</a> b/meta-oe=
/recipes-devtools/nodejs/<a href=3D"http://nodejs_22.21.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">nodejs_22.21.1.bb</a><br>
index ccaf9f7bb2..489fcbde45 100644<br>
--- a/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_22.21.1.bb" =
rel=3D"noreferrer" target=3D"_blank">nodejs_22.21.1.bb</a><br>
+++ b/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_22.21.1.bb" =
rel=3D"noreferrer" target=3D"_blank">nodejs_22.21.1.bb</a><br>
@@ -27,7 +27,7 @@ SRC_URI =3D &quot;<a href=3D"https://nodejs.org/dist/v$%7=
BPV%7D/node-v$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https:/=
/nodejs.org/dist/v${PV}/node-v${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://system-c-ares.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-liftoff-Correct-funct=
ion-signatures.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libatomic.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-deps-disable-io_uring=
-support-in-libuv.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;PACKAGE=
CONFIG&#39;, &#39;libuv&#39;, &#39;&#39;, &#39;file://0001-deps-disable-io_=
uring-support-in-libuv.patch&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-positional-args.patch=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-custom-env.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-build-remove-redundan=
t-mXX-flags-for-V8.patch \<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123364): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123364" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123364</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117220566/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117220566/1997914</a><br>
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

--000000000000a6bc9a064833c0dc--

