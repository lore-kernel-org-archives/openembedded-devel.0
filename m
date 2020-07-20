Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web10.7134.1595284181193932408
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2020 15:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZMuzAN30;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id e12so14681889qtr.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2020 15:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/wsmtAQf8vIMMljfJEieriZdaQTN9Q74CCyeEFRsek4=;
        b=ZMuzAN30vMsflWePhNxgWMEXyvWdpKhDuJ9nKmLbZb92DkbEaQ5H1UBP3KfJctnA2l
         QUxf9+ypB6jZYeL5UGgTASPX5pKSp5hvrb+IvLAE2tOIVcanPchMbsYuqBOVVaZRvMhc
         tBUW3RGtcCC4DE0ll24UXQ2EqONN+8h5RkvGQ1bcBdXl8IjBSQnPxplnKCq/R+cV7KKA
         teMTrzwV30MqVnVN+sN53D0Xv6SXQHTQOcRpCJsm7QjJy9wJVY4C2TCLI48k5ueAE6r0
         5kRSSpPrTuE4XH8FSvJOrMNGVGqj59269rajjEbxXVIoBlUMvUQJ3t0ki+3mTGvGyUqE
         bbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/wsmtAQf8vIMMljfJEieriZdaQTN9Q74CCyeEFRsek4=;
        b=lDBPS4sRjDCW0HzEYh5Fhi5F6vbSsnrtAjhGNmUMggMeYSBm/ZLLIEWFwSQZCxKWah
         a6mIg8aQK3xZZOfY2KdLgbnoyHyzdP85X7iUTJHn+taLOulgjR4egq0PeequRsOW1QHV
         YqLCbFbLsjoUPINXBWo2C0BnSiCtX+ZrHxNLlZga6Ris1/32p4HhGdosL9gq7RTplIDY
         jrLX24ALJSl2NVu/LO5nPJx1xlWlKLMONayso/P53LSo8vpXmsuaFQi6If6MGHXXhYxw
         zBQU6lq46YuQf67dfVQ8mLuxY63HqJNL9fqYiVQe3x3Cl+o7oXlujQJltAJXGSXjja/B
         tLlg==
X-Gm-Message-State: AOAM530/nKK4YsvH3gYZSFIZFWzoWlUq2dwIQLORmziZz2lVbkEj3yYJ
	GEoda4VViWifrCakjtoEu7nqb7AelGEil/b5zTw=
X-Google-Smtp-Source: ABdhPJzBzlrEgeIRhyl5jwEKrLxM9lgbwnsNBjDvMH1J/1gKKif2cUMy3D0mC2ZlX8jHI1IRGJHx1oXdPPBxF136xtg=
X-Received: by 2002:ac8:4f13:: with SMTP id b19mr26578938qte.146.1595284180167;
 Mon, 20 Jul 2020 15:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200717205956.131825-1-joe.slater@windriver.com>
 <CAMKF1so2eu6NJA3nfX6=96dF5NX7orT-wmdHEn5HJCGoMtwPrg@mail.gmail.com> <BY5PR11MB39925BE679AF15A585088706887B0@BY5PR11MB3992.namprd11.prod.outlook.com>
In-Reply-To: <BY5PR11MB39925BE679AF15A585088706887B0@BY5PR11MB3992.namprd11.prod.outlook.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 20 Jul 2020 15:29:14 -0700
Message-ID: <CAMKF1sryOnQzRot81G+OuysFR2=g47G6OPL1MjN01e_dEQn+CA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/1] lvm2: reproducible binaries
To: "Slater, Joseph" <joe.slater@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2020 at 3:16 PM Slater, Joseph <joe.slater@windriver.com> w=
rote:
>
> I have not looked at when it is printed, probably for --help or --versio=
n, but we would not be able to see the command line that invoked configure.=
  To me, that's not much of a loss.
>
> I originally had a patch that would allow the definition of CONFIGURE_LI=
NE in configure.ac to be overridden by setting it in the environment.  We c=
ould then do that, or not, in the recipe.  Maybe even make it a packageconf=
 option.  I can't remember why I switched to conditional patching, but I co=
uld always switch back.

options you suggest are definitely preferred over conditional patching
since these patches will cause extra work
and perhaps will become stale if someone is not testing reproducible build=
s.

>
> Joe
>
> -----Original Message-----
> From: Khem Raj <raj.khem@gmail.com>
> Sent: Monday, July 20, 2020 2:40 PM
> To: Slater, Joseph <joe.slater@windriver.com>
> Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>; MacLe=
od, Randy <Randy.MacLeod@windriver.com>
> Subject: Re: [oe] [meta-oe][PATCH 1/1] lvm2: reproducible binaries
>
> On Fri, Jul 17, 2020 at 2:00 PM Joe Slater <joe.slater@windriver.com> wr=
ote:
> >
> > For reproducible binaries, create a static CONFIGURE_LINE during
> > configuration rather than reporting the command line invoking
> > configure.
> >
>
> is there any downside of applying this patch without conditional depende=
ncy on reproducible builds ?
> what do we lose ?
>
> > Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > ---
> >  .../lvm2/files/reproducible-build.patch            | 24 +++++++++++++=
+++++++++
> >  meta-oe/recipes-support/lvm2/lvm2.inc              |  2 ++
> >  2 files changed, 26 insertions(+)
> >  create mode 100644
> > meta-oe/recipes-support/lvm2/files/reproducible-build.patch
> >
> > diff --git
> > a/meta-oe/recipes-support/lvm2/files/reproducible-build.patch
> > b/meta-oe/recipes-support/lvm2/files/reproducible-build.patch
> > new file mode 100644
> > index 0000000..db598a8
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/lvm2/files/reproducible-build.patch
> > @@ -0,0 +1,24 @@
> > +configure.ac:  override CONFIGURE_LINE
> > +
> > +For reproducible binaries, we need to report a constant CONFIGURE_LIN=
E.
> > +This patched is only applied for such builds.
> > +
> > +Upstream-Status: Inappropriate [oe specific]
> > +
> > +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > +
> > +
> > +--- git.orig/configure.ac
> > ++++ git/configure.ac
> > +@@ -15,7 +15,10 @@ AC_PREREQ(2.69)
> > +
> > +#####################################################################
> > +###########  dnl -- Process this file with autoconf to produce a
> > +configure script.
> > + AC_INIT
> > +-CONFIGURE_LINE=3D"$0 $@"
> > ++dnl The default CONFIGURE_LINE has been overridden for reproducible
> > ++binaries dnl CONFIGURE_LINE=3D"$0 $@"
> > ++CONFIGURE_LINE=3D"configure parameters are not available for reprodu=
cible builds"
> > ++
> > + AC_CONFIG_SRCDIR([lib/device/dev-cache.h])
> > + AC_CONFIG_HEADERS([include/configure.h])
> > +
> > diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc
> > b/meta-oe/recipes-support/lvm2/lvm2.inc
> > index 01c9df4..ab618b4 100644
> > --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> > +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> > @@ -15,7 +15,9 @@ SRC_URI =3D "git://sourceware.org/git/lvm2.git \
> >             file://0001-Avoid-bashisms-in-init-scripts.patch \
> >             file://0005-do-not-build-manual.patch \
> >
> > file://0006-start-lvm2-monitor.service-after-tmp.mount.patch \
> > +
> > + ${@bb.utils.contains('BUILD_REPRODUCIBLE_BINARIES','1','file://repro
> > + ducible-build.patch','', d)} \
> >             "
> > +
> >  SRCREV =3D "b9391b1b9f0b73303fa21f8f92574d17ce4c2b02"
> >  S =3D "${WORKDIR}/git"
> >
> > --
> > 2.7.4
> >
> >=20
