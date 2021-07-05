Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.13581.1625505585243951691
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jul 2021 10:19:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jjb4pfio;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: texier.pj2@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id i94so22928164wri.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jul 2021 10:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d++Txx8s3qLRD9K8+E7adoQehN/p/Rl5omK9xEuU938=;
        b=jjb4pfioEHaWQ3tPQ6aXRvSTdnep6tmvjY75FD+dT3P1xw01VF9+c6sB6H6Cf3bMKz
         1jUZfyXXb39GEL2F+LKfkKQtPfgGIkAnpBAXCvEUFzsamfrLzXFsgeYaFnNpNUHLahjE
         +BYn/cT2FNf+vd6s6pUv6BWRDXtWKh+eh3PG2S9sV+PV3ycUJcKT+CorNT/d1bunQjGG
         nzuNAApwL3LDLXj8yFYmVQf0tz1JUeNSAjMF4MrI1eHayosibQX/3EnGAIuYZsRrLe6B
         vqDAFkcDCvZsofCbeSQ+4vxkDyA47f7VmSmdfO3dSZFQuP5kE3aSONU4izb76iK0B1Az
         FnAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d++Txx8s3qLRD9K8+E7adoQehN/p/Rl5omK9xEuU938=;
        b=E99fANdRcvKqZt2NemH1o1o1bvXbAn35P4aZ3diTSZ9ZNRUD/irSmpkvNMuc7kXWd8
         Aj4OpbniARxnalT5fTHVFfKBAX66i7CPhgxrl7YUvmqnHMhkJ+GJ/djin3TvzXdej1bI
         UEbAXDN50uHFqzu093ISr5TBkc0f/a2kyuD3sldlta0STZ6/5qZF4AZwVkIswRm4DrPl
         T8Z/OVpIitGp03AwCED5+qnr1cTH42Tnr8AQ7ZL6XdzNlCEMjUVngAj9cR7tZdqSjd9y
         x0XyO9BhIdkaMR3BmVxHsENBSnvz6NakVWeI/YTKwvgV/cYw1ASLLHS0nZGrm4ldVefk
         iFRA==
X-Gm-Message-State: AOAM531JvkzM8TcWvHPzWw4UvphSaODtkquLroZKu+wG3aRJjGfK4F39
	Ur0flHrDYIfgl6YCN4TbBa/1tmHSNLVuNy3p8+4=
X-Google-Smtp-Source: ABdhPJzUKWwKbKdznF184XXefXcFj+aXGcd+wXIMfFQQU1LWH9Z5CsNX3ufSLvILB7da4n8LHqtK91uFE81zQJExO7U=
X-Received: by 2002:a5d:64ee:: with SMTP id g14mr17767734wri.66.1625505583697;
 Mon, 05 Jul 2021 10:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210704111141.13875-1-texier.pj2@gmail.com> <CAMKF1soEK_tzmod_auX3SiPi8qu7z5FyE3P7zhyWCb-2uYLkpA@mail.gmail.com>
In-Reply-To: <CAMKF1soEK_tzmod_auX3SiPi8qu7z5FyE3P7zhyWCb-2uYLkpA@mail.gmail.com>
From: "Pierre-Jean Texier" <texier.pj2@gmail.com>
Date: Mon, 5 Jul 2021 19:19:32 +0200
Message-ID: <CALRtUqvmN_rUvzsuwq31Rz1M6Bmhj4HPK9U+aKsZ2+7TGQF24Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] fmt: upgrade 7.1.3 -> 8.0.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e58f9d05c66382aa"

--000000000000e58f9d05c66382aa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

Le lun. 5 juil. 2021 =C3=A0 02:46, Khem Raj <raj.khem@gmail.com> a =C3=A9c=
rit :

> Thanks Pierre
>
> This however is causing spdlog to fail with new version of fmt, can
> you also look into spdlog failure ?
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1386


Sure, I will do

Thanks

Pierre-Jean


>
> On Sun, Jul 4, 2021 at 4:12 AM Pierre-Jean Texier <texier.pj2@gmail.com>
> wrote:
> >
> > See full changelog https://github.com/fmtlib/fmt/releases/tag/8.0.1
> >
> > Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
> > ---
> >  meta-oe/recipes-support/fmt/{fmt_7.1.3.bb =3D> fmt_8.0.1.bb} | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-oe/recipes-support/fmt/{fmt_7.1.3.bb =3D> fmt_8.0.1.bb} (=
90%)
> >
> > diff --git a/meta-oe/recipes-support/fmt/fmt_7.1.3.bb
> b/meta-oe/recipes-support/fmt/fmt_8.0.1.bb
> > similarity index 90%
> > rename from meta-oe/recipes-support/fmt/fmt_7.1.3.bb
> > rename to meta-oe/recipes-support/fmt/fmt_8.0.1.bb
> > index 9820b86470..6a10e0c9c3 100644
> > --- a/meta-oe/recipes-support/fmt/fmt_7.1.3.bb
> > +++ b/meta-oe/recipes-support/fmt/fmt_8.0.1.bb
> > @@ -5,7 +5,7 @@ LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D
> "file://LICENSE.rst;md5=3Daf88d758f75f3c5c48a967501f24384b"
> >
> >  SRC_URI +=3D "git://github.com/fmtlib/fmt"
> > -SRCREV =3D "7bdf0628b1276379886c7f6dda2cef2b3b374f0b"
> > +SRCREV =3D "d141cdbeb0fb422a3fb7173b285fd38e0d1772dc"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > --
> > 2.17.1
> >
> >
> >=20
> >
>

--000000000000e58f9d05c66382aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Khem,<br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 5 juil. 2021 =C3=
=
=A0=C2=A002:46, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khe=
m@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Thanks Pierre<br>
<br>
This however is causing spdlog to fail with new version of fmt, can<br>
you also look into spdlog failure ?<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/88/buil=
ds/1386" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/typhoon/#/builders/88/builds/1386</a></blockquote><div><br></div><d=
iv>Sure, I will do</div><div><br></div><div>Thanks</div><div><br></div><div=
>Pierre-Jean</div><div><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><br>
<br>
On Sun, Jul 4, 2021 at 4:12 AM Pierre-Jean Texier &lt;<a href=3D"mailto:te=
xier.pj2@gmail.com" target=3D"_blank">texier.pj2@gmail.com</a>&gt; wrote:<b=
r>
&gt;<br>
&gt; See full changelog <a href=3D"https://github.com/fmtlib/fmt/releases/=
tag/8.0.1" rel=3D"noreferrer" target=3D"_blank">https://github.com/fmtlib/f=
mt/releases/tag/8.0.1</a><br>
&gt;<br>
&gt; Signed-off-by: Pierre-Jean Texier &lt;<a href=3D"mailto:texier.pj2@gm=
ail.com" target=3D"_blank">texier.pj2@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-oe/recipes-support/fmt/{<a href=3D"http://fmt_7.1.3.bb" re=
l=3D"noreferrer" target=3D"_blank">fmt_7.1.3.bb</a> =3D&gt; <a href=3D"http=
://fmt_8.0.1.bb" rel=3D"noreferrer" target=3D"_blank">fmt_8.0.1.bb</a>} | 2=
 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;=C2=A0 rename meta-oe/recipes-support/fmt/{<a href=3D"http://fmt_7.1.3=
.bb" rel=3D"noreferrer" target=3D"_blank">fmt_7.1.3.bb</a> =3D&gt; <a href=
=3D"http://fmt_8.0.1.bb" rel=3D"noreferrer" target=3D"_blank">fmt_8.0.1.bb=
</a>} (90%)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-support/fmt/<a href=3D"http://fmt_7.1.3.=
bb" rel=3D"noreferrer" target=3D"_blank">fmt_7.1.3.bb</a> b/meta-oe/recipes=
-support/fmt/<a href=3D"http://fmt_8.0.1.bb" rel=3D"noreferrer" target=3D"_=
blank">fmt_8.0.1.bb</a><br>
&gt; similarity index 90%<br>
&gt; rename from meta-oe/recipes-support/fmt/<a href=3D"http://fmt_7.1.3.b=
b" rel=3D"noreferrer" target=3D"_blank">fmt_7.1.3.bb</a><br>
&gt; rename to meta-oe/recipes-support/fmt/<a href=3D"http://fmt_8.0.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">fmt_8.0.1.bb</a><br>
&gt; index 9820b86470..6a10e0c9c3 100644<br>
&gt; --- a/meta-oe/recipes-support/fmt/<a href=3D"http://fmt_7.1.3.bb" rel=
=
=3D"noreferrer" target=3D"_blank">fmt_7.1.3.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/fmt/<a href=3D"http://fmt_8.0.1.bb" rel=
=
=3D"noreferrer" target=3D"_blank">fmt_8.0.1.bb</a><br>
&gt; @@ -5,7 +5,7 @@ LICENSE =3D &quot;MIT&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE.rst;md5=3Daf88d758f75=
f3c5c48a967501f24384b&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/fmtlib/fm=
t" rel=3D"noreferrer" target=3D"_blank">github.com/fmtlib/fmt</a>&quot;<br>
&gt; -SRCREV =3D &quot;7bdf0628b1276379886c7f6dda2cef2b3b374f0b&quot;<br>
&gt; +SRCREV =3D &quot;d141cdbeb0fb422a3fb7173b285fd38e0d1772dc&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div></div>

--000000000000e58f9d05c66382aa--
