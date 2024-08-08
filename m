Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF91CC52D7B
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 15:36:08 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.63010.1723131360470324419
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 08:36:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RzGEJBcN;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2cf213128a1so891900a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 08:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723131360; x=1723736160; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3W6Vsd513s1BaLfzMBDiUxvLTbV7gdckFzbbaphOUCI=;
        b=RzGEJBcN2bJ+OkfTIWk8zqs77yxP15T9S7YASdvstg0vno858gfHTaONO58MxwxabV
         qlNOTPJ5LsmBMh1gdyVINlHO6FgM7wkqofmGxN+f1XACW+brPUhumCnDlfyrnW1nDdl9
         P9SgoxqNn7b7nerYFoKHE5e+ge5ovH1b40rU3KZFwxdmlmsiQkxHJxaNvGcIV72X854j
         s4Rwvjjn5ZaD7GZGH0U7ZmQlG+DguR4rq1h08LXkmdcNLiW6cyog2YZAa+S+PflwUYRP
         FnU7N2ZGl3boIcxp3ZUFLPnG3pHSl+TUwn/rHjm3+tfapS5LmCgIsv3jhnOzrq4ARTei
         As5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723131360; x=1723736160;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3W6Vsd513s1BaLfzMBDiUxvLTbV7gdckFzbbaphOUCI=;
        b=OSXUs1JVyr3Awra1KbhkZOCmPXhTdpLD8ZkjY3RphMvHgxrf+1I5HKUw14xRYn/vCw
         WicKentzyZ5D5LmVmyW6ke5Yph6fkL6XZobJe9z3RLIga5sU4UesSj7aFeY2ocVFmV1N
         XRhm1zWpSLJSBkEC0qpeS/C30iOKUMBTxnfyxKLKudCX38NWmh7bYdIFjZlA99ABD4El
         fTk2+rH1Y0+AiNyhEKtOOPM/5jFkjP+vYw/v43t09Ny/94Ikd/xpMALEaNyHsUngtupt
         wKivAH1kSIXcaNGF17Ruiy5p0jL25e3leGKwZy1eyYV8XOVqb30PUvACkhYfWpWGSeJA
         FCrQ==
X-Gm-Message-State: AOJu0Yw0RwE8MzLCDY4M1T6+vL5H86liOdSBwg5oJ2R037D2XPvcDQmp
	i7iSsmCrxJt99SMazlVVg1iirt7mmyWiccrc9U4w5IhOwL0I9In4Qf5zxfGca6bfUXWt5MpcuAH
	mHTtaAtilZ4ThF87wORki2q0ghfs=
X-Google-Smtp-Source: AGHT+IF2OJ5jAS1KTETfUG4l9695iI3EpPK595wEWGgfHMadENeCK62RFnV/BPQ2og1ZWWOfnjhGt4TzaRNLu+vB1JA=
X-Received: by 2002:a17:90a:ff0f:b0:2bf:7eb7:373b with SMTP id
 98e67ed59e1d1-2d1c346109bmr2542683a91.33.1723131359712; Thu, 08 Aug 2024
 08:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240807131419.150841-1-alperyasinak1@gmail.com> <CAMKF1spi8-TBQ-R98yZcxJcgHXB+-wGP3pcT_SLHBDyfs3emWQ@mail.gmail.com>
In-Reply-To: <CAMKF1spi8-TBQ-R98yZcxJcgHXB+-wGP3pcT_SLHBDyfs3emWQ@mail.gmail.com>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Thu, 8 Aug 2024 18:35:47 +0300
Message-ID: <CAGpma=7B=SMu+pjprbMYvjdNTbuSXTkdnLKo1jNU8zQoF5K7aA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCHv2] python3-qrcode: switch to PEP-517
 build backend
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000098dba4061f2dc8c4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 15:36:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111667

--00000000000098dba4061f2dc8c4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You are welcome and thank you for the information. I will be more carefull
next time.

Khem Raj <raj.khem@gmail.com>, 7 A=C4=9Fu 2024 =C3=87ar, 20:40 tarihinde =
=C5=9Funu yazd=C4=B1:

> Thanks for all the patches for fixing this PEP-517 build issues. It
> would be good if you sent them as a single series instead of
> individual patches, this would help us maintainers who use tools to
> get patches from
> mailing list using b4 etc.
>
> On Wed, Aug 7, 2024 at 6:14=E2=80=AFAM Alper Ak via lists.openembedded.or=
g
> <alperyasinak1=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > The project has a proper pyproject.toml which declares the
> setuptools.build.meta PEP-517 backend.
> >
> > Fix:
> >
> > WARNING: python3-qrcode-7.4.2-r0 do_check_backend: QA Issue: inherits
> setuptools3 but has pyproject.toml with setuptools.build_meta, use the
> correct class [pep517-backend]
> >
> > Signed-off-by: alperak <alperyasinak1@gmail.com>
> > ---
> >  Misspelled subject in v1.
> >
> >  meta-python/recipes-devtools/python/python3-qrcode_7.4.2.bb | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-qrcode_7.4.2.b=
b
> b/meta-python/recipes-devtools/python/python3-qrcode_7.4.2.bb
> > index 204f4ecee..49cf62860 100644
> > --- a/meta-python/recipes-devtools/python/python3-qrcode_7.4.2.bb
> > +++ b/meta-python/recipes-devtools/python/python3-qrcode_7.4.2.bb
> > @@ -3,10 +3,9 @@ SECTION =3D "devel/python"
> >  LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4b802d2a65df4626623c79757f4=
86af9"
> >
> > -PYPI_PACKAGE =3D "qrcode"
> >  SRC_URI[sha256sum] =3D
> "9dd969454827e127dbd93696b20747239e6d540e082937c90f14ac95b30f5845"
> >
> > -inherit pypi setuptools3
> > +inherit pypi python_setuptools_build_meta
> >
> >  RDEPENDS:${PN} =3D " \
> >      python3-six \
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#111634):
> https://lists.openembedded.org/g/openembedded-devel/message/111634
> > Mute This Topic: https://lists.openembedded.org/mt/107768607/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--00000000000098dba4061f2dc8c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">You are welcome and thank you=C2=A0for the information. I =
will be more carefull next time.</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">Khem Raj &lt;<a href=3D"mailto:raj.khem@gma=
il.com">raj.khem@gmail.com</a>&gt;, 7 A=C4=9Fu 2024 =C3=87ar, 20:40 tarihin=
de =C5=9Funu yazd=C4=B1:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Thanks for all the patches for fixing this PEP-517 build issues.=
 It<br>
would be good if you sent them as a single series instead of<br>
individual patches, this would help us maintainers who use tools to<br>
get patches from<br>
mailing list using b4 etc.<br>
<br>
On Wed, Aug 7, 2024 at 6:14=E2=80=AFAM Alper Ak via <a href=3D"http://lists=
.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.=
org</a><br>
&lt;alperyasinak1=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" tar=
get=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; The project has a proper pyproject.toml which declares the setuptools.=
build.meta PEP-517 backend.<br>
&gt;<br>
&gt; Fix:<br>
&gt;<br>
&gt; WARNING: python3-qrcode-7.4.2-r0 do_check_backend: QA Issue: inherits =
setuptools3 but has pyproject.toml with setuptools.build_meta, use the corr=
ect class [pep517-backend]<br>
&gt;<br>
&gt; Signed-off-by: alperak &lt;<a href=3D"mailto:alperyasinak1@gmail.com" =
target=3D"_blank">alperyasinak1@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 Misspelled subject in v1.<br>
&gt;<br>
&gt;=C2=A0 meta-python/recipes-devtools/python/<a href=3D"http://python3-qr=
code_7.4.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-qrcode_7.4.2.bb=
</a> | 3 +--<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-qrcode_7.4.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-qrcode_7=
.4.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3=
-qrcode_7.4.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-qrcode_7.4.2=
.bb</a><br>
&gt; index 204f4ecee..49cf62860 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-qr=
code_7.4.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-qrcode_7.4.2.bb=
</a><br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-qr=
code_7.4.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-qrcode_7.4.2.bb=
</a><br>
&gt; @@ -3,10 +3,9 @@ SECTION =3D &quot;devel/python&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;MIT&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D4b802d2a65df4626=
623c79757f486af9&quot;<br>
&gt;<br>
&gt; -PYPI_PACKAGE =3D &quot;qrcode&quot;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;9dd969454827e127dbd93696b20747239e6=
d540e082937c90f14ac95b30f5845&quot;<br>
&gt;<br>
&gt; -inherit pypi setuptools3<br>
&gt; +inherit pypi python_setuptools_build_meta<br>
&gt;<br>
&gt;=C2=A0 RDEPENDS:${PN} =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-six \<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#111634): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/111634" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/111634</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10776860=
7/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/107768607/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--00000000000098dba4061f2dc8c4--

