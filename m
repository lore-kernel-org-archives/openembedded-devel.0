Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web12.1081.1606939338872930268
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Dec 2020 12:02:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gmklnpV9;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id a16so6283199ejj.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Dec 2020 12:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hu32/SyHVK1IRgsyvp0I1RtB75X+CyrROGwcmE3HWhk=;
        b=gmklnpV9dDpvywUkzKCvx5pfBNiWzg+WQlCFxzny7c+xfbSgC2SIecsWXkG4g+h540
         aQLcMD0WSGcXINF4s/o6eOydsu+QWlYaVWS4EQk15pk4Mr7xRPdBA39SRF8Jj0eGBy57
         /vNvdUOAEtmnyk8Uw5sfZi4AyPWWeMByaTbIZPGsFOJZz7go0o211qPQkptblJ9I9Si4
         gHR+OCCSLX7xaz2KkpZKuxam7tQyoqfavHtmhHBO3+xYjDpbFj16z98OZizpevuGamgm
         Ffmsv5Ua/RNUXF+YN07MNUftXjt7K10CyMcA1jW7+7TPtQcolXEV1ucNdGuMY100pjle
         FEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hu32/SyHVK1IRgsyvp0I1RtB75X+CyrROGwcmE3HWhk=;
        b=P9ZCtbp/cd4bZ5V5AwvRc1AmV5pscaz3ZMWAfrKwQwCD/xlPBvGU/IUxAOFXZ/B6s7
         9QF6uAN/xYNSQAUgaF6FepaIIFQHl7jh4AZ/xUbcroCUHgVOPQgYzJg0hQMTvdyPuPXr
         96pN3gAtuWGZ1t9yrKy4i9dhHFbJyDIkbRzhy+wJfsX8Qc+Z7zFaN0VhxkFXRO+hm95e
         q1vRoWrL71+ncPfk/UzfFafsAJZdUw+LGBcjm1SOshk0FeUya9hIw0FtfL3OBfzbATbd
         ZVFom3im7Wn1SJdK/n0NFJpgrUbbmKGdw4A7YLa3BG443yKSD76ovcF4wN3N0sFHr0JF
         LERA==
X-Gm-Message-State: AOAM531PBZS/9bta7YQa79PfPkIuVMrFzPBGX4DPWbjYgfds5FFxdsMD
	eZ4ushEgsspXwXEH151NN3t11OS+zqB84rdFo+4=
X-Google-Smtp-Source: ABdhPJwu6giAcQgIW8AdPS9Q1WniPM+Py/5SUSXm9XOS33aE2TINr2iCrvvF2M1DgqSG7gKNOP/J+Hihdxm+jZiWl+Y=
X-Received: by 2002:a17:906:5182:: with SMTP id y2mr1344448ejk.471.1606939337250;
 Wed, 02 Dec 2020 12:02:17 -0800 (PST)
MIME-Version: 1.0
References: <20201202152841.27649-1-Martin.Jansa@gmail.com> <CAMKF1srpBQcyUwJWX7M_sieZWrSjN9z1E=OoJJMLuPiR+mOzXQ@mail.gmail.com>
In-Reply-To: <CAMKF1srpBQcyUwJWX7M_sieZWrSjN9z1E=OoJJMLuPiR+mOzXQ@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 2 Dec 2020 21:02:06 +0100
Message-ID: <CA+chaQfoStZ0u1oR_xk21ZE+20H3v=60HB9Sn7msXwrjrDBXYg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nanopb: move to dynamic-layers
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005f5ff605b580b86d"

--0000000000005f5ff605b580b86d
Content-Type: text/plain; charset="UTF-8"

That would be fine as well, but would need protobuf to be moved as well.

I came across this just because of running yocto-check-layer on meta-oe
(without meta-python).

On Wed, Dec 2, 2020 at 7:59 PM Khem Raj <raj.khem@gmail.com> wrote:

> perhaps python3-protobuf should be in oe-core rather.
>
> On Wed, Dec 2, 2020 at 7:28 AM Martin Jansa <Martin.Jansa@gmail.com>
> wrote:
> >
> > * depends on python3-protobuf from meta-python:
> > * fixes:
> >   ERROR: Nothing RPROVIDES 'python3-protobuf' (but
> meta-oe/recipes-devtools/nanopb/nanopb_0.4.3.bb RDEPENDS on or otherwise
> requires it)
> >   NOTE: Runtime target 'python3-protobuf' is unbuildable, removing...
> >   Missing or unbuildable dependency chain was: ['python3-protobuf']
> >   ERROR: Required build target 'meta-world-pkgdata' has no buildable
> providers.
> >   Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> 'nanopb', 'python3-protobuf']
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  .../meta-python}/recipes-devtools/nanopb/nanopb_0.4.3.bb          | 0
> >  1 file changed, 0 insertions(+), 0 deletions(-)
> >  rename meta-oe/{ => dynamic-layers/meta-python}/recipes-devtools/nanopb/
> nanopb_0.4.3.bb (100%)
> >
> > diff --git a/meta-oe/recipes-devtools/nanopb/nanopb_0.4.3.bb
> b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/
> nanopb_0.4.3.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/nanopb/nanopb_0.4.3.bb
> > rename to meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/
> nanopb_0.4.3.bb
> > --
> > 2.27.0
> >
> >
> > 
> >
>

--0000000000005f5ff605b580b86d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">That would be fine as well, but would need protobuf to be =
moved as well.<div><br></div><div>I came across this just because of runnin=
g yocto-check-layer on meta-oe (without meta-python).</div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 2, 2=
020 at 7:59 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">perhaps python3-protobuf should be in oe-core rather.<br>
<br>
On Wed, Dec 2, 2020 at 7:28 AM Martin Jansa &lt;<a href=3D"mailto:Martin.J=
ansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; * depends on python3-protobuf from meta-python:<br>
&gt; * fixes:<br>
&gt;=C2=A0 =C2=A0ERROR: Nothing RPROVIDES &#39;python3-protobuf&#39; (but =
meta-oe/recipes-devtools/nanopb/<a href=3D"http://nanopb_0.4.3.bb" rel=3D"n=
oreferrer" target=3D"_blank">nanopb_0.4.3.bb</a> RDEPENDS on or otherwise r=
equires it)<br>
&gt;=C2=A0 =C2=A0NOTE: Runtime target &#39;python3-protobuf&#39; is unbuil=
dable, removing...<br>
&gt;=C2=A0 =C2=A0Missing or unbuildable dependency chain was: [&#39;python=
3-protobuf&#39;]<br>
&gt;=C2=A0 =C2=A0ERROR: Required build target &#39;meta-world-pkgdata&#39;=
 has no buildable providers.<br>
&gt;=C2=A0 =C2=A0Missing or unbuildable dependency chain was: [&#39;meta-w=
orld-pkgdata&#39;, &#39;nanopb&#39;, &#39;python3-protobuf&#39;]<br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.=
com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../meta-python}/recipes-devtools/nanopb/<a href=3D"http://nano=
pb_0.4.3.bb" rel=3D"noreferrer" target=3D"_blank">nanopb_0.4.3.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0<br>
&gt;=C2=A0 1 file changed, 0 insertions(+), 0 deletions(-)<br>
&gt;=C2=A0 rename meta-oe/{ =3D&gt; dynamic-layers/meta-python}/recipes-de=
vtools/nanopb/<a href=3D"http://nanopb_0.4.3.bb" rel=3D"noreferrer" target=
=3D"_blank">nanopb_0.4.3.bb</a> (100%)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-devtools/nanopb/<a href=3D"http://nanopb=
_0.4.3.bb" rel=3D"noreferrer" target=3D"_blank">nanopb_0.4.3.bb</a> b/meta-=
oe/dynamic-layers/meta-python/recipes-devtools/nanopb/<a href=3D"http://nan=
opb_0.4.3.bb" rel=3D"noreferrer" target=3D"_blank">nanopb_0.4.3.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta-oe/recipes-devtools/nanopb/<a href=3D"http://nanopb_=
0.4.3.bb" rel=3D"noreferrer" target=3D"_blank">nanopb_0.4.3.bb</a><br>
&gt; rename to meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/=
<a href=3D"http://nanopb_0.4.3.bb" rel=3D"noreferrer" target=3D"_blank">nan=
opb_0.4.3.bb</a><br>
&gt; --<br>
&gt; 2.27.0<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div>

--0000000000005f5ff605b580b86d--
