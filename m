Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22CBAD3B7EA
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 19:50:18 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1752.1765223415800353319
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Dec 2025 11:50:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kaGVYQz6;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6430834244aso3881735d50.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 11:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765223415; x=1765828215; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GdZDzTHRfnUponjRboKs3bz2PDF6/Y25FvLl5P2a50c=;
        b=kaGVYQz6e43fJiCC1YrI+uzibKFKilBlGbAQEm4pp05EXUi5ZKb5CwTf82iWrgndRe
         0V0pgB6ZmX1WI0RMrJ+V8HtBPeVhyb92TZ3P+OW4qEqD/fVbNDRNc5h/3kr+GZOy7BMf
         F6TSreYyah7NLF0kznbsM1RVuV7GDZXRLmHg9fZsq5pKSt9XRSf1nAneKhMTnX+vQy8S
         j5lsVkwmLWFAmfZhV/bSqEaLRPNUwh+w+QD6pJAzmokn0lSuOkMEGkScqimz9tm3S+zf
         kwkCOQNl0DpZp95w5mDVGhcQ4dA4OwircHH7zRkCeMVtYgi77011b7I7EQDoW1yacg/3
         0zNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765223415; x=1765828215;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdZDzTHRfnUponjRboKs3bz2PDF6/Y25FvLl5P2a50c=;
        b=o8Jb6esPY+vNEsK4yE9wGffFouDnJWuDIKqDmCiq6CHOCprsxt3L20PdgQIVIwdvNY
         /u/V7Whx/yALIqbdWG23LQtjaMJfg8MmJ5BcmGxyOv6MPPDiscgbtesWttCO85xTrjNw
         wAXIX1vHeEUDNvu++gEN6IC+5ZN1CFDTzyJXh6KFmDHpYpx/UihrOmOnhSr5ydwb7SGE
         zv66IN+UhElbl8qR2NzMaGWn7Tc5szlS+G61mlN/Bwq4hwDPn+tJ7+cqZepvNzpaovKl
         s/WsRLgR9faoOo5iTrR7MH1/fmcLHjwp4A4dBjF6CaC6jt0Q1p/1drhtK+Bi3CPZOuJj
         xz1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVt8Hd2ZaOgLp41XBzZpgyRalGC2ZMKoRZF7nH5FRP9OimGKLTIjZ8K9ztRYaCAu1/sAg7kj2I6um+8a6wO7Dv+Sw=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxu+ChfRduE15tQSwTN1WN8TJUVV1aNDqIoHq+/UV5Id4ULvelA
	5q16JdMVJaaDmqHI2hFNcVjXHXHdZHzMtDXs7sjsGcOfeVUH/sNyh8GaLIJAeQyiBs0BK+f0FB/
	oBcwPQz4knXemCAATPYVEsJrmPyQnB35QL51DaFs=
X-Gm-Gg: ASbGnctnN1gTLaY6QTe88twWlkPmPEj2VsRTL58VcskvzdWpD9OvRskHK07E3NQRgQ+
	5lygOq2mjMGSb52SrcEI2dS1rHrnI7rv3BKfak+bfkkzNzBJe75Zacteoi8x8RL8Yhq0dl37KoE
	S9M71IVnAbPIh1FkfZ4En4KsmE1s78Nxl6rGvIFvAgKGtYZhaymsDUq9JQ35mbyueDUQCV72f5k
	0OkF8C3cQQGhqjy5Ft0GoDBr7O1w0V1rAx5mAbyhCVG7CD2G6Sllg6J/Nz1oo/SEWNTecRs2d80
	/gBP2gDacd03l1STujeoGlvk5wZd37I2KwhcwztYaNJJaWLlkLP8PfBp/JEqpUuFY8txJgtH3p1
	xbyeOpDNXlGdTC8NVhH8t40Yqnsn83MWAMCeagRz3gg==
X-Google-Smtp-Source: AGHT+IGUCuw4y0kgPoW2vwPjYUWrSQBjdKqeStp2AZSdxi11iTCBcXsZAq4qEKYbGcseUe9yGsC7ik9TOp/n7Zdw2Kk=
X-Received: by 2002:a05:690e:1307:b0:644:60d9:7516 with SMTP id
 956f58d0204a3-64460d978a3mr1673385d50.90.1765223414742; Mon, 08 Dec 2025
 11:50:14 -0800 (PST)
MIME-Version: 1.0
References: <20251208091300.21039-1-liuyd.fnst@fujitsu.com> <83e4a981-fdaf-47ec-9f4d-a8e05b3513e9@gmail.com>
In-Reply-To: <83e4a981-fdaf-47ec-9f4d-a8e05b3513e9@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Dec 2025 11:49:47 -0800
X-Gm-Features: AQt7F2qy3CGa1FJAnS0wrdIdMuH9O1qzvV7_CSjx8vJQxIZrblcJQ0SJRUW1_LM
Message-ID: <CAMKF1sr6E79FvKP3_W7nHvg=YjhM=9M0bkx+XfpuLft7U0pOWQ@mail.gmail.com>
Subject: Re: [oe][meta-gnome][PATCH 2/2] gnome-control-center: upgrade 48.3 -> 49.2.2
To: skandigraun@gmail.com
Cc: liuyd.fnst@fujitsu.com, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000095c55f0645761a8c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 19:50:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122389

--00000000000095c55f0645761a8c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 8, 2025 at 1:54=E2=80=AFAM Gyorgy Sarvari via lists.openembedde=
d.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> Doesn't gnome-control-center follow an "odd-versions-are-unstable"
> versioning pattern, making this version to be kinda-beta?
>

IIRC that policy changed with gnome 40 - see
https://handbook.gnome.org/release-planning.html

specifically the section called "Versioning"


>
> On 12/8/25 10:13, Yiding Liu (Fujitsu) via lists.openembedded.org wrote:
> > Changelog:
> > - Revert libgxdp updates
> >
> >   The libgxdp updates depend on changes in gsettings-desktop-schemas
> >   that are part of the GNOME 50 cycle. Revert the pinned ref
> >   to the one we had before, until we branch libgxdp for GNOME 49.
> >
> > Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> > ---
> >  ...l-center_48.3.bb =3D> gnome-control-center_49.2.2.bb} | 10 +++++++-=
--
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >  rename meta-gnome/recipes-gnome/gnome-control-center/{
> gnome-control-center_48.3.bb =3D> gnome-control-center_49.2.2.bb} (79%)
> >
> > diff --git a/meta-gnome/recipes-gnome/gnome-control-center/
> gnome-control-center_48.3.bb
> b/meta-gnome/recipes-gnome/gnome-control-center/
> gnome-control-center_49.2.2.bb
> > similarity index 79%
> > rename from meta-gnome/recipes-gnome/gnome-control-center/
> gnome-control-center_48.3.bb
> > rename to meta-gnome/recipes-gnome/gnome-control-center/
> gnome-control-center_49.2.2.bb
> > index d8d5849534..9bb0228d50 100644
> > --- a/meta-gnome/recipes-gnome/gnome-control-center/
> gnome-control-center_48.3.bb
> > +++ b/meta-gnome/recipes-gnome/gnome-control-center/
> gnome-control-center_49.2.2.bb
> > @@ -32,19 +32,22 @@ DEPENDS =3D " \
> >      udisks2 \
> >      upower \
> >      ${@' libxslt-native docbook-xsl-stylesheets-native' if
> d.getVar('GIDOCGEN_ENABLED') =3D=3D 'True' else ''} \
> > +    blueprint-compiler-native \
> >  "
> >
> >  inherit gtk-icon-cache pkgconfig gnomebase gsettings gettext gi-docgen
> upstream-version-is-even bash-completion features_check
> >
> >  REQUIRED_DISTRO_FEATURES +=3D "opengl polkit pulseaudio systemd x11"
> >
> > +SRC_URI =3D "
> https://download.gnome.org/sources/gnome-control-center/${@oe.utils.trim_=
version('${PV}',
> 1)}/gnome-control-center-${PV}.tar.xz"
> > +SRC_URI[sha256sum] =3D
> "c23ae220d6c1237d285925de7801e0e36338b9cc1a8bb51c2e37e715e6b503ad"
> > +
> >  SRC_URI +=3D "file://0001-Add-meson-option-to-pass-sysroot.patch"
> > -SRC_URI[archive.sha256sum] =3D
> "c0698245a6420badd077c16ffb218860e457cd7300612718eabf9aba47222bae"
> >
> > -PACKAGECONFIG ??=3D "ibus ${@bb.utils.filter('DISTRO_FEATURES',
> 'wayland', d)}"
> > +PACKAGECONFIG ??=3D "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'x11',
> d)}"
> >  PACKAGECONFIG[cups] =3D ",,cups,cups system-config-printer cups-pk-hel=
per"
> >  PACKAGECONFIG[ibus] =3D "-Dibus=3Dtrue, -Dibus=3Dfalse, ibus"
> > -PACKAGECONFIG[wayland] =3D "-Dwayland=3Dtrue, -Dwayland=3Dfalse, wayla=
nd"
> > +PACKAGECONFIG[x11] =3D "-Dx11=3Dtrue, -Dx11=3Dfalse, virtual/libx11"
> >  PACKAGECONFIG[file-share] =3D ",,,gnome-user-share"
> >  PACKAGECONFIG[media-share] =3D ",,,rygel-meta tumbler"
> >  PACKAGECONFIG[malcontent] =3D
> "-Dmalcontent=3Dtrue,-Dmalcontent=3Dfalse,malcontent,malcontent-ui"
> > @@ -54,6 +57,7 @@ EXTRA_OEMESON +=3D "-Doe_sysroot=3D${STAGING_DIR_HOST=
}"
> >  GIDOCGEN_MESON_OPTION =3D 'documentation'
> >
> >  export XDG_DATA_DIRS =3D "${STAGING_DATADIR}"
> > +export GI_TYPELIB_PATH =3D "${RECIPE_SYSROOT}${libdir}/girepository-1.=
0"
> >
> >  FILES:${PN} +=3D " \
> >      ${datadir}/dbus-1 \
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122373):
> https://lists.openembedded.org/g/openembedded-devel/message/122373
> Mute This Topic: https://lists.openembedded.org/mt/116673072/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000095c55f0645761a8c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 8, =
2025 at 1:54=E2=80=AFAM Gyorgy Sarvari via <a href=3D"http://lists.openembe=
dded.org">lists.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:gm=
ail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Doesn&#39;t=
 gnome-control-center follow an &quot;odd-versions-are-unstable&quot;<br>
versioning pattern, making this version to be kinda-beta?<br></blockquote><=
div><br></div><div>IIRC that policy changed with gnome 40 - see=C2=A0<a hre=
f=3D"https://handbook.gnome.org/release-planning.html">https://handbook.gno=
me.org/release-planning.html</a></div><div><br></div><div>specifically the =
section called &quot;Versioning&quot;</div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
<br>
On 12/8/25 10:13, Yiding Liu (Fujitsu) via <a href=3D"http://lists.openembe=
dded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> w=
rote:<br>
&gt; Changelog:<br>
&gt; - Revert libgxdp updates<br>
&gt;<br>
&gt;=C2=A0 =C2=A0The libgxdp updates depend on changes in gsettings-desktop=
-schemas<br>
&gt;=C2=A0 =C2=A0that are part of the GNOME 50 cycle. Revert the pinned ref=
<br>
&gt;=C2=A0 =C2=A0to the one we had before, until we branch libgxdp for GNOM=
E 49.<br>
&gt;<br>
&gt; Signed-off-by: Liu Yiding &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com=
" target=3D"_blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...<a href=3D"http://l-center_48.3.bb" rel=3D"noreferrer" target=
=3D"_blank">l-center_48.3.bb</a> =3D&gt; <a href=3D"http://gnome-control-ce=
nter_49.2.2.bb" rel=3D"noreferrer" target=3D"_blank">gnome-control-center_4=
9.2.2.bb</a>} | 10 +++++++---<br>
&gt;=C2=A0 1 file changed, 7 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 rename meta-gnome/recipes-gnome/gnome-control-center/{<a href=3D=
"http://gnome-control-center_48.3.bb" rel=3D"noreferrer" target=3D"_blank">=
gnome-control-center_48.3.bb</a> =3D&gt; <a href=3D"http://gnome-control-ce=
nter_49.2.2.bb" rel=3D"noreferrer" target=3D"_blank">gnome-control-center_4=
9.2.2.bb</a>} (79%)<br>
&gt;<br>
&gt; diff --git a/meta-gnome/recipes-gnome/gnome-control-center/<a href=3D"=
http://gnome-control-center_48.3.bb" rel=3D"noreferrer" target=3D"_blank">g=
nome-control-center_48.3.bb</a> b/meta-gnome/recipes-gnome/gnome-control-ce=
nter/<a href=3D"http://gnome-control-center_49.2.2.bb" rel=3D"noreferrer" t=
arget=3D"_blank">gnome-control-center_49.2.2.bb</a><br>
&gt; similarity index 79%<br>
&gt; rename from meta-gnome/recipes-gnome/gnome-control-center/<a href=3D"h=
ttp://gnome-control-center_48.3.bb" rel=3D"noreferrer" target=3D"_blank">gn=
ome-control-center_48.3.bb</a><br>
&gt; rename to meta-gnome/recipes-gnome/gnome-control-center/<a href=3D"htt=
p://gnome-control-center_49.2.2.bb" rel=3D"noreferrer" target=3D"_blank">gn=
ome-control-center_49.2.2.bb</a><br>
&gt; index d8d5849534..9bb0228d50 100644<br>
&gt; --- a/meta-gnome/recipes-gnome/gnome-control-center/<a href=3D"http://=
gnome-control-center_48.3.bb" rel=3D"noreferrer" target=3D"_blank">gnome-co=
ntrol-center_48.3.bb</a><br>
&gt; +++ b/meta-gnome/recipes-gnome/gnome-control-center/<a href=3D"http://=
gnome-control-center_49.2.2.bb" rel=3D"noreferrer" target=3D"_blank">gnome-=
control-center_49.2.2.bb</a><br>
&gt; @@ -32,19 +32,22 @@ DEPENDS =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 udisks2 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 upower \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${@&#39; libxslt-native docbook-xsl-stylesheets-na=
tive&#39; if d.getVar(&#39;GIDOCGEN_ENABLED&#39;) =3D=3D &#39;True&#39; els=
e &#39;&#39;} \<br>
&gt; +=C2=A0 =C2=A0 blueprint-compiler-native \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 inherit gtk-icon-cache pkgconfig gnomebase gsettings gettext gi-=
docgen upstream-version-is-even bash-completion features_check<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 REQUIRED_DISTRO_FEATURES +=3D &quot;opengl polkit pulseaudio sys=
temd x11&quot;<br>
&gt;=C2=A0 <br>
&gt; +SRC_URI =3D &quot;<a href=3D"https://download.gnome.org/sources/gnome=
-control-center/$%7B@oe.utils.trim_version(&#39;$%7BPV%7D" rel=3D"noreferre=
r" target=3D"_blank">https://download.gnome.org/sources/gnome-control-cente=
r/${@oe.utils.trim_version(&#39;${PV}</a>&#39;, 1)}/gnome-control-center-${=
PV}.tar.xz&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;c23ae220d6c1237d285925de7801e0e36338b9cc=
1a8bb51c2e37e715e6b503ad&quot;<br>
&gt; +<br>
&gt;=C2=A0 SRC_URI +=3D &quot;file://0001-Add-meson-option-to-pass-sysroot.=
patch&quot;<br>
&gt; -SRC_URI[archive.sha256sum] =3D &quot;c0698245a6420badd077c16ffb218860=
e457cd7300612718eabf9aba47222bae&quot;<br>
&gt;=C2=A0 <br>
&gt; -PACKAGECONFIG ??=3D &quot;ibus ${@bb.utils.filter(&#39;DISTRO_FEATURE=
S&#39;, &#39;wayland&#39;, d)}&quot;<br>
&gt; +PACKAGECONFIG ??=3D &quot;ibus ${@bb.utils.filter(&#39;DISTRO_FEATURE=
S&#39;, &#39;x11&#39;, d)}&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[cups] =3D &quot;,,cups,cups system-config-printer =
cups-pk-helper&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[ibus] =3D &quot;-Dibus=3Dtrue, -Dibus=3Dfalse, ibu=
s&quot;<br>
&gt; -PACKAGECONFIG[wayland] =3D &quot;-Dwayland=3Dtrue, -Dwayland=3Dfalse,=
 wayland&quot;<br>
&gt; +PACKAGECONFIG[x11] =3D &quot;-Dx11=3Dtrue, -Dx11=3Dfalse, virtual/lib=
x11&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[file-share] =3D &quot;,,,gnome-user-share&quot;<br=
>
&gt;=C2=A0 PACKAGECONFIG[media-share] =3D &quot;,,,rygel-meta tumbler&quot;=
<br>
&gt;=C2=A0 PACKAGECONFIG[malcontent] =3D &quot;-Dmalcontent=3Dtrue,-Dmalcon=
tent=3Dfalse,malcontent,malcontent-ui&quot;<br>
&gt; @@ -54,6 +57,7 @@ EXTRA_OEMESON +=3D &quot;-Doe_sysroot=3D${STAGING_DI=
R_HOST}&quot;<br>
&gt;=C2=A0 GIDOCGEN_MESON_OPTION =3D &#39;documentation&#39;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 export XDG_DATA_DIRS =3D &quot;${STAGING_DATADIR}&quot;<br>
&gt; +export GI_TYPELIB_PATH =3D &quot;${RECIPE_SYSROOT}${libdir}/gireposit=
ory-1.0&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 FILES:${PN} +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${datadir}/dbus-1 \<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122373): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122373" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122373</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116673072/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116673072/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000095c55f0645761a8c--

