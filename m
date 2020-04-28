Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.262.1588040372534495136
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Apr 2020 19:19:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@izotope.com header.s=google header.b=EjaOIKDe;
 spf=permerror, err=parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: izotope.com, ip: 209.85.128.65, mailfrom: mcampbell@izotope.com)
Received: by mail-wm1-f65.google.com with SMTP id e26so963260wmk.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2020 19:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=izotope.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s80Ngmq+rNHmA09+nZucd+6vPaA4Goxtds4w0ta7X3k=;
        b=EjaOIKDeH0F9J5Vpj5pPo2GlGJy5DCvO0Z/pwo+OjY8a87ijWXuZKOuTo7WVzcHfr1
         9VUX2G3aeeuhkWS8f/5WEmpNhBYk8BE59RQgQzdKgsJpf7en0IRynIXgOaYVf5TqpTJU
         TEbIe+jRqJj/P0MPVWkD0uv9oUy9zsFYIaF0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s80Ngmq+rNHmA09+nZucd+6vPaA4Goxtds4w0ta7X3k=;
        b=CMeodz1cx3uJVEHstePqfJ6VFG+32P2IslutgMp+kXz6qO8L77vQRmsrBotLnAoQs/
         hrKve5GteNjvfvhoGaH0pgMKxS8dzyZQRkdAXpSzAOflnZNEtWpaXNDNDqMpxpei6r2g
         +TvnFnCrSF5ILTRr/NKvLWT/47hdmhkSiNu8VWGzISVxyNQYFJRZhj/386/IBCZ9o+Rg
         wYSE7ka7att6rFrFjnL+RWlycqdNLZ08Wl2wBEFJqfGBT7UKoTyRyR2lw093dIF7PdN5
         Cv2vNDiZ0PQpzARuA1rvk4j4GkH5uRHMxeyozCN/fmJqNti9YkvJXCSqkOzv8L6cRJ6i
         nlLg==
X-Gm-Message-State: AGi0PuYlnYbt/Z/972g/MRRp0oGdzox780eSGoZZvHc0vxZTuWniiVWQ
	mrPz+sTiTK+zOivwvOI+KgYCPC1KTwhAaIlR8AksQw==
X-Google-Smtp-Source: APiQypLSTkSDUQ20qur6IADigo6KlSuDqIx4HJ8BTOU4+WANll6CXQGWi/jmCz3xgJF/Tn0BErnjGTxQUu89VhhYLv4=
X-Received: by 2002:a1c:3b0a:: with SMTP id i10mr1802457wma.26.1588040371010;
 Mon, 27 Apr 2020 19:19:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200422200630.79513-1-mcampbell@izotope.com> <e4ac0a4da76740ed8a6919b6018cd2cc@XBOX03.axis.com>
 <CAMKF1sowV6rYshjjYxPsHDOwB7+nK3i2smSZ9cbgSBoj+vQaGQ@mail.gmail.com>
In-Reply-To: <CAMKF1sowV6rYshjjYxPsHDOwB7+nK3i2smSZ9cbgSBoj+vQaGQ@mail.gmail.com>
From: "Matt Campbell" <Mcampbell@izotope.com>
Date: Mon, 27 Apr 2020 22:19:20 -0400
Message-ID: <CAMDowVVpNt4hvy=CAujwTJSOXO4a3GZ_CKmA_u-9C-1u7mEpRg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] sdbus-c++-tools: add nativesdk
To: Khem Raj <raj.khem@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003414fb05a450760f"

--0000000000003414fb05a450760f
Content-Type: text/plain; charset="UTF-8"

Thanks for fixing that up, I appreciate it.

On Sat, Apr 25, 2020 at 11:33 AM Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Apr 24, 2020 at 12:31 PM Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
> >
> > > -----Original Message-----
> > > From: openembedded-devel@lists.openembedded.org <openembedded-
> > > devel@lists.openembedded.org> On Behalf Of Matt Campbell
> > > Sent: den 22 april 2020 22:07
> > > To: openembedded-devel@lists.openembedded.org
> > > Cc: Matthew Campbell <mcampbell@izotope.com>
> > > Subject: [oe] [meta-oe][PATCH v2] sdbus-c++-tools: add nativesdk
> > >
> > > Changes from v1:
> > > Fix formatting of patch
> >
> > The above should go below the --- line below as it relates to the
> > review process rather than the change itself.
> >
>
> right, this time I fixed the commit msg before picking it up.
>
> > //Peter
> >
> > > Signed-off-by: Matthew Campbell <mcampbell@izotope.com>
> > > ---
> > >  ...bus-c++-tools-native_0.8.1.bb => sdbus-c++-tools_0.8.1.bb} | 4
> +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >  rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-
> tools-native_0.8.1.bb
> > > => sdbus-c++-tools_0.8.1.bb} (89%)
> > >
> > > diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools-
> > > native_0.8.1.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-
> tools_0.8.1.bb
> > > similarity index 89%
> > > rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools-
> > > native_0.8.1.bb
> > > rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.1.bb
> > > index e18b9903d..9eaec0f2a 100644
> > > --- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools-native_0.8.1.bb
> > > +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.1.bb
> > > @@ -4,7 +4,7 @@ DESCRIPTION = "Native interface code generator for
> > > development with sdbus-c++"
> > >  LICENSE = "LGPLv2.1"
> > >  LIC_FILES_CHKSUM =
> > > "file://${S}/COPYING;md5=1803fa9c2c3ce8cb06b4861d75310742"
> > >
> > > -inherit cmake native
> > > +inherit cmake
> > >
> > >  DEPENDS += "expat"
> > >
> > > @@ -12,3 +12,5 @@ SRCREV = "3a4f343fb924650e7639660efa5f143961162044"
> > >  SRC_URI = "git://github.com/Kistler-Group/sdbus-
> > > cpp.git;protocol=https;branch=master;subpath=tools"
> > >
> > >  S = "${WORKDIR}/tools"
> > > +
> > > +BBCLASSEXTEND = "native nativesdk"
> > > --
> > > 2.20.1
> >
> > 
>


-- 
Matthew Campbell
Senior Embedded Systems Engineer
mcampbell@izotope.com

iZotope, Inc.
www.izotope.com

--0000000000003414fb05a450760f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for fixing that up, I appreciate it.</div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Apr 25,=
 2020 at 11:33 AM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.kh=
em@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Fri, Apr 24, 2020 at 12:31 PM Peter Kjellerstedt<br>
&lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter=
.kjellerstedt@axis.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: <a href=3D"mailto:openembedded-devel@lists.openembedded.or=
g" target=3D"_blank">openembedded-devel@lists.openembedded.org</a> &lt;open=
embedded-<br>
&gt; &gt; <a href=3D"mailto:devel@lists.openembedded.org" target=3D"_blank=
">devel@lists.openembedded.org</a>&gt; On Behalf Of Matt Campbell<br>
&gt; &gt; Sent: den 22 april 2020 22:07<br>
&gt; &gt; To: <a href=3D"mailto:openembedded-devel@lists.openembedded.org"=
 target=3D"_blank">openembedded-devel@lists.openembedded.org</a><br>
&gt; &gt; Cc: Matthew Campbell &lt;<a href=3D"mailto:mcampbell@izotope.com=
" target=3D"_blank">mcampbell@izotope.com</a>&gt;<br>
&gt; &gt; Subject: [oe] [meta-oe][PATCH v2] sdbus-c++-tools: add nativesdk=
<br>
&gt; &gt;<br>
&gt; &gt; Changes from v1:<br>
&gt; &gt; Fix formatting of patch<br>
&gt;<br>
&gt; The above should go below the --- line below as it relates to the<br>
&gt; review process rather than the change itself.<br>
&gt;<br>
<br>
right, this time I fixed the commit msg before picking it up.<br>
<br>
&gt; //Peter<br>
&gt;<br>
&gt; &gt; Signed-off-by: Matthew Campbell &lt;<a href=3D"mailto:mcampbell@=
izotope.com" target=3D"_blank">mcampbell@izotope.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 ...bus-c++-<a href=3D"http://tools-native_0.8.1.bb" rel=3D=
"noreferrer" target=3D"_blank">tools-native_0.8.1.bb</a> =3D&gt; sdbus-c++-=
<a href=3D"http://tools_0.8.1.bb" rel=3D"noreferrer" target=3D"_blank">tool=
s_0.8.1.bb</a>} | 4 +++-<br>
&gt; &gt;=C2=A0 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt; &gt;=C2=A0 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-<a href=
=3D"http://tools-native_0.8.1.bb" rel=3D"noreferrer" target=3D"_blank">too=
ls-native_0.8.1.bb</a><br>
&gt; &gt; =3D&gt; sdbus-c++-<a href=3D"http://tools_0.8.1.bb" rel=3D"noref=
errer" target=3D"_blank">tools_0.8.1.bb</a>} (89%)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools-<br>
&gt; &gt; <a href=3D"http://native_0.8.1.bb" rel=3D"noreferrer" target=3D"=
_blank">native_0.8.1.bb</a> b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-<a h=
ref=3D"http://tools_0.8.1.bb" rel=3D"noreferrer" target=3D"_blank">tools_0.=
8.1.bb</a><br>
&gt; &gt; similarity index 89%<br>
&gt; &gt; rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools-<br>
&gt; &gt; <a href=3D"http://native_0.8.1.bb" rel=3D"noreferrer" target=3D"=
_blank">native_0.8.1.bb</a><br>
&gt; &gt; rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-<a href=3D"ht=
tp://tools_0.8.1.bb" rel=3D"noreferrer" target=3D"_blank">tools_0.8.1.bb</a=
><br>
&gt; &gt; index e18b9903d..9eaec0f2a 100644<br>
&gt; &gt; --- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-<a href=3D"http:/=
/tools-native_0.8.1.bb" rel=3D"noreferrer" target=3D"_blank">tools-native_0=
.8.1.bb</a><br>
&gt; &gt; +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-<a href=3D"http:/=
/tools_0.8.1.bb" rel=3D"noreferrer" target=3D"_blank">tools_0.8.1.bb</a><br=
>
&gt; &gt; @@ -4,7 +4,7 @@ DESCRIPTION =3D &quot;Native interface code gene=
rator for<br>
&gt; &gt; development with sdbus-c++&quot;<br>
&gt; &gt;=C2=A0 LICENSE =3D &quot;LGPLv2.1&quot;<br>
&gt; &gt;=C2=A0 LIC_FILES_CHKSUM =3D<br>
&gt; &gt; &quot;file://${S}/COPYING;md5=3D1803fa9c2c3ce8cb06b4861d75310742=
&quot;<br>
&gt; &gt;<br>
&gt; &gt; -inherit cmake native<br>
&gt; &gt; +inherit cmake<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 DEPENDS +=3D &quot;expat&quot;<br>
&gt; &gt;<br>
&gt; &gt; @@ -12,3 +12,5 @@ SRCREV =3D &quot;3a4f343fb924650e7639660efa5f1=
43961162044&quot;<br>
&gt; &gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/Kistl=
er-Group/sdbus-" rel=3D"noreferrer" target=3D"_blank">github.com/Kistler-Gr=
oup/sdbus-</a><br>
&gt; &gt; cpp.git;protocol=3Dhttps;branch=3Dmaster;subpath=3Dtools&quot;<b=
r>
&gt; &gt;<br>
&gt; &gt;=C2=A0 S =3D &quot;${WORKDIR}/tools&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.20.1<br>
&gt;<br>
&gt; <br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr">Matthew Campbell<div>Senior Em=
bedded Systems Engineer</div><div><a href=3D"mailto:mcampbell@izotope.com" =
target=3D"_blank">mcampbell@izotope.com</a></div><div><br></div><div>iZotop=
e, Inc.</div><div><a href=3D"http://www.izotope.com" target=3D"_blank">www.=
izotope.com</a></div></div></div>

--0000000000003414fb05a450760f--
