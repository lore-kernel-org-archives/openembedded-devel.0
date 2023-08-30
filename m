Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E19C83F01
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 17:32:19 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.833.1693416731446672840
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Aug 2023 10:32:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=D/KUksGN;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-31dca134c83so3103233f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 10:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693416730; x=1694021530; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KpNB2l7poggDHOzryyzmVkmkqDOkBNqdGZ17N3s0t64=;
        b=D/KUksGNGj7RN8J4jqlDM2F5en+lGOccfy/OzDIIPCDyRAvXsWxlpVwwX3gj0ZtBP9
         7BflJLV/HLXcfqCpaVP2/evcj03P+BAjXeQJTHYAkzuj/vJHRwAtx22Raxp7X9njWUiU
         C551EsZs2s/m6CxB6W+ovgaQ+XuhDeuJ1alSQTE/Kah9u6zmdEEksG+Vy38b0SR/5WbP
         FDnVOJPyJP3IEIXXuZH5SI2ZJVOWFW9clrRnCO/an29Nbt8Bu1BH1qfHr6MTqh5KNdhg
         PWq4jI6vcpV2jl4cJRS+xstfGVt8U1Ns9N/VxBJNU4EskiJ6D7FH+iIIdpkwJbdYdNnC
         ROXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693416730; x=1694021530;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KpNB2l7poggDHOzryyzmVkmkqDOkBNqdGZ17N3s0t64=;
        b=i3cX5jPg0nt15NHzUr373Ign2gyqjWcuEHuVFuDqlx0/bgKNEqd69X4UQFbecLcCPk
         6wxrV/a+2wbhX6H43bHPIF4S0wsLTGnYh1Bg/ZnNKDltkoAK9VVHm2kkkwsratmQLt4G
         42Vp55RYefvFrLWo+rXkqCVC0BtkLm4FNJ4DTg/pkxbfiUq8tw8dKMAMtsS19cNT3aHi
         oevCv/m133TorPul6Pka5CgI4CdAJk2rwDULIpWXjd8U0kMYqGPaExt85zhzC95iJp0d
         6CxPwqcVTp1kZCWLqPpH2j/LYP0t8NUitmvpkuoHfWAa7ArtF5lRo/2QvYVnx7/O16EP
         ZQmA==
X-Gm-Message-State: AOJu0YzyeKvmepgHoteMTtXtIYNe/v4Geq23dX70gGXKrbci9qDw4atN
	jidGhe9zSW4stwPYW9SyphcN8XUOIDVYGOecUoE=
X-Google-Smtp-Source: AGHT+IGHN0HBMOPmdp4GiQCdxhUHn0pUOLtjcsNVOJe0phcuifUu69K8mq4bM/QODkfkISaEZprYsup5nzvb9dMFCng=
X-Received: by 2002:a5d:65d1:0:b0:319:8bd0:d18c with SMTP id
 e17-20020a5d65d1000000b003198bd0d18cmr2216208wrw.52.1693416729612; Wed, 30
 Aug 2023 10:32:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230830081550.1364085-1-f_l_k@t-online.de>
In-Reply-To: <20230830081550.1364085-1-f_l_k@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 30 Aug 2023 19:31:45 +0200
Message-ID: <CA+chaQcL=niTBrmMhr-5o9G1oiMFad+eRfSqNe7fDCK4MTHweg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/3] spice: add missing dependency on orc
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a01bbf0604274eb1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 17:32:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104677

--000000000000a01bbf0604274eb1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

On Wed, Aug 30, 2023 at 10:16=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wr=
ote:

> this fixes:
> meson.build:139:23: ERROR: Dependency "orc-0.4" not found, tried pkgconfi=
g
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-networking/recipes-support/spice/spice_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-support/spice/spice_git.bb
> b/meta-networking/recipes-support/spice/spice_git.bb
> index 78e3b0d88..a1f3010dd 100644
> --- a/meta-networking/recipes-support/spice/spice_git.bb
> +++ b/meta-networking/recipes-support/spice/spice_git.bb
> @@ -25,7 +25,7 @@ CVE_STATUS[CVE-2018-10893] =3D "fixed-version: patched
> already, caused by inaccura
>
>  inherit meson gettext python3native python3-dir pkgconfig
>
> -DEPENDS =3D "spice-protocol jpeg pixman alsa-lib glib-2.0 gdk-pixbuf lz4
> python3-pyparsing-native python3-six-native glib-2.0-native zlib"
> +DEPENDS =3D "spice-protocol jpeg pixman alsa-lib glib-2.0 gdk-pixbuf lz4
> orc python3-pyparsing-native python3-six-native glib-2.0-native zlib"
>  DEPENDS:append:class-nativesdk =3D " nativesdk-openssl"
>
>  export PYTHON=3D"${STAGING_BINDIR_NATIVE}/python3-native/python3"
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104662):
> https://lists.openembedded.org/g/openembedded-devel/message/104662
> Mute This Topic: https://lists.openembedded.org/mt/101048294/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000a01bbf0604274eb1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Acked-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@=
gmail.com">Martin.Jansa@gmail.com</a>&gt;<br></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 30, 2023 at 10:16=
=E2=80=AFAM Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-on=
line.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">this fixes:<br>
meson.build:139:23: ERROR: Dependency &quot;orc-0.4&quot; not found, tried =
pkgconfig<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0meta-networking/recipes-support/spice/<a href=3D"http://spice_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">spice_git.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-networking/recipes-support/spice/<a href=3D"http://spice_=
git.bb" rel=3D"noreferrer" target=3D"_blank">spice_git.bb</a> b/meta-networ=
king/recipes-support/spice/<a href=3D"http://spice_git.bb" rel=3D"noreferre=
r" target=3D"_blank">spice_git.bb</a><br>
index 78e3b0d88..a1f3010dd 100644<br>
--- a/meta-networking/recipes-support/spice/<a href=3D"http://spice_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">spice_git.bb</a><br>
+++ b/meta-networking/recipes-support/spice/<a href=3D"http://spice_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">spice_git.bb</a><br>
@@ -25,7 +25,7 @@ CVE_STATUS[CVE-2018-10893] =3D &quot;fixed-version: patch=
ed already, caused by inaccura<br>
<br>
=C2=A0inherit meson gettext python3native python3-dir pkgconfig<br>
<br>
-DEPENDS =3D &quot;spice-protocol jpeg pixman alsa-lib glib-2.0 gdk-pixbuf =
lz4 python3-pyparsing-native python3-six-native glib-2.0-native zlib&quot;<=
br>
+DEPENDS =3D &quot;spice-protocol jpeg pixman alsa-lib glib-2.0 gdk-pixbuf =
lz4 orc python3-pyparsing-native python3-six-native glib-2.0-native zlib&qu=
ot;<br>
=C2=A0DEPENDS:append:class-nativesdk =3D &quot; nativesdk-openssl&quot;<br>
<br>
=C2=A0export PYTHON=3D&quot;${STAGING_BINDIR_NATIVE}/python3-native/python3=
&quot;<br>
-- <br>
2.41.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#104662): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/104662" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/104662</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101048294/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101048294/3617156</a><br>
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

--000000000000a01bbf0604274eb1--

