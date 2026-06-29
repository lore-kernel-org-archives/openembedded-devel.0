Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69456C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 18:26:10 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3964.1782757564374001927
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2026 11:26:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=m2ZQMThv;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-66493875766so4175278d50.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Jun 2026 11:26:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782757563; cv=none;
        d=google.com; s=arc-20260327;
        b=QMwsUfX51pM55kdcEaC9TFgj1jXPOAq4BgkcnPVbbJDd4926rl0hr1j4n1hDjjV0Fr
         +w3AUNqimZ3J+wm0Yxv829xTL8aW8pNtAHkxjIkteZylybNNv9Ipzi7o15EWXsIkjrQw
         X76Z3HBT/a/1Z3FjrEIws2RPFSUhKa+gZNLg8jAonW85bfbUu592snXk/LuvFRifWTan
         fDSLPVBV6MsndFYEkcKKXWJYOMBbPh+u+EPkTSj/Ct1xom9y9hEPPq7xU3QFnONsHeQ8
         DrWzmErsGbcVmYvocdUx0csu6PFbBVKo9oAzRh9RUTUK7Ba6bXFVss1wo5m1tjRlxDqB
         ITuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=67OuaCMZHZ7pM0A8xChpBF1jjMfUHe5NAuoJTOuddbM=;
        fh=aiNCl88GKoi1hQ8lNeheo7baGDj7BYpxpzcRT9kb69Y=;
        b=e3qFoVFcCZ1hTwMQUrrYeO3iwsFvtmDPoULHsQfkNF2qpoRs8A3/bNLki7/hR8pBtz
         nEHGqPHbDRik/QpHR/YbQG+n1wU/6SRS/r9wOVHFtnWQ4Mr4/fXgLgDZP9iLtn/igihQ
         FPgkTo5jwxFgYzTQj/ZXgzqsSEy2iAAjJKxbv8SVihD58m2XYx+XHG0pRh9Rl5GCCUig
         h3hfSHPRV1b+iyBEw5ZZxXVNe4+3WcPTd+9aCFe2cGy2fbLfKs+QOfGq7J60hCtkN23+
         79qYaMA5QwTQkQ2PXtEQoa2KxgozUA89PbPaD9iA38TKUVgffwhzMo0wwsBa85CVt0cn
         lMIA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782757563; x=1783362363; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=67OuaCMZHZ7pM0A8xChpBF1jjMfUHe5NAuoJTOuddbM=;
        b=m2ZQMThv6ZbJWNSURdEv5QdhN9+oZ+m3Xsa2K/AXIcInDRbK4tRQyodjJhA+sxQyfF
         WqdJmusha5XU0yIn46EBsLm6LEF259BrrRYsURChnOu/1sN7/yeyZBsFiRwUf/iYBlyR
         XTa5bk1NjVQTcbqnYpenqDVv7g3bv+ei9W2mJ6KT6/PirwlhUWd6qX7aF/vQp1dZZ1C+
         q6b+roirmY3FAQagPzLnmxwdH5hrFIcNZJQfx4iJ5KD36Q6ooACEDtRJPKASf7MOf5Dl
         9tP2ag3T7En4e6dPMaY8EzuriYLAMAkGHAVuRZm7xCwSqsVCY2x23Fw2CZuiS/WHeNoz
         hvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782757563; x=1783362363;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67OuaCMZHZ7pM0A8xChpBF1jjMfUHe5NAuoJTOuddbM=;
        b=lyKmleDQnFC6YKZtjBkogIAFwofSE2aBRFu+vTkr27eINyJdXru9LH5mryNBMNCXVU
         x5XA5OcBYBS4BiogEkZD+Zn4VsMk8aYmihg46VHUHC0W0VLi1OcQZHKvR8eotiMtFpnK
         tjqtltkYh06PJ2jwCa9jITewCn1eYEENC88K0HCQttPPTU2Opb8udxPEgvkUkJoTYUTq
         dFpyzMZ2EHH4bAPpgN39gkyaUbfykLATVBZFXNd2s49sl3uyLk2HHX1HgzYrYv3w9qwl
         +3wYekkwwIxADOq/eTa5fW3zdXerkFrUpURNyhn8weQePyROjKomgAnntZwk3foNHDx0
         NEQg==
X-Gm-Message-State: AOJu0YyPvRdnJDq1Zp0GQphyed/PHAVXt2BTaNKzOk8/VTR3Dp1JE/8o
	Qzg5cbLXah9kq2iU5vHC7QJpJ3KgIawjUMEJx6zPtqkj0iDtM614lNrytelhbh5TH4c5pwyQAHd
	KWE3UHw47zc5OpYHqmONJ/6owTGobZyq8WmGYrOc=
X-Gm-Gg: AfdE7ckk95vPJIuy6K4vawgJj++FpqKEcPRyeGgX00GwfQm3o7zDmS6qJP5UEO9vxfE
	AMNhTw/SvEGBdpBmriztrXwqzrl59DQGjMcKuCCNVOL//6cfQjI0lHry1kWOWujr5fRcUAdehHa
	ROlX+qvj/21zf+EnVMaHosMayzyStQWKBYu6pM55MymtBetyCEaBZQu5TW2JJxa7lVyy6XvNgZH
	syZA5mTxwe5dY2XBkmaVXGkEYBBP7kEXSQIO0DuaD+DIOc06sJBadGmzQt+fdCkISsoWFGrj+uk
	N7shFkcrMl6RzT3DvakQ58otMYl5zNDpxzQ1jMy5Ur3NNIPTf/OXJjxFpgh3s7rzMY2uWWs1MaG
	/ZhVfaY6s4picVTGPSZgiRr7GY+ezC80dlIX2FdA7LtvIptdFRT6jRWn2X/7pk2XdNGSgWu8=
X-Received: by 2002:a05:690e:2624:b0:664:d072:5647 with SMTP id
 956f58d0204a3-664f99f0e94mr554626d50.51.1782757563256; Mon, 29 Jun 2026
 11:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260625020437.2824-1-zhengrq.fnst@fujitsu.com>
 <CAMKF1spuJhbL5dtkE=nhQABDCm7cU9gFfUk2eSGDwYUBTDbQSw@mail.gmail.com> <OSZPR01MB78681080C3B910F0A9FA1A578BE82@OSZPR01MB7868.jpnprd01.prod.outlook.com>
In-Reply-To: <OSZPR01MB78681080C3B910F0A9FA1A578BE82@OSZPR01MB7868.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Jun 2026 11:25:37 -0700
X-Gm-Features: AVVi8Ce2BjdUHqDPv_uo49SG57pVCRs10o5irSTtE38m1L2yjeGUhswUN_tcdow
Message-ID: <CAMKF1sp+rWCfigX3Cb0fZxS3epn3p_YNfN=8nhi8T5GOiS=z7A@mail.gmail.com>
Subject: Re: [oe] [PATCH v2 0/5] freeglut: Bug fix and virtual/freeglut provide.
To: "Ruoqin Zheng (Fujitsu)" <zhengrq.fnst@fujitsu.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004752eb0655689718"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Jun 2026 18:26:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127942

--0000000000004752eb0655689718
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

yeah I am carrying a patch in master-next to fix it.

On Sun, Jun 28, 2026 at 7:16=E2=80=AFPM Ruoqin Zheng (Fujitsu) <
zhengrq.fnst@fujitsu.com> wrote:

> Hi Khem
>
> Do you meas the error about "Could NOT find OpenGL"
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/freeglut/3.8.0/recipe-sysroot-native/usr/share/cmake-4.3/Modules/FindP=
ackageHandleStandardArgs.cmake:290
> (message):
> |   Could NOT find OpenGL (missing: OPENGL_opengl_LIBRARY)
> | Call Stack (most recent call first):
>
> I think this build error has nothing to do with this patch.
>
> It was caused by lack of DISTRO_FEATURES.
>
> # depends on virtual/libgl and libxi
> REQUIRED_DISTRO_FEATURES =3D "opengl x11"
>
> For example:
> Add "glvnd x11" to DISTRO_FEATURES can solve this build error.
>
> Zheng
> ------------------------------
> *From:* Khem Raj <raj.khem@gmail.com>
> *Sent:* Friday, June 26, 2026 23:14
> *To:* Zheng, Ruoqin/=E9=83=91 =E8=8B=A5=E9=92=A6 <zhengrq.fnst@fujitsu.co=
m>
> *Cc:* openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org>
> *Subject:* Re: [oe] [PATCH v2 0/5] freeglut: Bug fix and virtual/freeglut
> provide.
>
> Seeing this on AB -
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1575/s=
teps/15/logs/stdio
>
> On Wed, Jun 24, 2026 at 7:04=E2=80=AFPM zhengruoqin via lists.openembedde=
d.org
> <zhengrq.fnst=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> Zheng Ruoqin (5):
>   Bug fix:
>   [oe][meta-oe][PATCH v2] freeglut-gles: Add symbol link to fix opencl-ct=
s
>     compile error
>
>   Add virtual/freeglut to provide split version of freeglut and fix recip=
e
> which depends on freeglut.
>   [oe][meta-oe][PATCH v2] freeglut: Add virtual/freeglut to PROVIDES
>   [oe][meta-oe][PATCH v2] jasper: Use virtual/freeglut instead of freeglu=
t
>   [oe][meta-oe][PATCH v2] ftgl: Use virtual/freeglut instead of freeglut
>   [oe][meta-oe][PATCH v2] opencl-cts: Use virtual/freeglut instead of
>     freeglut
>
>  meta-oe/recipes-core/opencl/opencl-cts_2026.05.05.bb | 2 +-
>  meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb  | 5 ++++-
>  meta-oe/recipes-graphics/ftgl/ftgl_2.4.0.bb          | 2 +-
>  meta-oe/recipes-graphics/jasper/jasper_4.2.9.bb      | 2 +-
>  4 files changed, 7 insertions(+), 4 deletions(-)
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127726):
> https://lists.openembedded.org/g/openembedded-devel/message/127726
> Mute This Topic: https://lists.openembedded.org/mt/119968332/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004752eb0655689718
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">yeah I am carrying a patch in master-next to fix it.</div>=
<br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Jun 28, 2026 at 7:16=E2=80=AFPM Ruoqin Zheng (Fujit=
su) &lt;<a href=3D"mailto:zhengrq.fnst@fujitsu.com">zhengrq.fnst@fujitsu.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div class=3D"msg-4937387900613757212">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Hi Khem</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Do you meas the error about &quot;Could NOT find OpenGL&quot;</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-lin=
ux/freeglut/3.8.0/recipe-sysroot-native/usr/share/cmake-4.3/Modules/FindPac=
kageHandleStandardArgs.cmake:290 (message):</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
| =C2=A0 Could NOT find OpenGL=C2=A0(missing: OPENGL_opengl_LIBRARY)</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
| Call Stack (most recent call first):</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
I think this build error has nothing to do with this patch.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
It was caused by lack of DISTRO_FEATURES.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
# depends on virtual/libgl and libxi<br>
REQUIRED_DISTRO_FEATURES=C2=A0=3D &quot;opengl x11&quot;</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
For example:</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Add &quot;glvnd x11&quot; to DISTRO_FEATURES can solve this build error.</d=
iv>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Zheng</div>
<div id=3D"m_-4937387900613757212appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_-4937387900613757212divRplyFwdMsg" dir=3D"ltr"><font face=3D"C=
alibri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>From:</b>=
 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.k=
hem@gmail.com</a>&gt;<br>
<b>Sent:</b> Friday, June 26, 2026 23:14<br>
<b>To:</b> Zheng, Ruoqin/=E9=83=91 =E8=8B=A5=E9=92=A6 &lt;<a href=3D"mailto=
:zhengrq.fnst@fujitsu.com" target=3D"_blank">zhengrq.fnst@fujitsu.com</a>&g=
t;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-devel@lists.openembedded.org" tar=
get=3D"_blank">openembedded-devel@lists.openembedded.org</a> &lt;<a href=3D=
"mailto:openembedded-devel@lists.openembedded.org" target=3D"_blank">openem=
bedded-devel@lists.openembedded.org</a>&gt;<br>
<b>Subject:</b> Re: [oe] [PATCH v2 0/5] freeglut: Bug fix and virtual/freeg=
lut provide.</font>
<div>=C2=A0</div>
</div>
<div>
<div dir=3D"ltr">Seeing this on AB -=C2=A0<a href=3D"https://autobuilder.yo=
ctoproject.org/valkyrie/#/builders/81/builds/1575/steps/15/logs/stdio" targ=
et=3D"_blank">https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/b=
uilds/1575/steps/15/logs/stdio</a></div>
<br>
<div>
<div dir=3D"ltr">On Wed, Jun 24, 2026 at 7:04=E2=80=AFPM zhengruoqin via
<a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembed=
ded.org</a> &lt;zhengrq.fnst=3D<a href=3D"mailto:fujitsu.com@lists.openembe=
dded.org" target=3D"_blank">fujitsu.com@lists.openembedded.org</a>&gt; wrot=
e:<br>
</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
Zheng Ruoqin (5):<br>
=C2=A0 Bug fix:<br>
=C2=A0 [oe][meta-oe][PATCH v2] freeglut-gles: Add symbol link to fix opencl=
-cts<br>
=C2=A0 =C2=A0 compile error<br>
<br>
=C2=A0 Add virtual/freeglut to provide split version of freeglut and fix re=
cipe which depends on freeglut.<br>
=C2=A0 [oe][meta-oe][PATCH v2] freeglut: Add virtual/freeglut to PROVIDES<b=
r>
=C2=A0 [oe][meta-oe][PATCH v2] jasper: Use virtual/freeglut instead of free=
glut<br>
=C2=A0 [oe][meta-oe][PATCH v2] ftgl: Use virtual/freeglut instead of freegl=
ut<br>
=C2=A0 [oe][meta-oe][PATCH v2] opencl-cts: Use virtual/freeglut instead of<=
br>
=C2=A0 =C2=A0 freeglut<br>
<br>
=C2=A0meta-oe/recipes-core/opencl/<a href=3D"http://opencl-cts_2026.05.05.b=
b" rel=3D"noreferrer" target=3D"_blank">opencl-cts_2026.05.05.bb</a> | 2 +-=
<br>
=C2=A0meta-oe/recipes-graphics/freeglut/<a href=3D"http://freeglut_3.8.0.bb=
" rel=3D"noreferrer" target=3D"_blank">freeglut_3.8.0.bb</a>=C2=A0 | 5 ++++=
-<br>
=C2=A0meta-oe/recipes-graphics/ftgl/<a href=3D"http://ftgl_2.4.0.bb" rel=3D=
"noreferrer" target=3D"_blank">ftgl_2.4.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 2 +-<br>
=C2=A0meta-oe/recipes-graphics/jasper/<a href=3D"http://jasper_4.2.9.bb" re=
l=3D"noreferrer" target=3D"_blank">jasper_4.2.9.bb</a>=C2=A0 =C2=A0 =C2=A0 =
| 2 +-<br>
=C2=A04 files changed, 7 insertions(+), 4 deletions(-)<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127726): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127726" rel=3D"noreferrer" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-devel/message/127726</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119968332/199=
7914" rel=3D"noreferrer" target=3D"_blank">
https://lists.openembedded.org/mt/119968332/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">
openembedded-devel+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote>
</div>
</div>
</div>

</div></blockquote></div>

--0000000000004752eb0655689718--

