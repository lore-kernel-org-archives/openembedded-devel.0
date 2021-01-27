Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web09.15619.1611784472528875378
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 13:54:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
	(Authenticated sender: alexandre.belloni@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id EB1DEC0004;
	Wed, 27 Jan 2021 21:54:29 +0000 (UTC)
Date: Wed, 27 Jan 2021 22:54:29 +0100
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] meta-oe: fix native inheritance order in recipes
Message-ID: <20210127215429.GK1196852@piout.net>
References: <20210127211356.2341996-1-alexandre.belloni@bootlin.com>
 <CA+chaQfHk5R0yvPdH9xN7Uw95uzfTf-6Bjr_u1OSb7kuFyErBA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQfHk5R0yvPdH9xN7Uw95uzfTf-6Bjr_u1OSb7kuFyErBA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 27/01/2021 22:44:12+0100, Martin Jansa wrote:
> Thanks.
> 
> Khem already sent these changes in 2 separate patches which are already in
> master-next:
> https://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=58a4c525ac1359f91ba8e97a26eb693e6468a362
> https://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=6d5f8cc9d444e220d212dd23a497c82a2dfce1e2
> 

Right, I did prepare that one earlier today and just sent it now.

> On Wed, Jan 27, 2021 at 10:14 PM Alexandre Belloni <
> alexandre.belloni@bootlin.com> wrote:
> 
> > Classes native/nativesdk must be inherited last to prevent unexpected
> > behaviour.
> >
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > ---
> >  .../recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb | 2 +-
> >  meta-oe/recipes-support/dfu-util/dfu-util-native_0.10.bb        | 2 +-
> >  .../xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.10.bb         | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta-oe/recipes-devtools/autoconf-2.13/
> > autoconf-2.13-native_2.13.bb b/meta-oe/recipes-devtools/autoconf-2.13/
> > autoconf-2.13-native_2.13.bb
> > index a54a7331df2d..604135839a7b 100644
> > --- a/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb
> > +++ b/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb
> > @@ -19,7 +19,7 @@ S = "${WORKDIR}/${BPN}"
> >  SRC_URI[md5sum] = "9de56d4a161a723228220b0f425dc711"
> >  SRC_URI[sha256sum] =
> > "f0611136bee505811e9ca11ca7ac188ef5323a8e2ef19cffd3edb3cf08fd791e"
> >
> > -inherit native texinfo
> > +inherit texinfo native
> >
> >  DEPENDS += "m4-native gnu-config-native"
> >  RDEPENDS_${PN} = "m4-native gnu-config-native"
> > diff --git a/meta-oe/recipes-support/dfu-util/dfu-util-native_0.10.bb
> > b/meta-oe/recipes-support/dfu-util/dfu-util-native_0.10.bb
> > index 4305e3b4086e..4641b0181aef 100644
> > --- a/meta-oe/recipes-support/dfu-util/dfu-util-native_0.10.bb
> > +++ b/meta-oe/recipes-support/dfu-util/dfu-util-native_0.10.bb
> > @@ -1,6 +1,6 @@
> >  require dfu-util_${PV}.bb
> >
> > -inherit native deploy
> > +inherit deploy native
> >
> >  DEPENDS = "libusb1-native"
> >
> > diff --git a/meta-oe/recipes-support/xserver-xorg-cvt/
> > xserver-xorg-cvt-native_1.20.10.bb
> > b/meta-oe/recipes-support/xserver-xorg-cvt/
> > xserver-xorg-cvt-native_1.20.10.bb
> > index 170e0bf785e4..becf9914884e 100644
> > --- a/meta-oe/recipes-support/xserver-xorg-cvt/
> > xserver-xorg-cvt-native_1.20.10.bb
> > +++ b/meta-oe/recipes-support/xserver-xorg-cvt/
> > xserver-xorg-cvt-native_1.20.10.bb
> > @@ -14,7 +14,7 @@ SRC_URI[sha256sum] =
> > "977420c082450dc808de301ef56af4856d653eea71519a973c3490a780
> >  S = "${WORKDIR}/${XORG_PN}-${PV}"
> >  B = "${WORKDIR}/build"
> >
> > -inherit native pkgconfig
> > +inherit pkgconfig native
> >
> >  do_configure[noexec] = "1"
> >
> > --
> > 2.29.2
> >
> >
> > 
> >
> >

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
