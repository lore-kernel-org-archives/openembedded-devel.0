Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B932C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 14:59:33 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.10220.1646924372666216105
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 06:59:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V4oVgjrX;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id p8so4667363qvg.12
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 06:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4M5qpQ54D/yHtenrX6Xe2M5XSwwDbWxgbdjSp3/BXhc=;
        b=V4oVgjrXpC4izdm35nlKKzXTQxVcUYrV/c0ooVMBZF4TCcz0evaY2PikivRGryzNdT
         hzQpyAq9tiT2hde1yStT7bk9uh5+RJaP20P2qKmUjT3FlMhGChS2teFTglxh2O3Pu0y2
         ztG9gKL/WVTtBgcXWvgoo433mMibp0nh1gdSASoAAjbqkeCfCePN9cRierg3d6nZhOIM
         u+chETEJ7jsavrKCqmt/a3bAnAWLpN719tA685RfCvM2bIVfQuGgIzS9HMx9oQTv8zt1
         ExsiiKh8/dabh+QqDm+R6y6yaUhDLW4Hpq3g1cJ7mqB+w992MiRlCV1pUbwymcpoIpQE
         NQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4M5qpQ54D/yHtenrX6Xe2M5XSwwDbWxgbdjSp3/BXhc=;
        b=2gSZau5knESbadyHdUDGl6sg8UQXNhkUH4gcBcADYOcmxdIuJ6ILu6N90RGb/DDyxd
         29uLYfJgjGmqzOqYmduqMWeu540NGZFcoKZb9RTagxJpXitufJJNQX6tORYOEg7k+JIA
         WD3Ucm6p7LjrpsTujWUgJNAy7IiXB34v+HFekFLV4xNIr0dgoZFYG5T1v0GYOZGcE2xQ
         AVVyXNVioW5pYS/hm7jugELQTdIGo9dr5fpA/9mOgiV5rvrDn5fQH0moscT1Ksq4MJ6h
         +gM0gaxhJajZ+2NWBvhX/uQIw5HL7v3DQ9wPdXxOj8PWuS47F9AKafaVn0v6xpUDXrJ0
         bNQg==
X-Gm-Message-State: AOAM531NlolOo+QzDmGr02sJXixu5ycX10f/A4dxxgcaKEas9+BDX0i0
	ZBcpJVrx/4fYJ0yt187l/rsoDNM0Z/BvfN/20u5jATQBZ0Y=
X-Google-Smtp-Source: 
 ABdhPJz6iLyWNLQbDFluiEkThRV07vkuIqpTjhex1EloQPRmk9E4PRGhCMEH5pDt3HKgCO/cqiUM920vV7zUj0jPgU4=
X-Received: by 2002:ad4:5def:0:b0:435:ac38:a77e with SMTP id
 jn15-20020ad45def000000b00435ac38a77emr4122103qvb.24.1646924371572; Thu, 10
 Mar 2022 06:59:31 -0800 (PST)
MIME-Version: 1.0
References: <20220309190543.664728-1-raj.khem@gmail.com>
 <20220309190543.664728-2-raj.khem@gmail.com>
 <CAAnfSTsww2=Oov01mJR4JhvmVq9WC+Wz9=RFyUn3iZbR+Yq2bQ@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTsww2=Oov01mJR4JhvmVq9WC+Wz9=RFyUn3iZbR+Yq2bQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Mar 2022 06:59:20 -0800
Message-ID: 
 <CAMKF1sp0+fFtvx=7M=6rNifcAudH=U7fYLYM1Op6SyVMmjCSQA@mail.gmail.com>
Subject: Re: [oe] [meta-xfce][PATCH 2/2] catfish: Do not set PYPA_WHEEL
To: Ross Burton <ross@burtonini.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000023ba3d05d9de7607"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Mar 2022 14:59:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95932

--00000000000023ba3d05d9de7607
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 10, 2022 at 1:31 AM Ross Burton <ross@burtonini.com> wrote:

> Ah, if those patches have landed I can send my patchbomb to meta-oe :)
>

Ok


> Ross
>
> On Wed, 9 Mar 2022 at 19:05, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > OE-Core has addressed the pertaining issue which does not require
> > setting this here anymore
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb
> b/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb
> > index 6aa5ae8c30..27a807be29 100644
> > --- a/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb
> > +++ b/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb
> > @@ -4,7 +4,6 @@ LICENSE = "GPL-2.0-only"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
> >
> >  inherit xfce-app setuptools_build_meta gtk-icon-cache mime-xdg
> > -PYPA_WHEEL = "${B}/dist/UNKNOWN-*-*.whl"
> >
> >  DEPENDS += "python3-distutils-extra-native"
> >
> > --
> > 2.35.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#95911):
> https://lists.openembedded.org/g/openembedded-devel/message/95911
> > Mute This Topic: https://lists.openembedded.org/mt/89669707/1676615
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ross@burtonini.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--00000000000023ba3d05d9de7607
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Mar 10, 2022 at 1:31 AM Ross Burton &lt;<a href=3D"=
mailto:ross@burtonini.com">ross@burtonini.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">Ah, if those patches have landed I can send my pa=
tchbomb to meta-oe :)<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Ok</div><div dir=
=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Ross<br>
<br>
On Wed, 9 Mar 2022 at 19:05, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; OE-Core has addressed the pertaining issue which does not require<br>
&gt; setting this here anymore<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-xfce/recipes-apps/catfish/<a href=3D"http://catfish_4.16.3.=
bb" rel=3D"noreferrer" target=3D"_blank">catfish_4.16.3.bb</a> | 1 -<br>
&gt;=C2=A0 1 file changed, 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta-xfce/recipes-apps/catfish/<a href=3D"http://catfish_=
4.16.3.bb" rel=3D"noreferrer" target=3D"_blank">catfish_4.16.3.bb</a> b/met=
a-xfce/recipes-apps/catfish/<a href=3D"http://catfish_4.16.3.bb" rel=3D"nor=
eferrer" target=3D"_blank">catfish_4.16.3.bb</a><br>
&gt; index 6aa5ae8c30..27a807be29 100644<br>
&gt; --- a/meta-xfce/recipes-apps/catfish/<a href=3D"http://catfish_4.16.3.=
bb" rel=3D"noreferrer" target=3D"_blank">catfish_4.16.3.bb</a><br>
&gt; +++ b/meta-xfce/recipes-apps/catfish/<a href=3D"http://catfish_4.16.3.=
bb" rel=3D"noreferrer" target=3D"_blank">catfish_4.16.3.bb</a><br>
&gt; @@ -4,7 +4,6 @@ LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4325afd396febcb6=
59c36b49533135d4&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit xfce-app setuptools_build_meta gtk-icon-cache mime-xdg<b=
r>
&gt; -PYPA_WHEEL =3D &quot;${B}/dist/UNKNOWN-*-*.whl&quot;<br>
&gt;<br>
&gt;=C2=A0 DEPENDS +=3D &quot;python3-distutils-extra-native&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.35.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#95911): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/95911" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lists.openembedded.org/g/openembedded-devel/message/95911</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89669707=
/1676615" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/89669707/1676615</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ross@burtonini.com"=
 target=3D"_blank">ross@burtonini.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--00000000000023ba3d05d9de7607--

