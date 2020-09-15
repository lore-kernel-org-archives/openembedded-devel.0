Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web12.10080.1600210781069552245
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 15:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RWg+9GAB;
 spf=pass (domain: gmail.com, ip: 209.85.166.193, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f193.google.com with SMTP id a19so4601681ilq.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2020 15:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E7bYPo+PwOCI+5N+5EY6deQ1GehFlLB9vRNzOfo7D80=;
        b=RWg+9GABuN0Di/R/UPcJIMIStnFklQlJFpHkXcGdffHELSXNjZMslJri6IMP/zMk5y
         CQwReFMex4lGlWviaCa0Fph9xA5PT0Zw1ClGTEiySKYnRBxqw1MOfGTGZs0MAkIH+PAJ
         eJgN5D7ommaEDd3IU+HyEvXa+dkUUGCEIcz994MeNMPFVsqr4FJY7LIZV4TmWypbEdnl
         ZMdhr5Tdi7gIOTFFcj370iKXI3/w0wSWwU3kLmRBMvbKNjcWsAaBlbRzMkK5htC5oj1G
         etkwvrEqmL5BSBDx7csdCP9VzFK7lnndExhrZVUj5oHlE1dLZ2HVdpoQ28YYLnoLYNAJ
         EQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E7bYPo+PwOCI+5N+5EY6deQ1GehFlLB9vRNzOfo7D80=;
        b=VoEfGBiW+JnRTHxyDrhV6Y8dnQPNWGV1Cb7CAjWz+AFTDBc6dvLKzztwsnMs6wAYIc
         ofe3RzXHEb9WlnXmnOeTO4BHxZjDVDwK1pjydMDe3e23rniG2ch1LzibR6zhQvwE9a9K
         /D+pG3w42G4zMS47dfFkyGFNxIorts0qiYcVrwFejiDPgyMFXU/DGrP5BwEELhlN/pxy
         fC7vyDPq9CjQLS7QimIFAjSPvHRiH+LxztcCYlf5BVX5rrBCBOtkPBH48DWMiuA1bXJM
         MfPSYwVE/0mWOmLAYTpDIcWPxuMZ2NQ1LtbR4jbr01UMPud0z1b8EE8ZBIFL+y8uRKUL
         2H5Q==
X-Gm-Message-State: AOAM533L8d/fs8nUcNYNppZhEQH9V4mavohoCEljBiCiKCq2b1PX47iq
	EAvsAGvgoMWr3jzFaP2uDhdcv8LacbgBisXOr5a5nuVxpA8w6g==
X-Google-Smtp-Source: ABdhPJzQnQIVNQ7oSAmP4In6sOThdg51d+x5U+hK6wyasgL1NGLTKNLamM7k/IlDXXfo2Uw3vFp0dF3il1rufkoW1yo=
X-Received: by 2002:a05:6e02:8b3:: with SMTP id a19mr11676350ilt.174.1600210780155;
 Tue, 15 Sep 2020 15:59:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200909084218.802654-1-m.tretter@pengutronix.de> <CAMKF1so-Zfiv+vbFf1J1-bSkBMSTN4gx548YJ5=cUK42YS--cg@mail.gmail.com>
In-Reply-To: <CAMKF1so-Zfiv+vbFf1J1-bSkBMSTN4gx548YJ5=cUK42YS--cg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 15 Sep 2020 15:58:50 -0700
Message-ID: <CAMKF1srwBFPAxpd4BZGkC9TaC7gM2jYB2c9RmqeADxkRRf1fWQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] apitrace: add new recipe
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

additionally, it fails to build on qemux86-64


/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/apitrace/9.0-r0/git/retrace/process_name.cpp:52:1:
error: redefinition of a 'extern inline' function 'readlink' is not
supported in C++
readlink(const char *pathname, char *buf, size_t bufsiz)
^
/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/apitrace/9.0-r0/recipe-sysroot/usr/include/bits/unistd.h:145:8:
note: previous definition is here
__NTH (readlink (const char *__restrict __path, char *__restrict __buf,
       ^

On Wed, Sep 9, 2020 at 10:12 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Sep 9, 2020 at 2:54 AM Michael Tretter <m.tretter@pengutronix.de> wrote:
> >
> > apitrace consists of a set of tools to:
> >
> >  - trace OpenGL, OpenGL ES, Direct3D, and DirectDraw APIs calls to a file;
> >
> >  - replay OpenGL and OpenGL ES calls from a file;
> >
> >  - inspect OpenGL state at any call while retracing;
> >
> >  - visualize and edit trace files.
> >
>
> Thanks for contributing new recipe, they also need to go into
> appropriate packagegroup in packagegroup-meta-oe.bb
> so it can be built in testing images.
>
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > ---
> >  .../recipes-devtools/apitrace/apitrace_9.0.bb | 28 +++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >  create mode 100644 meta-oe/recipes-devtools/apitrace/apitrace_9.0.bb
> >
> > diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_9.0.bb b/meta-oe/recipes-devtools/apitrace/apitrace_9.0.bb
> > new file mode 100644
> > index 000000000000..6e61683cde92
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/apitrace/apitrace_9.0.bb
> > @@ -0,0 +1,28 @@
> > +SUMMARY = "Tools for tracing OpenGL, Direct3D, and other graphics APIs"
> > +HOMEPAGE = "http://apitrace.github.io/"
> > +SECTION = "console/tools"
> > +LICENSE = "MIT & BSD-3-Clause"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=aeb969185a143c3c25130bc2c3ef9a50 \
> > +                    file://thirdparty/snappy/COPYING;md5=f62f3080324a97b3159a7a7e61812d0c"
> > +
> > +SRCREV = "cae55f54c53449fd07f8a917dcd0874db2c15032"
> > +SRC_URI = "git://github.com/${BPN}/${BPN}.git"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +DEPENDS += "zlib libpng python3-native"
> > +
> > +inherit cmake
> > +
> > +EXTRA_OECMAKE += "\
> > +    -DENABLE_GUI=OFF \
> > +    -DENABLE_X11=OFF \
> > +    -DENABLE_STATIC_LIBGCC=OFF \
> > +    -DENABLE_STATIC_LIBSTDCXX=OFF \
> > +    -DPython3_ROOT_DIR=/usr/bin/python3-native \
> > +"
> > +
> > +# Use the bundled snappy library
> > +EXTRA_OECMAKE += "\
> > +    -DENABLE_STATIC_SNAPPY=ON \
> > +"
> > --
> > 2.20.1
> >
> > 
