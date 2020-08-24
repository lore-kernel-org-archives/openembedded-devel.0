Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.189277.1598250145302724542
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Aug 2020 23:22:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OhAXmtRK;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id n129so6477474qkd.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2020 23:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xy5QJQHFSNNvy7L1YMXwkHuvbokMO+ljemZ52eInmD0=;
        b=OhAXmtRK8vl9Qm7gpKFvjxeZSWauz+3/ualYCN5XGko86gp8hT7W3VR0tqsuJSSfqE
         uopDpkTrHvIUdGhJDOwT18cLJYzCe1uukmWBhQpwHL8n2zmQQSq+8mhAh4kauF2rSMEP
         cPnWVvTAZVepXlnqhXYSyDMJkBzx3Ves+i9IdFgvKLoTGcrTu3pCM30I9MOe9chSl2JL
         Wuf8TexgWNMN4ikmrzq3G8jrqU+LAFVCDa4X++PxfF2kwZLeW2BsS0CeJx9PK1Ohpk7T
         vjp2Yc2r3uZpfHig+GHW3F6AD9lnegFgPSXIo24+lDMpTX0H1b3/KFbz17IwDijm8kOM
         0ekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xy5QJQHFSNNvy7L1YMXwkHuvbokMO+ljemZ52eInmD0=;
        b=BdesoLcbjDIQ547WjJzb63TE7ChZ0bFsaloN6/8Zp84WhoqJRGPWAynXbaBym40LpZ
         8KxzzicRAxP63RX6X45Aep6ElUXZIC3iGLMtAOKNhE0OMGHnAT4VQKJyuaVAqfCwjc6n
         hARypLqD7yuAL4Ixsac3UakiqQj5DlhG/ZVd3hR8rkBoSIaCLt6qZR6AZFjfF4RWoHPS
         5Ths6sTNfJ2IAvrOEzSRs27/VegRnBZ9WH56jAqqCR2oCaFd3djGX4o0ubQY1bY5gpe2
         XtlwJG3mhqKxvoXac8M/5SEu9B4w4f7/+qsTKYnvy9/Lzumzq3ijZuY7iZSQHpfKCPq3
         aqQw==
X-Gm-Message-State: AOAM532ZsxKdbCj9Tw3Z2rgpHVUWzPANQBGKAFSxKmRxpLSyPJGsP0Cm
	0Z5x9g/0kniTqux8WumVTPB+PjiSYt5LJro37dI=
X-Google-Smtp-Source: ABdhPJwJ2Ub1ZcjluTc4mjMMVLfvUsq/i+vKqqAaP92k+MdjAjb47YszikEC/X+gDgTxThX9dZO8JW40NNh6tbLxKpo=
X-Received: by 2002:a05:620a:48:: with SMTP id t8mr3449949qkt.474.1598250144335;
 Sun, 23 Aug 2020 23:22:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200824060235.196568-1-richard.leitner@skidata.com>
 <CAMKF1sr022VGqvOj1SjBUofe_PGiTBNScXxv6rbip1P8BZjgDg@mail.gmail.com> <20200824061139.GC65616@pcleri>
In-Reply-To: <20200824061139.GC65616@pcleri>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 23 Aug 2020 23:21:58 -0700
Message-ID: <CAMKF1soSvpMctpqNouSwMm5mtBXWX03mUU2Fs+T4A68NCEHOXw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] liburing: add v0.7
To: Richard Leitner <richard.leitner@skidata.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 23, 2020 at 11:11 PM Richard Leitner
<richard.leitner@skidata.com> wrote:
>
> On Sun, Aug 23, 2020 at 11:06:14PM -0700, Khem Raj wrote:
> > On Sun, Aug 23, 2020 at 11:03 PM Richard Leitner
> > <richard.leitner@skidata.com> wrote:
> > >
> > > Add initial support for liburing v0.7.
> > >
> > > Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> > > ---
> > >  .../recipes-support/liburing/liburing_git.bb  | 21 +++++++++++++++++=
++
> >
> > better to embed the PV in recipe name, so call it liburing_0.7.bb
>
> Ok. So we're using PV in the recipe name also for recipes where the
> SRCREV is a git commit id?

right. its easy that way to bbappend it etc.

> Wasn't aware of that. Thanks.
>
> >
> > >  1 file changed, 21 insertions(+)
> > >  create mode 100644 meta-oe/recipes-support/liburing/liburing_git.bb
> > >
> > > diff --git a/meta-oe/recipes-support/liburing/liburing_git.bb b/meta-=
oe/recipes-support/liburing/liburing_git.bb
> > > new file mode 100644
> > > index 000000000..87c919e13
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-support/liburing/liburing_git.bb
> > > @@ -0,0 +1,21 @@
> > > +SUMMARY =3D "This is the io_uring library, liburing."
> > > +DESCRIPTION =3D "liburing provides helpers to setup and teardown io_=
uring \
> > > +instances, and also a simplified interface for applications that don=
't need \
> > > +(or want) to deal with the full kernel side implementation."
> > > +HOMEPAGE =3D "https://github.com/axboe/liburing"
> > > +BUGTRACKER =3D "https://github.com/axboe/liburing/issues"
> > > +SECTION =3D "libs"
> > > +
> > > +LICENSE =3D "LGPLv2.1 | MIT"
> > > +LIC_FILES_CHKSUM =3D "file://README;beginline=3D41;endline=3D44;md5=
=3Dd51b5805e2a675685e6a66ca50904cf9"
> > > +
> > > +SRC_URI =3D "git://github.com/axboe/liburing.git;branch=3Dmaster;pro=
tocol=3Dhttps;name=3Dgit"
> >
> > No need of name=3D
>
> Oh, you're right. Thanks. I'll send a v2 soon.
>
> >
> > > +PV =3D "0.7"
> > > +SRCREV_git =3D "45f0735219a615ae848033c47c7e2d85d101d43e"
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +EXTRA_OEMAKE =3D "'CC=3D${CC}' 'RANLIB=3D${RANLIB}' 'AR=3D${AR}' 'CF=
LAGS=3D${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=3D${S}'"
> > > +
> > > +do_install () {
> > > +    oe_runmake install DESTDIR=3D${D} SBINDIR=3D${sbindir} MANDIR=3D=
${mandir} INCLUDEDIR=3D${includedir}
> > > +}
> > > --
> > > 2.28.0
> > >
>
> --
> Richard Leitner
> Hardware R&D / Senior Embedded Linux Engineer
>
> SKIDATA | Driving Your Digital Future
>
> SKIDATA GmbH
> Untersbergstra=C3=9Fe 40 | 5083 Gr=C3=B6dig/Salzburg | Austria
> [t] +43-6246-888-4245 | [m] +43-664-88616370
> [w] www.skidata.com
