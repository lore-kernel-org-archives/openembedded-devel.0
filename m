Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6A12B7F976
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 19:10:53 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id m125so5977318qkd.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 11:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Gj/z3wIfz3kgv9c8MDfMZakrDOrnmZLfskU2F4g4RfE=;
	b=lMsekBx3TtEnFTUY10HKXYjwHbe6r3o1VHNOyf5slu1HeCHn3Js2Uvj/DXMzvEqwFM
	5mhb8umw76I+66BuG0EgwC98nWFvfdgCJFADWRqgLPUXtp8vPxMdmAuq6y77SEZFu5pM
	7qUqBB8lfOpx3Tx19PhK+05Nezeluwj93H2o7peo/KgqGLaD+wjH3awh6qkUlArR35sL
	WWjYGd9TFROlYlmMiuFhtWVXYGQI8ZdbZZZW5r1I+TN+1g3xU67NygiDcFPGByvlrDas
	7Pz7MrJTKNwNMu1rBU4kp6JdyUxXEUsNYFAVIlF9fKmUJl8O/mcrZHlc0Bi3ZR3sXLFT
	qNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Gj/z3wIfz3kgv9c8MDfMZakrDOrnmZLfskU2F4g4RfE=;
	b=K3vmgVSdwYJQPxJTOipiuDskS/I3R/Qs7xwBt9nAlZ/QCvR/QBFJXX9MhtqriiOE9m
	Q3gAKacOKWdKvKjJlUYlek7UDp6vkWOHAKTrl7b0yeOMNDSS1bL+iesf85yDrBzIPC9N
	5xMF5BzEM+qzNx6KHgl8Pv+BphRWF/3Sf50CqPbmwxCHObj6CT1r3eDHkI2IQcH85hQE
	4NWRyg9wo6LM0KMs1Rq5g7gQLytb0ZEzv41fZxW+DV8JbnS2HKmPkYqx3zPHG+D7EnHc
	4xm+p/StSmVwS32SBN4XfIa8qON56A8A3JfTwEUQyf1/8THA6Ej2wTiSlKsafE8JKxs1
	ETcA==
X-Gm-Message-State: APjAAAUbXC9mEUTqrugRpIL8ah7ThPba2nJ1SILyitSo97GQxeUNtfO2
	Lygt/zecFCt0oTJywDbC2HaQ47qQfwQn65wTIPY=
X-Google-Smtp-Source: APXvYqzDEAiAZPkiJ9vD3/35J1hypmXfROvUnzYbTEmmAbMM+MflPGXGozy7PcVQcgyl84Tess4NR3+BDlafgQaaKyw=
X-Received: by 2002:a37:a2c3:: with SMTP id l186mr9009451qke.337.1573758653940;
	Thu, 14 Nov 2019 11:10:53 -0800 (PST)
MIME-Version: 1.0
References: <1573752010-26608-1-git-send-email-leon.anavi@konsulko.com>
	<dbae500e-b459-005e-ec2b-5d4f5ef66f18@gmail.com>
In-Reply-To: <dbae500e-b459-005e-ec2b-5d4f5ef66f18@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Nov 2019 11:10:27 -0800
Message-ID: <CAMKF1sqtcxZjwRk+Zuqgf0UqiDm98NmCjaZbSsSNT0Y=eZY4BA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] surf: Add simple web browser
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
X-List-Received-Date: Thu, 14 Nov 2019 19:10:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 14, 2019 at 10:53 AM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 11/14/19 9:20 AM, Leon Anavi wrote:
> > Add a recipe for surf, a simple web browser based on WebKit2/GTK+.
>
> shouldn't this go into the meta-webserver layer ?

perhaps but its the browser

> >
> > Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> > ---
> >  .../0001-config.mk-Fix-compiler-and-linker.patch   | 36 ++++++++++++++++++++++
> >  meta-oe/recipes-graphics/surf/surf_2.0.bb          | 30 ++++++++++++++++++
> >  2 files changed, 66 insertions(+)
> >  create mode 100644 meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
> >  create mode 100644 meta-oe/recipes-graphics/surf/surf_2.0.bb
> >
> > diff --git a/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch b/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
> > new file mode 100644
> > index 0000000..a3e33ea
> > --- /dev/null
> > +++ b/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
> > @@ -0,0 +1,36 @@
> > +From df199f82752398f86d2332dce53f52e2cfb50c87 Mon Sep 17 00:00:00 2001
> > +From: Leon Anavi <leon.anavi@konsulko.com>
> > +Date: Thu, 14 Nov 2019 14:28:39 +0000
> > +Subject: [PATCH] config.mk: Fix compiler and linker
> > +
> > +Do not set explicitly compiler and linker.
> > +
> > +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> > +---
> > + config.mk | 6 +++---
> > + 1 file changed, 3 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/config.mk b/config.mk
> > +index df6e812..bf07406 100644
> > +--- a/config.mk
> > ++++ b/config.mk
> > +@@ -15,8 +15,8 @@ GTKINC = `pkg-config --cflags gtk+-3.0 webkit2gtk-4.0`
> > + GTKLIB = `pkg-config --libs gtk+-3.0 webkit2gtk-4.0`
> > +
> > + # includes and libs
> > +-INCS = -I. -I/usr/include -I${X11INC} ${GTKINC}
> > +-LIBS = -L/usr/lib -lc -L${X11LIB} -lX11 ${GTKLIB} -lgthread-2.0
> > ++INCS = ${GTKINC}
> > ++LIBS = -lc -lX11 ${GTKLIB} -lgthread-2.0
> > +
> > + # flags
> > + CPPFLAGS = -DVERSION=\"${VERSION}\" -DWEBEXTDIR=\"${LIBPREFIX}\" -D_DEFAULT_SOURCE
> > +@@ -28,4 +28,4 @@ LDFLAGS = -s ${LIBS}
> > + #LDFLAGS = ${LIBS}
> > +
> > + # compiler and linker
> > +-CC = cc
> > ++#CC = cc
> > +--
> > +2.7.4
> > +
> > diff --git a/meta-oe/recipes-graphics/surf/surf_2.0.bb b/meta-oe/recipes-graphics/surf/surf_2.0.bb
> > new file mode 100644
> > index 0000000..98d3b23
> > --- /dev/null
> > +++ b/meta-oe/recipes-graphics/surf/surf_2.0.bb
> > @@ -0,0 +1,30 @@
> > +SUMMARY = "Simple web browser"
> > +DESCRIPTION = "Simple open source web browser based on WebKit2/GTK"
> > +HOMEPAGE = "https://surf.suckless.org/"
> > +SECTION = "x11/graphics"
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=b57e7f7720307a02d5a6598b00fe3afa"
> > +
> > +DEPENDS = "webkitgtk gtk+ gtk+3 glib-2.0 xserver-nodm-init"
> > +
> > +REQUIRED_DISTRO_FEATURES = "x11"
> > +
> > +SRC_URI = "git://git.suckless.org/surf;branch=surf-webkit2 \
> > +           file://0001-config.mk-Fix-compiler-and-linker.patch \
> > +"
> > +SRCREV = "b814567e2bf8bda07cea8de1c7a062f4aa437b65"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit pkgconfig
> > +
> > +TARGET_CC_ARCH += "${LDFLAGS}"
> > +
> > +do_install () {
> > +     install -d ${D}${bindir}
> > +     install -m 0644 ${S}/surf ${D}${bindir}
> > +     chmod +x ${D}${bindir}/surf
> > +}
> > +
> > +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> > +INHIBIT_PACKAGE_STRIP = "1"
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

