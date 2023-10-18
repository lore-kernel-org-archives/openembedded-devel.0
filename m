Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 083C7CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 19:06:05 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.1781.1697655958834809493
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Oct 2023 12:05:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N2rlZ/OW;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5079f9675c6so7746866e87.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 12:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697655957; x=1698260757; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bzTRxOE/r9Is25dzxppnS5h5avv84VBtLl6fS9Lp9QY=;
        b=N2rlZ/OWIYHEvMiSVZLuHq9grEmk8x+7eom2ZWmvsCaWeZQHKf82TOD6IPfgJXTkIF
         Cx9FtbgxPRj4e27xZsSCBQH57ROxQ+QuuXD7IdK75bY0KNeQkyGLK5ojRB3UH4iwDgEw
         Hv58TSDPNaoqGPf1AmtkkxmOXiF1uMlwZvQV5BSkuf21/O+DwXeU4qoq6rVtV3CgSCIm
         BBEZw7B/zb9nuyZFH0DDrSfBi5+JPWt0ZuzX8GHVc4OAkLA9o3NQnMHYq5kTfdICnNVe
         Imrtc2KfzLfaG2loZET9/nyVEP+3hfgG4VDMlPF7h76Hyvh2iHGZrqJJ+9qVStetelsa
         GWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697655957; x=1698260757;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bzTRxOE/r9Is25dzxppnS5h5avv84VBtLl6fS9Lp9QY=;
        b=FA1it4lHOcaFE59gk7aW0px4V3lXztwRMHPXQIrVDz2SfdXrZUI6BGr3ekCrrzveGP
         XgC5/JX/Ak0j8pREd33BJy4PUXPw4YQNosGdXyC7oodhgOzGSHWtH96RE1mq7hRCjrB7
         DW9n/t6M13X6PTrOfG24uuHTYdPtv+baxuTkCj4eTcxHXvae1Ev0ar2yR4cqadtJYwMM
         PSAyqJ3YQN9GdzXl8RErq4Q8dzNuX/HUeaMyxpRLMQc3nkcLfcccvEtftTVUil+8IDtd
         RooU+As5tdfXuk/vUf3trgSMSm/wb9HXKyxVYrAA8PbOzJU93bYbP48zCuanizw4SOwF
         72Vg==
X-Gm-Message-State: AOJu0Yz6iSTTAQfambbt3g3iDxC4PVJE+ZOZbUQ089qZdMhR3rAUil4e
	TwWxTYwiLEg7G3p+SKxnav9Nz9LY7AOxDPfnGUs=
X-Google-Smtp-Source: AGHT+IGm44np1KsSO5cscAMPu4QSBYEv3TWLubTJdsl0qAgC5nDJL9UDKO+dEqUFr9z1nhi2MY7QihryaGB0lnkGkVw=
X-Received: by 2002:a05:6512:450:b0:503:1d46:6f29 with SMTP id
 y16-20020a056512045000b005031d466f29mr4110990lfk.37.1697655956699; Wed, 18
 Oct 2023 12:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <20231018181221.87138-1-marex@denx.de>
In-Reply-To: <20231018181221.87138-1-marex@denx.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 18 Oct 2023 21:05:44 +0200
Message-ID: <CA+chaQcet4HaWkoHp1XvjPUGWUxVAJanMhLnASq_hHSgpKN2-A@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 1/2] lvgl: lv-drivers: Allow empty package
To: Marek Vasut <marex@denx.de>
Cc: openembedded-devel@lists.openembedded.org, 
	Fabio Estevam <festevam@denx.de>, Khem Raj <raj.khem@gmail.com>, 
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Content-Type: multipart/alternative; boundary="00000000000040001a06080254b1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 19:06:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105581

--00000000000040001a06080254b1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

What issue does this actually fix?

Is it related to
https://lists.openembedded.org/g/openembedded-core/message/188383 ?

I'm not fan of empty useless packages created just to make package manager
happy when something else has unfortunate dependency on them.

On Wed, Oct 18, 2023 at 8:12=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:

> The lv-drivers main package is empty, since all the headers end up
> in the -dev variant and static library archive ends up in -staticdev
> variant. Mark the main package as ALLOW_EMPTY.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Fabio Estevam <festevam@denx.de>
> Cc: Khem Raj <raj.khem@gmail.com>
> Cc: Martin Jansa <martin.jansa@gmail.com>
> Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  meta-oe/recipes-graphics/lvgl/lv-drivers.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-graphics/lvgl/lv-drivers.inc
> b/meta-oe/recipes-graphics/lvgl/lv-drivers.inc
> index dcf1ad14b..6cfb7fa07 100644
> --- a/meta-oe/recipes-graphics/lvgl/lv-drivers.inc
> +++ b/meta-oe/recipes-graphics/lvgl/lv-drivers.inc
> @@ -17,6 +17,8 @@ LVGL_CONFIG_USE_WAYLAND =3D
> "${@bb.utils.contains('PACKAGECONFIG', 'wayland', '1',
>  LVGL_CONFIG_WAYLAND_HOR_RES ?=3D "480"
>  LVGL_CONFIG_WAYLAND_VER_RES ?=3D "320"
>
> +ALLOW_EMPTY:${PN} =3D "1"
> +
>  EXTRA_OECMAKE +=3D "-Dinstall:BOOL=3DON -DLIB_INSTALL_DIR=3D${baselib}"
>
>  do_configure:append() {
> --
> 2.42.0
>
>

--00000000000040001a06080254b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">What issue does this actually fix?<div><br></div><div>Is i=
t related to=C2=A0<a href=3D"https://lists.openembedded.org/g/openembedded-=
core/message/188383">https://lists.openembedded.org/g/openembedded-core/mes=
sage/188383</a> ?</div><div><br></div><div>I&#39;m not fan of empty useless=
 packages created just to make package manager happy when something else ha=
s unfortunate dependency on them.</div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 18, 2023 at 8:12=E2=80=
=AFPM Marek Vasut &lt;<a href=3D"mailto:marex@denx.de">marex@denx.de</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The lv-=
drivers main package is empty, since all the headers end up<br>
in the -dev variant and static library archive ends up in -staticdev<br>
variant. Mark the main package as ALLOW_EMPTY.<br>
<br>
Signed-off-by: Marek Vasut &lt;<a href=3D"mailto:marex@denx.de" target=3D"_=
blank">marex@denx.de</a>&gt;<br>
---<br>
Cc: Fabio Estevam &lt;<a href=3D"mailto:festevam@denx.de" target=3D"_blank"=
>festevam@denx.de</a>&gt;<br>
Cc: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">ra=
j.khem@gmail.com</a>&gt;<br>
Cc: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_b=
lank">martin.jansa@gmail.com</a>&gt;<br>
Cc: Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bootlin.com=
" target=3D"_blank">michael.opdenacker@bootlin.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-graphics/lvgl/lv-drivers.inc | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta-oe/recipes-graphics/lvgl/lv-drivers.inc b/meta-oe/recipes=
-graphics/lvgl/lv-drivers.inc<br>
index dcf1ad14b..6cfb7fa07 100644<br>
--- a/meta-oe/recipes-graphics/lvgl/lv-drivers.inc<br>
+++ b/meta-oe/recipes-graphics/lvgl/lv-drivers.inc<br>
@@ -17,6 +17,8 @@ LVGL_CONFIG_USE_WAYLAND =3D &quot;${@bb.utils.contains(&#=
39;PACKAGECONFIG&#39;, &#39;wayland&#39;, &#39;1&#39;,<br>
=C2=A0LVGL_CONFIG_WAYLAND_HOR_RES ?=3D &quot;480&quot;<br>
=C2=A0LVGL_CONFIG_WAYLAND_VER_RES ?=3D &quot;320&quot;<br>
<br>
+ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
+<br>
=C2=A0EXTRA_OECMAKE +=3D &quot;-Dinstall:BOOL=3DON -DLIB_INSTALL_DIR=3D${ba=
selib}&quot;<br>
<br>
=C2=A0do_configure:append() {<br>
-- <br>
2.42.0<br>
<br>
</blockquote></div>

--00000000000040001a06080254b1--

