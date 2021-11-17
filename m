Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2199C433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 09:29:09 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web09.4932.1637141349326351767
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 01:29:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FBq/EF1C;
 spf=pass (domain: gmail.com, ip: 209.85.216.51,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id gt5so1881975pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 01:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+HqwVKX/igYfuf/PbxNh5RQwhBInVNwIs/K5j5FyQgM=;
        b=FBq/EF1CjEpLgOeMXtewaaL0PHTtFlG1CoH+7D9DqAvg6e0HEol7I9f4Rv+v0bjUTi
         s/Vz3LPM5ty+jIhcBhlvKQznANOSuM61z0b+HIoPTK57Ly2i5SzgIZXmDuRS1qN7aNkI
         cRrUJoP+Gmta3FRLooLBNfXV8oaB5OnqQ67qu+4VI4+nxM55SHSvyENVxrMQbcE8l70P
         Sd4/nsn6kW+BaMscoKUfzxCDQvC+DdaySDAtHvV6moIsoRdO4KponJncV2Lt3Vg93FvK
         MAxkwAuSMQ4kfdtrgECURRxoSJL5ymaFBzQx4yOBqgk4wN0T6MsYQFeBSfBpQkkcpN9s
         kNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+HqwVKX/igYfuf/PbxNh5RQwhBInVNwIs/K5j5FyQgM=;
        b=glQeqnzRpZjQPwZKNsE+A0A2VKsl6MKDmmXlzl1LeTLr0LrInViGAT7A6IiuzHM+S8
         W58c86b/r4MUHRQQU9i3YBGBpZbED7eB990gdlKs6LG4f+1oz0gLNQWaZ5D2cvz6/SUx
         T8GlxRgknfN3Lu6yc2JPvBHqBr7HssNlOsI86ksjx6bO30tI9Vd1OFsyPS/0nkh5Bx/T
         QaZ3kyNukuYBpgj3Iwub654CYYjT5b+zOVrFBshDPf4UjHiWqnnuMe92DCuSJFRrzx3O
         JXvMaeNAIYWpDHifki/TosmsoodyVzc1OZcN0MwOCteDX1JNVbhAKvYfAUk45RRBxKDc
         X/6Q==
X-Gm-Message-State: AOAM530f3ip3o+rK9TkQAXSJTkEyO7vgMF4uBiqQBwk2mgapbnDK6/N+
	NiBx9HdS8JjApd9Hu7qxQL5pNlJLEAal78GSxJg=
X-Google-Smtp-Source: 
 ABdhPJwiQg2GKCwiQlfopkXaFPe2Gp6iJOWNN6Ptqa6wW1wz9BXwgNkeULB+qY0TNev2VzMbXSjrY3Mjn4/yMyntquc=
X-Received: by 2002:a17:902:e852:b0:143:8152:26c7 with SMTP id
 t18-20020a170902e85200b00143815226c7mr53736807plg.75.1637141348477; Wed, 17
 Nov 2021 01:29:08 -0800 (PST)
MIME-Version: 1.0
References: <20211117080956.1887223-1-sean@geanix.com>
 <20211117080956.1887223-2-sean@geanix.com>
In-Reply-To: <20211117080956.1887223-2-sean@geanix.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 17 Nov 2021 10:28:57 +0100
Message-ID: 
 <CA+chaQfpssKCeLgvbqo72pz2dyqDCW+oaNv3DWo-kv1u0VONyQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] msgpack-cpp: fix msgpack-cpp is a header
 only library
To: Sean Nyekjaer <sean@geanix.com>
Cc: openembedded-devel@lists.openembedded.org, alex@linutronix.de,
	Sean Nyekjaer <sean.nyekjaer.ext@siemensgamesa.com>
Content-Type: multipart/alternative; boundary="00000000000085f00d05d0f8ace9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Nov 2021 09:29:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93991

--00000000000085f00d05d0f8ace9
Content-Type: text/plain; charset="UTF-8"

so ALLOW_EMPTY:${PN} isn't needed, right?

On Wed, Nov 17, 2021 at 9:10 AM Sean Nyekjaer <sean@geanix.com> wrote:

> From: Sean Nyekjaer <sean.nyekjaer.ext@siemensgamesa.com>
>
> ${PN} is empty so don't let the -dev package RDEPEND on it
>
> Signed-off-by: Sean Nyekjaer <sean.nyekjaer.ext@siemensgamesa.com>
> ---
>  meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.0.2.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.0.2.bb
> b/meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.0.2.bb
> index ef066753d..dc8f13c26 100644
> --- a/meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.0.2.bb
> +++ b/meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.0.2.bb
> @@ -19,4 +19,8 @@ S = "${WORKDIR}/git"
>
>  inherit cmake pkgconfig
>
> +ALLOW_EMPTY:${PN} = "1"
> +
> +RDEPENDS:${PN}-dev = ""
> +
>  BBCLASSEXTEND += "native nativesdk"
> --
> 2.33.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93990):
> https://lists.openembedded.org/g/openembedded-devel/message/93990
> Mute This Topic: https://lists.openembedded.org/mt/87115217/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000085f00d05d0f8ace9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">so=C2=A0<span style=3D"color:rgb(80,0,80)">ALLOW_EMPTY:${P=
N} isn&#39;t needed, right?</span></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 17, 2021 at 9:10 AM Sean Nyek=
jaer &lt;<a href=3D"mailto:sean@geanix.com">sean@geanix.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Sean Nyekj=
aer &lt;<a href=3D"mailto:sean.nyekjaer.ext@siemensgamesa.com" target=3D"_b=
lank">sean.nyekjaer.ext@siemensgamesa.com</a>&gt;<br>
<br>
${PN} is empty so don&#39;t let the -dev package RDEPEND on it<br>
<br>
Signed-off-by: Sean Nyekjaer &lt;<a href=3D"mailto:sean.nyekjaer.ext@siemen=
sgamesa.com" target=3D"_blank">sean.nyekjaer.ext@siemensgamesa.com</a>&gt;<=
br>
---<br>
=C2=A0meta-oe/recipes-devtools/msgpack/<a href=3D"http://msgpack-cpp_4.0.2.=
bb" rel=3D"noreferrer" target=3D"_blank">msgpack-cpp_4.0.2.bb</a> | 4 ++++<=
br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta-oe/recipes-devtools/msgpack/<a href=3D"http://msgpack-cpp=
_4.0.2.bb" rel=3D"noreferrer" target=3D"_blank">msgpack-cpp_4.0.2.bb</a> b/=
meta-oe/recipes-devtools/msgpack/<a href=3D"http://msgpack-cpp_4.0.2.bb" re=
l=3D"noreferrer" target=3D"_blank">msgpack-cpp_4.0.2.bb</a><br>
index ef066753d..dc8f13c26 100644<br>
--- a/meta-oe/recipes-devtools/msgpack/<a href=3D"http://msgpack-cpp_4.0.2.=
bb" rel=3D"noreferrer" target=3D"_blank">msgpack-cpp_4.0.2.bb</a><br>
+++ b/meta-oe/recipes-devtools/msgpack/<a href=3D"http://msgpack-cpp_4.0.2.=
bb" rel=3D"noreferrer" target=3D"_blank">msgpack-cpp_4.0.2.bb</a><br>
@@ -19,4 +19,8 @@ S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0inherit cmake pkgconfig<br>
<br>
+ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
+<br>
+RDEPENDS:${PN}-dev =3D &quot;&quot;<br>
+<br>
=C2=A0BBCLASSEXTEND +=3D &quot;native nativesdk&quot;<br>
-- <br>
2.33.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#93990): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/93990" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/93990</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87115217/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87115217/3617156</a><br>
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

--00000000000085f00d05d0f8ace9--

