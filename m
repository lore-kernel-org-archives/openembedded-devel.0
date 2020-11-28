Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
 by mx.groups.io with SMTP id smtpd.web09.30112.1606549633966628521
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2020 23:47:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S8JcmoCx;
 spf=pass (domain: gmail.com, ip: 209.85.166.195, mailfrom: beniaminsandu@gmail.com)
Received: by mail-il1-f195.google.com with SMTP id w8so6517686ilg.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2020 23:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bFdyM/RST2VcJZkD3B+LgNSxlW6IbnpguWd07Id2LXM=;
        b=S8JcmoCxaBqhM9OF7uMya1ys8OqAew+vMj/dLbkCqyuwkNmRFZF4p1CE3+3kV3sZGb
         C6zX7aX/HabdntcsqG7SYAIFvw+Vd2qdqA0yHsrQw3cpiLyZL7f2w+sjy0MKRAdYYRSE
         nDII5x6y/yBWtN2acvQDsSPfexQzP6OY4EVpKFC8xR0atQbPV/At/S+kYlkwe8zRg0ZS
         ++9d7hylPslnjpbGLsvQSvR23iubfaDcaUeFnLFvpviIRb0uuUCJG798HDvjs/+2Zkhe
         vNkSEjJ1srY5kJ+cZ89WAkDlUx47oFTcOZfB8Kf5WoCLBUW92vDcUErPZra1KiuufY6s
         oeRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bFdyM/RST2VcJZkD3B+LgNSxlW6IbnpguWd07Id2LXM=;
        b=ihDr4MxAj4kIZCczc2aWbAS0lyL3kAOViA3CqonDsPZ7jM9zT6SQWLSN1HOeRi4TtE
         QwnkGKgDDD3+p3sOP/5hfBYTW+FD324qHEoH8FprkQB//PHP8wUVW2hia0sY1kkQQZK9
         uEoZWOtNSPkh6auf8LZ4d5RAeRadH467wgROhe2+SsLW5O7z3ISaOLRFTanLoKhhVHMK
         CQXMFcnzxGj2zdrW/C4kOYMmKgHQBHi2Z7VNYFjkK4vjvVmwvb/RTw2u+2ROTvO6kFtg
         b9ys3Tj/UkxxKlslxcceJscMB7RIqH3v7gZmzk4pWEzLdAGse5jLvdKnt77siioOoN1s
         Eixg==
X-Gm-Message-State: AOAM5337isXdwT68YW9D1kk7vGjmgz215oKP04Qz2E5Uk3RTau9auAVH
	dJYKyP7B62NnMI63mTNOg2g08UGkhmIRsVZyt+0=
X-Google-Smtp-Source: ABdhPJyWZyuXLhEj03A6Yub9jgE4ppL2bwSkOGWV9OmTMMghnK9xbrFSaHoMfWB7rzLzkKvbGXO6lzWM7Wo82jvV51M=
X-Received: by 2002:a92:6e0d:: with SMTP id j13mr10603784ilc.254.1606549632820;
 Fri, 27 Nov 2020 23:47:12 -0800 (PST)
MIME-Version: 1.0
References: <20201127153734.147135-1-beniaminsandu@gmail.com>
 <CAMKF1sqFj_6HvhgoX64=Zkx_wJRj6593crEJ_dzhTXHVexA2Rg@mail.gmail.com>
 <CABQJdOEPr-5mOcP01PiGX+mzMpfd+4CxFiEeHBkDo1yu7Yr9QQ@mail.gmail.com>
 <CAMKF1spC2zcn7PABeux8V2dXJwJ=OuJm5Tuq+cckfTsv=y_w+A@mail.gmail.com> <CAMKF1sqeMT6ms-yUVwoj9Sw8YQm+zZAoG+OZkoZ5Xmfx2c5rBg@mail.gmail.com>
In-Reply-To: <CAMKF1sqeMT6ms-yUVwoj9Sw8YQm+zZAoG+OZkoZ5Xmfx2c5rBg@mail.gmail.com>
From: "beni" <beniaminsandu@gmail.com>
Date: Sat, 28 Nov 2020 09:47:01 +0200
Message-ID: <CABQJdOEipRgjxYriMNXZsv-uad2oObffRxbevYHJyhF427Ya1g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] trace-cmd: create recipe for version 2.9.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002dac4205b525fc91"

--0000000000002dac4205b525fc91
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, will check the musl build and send a v2. I can also move those
files to /etc since it is indeed a more common path.

=C3=8En s=C3=A2m., 28 nov. 2020 la 00:32, Khem Raj <raj.khem@gmail.com> a =
scris:

> btw. it failed musl build as well
>
> https://errors.yoctoproject.org/Errors/Details/538865/
>
> It perhaps needs to include sys/types.h somewhere.
>
> On Fri, Nov 27, 2020 at 2:24 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Fri, Nov 27, 2020 at 1:01 PM Beniamin Sandu <beniaminsandu@gmail.co=
m>
> wrote:
> > >
> > >
> > >
> > > =C3=8En vin., 27 nov. 2020 la 21:51, Khem Raj <raj.khem@gmail.com> a=
 scris:
> > >>
> > >> On Fri, Nov 27, 2020 at 7:37 AM beni <beniaminsandu@gmail.com> wrot=
e:
> > >> >
> > >> > Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > >> > ---
> > >> >  .../recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb  | 16
> ++++++++++++++++
> > >>
> > >>
> > >> Please add it to packagegroup-meta-oe as well.
> > >
> > >
> > > Okay.
> > >>
> > >>
> > >> >  1 file changed, 16 insertions(+)
> > >> >  create mode 100644 meta-oe/recipes-kernel/trace-cmd/
> trace-cmd_2.9.1.bb
> > >> >
> > >> > diff --git a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb
> b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb
> > >> > new file mode 100644
> > >> > index 000000000..d9599c046
> > >> > --- /dev/null
> > >> > +++ b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb
> > >> > @@ -0,0 +1,16 @@
> > >> > +SUMMARY =3D "User-space front-end command-line tool for ftrace"
> > >> > +
> > >> > +LICENSE =3D "GPLv2 & LGPLv2.1"
> > >> > +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D873f48a813bded3de6ebc54e6880c4ac"
> > >> > +
> > >> > +SRC_URI =3D "git://
> git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;branch=3Dm=
aster
> "
> > >> > +SRCREV =3D "530b1a0caef39466e16bbd49de5afef89656f03f"
> > >> > +
> > >> > +S =3D "${WORKDIR}/git"
> > >> > +
> > >> > +do_install() {
> > >> > +       oe_runmake DESTDIR=3D${D} install
> > >> > +}
> > >> > +
> > >> > +FILES_${PN} +=3D "${prefix}/etc \
> > >>
> > >> user ${sysconfdir}
> > >
> > > IIRC ${sysconfdir} points to /etc and I need /usr/etc, I could not
> find anything to point there at a quick glance so I used this.
> >
> > yes that was the question. If the content should be moved to /etc
> > instead of /usr/etc since /usr/etc does not seem to be
> > that common.
> >
> > >>
> > >>
> > >> > +       ${libdir}/traceevent/plugins/"
> > >> > --
> > >> > 2.25.1
> > >> >
> > >> >
> > >> >=20
> > >> >
>

--0000000000002dac4205b525fc91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, will check the musl build and send a v2. I can als=
o move those files to /etc since it is indeed a more common path.<br></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=C3=8E=
n s=C3=A2m., 28 nov. 2020 la 00:32, Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com">raj.khem@gmail.com</a>&gt; a scris:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">btw. it failed musl build as well<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/538865/" rel=3D"=
noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Detail=
s/538865/</a><br>
<br>
It perhaps needs to include sys/types.h somewhere.<br>
<br>
On Fri, Nov 27, 2020 at 2:24 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Fri, Nov 27, 2020 at 1:01 PM Beniamin Sandu &lt;<a href=3D"mailto:=
beniaminsandu@gmail.com" target=3D"_blank">beniaminsandu@gmail.com</a>&gt; =
wrote:<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; =C3=8En vin., 27 nov. 2020 la 21:51, Khem Raj &lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; a scri=
s:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Fri, Nov 27, 2020 at 7:37 AM beni &lt;<a href=3D"mailto:b=
eniaminsandu@gmail.com" target=3D"_blank">beniaminsandu@gmail.com</a>&gt; w=
rote:<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Signed-off-by: Beniamin Sandu &lt;<a href=3D"mailto:ben=
iaminsandu@gmail.com" target=3D"_blank">beniaminsandu@gmail.com</a>&gt;<br>
&gt; &gt;&gt; &gt; ---<br>
&gt; &gt;&gt; &gt;=C2=A0 .../recipes-kernel/trace-cmd/<a href=3D"http://tr=
ace-cmd_2.9.1.bb" rel=3D"noreferrer" target=3D"_blank">trace-cmd_2.9.1.bb</=
a>=C2=A0 | 16 ++++++++++++++++<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Please add it to packagegroup-meta-oe as well.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Okay.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;=C2=A0 1 file changed, 16 insertions(+)<br>
&gt; &gt;&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-kernel/trace-c=
md/<a href=3D"http://trace-cmd_2.9.1.bb" rel=3D"noreferrer" target=3D"_blan=
k">trace-cmd_2.9.1.bb</a><br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; diff --git a/meta-oe/recipes-kernel/trace-cmd/<a href=
=3D"http://trace-cmd_2.9.1.bb" rel=3D"noreferrer" target=3D"_blank">trace-=
cmd_2.9.1.bb</a> b/meta-oe/recipes-kernel/trace-cmd/<a href=3D"http://trace=
-cmd_2.9.1.bb" rel=3D"noreferrer" target=3D"_blank">trace-cmd_2.9.1.bb</a><=
br>
&gt; &gt;&gt; &gt; new file mode 100644<br>
&gt; &gt;&gt; &gt; index 000000000..d9599c046<br>
&gt; &gt;&gt; &gt; --- /dev/null<br>
&gt; &gt;&gt; &gt; +++ b/meta-oe/recipes-kernel/trace-cmd/<a href=3D"http:=
//trace-cmd_2.9.1.bb" rel=3D"noreferrer" target=3D"_blank">trace-cmd_2.9.1.=
bb</a><br>
&gt; &gt;&gt; &gt; @@ -0,0 +1,16 @@<br>
&gt; &gt;&gt; &gt; +SUMMARY =3D &quot;User-space front-end command-line to=
ol for ftrace&quot;<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; +LICENSE =3D &quot;GPLv2 &amp; LGPLv2.1&quot;<br>
&gt; &gt;&gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D873f48=
a813bded3de6ebc54e6880c4ac&quot;<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; +SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.o=
rg/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;branch=3Dmaster" rel=3D"n=
oreferrer" target=3D"_blank">git.kernel.org/pub/scm/linux/kernel/git/rosted=
t/trace-cmd.git;branch=3Dmaster</a>&quot;<br>
&gt; &gt;&gt; &gt; +SRCREV =3D &quot;530b1a0caef39466e16bbd49de5afef89656f=
03f&quot;<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; +do_install() {<br>
&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake DESTDIR=3D${D} i=
nstall<br>
&gt; &gt;&gt; &gt; +}<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; +FILES_${PN} +=3D &quot;${prefix}/etc \<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; user ${sysconfdir}<br>
&gt; &gt;<br>
&gt; &gt; IIRC ${sysconfdir} points to /etc and I need /usr/etc, I could n=
ot find anything to point there at a quick glance so I used this.<br>
&gt;<br>
&gt; yes that was the question. If the content should be moved to /etc<br>
&gt; instead of /usr/etc since /usr/etc does not seem to be<br>
&gt; that common.<br>
&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/traceevent/plugin=
s/&quot;<br>
&gt; &gt;&gt; &gt; --<br>
&gt; &gt;&gt; &gt; 2.25.1<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; <br>
&gt; &gt;&gt; &gt;<br>
</blockquote></div>

--0000000000002dac4205b525fc91--
