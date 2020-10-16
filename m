Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.16152.1602856248540238786
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Oct 2020 06:50:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: mtr@pengutronix.de)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mtr@pengutronix.de>)
	id 1kTQ85-0007W0-OR; Fri, 16 Oct 2020 15:50:45 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <mtr@pengutronix.de>)
	id 1kTQ85-00016w-6a; Fri, 16 Oct 2020 15:50:45 +0200
Date: Fri, 16 Oct 2020 15:50:45 +0200
From: "Michael Tretter" <m.tretter@pengutronix.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] apitrace: add new recipe
Message-ID: <20201016135045.GA3743@pengutronix.de>
References: <20200909084218.802654-1-m.tretter@pengutronix.de>
 <CAMKF1so-Zfiv+vbFf1J1-bSkBMSTN4gx548YJ5=cUK42YS--cg@mail.gmail.com>
 <CAMKF1srwBFPAxpd4BZGkC9TaC7gM2jYB2c9RmqeADxkRRf1fWQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srwBFPAxpd4BZGkC9TaC7gM2jYB2c9RmqeADxkRRf1fWQ@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 15:48:52 up 239 days, 21:19, 147 users,  load average: 0.02, 0.09,
 0.14
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, 15 Sep 2020 15:58:50 -0700, Khem Raj wrote:
> additionally, it fails to build on qemux86-64
> 
> 
> /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/apitrace/9.0-r0/git/retrace/process_name.cpp:52:1:
> error: redefinition of a 'extern inline' function 'readlink' is not
> supported in C++
> readlink(const char *pathname, char *buf, size_t bufsiz)
> ^
> /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/apitrace/9.0-r0/recipe-sysroot/usr/include/bits/unistd.h:145:8:
> note: previous definition is here
> __NTH (readlink (const char *__restrict __path, char *__restrict __buf,
>        ^

I cannot reproduce the build failure, but successfully built apitrace with
this recipe on qemux86-64 with poky.

Can you provide more details on your build failure?

Michael

> 
> On Wed, Sep 9, 2020 at 10:12 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Wed, Sep 9, 2020 at 2:54 AM Michael Tretter <m.tretter@pengutronix.de> wrote:
> > >
> > > apitrace consists of a set of tools to:
> > >
> > >  - trace OpenGL, OpenGL ES, Direct3D, and DirectDraw APIs calls to a file;
> > >
> > >  - replay OpenGL and OpenGL ES calls from a file;
> > >
> > >  - inspect OpenGL state at any call while retracing;
> > >
> > >  - visualize and edit trace files.
> > >
> >
> > Thanks for contributing new recipe, they also need to go into
> > appropriate packagegroup in packagegroup-meta-oe.bb
> > so it can be built in testing images.
> >
> > > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > > ---
> > >  .../recipes-devtools/apitrace/apitrace_9.0.bb | 28 +++++++++++++++++++
> > >  1 file changed, 28 insertions(+)
> > >  create mode 100644 meta-oe/recipes-devtools/apitrace/apitrace_9.0.bb
> > >
> > > diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_9.0.bb b/meta-oe/recipes-devtools/apitrace/apitrace_9.0.bb
> > > new file mode 100644
> > > index 000000000000..6e61683cde92
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-devtools/apitrace/apitrace_9.0.bb
> > > @@ -0,0 +1,28 @@
> > > +SUMMARY = "Tools for tracing OpenGL, Direct3D, and other graphics APIs"
> > > +HOMEPAGE = "http://apitrace.github.io/"
> > > +SECTION = "console/tools"
> > > +LICENSE = "MIT & BSD-3-Clause"
> > > +LIC_FILES_CHKSUM = "file://LICENSE;md5=aeb969185a143c3c25130bc2c3ef9a50 \
> > > +                    file://thirdparty/snappy/COPYING;md5=f62f3080324a97b3159a7a7e61812d0c"
> > > +
> > > +SRCREV = "cae55f54c53449fd07f8a917dcd0874db2c15032"
> > > +SRC_URI = "git://github.com/${BPN}/${BPN}.git"
> > > +
> > > +S = "${WORKDIR}/git"
> > > +
> > > +DEPENDS += "zlib libpng python3-native"
> > > +
> > > +inherit cmake
> > > +
> > > +EXTRA_OECMAKE += "\
> > > +    -DENABLE_GUI=OFF \
> > > +    -DENABLE_X11=OFF \
> > > +    -DENABLE_STATIC_LIBGCC=OFF \
> > > +    -DENABLE_STATIC_LIBSTDCXX=OFF \
> > > +    -DPython3_ROOT_DIR=/usr/bin/python3-native \
> > > +"
> > > +
> > > +# Use the bundled snappy library
> > > +EXTRA_OECMAKE += "\
> > > +    -DENABLE_STATIC_SNAPPY=ON \
> > > +"
> > > --
> > > 2.20.1
> > >
> > > 
> 
