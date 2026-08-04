Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B3C5C55ABA
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 22:25:29 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28211.1785882323831027745
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 15:25:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=j4hQDAZf;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-820100e3504so4154917b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 15:25:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785882323; cv=none;
        d=google.com; s=arc-20260327;
        b=DnSQI3WGokSAin3j2DiqondN/rvAK+r+IowAUrM8lIlNvQENj2iEWxchVJ1f9zQOUm
         Enve0+egzW5vZzFbTNMITCJbLqQH0o917Bo6wMoeOGSdqrbpwaFGzJ2Jx7MEtxpWgI4C
         AOF8xmicRmfA2LOUdeveF+07mEllyK1S+WwseoH3cJwqtTrpteY2GPzF8VWg9ZE7i+3w
         HnTLGyHCLsr9mxL3qvmt+vX2q/zHn1Gc5/Hg3IeU1H5zZJizkpgxh4WNkrx1vLoqTolK
         0YAs6XAD2HVTePmb/uVxjmaA0mYowWDnRtmkFEMpiBrwc21k0sImG4GkgVQGA/XS5n0L
         HaGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SxyT4Du5lEO74laku3CSpgvfEIg9nmSODVPI6KcDfyw=;
        fh=Hcylym1IDQ/ReLTOLwq6wV7vR7OvCm+Qj5++TUspaM8=;
        b=OPKdYOwKvYIKvWjNGiCX4kYpG1dhjACRyoiDzAZwG5i84Il0RB1Be/UIEaNN0+Z5xY
         HWSGRzkjEely5XhbfrYnQTvfigzQaQWJBqs8QL9jQks2wtZX+Nt+NdLktXbrqMv3+YAs
         E2t1GkU0Ats5LH5wFFtm7aN8CCpbPwh6jsm1lTnMBxDijtIlw7ZQ8BUvQLZHSXtX7+5/
         eQsHRZpj7AkYjSqAbzjz/dmQiCZB0S4D60WfBSceMkdNV83xN/QvuRw+QpL09oihd0fl
         q9WO9C4SzKRd+GvQx4LLln6munEfVg7cq3A/HTp6tXzvivZ4AA8R8XvH2uXkSlE389JT
         pAWg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785882323; x=1786487123; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SxyT4Du5lEO74laku3CSpgvfEIg9nmSODVPI6KcDfyw=;
        b=j4hQDAZfL0XyWkxjlUv8WsNHRJk6ze/nj1VTCeJIvC2SYCYhXhaa87Nd65IsRfLbaI
         ZXl2IKPH/q+GHfISXFgNoA4izvLxhycuNcJNPDjHyk4ookrJjzNVM0B1Szxy85m4Ebli
         pnP52xtEED0b4HDrnDlnAM3RNkpa7aPci/ihC1Tocvt96+46SrHs7NXuqzSPaT+/qEHR
         5NW4y6FAZFRIWAE2as41tBvAlg54SwinOYAhlPoOWsTbP4NdTHeq4BDZoNprLIY/gara
         XKBJPX8aS9lpJQRgTm3ZotPz9+2I+dfciwGGDTwm9yBbU/k6Qb25LgyRNM8u9qn212LO
         2eOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785882323; x=1786487123;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SxyT4Du5lEO74laku3CSpgvfEIg9nmSODVPI6KcDfyw=;
        b=ZfzJCGTcmiZYRq5L6I+V35h4fdzcQaciLBgblJ3jsTDcagl5O+KPJr0BKFGUBYa4+1
         1TIYUGBJ/GNwd9IjRbFVm6m2iNo9t8bPqbkzcicZ+7uu3tewAMcZExkCfLL8Oq+FfRa/
         YoZsA0h3gPJwkUn34INUJlQ3iC9n6ZVE4a5/87DO1sahHZMPqCyI9LBP9FgQJImUIJ5x
         DQw4wBre5Yc+9grcC9XW11fCVLC92Tq+wL1YBBJVeqTDHYfjzSNXHtp6fdD7z5YCYbfM
         8hV2J5wCdKAzEodM9Q/d+E4MBtHgUhGqZIY1XOgMfxmXN1hZnUVb9vJhv8ITV9t9pACf
         qFMg==
X-Gm-Message-State: AOJu0Yyd50Hq39HQMGipxYpHRQrrW9cR+YNnkAeyDullBEJThuNinA9H
	uGAadr3MPoyUVWT+cd1mqjasuMwzQWAmBiajCJEdS7MMCr+r8VUUrSPBVf3/KSEb5EGDzcgfLYe
	BDh1T60aqMW1xHmYaqBantZDwEIY3hmHR7Q==
X-Gm-Gg: AR+sD100VSUbqSSKP62KCNLDkq9vMSMFuNfNX5He2iK0xnDnROyaDbL+HGddPdBq0cE
	bPvAO/ezWUzmxmELgS43GdCnnsk15Vzgt8qICbpaPgoEZp35KxnBXFFXTxXQY8gpImVlYw6H7m/
	pR621c/ZBaORilHq47TSBHLPK1oxHOvSWcuKE/ez69cgoJvSkXKpL2JIzu301QGlN4RSgrlE7F8
	LPSzuXqKRyR7wecOO5rtq0ReFGt1UL9mOKYwmJurvA9uhlQDp/2xakBgSQnIT3BvVgCIvBtYX36
	jC7lsxds3ft6G5raptDvtxSKrA0bwgn+e8Q/lGGVHG+KU1EsJl6hYm8EjruiQfURPGOTZ46IkJS
	rmzqc9S7kxcjVUnC/cZPVNFgRb4KioS2OjxlO0xU1Z9q2dZIhVmO0w1+6Wmb57PTcpljSN1XuHt
	LkcdOw/tlZl2iuUhfm5c0K7JHV4D1lW0YcEMUos2V4K2gfZ+D7mEAsIvSxLsd6kn0BEhoDSst3V
	rw=
X-Received: by 2002:a05:690c:4:b0:81e:8383:851c with SMTP id
 00721157ae682-8202233e4aemr11610807b3.13.1785882322504; Tue, 04 Aug 2026
 15:25:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260803171813.318922-1-rouven.rastetter.ext@karlstorz.com>
 <CAMKF1sqR1+U6Afm7DWYSB1CEbxVAFhTrR2zOVN6WLGgooOe8Xg@mail.gmail.com> <VI2PR01MB11434CD485920AA5F167B2BA7DBD42@VI2PR01MB11434.eurprd01.prod.exchangelabs.com>
In-Reply-To: <VI2PR01MB11434CD485920AA5F167B2BA7DBD42@VI2PR01MB11434.eurprd01.prod.exchangelabs.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Aug 2026 15:25:09 -0700
X-Gm-Features: AUfX_mzweElEBeyLyELhJioVdXx4-UlYBmbdqUYoFloVLLjrO4ChaKN7PWcYrtk
Message-ID: <CAMKF1srKidkq_skk0AR-Xk4xnNUsHeUz4OZFkk3OO-_r3JGB1A@mail.gmail.com>
Subject: Re: Re: [oe] [meta-oe][PATCH] vboxguestdrivers: Provide target kernel version
To: "Rastetter, Rouven.ext" <Rouven.Rastetter.ext@karlstorz.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007190980658402197"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 22:25:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128784

--0000000000007190980658402197
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rouven,

Yes, that is correct. Please send it with [wrynose] in the subject line.

Thanks,
Khem

On Tue, Aug 4, 2026, 2:39=E2=80=AFAM Rastetter, Rouven.ext <
Rouven.Rastetter.ext@karlstorz.com> wrote:

>
> linux-kernel-base is deprecated in oe-core/master now. I would suggest to
> use the new ways of using it via oe.kernel.get_version_file
>
>
> Good to know, I will provide a separate patch for master then. But for th=
e
> wrynose branch this would be the way to go right?
>
> ------------------------------
> *Von:* Khem Raj <raj.khem@gmail.com>
> *Gesendet:* Dienstag, 4. August 2026 01:51
> *An:* Rastetter, Rouven.ext <Rouven.Rastetter.ext@karlstorz.com>
> *Cc:* openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org>
> *Betreff:* [Ext] Re: [oe] [meta-oe][PATCH] vboxguestdrivers: Provide
> target kernel version
>
> On Mon, Aug 3, 2026 at 10: 19 AM Rouven Rastetter via lists. openembedded=
.
> org <rouven. rastetter. ext=3Dkarlstorz. com@ lists. openembedded. org>
> wrote: The Makefile uses `uname` to determine the kernel version. We must
> override this with the actual
>
>
> On Mon, Aug 3, 2026 at 10:19=E2=80=AFAM Rouven Rastetter via
> lists.openembedded.org
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!Lw1uGqvHvt=
J_psGG2Et-1voSwbo!cAyPfyOOsfxcDtRtj6u9pMZv0OEOSnLiePM6JDDB_1lj4yH8nspTcwVMy=
tRMmyjV5_tEknFQ2dqGW-k9itVq1K3QcFIE$>
> <rouven.rastetter.ext=3Dkarlstorz.com@lists.openembedded.org> wrote:
>
> The Makefile uses `uname` to determine the kernel version. We must
> override this with the actual target kernel version.
>
> The kernel version might be empty during parsing (e.g. when using
> linux-dummy), therefore `or ''` is needed.
> ---
>  .../vboxguestdrivers/vboxguestdrivers_7.2.14.bb
> <https://urldefense.com/v3/__http://vboxguestdrivers_7.2.14.bb__;!!Lw1uGq=
vHvtJ_psGG2Et-1voSwbo!cAyPfyOOsfxcDtRtj6u9pMZv0OEOSnLiePM6JDDB_1lj4yH8nspTc=
wVMytRMmyjV5_tEknFQ2dqGW-k9itVq1O_1M_cL$>
>              | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_7.2.14.bb
> <https://urldefense.com/v3/__http://vboxguestdrivers_7.2.14.bb__;!!Lw1uGq=
vHvtJ_psGG2Et-1voSwbo!cAyPfyOOsfxcDtRtj6u9pMZv0OEOSnLiePM6JDDB_1lj4yH8nspTc=
wVMytRMmyjV5_tEknFQ2dqGW-k9itVq1O_1M_cL$>
> b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.14.bb
> <https://urldefense.com/v3/__http://vboxguestdrivers_7.2.14.bb__;!!Lw1uGq=
vHvtJ_psGG2Et-1voSwbo!cAyPfyOOsfxcDtRtj6u9pMZv0OEOSnLiePM6JDDB_1lj4yH8nspTc=
wVMytRMmyjV5_tEknFQ2dqGW-k9itVq1O_1M_cL$>
> index 18fda0393d..6a870c267c 100644
> --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.14.bb
> <https://urldefense.com/v3/__http://vboxguestdrivers_7.2.14.bb__;!!Lw1uGq=
vHvtJ_psGG2Et-1voSwbo!cAyPfyOOsfxcDtRtj6u9pMZv0OEOSnLiePM6JDDB_1lj4yH8nspTc=
wVMytRMmyjV5_tEknFQ2dqGW-k9itVq1O_1M_cL$>
> +++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.14.bb
> <https://urldefense.com/v3/__http://vboxguestdrivers_7.2.14.bb__;!!Lw1uGq=
vHvtJ_psGG2Et-1voSwbo!cAyPfyOOsfxcDtRtj6u9pMZv0OEOSnLiePM6JDDB_1lj4yH8nspTc=
wVMytRMmyjV5_tEknFQ2dqGW-k9itVq1O_1M_cL$>
> @@ -14,7 +14,7 @@ DEPENDS =3D "virtual/kernel"
>  # compiler-runtime deps needed to compile and link the userspace utility=
.
>  DEPENDS +=3D "virtual/compilerlibs virtual/libc"
>
> -inherit module kernel-module-split
> +inherit linux-kernel-base module kernel-module-split
>
>
> linux-kernel-base is deprecated in oe-core/master now. I would suggest to
> use the new ways of using it via oe.kernel.get_version_file
>
>
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
> <https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedde=
d-devel/message/128696__;!!Lw1uGqvHvtJ_psGG2Et-1voSwbo!cAyPfyOOsfxcDtRtj6u9=
pMZv0OEOSnLiePM6JDDB_1lj4yH8nspTcwVMytRMmyjV5_tEknFQ2dqGW-k9itVq1Bd60O3W$>
> Mute This Topic: https://lists.openembedded.org/mt/120580604/1997914
> <https://urldefense.com/v3/__https://lists.openembedded.org/mt/120580604/=
1997914__;!!Lw1uGqvHvtJ_psGG2Et-1voSwbo!cAyPfyOOsfxcDtRtj6u9pMZv0OEOSnLiePM=
6JDDB_1lj4yH8nspTcwVMytRMmyjV5_tEknFQ2dqGW-k9itVq1JjzgnAr$>
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
> <https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedde=
d-devel/unsub__;!!Lw1uGqvHvtJ_psGG2Et-1voSwbo!cAyPfyOOsfxcDtRtj6u9pMZv0OEOS=
nLiePM6JDDB_1lj4yH8nspTcwVMytRMmyjV5_tEknFQ2dqGW-k9itVq1Efr4Ozd$>
> [raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007190980658402197
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Rouven,<br><br>Yes, that is correct. Please send it wi=
th [wrynose] in the subject line.<br><br>Thanks,<br>Khem<div><br></div><div=
 class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Tue, Aug 4, 2026, 2:39=E2=80=AFAM Rastetter, Rouven.ext &lt;<a h=
ref=3D"mailto:Rouven.Rastetter.ext@karlstorz.com">Rouven.Rastetter.ext@karl=
storz.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left:=
1px solid rgb(204,204,204)">
<div style=3D"direction:ltr;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
linux-kernel-base is deprecated in oe-core/master now. I would suggest to u=
se the new ways of using it via=C2=A0oe.kernel.get_version_file</div>
</blockquote>
<div style=3D"direction:ltr;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"direction:ltr;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Good to know, I will provide a separate patch for master then. But for the =
wrynose branch this would be the way to go right?</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_926194856002829097divRplyFwdMsg">
<div style=3D"direction:ltr;font-family:Calibri,sans-serif;font-size:11pt;c=
olor:rgb(0,0,0)">
<b>Von:</b> Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank" rel=3D"noreferrer">raj.khem@gmail.com</a>&gt;<br>
<b>Gesendet:</b> Dienstag, 4. August 2026 01:51<br>
<b>An:</b> Rastetter, Rouven.ext &lt;<a href=3D"mailto:Rouven.Rastetter.ext=
@karlstorz.com" target=3D"_blank" rel=3D"noreferrer">Rouven.Rastetter.ext@k=
arlstorz.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-devel@lists.openembedded.org" tar=
get=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.openembedded.org=
</a> &lt;<a href=3D"mailto:openembedded-devel@lists.openembedded.org" targe=
t=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.openembedded.org</=
a>&gt;<br>
<b>Betreff:</b> [Ext] Re: [oe] [meta-oe][PATCH] vboxguestdrivers: Provide t=
arget kernel version</div>
<div style=3D"direction:ltr">=C2=A0</div>
</div>
<div style=3D"line-height:1px;display:none;font-size:1px;color:rgb(255,255,=
255)">
On Mon, Aug 3, 2026 at 10:=E2=80=8A19 AM Rouven Rastetter via lists.=E2=80=
=8Aopenembedded.=E2=80=8Aorg &lt;rouven.=E2=80=8Arastetter.=E2=80=8Aext=3Dk=
arlstorz.=E2=80=8Acom@=E2=80=8Alists.=E2=80=8Aopenembedded.=E2=80=8Aorg&gt;=
 wrote: The Makefile uses `uname` to determine the kernel version. We must =
override this with the actual</div>
<div style=3D"line-height:1px;display:none;font-size:1px;color:rgb(255,255,=
255)">
</div>
<div style=3D"direction:ltr"><br>
</div>
<div style=3D"direction:ltr"><br>
</div>
<div style=3D"direction:ltr">On Mon, Aug 3, 2026 at 10:19=E2=80=AFAM Rouven=
 Rastetter via
<a href=3D"https://urldefense.com/v3/__http://lists.openembedded.org__;!!Lw=
1uGqvHvtJ_psGG2Et-1voSwbo!cAyPfyOOsfxcDtRtj6u9pMZv0OEOSnLiePM6JDDB_1lj4yH8n=
spTcwVMytRMmyjV5_tEknFQ2dqGW-k9itVq1K3QcFIE$" id=3D"m_926194856002829097OWA=
82bb653b-e4bb-e168-0f05-2e77a43b13b2" target=3D"_blank" rel=3D"noreferrer">
lists.openembedded.org</a> &lt;rouven.rastetter.ext=3D<a href=3D"mailto:kar=
lstorz.com@lists.openembedded.org" id=3D"m_926194856002829097OWA6d24e70e-fa=
88-b7ec-d9b0-64e5f07d77a2" target=3D"_blank" rel=3D"noreferrer">karlstorz.c=
om@lists.openembedded.org</a>&gt; wrote:</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left:=
1px solid rgb(204,204,204)">
<div style=3D"direction:ltr">The Makefile uses `uname` to determine the ker=
nel version. We must<br>
override this with the actual target kernel version.<br>
<br>
The kernel version might be empty during parsing (e.g. when using<br>
linux-dummy), therefore `or &#39;&#39;` is needed.<br>
---<br>
=C2=A0.../vboxguestdrivers/<a href=3D"https://urldefense.com/v3/__http://vb=
oxguestdrivers_7.2.14.bb__;!!Lw1uGqvHvtJ_psGG2Et-1voSwbo!cAyPfyOOsfxcDtRtj6=
u9pMZv0OEOSnLiePM6JDDB_1lj4yH8nspTcwVMytRMmyjV5_tEknFQ2dqGW-k9itVq1O_1M_cL$=
" id=3D"m_926194856002829097OWAd6cc4839-7624-11ff-afa0-c6a3926475bc" target=
=3D"_blank" rel=3D"noreferrer">vboxguestdrivers_7.2.14.bb</a>=C2=A0
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"https://ur=
ldefense.com/v3/__http://vboxguestdrivers_7.2.14.bb__;!!Lw1uGqvHvtJ_psGG2Et=
-1voSwbo!cAyPfyOOsfxcDtRtj6u9pMZv0OEOSnLiePM6JDDB_1lj4yH8nspTcwVMytRMmyjV5_=
tEknFQ2dqGW-k9itVq1O_1M_cL$" id=3D"m_926194856002829097OWAaa13fe21-7f1a-0fc=
e-2db6-8a164773e9aa" target=3D"_blank" rel=3D"noreferrer">vboxguestdrivers_=
7.2.14.bb</a>
 b/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"https://urldefense.c=
om/v3/__http://vboxguestdrivers_7.2.14.bb__;!!Lw1uGqvHvtJ_psGG2Et-1voSwbo!c=
AyPfyOOsfxcDtRtj6u9pMZv0OEOSnLiePM6JDDB_1lj4yH8nspTcwVMytRMmyjV5_tEknFQ2dqG=
W-k9itVq1O_1M_cL$" id=3D"m_926194856002829097OWAc4e43a45-62e6-41d4-9ac4-2d7=
11923154a" target=3D"_blank" rel=3D"noreferrer">vboxguestdrivers_7.2.14.bb<=
/a><br>
index 18fda0393d..6a870c267c 100644<br>
--- a/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"https://urldefens=
e.com/v3/__http://vboxguestdrivers_7.2.14.bb__;!!Lw1uGqvHvtJ_psGG2Et-1voSwb=
o!cAyPfyOOsfxcDtRtj6u9pMZv0OEOSnLiePM6JDDB_1lj4yH8nspTcwVMytRMmyjV5_tEknFQ2=
dqGW-k9itVq1O_1M_cL$" id=3D"m_926194856002829097OWA44aa56c4-0e41-5d3b-8c21-=
b26d71979509" target=3D"_blank" rel=3D"noreferrer">vboxguestdrivers_7.2.14.=
bb</a><br>
+++ b/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"https://urldefens=
e.com/v3/__http://vboxguestdrivers_7.2.14.bb__;!!Lw1uGqvHvtJ_psGG2Et-1voSwb=
o!cAyPfyOOsfxcDtRtj6u9pMZv0OEOSnLiePM6JDDB_1lj4yH8nspTcwVMytRMmyjV5_tEknFQ2=
dqGW-k9itVq1O_1M_cL$" id=3D"m_926194856002829097OWA57fa9db5-cea2-b030-7681-=
a1aad5ed81bf" target=3D"_blank" rel=3D"noreferrer">vboxguestdrivers_7.2.14.=
bb</a><br>
@@ -14,7 +14,7 @@ DEPENDS =3D &quot;virtual/kernel&quot;<br>
=C2=A0# compiler-runtime deps needed to compile and link the userspace util=
ity.<br>
=C2=A0DEPENDS +=3D &quot;virtual/compilerlibs virtual/libc&quot;<br>
<br>
-inherit module kernel-module-split<br>
+inherit linux-kernel-base module kernel-module-split</div>
</blockquote>
<div style=3D"direction:ltr"><br>
</div>
<div style=3D"direction:ltr">linux-kernel-base is deprecated in oe-core/mas=
ter now. I would suggest to use the new ways of using it via=C2=A0oe.kernel=
.get_version_file</div>
<div style=3D"direction:ltr">=C2=A0</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left:=
1px solid rgb(204,204,204)">
<div style=3D"direction:ltr"><br>
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
}=3D${KERNEL_SRC_PATH}
 -ffile-prefix-map=3D${STAGING_KERNEL_BUILDDIR}=3D${KERNEL_SRC_PATH}&#39;&q=
uot;<br>
<br>
=C2=A0# otherwise 5.2.22 builds just vboxguest<br>
=C2=A0MAKE_TARGETS =3D &quot;all&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128696): <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/g/openembedded-devel/message/128696__;!!Lw1uGqvHvtJ=
_psGG2Et-1voSwbo!cAyPfyOOsfxcDtRtj6u9pMZv0OEOSnLiePM6JDDB_1lj4yH8nspTcwVMyt=
RMmyjV5_tEknFQ2dqGW-k9itVq1Bd60O3W$" id=3D"m_926194856002829097OWA3f53b015-=
3355-9466-09f5-aa45183c7fa4" target=3D"_blank" rel=3D"noreferrer">
https://lists.openembedded.org/g/openembedded-devel/message/128696</a><br>
Mute This Topic: <a href=3D"https://urldefense.com/v3/__https://lists.opene=
mbedded.org/mt/120580604/1997914__;!!Lw1uGqvHvtJ_psGG2Et-1voSwbo!cAyPfyOOsf=
xcDtRtj6u9pMZv0OEOSnLiePM6JDDB_1lj4yH8nspTcwVMytRMmyjV5_tEknFQ2dqGW-k9itVq1=
JjzgnAr$" id=3D"m_926194856002829097OWA0519b09d-a7c6-bacf-18e1-294928ae96c3=
" target=3D"_blank" rel=3D"noreferrer">
https://lists.openembedded.org/mt/120580604/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" id=3D"m_926194856002829097OWA412f3568-8b35-cc12-a20d-82a92485364e" t=
arget=3D"_blank" rel=3D"noreferrer">
openembedded-devel+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://lists.openembed=
ded.org/g/openembedded-devel/unsub__;!!Lw1uGqvHvtJ_psGG2Et-1voSwbo!cAyPfyOO=
sfxcDtRtj6u9pMZv0OEOSnLiePM6JDDB_1lj4yH8nspTcwVMytRMmyjV5_tEknFQ2dqGW-k9itV=
q1Efr4Ozd$" id=3D"m_926194856002829097OWAc520045f-9c66-727d-9666-5e6b39a561=
e4" target=3D"_blank" rel=3D"noreferrer">
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"m=
ailto:raj.khem@gmail.com" id=3D"m_926194856002829097OWAb9170c36-f3c9-11b1-8=
acc-30301792db2f" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</=
a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</div>
</blockquote>
</div>

</blockquote></div></div>

--0000000000007190980658402197--

