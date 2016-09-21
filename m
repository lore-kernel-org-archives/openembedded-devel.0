Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4A136606CB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2016 14:34:09 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l132so8914770wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2016 07:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=+NmcPZc1lhCLh1mbb52N/sRKC0zYKeFnj4VxKySSBoA=;
	b=idJGXOlY6SPLucVq3XMMlbyFM0pwRmQ+LgRrS0fH7Dw3bkeVgdU3ATJlFKsK9Ja6oB
	G0bQR57LMiwVuj4s5gvdl9I80ro790dVx/jFDks1TcesV0sR7S3JSQz988ruilIwZWbm
	dLApwVEYIKsol5cFEMHcIgaEWmiLQhdCjIz6D/xhaNH7EFpwKYcuOitlyHHv7hEcktGJ
	0AjFNBwA7NTKdp+U4PYYJOHMxV1gI9RoCq3LC9IJIDhtK59q7kwuOEMJv2ZKuH4i3M3+
	noE4GLZmnSE8bKKH4OBSGgnM6uL+/ENBOSK4G+SoKaEdHA22eS2sAvtEVMpTP0ljY5uS
	yCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=+NmcPZc1lhCLh1mbb52N/sRKC0zYKeFnj4VxKySSBoA=;
	b=Xo2Z197nQgL/KyK2bdWET5dTmjXWpAjIsCbRXpTOCscWoUVYwbVB9LbBBoGL1eerE/
	3vMj8NhbrfI7AGOv62IWR78CuHfpkaIvS4F+VSyRyE15SWF/5Y4ceEmeEikKzRqdfiSv
	7JR1kcucMPEnQoSwm+qLQB2kCEygXicU9ecX0TCuM1cTsbLt132WKt4qEDU4E9Q3KdnJ
	gRCZ7aFV6zXrzXPnN2kkZrJq6axGxrwYG7Ank6UQRG0B+rA4A12VuWi5o4d2WsoMvJFq
	hFUXMS9BgYhYE6WBHG9THbbxN8Q8fY0UKYKEQwLJrbgTIHDZXulmLtHLLf+0xbwPvp55
	pY7w==
X-Gm-Message-State: AE9vXwMevkvy9PDtaCui3aOOnBvEUCcre3f6xP7a/lbHCYED/KpDg1Ud4OaLANWSNVvhkQ==
X-Received: by 10.28.55.21 with SMTP id e21mr3329798wma.80.1474468449986;
	Wed, 21 Sep 2016 07:34:09 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	r8sm33907616wjs.22.2016.09.21.07.34.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 21 Sep 2016 07:34:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 21 Sep 2016 16:34:08 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160921143408.GA2633@jama>
References: <1472730043-31245-1-git-send-email-maxin.john@intel.com>
	<1472730043-31245-5-git-send-email-maxin.john@intel.com>
	<12285709.EfYBoYq9CT@peggleto-mobl.ger.corp.intel.com>
	<1649463.EYVuLskMBZ@peggleto-mobl.ger.corp.intel.com>
	<CAMKF1spx33KNPnP4eWJ+cvNtp9zF-c7v5tyA0FV46-nopQwNDA@mail.gmail.com>
	<CANwerB3Jk9VxiypnEQZp252MRVuDOZJ3e1DRb7EE7wVOodCujA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANwerB3Jk9VxiypnEQZp252MRVuDOZJ3e1DRb7EE7wVOodCujA@mail.gmail.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
Subject: Re: [PATCH 4/4] tslib: move recipe from oe-core
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
X-List-Received-Date: Wed, 21 Sep 2016 14:34:10 -0000
X-Groupsio-MsgNum: 63235
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline

--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 21, 2016 at 02:36:58PM +1000, Jonathan Liu wrote:
> On 21 September 2016 at 12:37, Khem Raj <raj.khem@gmail.com> wrote:
> > On Thu, Sep 15, 2016 at 3:19 PM, Paul Eggleton
> > <paul.eggleton@linux.intel.com> wrote:
> >> On Fri, 16 Sep 2016 10:17:11 Paul Eggleton wrote:
> >>> On Thu, 01 Sep 2016 14:40:43 Maxin B. John wrote:
> >>> > Move tslib recipe from oe-core layer.
> >>> >
> >>> > Signed-off-by: Maxin B. John <maxin.john@intel.com>
> >>> > ---
> >>> >
> >>> >  meta-gpe/recipes-graphics/tslib/tslib/ts.conf  | 25 ++++++++++++
> >>> >  meta-gpe/recipes-graphics/tslib/tslib/tslib.sh |  8 ++++
> >>> >  meta-gpe/recipes-graphics/tslib/tslib_1.1.bb   | 53
> >>> >
> >>> > ++++++++++++++++++++++++++ 3 files changed, 86 insertions(+)
> >>> >
> >>> >  create mode 100644 meta-gpe/recipes-graphics/tslib/tslib/ts.conf
> >>> >  create mode 100644 meta-gpe/recipes-graphics/tslib/tslib/tslib.sh
> >>> >  create mode 100644 meta-gpe/recipes-graphics/tslib/tslib_1.1.bb
> >>> >
> >>> > diff --git a/meta-gpe/recipes-graphics/tslib/tslib/ts.conf
> >>> > b/meta-gpe/recipes-graphics/tslib/tslib/ts.conf new file mode 100644
> >>> > index 0000000..1b0da93
> >>> > --- /dev/null
> >>> > +++ b/meta-gpe/recipes-graphics/tslib/tslib/ts.conf
> >>> > @@ -0,0 +1,25 @@
> >>> > +# Uncomment if you wish to use the linux input layer event interfa=
ce
> >>> > +module_raw input
> >>> > +
> >>> > +# Uncomment if you're using a Sharp Zaurus SL-5500/SL-5000d
> >>> > +# module_raw collie
> >>> > +
> >>> > +# Uncomment if you're using a Sharp Zaurus SL-C700/C750/C760/C860
> >>> > +# module_raw corgi
> >>> > +
> >>> > +# Uncomment if you're using a device with a UCB1200/1300/1400 TS
> >>> > interface
> >>> > +# module_raw ucb1x00
> >>> > +
> >>> > +# Uncomment if you're using an HP iPaq h3600 or similar
> >>> > +# module_raw h3600
> >>> > +
> >>> > +# Uncomment if you're using a Hitachi Webpad
> >>> > +# module_raw mk712
> >>> > +
> >>> > +# Uncomment if you're using an IBM Arctic II
> >>> > +# module_raw arctic2
> >>> > +
> >>> > +module pthres pmin=3D1
> >>> > +module variance delta=3D30
> >>> > +module dejitter delta=3D100
> >>> > +module linear
> >>> > diff --git a/meta-gpe/recipes-graphics/tslib/tslib/tslib.sh
> >>> > b/meta-gpe/recipes-graphics/tslib/tslib/tslib.sh new file mode 1006=
44
> >>> > index 0000000..7068e8d
> >>> > --- /dev/null
> >>> > +++ b/meta-gpe/recipes-graphics/tslib/tslib/tslib.sh
> >>> > @@ -0,0 +1,8 @@
> >>> > +#!/bin/sh
> >>> > +
> >>> > +if [ -e /dev/input/touchscreen0 ]; then
> >>> > +    TSLIB_TSDEVICE=3D/dev/input/touchscreen0
> >>> > +
> >>> > +    export TSLIB_TSDEVICE
> >>> > +fi
> >>> > +
> >>> > diff --git a/meta-gpe/recipes-graphics/tslib/tslib_1.1.bb
> >>> > b/meta-gpe/recipes-graphics/tslib/tslib_1.1.bb new file mode 100644
> >>> > index 0000000..b0264c3
> >>> > --- /dev/null
> >>> > +++ b/meta-gpe/recipes-graphics/tslib/tslib_1.1.bb
> >>> > @@ -0,0 +1,53 @@
> >>> > +SUMMARY =3D "An abstraction layer for touchscreen panel events"
> >>> > +DESCRIPTION =3D "Tslib is an abstraction layer for touchscreen pan=
el \
> >>> > +events, as well as a filter stack for the manipulation of those ev=
ents. \
> >>> > +Tslib is generally used on embedded devices to provide a common us=
er \
> >>> > +space interface to touchscreen functionality."
> >>> > +HOMEPAGE =3D "http://tslib.berlios.de/"
> >>> > +
> >>> > +AUTHOR =3D "Russell King w/ plugins by Chris Larson et. al."
> >>> > +SECTION =3D "base"
> >>> > +LICENSE =3D "LGPLv2"
> >>> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df30a9716ef3762e3467a2f6=
2bf790f0a"
> >>> > +
> >>> > +SRC_URI =3D
> >>> > "https://github.com/kergoth/tslib/releases/download/${PV}/tslib-${P=
V}.tar.
> >>> > x
> >>> > z;downloadfilename=3Dtslib-${PV}.tar.xz \ +           file://ts.con=
f \
> >>> > +           file://tslib.sh \
> >>> > +"
> >>> > +
> >>> > +SRC_URI[md5sum] =3D "14771f8607b341bb4b297819d37e837d"
> >>> > +SRC_URI[sha256sum] =3D
> >>> > "fe35e5f710ea933b118f710e2ce4403ac076fe69926b570333867d4de082a51c" +
> >>> > +UPSTREAM_CHECK_URI =3D "https://github.com/kergoth/tslib/releases"
> >>> > +
> >>> > +inherit autotools pkgconfig
> >>> > +
> >>> > +EXTRA_OECONF =3D "--enable-shared --disable-h3600 --enable-input
> >>> > --disable-corgi --disable-collie --disable-mk712 --disable-arctic2
> >>> > --disable-ucb1x00" +
> >>> > +do_install_prepend() {
> >>> > +   install -m 0644 ${WORKDIR}/ts.conf ${S}/etc/ts.conf
> >>> > +}
> >>> > +
> >>> > +do_install_append() {
> >>> > +   install -d ${D}${sysconfdir}/profile.d/
> >>> > +   install -m 0755 ${WORKDIR}/tslib.sh ${D}${sysconfdir}/profile.d/
> >>> > +}
> >>> > +
> >>> > +# People should consider using udev's /dev/input/touchscreen0 syml=
ink
> >>> > +# instead of detect-stylus
> >>> > +#RDEPENDS_tslib-conf_weird-machine =3D "detect-stylus"
> >>> > +RPROVIDES_tslib-conf =3D "libts-0.0-conf"
> >>> > +
> >>> > +PACKAGES =3D+ "tslib-conf tslib-tests tslib-calibrate"
> >>> > +DEBIAN_NOAUTONAME_tslib-conf =3D "1"
> >>> > +DEBIAN_NOAUTONAME_tslib-tests =3D "1"
> >>> > +DEBIAN_NOAUTONAME_tslib-calibrate =3D "1"
> >>> > +
> >>> > +RDEPENDS_${PN} =3D "tslib-conf"
> >>> > +RRECOMMENDS_${PN} =3D "pointercal"
> >>> > +
> >>> > +FILES_${PN}-dev +=3D "${libdir}/ts/*.la"
> >>> > +FILES_tslib-conf =3D "${sysconfdir}/ts.conf
> >>> > ${sysconfdir}/profile.d/tslib.sh
> >>> > ${datadir}/tslib" +FILES_${PN} =3D "${libdir}/*.so.* ${libdir}/ts/*=
=2Eso*"
> >>> > +FILES_tslib-calibrate +=3D "${bindir}/ts_calibrate"
> >>> > +FILES_tslib-tests =3D "${bindir}/ts_harvest ${bindir}/ts_print
> >>> > ${bindir}/ts_print_raw ${bindir}/ts_test"
> >>>
> >>> So it seems like this has been blocked purely based on indentation th=
at
> >>> arguably doesn't even really matter, and as a result we no longer hav=
e tslib
> >>> anywhere. Can you guys please resolve this ASAP?
> >>
> >> Also, is meta-gpe really an appropriate place for this?
> >
> > It should go into meta-oe
> >
>=20
> +1
> I think so too.

Yes it should as there are recipes depending on it in meta-oe and
meta-efl which don't (can't) depend on meta-gpe:

meta-efl/recipes-efl/efl/efl.inc:DEPENDS =3D "virtual/libiconv tslib curl g=
lib-2.0 gnutls pkgconfig zlib jpeg openssl libsndfile1 dbus libexif librsvg=
 freetype libpng tiff libxext virtual/libx11 libxdamage libxrender fontconf=
ig libfribidi giflib udev libxcursor libxcomposite libxinerama libxrandr li=
bxtst libxscrnsaver efl-native util-linux libunwind"
meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb:DEPENDS +=3D=
 "tslib"

>=20
> >>
> >> Cheers,
> >> Paul
> >>
> >> --
> >>
> >> Paul Eggleton
> >> Intel Open Source Technology Centre
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfimlkACgkQN1Ujt2V2gByGSgCeNVMUpEPoYzygNOC6xw4T58SY
s0YAmwe9hkZMvdxLNfGEH+gFssQ5lpBk
=C8HB
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
