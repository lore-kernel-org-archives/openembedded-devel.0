Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 808C67054B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 13:28:12 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id m15so922033wgh.15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 06:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Mf0MFCTfUAHG96Vei9AmyiVPNg662sC/vmd34uIsxiI=;
	b=wRxcvgsMVm/KkXSdgRSepap6Jhs0vFLulvHp2zVfVbNNXLvqY0VytFUbx1BsNH8j13
	X0ZHKHfnGl4FiCbt110o46TMX8M3Rs0bzkNxn5bzyKtk9UFTKgZNtbvjNnobJcRwcMYc
	hkAMT6Rf4braCyKa7/R5HTxJnv1tO5lSeVU3lu4jM3U4Ozbmj7JD+gegCBi+kT7odLPZ
	l6oo1YWzK06VtW2qhhpgHczQ7GpvaDvY9hcHvUmgufVPYDK3i+vyocPI7TDXPzhTxsBJ
	/Af+UwGgTJheKfsX1SOfqiZQJH3n2LKD6vl4+LlvwI3sG0bZJyRMMZn6IGA88srB+xjz
	ef5w==
X-Received: by 10.180.187.6 with SMTP id fo6mr13861162wic.58.1405517292895;
	Wed, 16 Jul 2014 06:28:12 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gd13sm56566619wic.6.2014.07.16.06.28.11 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jul 2014 06:28:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 16 Jul 2014 15:28:22 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140716132822.GY2433@jama>
References: <1405489400-6339-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1405489400-6339-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] ola: add 0.9.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Jul 2014 13:28:12 -0000
X-Groupsio-MsgNum: 51001
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tyjMFqNw14br+l4O"
Content-Disposition: inline

--tyjMFqNw14br+l4O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2014 at 07:43:20AM +0200, Koen Kooi wrote:
> Open Lighting Architecture (OLA) is part of the Open Lighting Project
> and provides applications with a mechanism to send and receive DMX512 &
> RDM commands using hardware devices and DMX over IP protocols.
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta-oe/recipes-support/ola/ola_git.bb | 47 ++++++++++++++++++++++++++++=
++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 meta-oe/recipes-support/ola/ola_git.bb
>=20
> diff --git a/meta-oe/recipes-support/ola/ola_git.bb b/meta-oe/recipes-sup=
port/ola/ola_git.bb
> new file mode 100644
> index 0000000..4e24543
> --- /dev/null
> +++ b/meta-oe/recipes-support/ola/ola_git.bb
> @@ -0,0 +1,47 @@
> +SUMMARY =3D "Open Lighting Architecture - OLA"
> +DESCRIPTION =3D "The Open Lighting Architecture (OLA) is part of the Ope=
n Lighting Project and provides applications with a mechanism to send and r=
eceive DMX512 & RDM commands using hardware devices and DMX over IP protoco=
ls. This enables software lighting controllers to communicate with hardware=
 either via Ethernet or traditional DMX512 networks. \
> +OLA can also convert DMX512 data sent using DMX over IP protocols from o=
ne format to another, allowing devices from different manufacturers to inte=
ract with one another. For example a Strand Lighting Console using ShowNet =
can send DMX512 to an Enttec EtherGate. When combined with a physical DMX i=
nterface such as the DMX USB Pro, OLA can send and receive data from wired =
DMX512 networks."
> +
> +LICENSE =3D "GPLv2 & LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3Df1be0425937acddca9ed750ce30f8=
21d"
> +
> +DEPENDS =3D "libmicrohttpd avahi libusb1 libftdi cppunit protobuf protob=
uf-native ola-native"
> +DEPENDS_class-native =3D "protobuf cppunit"

You need to fix libftdi first:
ERROR: libftdi was skipped: Recipe is blacklisted: BROKEN: needs to be
updated to detect libusb with pkg-config instead of libusb-config

> +PV =3D "0.9.1"
> +SRCREV =3D "8c7067514793baaeaa3033d77de163d981d7c73a"
> +SRC_URI =3D "git://github.com/OpenLightingProject/ola.git;protocol=3Dhtt=
ps"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools pythonnative
> +
> +export BUILD_SYS
> +export HOST_SYS
> +export STAGING_LIBDIR
> +
> +EXTRA_OECONF =3D " --disable-unittests \
> +               "
> +
> +EXTRA_OECONF_append_class-target =3D " --with-ola-protoc=3D${STAGING_BIN=
DIR_NATIVE}/ola_protoc"
> +
> +# -fvisibility-inlines-hidden breaks stuff
> +CXXFLAGS =3D "${CFLAGS}"
> +
> +# The code is not Werror safe
> +do_configure_prepend() {
> +	sed -i -e 's:-Werror::g' ${S}/configure.ac
> +	sed -i -e 's:-Werror::g' ${S}/Makefile.am
> +}
> +
> +do_install_append_class-native() {
> +    install -d ${D}${bindir}
> +    install -m 0755 ${B}/protoc/ola_protoc ${D}${bindir}
> +}
> +
> +FILES_${PN}-dbg +=3D "${libdir}/*/.debug"
> +FILES_${PN} +=3D "${datadir}/olad ${libdir}/olad/*.so.*"
> +FILES_${PN}-staticdev +=3D "${libdir}/olad/*.a"
> +FILES_${PN}-dev +=3D "${libdir}/olad/*.la ${libdir}/olad/*.so"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --=20
> 1.9.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tyjMFqNw14br+l4O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPGffYACgkQN1Ujt2V2gByRAwCeNojrPhaNZv9ucl9tqa40vZD9
XVUAn3DgIRLBoFVk3JZbaaOWLVSR1dBB
=B45H
-----END PGP SIGNATURE-----

--tyjMFqNw14br+l4O--
