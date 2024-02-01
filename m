Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9326BC47DDF
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 05:36:59 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.9229.1706765816736930180
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Jan 2024 21:36:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mTcQ/XWE;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2909978624eso277231a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 Jan 2024 21:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706765816; x=1707370616; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9o6iXWvWuKAVGF/JfZja01qcBQXb01WvOY2fvwottkg=;
        b=mTcQ/XWE46K3Nd+Wc/QC85xRrwsXxx/cl7GSS/81UShEYcfTpLxmQpREWCr1pmXZmg
         nKU8F5BLAg5kqquQdFZbqyyXBDaCMSRZYM0u4p9ng0IZtT35HhdYXzeJu556RMIy8TSX
         0Jl07OZF1s7lYZpVlsMZ45PlzuoJVhCbZO4Kl+vdTzav7eLpOOL1VjyapIBxW8tAGtfp
         i7mW2n0/PUHLyQ36HizWIAtuo/vqI0YiwOxY1efEsqq/+x0Y+LlJc7Gb02bO86t+gDYb
         m0+5j4uudC1AmuZc8ghsAkR4022N1itH6D469ibUn10YawmvksX/ee2Hw4xYtFNvAJ+r
         rvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706765816; x=1707370616;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9o6iXWvWuKAVGF/JfZja01qcBQXb01WvOY2fvwottkg=;
        b=IwM7US4n7VqZoL7Ehoo7xn0rarZW0PJ9bNQOcOx2llSfY6rN8z6fsk5ML5PIM9Kj2T
         iGD7f5crVCwOid7n5lNP/cu9mf205wyH68s98kRNzRWxsY6iXGv57mGm0jiTWiBQmv31
         nBC3hCC70SJCtYB+29mqsXowowtELLqtZXJ3UPhFc6BitlQL7SSVtwSPilt6b1Johr3F
         TZSuCN/k7tkQYElwZqwjKbRqOQbF9t7Ib5E/FJl2V+DU+9hbw0cBXG7jAFodpmD5Kgun
         rRKxtWkE6qlbseyTuxGVgpMLkDMhYakE388AjVFSIABULBR3sTUnxMzGR6Uj700vkfiM
         hj9g==
X-Gm-Message-State: AOJu0YygI+506Q9nhkk7QQ9lITsZ2b2cgn4Wng5rCosyg7T/t68oaoQR
	X1tjcG50s3lSZRV27b+LQNswZXqWlo0xp4oYp2DL84efiNcPZ0jiDXjU1+S+JnPAiH7CTL78P7r
	kBVoVtrMUMCe5X9RZ/NlsxSxLIig=
X-Google-Smtp-Source: AGHT+IGY0t5BPHUXhN5t7hlPZOzIYS13goToukUf8l5aSECIfo9tQbJaN5WW8vN8QHT+OreXqMMhWtOz5lU/7aQzVVc=
X-Received: by 2002:a17:90a:6e44:b0:296:62d:6d9e with SMTP id
 s4-20020a17090a6e4400b00296062d6d9emr1852165pjm.29.1706765815940; Wed, 31 Jan
 2024 21:36:55 -0800 (PST)
MIME-Version: 1.0
References: <20240131074948.18462-1-alperyasinak1@gmail.com> <630968c2-01ba-450e-b714-c02b9561c98c@baylibre.com>
In-Reply-To: <630968c2-01ba-450e-b714-c02b9561c98c@baylibre.com>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Thu, 1 Feb 2024 08:36:44 +0300
Message-ID: <CAGpma=5Rb8dow=a8DM4pi+piifi_FE0x_7hOF_CBO7JPnatR9A@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-google-auth-oauthlib: add recipe
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002c8b3406104b62ad"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Feb 2024 05:36:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108513

--0000000000002c8b3406104b62ad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for feedback. I will be more careful.

Trevor Gamblin <tgamblin@baylibre.com>, 31 Oca 2024 =C3=87ar, 23:36 tarihin=
de
=C5=9Funu yazd=C4=B1:

>
> On 2024-01-31 02:49, Alper Ak wrote:
> > Signed-off-by: alperak <alperyasinak1@gmail.com>
> I know that the recipe name is fairly self-explanatory, but you should
> submit new recipes like this with a short commit message describing what
> the recipe does and why it'd be useful to have in the layer.
> > ---
> >   .../python/python3-google-auth-oauthlib_1.2.0.bb   | 14 +++++++++++++=
+
> >   1 file changed, 14 insertions(+)
> >   create mode 100644 meta-python/recipes-devtools/python/
> python3-google-auth-oauthlib_1.2.0.bb
> >
> > diff --git a/meta-python/recipes-devtools/python/
> python3-google-auth-oauthlib_1.2.0.bb
> b/meta-python/recipes-devtools/python/
> python3-google-auth-oauthlib_1.2.0.bb
> > new file mode 100644
> > index 000000000..b1e89e4b4
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/
> python3-google-auth-oauthlib_1.2.0.bb
> > @@ -0,0 +1,14 @@
> > +SUMMARY =3D "Google Authentication Library"
> > +DESCRIPTION =3D "This library provides oauthlib integration with
> google-auth"
> > +HOMEPAGE =3D "
> https://github.com/googleapis/google-auth-library-python-oauthlib"
> > +LICENSE =3D "Apache-2.0"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c=
6bd57"
> > +
> > +SRC_URI[sha256sum] =3D
> "292d2d3783349f2b0734a0a0207b1e1e322ac193c2c09d8f7c613fb7cc501ea8"
> > +
> > +inherit pypi setuptools3
> > +
> > +RDEPENDS:${PN} =3D " \
> > +    ${PYTHON_PN}-google-auth \
> > +    ${PYTHON_PN}-requests-oauthlib \
> > +"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#108505):
> https://lists.openembedded.org/g/openembedded-devel/message/108505
> > Mute This Topic: https://lists.openembedded.org/mt/104071227/7611679
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> tgamblin@baylibre.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000002c8b3406104b62ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for feedback. I will be more careful.</div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Trevor Gamblin=
 &lt;<a href=3D"mailto:tgamblin@baylibre.com">tgamblin@baylibre.com</a>&gt;=
, 31 Oca 2024 =C3=87ar, 23:36 tarihinde =C5=9Funu yazd=C4=B1:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 2024-01-31 02:49, Alper Ak wrote:<br>
&gt; Signed-off-by: alperak &lt;<a href=3D"mailto:alperyasinak1@gmail.com" =
target=3D"_blank">alperyasinak1@gmail.com</a>&gt;<br>
I know that the recipe name is fairly self-explanatory, but you should <br>
submit new recipes like this with a short commit message describing what <b=
r>
the recipe does and why it&#39;d be useful to have in the layer.<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../python/<a href=3D"http://python3-google-auth-oauthlib_=
1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-google-auth-oauthlib=
_1.2.0.bb</a>=C2=A0 =C2=A0| 14 ++++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 14 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta-python/recipes-devtools/python/<a =
href=3D"http://python3-google-auth-oauthlib_1.2.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">python3-google-auth-oauthlib_1.2.0.bb</a><br>
&gt;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-google-auth-oauthlib_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon3-google-auth-oauthlib_1.2.0.bb</a> b/meta-python/recipes-devtools/pyth=
on/<a href=3D"http://python3-google-auth-oauthlib_1.2.0.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-google-auth-oauthlib_1.2.0.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 000000000..b1e89e4b4<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-go=
ogle-auth-oauthlib_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-g=
oogle-auth-oauthlib_1.2.0.bb</a><br>
&gt; @@ -0,0 +1,14 @@<br>
&gt; +SUMMARY =3D &quot;Google Authentication Library&quot;<br>
&gt; +DESCRIPTION =3D &quot;This library provides oauthlib integration with=
 google-auth&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/googleapis/google-au=
th-library-python-oauthlib" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/googleapis/google-auth-library-python-oauthlib</a>&quot;<br>
&gt; +LICENSE =3D &quot;Apache-2.0&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D3b83ef96387f14655fc85=
4ddc3c6bd57&quot;<br>
&gt; +<br>
&gt; +SRC_URI[sha256sum] =3D &quot;292d2d3783349f2b0734a0a0207b1e1e322ac193=
c2c09d8f7c613fb7cc501ea8&quot;<br>
&gt; +<br>
&gt; +inherit pypi setuptools3<br>
&gt; +<br>
&gt; +RDEPENDS:${PN} =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 ${PYTHON_PN}-google-auth \<br>
&gt; +=C2=A0 =C2=A0 ${PYTHON_PN}-requests-oauthlib \<br>
&gt; +&quot;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#108505): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/108505" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/108505</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10407122=
7/7611679" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/104071227/7611679</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:tgamblin@baylibre.c=
om" target=3D"_blank">tgamblin@baylibre.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--0000000000002c8b3406104b62ad--

