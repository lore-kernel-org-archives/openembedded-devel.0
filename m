Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f193.google.com (mail-lb0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 74DF86057B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2016 22:28:55 +0000 (UTC)
Received: by mail-lb0-f193.google.com with SMTP id mx9so2303860lbb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2016 15:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=XXgr199gpicLHUqNI/udDhthYQ1+7QP67rVwnZY3tiE=;
	b=ZRKUzjQnsiqW457Ad0uvu3f1I5DCk9Di8e1Ro9SDSfYIagTtfTxbr2opB0YjXsEiT5
	S5gr05t9HFphWpblNh6u3oInh7f89EjvFHs5OJpUHyroOElwK96e1CHZ8OeJ1Aqaqv14
	22pfmEMEI5xg4TaQXbanlwkKvfN8P88s2JTZQspyVAyHmDh/Ur3EqxUJh1vTWcRgoAkc
	+4rKkgtHdjrlJdKcxMJk96Mg6l+meQvETN4+zKzLjxKVy3kUMv7SJw48VqM3he0kUONc
	QxYS/Fnw2OpH9HwV3SBVKU9RnrixJiJg1GxzHULuaSJFmV+PbyeY5Yi2qRP+pzVhiSkN
	9i1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=XXgr199gpicLHUqNI/udDhthYQ1+7QP67rVwnZY3tiE=;
	b=ip75TUSJMl2HgogiP6IXSzSTZIJV8KBR1XBrWlSxQr/WvUdoC5XJWGgjC5cv6ZigmT
	/ee6v6mVB6YbYAzavA2rMx71gRFthp88QCcUg9fxThU8GKeURqYWKx3khehHu/tpuC/L
	TaDj7t/y2aZKCyswPmXgiItfditUgtA7chO3IislO1sWwfz2qZS7EjKnKcBaxVMjLZKe
	UY84B7kynmqA7dhfgDSBnw4Cvb+pw8MfmXCZcL6gjY+BQMKqyDDHBLD9sHIXEwqiz+Rc
	ohMYGt2FnG96ol/MANd4+CaByU21eI1lV3mGXuzy2wuIFEmuOCEZiyN2f7yTd2kYpltH
	7ETQ==
X-Gm-Message-State: AOPr4FW4yySU/mudC2q/Eat3Jiti5cAOj/1f/C82Da/uv4c/FGYJERtq/AMxcosQaUBI87CBqmVYw6BPUPclAQ==
MIME-Version: 1.0
X-Received: by 10.112.146.136 with SMTP id tc8mr5207037lbb.78.1463092135314;
	Thu, 12 May 2016 15:28:55 -0700 (PDT)
Received: by 10.112.18.12 with HTTP; Thu, 12 May 2016 15:28:55 -0700 (PDT)
In-Reply-To: <7DEAD0AF-B666-40C9-96C6-23D03A40A679@gmail.com>
References: <1463081158-10495-1-git-send-email-neenareddy.busireddy@nxp.com>
	<1463081158-10495-2-git-send-email-neenareddy.busireddy@nxp.com>
	<7DEAD0AF-B666-40C9-96C6-23D03A40A679@gmail.com>
Date: Fri, 13 May 2016 00:28:55 +0200
Message-ID: <CA+chaQe2qm1KrCbYrKJGW006osec=3gBn_J4=xm_0JBB96+b5g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH v2 2/2] freeglut: Add a recipe freeglut to replace mesa-glut
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 May 2016 22:28:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

why?

On Fri, May 13, 2016 at 12:10 AM, Khem Raj <raj.khem@gmail.com> wrote:

>
> > On May 12, 2016, at 12:25 PM, Neena Busireddy <
> neenareddy.busireddy@nxp.com> wrote:
> >
> > FreeGLUT is a free-software/open-source alternative to the OpenGL
> > Utility Toolkit (GLUT) library.
> > More information about this library can be found in
> > http://freeglut.sourceforge.net/
> >
> > Signed-off-by: Neena Busireddy <neenareddy.busireddy@nxp.com>
> > ---
> > meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb | 17
> +++++++++++++++++
> > 1 file changed, 17 insertions(+)
> > create mode 100644 meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb
> >
> > diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb
> b/meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb
> > new file mode 100644
> > index 0000000..a98b289
> > --- /dev/null
> > +++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb
> > @@ -0,0 +1,17 @@
> > +DESCRIPTION =3D "FreeGLUT is a free-software/open-source alternative t=
o
> the OpenGL \
> > +               Utility Toolkit (GLUT) library"
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D89c0b58a3e01ce3d8254c9f59e7=
8adfb"
> > +
> > +SRC_URI =3D "
> https://sourceforge.net/projects/${BPN}/files/${BPN}/${PV}/${BPN}-${PV}.t=
ar.gz
> "
> > +SRC_URI[md5sum] =3D "90c3ca4dd9d51cf32276bc5344ec9754"
> > +SRC_URI[sha256sum] =3D
> "2a43be8515b01ea82bcfa17d29ae0d40bd128342f0930cd1f375f1ff999f76a2"
> > +
> > +inherit cmake
> > +
> > +# depends on virtual/libx11
> > +REQUIRED_DISTRO_FEATURES =3D "x11"
> > +
> > +PROVIDES +=3D "mesa-glut"
> > +
> > +DEPENDS =3D "virtual/libx11 libxmu libxi virtual/libgl libglu libxrand=
r=E2=80=9D
>
> should this be +=3D
>
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

