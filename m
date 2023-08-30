Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5EE3C6FA8F
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 17:32:19 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.837.1693416737176711684
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Aug 2023 10:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=seq53kS8;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3110ab7110aso5004759f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 10:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693416735; x=1694021535; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B6o4x8+9/SGI3sMa7AbhWM/+dPJjxPErpFGLTzbCRBc=;
        b=seq53kS8GWeF/wfOurblQ3Gp39POBGHpn64h/mS4fMLriYHhGWsiRWHwRd7+Q68pFp
         uAgXtpRecO2GD4uB7pAcFhkaKvQtbIOIO1kJ0LLnZ/UHdXer86sW4cTejfg/YpgXa4Hd
         iV8SpmJVKcqrDSjCTuyGTdo6SW0j+fp9lzbYQP7Xpab5tNzW65sgTR/Gada8xzvOTWWD
         inkYMUG1uQ4+7hhzVBxUkyiiVQjbC+yyfLB8/y6BJxrg1x5YRwnQfAdec3L5btrEQUks
         wMqcRzgqtVwZ/Ztzy4sy7iHlNiic6vhO7F3SmaOoNIAjPZgup5KGSDGs7HkJ58PN6Unm
         6TrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693416735; x=1694021535;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B6o4x8+9/SGI3sMa7AbhWM/+dPJjxPErpFGLTzbCRBc=;
        b=gqOrbba7z/sefzaDESe5eiO/kKXobFDaPzZ8WDNlqYdFBe3ROyojXrXFoi1NKbBPb/
         3XbsWSrkq2km3ObooPIcVz4Gju5LvwdJwzR2MKJ+OvvE+vbW6Ur9ExCEtOi96Nq7EzJB
         4fiTo6uH38EnECe1om2DbCi3XMzEN1YcJNLICaI2bazv4FSvsSDAgN/Rgz+bx+/jRx8Q
         WuyuGFCuBdXYgVP3k8os9cQ+INsWOcpUVO344mz3MrbZfH6YXC4UgEjevy4dGBWBhjHz
         C1kWgCyuoH3gOAVjIyp/MQpB19VEyax3p9byzuU+mDvEe9WVW8ndnLLtOp84ZcYyg4PY
         XMZQ==
X-Gm-Message-State: AOJu0Yy+mjgTJYWBFcoLRXZnqwfOqPQ6/HIcnmkckMPn6DGQKEdPXME4
	lCLufrJWTzm7k8+8FJejQs5PppMQWznl//t/ivCLybrOeWo=
X-Google-Smtp-Source: AGHT+IHxiv3v8KV9YeoO0hK4+mab7r4BHUxXrH71S6SIimN06KQJ2MpLRENbtiJ/6+2+hi/C7hB3Gm/7GtzIvRa3SY8=
X-Received: by 2002:a05:6000:10c7:b0:319:6ce2:e5a3 with SMTP id
 b7-20020a05600010c700b003196ce2e5a3mr2379898wrx.26.1693416734622; Wed, 30 Aug
 2023 10:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230830081550.1364085-1-f_l_k@t-online.de> <20230830081550.1364085-2-f_l_k@t-online.de>
In-Reply-To: <20230830081550.1364085-2-f_l_k@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 30 Aug 2023 19:31:50 +0200
Message-ID: <CA+chaQd+Qw8c+QkWGiw+G22Una0M955BxAvKi4Aoq9fevAeR9Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/3] spice-guest-vdagent: add missing dependencies
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ec888b0604274ed9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 17:32:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104678

--000000000000ec888b0604274ed9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

On Wed, Aug 30, 2023 at 10:16=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wr=
ote:

> add x11 to REQUIRED_DISTRO_FEATURES
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../recipes-support/spice/spice-guest-vdagent_0.22.1.bb       | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-networking/recipes-support/spice/
> spice-guest-vdagent_0.22.1.bb b/meta-networking/recipes-support/spice/
> spice-guest-vdagent_0.22.1.bb
> index b51e03899..3af973eed 100644
> --- a/meta-networking/recipes-support/spice/spice-guest-vdagent_0.22.1.bb
> +++ b/meta-networking/recipes-support/spice/spice-guest-vdagent_0.22.1.bb
> @@ -10,11 +10,11 @@ SRC_URI =3D "git://
> gitlab.freedesktop.org/spice/linux/vd_agent.git;protocol=3Dhttps;
>  S =3D "${WORKDIR}/git"
>
>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
> -REQUIRED_DISTRO_FEATURES =3D "opengl"
> +REQUIRED_DISTRO_FEATURES =3D "opengl x11"
>
>  inherit autotools pkgconfig features_check
>
> -DEPENDS =3D "glib-2.0 alsa-lib gtk4 dbus libdrm spice-protocol"
> +DEPENDS =3D "glib-2.0 alsa-lib gtk4 dbus libdrm spice-protocol libxfixes
> xrandr xinerama libx11"
>
>  EXTRA_OECONF =3D " \
>         --with-gtk4 \
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104663):
> https://lists.openembedded.org/g/openembedded-devel/message/104663
> Mute This Topic: https://lists.openembedded.org/mt/101048295/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ec888b0604274ed9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Acked-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@=
gmail.com">Martin.Jansa@gmail.com</a>&gt;<br></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 30, 2023 at 10:16=
=E2=80=AFAM Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-on=
line.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">add x11 to REQUIRED_DISTRO_FEATURES<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0.../recipes-support/spice/<a href=3D"http://spice-guest-vdagent_0.22.=
1.bb" rel=3D"noreferrer" target=3D"_blank">spice-guest-vdagent_0.22.1.bb</a=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta-networking/recipes-support/spice/<a href=3D"http://spice-=
guest-vdagent_0.22.1.bb" rel=3D"noreferrer" target=3D"_blank">spice-guest-v=
dagent_0.22.1.bb</a> b/meta-networking/recipes-support/spice/<a href=3D"htt=
p://spice-guest-vdagent_0.22.1.bb" rel=3D"noreferrer" target=3D"_blank">spi=
ce-guest-vdagent_0.22.1.bb</a><br>
index b51e03899..3af973eed 100644<br>
--- a/meta-networking/recipes-support/spice/<a href=3D"http://spice-guest-v=
dagent_0.22.1.bb" rel=3D"noreferrer" target=3D"_blank">spice-guest-vdagent_=
0.22.1.bb</a><br>
+++ b/meta-networking/recipes-support/spice/<a href=3D"http://spice-guest-v=
dagent_0.22.1.bb" rel=3D"noreferrer" target=3D"_blank">spice-guest-vdagent_=
0.22.1.bb</a><br>
@@ -10,11 +10,11 @@ SRC_URI =3D &quot;git://<a href=3D"http://gitlab.freede=
sktop.org/spice/linux/vd_agent.git;protocol=3Dhttps" rel=3D"noreferrer" tar=
get=3D"_blank">gitlab.freedesktop.org/spice/linux/vd_agent.git;protocol=3Dh=
ttps</a>;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0ANY_OF_DISTRO_FEATURES =3D &quot;${GTK3DISTROFEATURES}&quot;<br>
-REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;opengl x11&quot;<br>
<br>
=C2=A0inherit autotools pkgconfig features_check<br>
<br>
-DEPENDS =3D &quot;glib-2.0 alsa-lib gtk4 dbus libdrm spice-protocol&quot;<=
br>
+DEPENDS =3D &quot;glib-2.0 alsa-lib gtk4 dbus libdrm spice-protocol libxfi=
xes xrandr xinerama libx11&quot;<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-gtk4 \<br>
-- <br>
2.41.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#104663): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/104663" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/104663</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101048295/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101048295/3617156</a><br>
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

--000000000000ec888b0604274ed9--

