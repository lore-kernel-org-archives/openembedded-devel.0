Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 339AAC43334
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 17:35:25 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.952.1654104921339976680
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jun 2022 10:35:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NJnHOvr8;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id t2so2424169pld.4
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jun 2022 10:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JKCe/wxeTsDS9xKOJUHAbsisnlbnuCkaDiVoPXo4WUg=;
        b=NJnHOvr8G00G31s8nx1aZBg6b/4OB6IDrwXodVdEliZYEMrzjGiFuuouyH5JtBhiZQ
         mRHbVsA1uALMn82QturvRRj3B0d0IHIGw786WRTzaPhJWns3W2OGwUL6NEgEL1IbUUxr
         w4VzA2y4phq5iw47uoTyp0UBTAsrAea2C5hiGpbQvCROKtR2Vxbbh8W7tOroD0+TF1Zi
         5ePYppaYz3iuUCHFt/NkNq8liZOqExf4252nPy2vz8jKZ7adq/Bj1siSYKHZwYGQppkL
         t2KG+EaF+QJtQcJE1c//ldrn83lLy4N9TdM/A6JwYiImo4xA5S9PmzvU7l5eW/ZNpltz
         3QLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JKCe/wxeTsDS9xKOJUHAbsisnlbnuCkaDiVoPXo4WUg=;
        b=3POaeZoOyD2Vw/Xm31J22qwobBRf0kr483UOX5I3lPjbp0mnUSaxKkAuHxOBBnh86M
         EcfSLm0QSlgT3NqohBYrVMO888Vi1NJHs7SyQ4DNjiXnZlymzYD61Ep4sr3Hm5IqI68A
         yniPrgzitz4FtWtJCccmrlEi+7IBnMkT1RHXEwjj+uQazV23IKn1cLktRFeNDKgXCYMZ
         InPHXDKX5rOd8Sl5OQveDubufNiprT16QBHpLQPn5LCxQW+8RLXqAIU8LgEDMVQYW8Yy
         u1YbGBpquGLqnCKcZhzFO9zfpV8aWKj4uNavGRawTD2Txesb2mf9e+AO6Xc9FTjxlyWt
         M//g==
X-Gm-Message-State: AOAM530NjsAxCf0tR7TbhCg1e5Q4GYJ9fYYPOCH2LDTNpom/ynHShXx6
	BIMCZivclnPZPVRLBkp/FMzUrvRrLOiPIolBTRo=
X-Google-Smtp-Source: 
 ABdhPJxyewW/rhkIRfaPNSLKH/18Ssn++nhFmQjj2oCiBL7b5Jc6YfQ6uQyIGwFPIAbw98931mP0b8SOdR7k5OqLyD0=
X-Received: by 2002:a17:903:228c:b0:163:baf6:582a with SMTP id
 b12-20020a170903228c00b00163baf6582amr513214plh.43.1654104920554; Wed, 01 Jun
 2022 10:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220601122527.19987-1-ranjitsinhrathod1991@gmail.com>
 <20220601122527.19987-8-ranjitsinhrathod1991@gmail.com>
In-Reply-To: <20220601122527.19987-8-ranjitsinhrathod1991@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 1 Jun 2022 10:35:09 -0700
Message-ID: 
 <CANx9H-Ce6+LHoYajbb0ZmN55+qOV0RVYu5qDhi7vAp-kpSU-TQ@mail.gmail.com>
Subject: Re: [meta-python][dunfell][PATCH 8/9] python3-pillow: fix wheel build
To: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
	Armin Kuster <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>,
	Tim Orling <tim.orling@konsulko.com>,
 Trevor Gamblin <trevor.gamblin@windriver.com>,
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Content-Type: multipart/alternative; boundary="0000000000003602f105e066501b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Jun 2022 17:35:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97368

--0000000000003602f105e066501b
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 1, 2022 at 5:26 AM Ranjitsinh Rathod <
ranjitsinhrathod1991@gmail.com> wrote:

> From: Tim Orling <ticotimo@gmail.com>
>
> Recipe does not inherit pypi nor would PN resolve to the name of the
> wheel so we must set PIP_INSTALL_PACKAGE appropriately.
>
> The recipe also builds its wheel in ${S}/dist so we must set
> PIP_INSTALL_DIST_PATH appropriately.
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> (cherry picked from commit b56940049dfa1968d5e0325ea3b2fe024a3aa34b)
> Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
>

Nacked-by: Tim Orling <ticotimo@gmail.com>
NO. We do not do version upgrades in stable branches and the wheel
infrastructure is only supported in 'kirkstone'+.

You can create a mixin layer for the upgrade if you require a newer
version. But we WILL NOT take this into meta-openembedded/meta-python.



> ---
>  meta-python/recipes-devtools/python/python3-pillow_9.0.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pillow_9.0.0.bb
> b/meta-python/recipes-devtools/python/python3-pillow_9.0.0.bb
> index e522269927..346071d1ca 100644
> --- a/meta-python/recipes-devtools/python/python3-pillow_9.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pillow_9.0.0.bb
> @@ -13,6 +13,9 @@ SRCREV ?= "82541b6dec8452cb612067fcebba1c5a1a2bfdc8"
>
>  inherit setuptools3
>
> +PIP_INSTALL_PACKAGE = "Pillow"
> +PIP_INSTALL_DIST_PATH = "${S}/dist"
> +
>  DEPENDS += " \
>      zlib \
>      jpeg \
> --
> 2.17.1
>
>

--0000000000003602f105e066501b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 1, 2022 at 5:26 AM Ranjit=
sinh Rathod &lt;<a href=3D"mailto:ranjitsinhrathod1991@gmail.com">ranjitsin=
hrathod1991@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">From: Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.=
com" target=3D"_blank">ticotimo@gmail.com</a>&gt;<br>
<br>
Recipe does not inherit pypi nor would PN resolve to the name of the<br>
wheel so we must set PIP_INSTALL_PACKAGE appropriately.<br>
<br>
The recipe also builds its wheel in ${S}/dist so we must set<br>
PIP_INSTALL_DIST_PATH appropriately.<br>
<br>
Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" ta=
rget=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windrive=
r.com" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
(cherry picked from commit b56940049dfa1968d5e0325ea3b2fe024a3aa34b)<br>
Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rathod@kp=
it.com" target=3D"_blank">ranjitsinh.rathod@kpit.com</a>&gt;<br>
Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinhrathod1991=
@gmail.com" target=3D"_blank">ranjitsinhrathod1991@gmail.com</a>&gt;<br></b=
lockquote><div><br></div><div>Nacked-by: Tim Orling &lt;<a href=3D"mailto:t=
icotimo@gmail.com">ticotimo@gmail.com</a>&gt;</div><div>NO. We do not do ve=
rsion upgrades in stable branches and the wheel infrastructure is only supp=
orted in &#39;kirkstone&#39;+.</div><div><br></div><div>You can create a mi=
xin layer for the upgrade if you require a newer version. But we WILL NOT t=
ake this into meta-openembedded/meta-python.</div><div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-pillow_=
9.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pillow_9.0.0.bb</a> =
| 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pillow_9.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pillow_9.0.0.=
bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pill=
ow_9.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pillow_9.0.0.bb</=
a><br>
index e522269927..346071d1ca 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pillow_=
9.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pillow_9.0.0.bb</a><=
br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pillow_=
9.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pillow_9.0.0.bb</a><=
br>
@@ -13,6 +13,9 @@ SRCREV ?=3D &quot;82541b6dec8452cb612067fcebba1c5a1a2bfdc=
8&quot;<br>
<br>
=C2=A0inherit setuptools3<br>
<br>
+PIP_INSTALL_PACKAGE =3D &quot;Pillow&quot;<br>
+PIP_INSTALL_DIST_PATH =3D &quot;${S}/dist&quot;<br>
+<br>
=C2=A0DEPENDS +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0zlib \<br>
=C2=A0 =C2=A0 =C2=A0jpeg \<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div></div>

--0000000000003602f105e066501b--

