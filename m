Received: from mail-da0-f41.google.com ([209.85.210.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TzY0R-0002AX-Iu
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Jan 2013 20:35:09 +0100
Received: by mail-da0-f41.google.com with SMTP id e20so914501dak.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Jan 2013 11:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=36F5gujJ7SAXrQl7z+D7peIMIENvN3SOPHFnvvS8GmA=;
	b=W2DCcQ5UvXREr6pPcwb/WBCfRG3shL6NkJ210BLFOGA4zoJt/06MJBq+8G7t++J0nW
	/rveLxMC+fJxzqCcWXGkN/x2chSEhHK36oQGnwSnU2ZpwpxRggSRKEvNTFmR42kMl4cu
	KWdu7dNcKEumrSt+aSZG8x0UX9wsc881niyB9c58TM8FHxKyXK650o8bqwG/UJcuAE93
	oOA6h2APaRacaIufeheRcAm1bDPux4OkvqICvxY9H1wxO5sysYaLy69s/oHTRWpcCFqW
	Pj0K0ZO8pz0EN29IGNSiviRB2hPrJRUcLqs2sj5fPIA+tWKWU2piPwPo2KzMLnFNlrwu
	UxZg==
X-Received: by 10.68.253.137 with SMTP id aa9mr31817917pbd.102.1359314369600; 
	Sun, 27 Jan 2013 11:19:29 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ou8sm2384419pbb.39.2013.01.27.11.19.26
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 27 Jan 2013 11:19:28 -0800 (PST)
Date: Sun, 27 Jan 2013 20:19:27 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130127191927.GM16904@jama.palm1.palmone.com>
References: <1359301282-5470-1-git-send-email-koen@dominion.thruhere.net>
	<1359301282-5470-4-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1359301282-5470-4-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH 4/7] x264: add git version
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
X-List-Received-Date: Sun, 27 Jan 2013 19:35:09 -0000
X-Groupsio-MsgNum: 42865
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="B9BE8dkJ1pIKavwa"
Content-Disposition: inline

--B9BE8dkJ1pIKavwa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 27, 2013 at 04:41:19PM +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta-oe/recipes-multimedia/x264/x264_git.bb | 43 +++++++++++++++++++++++=
++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 meta-oe/recipes-multimedia/x264/x264_git.bb
>=20
> diff --git a/meta-oe/recipes-multimedia/x264/x264_git.bb b/meta-oe/recipe=
s-multimedia/x264/x264_git.bb
> new file mode 100644
> index 0000000..ba8e979
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/x264/x264_git.bb
> @@ -0,0 +1,43 @@
> +SUMMARY =3D "x264 is a free software library and application for encodin=
g video streams into the H.264/MPEG-4 AVC format"
> +HOMEPAGE =3D "http://www.videolan.org/developers/x264.html"
> +
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +
> +DEPENDS =3D "yasm-native"
> +
> +SRC_URI =3D "git://git.videolan.org/x264.git"
> +SRCREV =3D "1cffe9f406cc54f4759fc9eeb85598fb8cae66c7"
> +
> +PV =3D "r2230+git"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit lib_package pkgconfig
> +
> +X264_DISABLE_ASM =3D ""
> +X264_DISABLE_ASM_armv4 =3D "--disable-asm"
> +X264_DISABLE_ASM_armv4t =3D "--disable-asm"
> +X264_DISABLE_ASM_armv5te =3D "--disable-asm"

Can we use more generic overrides?
meta/conf/machine/include/arm/arch-armv5.inc:MACHINEOVERRIDES .=3D "${@bb.u=
tils.contains("TUNE_FEATURES", "armv5", ":armv5", "" ,d)}"
meta/conf/machine/include/arm/arch-armv4.inc:MACHINEOVERRIDES .=3D "${@bb.u=
tils.contains("TUNE_FEATURES", "armv4", ":armv4", "" ,d)}"

I'll update it in jansa/in-test, but send me your ack.

PKG_ARCH is not in default OVERRIDES IIRC and with different distro
settings for default tune it could be also xscalete or arm926ejste etc.

Cheers,

> +
> +EXTRA_OECONF =3D '--prefix=3D${prefix} \
> +                --host=3D${HOST_SYS} \
> +                --cross-prefix=3D${TARGET_PREFIX} \
> +                --sysroot=3D${STAGING_DIR_TARGET} \
> +                --enable-shared \
> +                --enable-static \
> +                --disable-lavf \
> +                ${X264_DISABLE_ASM} \
> +               '
> +
> +do_configure() {
> +	./configure ${EXTRA_OECONF}
> +}
> +
> +# Get rid of -e
> +EXTRA_OEMAKE =3D ""
> +AS =3D "${TARGET_PREFIX}gcc"
> +
> +do_install() {
> +	oe_runmake install DESTDIR=3D${D}
> +}
> --=20
> 1.8.1
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--B9BE8dkJ1pIKavwa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEFfb8ACgkQN1Ujt2V2gBznigCgrxxIdnd0nFsA2MWi0Jq4AGv4
4AQAn2nmTHpwxR/GX6e5XCjyF+96utVw
=UXSd
-----END PGP SIGNATURE-----

--B9BE8dkJ1pIKavwa--
