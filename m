Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 076AD6EC83
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 20:53:25 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id e49so2130842eek.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 13:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Etc5497tgU2km621P6kgQfLLKKF38WRFmBstie4Feww=;
	b=ifwwmuN/yIQy0GXqJ9XRTN8r7Ll6JOC5caPctozqe89NSHyOW4I5Y+nD6zGU9xHeP+
	3y0tySYUhoudn02R9ShZbDPk4SNoBX25JpXE+hKLLA0Ta7jMyfHltm4LExgNjilSURRs
	RuW2ggq0WEyf5rTa7fm8MnXCfWqk2K7BOkHWdxV60gym7KDz1bhfp+CRwa4KpJI/0Tui
	NXyWkwGeP+MQA3xkaGB6aeD+aVCvayxD3JfLjQ+/TWxkJB+GiooNP/OndTdm3XepOckD
	1f/6RirRSIJfXeS0dOYkVeE0OouHO/FQ/oZ4/surSX8smJAjKylflghkHvDGx7o+oc3K
	FbXQ==
X-Received: by 10.14.225.132 with SMTP id z4mr4094676eep.92.1395867205936;
	Wed, 26 Mar 2014 13:53:25 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m44sm19141996eep.14.2014.03.26.13.53.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Mar 2014 13:53:23 -0700 (PDT)
Date: Wed, 26 Mar 2014 21:53:23 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140326205323.GL3709@jama>
References: <cover.1395847615.git.diego.ml@zoho.com>
	<a3add80fda66a3b3ed601cdf1143297886f9e679.1395847615.git.diego.ml@zoho.com>
MIME-Version: 1.0
In-Reply-To: <a3add80fda66a3b3ed601cdf1143297886f9e679.1395847615.git.diego.ml@zoho.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCHv2 2/3] python-twisted: upgrade to version 13.2.0
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
X-List-Received-Date: Wed, 26 Mar 2014 20:53:29 -0000
X-Groupsio-MsgNum: 48844
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O8/n5iBOhiUtMkxf"
Content-Disposition: inline

--O8/n5iBOhiUtMkxf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2014 at 04:31:23PM +0100, Diego Rondini wrote:
> Signed-off-by: Diego Rondini <diego.ml@zoho.com>

I'm going to add it to master-next, but please send v2 with commit
message which will say what was changed in license and why PN-bin was
removed (without upgrade path).

> ---
>  ...-twisted_10.2.0.bb =3D> python-twisted_13.2.0.bb} |   16 +++++-------=
----
>  1 file changed, 5 insertions(+), 11 deletions(-)
>  rename meta-oe/recipes-devtools/python/{python-twisted_10.2.0.bb =3D> py=
thon-twisted_13.2.0.bb} (94%)
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb b/m=
eta-oe/recipes-devtools/python/python-twisted_13.2.0.bb
> similarity index 94%
> rename from meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb
> rename to meta-oe/recipes-devtools/python/python-twisted_13.2.0.bb
> index d585bfa..00be867 100644
> --- a/meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb
> +++ b/meta-oe/recipes-devtools/python/python-twisted_13.2.0.bb
> @@ -6,12 +6,12 @@ SECTION =3D "console/network"
> =20
>  #twisted/topfiles/NEWS:655: - Relicensed: Now under the MIT license, rat=
her than LGPL.
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc3159ad36d96a939fcd8f2c2c9b9d=
08a"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5602d7228daf59a16f0f1b2640c46=
bca"
>  PR =3D "r3"
> =20
> -SRC_URI =3D "http://tmrc.mit.edu/mirror/twisted/Twisted/10.2/Twisted-${P=
V}.tar.bz2 "
> -SRC_URI[md5sum] =3D "73da62c793269eade8121da336b01ba5"
> -SRC_URI[sha256sum] =3D "562ed61c18aa72da99c23fb19c2c101d178995eb3a78ab3c=
09560a613e180c84"
> +SRC_URI =3D "https://pypi.python.org/packages/source/T/Twisted/Twisted-$=
{PV}.tar.bz2"
> +SRC_URI[md5sum] =3D "83fe6c0c911cc1602dbffb036be0ba79"
> +SRC_URI[sha256sum] =3D "095175638c019ac7c0604f4c291724a16ff1acd062e181b0=
1293bf4dcbc62cf3"
> =20
>  S =3D "${WORKDIR}/Twisted-${PV}"
> =20
> @@ -26,7 +26,6 @@ PACKAGES +=3D "\
>      ${PN}-zsh \
>      ${PN}-test \
>      ${PN}-protocols \
> -    ${PN}-bin \
>      ${PN}-conch \
>      ${PN}-lore \
>      ${PN}-mail \
> @@ -42,7 +41,6 @@ PACKAGES +=3D "\
> =20
>  RDEPENDS_${PN} =3D "python-core python-zopeinterface"
>  RDEPENDS_${PN} +=3D "\
> -    ${PN}-bin \
>      ${PN}-conch \
>      ${PN}-lore \
>      ${PN}-mail \
> @@ -70,11 +68,7 @@ FILES_${PN}-protocols =3D " \
>  FILES_${PN}-zsh =3D " \
>      ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zsh \
>      ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zshcomp.* \
> -"
> -
> -FILES_${PN}-bin =3D " \
> -    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/_c_urlarg.so=
 \
> -    ${libdir}/${PYTHON_DIR}/site-packages/twisted/spread/cBanana.so \
> +    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/twisted-complet=
ion.zsh \
>  "
> =20
>  FILES_${PN}-conch =3D " \
> --=20
> 1.7.9.5
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--O8/n5iBOhiUtMkxf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMzPkMACgkQN1Ujt2V2gBwPIgCfclRY+jdVVLqLsVVBhCIoXBmV
HmYAn0c2wwk/DxAzoxEFruMfi9nzTcvS
=AR3R
-----END PGP SIGNATURE-----

--O8/n5iBOhiUtMkxf--
