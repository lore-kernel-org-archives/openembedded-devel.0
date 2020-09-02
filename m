Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web12.15867.1599073483801000369
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 12:04:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=DqAou6Jp;
 spf=pass (domain: blade-group.com, ip: 209.85.161.43, mailfrom: yann.dirson@blade-group.com)
Received: by mail-oo1-f43.google.com with SMTP id a6so104242oog.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2020 12:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mqEVHxGbbB2EDgfIrOdTPlBwzp8bfvZkYvVsoORdnWE=;
        b=DqAou6Jpvvl9xUM5XLyhWwk2dJH3MmVcL1VqXD9Nx+L37yzemlnB1SNT0Y4JHlpKXA
         hufqw4FRq2FhYROE0G/5Vn4tMMqEzWxYfLHeBT0qVWwIdl6HnPBe49uA3GIPywFdMI7D
         ZBrsfIYCBXDhwXeu9DDMlRtD+XzKnrnlvUdeY/6Z79QJxbf2ptv8sv6GYhLw7Wg/3wKl
         xNz/8ddZMs1JT0ltMYYxCDgg+eNw1ZAJFhMOkseDsOLDcVlpheb46V3t3MyTAczRXqF9
         kiK21vZSo1QnyFhmNcnSHYh5pYFp8I7pz4bN8iEdirokfPYSST4PX9dqgvkUdxtam1az
         WBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mqEVHxGbbB2EDgfIrOdTPlBwzp8bfvZkYvVsoORdnWE=;
        b=jWbt/Mi98eWrswiIFrqzomZrEBVJJvtHn+nvQSVZbclOdrzK3R6OvtGVbd1Ljhdnel
         YOFZRzh+AkMexGGfTsA8fA40YsZarMiDtH6aum3X+3z0ti/VEF08O5oz2YuLVFkBsMY+
         Z4AUg0xm6uZ8ZIADKst6qjk8dHQtfOOHcpyFGvHsDrwOztbD5IMuSJOZSUK3b1U8ki+u
         G0+LAISpVjOMlcr9fgsHUkldoLwayzR3GfBjZ3zbAQJ9bKBeU0ypBWlzwo97NKM2GaKZ
         wDJtqWg9UcR1lTD/fbaHOQx+ayxybJqCUoatp7UH194TB+Aj+ZpVYcB2Tpb9MYdBVLK8
         UfHw==
X-Gm-Message-State: AOAM530WMakNFdsl1uT89/lQ3N3SnBmUmUW8K88tJ/Q4vCGSFNx94EWj
	LSbpPxrIUc5KFSkq9/7s1d4lcvI4YTydA/DxIcu8JQ==
X-Google-Smtp-Source: ABdhPJxK2dyUNbapONTr+JMr285PpKLcQWvfaIz5pTAfGLsa9byw6FyZX2jiI/xv90yKNOxp1H+wxh7NRnVzJ/T/sew=
X-Received: by 2002:a4a:9cd6:: with SMTP id d22mr6815141ook.0.1599073483119;
 Wed, 02 Sep 2020 12:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200902174600.675971-1-yann@blade-group.com> <CAMKF1soBvXpbfFL-dDSkKNftcvMjp0bmVjw1zHGB9SzL7JUjAQ@mail.gmail.com>
In-Reply-To: <CAMKF1soBvXpbfFL-dDSkKNftcvMjp0bmVjw1zHGB9SzL7JUjAQ@mail.gmail.com>
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Wed, 2 Sep 2020 21:04:30 +0200
Message-ID: <CA+4=imYFWtPNmsVH01Kn_+CbpiV_K9gZmV4xzqg=L3JcpeKixA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][patch] New terminal emulator: st 0.8.4
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: multipart/alternative; boundary="000000000000ee86ed05ae594ed0"

--000000000000ee86ed05ae594ed0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 2 sept. 2020 =C3=A0 20:37, Khem Raj <raj.khem@gmail.com> a =C3=A9cr=
it :

> On Wed, Sep 2, 2020 at 10:46 AM Yann Dirson <yann.dirson@blade-group.com=
>
> wrote:
> >
> > From: Yann Dirson <yann@blade-group.com>
> >
> > Can be used as a replacement for matchbox-terminal, with much less
> > dependencies (does not need gtk and vte), and supports "-e" flag.
> >
>
> can you add it to
> meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb as well
> and see if you can build meta-oe-ptest-image
>

Running now, will send an updated version once it has passed, looks like
it's going to use some CPU :)

While preparing for that though, I stumbled on a strange issue (I'm not
using the tools for that usually,
but I confess it is convenient ;):

build (master=3D)$ bitbake-layers add-layer
../../meta-openembedded/meta-networking/
NOTE: Starting bitbake server...

build (master=3D)$ bitbake-layers add-layer
../../meta-openembedded/meta-filesystems/
NOTE: Starting bitbake server...
Traceback (most recent call last):
  File
"/home/yann/shadow/meta-blade/meta-shadow-os/poky/bitbake/bin/bitbake-laye=
rs",
line 95, in <module>
    ret =3D main()
  File
"/home/yann/shadow/meta-blade/meta-shadow-os/poky/bitbake/bin/bitbake-laye=
rs",
line 63, in main
    tinfoil.prepare(True)
  File
"/home/yann/shadow/meta-blade/meta-shadow-os/poky/bitbake/lib/bb/tinfoil.p=
y",
line 410, in prepare
    self.run_command('parseConfiguration')
  File
"/home/yann/shadow/meta-blade/meta-shadow-os/poky/bitbake/lib/bb/tinfoil.p=
y",
line 466, in run_command
    raise TinfoilCommandFailed(result[1])
bb.tinfoil.TinfoilCommandFailed: Traceback (most recent call last):
  File
"/home/yann/shadow/meta-blade/meta-shadow-os/poky/bitbake/lib/bb/command.p=
y",
line 81, in runCommand
    result =3D command_method(self, commandline)
  File
"/home/yann/shadow/meta-blade/meta-shadow-os/poky/bitbake/lib/bb/command.p=
y",
line 280, in parseConfiguration
    command.cooker.parseConfiguration()
  File
"/home/yann/shadow/meta-blade/meta-shadow-os/poky/bitbake/lib/bb/cooker.py=
",
line 426, in parseConfiguration
    self.handleCollections(self.data.getVar("BBFILE_COLLECTIONS"))
  File
"/home/yann/shadow/meta-blade/meta-shadow-os/poky/bitbake/lib/bb/cooker.py=
",
line 1255, in handleCollections
    raise CollectionError("Errors during parsing layer configuration")
bb.cooker.CollectionError: Errors during parsing layer configuration


Same problem after adding it by hand, trying to add meta-python.  Adding
that one by hand as well does the trick.


> > Signed-off-by: Yann Dirson <yann@blade-group.com>
> > ---
> >  meta-oe/recipes-graphics/suckless/st_0.8.4.bb | 28 ++++++++++++++++++=
+
> >  1 file changed, 28 insertions(+)
> >  create mode 100644 meta-oe/recipes-graphics/suckless/st_0.8.4.bb
> >
> > diff --git a/meta-oe/recipes-graphics/suckless/st_0.8.4.bb
> b/meta-oe/recipes-graphics/suckless/st_0.8.4.bb
> > new file mode 100644
> > index 000000000..7d7c20e46
> > --- /dev/null
> > +++ b/meta-oe/recipes-graphics/suckless/st_0.8.4.bb
> > @@ -0,0 +1,28 @@
> > +SECTION =3D "shadow"
> > +LICENSE =3D "MIT-X"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D04c3ca13a702147c62db90f556=
c5b3ca"
> > +SRC_URI =3D " \
> > + http://dl.suckless.org/${BPN}/${BPN}-${PV}.tar.gz \
> > +"
> > +
> > +inherit pkgconfig
> > +
> > +SRC_URI[sha256sum] =3D
> "d42d3ceceb4d6a65e32e90a5336e3d446db612c3fbd9ebc1780bc6c9a03346a6"
> > +
> > +DEPENDS +=3D "libx11 libxft fontconfig"
> > +
> > +RDEPENDS_${PN} +=3D "libx11-locale"
> > +
> > +do_compile() {
> > +    make INCS=3D'-I. `pkg-config --cflags x11 fontconfig xft`' LIBS=
=3D'-lm
> -lutil `pkg-config --libs x11 fontconfig xft`'
> > +}
> > +
> > +# don't use "make install" which builds terminfo, already in
> > +# ncurses-terminfo (and requires ncurses-native for "tic")
> > +
> > +do_install() {
> > +    mkdir -p ${D}${bindir}
> > +    install -m755 ${B}/st ${D}${bindir}/
> > +}
> > +
> > +RRECOMMENDS_${PN} +=3D "ncurses-terminfo"
> > --
> > 2.28.0
> >
> >=20
>


--=20
Yann Dirson <yann@blade-group.com>
Blade / Shadow -- http://shadow.tech

--000000000000ee86ed05ae594ed0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 2 sept. 2020 =C3=A0=C2=
=A020:37, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmai=
l.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Wed, Sep 2, 2020 at 10:46 AM Yann Dirson &lt;<a href=
=3D"mailto:yann.dirson@blade-group.com" target=3D"_blank">yann.dirson@blad=
e-group.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com" target=
=3D"_blank">yann@blade-group.com</a>&gt;<br>
&gt;<br>
&gt; Can be used as a replacement for matchbox-terminal, with much less<br=
>
&gt; dependencies (does not need gtk and vte), and supports &quot;-e&quot;=
 flag.<br>
&gt;<br>
<br>
can you add it to<br>
meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegroup-meta-oe.=
bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.bb</a> as wel=
l<br>
and see if you can build meta-oe-ptest-image<br></blockquote><div><br></di=
v><div>Running now, will send an updated version once it has passed, looks =
like it&#39;s going to use some CPU :)</div><div><br></div><div>While prepa=
ring for that though, I stumbled on a strange issue (I&#39;m not using the =
tools for that usually,</div><div>but I confess it is convenient ;):</div><=
div><br></div><div>build (master=3D)$ bitbake-layers add-layer ../../meta-o=
penembedded/meta-networking/<br>NOTE: Starting bitbake server...</div><div>=
<br></div><div>build (master=3D)$ bitbake-layers add-layer ../../meta-opene=
mbedded/meta-filesystems/<br>NOTE: Starting bitbake server...<br>Traceback =
(most recent call last):<br>=C2=A0 File &quot;/home/yann/shadow/meta-blade/=
meta-shadow-os/poky/bitbake/bin/bitbake-layers&quot;, line 95, in &lt;modul=
e&gt;<br>=C2=A0 =C2=A0 ret =3D main()<br>=C2=A0 File &quot;/home/yann/shado=
w/meta-blade/meta-shadow-os/poky/bitbake/bin/bitbake-layers&quot;, line 63,=
 in main<br>=C2=A0 =C2=A0 tinfoil.prepare(True)<br>=C2=A0 File &quot;/home/=
yann/shadow/meta-blade/meta-shadow-os/poky/bitbake/lib/bb/tinfoil.py&quot;,=
 line 410, in prepare<br>=C2=A0 =C2=A0 self.run_command(&#39;parseConfigura=
tion&#39;)<br>=C2=A0 File &quot;/home/yann/shadow/meta-blade/meta-shadow-os=
/poky/bitbake/lib/bb/tinfoil.py&quot;, line 466, in run_command<br>=C2=A0 =
=C2=A0 raise TinfoilCommandFailed(result[1])<br>bb.tinfoil.TinfoilCommandF=
ailed: Traceback (most recent call last):<br>=C2=A0 File &quot;/home/yann/s=
hadow/meta-blade/meta-shadow-os/poky/bitbake/lib/bb/command.py&quot;, line =
81, in runCommand<br>=C2=A0 =C2=A0 result =3D command_method(self, commandl=
ine)<br>=C2=A0 File &quot;/home/yann/shadow/meta-blade/meta-shadow-os/poky/=
bitbake/lib/bb/command.py&quot;, line 280, in parseConfiguration<br>=C2=A0 =
=
=C2=A0 command.cooker.parseConfiguration()<br>=C2=A0 File &quot;/home/yann=
/shadow/meta-blade/meta-shadow-os/poky/bitbake/lib/bb/cooker.py&quot;, line=
 426, in parseConfiguration<br>=C2=A0 =C2=A0 self.handleCollections(self.da=
ta.getVar(&quot;BBFILE_COLLECTIONS&quot;))<br>=C2=A0 File &quot;/home/yann/=
shadow/meta-blade/meta-shadow-os/poky/bitbake/lib/bb/cooker.py&quot;, line =
1255, in handleCollections<br>=C2=A0 =C2=A0 raise CollectionError(&quot;Err=
ors during parsing layer configuration&quot;)<br>bb.cooker.CollectionError:=
 Errors during parsing layer configuration</div><div><br></div><div><br></d=
iv><div>Same problem after adding it by hand, trying to add meta-python.=C2=
=
=A0 Adding that one by hand as well does the trick.<br></div><div><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Signed-off-by: Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com=
" target=3D"_blank">yann@blade-group.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-oe/recipes-graphics/suckless/<a href=3D"http://st_0.8.4.bb=
" rel=3D"noreferrer" target=3D"_blank">st_0.8.4.bb</a> | 28 +++++++++++++++=
++++<br>
&gt;=C2=A0 1 file changed, 28 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-graphics/suckless/<a href=3D=
"http://st_0.8.4.bb" rel=3D"noreferrer" target=3D"_blank">st_0.8.4.bb</a><b=
r>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-graphics/suckless/<a href=3D"http://st_0=
.8.4.bb" rel=3D"noreferrer" target=3D"_blank">st_0.8.4.bb</a> b/meta-oe/rec=
ipes-graphics/suckless/<a href=3D"http://st_0.8.4.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">st_0.8.4.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 000000000..7d7c20e46<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-graphics/suckless/<a href=3D"http://st_0.8.4.bb=
" rel=3D"noreferrer" target=3D"_blank">st_0.8.4.bb</a><br>
&gt; @@ -0,0 +1,28 @@<br>
&gt; +SECTION =3D &quot;shadow&quot;<br>
&gt; +LICENSE =3D &quot;MIT-X&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D04c3ca13a702147c62db=
90f556c5b3ca&quot;<br>
&gt; +SRC_URI =3D &quot; \<br>
&gt; + <a href=3D"http://dl.suckless.org/$%7BBPN%7D/$%7BBPN%7D-$%7BPV%7D.t=
ar.gz" rel=3D"noreferrer" target=3D"_blank">http://dl.suckless.org/${BPN}/$=
{BPN}-${PV}.tar.gz</a> \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +inherit pkgconfig<br>
&gt; +<br>
&gt; +SRC_URI[sha256sum] =3D &quot;d42d3ceceb4d6a65e32e90a5336e3d446db612c=
3fbd9ebc1780bc6c9a03346a6&quot;<br>
&gt; +<br>
&gt; +DEPENDS +=3D &quot;libx11 libxft fontconfig&quot;<br>
&gt; +<br>
&gt; +RDEPENDS_${PN} +=3D &quot;libx11-locale&quot;<br>
&gt; +<br>
&gt; +do_compile() {<br>
&gt; +=C2=A0 =C2=A0 make INCS=3D&#39;-I. `pkg-config --cflags x11 fontconf=
ig xft`&#39; LIBS=3D&#39;-lm -lutil `pkg-config --libs x11 fontconfig xft`&=
#39;<br>
&gt; +}<br>
&gt; +<br>
&gt; +# don&#39;t use &quot;make install&quot; which builds terminfo, alre=
ady in<br>
&gt; +# ncurses-terminfo (and requires ncurses-native for &quot;tic&quot;)=
<br>
&gt; +<br>
&gt; +do_install() {<br>
&gt; +=C2=A0 =C2=A0 mkdir -p ${D}${bindir}<br>
&gt; +=C2=A0 =C2=A0 install -m755 ${B}/st ${D}${bindir}/<br>
&gt; +}<br>
&gt; +<br>
&gt; +RRECOMMENDS_${PN} +=3D &quot;ncurses-terminfo&quot;<br>
&gt; --<br>
&gt; 2.28.0<br>
&gt;<br>
&gt; <br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature">Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com" ta=
rget=3D"_blank">yann@blade-group.com</a>&gt;<br>Blade / Shadow -- <a href=
=3D"http://shadow.tech" target=3D"_blank">http://shadow.tech</a><br><br></=
div></div>

--000000000000ee86ed05ae594ed0--
