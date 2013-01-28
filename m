Received: from mail-wg0-f46.google.com ([74.125.82.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TzmQE-0003ZV-5n
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jan 2013 11:58:44 +0100
Received: by mail-wg0-f46.google.com with SMTP id fg15so1579080wgb.25
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2013 02:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=0SUE4r3OayeCwt6Bf+ODJ+1DMml5JOrk6tyF5+6rmhY=;
	b=jWnpstU+s+f2HhGh6LUh3XR4if+IWMOgqpHIn02e2RzlsOJ44fGw9CdnZpDqylSg7M
	RXRy11C9+/OmPWJUpw5JSGhUEwPCwhI4nuyDFxrymV0rk9sxJrNIWEer+EfiKDqTwsUg
	uS+HaDNdQ2C5JOc2ps/XujVTqeY2VL6zC1RW7e9/5r0EOWFv/P1o2/XIfpC9E06LEufx
	OnfMkkHTVvz+UTadBOeBck+VNB4otdj8pc34MdwwWKhXEnvLKPjif73V9rUNNskuZIg7
	HWqHSerP3FgO2/5Y9tagfInVkCdcijp+JAyzb6SW4D43q1BTwNjNSBqlYtjTDZbj8X8L
	Z30A==
X-Received: by 10.180.77.35 with SMTP id p3mr8804989wiw.18.1359369784176;
	Mon, 28 Jan 2013 02:43:04 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id m6sm3643918wic.2.2013.01.28.02.43.03
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 02:43:03 -0800 (PST)
Date: Mon, 28 Jan 2013 11:43:07 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130128104307.GW16904@jama.palm1.palmone.com>
References: <1359301282-5470-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1359301282-5470-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH 1/7] libebml: add 1.2.2
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
X-List-Received-Date: Mon, 28 Jan 2013 10:58:58 -0000
X-List-Received-Date: Mon, 28 Jan 2013 10:58:58 -0000
X-Groupsio-MsgNum: 42881
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mz5eWKkhz39mMVQV"
Content-Disposition: inline

--mz5eWKkhz39mMVQV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 27, 2013 at 04:41:16PM +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

All applied, Thanks.=20

Now I have only:
3424ca7 wscan: add 20121111
5c7cfdd xbmc: first try at making it build for non-GLES platforms
pending from you :).

> ---
>  .../recipes-mkv/libebml/libebml_1.2.2.bb           | 31 ++++++++++++++++=
++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 meta-multimedia/recipes-mkv/libebml/libebml_1.2.2.bb
>=20
> diff --git a/meta-multimedia/recipes-mkv/libebml/libebml_1.2.2.bb b/meta-=
multimedia/recipes-mkv/libebml/libebml_1.2.2.bb
> new file mode 100644
> index 0000000..210a409
> --- /dev/null
> +++ b/meta-multimedia/recipes-mkv/libebml/libebml_1.2.2.bb
> @@ -0,0 +1,31 @@
> +SUMMARY =3D "libebml is a C++ libary to parse EBML files."
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.LGPL;md5=3Df14599a2f089f6ff8c97e2ba=
a4e3d575"
> +
> +SRC_URI =3D "http://dl.matroska.org/downloads/libebml/libebml-${PV}.tar.=
bz2"
> +SRC_URI[md5sum] =3D "726cc2bd1a525929ff35ff9854c0ebab"
> +SRC_URI[sha256sum] =3D "476b08c6436a96c024a53e788e7c945ce9b41cd865416576=
3444aa7e5245b7a5"
> +
> +do_compile() {
> +	cd ${S}/make/linux
> +	oe_runmake CROSS=3D"${TARGET_PREFIX}"
> +}
> +
> +do_install() {
> +	cd ${S}/make/linux
> +
> +	install -d ${D}${libdir}
> +	install -m 0644 libebml.a ${D}${libdir}
> +	install -m 0755 libebml.so.* ${D}${libdir}
> +	cp -a libebml.so ${D}${libdir}
> +
> +	install -d ${D}${includedir}/ebml
> +	for i in ../../ebml/*.h; do
> +		install -m 0644 $i ${D}${includedir}/ebml
> +	done
> +
> +	install -d ${D}${includedir}/ebml/c
> +	for i in ../../ebml/c/*.h; do
> +		install -m 0644 $i ${D}${includedir}/ebml/c
> +	done
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

--mz5eWKkhz39mMVQV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEGVjsACgkQN1Ujt2V2gBwVfACfdt2qCpGMg2MeRxyMn2a7xbwL
zkoAn3wXO/WqOD+/B34MSNY7TIUR0HoP
=Uxey
-----END PGP SIGNATURE-----

--mz5eWKkhz39mMVQV--
