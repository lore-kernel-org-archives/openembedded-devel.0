Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RYEN3-0006f0-V9 for openembedded-devel@lists.openembedded.org;
	Wed, 07 Dec 2011 11:05:02 +0100
Received: from f053037255.adsl.alicedsl.de ([78.53.37.255]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RYEGa-0003RJ-TT for openembedded-devel@lists.openembedded.org;
	Wed, 07 Dec 2011 09:58:21 +0000
Message-ID: <1323251888.4065.3.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 07 Dec 2011 10:58:08 +0100
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C401A5055@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C401A5055@post.tritech.se>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [PATCH] libpam_1.1.1: remove directory preventing /var/run from being volatile
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
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
X-List-Received-Date: Wed, 07 Dec 2011 10:05:02 -0000
X-Groupsio-MsgNum: 35955
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-Iyn18FJo/0HlG8RImMlm"

--=-Iyn18FJo/0HlG8RImMlm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Mats,


thank you for sending the patch for OE-classic master.

Am Mittwoch, den 07.12.2011, 09:37 +0000 schrieb Mats K=C3=A4rrman:
> The libpam make install creates a /var/run/sepermit folder that prevents
> the later creation of a sym-link /var/run --> /var/volatile/run. This is
> a problem because it causes additional wear to FLASH file systems.
>=20
> The solution is ~equivalent to the solution applied in libpam recipes of

Does the ~ have any meaning or is it just a typo?

> oe-core but v1.1.1 does not exist there and the corresponding fix was a
> part of the original recipes for later versions.
>=20
> Signed-off-by: Mats K=C3=A4rrman <mats.karrman@tritech.se>
>=20
> ------
>=20
> diff --git a/recipes/pam/files/05_libpam b/recipes/pam/files/05_libpam
> new file mode 100644
> index 0000000..5ae0c8e
> --- /dev/null
> +++ b/recipes/pam/files/05_libpam
> @@ -0,0 +1,3 @@
> +# Create sepermit folder in volatile fs
> +d root root 0755 /var/run/sepermit none
> +

In OE-core the file name is `99_pam` [1]. Why did the leading number
needed to be changed? Should that be also `05` in OE-core?

> diff --git a/recipes/pam/libpam_1.1.1.bb b/recipes/pam/libpam_1.1.1.bb
> index 09bc554..ba35d0c 100644
> --- a/recipes/pam/libpam_1.1.1.bb
> +++ b/recipes/pam/libpam_1.1.1.bb
> @@ -15,7 +15,7 @@ DEPENDS =3D "flex flex-native"
>  # PAM is not a lot of use without configuration files and the plugins
>  RRECOMMENDS_${PN} =3D "libpam-meta libpam-base-files"
>=20
> -PR =3D "r2"
> +PR =3D "r3"
>=20
>  # The project is actually called Linux-PAM but that gives
>  # a bad OE package name because of the upper case characters
> @@ -26,6 +26,7 @@ S =3D "${WORKDIR}/${p}"
>  SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/libs/pam/library/${p}.tar.bz2=
 \
>             file://pam-nodocs.patch \
>             file://define-HAVE_DBM.patch \
> +           file://05_libpam \
>            "
>=20
>  UCLIBC_PATCHES =3D " file://Linux-PAM-1.1.0-uclibc.patch \
> @@ -71,6 +72,17 @@ python populate_packages_prepend () {
>         packages.append(metapkg)
>         bb.data.setVar('PACKAGES', ' '.join(packages), d)
>  }
> +
> +do_install_append () {
> +    # Remove erroneously created /var/run dir
> +    rm -rf ${D}${localstatedir}/run
> +
> +    # Install volatiles specification to make sure dir is created in run=
-time
> +    install -d ${D}${sysconfdir}/default
> +    install -d ${D}${sysconfdir}/default/volatiles
> +    install -m 0644  ${WORKDIR}/05_libpam  ${D}${sysconfdir}/default/vol=
atiles/
> +}
> +
>  SRC_URI[md5sum] =3D "9b3d952b173d5b9836cbc7e8de108bee"
>  SRC_URI[sha256sum] =3D "608d3eb9d7a5e1a7505fff62e6a583fdb6e52dc05bf54dc9=
661c5f395


Thanks,

Paul


[1] http://git.openembedded.org/openembedded-core/commit/meta/recipes-exten=
ded/pam/libpam/99_pam?id=3D698cef8322e5a5f18e50ce62f6c9d1f1f846677a

--=-Iyn18FJo/0HlG8RImMlm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk7fOLAACgkQPX1aK2wOHViL7wCdFXlLfaZDERm1nl+lqjZRq9pc
mv0Anjan6rtFSxjIhhaS34nUa4q6x1gJ
=68lx
-----END PGP SIGNATURE-----

--=-Iyn18FJo/0HlG8RImMlm--
