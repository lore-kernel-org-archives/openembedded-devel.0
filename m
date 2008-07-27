Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1KN7vZ-0003Qu-3E
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Jul 2008 17:12:53 +0200
Received: (qmail invoked by alias); 27 Jul 2008 15:11:22 -0000
Received: from e178111218.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.111.218]
	by mail.gmx.net (mp031) with SMTP; 27 Jul 2008 17:11:22 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/rmNJdQSLriFy4n6iWRE6M/fcF2UnLiepatSEFvW
	1hStopY6K+MxWV
Message-ID: <488C9052.6070701@gmx.net>
Date: Sun, 27 Jul 2008 17:12:18 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.14 (X11/20080509)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20080727150318.ADD3B189328@amethyst.openembedded.net>
In-Reply-To: <20080727150318.ADD3B189328@amethyst.openembedded.net>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.51
Subject: Re: [oe-commits] org.oe.dev classpath-initial: fix libtool2 error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 27 Jul 2008 15:12:53 -0000
X-Groupsio-MsgNum: 5621
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigD2316D2CEC4648AA9279323F"

--------------enigD2316D2CEC4648AA9279323F
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

woglinde2 commit schrieb:
> classpath-initial: fix libtool2 error
this should have read

classpath-native: fix libtool2 error

instead :)

> --- packages/classpath/classpath-native.inc	f1053899930127b54417bca6f25=
818bdf90a200e
> +++ packages/classpath/classpath-native.inc	1ac43332aef0a8c639c3aca49bc=
3319d0ced8273
> @@ -6,7 +6,7 @@ SRC_URI =3D "${GNU_MIRROR}/classpath/class
> =20
>  SRC_URI =3D "${GNU_MIRROR}/classpath/classpath-${PV}.tar.gz"
> =20
> -DEPENDS =3D "ecj-initial fastjar-native zip-native"
> +DEPENDS =3D "ecj-initial fastjar-native zip-nativei gettext-native"
> =20
>  inherit autotools native
> =20
> @@ -29,7 +29,13 @@ EXTRA_OECONF =3D "\
>    --includedir=3D${STAGING_INCDIR}/classpath \
>    --with-vm=3Djava \
>    "
> +# hack to get config.rpath in, it comes from gettext
> +do_configure_prepend () {
> =20
> +        ${@['','cp ${STAGING_DATADIR}/automake-1.10/config.rpath ${S}'=
][bb.data.getVar('PREFERRED_VERSION_automake-native',d,1) =3D=3D '1.10']}=

> +
> +}
> +
>  do_stage() {
>  	oe_runmake install
>  }



--------------enigD2316D2CEC4648AA9279323F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAkiMkFgACgkQG9cfwmwwEtqeDgCcC1orWxn0Ir9/LtuHEy34C0Cf
xGIAni8jsZK3MI5AdGcfU9n/J3dnfbW5
=+a3T
-----END PGP SIGNATURE-----

--------------enigD2316D2CEC4648AA9279323F--
