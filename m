Return-Path: <chris.chapuis@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D060CC54E5D
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 08:22:17 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web10.2845.1710577331959832836
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Mar 2024 01:22:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fdGxAYb9;
 spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: chris.chapuis@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3662feb90a8so17457025ab.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 01:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710577331; x=1711182131; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r3vIAbI2KLcaK3uQrOUNqhG0GEdINKmHe4jM4Fv9Ja0=;
        b=fdGxAYb9Pr5j5M++Gc/gLUpbfUqrXUVmQTKs0nUS+rhDtNuKNBWEkjGnboytdcARCn
         ZTvb40VCLd+zqKofzuxNStdFk8gKi/tA6tLo1xL8IS7HeqKAbqO6KumOQn+DZjTsGK42
         lfyL9/jSJp6Jz35BE7WUZRCzyfLC/WzKKcdkP7VDVY+Y0YOe5gsYRUL/2h2mpYGeGOSY
         4pRkbJI2w7va3ZFIEA2oiVy12UxLyyHHOJN2SvQoddTs2WjDIQ5ERiI2FyZFY5Kki/3v
         aXGzpVBlpqlkXN9Ju4Dz2Edgd8vxZksqfnfhQhVEcRyEV9VktdmlTKo6WrWT8n7gstXc
         GDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710577331; x=1711182131;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r3vIAbI2KLcaK3uQrOUNqhG0GEdINKmHe4jM4Fv9Ja0=;
        b=h8PEbbRwoaJvKMhBOOSwsyH1+I42yhe54YLy8kkd2+c1kid24Gz/GlQ1s6lLBP4V8B
         GDKAWDqaZlaW8hRjq0mtfqz9f6/xnZdSRMT1rG4etcsAWTJ+ftvUA97aZUcuGzAS7MrC
         iIetqQ06OOgy2ZkdDbmqPEtq6Pdu1aHCSxqpLVr5PMLuBFB+qzPNO1p4cZVfQO3+XbOR
         75bq8PoxKwenkBQF4u7Y9TZN30cMS7e2Y2nGdkpn6EYRX4DHbNsWflLECU3gnaSQOAqQ
         i9WHnUis6mbT8DlS6L1uNMkiq/ayp44K63MUc+GqoCpvxq8+tfQWkmLHgfNnCM5oGmEW
         Ovhw==
X-Gm-Message-State: AOJu0YwuVbhPTkUFReiJDjNkw92O9ZCPjMqMSx7+X54B6h8vmOV+7+6Q
	rtIux0H9ffOkr3B4CX1ZuP83UZ8CDoj5ngsknshGvdaZ9z2KT5HuWBpIlFXxDctjR0OGyypfRg3
	s0SUMCl3J9JYSSSzDwTjDFMG4bvM=
X-Google-Smtp-Source: AGHT+IFmEUfA23e3RzKusr9ge0hw6BOatZQWUztx2SINyrDavrH+3lnzSOfVZCAacjMgPzRbrSvzo8dTmjy8SsA/2lU=
X-Received: by 2002:a05:6e02:590:b0:366:a301:fde1 with SMTP id
 c16-20020a056e02059000b00366a301fde1mr2542733ils.11.1710577330922; Sat, 16
 Mar 2024 01:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240315180314.9111-1-chris.chapuis@gmail.com> <fa0889e8-cce7-46a0-8a27-41b807453bd5@denx.de>
In-Reply-To: <fa0889e8-cce7-46a0-8a27-41b807453bd5@denx.de>
From: Christophe Chapuis <chris.chapuis@gmail.com>
Date: Sat, 16 Mar 2024 09:21:59 +0100
Message-ID: <CACA7eUQ3aucjaAb897rRXS9AEt8x2nvedZzHnt9tijiO-QrLBw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v3 1/5] lvgl: fix typo in lv-conf.inc
To: Marek Vasut <marex@denx.de>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>, 
	Fabio Estevam <festevam@denx.de>, Martin Jansa <martin.jansa@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000002babe80613c2d216"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 08:22:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109353

--0000000000002babe80613c2d216
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 16, 2024 at 3:59=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:

> On 3/15/24 7:03 PM, Christophe Chapuis wrote:
> > Fix a typo in the first sed instruction, where the #if 0 is
> > never changed to #if 1 at the beginning of lv_conf.h.
> >
> > Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
> > ---
> >   meta-oe/recipes-graphics/lvgl/lv-conf.inc | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> > index cb676ac62..3dbdf769f 100644
> > --- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> > +++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> > @@ -24,7 +24,7 @@ do_configure:append() {
> >       # If there is a configuration template, start from that
> >       [ -r "${S}/lv_conf_template.h" ] && cp -Lv
> "${S}/lv_conf_template.h" "${S}/lv_conf.h"
> >
> > -    sed -e "s|#if 0 .*Set it to \"1\" to enable the content.*|#if 1 //
> Enabled by ${PN}|g" \
> > +    sed -e "s|#if 0 .*Set it to \"1\" to enable content.*|#if 1 //
> Enabled by ${PN}|g" \
>
> Just to be on the safe side, can you please check if this also modifies
> the lv_conf.h in lvgl-demo-fb recipe correctly ? (I think it does not,
>
>
It does not, but this won't be a problem: it's already activated in
lvgl-demo-fb's source code. More generally, if a lv_conf.h file already
exists, it means the app has already customized it a bit, so we can
consider it to be already active.

However, this pointed to a little issue I introduced: the do_install:append
for lv_conf.h is only needed for lvgl.bb, not for other recipes that use
lv-conf.inc. I'll move it to the main lvgl recipe.

I'll also generalize the sed instructions a bit more, to catch spaces and
tabs. So in the end, each sed line would look like this:
   -e "s|\(^[ \t]*#define LV_USE_ASSERT_OBJ[ \t]\).*|\1${DEBUG_BUILD}|g"

What is the preferred way to do this ? Do I do a v4, or do I add two more
patches?

--0000000000002babe80613c2d216
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sat, Mar 16, 2024 at 3:59=E2=80=AFAM Marek Vasut &lt;<a href=3D"m=
ailto:marex@denx.de" target=3D"_blank">marex@denx.de</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">On 3/15/24 7:03 PM, Chr=
istophe Chapuis wrote:<br>
&gt; Fix a typo in the first sed instruction, where the #if 0 is<br>
&gt; never changed to #if 1 at the beginning of lv_conf.h.<br>
&gt; <br>
&gt; Signed-off-by: Christophe Chapuis &lt;<a href=3D"mailto:chris.chapuis@=
gmail.com" target=3D"_blank">chris.chapuis@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta-oe/recipes-graphics/lvgl/lv-conf.inc | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recip=
es-graphics/lvgl/lv-conf.inc<br>
&gt; index cb676ac62..3dbdf769f 100644<br>
&gt; --- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc<br>
&gt; +++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc<br>
&gt; @@ -24,7 +24,7 @@ do_configure:append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# If there is a configuration template, star=
t from that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[ -r &quot;${S}/lv_conf_template.h&quot; ] &=
amp;&amp; cp -Lv &quot;${S}/lv_conf_template.h&quot; &quot;${S}/lv_conf.h&q=
uot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 sed -e &quot;s|#if 0 .*Set it to \&quot;1\&quot; to ena=
ble the content.*|#if 1 // Enabled by ${PN}|g&quot; \<br>
&gt; +=C2=A0 =C2=A0 sed -e &quot;s|#if 0 .*Set it to \&quot;1\&quot; to ena=
ble content.*|#if 1 // Enabled by ${PN}|g&quot; \<br>
<br>
Just to be on the safe side, can you please check if this also modifies <br=
>
the lv_conf.h in lvgl-demo-fb recipe correctly ? (I think it does not, <br>=
<br></blockquote><div><div><br></div><div>It does not, but this won&#39;t b=
e a problem: it&#39;s already activated in lvgl-demo-fb&#39;s source code. =
More generally, if a lv_conf.h file already exists, it means the app has al=
ready customized it a bit, so we can consider it to be already active.<br><=
/div><div><br></div><div>However, this pointed to a little issue I introduc=
ed: the do_install:append for lv_conf.h is only needed for <a href=3D"http:=
//lvgl.bb">lvgl.bb</a>, not for other recipes that use lv-conf.inc. I&#39;l=
l move it to the main lvgl recipe.</div><div></div></div><div><div dir=3D"l=
tr"><br><div>I&#39;ll also generalize the sed instructions a bit more, to c=
atch spaces and tabs. So in the end, each sed line would look like this:</d=
iv><div></div><div>=C2=A0=C2=A0 -e &quot;s|\(^[ \t]*#define=C2=A0LV_USE_ASS=
ERT_OBJ[ \t]\).*|\1${DEBUG_BUILD}|g&quot;</div><div><br></div><div>What is =
the preferred way to do this ? Do I do a v4, or do I add two more patches?<=
br></div></div></div><br></div>
</div>

--0000000000002babe80613c2d216--

