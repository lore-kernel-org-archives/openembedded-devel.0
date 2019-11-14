Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5B52A7FA49
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 22:58:18 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id l1so7699696wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 14:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BxtpqNKPg0F8xiU3IB7QHm/7JBPQ8kEjGJ1MX+xP7Go=;
	b=q9tqfJtIqb/I/hocJwDrS3vf6oTz7W09L4yv01kt629hU8aJN+LpQ6JJ7r6GR9r5lq
	pHLEtdwK4iDVHZIgm4NkQ2W2uNYmWTSpzdB0HCxwWGofOOAwzbeVfI0eCOZY7CpuBHGb
	YrnaULklekXIemvmgcQeduxa8E7lhRoPNuwyyUFkPuQRe3sB+hQ6d3SiUgqQb4OCJJnB
	dBkqzS8pDzbkBJzvCcAv1017sk7pPmn2uL4dIj6u6olcwpATwuIyjmt6LrKyiTKT9Xxv
	xYekqiok/wkMfqT5F/w0Q7QzELifCDks5a+kKAGhPK+NrnS0592HSWAN/yOUeXDh+qd6
	K12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BxtpqNKPg0F8xiU3IB7QHm/7JBPQ8kEjGJ1MX+xP7Go=;
	b=mpBpKouZvi1Q5N/+J7e9Ru6ZFN1LMLdIBEIpgWJPXQYZ98yRKWQS8uEF4wYKMjcV1p
	RgG2IKGFCSdbtpSKVZKPzvIEF5ctIsquMD3HQrg8oyKRKMyZFC8g5+S8/fU7Rs0H/cba
	F9tCgMWVpdPhDZSba+/3SCFsUNuB5lqsVJQYXIX9wjLXoUGntGCHot5S3fl3Egyr5ZDb
	mAHtUVDMLh+Vr6rWprVkXy3gEey/scpI1ydCkFe8Ae7t5Ml8d5TaTKxuIzYCJzaUL+Tw
	HJaH8ZpssWOzfwMaLoEEi4i64WEgZHnjbrNOql76cmOFlbAKuU7NOLPMlCx+WSYzvIHC
	fIYg==
X-Gm-Message-State: APjAAAUrNx0HY3vS/FzY1HJWCN5/GrH3KpxPmHAwNrdvEZEoEdnwDSBO
	CfKNA5FLqrAK9sISFeLsr1qXSyR+pQYroYRPKCo=
X-Google-Smtp-Source: APXvYqwnA4c5ey2PYrLG8fJQoUiwzsjVU5QSx3cuuTOwCvxo3F97PIXbbZJobRoewxTYleyQMyyOwjbSpZZ8jxPLBeQ=
X-Received: by 2002:a7b:c307:: with SMTP id k7mr10174077wmj.134.1573772298820; 
	Thu, 14 Nov 2019 14:58:18 -0800 (PST)
MIME-Version: 1.0
References: <1573752010-26608-1-git-send-email-leon.anavi@konsulko.com>
	<CAMKF1spn6Oc24S3iJxTqYiZfhHeQarCh9s=e=JB=hyQrfVTaLA@mail.gmail.com>
In-Reply-To: <CAMKF1spn6Oc24S3iJxTqYiZfhHeQarCh9s=e=JB=hyQrfVTaLA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 14 Nov 2019 23:58:07 +0100
Message-ID: <CA+chaQdGX0a=SidUKDxj_pOmRv4+GVafxd5f56-qC30Tw37U5A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Thu, 14 Nov 2019 22:58:18 -0000
Content-Type: text/plain; charset="UTF-8"

REQUIRED_DISTRO_FEATURES = "x11"

doesn't do anything unless you inherit the distro_features_check.bbclass
which I don't see in the recipe.

On Thu, Nov 14, 2019 at 11:34 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Nov 14, 2019 at 10:04 AM Leon Anavi <leon.anavi@konsulko.com>
> wrote:
> >
> > Add a recipe for surf, a simple web browser based on WebKit2/GTK+.
> >
> > Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> > ---
> >  .../0001-config.mk-Fix-compiler-and-linker.patch   | 36
> ++++++++++++++++++++++
> >  meta-oe/recipes-graphics/surf/surf_2.0.bb          | 30
> ++++++++++++++++++
> >  2 files changed, 66 insertions(+)
> >  create mode 100644
> meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
> >  create mode 100644 meta-oe/recipes-graphics/surf/surf_2.0.bb
> >
> > diff --git
> a/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
> b/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
> > new file mode 100644
> > index 0000000..a3e33ea
> > --- /dev/null
> > +++
> b/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
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
> > + CPPFLAGS = -DVERSION=\"${VERSION}\" -DWEBEXTDIR=\"${LIBPREFIX}\"
> -D_DEFAULT_SOURCE
> > +@@ -28,4 +28,4 @@ LDFLAGS = -s ${LIBS}
> > + #LDFLAGS = ${LIBS}
> > +
> > + # compiler and linker
> > +-CC = cc
> > ++#CC = cc
> > +--
> > +2.7.4
> > +
> > diff --git a/meta-oe/recipes-graphics/surf/surf_2.0.bb
> b/meta-oe/recipes-graphics/surf/surf_2.0.bb
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
>
> seems to have sstate issues in do_install see
>
> http://jenkins.nas-admin.org/job/oe_world_workspace-compare-signatures/846/console
>
> perhaps due to ./meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
> being in depends and
> this recipe is pinned per MACHINE via PACKAGE_ARCH = "${MACHINE_ARCH}"
>
>
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
> > +       install -d ${D}${bindir}
> > +       install -m 0644 ${S}/surf ${D}${bindir}
> > +       chmod +x ${D}${bindir}/surf
> > +}
> > +
> > +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> > +INHIBIT_PACKAGE_STRIP = "1"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

