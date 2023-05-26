Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 574F5C7EE23
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 06:14:32 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.2411.1685081670462072052
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 May 2023 23:14:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=di3YkCMt;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3f60e730bf2so3920205e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 23:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685081668; x=1687673668;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LWSqIqFPjMnUfsX8vjG7bH4hMgSxT94pf5GdiApQsmo=;
        b=di3YkCMtLjzbsGMQtm1ZDJp+7s60GKW7RgS5uOSul8ki6ehON5nH+0ArHsKBCBVUbM
         Q9CPdHu9OmVI43TMugtzSKRfYLN31dRxB1i/LnFQbpK46F26HKD7RrzD++9p64I2vHYF
         42ly7Zv2GaNSNrz4DBp+XDZX8v6JixRFuIiaasPvEp+iObKUpcCDNCosCTU/nIoBCeYg
         1qCgQWLgQc486rlspXsPzr+xjhfkwJgv84EsvpXaJVv0tNuyF3H75sGMDpiDjqaDKGqX
         yYHEMdKl5tjazyTJGJSmEUoeKSbvJHN+vD90+9rfo8AOnhpNoSYYo96RHmN7UfHr/6Id
         s1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685081668; x=1687673668;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LWSqIqFPjMnUfsX8vjG7bH4hMgSxT94pf5GdiApQsmo=;
        b=iYjG6Um0GODzcPWdHw3MYjRmjMvvGF7Lg1EnlaXJY9+TOeYSD4MHXPdZ8c7lsYreaK
         zrelsG6DSUi8Ll72Cw51C55E1J+iV9KhPyEVT3yfZvMDc2MzyosCzSvRT/W22fDbBBva
         mDSFCECDj87t50x1EI2VNrsFWC5+G9R/kYhIaDcjBpifM2qkxe6fMU9M6pLe5dEoXFqU
         OkuwvJpYvJHu3hL5JGlEFmZN+2LCnCzbGx1TcHl5/4EVMGh4bPY214TQOUB+gIt4BdES
         /QjzrrqqjmwnEpo6IZq62RIaOTkFIFs/LRLJ5GRvuNKXiECL5beQdKt7GXVvk8jxNHuF
         F0hg==
X-Gm-Message-State: AC+VfDw3DeJFHHcuREoB+qcX0M8/P8gPu0Otx6Ot66uYIYbn62BcDukl
	dUmg/2kcM2t0NXtCUJfIhbWxf/CotBdfS3NS7z4=
X-Google-Smtp-Source: ACHHUZ6TqCD10cGqZIAILQbS8RSc931qGdLrWOPzhjNyroHjhiZ5uH3fH2mUxgv4eKQYJwqbcfIymlnjE3hrMYP5Flc=
X-Received: by 2002:a5d:6291:0:b0:309:e24:57b3 with SMTP id
 k17-20020a5d6291000000b003090e2457b3mr499800wru.4.1685081668352; Thu, 25 May
 2023 23:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230525121357.245812-1-ross.burton@arm.com>
In-Reply-To: <20230525121357.245812-1-ross.burton@arm.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 26 May 2023 08:14:13 +0200
Message-ID: <CA+chaQcqPZU7MwS62NbZEAvRjCxApZZTe1nJOAU8zb1kE0CCpw@mail.gmail.com>
Subject: Re: [oe] [PATCH 01/14] libpeas: requires gobject-introspection-data DISTRO_FEATURE
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-devel@lists.openembedded.org, nd@arm.com
Content-Type: multipart/alternative; boundary="000000000000427de005fc92a6ce"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 May 2023 06:14:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102862

--000000000000427de005fc92a6ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There is this line already from your previous patch:
https://lists.openembedded.org/g/openembedded-devel/message/102683

On Thu, May 25, 2023 at 2:14=E2=80=AFPM Ross Burton <ross.burton@arm.com> w=
rote:

> From: Ross Burton <ross.burton@arm.com>
>
> Until libpeas 2 is released, g-i is a hard requirement.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
> b/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
> index 3bc975a6fa..1e3b0021c3 100644
> --- a/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
> +++ b/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
> @@ -11,6 +11,8 @@ GTKDOC_MESON_OPTION =3D "gtk_doc"
>  inherit gnomebase gobject-introspection gtk-doc gtk-icon-cache
> features_check
>
>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
> +# FIXME: When upgrading to libpeas 2, g-i is no longer needed.
> +REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
>
>  SRC_URI +=3D
> "file://0001-Remove-builddir-and-srcdir-paths-from-test-binaries.patch"
>  SRC_URI[archive.sha256sum] =3D
> "297cb9c2cccd8e8617623d1a3e8415b4530b8e5a893e3527bbfd1edd13237b4c"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102844):
> https://lists.openembedded.org/g/openembedded-devel/message/102844
> Mute This Topic: https://lists.openembedded.org/mt/99128559/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000427de005fc92a6ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There is this line already from your previous patch:<div><=
a href=3D"https://lists.openembedded.org/g/openembedded-devel/message/10268=
3">https://lists.openembedded.org/g/openembedded-devel/message/102683</a><b=
r></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Thu, May 25, 2023 at 2:14=E2=80=AFPM Ross Burton &lt;<a href=3D"=
mailto:ross.burton@arm.com">ross.burton@arm.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">From: Ross Burton &lt;<a hre=
f=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.burton@arm.com</a>&=
gt;<br>
<br>
Until libpeas 2 is released, g-i is a hard requirement.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-gnome/libpeas/<a href=3D"http://libpeas_1.36.0.bb" re=
l=3D"noreferrer" target=3D"_blank">libpeas_1.36.0.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta-oe/recipes-gnome/libpeas/<a href=3D"http://libpeas_1.36.0=
.bb" rel=3D"noreferrer" target=3D"_blank">libpeas_1.36.0.bb</a> b/meta-oe/r=
ecipes-gnome/libpeas/<a href=3D"http://libpeas_1.36.0.bb" rel=3D"noreferrer=
" target=3D"_blank">libpeas_1.36.0.bb</a><br>
index 3bc975a6fa..1e3b0021c3 100644<br>
--- a/meta-oe/recipes-gnome/libpeas/<a href=3D"http://libpeas_1.36.0.bb" re=
l=3D"noreferrer" target=3D"_blank">libpeas_1.36.0.bb</a><br>
+++ b/meta-oe/recipes-gnome/libpeas/<a href=3D"http://libpeas_1.36.0.bb" re=
l=3D"noreferrer" target=3D"_blank">libpeas_1.36.0.bb</a><br>
@@ -11,6 +11,8 @@ GTKDOC_MESON_OPTION =3D &quot;gtk_doc&quot;<br>
=C2=A0inherit gnomebase gobject-introspection gtk-doc gtk-icon-cache featur=
es_check<br>
<br>
=C2=A0ANY_OF_DISTRO_FEATURES =3D &quot;${GTK3DISTROFEATURES}&quot;<br>
+# FIXME: When upgrading to libpeas 2, g-i is no longer needed.<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;gobject-introspection-data&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://0001-Remove-builddir-and-srcdir-paths-from-=
test-binaries.patch&quot;<br>
=C2=A0SRC_URI[archive.sha256sum] =3D &quot;297cb9c2cccd8e8617623d1a3e8415b4=
530b8e5a893e3527bbfd1edd13237b4c&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#102844): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/102844" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/102844</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99128559/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/99128559/3617156</a><br>
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

--000000000000427de005fc92a6ce--

