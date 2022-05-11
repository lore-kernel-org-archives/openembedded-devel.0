Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 649D5C433EF
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 15:25:18 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web09.776.1652282709180329169
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 May 2022 08:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112
 header.b=FYRgjPa1;
 spf=pass (domain: baylibre.com, ip: 209.85.208.180,
 mailfrom: jstephan@baylibre.com)
Received: by mail-lj1-f180.google.com with SMTP id l19so3054748ljb.7
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 May 2022 08:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TjElqP5jJHEBdpUVW5Bx3gJXO+Ba3VGtxHJqRQcpL5o=;
        b=FYRgjPa1OQryI6agcGv/3xZ8yF/MOsz1ZWMB0+57mmEVUF9O5MwZ7bUhxApn/ZxDQy
         Fk6x0ahFDa7axSx4f4Ybv9BV3AUXnVp+hmfV5WgEXZp+D6hQYkqF4JgN2F82j9HeOohF
         rmGLuI5m2oiUrn0tfdHm+OuWTFpcpz3oEEfpno3Vrq9OhHD/0wRUR+sY9DglWWFAtrly
         M53KbZXtzovvMxP2I7nUcD7fZyL9G7k9vcbwFxZQV0nA6HDHNw43Xg9HLrlY/v8pG+pK
         lMPuMehX1fwibPi77jYuOrAKi/NhPImCgTbmaYGNLqDGaVgljiUe4rCbXwRGScDWcja5
         4+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TjElqP5jJHEBdpUVW5Bx3gJXO+Ba3VGtxHJqRQcpL5o=;
        b=OlSloQv0mvPc/t+fS/dmROpLmNWxVfEx+GM90tF50PI/p19fOGtddQUOoJ2gjPK3/f
         byXpqVQ9pKXmh0gNS8FMusZ/nbKdxaZcYHx7QxW7O11jpJOsDH0h0XkaTv2KdNy51DkN
         68PGvhxwcUm3SoHCXYSKj8x96SglLQ2zYydWeS6FFowrGJIqHDs0yuXzyC7GU6YMhfh/
         g6UInIBBodWfuNmgwGuxXUM0j68zyFxlBw772IhtSDPguRn5J5eGna9S1ih09ZhDT1ef
         /boxgdOxhtV8mHFjnAFk55ExM/0ozrieJ9BabTITTh0cWy+0pYvjwoSpWi0MT7pU20gK
         9QAw==
X-Gm-Message-State: AOAM532jWT5nr69PGag7XozoFJgQvtAqZhuc/KM5YGAtdN0Ix8vwB/sT
	QBhpBGmjYKIenym2OwN3PBSPC3sLNN9iZlYaHRSqvg==
X-Google-Smtp-Source: 
 ABdhPJxXJg0rjg/cqLzzEaruz8tba8AdUkdFovUzKb9RhWGwUUR6FaPGLrnqdQWgLntWgNGT3DeFnDNCaua+7G5HFfo=
X-Received: by 2002:a2e:8798:0:b0:24f:12ec:5268 with SMTP id
 n24-20020a2e8798000000b0024f12ec5268mr16783346lji.367.1652282707187; Wed, 11
 May 2022 08:25:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220511081409.3437145-1-jstephan@baylibre.com>
 <4429f4ed-3b2c-20dd-4356-37c5fb0b6bf6@linux.intel.com>
 <CAMKF1spKcrzPWZvZBGFbneFcrpcSgbEw3jEAk8aMGvNAksvmmA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spKcrzPWZvZBGFbneFcrpcSgbEw3jEAk8aMGvNAksvmmA@mail.gmail.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 11 May 2022 17:23:12 +0200
Message-ID: 
 <CAEHHSvbov0G=RDG_jLXrKG5+y55r5uO64v_THCpHMpnJL2+vAQ@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][kirkstone][PATCH] libcamera: fix packaging
To: Khem Raj <raj.khem@gmail.com>
Cc: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d4aecb05debe0b89"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 May 2022 15:25:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97041

--000000000000d4aecb05debe0b89
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 11 mai 2022 =C3=A0 17:20, Khem Raj <raj.khem@gmail.com> a =C3=A9cri=
t :

> On Wed, May 11, 2022 at 8:17 AM Jiaqing Zhao
> <jiaqing.zhao@linux.intel.com> wrote:
> >
> > On 2022-05-11 16:14, Julien STEPHAN wrote:
> > > libcamera.so.0 and libcamera-base.so.0 are packaged in ${PN}-dev
> although
> > > they should be packaged in ${PN}. See poky/meta/conf/bitbake.conf.
> > > This trigger the following error when trying to run the `cam` utility
> > > (packaged inside ${PN}):
> > >
> > > $ cam -l
> > > cam: error while loading shared libraries: libcamera.so.0: cannot ope=
n
> shared object file: No such file or directory
> > >
> > > $ read-elf -d /usr/bin/cam
> > > Dynamic section at offset 0x2c740 contains 37 entries:
> > >   Tag        Type                         Name/Value
> > >  0x0000000000000001 (NEEDED)             Shared library:
> [libcamera.so.0]
> > >  0x0000000000000001 (NEEDED)             Shared library:
> [libcamera-base.so.0]
> > > [...]
> > >
> > > So package libcamera is broken and need to be installed along with
> > > libcamera-dev to be functionnal. Fix it by packaging libcamera.so.0 a=
nd
> > > libcamera-base.so.0 into ${PN}
> > >
> > > Signed-off-by: Julien STEPHAN <jstephan@baylibre.com>
> > > ---
> > >  meta-multimedia/recipes-multimedia/libcamera/libcamera.bb | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.b=
b
> b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> > > index 713626069..0b9f3f7a5 100644
> > > --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> > > +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> > > @@ -64,10 +64,10 @@ do_recalculate_ipa_signatures_package() {
> > >
> > >  FILES:${PN}-dev =3D "${includedir} ${libdir}/pkgconfig"
> > >  FILES:${PN}-dev +=3D " ${libdir}/libcamera.so"
> >
> > Maybe this should also be added to be packaged in ${PN}, this should be
> a link to libcamera.so.0.0.0
>
> .so are normally dev symlinks, so this should be fine as long as it is
> not used as unversioned lib.
>
> yes, agree with you. No need for .so to be in ${PN}

> >
> > > -FILES:${PN}-dev +=3D " ${libdir}/libcamera.so.0"
> > > +FILES:${PN} +=3D " ${libdir}/libcamera.so.0"
> > >  FILES:${PN} +=3D " ${libdir}/libcamera.so.0.0.0"
> > >  FILES:${PN}-dev +=3D " ${libdir}/libcamera-base.so"
> >
> > Also this one
> >
> > > -FILES:${PN}-dev +=3D " ${libdir}/libcamera-base.so.0"
> > > +FILES:${PN} +=3D " ${libdir}/libcamera-base.so.0"
> > >  FILES:${PN} +=3D " ${libdir}/libcamera-base.so.0.0.0"
> > >  FILES:${PN} +=3D " ${libdir}/v4l2-compat.so"
> > >  FILES:${PN}-gst =3D "${libdir}/gstreamer-1.0/libgstlibcamera.so"
> > >
> > >
> > >
> > >
> > >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#97037):
> https://lists.openembedded.org/g/openembedded-devel/message/97037
> > Mute This Topic: https://lists.openembedded.org/mt/91031240/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000d4aecb05debe0b89
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 11 mai 2022 =C3=A0=C2=A0=
17:20, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Wed, May 11, 2022 at 8:17 AM Jiaqing Zhao<br>
&lt;<a href=3D"mailto:jiaqing.zhao@linux.intel.com" target=3D"_blank">jiaqi=
ng.zhao@linux.intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 2022-05-11 16:14, Julien STEPHAN wrote:<br>
&gt; &gt; libcamera.so.0 and libcamera-base.so.0 are packaged in ${PN}-dev =
although<br>
&gt; &gt; they should be packaged in ${PN}. See poky/meta/conf/bitbake.conf=
.<br>
&gt; &gt; This trigger the following error when trying to run the `cam` uti=
lity<br>
&gt; &gt; (packaged inside ${PN}):<br>
&gt; &gt;<br>
&gt; &gt; $ cam -l<br>
&gt; &gt; cam: error while loading shared libraries: libcamera.so.0: cannot=
 open shared object file: No such file or directory<br>
&gt; &gt;<br>
&gt; &gt; $ read-elf -d /usr/bin/cam<br>
&gt; &gt; Dynamic section at offset 0x2c740 contains 37 entries:<br>
&gt; &gt;=C2=A0 =C2=A0Tag=C2=A0 =C2=A0 =C2=A0 =C2=A0 Type=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Na=
me/Value<br>
&gt; &gt;=C2=A0 0x0000000000000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Shared library: [libcamera.so.0]<br>
&gt; &gt;=C2=A0 0x0000000000000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Shared library: [libcamera-base.so.0]<br>
&gt; &gt; [...]<br>
&gt; &gt;<br>
&gt; &gt; So package libcamera is broken and need to be installed along wit=
h<br>
&gt; &gt; libcamera-dev to be functionnal. Fix it by packaging libcamera.so=
.0 and<br>
&gt; &gt; libcamera-base.so.0 into ${PN}<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Julien STEPHAN &lt;<a href=3D"mailto:jstephan@bayl=
ibre.com" target=3D"_blank">jstephan@baylibre.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta-multimedia/recipes-multimedia/libcamera/<a href=3D"htt=
p://libcamera.bb" rel=3D"noreferrer" target=3D"_blank">libcamera.bb</a> | 4=
 ++--<br>
&gt; &gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-multimedia/recipes-multimedia/libcamera/<a href=
=3D"http://libcamera.bb" rel=3D"noreferrer" target=3D"_blank">libcamera.bb<=
/a> b/meta-multimedia/recipes-multimedia/libcamera/<a href=3D"http://libcam=
era.bb" rel=3D"noreferrer" target=3D"_blank">libcamera.bb</a><br>
&gt; &gt; index 713626069..0b9f3f7a5 100644<br>
&gt; &gt; --- a/meta-multimedia/recipes-multimedia/libcamera/<a href=3D"htt=
p://libcamera.bb" rel=3D"noreferrer" target=3D"_blank">libcamera.bb</a><br>
&gt; &gt; +++ b/meta-multimedia/recipes-multimedia/libcamera/<a href=3D"htt=
p://libcamera.bb" rel=3D"noreferrer" target=3D"_blank">libcamera.bb</a><br>
&gt; &gt; @@ -64,10 +64,10 @@ do_recalculate_ipa_signatures_package() {<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 FILES:${PN}-dev =3D &quot;${includedir} ${libdir}/pkgconfig=
&quot;<br>
&gt; &gt;=C2=A0 FILES:${PN}-dev +=3D &quot; ${libdir}/libcamera.so&quot;<br=
>
&gt;<br>
&gt; Maybe this should also be added to be packaged in ${PN}, this should b=
e a link to libcamera.so.0.0.0<br>
<br>
.so are normally dev symlinks, so this should be fine as long as it is<br>
not used as unversioned lib.<br>
<br></blockquote><div>yes, agree with you. No need for .so to be in ${PN} <=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; &gt; -FILES:${PN}-dev +=3D &quot; ${libdir}/libcamera.so.0&quot;<br>
&gt; &gt; +FILES:${PN} +=3D &quot; ${libdir}/libcamera.so.0&quot;<br>
&gt; &gt;=C2=A0 FILES:${PN} +=3D &quot; ${libdir}/libcamera.so.0.0.0&quot;<=
br>
&gt; &gt;=C2=A0 FILES:${PN}-dev +=3D &quot; ${libdir}/libcamera-base.so&quo=
t;<br>
&gt;<br>
&gt; Also this one<br>
&gt;<br>
&gt; &gt; -FILES:${PN}-dev +=3D &quot; ${libdir}/libcamera-base.so.0&quot;<=
br>
&gt; &gt; +FILES:${PN} +=3D &quot; ${libdir}/libcamera-base.so.0&quot;<br>
&gt; &gt;=C2=A0 FILES:${PN} +=3D &quot; ${libdir}/libcamera-base.so.0.0.0&q=
uot;<br>
&gt; &gt;=C2=A0 FILES:${PN} +=3D &quot; ${libdir}/v4l2-compat.so&quot;<br>
&gt; &gt;=C2=A0 FILES:${PN}-gst =3D &quot;${libdir}/gstreamer-1.0/libgstlib=
camera.so&quot;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#97037): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/97037" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lists.openembedded.org/g/openembedded-devel/message/97037</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91031240=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/91031240/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--000000000000d4aecb05debe0b89--

