Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4E577745BF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 17:30:44 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id z4so6985602pfn.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 09:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:user-agent:mime-version:content-transfer-encoding;
	bh=H6aSnAUlDWSx4p41NPE+FP6K4KQjxz30RwSiZ9CFlm0=;
	b=TZ37BKo3s5kgBw35NPY+HlbWrStAJEL5jGZ3fMFzlvifJMZt7fxsRonXWs1i56XXKo
	VkugKi9FaRtf04kvz5ahazK2/F2YWL5W4LLErjpc2Taaa/RKSPO6nNwuyEZ7Ni9TCglv
	fT82qc/B5uNn3bE1UXFQTvYW61u+kTIGadXnAvwMFl5uPlBA/4Uefk/4KrYgf9S8P6n6
	rp/FdxdKAgIEpMMyezD8gVmouFYf01UkorfvEpJFFDv1lT2ZSxmFrQt/x8/HCEYsmFKN
	TX1NZSloxC45zFqMiJm7JiTOyFcVtGFLLM+bsi4khItHjEstfD4gr32M/xrgSH1crUhs
	GdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=H6aSnAUlDWSx4p41NPE+FP6K4KQjxz30RwSiZ9CFlm0=;
	b=QNF8Ikp8EdDQ1HWrm696mueweJMjdI4BZLLUuQgrMt4leHUPC8u/hNFI/NQtgQ8kWh
	vJMTnEgc9Nv3iR0uLQ6OS1NAtrkqVXlllk5fizCqTz7MuTBllVfpFLXS0HtWxzGB8CCE
	d47QJJ+IXxnj4V2a1pKZEEXErkcSq9n7M/yETMB6+XZFVWdnzCJsr+dS7nZyQBw1D0va
	RwWQPatS6GEFeCBr5VtPI42gHFanUxanc5sDjxAg9PfAlz67TYBMjpa3tzKHHbnRheJl
	Xaix0r2TbP0NDNI1vlEzlFrwD6l2Du3f9VxWfvA18TbAErC05AQr4kf7nHZ92vXAu36A
	0ZQA==
X-Gm-Message-State: APjAAAVJeN8dlBzmSzgwE5KbU5uT1EJRaKo+M0Sdhyp5GOSqsMvM/cs1
	vXz4GMCMON/0zV4rCyJYNMLsXE8ke/M=
X-Google-Smtp-Source: APXvYqzPQmPCqC7qkfRc0EM6qRqxbfL576pk781mm1S0FcP63GnMmHgMznuk/jsgzz90R9Wi7Rhw+g==
X-Received: by 2002:a62:fb02:: with SMTP id x2mr11699692pfm.254.1573839043927; 
	Fri, 15 Nov 2019 09:30:43 -0800 (PST)
Received: from apollo ([2601:646:8500:1c20::30e8])
	by smtp.gmail.com with ESMTPSA id j7sm9824725pjz.12.2019.11.15.09.30.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 15 Nov 2019 09:30:43 -0800 (PST)
Message-ID: <30fccbf16335d228013fb5d59b0ae1cc18c25a38.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Carlos Rafael Giani <crg7475@mailbox.org>, 
	openembedded-devel@lists.openembedded.org
Date: Fri, 15 Nov 2019 09:30:38 -0800
In-Reply-To: <2feeb01f-2110-e266-3bdb-635c38577c39@mailbox.org>
References: <1573752010-26608-1-git-send-email-leon.anavi@konsulko.com>
	<dbae500e-b459-005e-ec2b-5d4f5ef66f18@gmail.com>
	<2feeb01f-2110-e266-3bdb-635c38577c39@mailbox.org>
Organization: HIMVIS LLC
User-Agent: Evolution 3.34.1 
MIME-Version: 1.0
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
X-List-Received-Date: Fri, 15 Nov 2019 17:30:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-11-15 at 16:09 +0100, Carlos Rafael Giani wrote:
> meta-browser would be more appropriate.

I was contemplating that as well. but these layer has more chromium and
firefox lineage
> 
> On 14.11.19 19:52, akuster808 wrote:
> > On 11/14/19 9:20 AM, Leon Anavi wrote:
> > > Add a recipe for surf, a simple web browser based on
> > > WebKit2/GTK+.
> > shouldn't this go into the meta-webserver layer ?
> > > Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> > > ---
> > >   .../0001-config.mk-Fix-compiler-and-linker.patch   | 36
> > > ++++++++++++++++++++++
> > >   meta-oe/recipes-graphics/surf/surf_2.0.bb          | 30
> > > ++++++++++++++++++
> > >   2 files changed, 66 insertions(+)
> > >   create mode 100644 meta-oe/recipes-graphics/surf/surf/0001-
> > > config.mk-Fix-compiler-and-linker.patch
> > >   create mode 100644 meta-oe/recipes-graphics/surf/surf_2.0.bb
> > > 
> > > diff --git a/meta-oe/recipes-graphics/surf/surf/0001-config.mk-
> > > Fix-compiler-and-linker.patch b/meta-oe/recipes-
> > > graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
> > > new file mode 100644
> > > index 0000000..a3e33ea
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-
> > > compiler-and-linker.patch
> > > @@ -0,0 +1,36 @@
> > > +From df199f82752398f86d2332dce53f52e2cfb50c87 Mon Sep 17
> > > 00:00:00 2001
> > > +From: Leon Anavi <leon.anavi@konsulko.com>
> > > +Date: Thu, 14 Nov 2019 14:28:39 +0000
> > > +Subject: [PATCH] config.mk: Fix compiler and linker
> > > +
> > > +Do not set explicitly compiler and linker.
> > > +
> > > +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> > > +---
> > > + config.mk | 6 +++---
> > > + 1 file changed, 3 insertions(+), 3 deletions(-)
> > > +
> > > +diff --git a/config.mk b/config.mk
> > > +index df6e812..bf07406 100644
> > > +--- a/config.mk
> > > ++++ b/config.mk
> > > +@@ -15,8 +15,8 @@ GTKINC = `pkg-config --cflags gtk+-3.0
> > > webkit2gtk-4.0`
> > > + GTKLIB = `pkg-config --libs gtk+-3.0 webkit2gtk-4.0`
> > > +
> > > + # includes and libs
> > > +-INCS = -I. -I/usr/include -I${X11INC} ${GTKINC}
> > > +-LIBS = -L/usr/lib -lc -L${X11LIB} -lX11 ${GTKLIB} -lgthread-2.0
> > > ++INCS = ${GTKINC}
> > > ++LIBS = -lc -lX11 ${GTKLIB} -lgthread-2.0
> > > +
> > > + # flags
> > > + CPPFLAGS = -DVERSION=\"${VERSION}\"
> > > -DWEBEXTDIR=\"${LIBPREFIX}\" -D_DEFAULT_SOURCE
> > > +@@ -28,4 +28,4 @@ LDFLAGS = -s ${LIBS}
> > > + #LDFLAGS = ${LIBS}
> > > +
> > > + # compiler and linker
> > > +-CC = cc
> > > ++#CC = cc
> > > +--
> > > +2.7.4
> > > +
> > > diff --git a/meta-oe/recipes-graphics/surf/surf_2.0.bb b/meta-
> > > oe/recipes-graphics/surf/surf_2.0.bb
> > > new file mode 100644
> > > index 0000000..98d3b23
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-graphics/surf/surf_2.0.bb
> > > @@ -0,0 +1,30 @@
> > > +SUMMARY = "Simple web browser"
> > > +DESCRIPTION = "Simple open source web browser based on
> > > WebKit2/GTK"
> > > +HOMEPAGE = "https://surf.suckless.org/"
> > > +SECTION = "x11/graphics"
> > > +LICENSE = "MIT"
> > > +LIC_FILES_CHKSUM =
> > > "file://LICENSE;md5=b57e7f7720307a02d5a6598b00fe3afa"
> > > +
> > > +DEPENDS = "webkitgtk gtk+ gtk+3 glib-2.0 xserver-nodm-init"
> > > +
> > > +REQUIRED_DISTRO_FEATURES = "x11"
> > > +
> > > +SRC_URI = "git://git.suckless.org/surf;branch=surf-webkit2 \
> > > +           file://0001-config.mk-Fix-compiler-and-linker.patch \
> > > +"
> > > +SRCREV = "b814567e2bf8bda07cea8de1c7a062f4aa437b65"
> > > +
> > > +S = "${WORKDIR}/git"
> > > +
> > > +inherit pkgconfig
> > > +
> > > +TARGET_CC_ARCH += "${LDFLAGS}"
> > > +
> > > +do_install () {
> > > +	install -d ${D}${bindir}
> > > +	install -m 0644 ${S}/surf ${D}${bindir}
> > > +	chmod +x ${D}${bindir}/surf
> > > +}
> > > +
> > > +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> > > +INHIBIT_PACKAGE_STRIP = "1"


