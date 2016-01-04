Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5C551731BD
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 19:16:29 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id b14so342197wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2016 11:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=04vod7oBwpxQmPPQM0aqfEUR3JECU59rbJyVFPoYhtM=;
	b=aUn0gJefLRcqauHfBtzH5/lhFbuBYWwgkd8g1vzUv/b3FZT0ye/4mqryjVtehMqdLM
	fpLsmpv66P2Q0zghpQ5xB+v5xk3SY31pZhB8OOr1pIszkGfKy2toOXDFf33PfTxFBM04
	hLEBCk1RLy3bH2Z/fNtYa8GSNWhXMPy1cWTatU/69eA9LbYBi3QuBVhreu0bxBLraxWg
	AXH3zydzsnxPssrFeyML5z/w7ervIdgYjGJ//9lNrrcrmF/IoHMWi65QtjXYR+WbKYwW
	xAnj5iFpvpJ7TfyMtZszeeiKfsl3y56QPwh/e6S3gOi+19PXxHW6Sn6iqzArMwkSX6WO
	UYcg==
X-Received: by 10.194.179.162 with SMTP id dh2mr97974759wjc.17.1451934989954; 
	Mon, 04 Jan 2016 11:16:29 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ql10sm87527953wjc.23.2016.01.04.11.16.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Jan 2016 11:16:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 4 Jan 2016 20:16:28 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160104191628.GC5744@jama>
References: <8E273032-FCAF-4476-A017-50D6D2451F14@gmail.com>
MIME-Version: 1.0
In-Reply-To: <8E273032-FCAF-4476-A017-50D6D2451F14@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-networking][PATCH] samba: move RDEPENDS of perl from samba to samba-pidl
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
X-List-Received-Date: Mon, 04 Jan 2016 19:16:29 -0000
X-Groupsio-MsgNum: 59330
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TiqCXmo5T1hvSQQg"
Content-Disposition: inline

--TiqCXmo5T1hvSQQg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 04, 2016 at 08:06:04PM +0100, Jens Rehsack wrote:
> samba-pidl is the package containing the perl-extension, so RDEPENDS
> must include perl for samba-pidl, not for samba.
>=20
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  meta-networking/recipes-connectivity/samba/samba_4.1.12.bb | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb b=
/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
> index 5b343f2..de1f033 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
> @@ -39,6 +39,8 @@ SRC_URI[md5sum] =3D "232016d7581a1ba11e991ec2674553c4"
>  SRC_URI[sha256sum] =3D "033604674936bf5c77d7df299b0626052b84a41505a6a6af=
e902f6274fc29898"
>=20
>  inherit systemd waf-samba cpan-base perlnative
> +# remove default added RDEPENDS on perl
> +RDEPENDS_${PN}_remove =3D "perl"
>=20
>  DEPENDS +=3D "readline virtual/libiconv zlib popt libtalloc libtdb libte=
vent libldb krb5 ctdb libbsd"
>=20
> @@ -319,4 +321,5 @@ FILES_${PN}-python-dbg =3D "${libdir}/python${PYTHON_=
BASEVERSION}/site-packages/.d
>                            ${libdir}/python${PYTHON_BASEVERSION}/site-pac=
kages/samba/dcerpc/.debug/* \
>  "
>=20
> +RDEPENDS_${PN}-pidl_append =3D " perl "

You don't need the trailing space (only the leading space is needed for
append).

>  FILES_${PN}-pidl =3D "${bindir}/pidl ${PERL_VERNDORLIB}/*"
> --
> 1.9.1
>=20
> --
> Jens Rehsack - rehsack@gmail.com
>=20



> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TiqCXmo5T1hvSQQg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaKxQsACgkQN1Ujt2V2gByCawCeMqNTPGetNvVU/IBBFFr/vHwv
q5cAnj0Eu9nU++uggzN+56XYZjHDGuMd
=EapL
-----END PGP SIGNATURE-----

--TiqCXmo5T1hvSQQg--
