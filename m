Return-Path: <chris.chapuis@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39EC0C54E58
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 08:17:09 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web10.16342.1710490618991830752
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Mar 2024 01:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DncGnJ3w;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: chris.chapuis@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-366753f1477so11819015ab.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 01:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710490618; x=1711095418; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=issjQxx2rlTd/hWG6NjjJC5LEcmPyU3CgRGN+9wU6/8=;
        b=DncGnJ3wwwsqjq5CBgiQ4JxI4jPrYMsZo6Sa0sfEo4f8uslLWVakYZdIOIUm9RFrTx
         uZhUVz7GyyLvnnn/q2ODmYJotzguK52A0eeta5WKIdaRamChP5Zp+GQ8UIdQj2IjsNtr
         nOGWsRTeP/8bIHicCjzByMKlO18L4S6TPu1r29cjseHGpaNkelUo0sJCyPA34AknnY2+
         MMI+WIw2Jo6THOvgRx6tCl9ZPWsGyrbvrCUKzpLkGPnHmA6S/86mnmr5So1ptPGjiZ6N
         zqcjN5FVkvSeTtTPbuzqDjpaHxf4/PBAdcf2NLq4tdrEnSNrt6If3xF6XQ/eSo/Lb8+g
         9VwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710490618; x=1711095418;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=issjQxx2rlTd/hWG6NjjJC5LEcmPyU3CgRGN+9wU6/8=;
        b=D6DoCJPtA+Jb/N3hv96ke0kWieZ15GYxG2N6Vwt2UiPephcXuJTI93MEqe3LT/qdZu
         V2wMZoIwpuZfXUH48TX4wQ093JXBq1RXjtce2/WMqk/5HpGo000B1dDsvhvc9LSFU0BH
         pOgLVcTrResgCWX92ahSor1R2OyuEKrTmJyNPew8wfV1UGVUrNoPI6PzLeEvdwurYFLP
         95kd4LOpo5e/Ylm0aG+2COv6/cqcTu3pHl6BWxWCNq2z5lnzDgEv4RsIs/jaM58xQSoO
         e+cobii4f/nSEJp8znRvibJXcyab2asMeffHhsN4MM3u6wdLtbgxe3I+aCEcNWoU+bR+
         0Vig==
X-Gm-Message-State: AOJu0Yxvf9BXNweT8Ckrjc9IifHKt/1d03drOGlQ3WphjcmbUQgGc+hm
	JXie8eoVY+5YNANyhEk5/5gHcv/o3pzuBY7MBgzZ651sVixGHqnCF30xJ6hugsoe8oZlcvfSqT4
	HcV/YJgUbTcFUzLqUO/TEwi04iBUfg/nd
X-Google-Smtp-Source: AGHT+IHfbDl7a9KE8YUWiZcBfJXd+Ft0VNoR+rhLY0xHpUSvGrVvz6fxPmh6fjmxaPWKJTKT+ugOg1VFpeT6U12tYvo=
X-Received: by 2002:a05:6e02:d0d:b0:365:ee1:237b with SMTP id
 g13-20020a056e020d0d00b003650ee1237bmr3302539ilj.22.1710490618016; Fri, 15
 Mar 2024 01:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240314192153.202513-1-chris.chapuis@gmail.com>
 <20240314192153.202513-3-chris.chapuis@gmail.com> <e4c5e13d-be2c-4738-9d66-890f1cebaedc@denx.de>
In-Reply-To: <e4c5e13d-be2c-4738-9d66-890f1cebaedc@denx.de>
From: Christophe Chapuis <chris.chapuis@gmail.com>
Date: Fri, 15 Mar 2024 09:16:47 +0100
Message-ID: <CACA7eUQK6AZVnQDZteosHVmx1hHHsF=V9syg=+12iUYM_bHHaA@mail.gmail.com>
Subject: Re: [meta-oe][PATCHv2 3/3] lvgl: add more variables to lv-conf.inc
To: Marek Vasut <marex@denx.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000adc1820613aea190"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 08:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109335

--000000000000adc1820613aea190
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sure, I agree with your comments; I'll propose a patch v3 tonight or during
the week-end, taking all this into consideration.

On Fri, Mar 15, 2024 at 1:34=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:

> On 3/14/24 8:21 PM, Christophe Chapuis wrote:
> > As it can be usefull to customize these other variables, let's
> > add them in lv-conf.inc.
> >
> > Also, fix the install path to use ${PN} instead of "lvgl".
>
> Separate commit would be nice.
>
> btw when sending V3, please CC Khem and co. if you didn't yet.
>
> Also, I'll likely be sending LVGL 9.1 update next week, it should be out
> then.
>
> > Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
> > ---
> >   meta-oe/recipes-graphics/lvgl/lv-conf.inc | 49 +++++++++++++++-------=
-
> >   1 file changed, 33 insertions(+), 16 deletions(-)
> >
> > diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> > index cd14412e1..088842490 100644
> > --- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> > +++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> > @@ -12,8 +12,17 @@ LVGL_CONFIG_USE_SDL =3D
> "${@bb.utils.contains('PACKAGECONFIG', 'sdl', '1', '0', d)
> >   LVGL_CONFIG_SDL_FULLSCREEN ?=3D "0"
> >
> >   LVGL_CONFIG_LV_MEM_CUSTOM ?=3D "0"
> > +LVGL_CONFIG_LV_MEM_SIZE ?=3D "(64 * 1024U)"
> >   LVGL_CONFIG_LV_COLOR_DEPTH ?=3D "32"
> >
> > +LVGL_CONFIG_LV_USE_LOG    ?=3D "0"
> > +LVGL_CONFIG_LV_LOG_LEVEL  ?=3D "LV_LOG_LEVEL_WARN"
> > +LVGL_CONFIG_LV_LOG_PRINTF ?=3D "0"
> > +
> > +LVGL_CONFIG_LV_USE_FONT_COMPRESSED ?=3D "0"
> > +
> > +LVGL_CONFIG_LV_THEME_DEFAULT_DARK ?=3D "0"
> > +
> >   DEBUG_BUILD ??=3D "0"
> >
> >   ALLOW_EMPTY:${PN} =3D "1"
> > @@ -26,34 +35,42 @@ do_configure:append() {
> >
> >       sed -e "s|#if 0 .*Set it to \"1\" to enable content.*|#if 1 //
> Enabled by ${PN}|g" \
> >           \
> > -        -e "s|\(^#define LV_USE_LINUX_DRM \).*|#define LV_USE_LINUX_DR=
M
> ${LVGL_CONFIG_USE_DRM}|g" \
> > +        -e "s|\(^#define LV_USE_LINUX_DRM
> \).*|\1${LVGL_CONFIG_USE_DRM}|g" \
>
> I'd say, make this clean up a separate patch, otherwise this is
> difficult to review.
>
> Then, add the extra features on top.
>
> Thanks !
>

--000000000000adc1820613aea190
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sure, I agree with your comments; I&#39;ll propose a patch=
 v3 tonight or during the week-end, taking all this into consideration.<br>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Fri, Mar 15, 2024 at 1:34=E2=80=AFAM Marek Vasut &lt;<a href=3D"mailto:m=
arex@denx.de">marex@denx.de</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On 3/14/24 8:21 PM, Christophe Chapuis wrote:<br=
>
&gt; As it can be usefull to customize these other variables, let&#39;s<br>
&gt; add them in lv-conf.inc.<br>
&gt; <br>
&gt; Also, fix the install path to use ${PN} instead of &quot;lvgl&quot;.<b=
r>
<br>
Separate commit would be nice.<br>
<br>
btw when sending V3, please CC Khem and co. if you didn&#39;t yet.<br>
<br>
Also, I&#39;ll likely be sending LVGL 9.1 update next week, it should be ou=
t <br>
then.<br>
<br>
&gt; Signed-off-by: Christophe Chapuis &lt;<a href=3D"mailto:chris.chapuis@=
gmail.com" target=3D"_blank">chris.chapuis@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta-oe/recipes-graphics/lvgl/lv-conf.inc | 49 +++++++++++=
++++--------<br>
&gt;=C2=A0 =C2=A01 file changed, 33 insertions(+), 16 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recip=
es-graphics/lvgl/lv-conf.inc<br>
&gt; index cd14412e1..088842490 100644<br>
&gt; --- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc<br>
&gt; +++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc<br>
&gt; @@ -12,8 +12,17 @@ LVGL_CONFIG_USE_SDL =3D &quot;${@bb.utils.contains(=
&#39;PACKAGECONFIG&#39;, &#39;sdl&#39;, &#39;1&#39;, &#39;0&#39;, d)<br>
&gt;=C2=A0 =C2=A0LVGL_CONFIG_SDL_FULLSCREEN ?=3D &quot;0&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0LVGL_CONFIG_LV_MEM_CUSTOM ?=3D &quot;0&quot;<br>
&gt; +LVGL_CONFIG_LV_MEM_SIZE ?=3D &quot;(64 * 1024U)&quot;<br>
&gt;=C2=A0 =C2=A0LVGL_CONFIG_LV_COLOR_DEPTH ?=3D &quot;32&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +LVGL_CONFIG_LV_USE_LOG=C2=A0 =C2=A0 ?=3D &quot;0&quot;<br>
&gt; +LVGL_CONFIG_LV_LOG_LEVEL=C2=A0 ?=3D &quot;LV_LOG_LEVEL_WARN&quot;<br>
&gt; +LVGL_CONFIG_LV_LOG_PRINTF ?=3D &quot;0&quot;<br>
&gt; +<br>
&gt; +LVGL_CONFIG_LV_USE_FONT_COMPRESSED ?=3D &quot;0&quot;<br>
&gt; +<br>
&gt; +LVGL_CONFIG_LV_THEME_DEFAULT_DARK ?=3D &quot;0&quot;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0DEBUG_BUILD ??=3D &quot;0&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&gt; @@ -26,34 +35,42 @@ do_configure:append() {<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &quot;s|#if 0 .*Set it to \&quot;1\&q=
uot; to enable content.*|#if 1 // Enabled by ${PN}|g&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^#define LV_USE_LINUX_DRM \)=
.*|#define LV_USE_LINUX_DRM ${LVGL_CONFIG_USE_DRM}|g&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^#define LV_USE_LINUX_DRM \)=
.*|\1${LVGL_CONFIG_USE_DRM}|g&quot; \<br>
<br>
I&#39;d say, make this clean up a separate patch, otherwise this is <br>
difficult to review.<br>
<br>
Then, add the extra features on top.<br>
<br>
Thanks !<br>
</blockquote></div>

--000000000000adc1820613aea190--

