Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9661DC35FFC
	for <webhook@archiver.kernel.org>; Sat, 22 Mar 2025 15:18:54 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web10.11683.1742656725581939850
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Mar 2025 08:18:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O9LqLpAf;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-601e049d92dso1774430eaf.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Mar 2025 08:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742656725; x=1743261525; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wgDKS5RgVDa9fd4zeSLmz1/o5i1/q+GbiP4/mnQ2dTo=;
        b=O9LqLpAfUs4hqFx0heYa9dRg1SrJTxNd4G/mG3BHUR0OtxD6IqNTPfEnvXSff8onFU
         60qn1s3u2XjWrJ7dRME0C6US35uxQatsh2TQMvBwyKRza3jq1MiaDxDzuFLfQd/jPyHu
         hgWADqx0uJV2K0qHGSJGDDITQ6739FMj0+d58W9+ztxz430N1RqpemSXaQkuskb/S1mo
         fHTcQ+sF+dEvf+TX2zc+/4qOUS+Xgyxa1VKC2lptkT50VPMjmfTTrTX0lYZy9RoYwIkf
         CfpKg3TAIpCtFjLSsi7cHe3Yq28XV/RjehFQdpCGcA1PD4LoafJiC/zJu0mew4yEqRye
         nuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742656725; x=1743261525;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wgDKS5RgVDa9fd4zeSLmz1/o5i1/q+GbiP4/mnQ2dTo=;
        b=q8/efy7EL9fYTqZz0JY29lwAAVaocVmaNq5DUupfFYcWmjgY/HpP6yC0SeuYX0d4EP
         Fogbsn62M8hJEv630ev8P5cInX869dJ7MVE9LMDB2YT3YK3Rq/Rv9SAQgq4ehuX2DQZ4
         d3GNlKcojN5AQvhpDpwG6qBVVSrizZk5ArOdnSO54CNRJxzNeKwH9FLfxCKQHy3+sTjL
         03Q8RzAgPgtu2xmnN880NRjKp9k2/dbfmplfBLASRNtFwzNj5PVLifko0c+/+FICoOvq
         STZCgn2Et5+gQcxHkEhCJV6R7EIAWSUnfhWPdAKLD7N8mD0zc/E5N01SsHyXD2e62xcH
         H7SA==
X-Gm-Message-State: AOJu0YxqeZ0EmCgqicPIsgI1TU1mTp8xoYlRP275rxzljrW7PwNbuane
	e7iXIv3LHrUq9XE3xFEM/Vp+MHJK+ZtlOkbWKOFoFCVSL0CuV9KkOgYmlYMx5ScsgjXlNLEQwt2
	n31u1SrwZ0zfApEjILzLi2/qpm/I=
X-Gm-Gg: ASbGncu0zRfOVE8toCC1eqKx2I7XYOlNjy0nrS9i5KEiEuMkGn8NY6pwRyVytFyxTeQ
	COTOiKA2tbxLcjIqnRJEBjnOlIRwqrjMt8zk5GcsWygtrs4lGeQ9kA8FQO+drbEA5eHFsQ+NJI4
	YJNO40hakH0LLhTWG2PID/L5pciwWKL5OijDROZMhxm9gT7Z5d3dN0/f2QfyU=
X-Google-Smtp-Source: AGHT+IGBsXLgDjnVc6AqHoZ6A9D4kdNF0uCB3kdz3kKKTwCcDZJwBAKWEEfdqvvtKThBq5OqTl3nLty/CK9mfPGpLIk=
X-Received: by 2002:a05:6820:514:b0:601:bf1b:c63f with SMTP id
 006d021491bc7-602344ff0aemr3416749eaf.1.1742656724662; Sat, 22 Mar 2025
 08:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250322025925.1070828-1-raj.khem@gmail.com> <CA+chaQccQAwyh4TfvFMKRkxAiBjF=zSthmyy7x5QK+zHs54uJA@mail.gmail.com>
In-Reply-To: <CA+chaQccQAwyh4TfvFMKRkxAiBjF=zSthmyy7x5QK+zHs54uJA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 22 Mar 2025 08:18:33 -0700
X-Gm-Features: AQ5f1JoK9NlzVP4IdnIK8FcQEqlgZW18h8Mqo3s-61QBSfpabIB24zSph2MmYT4
Message-ID: <CAMKF1spb6DTWFTtK=6nC93vL3VOnG2T5M+WKLrWjj8RKJLKXJQ@mail.gmail.com>
Subject: Re: [PATCH] lvgl: Upgrade to 9.2.2 release
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Marek Vasut <marex@denx.de>, 
	Jaeyoon Jung <jaeyoon.jung@lge.com>
Content-Type: multipart/alternative; boundary="0000000000000a021f0630efe33a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Mar 2025 15:18:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116200

--0000000000000a021f0630efe33a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 22, 2025 at 5:22=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:

> On Sat, Mar 22, 2025 at 3:59=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > Drop backported patches
> > Enable thorvg packageconfig, build fails without it now
>
> Did you plan to add thorvg to default PACKAGECONFIG (I don't see that
> in the commit) or did you mean just adding those LV_USE_MATRIX,
> LV_USE_FLOAT, LV_USE_LOTTIE to be enabled when someone enables thorvg
> in bbappend?
>

Initially I did but it was not needed as I could fix the builds with it
without it. I will update the commit message accordingly

>
> Otherwise LGTM, thanks.
>
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Marek Vasut <marex@denx.de>
> > Cc: Jaeyoon Jung <jaeyoon.jung@lge.com>
> > Cc: Martin Jansa <martin.jansa@gmail.com>
> ..
> > diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> > index 41133f3438..69e42af922 100644
> > --- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> > +++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> > @@ -33,10 +33,16 @@ LVGL_CONFIG_LV_USE_GRIDNAV =3D
> "${@bb.utils.contains('PACKAGECONFIG', 'gridnav', '
> >
> >  LVGL_CONFIG_LV_THEME_DEFAULT_DARK ?=3D "0"
> >
> > +LVGL_CONFIG_USE_LOTTIE =3D "${@bb.utils.contains('PACKAGECONFIG',
> 'thorvg', '1', '0', d)}"
> > +
> >  LVGL_CONFIG_USE_VECTOR_GRAPHICS =3D
> "${@bb.utils.contains('PACKAGECONFIG', 'thorvg', '1', '0', d)}"
> >
> >  LVGL_CONFIG_USE_THORVG_INTERNAL =3D
> "${@bb.utils.contains('PACKAGECONFIG', 'thorvg', '1', '0', d)}"
> >
> > +LVGL_CONFIG_USE_MATRIX =3D "${@bb.utils.contains('PACKAGECONFIG',
> 'thorvg', '1', '0', d)}"
> > +
> > +LVGL_CONFIG_USE_FLOAT =3D "${@bb.utils.contains('PACKAGECONFIG',
> 'thorvg', '1', '0', d)}"
> > +
> >  DEBUG_BUILD ??=3D "0"
> >
> >  ALLOW_EMPTY:${PN} =3D "1"
> > @@ -84,6 +90,9 @@ do_configure:append() {
> >          \
> >          -e "s|^([[:space:]]*#define
> LV_USE_VECTOR_GRAPHIC[[:space:]]).*|\1${LVGL_CONFIG_USE_VECTOR_GRAPHICS}|=
" \
> >          -e "s|^([[:space:]]*#define
> LV_USE_THORVG_INTERNAL[[:space:]]).*|\1${LVGL_CONFIG_USE_THORVG_INTERNAL}=
|"
> \
> > +        -e "s|^([[:space:]]*#define
> LV_USE_MATRIX[[:space:]]).*|\1${LVGL_CONFIG_USE_MATRIX}|" \
> > +        -e "s|^([[:space:]]*#define
> LV_USE_FLOAT[[:space:]]).*|\1${LVGL_CONFIG_USE_FLOAT}|" \
> >          \
> > +        -e "s|^([[:space:]]*#define
> LV_USE_LOTTIE[[:space:]]).*|\1${LVGL_CONFIG_USE_LOTTIE}|" \
> >          -i "${S}/lv_conf.h"
> >  }
> ...
>

--0000000000000a021f0630efe33a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sat, Mar 22, 2025 at 5:22=E2=80=AFAM Martin Jansa &=
lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">On Sat, Mar 22, 2025 at 3:5=
9=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_=
blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Drop backported patches<br>
&gt; Enable thorvg packageconfig, build fails without it now<br>
<br>
Did you plan to add thorvg to default PACKAGECONFIG (I don&#39;t see that<b=
r>
in the commit) or did you mean just adding those LV_USE_MATRIX,<br>
LV_USE_FLOAT, LV_USE_LOTTIE to be enabled when someone enables thorvg<br>
in bbappend?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Initially I did =
but it was not needed as I could fix the builds with it without it. I will =
update the commit message accordingly=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><br>
Otherwise LGTM, thanks.<br>
<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; Cc: Marek Vasut &lt;<a href=3D"mailto:marex@denx.de" target=3D"_blank"=
>marex@denx.de</a>&gt;<br>
&gt; Cc: Jaeyoon Jung &lt;<a href=3D"mailto:jaeyoon.jung@lge.com" target=3D=
"_blank">jaeyoon.jung@lge.com</a>&gt;<br>
&gt; Cc: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=
=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
..<br>
&gt; diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recip=
es-graphics/lvgl/lv-conf.inc<br>
&gt; index 41133f3438..69e42af922 100644<br>
&gt; --- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc<br>
&gt; +++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc<br>
&gt; @@ -33,10 +33,16 @@ LVGL_CONFIG_LV_USE_GRIDNAV =3D &quot;${@bb.utils.c=
ontains(&#39;PACKAGECONFIG&#39;, &#39;gridnav&#39;, &#39;<br>
&gt;<br>
&gt;=C2=A0 LVGL_CONFIG_LV_THEME_DEFAULT_DARK ?=3D &quot;0&quot;<br>
&gt;<br>
&gt; +LVGL_CONFIG_USE_LOTTIE =3D &quot;${@bb.utils.contains(&#39;PACKAGECON=
FIG&#39;, &#39;thorvg&#39;, &#39;1&#39;, &#39;0&#39;, d)}&quot;<br>
&gt; +<br>
&gt;=C2=A0 LVGL_CONFIG_USE_VECTOR_GRAPHICS =3D &quot;${@bb.utils.contains(&=
#39;PACKAGECONFIG&#39;, &#39;thorvg&#39;, &#39;1&#39;, &#39;0&#39;, d)}&quo=
t;<br>
&gt;<br>
&gt;=C2=A0 LVGL_CONFIG_USE_THORVG_INTERNAL =3D &quot;${@bb.utils.contains(&=
#39;PACKAGECONFIG&#39;, &#39;thorvg&#39;, &#39;1&#39;, &#39;0&#39;, d)}&quo=
t;<br>
&gt;<br>
&gt; +LVGL_CONFIG_USE_MATRIX =3D &quot;${@bb.utils.contains(&#39;PACKAGECON=
FIG&#39;, &#39;thorvg&#39;, &#39;1&#39;, &#39;0&#39;, d)}&quot;<br>
&gt; +<br>
&gt; +LVGL_CONFIG_USE_FLOAT =3D &quot;${@bb.utils.contains(&#39;PACKAGECONF=
IG&#39;, &#39;thorvg&#39;, &#39;1&#39;, &#39;0&#39;, d)}&quot;<br>
&gt; +<br>
&gt;=C2=A0 DEBUG_BUILD ??=3D &quot;0&quot;<br>
&gt;<br>
&gt;=C2=A0 ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&gt; @@ -84,6 +90,9 @@ do_configure:append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|^([[:space:]]*#define LV_=
USE_VECTOR_GRAPHIC[[:space:]]).*|\1${LVGL_CONFIG_USE_VECTOR_GRAPHICS}|&quot=
; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|^([[:space:]]*#define LV_=
USE_THORVG_INTERNAL[[:space:]]).*|\1${LVGL_CONFIG_USE_THORVG_INTERNAL}|&quo=
t; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|^([[:space:]]*#define LV_USE_M=
ATRIX[[:space:]]).*|\1${LVGL_CONFIG_USE_MATRIX}|&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|^([[:space:]]*#define LV_USE_F=
LOAT[[:space:]]).*|\1${LVGL_CONFIG_USE_FLOAT}|&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|^([[:space:]]*#define LV_USE_L=
OTTIE[[:space:]]).*|\1${LVGL_CONFIG_USE_LOTTIE}|&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -i &quot;${S}/lv_conf.h&quot;<br>
&gt;=C2=A0 }<br>
...<br>
</blockquote></div></div>

--0000000000000a021f0630efe33a--

