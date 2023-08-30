Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 317F7C83F15
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 07:30:31 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.8896.1693380623719534212
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Aug 2023 00:30:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=rRfgHjRM;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-401f68602a8so455765e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 00:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693380622; x=1693985422; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kmsp5SO0pScq4wm0hUm9vhJMurfvCn7eav16PtA4YVM=;
        b=rRfgHjRMoOD/lixXJKpChOTa3fT+hctn+Mg4bkWVzYou5DJ5BbjVdgI0feGHxRFuWX
         kl9rEa1IWRXFYrGTNIZeOzHYp8Pam5X0CEDRFW/qtB1hRqXzVhA6R+qPoY18gv7fpCu9
         Q2f5tyAJqSQDuLxuP/MojlLC7sf5B4Ar/XnUlYtgmTq0Hm1WRhQ7VWexMz9IQa1Hjprm
         oLBMRn+9qEQtFHclFTHYTXnhw3p0Qu9s4ZmEBDUdyBWjFs03XCSejmntwP3eCb4W6VE4
         pvUPFrXSwXyJeMroVCN0k52MRmlp0tSHaVFzPyNL1uulphu++L9DmF6Azp8WZIa5wUh8
         Hd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693380622; x=1693985422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kmsp5SO0pScq4wm0hUm9vhJMurfvCn7eav16PtA4YVM=;
        b=clZWyoJg/D2jQwa5jLFQuQCKkaiVw+IbOyTgrDHVC1/011yBIDEpQMYFOA9dwklNfw
         LpmnAsceePkA3UmJhjBTnFZBpcBLitlhASG6kh0gWzUEbylAeWMsT+c2UlRplGa2HVmZ
         i66UYb35ezB3CKrXQ4ZyUTpxclZWTxyfCvm2r6NIN9u+boy6qANWwn+lPbuuFC58uDbp
         ROFhGzO9S9g+9pYogBfYrXpsua+fCgvmoZJ+SoQ0a1XFIuIezwyjwSYFwQvN0DYo11vf
         t/yH4e50yGUj8wHPXBGIOnhi/dC9UCS/XAp+Yrg4MNmfSmILZTob639/Ad4avzecW7N7
         sHiQ==
X-Gm-Message-State: AOJu0YzwnRsXphMukjl65F6dkD420odQVkw067ElxeE9EYkYcFgUDgOZ
	njvejdJcUR3d8/XSRnPnUmoYrQZs5HVF5+F/YV2+4V3SV3I=
X-Google-Smtp-Source: AGHT+IEW/P9Mio1N4MOLhCAFwGlc64Cj9HENvetoAMKg+y8i1ro7Yn3vky8K/yNBJdESBZguv7okbTXzVhz03Ql5c70=
X-Received: by 2002:adf:f00a:0:b0:31a:d6cb:7f9e with SMTP id
 j10-20020adff00a000000b0031ad6cb7f9emr931785wro.21.1693380621763; Wed, 30 Aug
 2023 00:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230825054449.2315061-1-f_l_k@t-online.de> <20230825054449.2315061-2-f_l_k@t-online.de>
In-Reply-To: <20230825054449.2315061-2-f_l_k@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 30 Aug 2023 09:29:58 +0200
Message-ID: <CA+chaQfBkvt2hPuRaoYNVOc8O2iY=mZUzp=e8s3vDYkgMc6QWw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/5] phodav: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006e0aff06041ee696"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 07:30:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104653

--0000000000006e0aff06041ee696
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Doesn't seem to respect paths set in bitbake.conf:

ERROR: lib32-phodav-3.0-r0 do_package: QA Issue: lib32-phodav:
Files/directories were installed but not shipped in any package:
  /usr/lib/systemd
  /usr/lib/systemd/system
  /usr/lib/systemd/system/spice-webdavd.service
Please set FILES such that these items are packaged. Alternatively if they
are unneeded, avoid installing them or delete them within do_install.
lib32-phodav: 3 installed and not shipped files. [installed-vs-shipped]

will send a fix for this one.

On Fri, Aug 25, 2023 at 7:45=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:

> phodav is a small webdav server, that was originally created as a tool to
> provide folder sharing for spice but it can be used on a wider range
> of applications.
>
> It is usable e.g. in virt-viewer or gnome-boxes
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../recipes-support/spice/phodav_3.0.bb       | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta-networking/recipes-support/spice/phodav_3.0.bb
>
> diff --git a/meta-networking/recipes-support/spice/phodav_3.0.bb
> b/meta-networking/recipes-support/spice/phodav_3.0.bb
> new file mode 100644
> index 0000000000..03e3caee27
> --- /dev/null
> +++ b/meta-networking/recipes-support/spice/phodav_3.0.bb
> @@ -0,0 +1,23 @@
> +SUMMARY =3D "phodav is a WebDav server implementation using libsoup (RFC
> 4918)."
> +LICENSE =3D "LGPL-2.1-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
> +
> +DEPENDS =3D " \
> +    glib-2.0 \
> +    libsoup \
> +"
> +
> +GNOMEBASEBUILDCLASS =3D "meson"
> +GTKDOC_MESON_OPTION =3D 'gtk_doc'
> +GTKDOC_MESON_ENABLE_FLAG =3D 'enabled'
> +GTKDOC_MESON_DISABLE_FLAG =3D 'disabled'
> +
> +PACKAGECONFIG ??=3D "avahi"
> +PACKAGECONFIG[avahi] =3D "-Davahi=3Denabled,-Davahi=3Ddisabled,avahi"
> +
> +inherit pkgconfig gnomebase gettext gtk-doc
> +
> +SRC_URI =3D "
> https://download.gnome.org/sources/phodav/3.0/phodav-${PV}.tar.xz;name=3D=
archive
> "
> +SRC_URI[archive.sha256sum] =3D
> "392ec2d06d50300dcff1ef269a2a985304e29bce3520002fca29f2edc1d138d1"
> +
> +FILES:${PN} +=3D "${libdir}"
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104594):
> https://lists.openembedded.org/g/openembedded-devel/message/104594
> Mute This Topic: https://lists.openembedded.org/mt/100950816/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000006e0aff06041ee696
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Doesn&#39;t seem to respect paths set in bitbake.conf:<div=
><br></div><div>ERROR: lib32-phodav-3.0-r0 do_package: QA Issue: lib32-phod=
av: Files/directories were installed but not shipped in any package:<br>=C2=
=A0 /usr/lib/systemd<br>=C2=A0 /usr/lib/systemd/system<br>=C2=A0 /usr/lib/s=
ystemd/system/spice-webdavd.service<br>Please set FILES such that these ite=
ms are packaged. Alternatively if they are unneeded, avoid installing them =
or delete them within do_install.<br>lib32-phodav: 3 installed and not ship=
ped files. [installed-vs-shipped]<br></div><div><br></div><div>will send a =
fix for this one.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Fri, Aug 25, 2023 at 7:45=E2=80=AFAM Markus Volk =
&lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">phodav is a small=
 webdav server, that was originally created as a tool to<br>
provide folder sharing for spice but it can be used on a wider range<br>
of applications.<br>
<br>
It is usable e.g. in virt-viewer or gnome-boxes<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0.../recipes-support/spice/<a href=3D"http://phodav_3.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">phodav_3.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 23=
 +++++++++++++++++++<br>
=C2=A01 file changed, 23 insertions(+)<br>
=C2=A0create mode 100644 meta-networking/recipes-support/spice/<a href=3D"h=
ttp://phodav_3.0.bb" rel=3D"noreferrer" target=3D"_blank">phodav_3.0.bb</a>=
<br>
<br>
diff --git a/meta-networking/recipes-support/spice/<a href=3D"http://phodav=
_3.0.bb" rel=3D"noreferrer" target=3D"_blank">phodav_3.0.bb</a> b/meta-netw=
orking/recipes-support/spice/<a href=3D"http://phodav_3.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">phodav_3.0.bb</a><br>
new file mode 100644<br>
index 0000000000..03e3caee27<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/spice/<a href=3D"http://phodav_3.0.bb=
" rel=3D"noreferrer" target=3D"_blank">phodav_3.0.bb</a><br>
@@ -0,0 +1,23 @@<br>
+SUMMARY =3D &quot;phodav is a WebDav server implementation using libsoup (=
RFC 4918).&quot;<br>
+LICENSE =3D &quot;LGPL-2.1-only&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4fbd65380cdd255951079008b3=
64516c&quot;<br>
+<br>
+DEPENDS =3D &quot; \<br>
+=C2=A0 =C2=A0 glib-2.0 \<br>
+=C2=A0 =C2=A0 libsoup \<br>
+&quot;<br>
+<br>
+GNOMEBASEBUILDCLASS =3D &quot;meson&quot;<br>
+GTKDOC_MESON_OPTION =3D &#39;gtk_doc&#39;<br>
+GTKDOC_MESON_ENABLE_FLAG =3D &#39;enabled&#39;<br>
+GTKDOC_MESON_DISABLE_FLAG =3D &#39;disabled&#39;<br>
+<br>
+PACKAGECONFIG ??=3D &quot;avahi&quot;<br>
+PACKAGECONFIG[avahi] =3D &quot;-Davahi=3Denabled,-Davahi=3Ddisabled,avahi&=
quot;<br>
+<br>
+inherit pkgconfig gnomebase gettext gtk-doc<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"https://download.gnome.org/sources/phodav/3.0=
/phodav-$%7BPV%7D.tar.xz;name=3Darchive" rel=3D"noreferrer" target=3D"_blan=
k">https://download.gnome.org/sources/phodav/3.0/phodav-${PV}.tar.xz;name=
=3Darchive</a>&quot;<br>
+SRC_URI[archive.sha256sum] =3D &quot;392ec2d06d50300dcff1ef269a2a985304e29=
bce3520002fca29f2edc1d138d1&quot;<br>
+<br>
+FILES:${PN} +=3D &quot;${libdir}&quot;<br>
-- <br>
2.41.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#104594): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/104594" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/104594</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100950816/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100950816/3617156</a><br>
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

--0000000000006e0aff06041ee696--

