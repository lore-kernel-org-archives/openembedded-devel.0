Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 76A1F60745
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 14:08:19 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id f206so214988549wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2016 06:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Pfybeqmtz5jfSCoMraQ3vG9TOUws/Dk9101RQAaQ1Fk=;
	b=NghmKaX1XfOkr4TzqLNlWatSywVyW0NZbQb6CTR66jokxcxDCy7+wJD6SIczPZSo4X
	Gk6ufTR1G29/WaS7av34Hdm/nc+6dQwB9+TQg5WYKdQxqinz9b9xn/tC5YPddvEr2QZ7
	ETjSf7z2gScu3W1Ran2Aeg3KjmkQMtxcDoCZkq2OIvRvzpQx9Dyf7VV/xkEW7xNevUp1
	9SsjE/r8PMo/AGEVwdBEOADO8BguAPkeTy22flHat8jXj+a1HK3xBB8rFRZHqw+cM7J1
	y2iK2dfYfEsVMi/eDW3Xh8ooIrecE3K0mAmRHbeYmEY3o2TM7zpNZRqSWhdf2cF4zkDr
	/vwg==
X-Received: by 10.28.97.11 with SMTP id v11mr87292523wmb.42.1451916499716;
	Mon, 04 Jan 2016 06:08:19 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	lx4sm86345307wjb.5.2016.01.04.06.08.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Jan 2016 06:08:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 4 Jan 2016 15:12:30 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160104141230.GD2581@jama>
References: <1451902358-1844-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<1451902358-1844-4-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1451902358-1844-4-git-send-email-lixin.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-python][jethro][PATCH 4/4] python-cryptography: Error fix
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
X-List-Received-Date: Mon, 04 Jan 2016 14:08:19 -0000
X-Groupsio-MsgNum: 59311
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="g7w8+K/95kPelPD2"
Content-Disposition: inline

--g7w8+K/95kPelPD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 04, 2016 at 01:12:38PM +0300, Li Xin wrote:
> python-cryptography depends on python-enum34 python-six python-pyasn1,
> And will download modules enum34 six pyasn1 in the step of do_compile.
> If your network is not very well,errors will occur as following:
>   Download error on https://pypi.python.org/simple/enum34/:
>   [Errno -5] No address associated with hostname -- Some packages may not=
 be found!
>   Couldn't find index page for 'enum34' (maybe misspelled?)

Is this change needed in master as well? Where we have 1.1 version.

1/4 and 3/4 do apply in master

>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-cryptography_0.8.1.bb   | 14 ++++++++=
++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/meta-python/recipes-devtools/python/python-cryptography_0.8.=
1.bb b/meta-python/recipes-devtools/python/python-cryptography_0.8.1.bb
> index 41e4acd..d6ebbb7 100644
> --- a/meta-python/recipes-devtools/python/python-cryptography_0.8.1.bb
> +++ b/meta-python/recipes-devtools/python/python-cryptography_0.8.1.bb
> @@ -38,6 +38,20 @@ RDEPENDS_${PN}-ptest =3D "\
> =20
>  inherit ptest
> =20
> +do_compile_prepend() {
> +    install -d ${S}/.eggs
> +    if [ -f ${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}/enum34*.egg ]=
; then
> +        cp ${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}/enum34*.egg ${=
S}/.eggs/
> +    fi
> +
> +    if [ -f ${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}/pyasn1*.egg ]=
; then
> +        cp ${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}/pyasn1*.egg ${=
S}/.eggs/
> +    fi
> +
> +    if [ -f ${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}/six*.egg ]; t=
hen
> +        cp ${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}/six*.egg ${S}/=
=2Eeggs/
> +    fi
> +}
>  do_install_ptest() {
>      install -d ${D}${PTEST_PATH}/tests
>      cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> --=20
> 1.8.4.2
>=20
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--g7w8+K/95kPelPD2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaKfaUACgkQN1Ujt2V2gBwzPgCgsQOb1D+x0ZXWhPsIh8HjuX1M
i84AoLKwJSvY6iBpvKcZfJDrALYRVwut
=iLLr
-----END PGP SIGNATURE-----

--g7w8+K/95kPelPD2--
