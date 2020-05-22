Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web12.20312.1590175191204191722
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2020 12:19:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=owTk4c34;
 spf=pass (domain: ossystems.com.br, ip: 209.85.166.44, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-io1-f44.google.com with SMTP id o5so12495010iow.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2020 12:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8o5ryEZtCae+4mZn6g0jrDSv2a0asldbYI3hNhOWh7g=;
        b=owTk4c34P2uDTnkFXAhmPLMW2Tw2KBaJT7jLVjSMUIxjR1+XtOXFFzy+pL+ti2eExN
         a/8uvP7Cl26816/JNceSzQ5PlhoNZpHOPFMBysx3raNEkHrvz/e4TZxb2n5vGtUYQaRW
         NHBpwf6HW9z1KipNXYI6eMVdTka8DvT0RR07DN9KKv6X86YjxwoEsXCxnJeYdRQzwXAP
         r0EpImLKZ+4cC3mhQXYEI3x+PvIUJrCdRq4P7WVj0Eyw/mT8/++m56au3egk4VIakh16
         gBkdQUKVseIr4C1vhvJLppcXmZPMdre49M4TCf/591FgQLRLtiwaGSDp5CybNHYEZy6b
         l/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8o5ryEZtCae+4mZn6g0jrDSv2a0asldbYI3hNhOWh7g=;
        b=SxUAgkyyH0iRUdVZYQ7GfgtlEB8xCDqrcple4vpWOCVRlUYBEZ8RPis9mazjS+jQny
         7aT8ZASyx5vMSAutu5BaXA56TY8p9uxjApF3gJBOcRacRSTltrlIcCT/G4CyJS8X3ONO
         cVw9YQpMN36URIYujc9YB76SJe5/z/ECgqflcFSYknW4Z1ppbBHJWaJuH6TKoyjIBTHe
         k2fGHG4zNPWzmkepC6uv3l9fpJoM6nAStHnKLWaq3AlL0xgJkdGGjkDbv0x1MVKwugp3
         TaLGC4/PNkeuxcHVdA0RJE+qhksG9fROhHWmrKzxZ3Z0v+LjQH+/NZlmyZxpcbyvlBMX
         NS6w==
X-Gm-Message-State: AOAM5303JJgWFBCSRHQ65VYmzw6/XQNIO8JvL7oeJ6mq6hM7/xFMI1/G
	KXe2lyWOtacQZVDnqM96TgdYGE1tiK6Ska6EgOiWAg==
X-Google-Smtp-Source: ABdhPJxR7qJBCuCsO3eRMFZ8s8ZtscgYOi7YG7VTc5kqY2k/axiFLFuHm2prhxix6ZVZUpfPQDMF9WL1yRGZRx7yQqE=
X-Received: by 2002:a5e:c817:: with SMTP id y23mr4389460iol.5.1590175190221;
 Fri, 22 May 2020 12:19:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200522121333.25045-1-domarys.correa@ossystems.com.br>
 <20200522121333.25045-3-domarys.correa@ossystems.com.br> <CAMKF1sqKE7o40GmqvShA1jX-bm-=sCtemuBq7UqEMiwGv+YnGg@mail.gmail.com>
In-Reply-To: <CAMKF1sqKE7o40GmqvShA1jX-bm-=sCtemuBq7UqEMiwGv+YnGg@mail.gmail.com>
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
Date: Fri, 22 May 2020 16:19:39 -0300
Message-ID: <CAJA1DWsfRE_e36FnXuEWuOEuneKVcT1akoNxEBybFuJH3YO35Q@mail.gmail.com>
Subject: Re: [oe] [PATCH 3/3] python3-pyyaml: Update 5.3 -> 5.3.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000581b2605a6418397"

--000000000000581b2605a6418397
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
> >  .../python/python3-pyyaml_5.3.1.bb             | 18 +++++++++++++++++=
+
> >  .../python/python3-pyyaml_5.3.bb               | 18 -----------------=
-
> >  2 files changed, 18 insertions(+), 18 deletions(-)
> >  create mode 100644 meta-python/recipes-devtools/python/
> python3-pyyaml_5.3.1.bb
> >  delete mode 100644 meta-python/recipes-devtools/python/
> python3-pyyaml_5.3.bb
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.=
bb
> b/meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb
> > new file mode 100644
> > index 000000000..5efc2aa9e
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb
> > @@ -0,0 +1,18 @@
> > +SUMMARY =3D "Python support for YAML"
> > +DEPENDS =3D "libyaml ${PYTHON_PN}-cython-native"
> > +
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7bbd28caa69f81f5cd5f486472=
36663d"
> > +
> > +SRC_URI[sha256sum] =3D
> "b8eac752c5e14d3eca0e6dd9199cd627518cb5ec06add0de9d32baeee6fe645d"
> > +
> > +PYPI_PACKAGE =3D "PyYAML"
> > +
> > +inherit pypi setuptools3
> > +
> > +RDEPENDS_${PN} +=3D "\
> > +    ${PYTHON_PN}-datetime \
> > +    ${PYTHON_PN}-misc \
> > +"
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > diff --git a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb
> b/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb
> > deleted file mode 100644
> > index b5425b8c9..000000000
> > --- a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb
> > +++ /dev/null
> > @@ -1,18 +0,0 @@
> > -SUMMARY =3D "Python support for YAML"
> > -HOMEPAGE =3D "http://www.pyyaml.org"
> > -SECTION =3D "devel/python"
> > -LICENSE =3D "MIT"
> > -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da76b4c69bfcf82313bbdc0393b=
04438a"
> > -DEPENDS =3D "libyaml ${PYTHON_PN}-cython-native ${PYTHON_PN}"
> > -
> > -PYPI_PACKAGE =3D "PyYAML"
> > -inherit pypi setuptools3
> > -
> > -SRC_URI[md5sum] =3D "adbb0d336b509d6472d3b095a0f1cf30"
> > -SRC_URI[sha256sum] =3D
> "e9f45bd5b92c7974e59bcd2dcc8631a6b6cc380a904725fce7bc08872e691615"
> > -
> > -RDEPENDS_${PN} +=3D "\
> > -    ${PYTHON_PN}-datetime \
> > -"
> > -
> > -BBCLASSEXTEND =3D "native nativesdk"
> > --
> > 2.17.1
> >
> >=20
>


--=20
*=E2=80=8BDomarys Corr=C3=AAa*
(55) 5399100-2700
domaryscorrea@gmail.com
domarys.correa@ossystems.com.br

--000000000000581b2605a6418397
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"color:rgb(166,77,121=
)">Hello, <br></div><div class=3D"gmail_default" style=3D"color:rgb(166,77,=
121)"><br></div><div class=3D"gmail_default" style=3D"color:rgb(166,77,121)=
"><span class=3D"gmail-tlid-translation gmail-translation" tabindex=3D"-1" =
lang=3D"en"><span title=3D"" class=3D"gmail-">I did the rebase, and tested =
it again successfully.</span> <span title=3D"" class=3D"gmail-">Is there a =
specific point that I should review?</span></span></div><div class=3D"gmail=
_default" style=3D"color:rgb(166,77,121)"><span class=3D"gmail-tlid-transla=
tion gmail-translation" tabindex=3D"-1" lang=3D"en"><span title=3D"" class=
=3D"gmail-"><br></span></span></div><div class=3D"gmail_default" style=3D"=
color:rgb(166,77,121)"><span class=3D"gmail-tlid-translation gmail-translat=
ion" tabindex=3D"-1" lang=3D"en"><span title=3D"" class=3D"gmail-">att,</sp=
an></span></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=
=3D"gmail_attr">On Fri, May 22, 2020 at 12:59 PM Khem Raj &lt;<a href=3D"m=
ailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Please rebase on top of master =
or master-next,<br>
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
&gt;=C2=A0 .../python/<a href=3D"http://python3-pyyaml_5.3.1.bb" rel=3D"no=
referrer" target=3D"_blank">python3-pyyaml_5.3.1.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 ++++++++++++++++++<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-pyyaml_5.3.bb" rel=3D"nore=
ferrer" target=3D"_blank">python3-pyyaml_5.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 ------------------<br>
&gt;=C2=A0 2 files changed, 18 insertions(+), 18 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/<a href=
=3D"http://python3-pyyaml_5.3.1.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-pyyaml_5.3.1.bb</a><br>
&gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/python/<a href=
=3D"http://python3-pyyaml_5.3.bb" rel=3D"noreferrer" target=3D"_blank">pyt=
hon3-pyyaml_5.3.bb</a><br>
&gt;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://py=
thon3-pyyaml_5.3.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyyaml_=
5.3.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-pyyaml_5.3.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyyaml_5.3.=
1.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 000000000..5efc2aa9e<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-p=
yyaml_5.3.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyyaml_5.3.1.b=
b</a><br>
&gt; @@ -0,0 +1,18 @@<br>
&gt; +SUMMARY =3D &quot;Python support for YAML&quot;<br>
&gt; +DEPENDS =3D &quot;libyaml ${PYTHON_PN}-cython-native&quot;<br>
&gt; +<br>
&gt; +LICENSE =3D &quot;MIT&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D7bbd28caa69f81f5cd5f=
48647236663d&quot;<br>
&gt; +<br>
&gt; +SRC_URI[sha256sum] =3D &quot;b8eac752c5e14d3eca0e6dd9199cd627518cb5e=
c06add0de9d32baeee6fe645d&quot;<br>
&gt; +<br>
&gt; +PYPI_PACKAGE =3D &quot;PyYAML&quot;<br>
&gt; +<br>
&gt; +inherit pypi setuptools3<br>
&gt; +<br>
&gt; +RDEPENDS_${PN} +=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 ${PYTHON_PN}-datetime \<br>
&gt; +=C2=A0 =C2=A0 ${PYTHON_PN}-misc \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://py=
thon3-pyyaml_5.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyyaml_5.=
3.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-py=
yaml_5.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyyaml_5.3.bb</a>=
<br>
&gt; deleted file mode 100644<br>
&gt; index b5425b8c9..000000000<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-p=
yyaml_5.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyyaml_5.3.bb</a=
><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,18 +0,0 @@<br>
&gt; -SUMMARY =3D &quot;Python support for YAML&quot;<br>
&gt; -HOMEPAGE =3D &quot;<a href=3D"http://www.pyyaml.org" rel=3D"noreferr=
er" target=3D"_blank">http://www.pyyaml.org</a>&quot;<br>
&gt; -SECTION =3D &quot;devel/python&quot;<br>
&gt; -LICENSE =3D &quot;MIT&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Da76b4c69bfcf82313bbd=
c0393b04438a&quot;<br>
&gt; -DEPENDS =3D &quot;libyaml ${PYTHON_PN}-cython-native ${PYTHON_PN}&qu=
ot;<br>
&gt; -<br>
&gt; -PYPI_PACKAGE =3D &quot;PyYAML&quot;<br>
&gt; -inherit pypi setuptools3<br>
&gt; -<br>
&gt; -SRC_URI[md5sum] =3D &quot;adbb0d336b509d6472d3b095a0f1cf30&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;e9f45bd5b92c7974e59bcd2dcc8631a6b6cc380=
a904725fce7bc08872e691615&quot;<br>
&gt; -<br>
&gt; -RDEPENDS_${PN} +=3D &quot;\<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-datetime \<br>
&gt; -&quot;<br>
&gt; -<br>
&gt; -BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; <br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><span><div><b><font=
 color=3D"#a64d79">=E2=80=8BDomarys Corr=C3=AAa</font></b></div><div><font =
color=3D"#c27ba0">(55) 5399100-2700</font></div><div><font color=3D"#c27ba0=
"><a href=3D"mailto:domaryscorrea@gmail.com" target=3D"_blank">domaryscorre=
a@gmail.com</a><br></font></div><div><font color=3D"#c27ba0"><a href=3D"mai=
lto:domarys.correa@ossystems.com.br" rel=3D"noopener noreferrer" target=3D"=
_blank">domarys.correa@ossystems.com.br</a></font></div></span></div></div>=
</div></div>

--000000000000581b2605a6418397--
