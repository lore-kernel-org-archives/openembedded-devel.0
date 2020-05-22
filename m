Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
 by mx.groups.io with SMTP id smtpd.web11.20019.1590175070677710427
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2020 12:17:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=AiwRSanC;
 spf=pass (domain: ossystems.com.br, ip: 209.85.166.194, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-il1-f194.google.com with SMTP id b15so11706171ilq.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2020 12:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ClCHIzaZISjwMjyTYhe9YwEKCfNhrsusUTIoKBHKQd0=;
        b=AiwRSanCbeNozZP2aHL//kIv9vvBPwstdolQ2wBhwERyxuU5XklobplmtvpIUo21k2
         uTI1eamZ+ZgT0rQiafSnsvJGJz8DTj+wBtpftrV7SnRo6c1IdQD46MnRz5fB+rKANl5K
         5JlpCMJQKrxfv8RGtX5rlkFXLC+FoZKBVPE1O0tvbhyX5iksHKcqDCCyKC2ygC2GiafP
         axBgR0u3NHi6KI6sJj5/l15RPcJblpTpDXcWZ4iYKNM0ezAFW1t8HlKsaRBBVOIfalQA
         YRktdqJMBnNIeeIHrIc7Jd15vwC1zWNhWntXwUcT8+r4pu6hwiztHX5Y1rXnrt97f85w
         PTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ClCHIzaZISjwMjyTYhe9YwEKCfNhrsusUTIoKBHKQd0=;
        b=dbfkGUbFucjectqSk4ubILlHJJrmGMmteBiGAXw98xX26nfbs9SeV714K+Lcy36bkn
         0epjFaH0l9cmhfMbUrj0ggGYM0iNVG4YUY40wCAbJgUJKyYTk44ou+cxN5T37ciRq00p
         51IbACsLfIwG/Ts5HpZOJXLrD+ZnC2PYwWBTTQ4QgJ0Lj1SVwHkIi9djmNszsQ7KAoig
         wv3DlJfDgRku3cW2FPdmQpn1xrwUrtVtOSzkLiof/GIBeWXHks5071KPo3AU9jAhgu49
         UMErTx6/J9cOf/KVjyVnTlQBC8urS5lP6kHoN5kbFhezhS9VHn+823EwAzxuy3CE4seA
         gIOw==
X-Gm-Message-State: AOAM533zF7O+1SoQ08/8wdzQCfOhVbYBwFppoDvDnlsoFMlTX/bvr/ef
	BZor+jCbegSNPf3Oun29/zcS5r1BmXE5ix7FoTxRgA==
X-Google-Smtp-Source: ABdhPJzljgN0o8qgwxDFcflYawmGQXci4QLaN5hYxPrRJepYI4+KnU4w/2IHOaLG+r5kTAzDwUKXvqxGaKk/D8zAFZI=
X-Received: by 2002:a92:9f4e:: with SMTP id u75mr14052951ili.282.1590175070154;
 Fri, 22 May 2020 12:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200522121333.25045-1-domarys.correa@ossystems.com.br>
 <20200522121333.25045-2-domarys.correa@ossystems.com.br> <CAMKF1sq92HXavsXKHabghWhfMJQoxFfW1ER_-O7G6BtAESQXCg@mail.gmail.com>
In-Reply-To: <CAMKF1sq92HXavsXKHabghWhfMJQoxFfW1ER_-O7G6BtAESQXCg@mail.gmail.com>
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
Date: Fri, 22 May 2020 16:17:38 -0300
Message-ID: <CAJA1DWvAoAXHKzNkjZ5nJQJ9OFJqPnmiH+xwKqoRtQF-2VMsmg@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/3] python3-pyudev: Update 0.21.0 -> 0.22.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000030079605a6417cd8"

--00000000000030079605a6417cd8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I did the rebase, and tested it again successfully. Is there a specific
point that I should review?

att,

On Fri, May 22, 2020 at 12:59 PM Khem Raj <raj.khem@gmail.com> wrote:

> Please rebase on top of master or master-next,
>
> Thanks
> Khem
>
> On Fri, May 22, 2020 at 5:13 AM Domarys Correa
> <domarys.correa@ossystems.com.br> wrote:
> >
> > Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
> > ---
> >  ...hon3-pyudev_0.21.0.bb =3D> python3-pyudev_0.22.0.bb} | 11 +++++++-=
---
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> >  rename meta-python/recipes-devtools/python/{python3-pyudev_0.21.0.bb
> =3D> python3-pyudev_0.22.0.bb} (70%)
> >
> > diff --git a/meta-python/recipes-devtools/python/
> python3-pyudev_0.21.0.bb b/meta-python/recipes-devtools/python/
> python3-pyudev_0.22.0.bb
> > similarity index 70%
> > rename from meta-python/recipes-devtools/python/python3-pyudev_0.21.0.=
bb
> > rename to meta-python/recipes-devtools/python/python3-pyudev_0.22.0.bb
> > index f39847ffa..d5bf058ed 100644
> > --- a/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
> > +++ b/meta-python/recipes-devtools/python/python3-pyudev_0.22.0.bb
> > @@ -1,9 +1,9 @@
> >  SUMMARY =3D "A libudev binding"
> > +
> >  LICENSE =3D "LGPLv2.1+"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398=
e37343"
> >
> > -SRC_URI[md5sum] =3D "cf4d9db7d772622144ca1be6b5d9353b"
> > -SRC_URI[sha256sum] =3D
> "094b7a100150114748aaa3b70663485dd360457a709bfaaafe5a977371033f2b"
> > +SRC_URI[sha256sum] =3D
> "69bb1beb7ac52855b6d1b9fe909eefb0017f38d917cba9939602c6880035b276"
> >
> >  inherit pypi setuptools3
> >
> > @@ -12,10 +12,13 @@ do_configure_prepend() {
> >      sed -i "s/str(pyudev.__version__)/'${PV}'/g" ${S}/setup.py
> >  }
> >
> > -RDEPENDS_${PN} =3D "\
> > +RDEPENDS_${PN} +=3D "\
> > +    libudev \
> >      ${PYTHON_PN}-ctypes \
> > +    ${PYTHON_PN}-fcntl \
> >      ${PYTHON_PN}-misc \
> >      ${PYTHON_PN}-six \
> >      ${PYTHON_PN}-threading \
> > -    libudev \
> >  "
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > --
> > 2.17.1
> >
> >=20
>


--=20
*Domarys Corr=C3=AAa*
(55) 5399100-2700
domaryscorrea@gmail.com
domarys.correa@ossystems.com.br

--00000000000030079605a6417cd8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"col=
or:rgb(166,77,121)">Hello, <br></div><div class=3D"gmail_default" style=3D"=
color:rgb(166,77,121)"><br></div><div class=3D"gmail_default" style=3D"colo=
r:rgb(166,77,121)"><span class=3D"gmail-tlid-translation gmail-translation"=
 tabindex=3D"-1" lang=3D"en"><span title=3D"" class=3D"gmail-">I did the re=
base, and tested it again successfully.</span> <span title=3D"" class=3D"gm=
ail-">Is there a specific point that I should review?</span></span></div><d=
iv class=3D"gmail_default" style=3D"color:rgb(166,77,121)"><span class=3D"g=
mail-tlid-translation gmail-translation" tabindex=3D"-1" lang=3D"en"><span =
title=3D"" class=3D"gmail-"><br></span></span></div><div class=3D"gmail_def=
ault" style=3D"color:rgb(166,77,121)"><span class=3D"gmail-tlid-translation=
 gmail-translation" tabindex=3D"-1" lang=3D"en"><span title=3D"" class=3D"g=
mail-">att,</span></span></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Fri, May 22, 2020 at 12:59 PM Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Please rebase on =
top of master or master-next,<br>
<br>
Thanks<br>
Khem<br>
<br>
On Fri, May 22, 2020 at 5:13 AM Domarys Correa<br>
&lt;<a href=3D"mailto:domarys.correa@ossystems.com.br" target=3D"_blank">d=
omarys.correa@ossystems.com.br</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Domarys Correa &lt;<a href=3D"mailto:domarys.correa@os=
systems.com.br" target=3D"_blank">domarys.correa@ossystems.com.br</a>&gt;<b=
r>
&gt; ---<br>
&gt;=C2=A0 ...<a href=3D"http://hon3-pyudev_0.21.0.bb" rel=3D"noreferrer" =
target=3D"_blank">hon3-pyudev_0.21.0.bb</a> =3D&gt; <a href=3D"http://pytho=
n3-pyudev_0.22.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyudev_0.=
22.0.bb</a>} | 11 +++++++----<br>
&gt;=C2=A0 1 file changed, 7 insertions(+), 4 deletions(-)<br>
&gt;=C2=A0 rename meta-python/recipes-devtools/python/{<a href=3D"http://p=
ython3-pyudev_0.21.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyude=
v_0.21.0.bb</a> =3D&gt; <a href=3D"http://python3-pyudev_0.22.0.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-pyudev_0.22.0.bb</a>} (70%)<br>
&gt;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://py=
thon3-pyudev_0.21.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyudev=
_0.21.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-pyudev_0.22.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyudev_0=
.22.0.bb</a><br>
&gt; similarity index 70%<br>
&gt; rename from meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-pyudev_0.21.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyudev_=
0.21.0.bb</a><br>
&gt; rename to meta-python/recipes-devtools/python/<a href=3D"http://pytho=
n3-pyudev_0.22.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyudev_0.=
22.0.bb</a><br>
&gt; index f39847ffa..d5bf058ed 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-p=
yudev_0.21.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyudev_0.21.0=
.bb</a><br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-p=
yudev_0.22.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyudev_0.22.0=
.bb</a><br>
&gt; @@ -1,9 +1,9 @@<br>
&gt;=C2=A0 SUMMARY =3D &quot;A libudev binding&quot;<br>
&gt; +<br>
&gt;=C2=A0 LICENSE =3D &quot;LGPLv2.1+&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Da6f89e2100d9b6c=
dffcea4f398e37343&quot;<br>
&gt;<br>
&gt; -SRC_URI[md5sum] =3D &quot;cf4d9db7d772622144ca1be6b5d9353b&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;094b7a100150114748aaa3b70663485dd360457=
a709bfaaafe5a977371033f2b&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;69bb1beb7ac52855b6d1b9fe909eefb0017f38d=
917cba9939602c6880035b276&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit pypi setuptools3<br>
&gt;<br>
&gt; @@ -12,10 +12,13 @@ do_configure_prepend() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sed -i &quot;s/str(pyudev.__version__)/&#39;${PV}=
&#39;/g&quot; ${S}/setup.py<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -RDEPENDS_${PN} =3D &quot;\<br>
&gt; +RDEPENDS_${PN} +=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 libudev \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-ctypes \<br>
&gt; +=C2=A0 =C2=A0 ${PYTHON_PN}-fcntl \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-misc \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-six \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-threading \<br>
&gt; -=C2=A0 =C2=A0 libudev \<br>
&gt;=C2=A0 &quot;<br>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; <br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><span><div><b><font=
 color=3D"#a64d79">Domarys Corr=C3=AAa</font></b></div><div><font color=3D"=
#c27ba0">(55) 5399100-2700</font></div><div><font color=3D"#c27ba0"><a href=
=
=3D"mailto:domaryscorrea@gmail.com" target=3D"_blank">domaryscorrea@gmail.=
com</a><br></font></div><div><font color=3D"#c27ba0"><a href=3D"mailto:doma=
rys.correa@ossystems.com.br" rel=3D"noopener noreferrer" target=3D"_blank">=
domarys.correa@ossystems.com.br</a></font></div></span></div></div></div></=
div></div>

--00000000000030079605a6417cd8--
