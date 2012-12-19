Received: from mail-pa0-f50.google.com ([209.85.220.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TlK9f-000106-Qf
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Dec 2012 14:57:53 +0100
Received: by mail-pa0-f50.google.com with SMTP id hz10so1323720pad.37
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2012 05:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8OIWRVtY8J0LnOR2ZnNtjNLvHeH9DWqzp08a0ZGXQ9A=;
	b=l+n2TG0JBo4K5Mt73h1C7XmzOUrtUh/p4UwBqqR8bapUEWQ3dwRC1CGkK2jZYJ5IrD
	DJpnlBtSgw3kR4q9s50hoGHLeiUlLnZwJDf8bvcMKnd+N2oSrdQNokKPecZNxwTGvPxx
	Eq75BuHre5LBolagnGxDN7isZT92D4uFa014vO1rWwZGXuahP9EVf/kEldnU4yZvAQvN
	Y36tyJHg4ifTrlZX8ZXqVneRsMcqgzpnLDKu9KRfsDIXHy3Qf+jqSPBbWbnnVn/tbqEd
	qR7vC0t75TBxnmg840dToirkAO+pZPosUjS029fwjbVOqoqicqx3VW0S18qfNzPnmmRi
	NmjQ==
X-Received: by 10.68.132.232 with SMTP id ox8mr18850896pbb.46.1355924588043;
	Wed, 19 Dec 2012 05:43:08 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id z10sm3456788pax.38.2012.12.19.05.43.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Dec 2012 05:43:06 -0800 (PST)
Date: Wed, 19 Dec 2012 14:43:04 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121219134304.GA14543@jama.palm1.palmone.com>
References: <1355742339-15037-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1355742339-15037-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] python-mako: install standalone, not as an egg
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
X-List-Received-Date: Wed, 19 Dec 2012 13:58:03 -0000
X-Groupsio-MsgNum: 42256
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline

--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 17, 2012 at 11:05:39AM +0000, Ross Burton wrote:
> ---

Missing SOB line

>  meta-oe/recipes-devtools/python/python-mako_0.7.2.bb |    6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb b/meta-=
oe/recipes-devtools/python/python-mako_0.7.2.bb
> index 9113666..d2222d6 100644
> --- a/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb
> +++ b/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb
> @@ -3,7 +3,7 @@ SECTION =3D "devel/python"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dda8dd26ed9751ee0cfdf9df1a16bb=
b54"
> =20
> -PR =3D "r0"
> +PR =3D "r1"
> =20
>  SRC_URI =3D "http://www.makotemplates.org/downloads/Mako-${PV}.tar.gz"
>  SRC_URI[md5sum] =3D "e3c0a677aa4216da9e89ef8fa76cbafb"
> @@ -13,6 +13,10 @@ S =3D "${WORKDIR}/Mako-${PV}"
> =20
>  inherit distutils
> =20
> +DISTUTILS_INSTALL_ARGS =3D "--single-version-externally-managed \
> +                          --root=3D${D} \
> +                          --install-lib=3D${PYTHON_SITEPACKAGES_DIR}"
> +
>  RDEPENDS_${PN} =3D "python-threading \
>                    python-netclient \
>                    python-html \
> --=20
> 1.7.10
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDRxGgACgkQN1Ujt2V2gBxMtwCaAuVnDs3s1VwRNL0o/HX6hFoj
HEsAnjaR2yweoILwLrm70vuOo8qSWAbk
=J5nk
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
