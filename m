Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3F2737997D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 May 2019 11:45:59 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id l2so3016612wrb.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 May 2019 04:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=OF9lB9R0IiYEES4Q3zaOC1Wogy7Z5/lavsYFzfmfO94=;
	b=nN2hkvay2WEP6IFLIOgYo36cfBGSdwODg/7u9WrKLwaThwWBj4dUco+IDCgJ8twLsp
	gAlE7QWQ+K3onj1M270DUllA9wb6wHd/6Px4Zgb1/cXVihzX5vAle14riiN7CE00HJoY
	8FpmcfdWZKy6j704SQPC3dm9YhCj4rdGPqwr7Ncn4pBuB53nAHN/LX0VgKl2dfR2wQDS
	FF68lZSmDH0ZU/8OglRgf95JqrdHyUS8nKB6rtNudyeYlZRRqN58+bbrKug1kEh1l7K0
	CHBAPzUFJaKn753FXz/jqWUp9SgHXgxbNY60zE9uKb8hXe8/5ECcTb4N9B83wrXYDy/l
	UYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=OF9lB9R0IiYEES4Q3zaOC1Wogy7Z5/lavsYFzfmfO94=;
	b=em0ISi5mBNUDrPTotHX2ijh3gNblph8AHiu6OTuxXfoQpnhQb0sEgHrDiz55gmKMCT
	OMR0/V0S98o8u5bYcQdUg10K9Yut/XLtcskgr4rf5VK3DcuGqFiwvvb7wgZR0B25KSjS
	Kwu0QWT37WUQf9q2+qf4MEwQSzTyQe7dmp99Bgyi1gMGlKCtbC1aeVg88AeXQgj0WBZl
	dcEW6zyg2scsLQVjSOLhI/YxlaZolUEA3nvK7+Ggvhgaz0j+ch2b8SdqWJPuSuYZytFv
	dmdXuuN1BcEgicuMdkKFSAEZrjeK+3f8rrdEG2M4we8ja3Z51OEwljHBGiSPvpa8Po0k
	NIlA==
X-Gm-Message-State: APjAAAVxpI+k7lIDNFRU5vMEK/ws6VbFsWln3PgoyIs8smbjJmfpmnm1
	Zo+5P1Hl3EsHeyUBpIVei34=
X-Google-Smtp-Source: APXvYqwEj4j8ja7SVuHnG7frU/t3OcMgmT53ZeG4d1ZHzagO5WzxqRk/pohUgB9SxJu8gcgur0Yo4w==
X-Received: by 2002:adf:b645:: with SMTP id i5mr30844824wre.272.1558007159876; 
	Thu, 16 May 2019 04:45:59 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id b8sm4511011wrr.64.2019.05.16.04.45.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 May 2019 04:45:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 16 May 2019 13:46:00 +0200
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>
Message-ID: <20190516114600.GB1400@jama>
References: <20190516070624.27975-1-Martin.Jansa@gmail.com>
	<20190516072441.GA7938@localhost>
	<CALbNGRTv-YB-Gx4sLpF7+8g0B9U63qm=mpm4a43KZmnzsq+9wQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRTv-YB-Gx4sLpF7+8g0B9U63qm=mpm4a43KZmnzsq+9wQ@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [meta-oe][PATCH 1/3] gtkwave: add distro_features_check
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
X-List-Received-Date: Thu, 16 May 2019 11:45:59 -0000
X-Groupsio-MsgNum: 77577
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZfOjI3PrQbgiZnxM"
Content-Disposition: inline

--ZfOjI3PrQbgiZnxM
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2019 at 10:21:14AM +0200, Andreas M=FCller wrote:
> On Thu, May 16, 2019 at 9:25 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Thu, May 16, 2019 at 07:06:22AM +0000, Martin Jansa wrote:
> > > * fixes:
> > > ERROR: Nothing PROVIDES 'gtk+' (but /OE/build/luneos-warrior/webos-po=
rts/meta-openembedded/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb DE=
PENDS on or otherwise requires it)
> > > gtk+ was skipped: one of 'x11 directfb' needs to be in DISTRO_FEATURES
> > > ERROR: Required build target 'meta-world-pkgdata' has no buildable pr=
oviders.
> > > Missing or unbuildable dependency chain was: ['meta-world-pkgdata', '=
gtkwave', 'gtk+']
> > >
> > > and
> > >
> > > ERROR: Nothing PROVIDES 'tk' (but /OE/build/luneos-warrior/webos-port=
s/meta-openembedded/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb DEPE=
NDS on or otherwise requires it)
> > > tk was skipped: missing required distro feature 'x11' (not in DISTRO_=
FEATURES)
> > > ERROR: Required build target 'meta-world-pkgdata' has no buildable pr=
oviders.
> > > Missing or unbuildable dependency chain was: ['meta-world-pkgdata', '=
gtkwave', 'tk']
> > >
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb b/met=
a-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
> > > index 60df6f773b..b9aae0f6c8 100644
> > > --- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
> > > +++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
> > > @@ -14,6 +14,10 @@ inherit pkgconfig autotools gettext texinfo
> > >  DEPENDS =3D "tcl tk gperf-native bzip2 xz pango zlib gtk+ gdk-pixbuf=
 glib-2.0"
> > >  RDEPENDS_${PN} =3D "tk-lib"
> > >
> > > +# depends on gtk+ which has this restriction
> > > +inherit distro_features_check
> > > +ANY_OF_DISTRO_FEATURES =3D "${GTK2DISTROFEATURES}"
> > >...
> >
> > Shouldn't this be x11 (without the directfb alternative)
> > due to tk?
> >
> It is slightly off-top and maybe I missed something but from my
> opinion these type of patches are wrong - and we have many of them.
> The origin of the issue is gtk+ not gtkwave.

I think this was discussed (long time ago) when adding x11 to required
distro features to all recipes depending on libx11, but I haven't found
that thread with quick search.

You're right that the gtk+ restriction is the root cause of this, but
gtk+ already has the restriction correct defined (hence the "gtk+ was
skipped: one of 'x11 directfb' needs to be in DISTRO_FEATURES" error
message when parsing gtkwave).

The automatic propagation of such restriction to recipes which depend on
it sounds good, but it also makes sense to explicitly acknowledge that
there is such restriction caused by some dependency in the recipe.
That's why I'm at least putting a comment above REQUIRED_DISTRO_FEATURES
saying why I've added it in first place.

In most cases I just want to be able to do:
bitbake world without any errors shown for MACHINEs which I care about
or something like:
openembedded-core/scripts/sstate-diff-machines.sh --targets=3Dworld --tmpdi=
r=3Dtmp-glibc/ --analyze --machines=3D"hammerhead mako qemux86"
which works correctly only if it can parse the dependency tree of whole
world.

> Would it be a big issue if recipes inherit distro-feature-check
> settings from the recipes they depend on?
>=20
> I ask this because this is definitely a maintenance burden and such a
> mechanism would make life much easier.

Agreed, especially in cases where the problematic dependency is also
optional and the required distro features should be set with respect to
e.g. PACKAGECONFIG as well.

But me being used to a lot of burden I don't see this type of
patches to be so big deal.

Just compare:
https://github.com/openwebos/meta-webos/blob/master/conf/distro/include/web=
os-recipe-blacklist-world.inc
https://github.com/webosose/meta-webosose/blob/master/meta-webos/conf/distr=
o/include/webos-recipe-blacklist-world.inc
https://github.com/webOS-ports/meta-webos-ports/blob/master/meta-luneos/con=
f/distro/include/luneos-recipe-blacklist-world.inc

just having the distro-feature-check bbclass and the restriction in the
recipes (instead of PNBLACKLIST for all recipes incompatible with the
DISTRO_FEATURES we have) made my life so much easier (that I never got
around to cleanup some of these 6+ old entries which were already
resolved elsewhere since then).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZfOjI3PrQbgiZnxM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXN1NdwAKCRA3VSO3ZXaA
HMf+AKCze90qTE85MPHO4WFJNIhLJP7vuACeItk3j8x714aRoKOlc4/32FpQmPM=
=KwRH
-----END PGP SIGNATURE-----

--ZfOjI3PrQbgiZnxM--
