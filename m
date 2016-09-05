Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2AE29772E3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Sep 2016 11:39:02 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id a6so1652932wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Sep 2016 04:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=kebbJ/DhaEXiIB4YQCrW27XfmOFVF+lH66ifsheo3R0=;
	b=gGeNjdFCz2WAjAOwYCFGPKSfToewC/I1ULDpEvlNMM4CcLRrNEBUq+O39p2q/Yvs4N
	OmtxtnTuweVMQITG6YzbbKk0ulG1URJ8GZOk1lGkRCppVGk09eJZH7qcS6WYkRTO8jdf
	5W/Fms4gOtMzpNmoce9kDpun7svCVLID6qrMukeMoGchRJf2UItCX14oocgHM2FzFjzn
	v32pWQsbO9s8n7CvOJX3HVLbr/FMgmhlqSRZziJhVmlJP0xdYuZzwBPNH0jtbEKgSnqB
	SHxU5LlL1yMzfjmeTOGONvXmuTfPE88YTB9iIDpyiwD38hfGsiKuz/bttfwYQKy7hzF4
	JRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=kebbJ/DhaEXiIB4YQCrW27XfmOFVF+lH66ifsheo3R0=;
	b=IK9ZU1nqSYJjKxU+NdTpO2e2BCG/6H9A3kH1tOKUMldseUulJT0OAkY3v0FijZPoP5
	3O9U+gWpzV3FsLFijbSKFgCqZleGxOxwGs3RgSERBkCSHAJ10ZSgFoZYGkXmWZ2uwq/C
	5Cpp8bYSEqr49t6uwYYT5Twk7935z0O1JIWtq1K4lRtTge1hsMobhELP6s0NJxmQb4SC
	OB22+ZVOgbc1jlkI+5Jn3133sRX7Od7hxHFq1XAY5hu50YYi/FckJebYnBvAx0QrhbIv
	o6/LReOwSg2cIoT8frDNmh/3elJ0N093JV2N0PT/TVW6VLuE1uoFOvWDHFpsnqmBBnyU
	EP7Q==
X-Gm-Message-State: AE9vXwOKdUJC+xd+7dWVUp4wXy85+GrgENUV9euCvPpclgyi5xTALY3WdUiQZ2R/JlXYlg==
X-Received: by 10.194.2.47 with SMTP id 15mr34334317wjr.133.1473075542842;
	Mon, 05 Sep 2016 04:39:02 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	m133sm10858784wmg.0.2016.09.05.04.39.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 05 Sep 2016 04:39:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 5 Sep 2016 13:39:02 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160905113902.rmt4ey74mtp5pjhh@jama>
References: <1472730043-31245-1-git-send-email-maxin.john@intel.com>
	<1472730043-31245-5-git-send-email-maxin.john@intel.com>
MIME-Version: 1.0
In-Reply-To: <1472730043-31245-5-git-send-email-maxin.john@intel.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
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
X-List-Received-Date: Mon, 05 Sep 2016 11:39:03 -0000
X-Groupsio-MsgNum: 62968
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zvk22e3zuplqxifp"
Content-Disposition: inline

--zvk22e3zuplqxifp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 01, 2016 at 02:40:43PM +0300, Maxin B. John wrote:
> Move tslib recipe from oe-core layer.
>=20
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  meta-gpe/recipes-graphics/tslib/tslib/ts.conf  | 25 ++++++++++++
>  meta-gpe/recipes-graphics/tslib/tslib/tslib.sh |  8 ++++
>  meta-gpe/recipes-graphics/tslib/tslib_1.1.bb   | 53 ++++++++++++++++++++=
++++++
>  3 files changed, 86 insertions(+)
>  create mode 100644 meta-gpe/recipes-graphics/tslib/tslib/ts.conf
>  create mode 100644 meta-gpe/recipes-graphics/tslib/tslib/tslib.sh
>  create mode 100644 meta-gpe/recipes-graphics/tslib/tslib_1.1.bb
>=20
> diff --git a/meta-gpe/recipes-graphics/tslib/tslib/ts.conf b/meta-gpe/rec=
ipes-graphics/tslib/tslib/ts.conf
> new file mode 100644
> index 0000000..1b0da93
> --- /dev/null
> +++ b/meta-gpe/recipes-graphics/tslib/tslib/ts.conf
> @@ -0,0 +1,25 @@
> +# Uncomment if you wish to use the linux input layer event interface
> +module_raw input
> +
> +# Uncomment if you're using a Sharp Zaurus SL-5500/SL-5000d
> +# module_raw collie
> +
> +# Uncomment if you're using a Sharp Zaurus SL-C700/C750/C760/C860
> +# module_raw corgi
> +
> +# Uncomment if you're using a device with a UCB1200/1300/1400 TS interfa=
ce
> +# module_raw ucb1x00
> +
> +# Uncomment if you're using an HP iPaq h3600 or similar
> +# module_raw h3600
> +
> +# Uncomment if you're using a Hitachi Webpad
> +# module_raw mk712
> +
> +# Uncomment if you're using an IBM Arctic II
> +# module_raw arctic2
> +
> +module pthres pmin=3D1
> +module variance delta=3D30
> +module dejitter delta=3D100
> +module linear
> diff --git a/meta-gpe/recipes-graphics/tslib/tslib/tslib.sh b/meta-gpe/re=
cipes-graphics/tslib/tslib/tslib.sh
> new file mode 100644
> index 0000000..7068e8d
> --- /dev/null
> +++ b/meta-gpe/recipes-graphics/tslib/tslib/tslib.sh
> @@ -0,0 +1,8 @@
> +#!/bin/sh
> +
> +if [ -e /dev/input/touchscreen0 ]; then
> +    TSLIB_TSDEVICE=3D/dev/input/touchscreen0
> +
> +    export TSLIB_TSDEVICE
> +fi
> +
> diff --git a/meta-gpe/recipes-graphics/tslib/tslib_1.1.bb b/meta-gpe/reci=
pes-graphics/tslib/tslib_1.1.bb
> new file mode 100644
> index 0000000..b0264c3
> --- /dev/null
> +++ b/meta-gpe/recipes-graphics/tslib/tslib_1.1.bb
> @@ -0,0 +1,53 @@
> +SUMMARY =3D "An abstraction layer for touchscreen panel events"
> +DESCRIPTION =3D "Tslib is an abstraction layer for touchscreen panel \
> +events, as well as a filter stack for the manipulation of those events. \
> +Tslib is generally used on embedded devices to provide a common user \
> +space interface to touchscreen functionality."
> +HOMEPAGE =3D "http://tslib.berlios.de/"
> +
> +AUTHOR =3D "Russell King w/ plugins by Chris Larson et. al."
> +SECTION =3D "base"
> +LICENSE =3D "LGPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df30a9716ef3762e3467a2f62bf790=
f0a"
> +
> +SRC_URI =3D "https://github.com/kergoth/tslib/releases/download/${PV}/ts=
lib-${PV}.tar.xz;downloadfilename=3Dtslib-${PV}.tar.xz \
> +           file://ts.conf \
> +           file://tslib.sh \
> +"
> +
> +SRC_URI[md5sum] =3D "14771f8607b341bb4b297819d37e837d"
> +SRC_URI[sha256sum] =3D "fe35e5f710ea933b118f710e2ce4403ac076fe69926b5703=
33867d4de082a51c"
> +
> +UPSTREAM_CHECK_URI =3D "https://github.com/kergoth/tslib/releases"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF =3D "--enable-shared --disable-h3600 --enable-input --disab=
le-corgi --disable-collie --disable-mk712 --disable-arctic2 --disable-ucb1x=
00"
> +
> +do_install_prepend() {
> +	install -m 0644 ${WORKDIR}/ts.conf ${S}/etc/ts.conf
> +}
> +
> +do_install_append() {
> +	install -d ${D}${sysconfdir}/profile.d/
> +	install -m 0755 ${WORKDIR}/tslib.sh ${D}${sysconfdir}/profile.d/
> +}

Use 4 spaces for indentation.

> +
> +# People should consider using udev's /dev/input/touchscreen0 symlink
> +# instead of detect-stylus
> +#RDEPENDS_tslib-conf_weird-machine =3D "detect-stylus"
> +RPROVIDES_tslib-conf =3D "libts-0.0-conf"
> +
> +PACKAGES =3D+ "tslib-conf tslib-tests tslib-calibrate"
> +DEBIAN_NOAUTONAME_tslib-conf =3D "1"
> +DEBIAN_NOAUTONAME_tslib-tests =3D "1"
> +DEBIAN_NOAUTONAME_tslib-calibrate =3D "1"
> +
> +RDEPENDS_${PN} =3D "tslib-conf"
> +RRECOMMENDS_${PN} =3D "pointercal"
> +
> +FILES_${PN}-dev +=3D "${libdir}/ts/*.la"
> +FILES_tslib-conf =3D "${sysconfdir}/ts.conf ${sysconfdir}/profile.d/tsli=
b.sh ${datadir}/tslib"
> +FILES_${PN} =3D "${libdir}/*.so.* ${libdir}/ts/*.so*"
> +FILES_tslib-calibrate +=3D "${bindir}/ts_calibrate"
> +FILES_tslib-tests =3D "${bindir}/ts_harvest ${bindir}/ts_print ${bindir}=
/ts_print_raw ${bindir}/ts_test"
> --=20
> 2.4.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zvk22e3zuplqxifp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfNWVUACgkQN1Ujt2V2gBxubACcC4zrI4iPGqI8YxM9nwek6pzv
91wAnRCgXxIyKxyKx4JsM3ALTBQRbGBU
=fJw6
-----END PGP SIGNATURE-----

--zvk22e3zuplqxifp--
