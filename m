Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web12.24730.1606510906114577182
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2020 13:01:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ADWo21Nu;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: beniaminsandu@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id q137so2307228iod.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2020 13:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CgIjQPTUYT1FP7lvc3LU8uuaPYp8JauJwItft0X9NP0=;
        b=ADWo21Nu2IT34Rzor1c6gpis75mt5MHgTdFxjZ5TyvOmaYdrBXT+OxINfcn8RGEgIx
         gb1csx9MGK5FS1KEmG204migJi/ujrCDqbvcPH36xgkendz64XQ51MV8cHSAl2cxdcy3
         cS36KaFgsQaTwAJ8tyFv3f88BbvuhObtBFkXEd3x5eMHZ56xLnhn/0uuyCJMDC5/PBhB
         IUHsn3k9ypKK5P7X3KTkuyxugNovfsrEMGkoY4YLD9D/3Z/Zb7F27JrKOwiMoAVZ3hPh
         hXFi31RkpJZn9qK+5takIb/wYkt+SQX4ScB6B+Px04+t4X4uMKBZ2Ydzvm0bVFJel8Ye
         fOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CgIjQPTUYT1FP7lvc3LU8uuaPYp8JauJwItft0X9NP0=;
        b=c9nCbfinzX1FfJNggD/vVGCeU0FtjS0Sf7+amM3Y5X7qzcFNfLqqs9zvNlSlEU+DMd
         jC7ZRhh+yOM33FEMKWjYJ+F0ADbbmU0dCtojkwOmrWwcYoTHvKexkSLHZaGDgwRFGfld
         XicvKR1y8GOzz0FY/359OquV7tBULO3m26gwVaqt444Ro5AKpHUecp2ANjzWbzYhqYOk
         etVn8NrdBTV32pIka4VDiChFp9zNhTLNGEIIws8wOkJqaBZJyCyaGiCq6Mta34pRlGuM
         zHEkT5wMSoqzawM5sI+hzLr0d9Nym1vQTW0Qi+wV+YfP7lE6rp3XM+Zxn+bH7ItDn119
         iJNA==
X-Gm-Message-State: AOAM5321WYIGCgXBPXJ0xZANidblosmF8XOUYic8RwV/cBlhIWHliO4p
	3/ZAFdzhIyBYIx71mHBPSDeLd+gKZirQVTmS18Q=
X-Google-Smtp-Source: ABdhPJyGEs4Ly8Q756OW1qWBwyx6tGeU+0tXaRmkxfdetftpXZFDto0wBRVz6Pj/JRjp+edvHVYy6i9MGFdK5yzcrK0=
X-Received: by 2002:a6b:7516:: with SMTP id l22mr5887262ioh.190.1606510905543;
 Fri, 27 Nov 2020 13:01:45 -0800 (PST)
MIME-Version: 1.0
References: <20201127153734.147135-1-beniaminsandu@gmail.com> <CAMKF1sqFj_6HvhgoX64=Zkx_wJRj6593crEJ_dzhTXHVexA2Rg@mail.gmail.com>
In-Reply-To: <CAMKF1sqFj_6HvhgoX64=Zkx_wJRj6593crEJ_dzhTXHVexA2Rg@mail.gmail.com>
From: "beni" <beniaminsandu@gmail.com>
Date: Fri, 27 Nov 2020 23:01:34 +0200
Message-ID: <CABQJdOEPr-5mOcP01PiGX+mzMpfd+4CxFiEeHBkDo1yu7Yr9QQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] trace-cmd: create recipe for version 2.9.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000da4f4b05b51cf7d8"

--000000000000da4f4b05b51cf7d8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C3=8En vin., 27 nov. 2020 la 21:51, Khem Raj <raj.khem@gmail.com> a scris:

> On Fri, Nov 27, 2020 at 7:37 AM beni <beniaminsandu@gmail.com> wrote:
> >
> > Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > ---
> >  .../recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb  | 16 +++++++++++++++=
+
>
>
> Please add it to packagegroup-meta-oe as well.
>

Okay.

>
> >  1 file changed, 16 insertions(+)
> >  create mode 100644 meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.b=
b
> >
> > diff --git a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb
> b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb
> > new file mode 100644
> > index 000000000..d9599c046
> > --- /dev/null
> > +++ b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb
> > @@ -0,0 +1,16 @@
> > +SUMMARY =3D "User-space front-end command-line tool for ftrace"
> > +
> > +LICENSE =3D "GPLv2 & LGPLv2.1"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D873f48a813bded3de6ebc54e68=
80c4ac"
> > +
> > +SRC_URI =3D "git://
> git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;branch=3Dm=
aster
> "
> > +SRCREV =3D "530b1a0caef39466e16bbd49de5afef89656f03f"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +do_install() {
> > +       oe_runmake DESTDIR=3D${D} install
> > +}
> > +
> > +FILES_${PN} +=3D "${prefix}/etc \
>
> user ${sysconfdir}
>
IIRC ${sysconfdir} points to /etc and I need /usr/etc, I could not find
anything to point there at a quick glance so I used this.

>
> > +       ${libdir}/traceevent/plugins/"
> > --
> > 2.25.1
> >
> >
> >=20
> >
>

--000000000000da4f4b05b51cf7d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">=C3=8En vin., 27 nov. 2020 la 21:51, =
Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&g=
t; a scris:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On F=
ri, Nov 27, 2020 at 7:37 AM beni &lt;<a href=3D"mailto:beniaminsandu@gmail.=
com" target=3D"_blank">beniaminsandu@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Beniamin Sandu &lt;<a href=3D"mailto:beniaminsandu@gma=
il.com" target=3D"_blank">beniaminsandu@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../recipes-kernel/trace-cmd/<a href=3D"http://trace-cmd_2.9.1.=
bb" rel=3D"noreferrer" target=3D"_blank">trace-cmd_2.9.1.bb</a>=C2=A0 | 16 =
++++++++++++++++<br>
<br>
<br>
Please add it to packagegroup-meta-oe as well.<br></blockquote><div><br></=
div><div>Okay. <br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 1 file changed, 16 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-kernel/trace-cmd/<a href=3D"=
http://trace-cmd_2.9.1.bb" rel=3D"noreferrer" target=3D"_blank">trace-cmd_2=
.9.1.bb</a><br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-kernel/trace-cmd/<a href=3D"http://trace=
-cmd_2.9.1.bb" rel=3D"noreferrer" target=3D"_blank">trace-cmd_2.9.1.bb</a> =
b/meta-oe/recipes-kernel/trace-cmd/<a href=3D"http://trace-cmd_2.9.1.bb" re=
l=3D"noreferrer" target=3D"_blank">trace-cmd_2.9.1.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 000000000..d9599c046<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-kernel/trace-cmd/<a href=3D"http://trace-cmd_2.=
9.1.bb" rel=3D"noreferrer" target=3D"_blank">trace-cmd_2.9.1.bb</a><br>
&gt; @@ -0,0 +1,16 @@<br>
&gt; +SUMMARY =3D &quot;User-space front-end command-line tool for ftrace&=
quot;<br>
&gt; +<br>
&gt; +LICENSE =3D &quot;GPLv2 &amp; LGPLv2.1&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D873f48a813bded3de6eb=
c54e6880c4ac&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.org/pub/scm/lin=
ux/kernel/git/rostedt/trace-cmd.git;branch=3Dmaster" rel=3D"noreferrer" tar=
get=3D"_blank">git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.gi=
t;branch=3Dmaster</a>&quot;<br>
&gt; +SRCREV =3D &quot;530b1a0caef39466e16bbd49de5afef89656f03f&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +<br>
&gt; +do_install() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake DESTDIR=3D${D} install<br>
&gt; +}<br>
&gt; +<br>
&gt; +FILES_${PN} +=3D &quot;${prefix}/etc \<br>
<br>
user ${sysconfdir}<br></blockquote><div>IIRC ${sysconfdir} points to /etc =
and I need /usr/etc, I could not find anything to point there at a quick gl=
ance so I used this. <br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/traceevent/plugins/&quot;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div></div>

--000000000000da4f4b05b51cf7d8--
