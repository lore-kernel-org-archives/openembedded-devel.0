Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C480C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 09:59:04 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web11.3510.1704707938139568693
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 01:58:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BPNj3Ia/;
 spf=pass (domain: gmail.com, ip: 209.85.217.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-466ed49e160so92304137.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 01:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704707937; x=1705312737; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ahv+DtBAD/4CMYGWoYiVH7orly6wo3b7R3q7oRnAE8w=;
        b=BPNj3Ia/Qsy94Cs33Xk9rECQhGIIdvK1+6ZU6qsOr4k2AjSX4Oxlu/QqhvTvQQJUQ9
         YCoBdfSfbRZek+1RAUmEcqHmOrbDEB/O86sU2DeOyYk2ULorean7h20BwXq3XPaPpSY3
         ddgr8evWqEIljUG65G8bh3QGs+9Ad6vnRMuMMXUlvQfvlA+xCRwIi99L6WRwW/5NdCZG
         8rEycd55xsP3aXHOIcS4lQ+o1WTMgM3aRaHt+80sQuLrq6QMtgOzvKuAy5bCg7nkHEWE
         r2LCmwI6CsVm+30N4Ts9i+7B3HcFYSA+eXrNgqS75HxTzFZ4zNgPtDpyo60NrhKsaxaH
         0eUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704707937; x=1705312737;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ahv+DtBAD/4CMYGWoYiVH7orly6wo3b7R3q7oRnAE8w=;
        b=ZmPlnE+EWanl0zD/aZrLzFEZyR9aEa88EAL+H7X64LdnwD2GIsEqfNW1yp5F0BlznT
         guhr3Mww39OgqTjIGfjC8nLKXjWxmPJTfvN43hygqbBtI2vRbWfQ5Z4hPpncOoOscEW7
         ROrubJiIYJkjam7bVLDq1d+1BYf6XRSzMFpXMmvccVS8dA5Hpg/NdpHYZnob5/hm+m4L
         HCS+/DKg0sk1OHgFXcnntEG9HjgZ24/5Hbta80bae+7ilbCZ2jx6tSn5RwBSYxlcgL33
         6lFgtVociH6MU+cKOaRqflea5PXVhGJmNlPc4TFQuqqJ+aWo0SvmLf/PbKLUZrmLppnk
         0o4A==
X-Gm-Message-State: AOJu0YwhlBuCj8b8t5PyqYEYfu6B6qePx2fRq+41+x1x8rzU+yn11Pm/
	hw5XGU1/uh1eaCwXLFw9jTCxOIVbMDYh/MeblGcGS/rzaab/3w==
X-Google-Smtp-Source: AGHT+IHYZLzKncJRBzBhVYe966cm5fbkPcz1WHLx8BYkaeLOreTeVwfsoCxByPpG/GPjaj3dhkT9WBCE9CzZhFVrbZw=
X-Received: by 2002:a05:6102:3f01:b0:467:7a5:c475 with SMTP id
 k1-20020a0561023f0100b0046707a5c475mr1046239vsv.35.1704707936989; Mon, 08 Jan
 2024 01:58:56 -0800 (PST)
MIME-Version: 1.0
References: <20240103145703.443173-1-jose.quaresma@foundries.io>
In-Reply-To: <20240103145703.443173-1-jose.quaresma@foundries.io>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 8 Jan 2024 09:58:46 +0000
Message-ID: <CANPvuRm-beUxEtBq2LKBy+iJm88KwrK0TVLQdvQ+Boo+_c38hA@mail.gmail.com>
Subject: Re: [meta-oe][master][kirkstone][PATCH] layer.conf: Add
 libdevmapper-native PREFERRED_RPROVIDER
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000007b766060e6c3f7e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 09:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108127

--00000000000007b766060e6c3f7e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Gentle ping

Jose Quaresma <quaresma.jose@gmail.com> escreveu no dia quarta, 3/01/2024
=C3=A0(s) 14:57:

> The libdevmapper recipe don't provide any package and is only
> there to resolve circular dependencies [1].
> We already have the libdevmapper PREFERRED_RPROVIDER but the native
> it's missing.
>
> Fixes:
> | NOTE: Multiple providers are available for runtime libdevmapper-native
> (libdevmapper-native, lvm2-native)
> | Consider defining a PREFERRED_RPROVIDER entry to match
> libdevmapper-native
>
> [1]
> https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-sup=
port/lvm2?id=3D3f64779eae2d8312f569bee863f90ec4f8176e6c
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta-oe/conf/layer.conf | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
> index 0ca7d7d7d..a0c644a2f 100644
> --- a/meta-oe/conf/layer.conf
> +++ b/meta-oe/conf/layer.conf
> @@ -47,6 +47,7 @@ LAYERSERIES_COMPAT_openembedded-layer =3D "kirkstone"
>  LICENSE_PATH +=3D "${LAYERDIR}/licenses"
>
>  PREFERRED_RPROVIDER_libdevmapper =3D "lvm2"
> +PREFERRED_RPROVIDER_libdevmapper-native =3D "lvm2-native"
>  PREFERRED_PROVIDER_android-tools-conf ?=3D "android-tools-conf"
>
>  SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
> --
> 2.43.0
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000007b766060e6c3f7e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Gentle ping</div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">Jose Quaresma &lt;<a href=3D"mailto:quares=
ma.jose@gmail.com">quaresma.jose@gmail.com</a>&gt; escreveu no dia quarta, =
3/01/2024 =C3=A0(s) 14:57:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">The libdevmapper recipe don&#39;t provide any package and is onl=
y<br>
there to resolve circular dependencies [1].<br>
We already have the libdevmapper PREFERRED_RPROVIDER but the native<br>
it&#39;s missing.<br>
<br>
Fixes:<br>
| NOTE: Multiple providers are available for runtime libdevmapper-native (l=
ibdevmapper-native, lvm2-native)<br>
| Consider defining a PREFERRED_RPROVIDER entry to match libdevmapper-nativ=
e<br>
<br>
[1] <a href=3D"https://git.openembedded.org/meta-openembedded/commit/meta-o=
e/recipes-support/lvm2?id=3D3f64779eae2d8312f569bee863f90ec4f8176e6c" rel=
=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-openemb=
edded/commit/meta-oe/recipes-support/lvm2?id=3D3f64779eae2d8312f569bee863f9=
0ec4f8176e6c</a><br>
<br>
Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries.=
io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
---<br>
=C2=A0meta-oe/conf/layer.conf | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf<br>
index 0ca7d7d7d..a0c644a2f 100644<br>
--- a/meta-oe/conf/layer.conf<br>
+++ b/meta-oe/conf/layer.conf<br>
@@ -47,6 +47,7 @@ LAYERSERIES_COMPAT_openembedded-layer =3D &quot;kirkstone=
&quot;<br>
=C2=A0LICENSE_PATH +=3D &quot;${LAYERDIR}/licenses&quot;<br>
<br>
=C2=A0PREFERRED_RPROVIDER_libdevmapper =3D &quot;lvm2&quot;<br>
+PREFERRED_RPROVIDER_libdevmapper-native =3D &quot;lvm2-native&quot;<br>
=C2=A0PREFERRED_PROVIDER_android-tools-conf ?=3D &quot;android-tools-conf&q=
uot;<br>
<br>
=C2=A0SIGGEN_EXCLUDERECIPES_ABISAFE +=3D &quot; \<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--00000000000007b766060e6c3f7e--

