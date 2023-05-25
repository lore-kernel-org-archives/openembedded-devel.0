Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87EDFC77B7E
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 19:03:21 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.19889.1685041391651968330
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 May 2023 12:03:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=mXY2xBnV;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f60b3f32b4so7390595e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 12:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685041390; x=1687633390;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aMnaz+zNZ52pYJavCSv/+Y6sj0fy9w845YoqGNdN8ys=;
        b=mXY2xBnVf3Ngu8EymoAu5F4jCq3lcd53nnKj3Qp7xy6iApUPu8E7UX6ACuvqwbEB6s
         aC0HBcBzP8jk+YYLtcCDxBsfXp7k0+lUCy7hnJR/hSqdsFVC0QBJgnQA2n+HOiRAA36e
         1+82gmc+TclrAylrH9ioKyj6FEcLOTxQe5u5z4QNKRzkWfV47wR7bk5YEfd5obSPhhwG
         PvJCMrUhURNplhqfLrz/Xs+X8tCBfCAtcXp3/jzviGdAgrrVrlMAiG1Pw6Ys9TzazU2Z
         P51rdP+bJMXJFQSjKPgvL1C1VlYjxp56altNDVKjUKP4ghIWAKrcIkkBzXdYGWeSr7dh
         86wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685041390; x=1687633390;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aMnaz+zNZ52pYJavCSv/+Y6sj0fy9w845YoqGNdN8ys=;
        b=hCI1sjYaBQZdB/J31E+ynUKQicmw6De4ljxLEc4W/LhmQZ+7TQcvOYyqe7TLwqCzQz
         GEy2Xs+A3RUcGcJvH6XNYc/EO7cuOB48Jx8IWZd79e42lnY0w90fdATF9FkIXmorN+BR
         chr9HR1Ffi3ykzOUrtbkeHQixYYCJtd1KmyOM3H9Dh25MDH8eXSiNoYuZ0iV9OgpPNHh
         EfxA7jeJ1rvYjVFSZoD7qmDdrv+lyvk42R70bldMVxP5IlUxM88bIsSGR3AMZ1JhTZHt
         wLLPKNBhcmzA0TYRYtNo6GQ5O83mm0hTBORGb7rgOqx3oWSBk2LgSBKKNX0zygSlvcEA
         3mzQ==
X-Gm-Message-State: AC+VfDwh0SNZK+P+b9B2nm5+yhQXgVjYOHTreeYeBkX4N7J3p8h6pfue
	icUovXpZZxI3uYcHQdlJiVcQveaItk0k2qEj788=
X-Google-Smtp-Source: ACHHUZ5RkzcP9P0GJ8qe7GjmJ0cYsozOjSeUud3RKzusdYMWhaww08VjZcmzNJf1NkuQTy9pxpeuMIMiYUmGwIOjxp4=
X-Received: by 2002:a7b:ce87:0:b0:3f4:2327:53c2 with SMTP id
 q7-20020a7bce87000000b003f4232753c2mr3472383wmj.19.1685041389814; Thu, 25 May
 2023 12:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230524171438.122588-1-ross.burton@arm.com> <20230524171438.122588-3-ross.burton@arm.com>
 <CAMKF1soXa-2H8=mdoMURtW5E1Jfh7hHvXy5zHgBQT6PXKbJ2=g@mail.gmail.com> <4EC547BC-CAD7-4004-B434-B09C911653C4@arm.com>
In-Reply-To: <4EC547BC-CAD7-4004-B434-B09C911653C4@arm.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 25 May 2023 21:02:54 +0200
Message-ID: <CA+chaQfZ2ZiKf6T3NMomZ_sfSEj5PutA-XcDC6UvyH5LOafc6g@mail.gmail.com>
Subject: Re: [oe] [PATCH 3/6] firewalld: add features_check on gobject-introspection-data
To: Ross Burton <ross.burton@arm.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000078ca6205fc894550"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 19:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102860

--00000000000078ca6205fc894550
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, now I see only the dbusmock in oe-core issue in my world builds.

On Thu, May 25, 2023 at 2:15=E2=80=AFPM Ross Burton <ross.burton@arm.com> w=
rote:

> I did a world build with G-I disabled, patch bomb sent.
>
> Ross
>
> > On 25 May 2023, at 00:07, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > I see some more fallouts with this
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2772
> >
> > On Wed, May 24, 2023 at 10:14=E2=80=AFAM Ross Burton <ross.burton@arm.c=
om>
> wrote:
> >>
> >> From: Ross Burton <ross.burton@arm.com>
> >>
> >> This project uses gobject-introspection, so depend on the
> DISTRO_FEATURE.
> >>
> >> Signed-off-by: Ross Burton <ross.burton@arm.com>
> >> ---
> >> .../recipes-connectivity/firewalld/firewalld_1.2.0.bb         | 4 +++-
> >> 1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git
> a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewal=
ld/
> firewalld_1.2.0.bb
> b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewal=
ld/
> firewalld_1.2.0.bb
> >> index 987cc640e1..8efbd39f74 100644
> >> ---
> a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewal=
ld/
> firewalld_1.2.0.bb
> >> +++
> b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewal=
ld/
> firewalld_1.2.0.bb
> >> @@ -15,7 +15,9 @@ SRC_URI[sha256sum] =3D
> "28fd90e88bda0dfd460f370f353474811b2e295d7eb27f0d7d18ffa3d7
> >> # glib-2.0-native is needed for GSETTINGS_RULES autoconf macro from
> gsettings.m4
> >> DEPENDS =3D "intltool-native glib-2.0-native nftables"
> >>
> >> -inherit gettext autotools-brokensep bash-completion pkgconfig
> python3native python3-dir gsettings systemd update-rc.d ptest
> >> +inherit gettext autotools-brokensep bash-completion pkgconfig
> python3native python3-dir gsettings systemd update-rc.d ptest features_ch=
eck
> >> +
> >> +REQUIRED_DISTRO_FEATURES =3D "gobject-introspection"
> >>
> >> PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', =
d)}"
> >> PACKAGECONFIG[systemd] =3D
> "--with-systemd-unitdir=3D${systemd_system_unitdir},--disable-systemd"
> >> --
> >> 2.34.1
> >>
> >>
> >>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102858):
> https://lists.openembedded.org/g/openembedded-devel/message/102858
> Mute This Topic: https://lists.openembedded.org/mt/99113395/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000078ca6205fc894550
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, now I see only the dbusmock in oe-core issue in my=
 world builds.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, May 25, 2023 at 2:15=E2=80=AFPM Ross Burton &lt;<a =
href=3D"mailto:ross.burton@arm.com">ross.burton@arm.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">I did a world build =
with G-I disabled, patch bomb sent.<br>
<br>
Ross<br>
<br>
&gt; On 25 May 2023, at 00:07, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; <br>
&gt; I see some more fallouts with this<br>
&gt; <br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/88/=
builds/2772" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yocto=
project.org/typhoon/#/builders/88/builds/2772</a><br>
&gt; <br>
&gt; On Wed, May 24, 2023 at 10:14=E2=80=AFAM Ross Burton &lt;<a href=3D"ma=
ilto:ross.burton@arm.com" target=3D"_blank">ross.burton@arm.com</a>&gt; wro=
te:<br>
&gt;&gt; <br>
&gt;&gt; From: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt;&gt; <br>
&gt;&gt; This project uses gobject-introspection, so depend on the DISTRO_F=
EATURE.<br>
&gt;&gt; <br>
&gt;&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.c=
om" target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; .../recipes-connectivity/firewalld/<a href=3D"http://firewalld_1.2=
.0.bb" rel=3D"noreferrer" target=3D"_blank">firewalld_1.2.0.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 +++-<br>
&gt;&gt; 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt;&gt; <br>
&gt;&gt; diff --git a/meta-networking/dynamic-layers/meta-python/recipes-co=
nnectivity/firewalld/<a href=3D"http://firewalld_1.2.0.bb" rel=3D"noreferre=
r" target=3D"_blank">firewalld_1.2.0.bb</a> b/meta-networking/dynamic-layer=
s/meta-python/recipes-connectivity/firewalld/<a href=3D"http://firewalld_1.=
2.0.bb" rel=3D"noreferrer" target=3D"_blank">firewalld_1.2.0.bb</a><br>
&gt;&gt; index 987cc640e1..8efbd39f74 100644<br>
&gt;&gt; --- a/meta-networking/dynamic-layers/meta-python/recipes-connectiv=
ity/firewalld/<a href=3D"http://firewalld_1.2.0.bb" rel=3D"noreferrer" targ=
et=3D"_blank">firewalld_1.2.0.bb</a><br>
&gt;&gt; +++ b/meta-networking/dynamic-layers/meta-python/recipes-connectiv=
ity/firewalld/<a href=3D"http://firewalld_1.2.0.bb" rel=3D"noreferrer" targ=
et=3D"_blank">firewalld_1.2.0.bb</a><br>
&gt;&gt; @@ -15,7 +15,9 @@ SRC_URI[sha256sum] =3D &quot;28fd90e88bda0dfd460=
f370f353474811b2e295d7eb27f0d7d18ffa3d7<br>
&gt;&gt; # glib-2.0-native is needed for GSETTINGS_RULES autoconf macro fro=
m gsettings.m4<br>
&gt;&gt; DEPENDS =3D &quot;intltool-native glib-2.0-native nftables&quot;<b=
r>
&gt;&gt; <br>
&gt;&gt; -inherit gettext autotools-brokensep bash-completion pkgconfig pyt=
hon3native python3-dir gsettings systemd update-rc.d ptest<br>
&gt;&gt; +inherit gettext autotools-brokensep bash-completion pkgconfig pyt=
hon3native python3-dir gsettings systemd update-rc.d ptest features_check<b=
r>
&gt;&gt; +<br>
&gt;&gt; +REQUIRED_DISTRO_FEATURES =3D &quot;gobject-introspection&quot;<br=
>
&gt;&gt; <br>
&gt;&gt; PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&=
#39;, &#39;systemd&#39;, d)}&quot;<br>
&gt;&gt; PACKAGECONFIG[systemd] =3D &quot;--with-systemd-unitdir=3D${system=
d_system_unitdir},--disable-systemd&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.34.1<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; <br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#102858): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/102858" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/102858</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99113395/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/99113395/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000078ca6205fc894550--

