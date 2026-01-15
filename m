Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A513BD44C71
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 16:06:34 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39442.1768493184471951472
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jan 2026 08:06:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dvGJvc/e;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79274e0e56bso10442637b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 08:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768493183; x=1769097983; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=irMrKb+DE8rjg6FOlqGlC1OwoKa9d0vxbCpSJr1y4Bo=;
        b=dvGJvc/ePGhDBZpZHy8qa9ipxd3dzRcgdxWxB9SSqJ/aOYrnXBYLzkuYQ8fsY6JoA9
         7RtkMvaCTSnZvMJi1X2K2mdWFtl8xtubwOTtwgyVBvL5zmn+OE8uwf99TPrcdHHveE1O
         RK4lEoAFvQjpDN4taXOhYpKIWp+b3DjsooEX81sLoSimnNzo9Xh0G+6qRwU3gT9jmODs
         hQ9LNqtkLvDory71XX2z5eN+bkjMlk3SNr7Uqbgo90EotbfuuWRKyi1tT5ee2nyGCvUS
         oArcFq8rjfVdfcxEwqQbHTxv5RfMhG2354U5ZQlEknZDis+RXGxYTJWWpy1V/zkBQLKo
         phdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768493183; x=1769097983;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=irMrKb+DE8rjg6FOlqGlC1OwoKa9d0vxbCpSJr1y4Bo=;
        b=wkWXMJNEGQSCO8pdTh+5zhizEcwYMCMNoukHDkQJyjS1fkCXmebooHz3l6+ws0FL+n
         rT9mOlfteySH4O/nClzCYAtQPiLJkL70+RmWvOIlzkGfoGgqIotLl/y1gT5YwQ7J+duc
         Pfrjk4mcvGzTgfx+WTMvrZ+S1+Bmq+hXygNpiev6VddguejxqGq1hI03QOmVi/oi2oG7
         6s+oViSDrxRXVoTXWcs/u9IZRj8f43CBgxqkgq50Xr5gt8lFEMw7bIT1Y9G0eyLdvMfM
         TOANhOU0lPCwtH0/gvBgaElD9BpJBzwUF1krOtWo40nBIwsuXcB9Kvhv3LlBiB4O8Zih
         PIhg==
X-Gm-Message-State: AOJu0YxtnrYsvBFxjWiQQQaLhWbouTEd6v+tTP88TYegEv48XRchq27Y
	HUkpgGzGCH0PsSpJyU1uBsz+NMIq7DHLQqgzIgPfH4qKnlw3tJJLd7a0AKeurrqyoLusmT6AZ83
	s7J/qtRy55bCN0v0kN57noP2sdHDcPS0=
X-Gm-Gg: AY/fxX7MlBX7q9IDDewydNcNQILoS8opW9b7AAW0bx5/vQ5Z1+ZvA2B4CrftgZ/CiS+
	siBwC+P6+dWvoMJoTrBoVDMpbgsz6ZkrR4CL2TngXOpqvKWeIWb4j9AepE3B/d6Q8Tvy1uvKw2K
	pz7eGeWSncyIpn6Z3T2tnSTurB+8u4wpakjh4la1hu4JN3RbKNPPsWK7SpOFrdUH4/F/YWRnDSH
	hRqTjLbIhpgFxPq2ItUhhvWdwmQRj+s8SqLsGdEyRXaBbF3bsgLHxRZZ0MmtqlGFeCywLl+/RuX
	+qs9xM4rP8ZrkRhq9jkr3Q2ZJiU5BkHvXIOVbxiZCZuA9CHpkt1GkywkCzRiLVL/BIdWK2VnfGR
	O9mmWM8B2glupcSNo9ffrc7byaaNmS7RE4DqB8B/9Rx6tbPSxPnpSAbTH
X-Received: by 2002:a05:690e:d46:b0:646:4fc0:7a64 with SMTP id
 956f58d0204a3-649165206b5mr161437d50.93.1768493183277; Thu, 15 Jan 2026
 08:06:23 -0800 (PST)
MIME-Version: 1.0
References: <20260115073720.488918-1-f_l_k@t-online.de>
In-Reply-To: <20260115073720.488918-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Jan 2026 08:05:56 -0800
X-Gm-Features: AZwV_QhNGLcg48YU2ISeE_Eeyr6eWOXcUHL8ZN_LIPvWf5bLqOey6qKINyWPALg
Message-ID: <CAMKF1sqMxxLAW3p8Y62AH5+Mwqc_P0JjNFV=yngV9pU=vtGKiQ@mail.gmail.com>
Subject: Re: [oe] [meta-xfce][PATCHv2] libxfce4windowing: switch to meson buildsystem
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fa204706486f67ac"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 16:06:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123512

--000000000000fa204706486f67ac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There is an upgrade for this recipe staged in master-next, Please rebase
this on top if master-next and resend.

On Wed, Jan 14, 2026 at 11:37=E2=80=AFPM Markus Volk via lists.openembedded=
.org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> Motivation for this is to get vapi files created which are required to
> e.g. build the budgie desktop
>
> -Add PACKAGECONFIG for x11 and build depending on DISTRO_FEATURES
> -Build vala by default
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../libxfce4windowing_4.20.4.bb               | 20 ++++++++-----------
>  1 file changed, 8 insertions(+), 12 deletions(-)
>
> diff --git a/meta-xfce/recipes-xfce/libxfce4windowing/
> libxfce4windowing_4.20.4.bb b/meta-xfce/recipes-xfce/libxfce4windowing/
> libxfce4windowing_4.20.4.bb
> index 5791d48895..bd292a6530 100644
> --- a/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.4.b=
b
> +++ b/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.4.b=
b
> @@ -4,22 +4,18 @@ SECTION =3D "x11/libs"
>  LICENSE =3D "LGPL-2.1-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D435ed639f84d4585d93824e7da3d8=
5da"
>
> -DEPENDS =3D "xfce4-dev-tools-native libdisplay-info libwnck3"
> +DEPENDS =3D "xfce4-dev-tools-native glib-2.0 gtk+3"
>
> +XFCEBASEBUILDCLASS =3D "meson"
>  SRC_URI[sha256sum] =3D
> "db467f9ac4bac8f1c4e82667902841fc0957af835c29603d6659a57440b6f8cb"
>
> -inherit features_check gobject-introspection gtk-doc xfce
> +inherit features_check gobject-introspection gtk-doc xfce vala gettext
>
>  # Currently, X11 is fully supported. Wayland is partially supported
> -REQUIRED_DISTRO_FEATURES =3D "x11"
> +ANY_OF_DISTRO_FEATURES =3D "wayland x11"
>
> -PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)=
}"
> -PACKAGECONFIG[wayland] =3D "--enable-wayland, --disable-wayland,
> wayland-native"
> +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11'=
,
> d)}"
> +PACKAGECONFIG[x11] =3D "-Dx11=3Denabled, -Dx11=3Ddisabled, libx11
> libdisplay-info libwnck3 xrandr"
> +PACKAGECONFIG[wayland] =3D "-Dwayland=3Denabled, -Dwayland=3Ddisabled, w=
ayland
> wayland-native wayland-protocols"
>
> -EXTRA_OECONF =3D "--enable-x11 \
> -                WAYLAND_SCANNER=3D${STAGING_BINDIR_NATIVE}/wayland-scann=
er \
> -                "
> -
> -do_compile:prepend() {
> -    export GIR_EXTRA_LIBS_PATH=3D${B}/libxfce4windowing/.libs
> -}
> +GTKDOC_MESON_OPTION =3D "gtk-doc"
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123491):
> https://lists.openembedded.org/g/openembedded-devel/message/123491
> Mute This Topic: https://lists.openembedded.org/mt/117275862/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000fa204706486f67ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There is an upgrade for this recipe staged in master-next,=
 Please rebase this on top if master-next and resend.</div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Wed, Jan 14, 2026 at 11:37=E2=80=AFPM Markus Volk via <a href=3D"http:=
//lists.openembedded.org">lists.openembedded.org</a> &lt;f_l_k=3D<a href=3D=
"mailto:t-online.de@lists.openembedded.org">t-online.de@lists.openembedded.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Motivation for this is to get vapi files created which are required to<b=
r>
e.g. build the budgie desktop<br>
<br>
-Add PACKAGECONFIG for x11 and build depending on DISTRO_FEATURES<br>
-Build vala by default<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0.../<a href=3D"http://libxfce4windowing_4.20.4.bb" rel=3D"noreferrer"=
 target=3D"_blank">libxfce4windowing_4.20.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 20 ++++++++-----------<br>
=C2=A01 file changed, 8 insertions(+), 12 deletions(-)<br>
<br>
diff --git a/meta-xfce/recipes-xfce/libxfce4windowing/<a href=3D"http://lib=
xfce4windowing_4.20.4.bb" rel=3D"noreferrer" target=3D"_blank">libxfce4wind=
owing_4.20.4.bb</a> b/meta-xfce/recipes-xfce/libxfce4windowing/<a href=3D"h=
ttp://libxfce4windowing_4.20.4.bb" rel=3D"noreferrer" target=3D"_blank">lib=
xfce4windowing_4.20.4.bb</a><br>
index 5791d48895..bd292a6530 100644<br>
--- a/meta-xfce/recipes-xfce/libxfce4windowing/<a href=3D"http://libxfce4wi=
ndowing_4.20.4.bb" rel=3D"noreferrer" target=3D"_blank">libxfce4windowing_4=
.20.4.bb</a><br>
+++ b/meta-xfce/recipes-xfce/libxfce4windowing/<a href=3D"http://libxfce4wi=
ndowing_4.20.4.bb" rel=3D"noreferrer" target=3D"_blank">libxfce4windowing_4=
.20.4.bb</a><br>
@@ -4,22 +4,18 @@ SECTION =3D &quot;x11/libs&quot;<br>
=C2=A0LICENSE =3D &quot;LGPL-2.1-only&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D435ed639f84d4585d9382=
4e7da3d85da&quot;<br>
<br>
-DEPENDS =3D &quot;xfce4-dev-tools-native libdisplay-info libwnck3&quot;<br=
>
+DEPENDS =3D &quot;xfce4-dev-tools-native glib-2.0 gtk+3&quot;<br>
<br>
+XFCEBASEBUILDCLASS =3D &quot;meson&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;db467f9ac4bac8f1c4e82667902841fc0957af83=
5c29603d6659a57440b6f8cb&quot;<br>
<br>
-inherit features_check gobject-introspection gtk-doc xfce<br>
+inherit features_check gobject-introspection gtk-doc xfce vala gettext<br>
<br>
=C2=A0# Currently, X11 is fully supported. Wayland is partially supported<b=
r>
-REQUIRED_DISTRO_FEATURES =3D &quot;x11&quot;<br>
+ANY_OF_DISTRO_FEATURES =3D &quot;wayland x11&quot;<br>
<br>
-PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#=
39;wayland&#39;, d)}&quot;<br>
-PACKAGECONFIG[wayland] =3D &quot;--enable-wayland, --disable-wayland, wayl=
and-native&quot;<br>
+PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#=
39;wayland x11&#39;, d)}&quot;<br>
+PACKAGECONFIG[x11] =3D &quot;-Dx11=3Denabled, -Dx11=3Ddisabled, libx11 lib=
display-info libwnck3 xrandr&quot;<br>
+PACKAGECONFIG[wayland] =3D &quot;-Dwayland=3Denabled, -Dwayland=3Ddisabled=
, wayland wayland-native wayland-protocols&quot;<br>
<br>
-EXTRA_OECONF =3D &quot;--enable-x11 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WAYLAND_SCANNER=3D=
${STAGING_BINDIR_NATIVE}/wayland-scanner \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-<br>
-do_compile:prepend() {<br>
-=C2=A0 =C2=A0 export GIR_EXTRA_LIBS_PATH=3D${B}/libxfce4windowing/.libs<br=
>
-}<br>
+GTKDOC_MESON_OPTION =3D &quot;gtk-doc&quot;<br>
-- <br>
2.52.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123491): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123491" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123491</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117275862/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117275862/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000fa204706486f67ac--

