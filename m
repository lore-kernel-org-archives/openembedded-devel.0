Received: from mail-ye0-f181.google.com ([209.85.213.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFoyM-00083W-4Y
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 17:56:20 +0100
Received: by mail-ye0-f181.google.com with SMTP id l2so202134yen.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 09:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=rfLB+69def3FsUv1/AUOOmLpAnPBXG2CfrzNFa7cKyg=;
	b=btCDb7+LbaUIMPYnr92J+OWpLIPlRrZ5fXPX8pXM9qGRzQFFTSVBFLZggWrTsqvyZM
	NRR1NXX2eQ0nUmBOWdP3EbglUXF57E1Fs9187AeigtvnDmEeUlJO/cRnRN1owqfuDpgo
	M1h0y8SplhJOuCVD7zL9H1UxYN8xeDWYST70jeUidMH5QXcInMceejnYRo+9HNgMoGyO
	GRcTELqIILM1K97VSjvATnGw8sAqD95EhDXPWGKfslHxS2s5AlhLniI8wk330kFiPMyg
	XBg4QajD8IIPrsDPHIahzaWsSXsZeLAXdyAHI2HYwAHbmNgoE48fnv9iigmCZ+IiDeQJ
	UU3Q==
X-Received: by 10.236.149.74 with SMTP id w50mr16290948yhj.129.1363192772931; 
	Wed, 13 Mar 2013 09:39:32 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id w2sm36319379yhh.7.2013.03.13.09.39.31
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 09:39:32 -0700 (PDT)
Date: Wed, 13 Mar 2013 17:39:25 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130313163925.GX3260@jama>
References: <1362162356-25168-1-git-send-email-ftonello@cercacor.com>
MIME-Version: 1.0
In-Reply-To: <1362162356-25168-1-git-send-email-ftonello@cercacor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: Re: [meta-oe][PATCH] gsoap: added gsoap 2.8.12 recipe
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
X-List-Received-Date: Wed, 13 Mar 2013 16:56:22 -0000
X-Groupsio-MsgNum: 43537
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eGyD7iWN192kf2IJ"
Content-Disposition: inline

--eGyD7iWN192kf2IJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 01, 2013 at 10:25:56AM -0800, eu@felipetonello.com wrote:
> From: "Felipe F. Tonello" <ftonello@cercacor.com>
>=20
> This recipe was inspired on the gsoap recipe in oe-classic.

Applied, thanks!

>=20
> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
> ---
>  .../recipes-support/gsoap/gsoap-native_2.8.12.bb   |   14 ++++++++++++
>  meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb      |   17 +++++++++++++++
>  meta-oe/recipes-support/gsoap/gsoap_2.8.12.inc     |   23 ++++++++++++++=
++++++
>  3 files changed, 54 insertions(+)
>  create mode 100644 meta-oe/recipes-support/gsoap/gsoap-native_2.8.12.bb
>  create mode 100644 meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb
>  create mode 100644 meta-oe/recipes-support/gsoap/gsoap_2.8.12.inc
>=20
> diff --git a/meta-oe/recipes-support/gsoap/gsoap-native_2.8.12.bb b/meta-=
oe/recipes-support/gsoap/gsoap-native_2.8.12.bb
> new file mode 100644
> index 0000000..46fabbb
> --- /dev/null
> +++ b/meta-oe/recipes-support/gsoap/gsoap-native_2.8.12.bb
> @@ -0,0 +1,14 @@
> +require gsoap_${PV}.inc
> +
> +DEPENDS =3D ""
> +EXTRA_OEMAKE =3D ""
> +
> +inherit native
> +
> +do_install() {
> +    oe_runmake DESTDIR=3D${D} BINDIR=3D${D}${bindir} install
> +}
> +
> +
> +SRC_URI[md5sum] =3D "5700d26fc6fe3073d038349e19c3640d"
> +SRC_URI[sha256sum] =3D "51eef118544fa846f4d2dea2eedf91c84c46a1abeafc5eee=
3dcff783f4015a00"
> diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb b/meta-oe/reci=
pes-support/gsoap/gsoap_2.8.12.bb
> new file mode 100644
> index 0000000..5db2e61
> --- /dev/null
> +++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb
> @@ -0,0 +1,17 @@
> +require gsoap_${PV}.inc
> +
> +DEPENDS =3D "gsoap-native openssl"
> +
> +do_install_append() {
> +   install -d ${D}${libdir}
> +   for lib in libgsoapssl libgsoapssl++ libgsoap libgsoapck++ libgsoap++=
 libgsoapck
> +   do
> +       oe_libinstall -C gsoap $lib ${D}${libdir}
> +   done
> +}
> +
> +FILES_${PN} =3D "${bindir}/wsdl2h ${bindir}/soapcpp2"
> +FILES_${PN} +=3D "${datadir}"
> +
> +SRC_URI[md5sum] =3D "5700d26fc6fe3073d038349e19c3640d"
> +SRC_URI[sha256sum] =3D "51eef118544fa846f4d2dea2eedf91c84c46a1abeafc5eee=
3dcff783f4015a00"
> diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.12.inc b/meta-oe/rec=
ipes-support/gsoap/gsoap_2.8.12.inc
> new file mode 100644
> index 0000000..30cf9a6
> --- /dev/null
> +++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.12.inc
> @@ -0,0 +1,23 @@
> +DESCRIPTION =3D "The gSOAP toolkit provides a unique SOAP-to-C/C++ langu=
age binding \
> +for the development of SOAP Web Services and clients."
> +SECTION =3D "devel"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Db338b08b1b61e028e0f399a4d=
e25e58f"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/gsoap2/gsoap_${PV}.zip \
> +        "
> +
> +inherit autotools
> +
> +PR =3D "r1"
> +
> +S =3D "${WORKDIR}/gsoap-2.8"
> +
> +FILES_${PN}-dev =3D "${includedir}"
> +RRECOMMENDS_${PN}-dev =3D "${PN}-staticdev"
> +
> +FILES_${PN}-staticdev =3D "${libdir}"
> +
> +PARALLEL_MAKE =3D ""
> +
> +EXTRA_OEMAKE =3D "SOAP=3D${STAGING_BINDIR_NATIVE}/soapcpp2"
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eGyD7iWN192kf2IJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFAq70ACgkQN1Ujt2V2gByr2QCgtqImdHcfX9T4y/GyZ7BxIFuu
e2kAnRWPy8XUsXJ6e1NegJGCPv3bjwNm
=yVM3
-----END PGP SIGNATURE-----

--eGyD7iWN192kf2IJ--
