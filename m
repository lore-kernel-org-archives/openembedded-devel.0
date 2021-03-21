Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.38.1616341823207905470
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Mar 2021 08:50:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PVLFLERH;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id u5so17306962ejn.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 21 Mar 2021 08:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jYLgYtAzSXSR2E7YSwg7b/x5bod/mq7//mudEieqhu0=;
        b=PVLFLERHZIybZkm59XDF4wQ2tNWdFR9s1alDqUuUJXUbGVnmfxJOoaZaJdd3RX33Cz
         BLSq0Mk2xyt8+dA3UQf5yDyCGZaGoYoz9kIHbLIRzz1WefiWWCYPcCZGvExLO6aR6j4h
         w4J9/N3ghCZVWNX2IBT2EKcP47117ngOgZsNSFdyNLdMGV5KJg10Po3Aac/BKrNXmdjw
         XlTO0VJlrTvKEwBxlRPqxiEQ1Ml1lggA0/2CXbFBkQ1N0LZleRQIo0MDP/C3RUtVsYuL
         tJ8NkXrOMWQ36qOcXaodprOcwFMAyoszG2b+fAftpw1ppiDAAnOvUTUmGAB7E+hLfjzR
         WK1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jYLgYtAzSXSR2E7YSwg7b/x5bod/mq7//mudEieqhu0=;
        b=DHQMQqPp3C5tjM90C0AYmGuveRjdF6VNQEWc9BD90X3VSi+Z+wmLPXMqovqOYjlZ1g
         bC3MGQ930T0ybSmjtT+3kQqUG680ZOzJUNXTyAvjYmYwW8UMaz83LknXdVRh2mWm73Zv
         5ClSO5Roh8XMkoAjR7hJNV2ch1KhlfS5H36O1fCkz+3ov079equ+Hkmt+hOxp6CdzeY5
         r9wy7BMTQ02Z1xBaNSCEzOt5UrQYgh6y4rN+W0aX+PaJStLbjJ0nmZAzIGxrkFkfHvL0
         86TT9cVcE1of12zcDZ7P+UNuoX0N5067G6vlwYSkTVwFmqYciVe61UstFrkWCiIyT167
         11dg==
X-Gm-Message-State: AOAM530/Z+5BBD4pl4ONmtdkkODMJsA++tsivJkjaW5k+qQrMtpqYjOp
	poFOJ8oQGlDIgEN0Xl+exzU7UndimjLgpwu5n0E=
X-Google-Smtp-Source: ABdhPJw8hfeIsuXHgiAvCAjhArykZrkFoWUmKevJnlsTFveVmXglEtom73uijlDukQI+yEp89VYI3PpSAQumxX37Kbc=
X-Received: by 2002:a17:906:f0c8:: with SMTP id dk8mr15237079ejb.300.1616341821756;
 Sun, 21 Mar 2021 08:50:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210320223945.40947-1-quaresma.jose@gmail.com> <CAMKF1spmjY4uh5RzFtyHa9n93q=CziERFVV0z_JP9zyiR32o-A@mail.gmail.com>
In-Reply-To: <CAMKF1spmjY4uh5RzFtyHa9n93q=CziERFVV0z_JP9zyiR32o-A@mail.gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Sun, 21 Mar 2021 15:50:30 +0000
Message-ID: <CANPvuRmJ1w5niLwcH0-QJPC_m_G6gq3BuXNNEg9KSGEituUowg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] usrsctp: drop receipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001f16a405be0de842"

--0000000000001f16a405be0de842
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khen.

You are right. I have only look at the oe-core and meta-openembedded and
forget that exist many layers and products around that can use this.
Sorry for this and you can drop this patch.

Khem Raj <raj.khem@gmail.com> escreveu no dia s=C3=A1bado, 20/03/2021 =C3=
=A0(s) 23:30:

> On Sat, Mar 20, 2021 at 3:39 PM Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> >
> > The only receipe that depends on this lib are the
> gstreamer1.0-plugins-bad.
> > An internal copy of the usrsctp lib is provided in
> gstreamer1.0-plugins-bad-1.18.
> > So it is not used by anyone in OE-core as well as in meta-openembedded=
.
> >
> > No sane distro would package libusrsctp and Debian definitely does not=
.
> > Also e.g. Firefox and Chrome are bundling the code too. There's probab=
ly
> also no
> > API stability guarantee at all for it, and by bundling the code we wou=
ld
> also get
> > around some of the problems with the library: global state shared
> between different users of the library
> > https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/issues/870
> >
>
> while I would like to remove recipes from meta-openembeded repo. this
> is a library which might be used by some internal products
> by some users.
>
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  .../packagegroup-meta-networking.bb           |  1 -
> >  .../recipes-protocols/usrsctp/usrsctp_git.bb  | 25 ------------------=
-
> >  2 files changed, 26 deletions(-)
> >  delete mode 100644 meta-networking/recipes-protocols/usrsctp/
> usrsctp_git.bb
> >
> > diff --git a/meta-networking/recipes-core/packagegroups/
> packagegroup-meta-networking.bb
> b/meta-networking/recipes-core/packagegroups/
> packagegroup-meta-networking.bb
> > index 231d8d4da..1979d32cb 100644
> > --- a/meta-networking/recipes-core/packagegroups/
> packagegroup-meta-networking.bb
> > +++ b/meta-networking/recipes-core/packagegroups/
> packagegroup-meta-networking.bb
> > @@ -166,7 +166,6 @@ RDEPENDS_packagegroup-meta-networking-protocols =
=3D "\
> >      zeroconf \
> >      pptp-linux \
> >      rp-pppoe \
> > -    usrsctp \
> >      xl2tpd \
> >  "
> >
> > diff --git a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
> b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
> > deleted file mode 100644
> > index 4f8e4d428..000000000
> > --- a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
> > +++ /dev/null
> > @@ -1,25 +0,0 @@
> > -DESCRIPTION =3D "This is a userland SCTP stack supporting FreeBSD, Li=
nux,
> Mac OS X and Windows."
> > -LICENSE =3D "BSD-3-Clause"
> > -LIC_FILES_CHKSUM =3D
> "file://LICENSE.md;md5=3Dffcf846341f3856d79a483eafa18e2a5"
> > -
> > -SRCREV =3D "a10cd498d964508c0e6ec6bd2be9dd4afcbb4d86"
> > -SRC_URI =3D "git://
> github.com/sctplab/usrsctp;protocol=3Dhttps;branch=3Dmaster \
> > -          "
> > -
> > -S =3D "${WORKDIR}/git"
> > -
> > -UPSTREAM_CHECK_COMMITS =3D "1"
> > -
> > -inherit autotools pkgconfig
> > -
> > -DEPENDS +=3D "openssl"
> > -
> > -CFLAGS  +=3D "-DSCTP_USE_OPENSSL_SHA1 -fPIC"
> > -LDFLAGS +=3D "-lssl -lcrypto"
> > -
> > -PACKAGECONFIG ?=3D "disablewarnings inet inet6"
> > -PACKAGECONFIG[disablewarnings] =3D "--disable-warnings-as-errors,,"
> > -PACKAGECONFIG[inet] =3D "--enable-inet,--disable-inet,"
> > -PACKAGECONFIG[inet6] =3D "--enable-inet6,--disable-inet6,"
> > -
> > -EXTRA_OECONF +=3D "--disable-debug"
> > --
> > 2.30.2
> >
> >
> >=20
> >
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000001f16a405be0de842
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Khen.</div><div><br></div><div>You are right. I ha=
ve only look at the oe-core and meta-openembedded and forget that exist man=
y layers and products around that can use this.</div><div>Sorry for this an=
d you can drop this patch.<br></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com">raj.khem@gmail.com</a>&gt; escreveu no dia s=C3=A1bado, 20/03/2=
021 =C3=A0(s) 23:30:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Sat, Mar 20, 2021 at 3:39 PM Jose Quaresma &lt;<a href=3D"mailto:qu=
aresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; The only receipe that depends on this lib are the gstreamer1.0-plugin=
s-bad.<br>
&gt; An internal copy of the usrsctp lib is provided in gstreamer1.0-plugi=
ns-bad-1.18.<br>
&gt; So it is not used by anyone in OE-core as well as in meta-openembedde=
d.<br>
&gt;<br>
&gt; No sane distro would package libusrsctp and Debian definitely does no=
t.<br>
&gt; Also e.g. Firefox and Chrome are bundling the code too. There&#39;s p=
robably also no<br>
&gt; API stability guarantee at all for it, and by bundling the code we wo=
uld also get<br>
&gt; around some of the problems with the library: global state shared bet=
ween different users of the library<br>
&gt; <a href=3D"https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-=
/issues/870" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedeskto=
p.org/gstreamer/gst-plugins-bad/-/issues/870</a><br>
&gt;<br>
<br>
while I would like to remove recipes from meta-openembeded repo. this<br>
is a library which might be used by some internal products<br>
by some users.<br>
<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmai=
l.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../<a href=3D"http://packagegroup-meta-networking.bb" rel=3D"n=
oreferrer" target=3D"_blank">packagegroup-meta-networking.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 -<br>
&gt;=C2=A0 .../recipes-protocols/usrsctp/<a href=3D"http://usrsctp_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">usrsctp_git.bb</a>=C2=A0 | 25 -------=
------------<br>
&gt;=C2=A0 2 files changed, 26 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta-networking/recipes-protocols/usrsctp/<a=
 href=3D"http://usrsctp_git.bb" rel=3D"noreferrer" target=3D"_blank">usrsct=
p_git.bb</a><br>
&gt;<br>
&gt; diff --git a/meta-networking/recipes-core/packagegroups/<a href=3D"ht=
tp://packagegroup-meta-networking.bb" rel=3D"noreferrer" target=3D"_blank">=
packagegroup-meta-networking.bb</a> b/meta-networking/recipes-core/packageg=
roups/<a href=3D"http://packagegroup-meta-networking.bb" rel=3D"noreferrer"=
 target=3D"_blank">packagegroup-meta-networking.bb</a><br>
&gt; index 231d8d4da..1979d32cb 100644<br>
&gt; --- a/meta-networking/recipes-core/packagegroups/<a href=3D"http://pa=
ckagegroup-meta-networking.bb" rel=3D"noreferrer" target=3D"_blank">package=
group-meta-networking.bb</a><br>
&gt; +++ b/meta-networking/recipes-core/packagegroups/<a href=3D"http://pa=
ckagegroup-meta-networking.bb" rel=3D"noreferrer" target=3D"_blank">package=
group-meta-networking.bb</a><br>
&gt; @@ -166,7 +166,6 @@ RDEPENDS_packagegroup-meta-networking-protocols =
=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 zeroconf \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 pptp-linux \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rp-pppoe \<br>
&gt; -=C2=A0 =C2=A0 usrsctp \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 xl2tpd \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; diff --git a/meta-networking/recipes-protocols/usrsctp/<a href=3D"htt=
p://usrsctp_git.bb" rel=3D"noreferrer" target=3D"_blank">usrsctp_git.bb</a>=
 b/meta-networking/recipes-protocols/usrsctp/<a href=3D"http://usrsctp_git.=
bb" rel=3D"noreferrer" target=3D"_blank">usrsctp_git.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index 4f8e4d428..000000000<br>
&gt; --- a/meta-networking/recipes-protocols/usrsctp/<a href=3D"http://usr=
sctp_git.bb" rel=3D"noreferrer" target=3D"_blank">usrsctp_git.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,25 +0,0 @@<br>
&gt; -DESCRIPTION =3D &quot;This is a userland SCTP stack supporting FreeB=
SD, Linux, Mac OS X and Windows.&quot;<br>
&gt; -LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE.md;md5=3Dffcf846341f3856d7=
9a483eafa18e2a5&quot;<br>
&gt; -<br>
&gt; -SRCREV =3D &quot;a10cd498d964508c0e6ec6bd2be9dd4afcbb4d86&quot;<br>
&gt; -SRC_URI =3D &quot;git://<a href=3D"http://github.com/sctplab/usrsctp=
;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">git=
hub.com/sctplab/usrsctp;protocol=3Dhttps;branch=3Dmaster</a> \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; -<br>
&gt; -S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; -<br>
&gt; -UPSTREAM_CHECK_COMMITS =3D &quot;1&quot;<br>
&gt; -<br>
&gt; -inherit autotools pkgconfig<br>
&gt; -<br>
&gt; -DEPENDS +=3D &quot;openssl&quot;<br>
&gt; -<br>
&gt; -CFLAGS=C2=A0 +=3D &quot;-DSCTP_USE_OPENSSL_SHA1 -fPIC&quot;<br>
&gt; -LDFLAGS +=3D &quot;-lssl -lcrypto&quot;<br>
&gt; -<br>
&gt; -PACKAGECONFIG ?=3D &quot;disablewarnings inet inet6&quot;<br>
&gt; -PACKAGECONFIG[disablewarnings] =3D &quot;--disable-warnings-as-error=
s,,&quot;<br>
&gt; -PACKAGECONFIG[inet] =3D &quot;--enable-inet,--disable-inet,&quot;<br=
>
&gt; -PACKAGECONFIG[inet6] =3D &quot;--enable-inet6,--disable-inet6,&quot;=
<br>
&gt; -<br>
&gt; -EXTRA_OECONF +=3D &quot;--disable-debug&quot;<br>
&gt; --<br>
&gt; 2.30.2<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma<=
/div></div></div>

--0000000000001f16a405be0de842--
