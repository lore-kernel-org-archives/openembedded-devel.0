Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web11.20657.1602867203392658567
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Oct 2020 09:53:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q/G2ifMd;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id r8so1968546qtp.13
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2020 09:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZOfZtSIflhFoIXo6h1o9OSTalvA6+YYavLm18TNTA3I=;
        b=Q/G2ifMdPz9kE1ru7gFYAu31OOy3PgB5qQUs+Yv+gjanYHi2+UPYe2tgXZKbvEdB9q
         s9jw0Iy8kR99/Po0ANjxuiC1q8s4M7QLVjdR6V68AWe1wbfuqBl2EuN6bzzLJQgZMZkV
         FIrRih670Yok/ispSmV4cY7rewyD/v2nAGhZf25UbOficUGnW17giWkF+QJxjIXEt5n/
         rGzy8FMAgIK/6o0lJ7mdVzcxt03ih3UJTD3BOsiqxxCe17krsyue9caGcWU3LztKRMvB
         BrB77GXQIpmrySQc5jSFS9Qdrz4AEqioadPuy7DZQpP008vUneVYDKx6jCHItB0k7IsL
         2WNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZOfZtSIflhFoIXo6h1o9OSTalvA6+YYavLm18TNTA3I=;
        b=Gby9j8Vitxy9CRoHU/Y5r01KyxvDqq6PDBqy9k7K0n2KZIaakkS0tn5ajt4jvC0eIV
         8fi09LD3n7Et2Ko6LOtxT6vPlTIZJ6yOpNaj7VCclJK1GqTf1vnHCemJkn/yAOF9In2j
         zprEUTS6jHdnWtJ3d1bbrwjLvP4NRyn7F3iNsp31Kg1WxfLy795pWDX4Qyd2w0rKEaRa
         anxBgfb9zbf416d1tnh3WXiPGKBvj57ozSEWICEE0XWQEiO2hDbYaKCsRWRyoAqH0ZpH
         vmd1J3PHty8DV4msf43lb5s57Mi/E2Qz1G4qQKWM+pFVVhpnHUZgCEP/PkUbK9l4Cy1u
         usWQ==
X-Gm-Message-State: AOAM533bJl0BBPgzBRPiuzwk8T3Yy+l9shYDagKcIkvpsV5Z7VuqhGm4
	nkGDKOihbIGszrDImhUdQ8G0Pxs+eAJWhXtAT7I=
X-Google-Smtp-Source: ABdhPJzMcPxU38VcW7nzxr7TB/D6+sc0F/m8UyF1RaqfQkMt+fKkgK16nRKWODaOV9Pf3g9/2WEyqWigoJhZdgWllTk=
X-Received: by 2002:ac8:5a82:: with SMTP id c2mr4375024qtc.378.1602867202375;
 Fri, 16 Oct 2020 09:53:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200909084218.802654-1-m.tretter@pengutronix.de>
 <CAMKF1so-Zfiv+vbFf1J1-bSkBMSTN4gx548YJ5=cUK42YS--cg@mail.gmail.com>
 <CAMKF1srwBFPAxpd4BZGkC9TaC7gM2jYB2c9RmqeADxkRRf1fWQ@mail.gmail.com> <20201016135045.GA3743@pengutronix.de>
In-Reply-To: <20201016135045.GA3743@pengutronix.de>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 16 Oct 2020 09:52:56 -0700
Message-ID: <CAMKF1sqWnqvqRvJDx+MaTSkjtXcyvhZ+3aDsKsFXtPAFDXCk4A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] apitrace: add new recipe
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 16, 2020 at 6:50 AM Michael Tretter
<m.tretter@pengutronix.de> wrote:
>
> On Tue, 15 Sep 2020 15:58:50 -0700, Khem Raj wrote:
> > additionally, it fails to build on qemux86-64
> >
> >
> > /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/apitrace/9.0-r0/git/retrace/process_name.cpp:52:1:
> > error: redefinition of a 'extern inline' function 'readlink' is not
> > supported in C++
> > readlink(const char *pathname, char *buf, size_t bufsiz)
> > ^
> > /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/apitrace/9.0-r0/recipe-sysroot/usr/include/bits/unistd.h:145:8:
> > note: previous definition is here
> > __NTH (readlink (const char *__restrict __path, char *__restrict __buf,
> >        ^
>
> I cannot reproduce the build failure, but successfully built apitrace with
> this recipe on qemux86-64 with poky.
>
> Can you provide more details on your build failure?

this is with clang compiler. You can add meta-clang to your layers and
set TOOLCHAIN = "clang" in this recipe to reproduce.

>
> Michael
>
> >
> > On Wed, Sep 9, 2020 at 10:12 AM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Wed, Sep 9, 2020 at 2:54 AM Michael Tretter <m.tretter@pengutronix.de> wrote:
> > > >
> > > > apitrace consists of a set of tools to:
> > > >
> > > >  - trace OpenGL, OpenGL ES, Direct3D, and DirectDraw APIs calls to a file;
> > > >
> > > >  - replay OpenGL and OpenGL ES calls from a file;
> > > >
> > > >  - inspect OpenGL state at any call while retracing;
> > > >
> > > >  - visualize and edit trace files.
> > > >
> > >
> > > Thanks for contributing new recipe, they also need to go into
> > > appropriate packagegroup in packagegroup-meta-oe.bb
> > > so it can be built in testing images.
> > >
> > > > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > > > ---
> > > >  .../recipes-devtools/apitrace/apitrace_9.0.bb | 28 +++++++++++++++++++
> > > >  1 file changed, 28 insertions(+)
> > > >  create mode 100644 meta-oe/recipes-devtools/apitrace/apitrace_9.0.bb
> > > >
> > > > diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_9.0.bb b/meta-oe/recipes-devtools/apitrace/apitrace_9.0.bb
> > > > new file mode 100644
> > > > index 000000000000..6e61683cde92
> > > > --- /dev/null
> > > > +++ b/meta-oe/recipes-devtools/apitrace/apitrace_9.0.bb
> > > > @@ -0,0 +1,28 @@
> > > > +SUMMARY = "Tools for tracing OpenGL, Direct3D, and other graphics APIs"
> > > > +HOMEPAGE = "http://apitrace.github.io/"
> > > > +SECTION = "console/tools"
> > > > +LICENSE = "MIT & BSD-3-Clause"
> > > > +LIC_FILES_CHKSUM = "file://LICENSE;md5=aeb969185a143c3c25130bc2c3ef9a50 \
> > > > +                    file://thirdparty/snappy/COPYING;md5=f62f3080324a97b3159a7a7e61812d0c"
> > > > +
> > > > +SRCREV = "cae55f54c53449fd07f8a917dcd0874db2c15032"
> > > > +SRC_URI = "git://github.com/${BPN}/${BPN}.git"
> > > > +
> > > > +S = "${WORKDIR}/git"
> > > > +
> > > > +DEPENDS += "zlib libpng python3-native"
> > > > +
> > > > +inherit cmake
> > > > +
> > > > +EXTRA_OECMAKE += "\
> > > > +    -DENABLE_GUI=OFF \
> > > > +    -DENABLE_X11=OFF \
> > > > +    -DENABLE_STATIC_LIBGCC=OFF \
> > > > +    -DENABLE_STATIC_LIBSTDCXX=OFF \
> > > > +    -DPython3_ROOT_DIR=/usr/bin/python3-native \
> > > > +"
> > > > +
> > > > +# Use the bundled snappy library
> > > > +EXTRA_OECMAKE += "\
> > > > +    -DENABLE_STATIC_SNAPPY=ON \
> > > > +"
> > > > --
> > > > 2.20.1
> > > >
> > > > 
> >
