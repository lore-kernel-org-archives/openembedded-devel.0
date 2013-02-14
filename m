Received: from mail-pb0-f43.google.com ([209.85.160.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U5skv-0002rB-Op
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Feb 2013 07:57:28 +0100
Received: by mail-pb0-f43.google.com with SMTP id md12so42701pbc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Feb 2013 22:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oJUR6oO7t9Rpm1w2Ry4BDJpfSTpt53er+DMvsw6j6U0=;
	b=AVj1CnXhjO+408AF9Xqz2nU4fY0cYh6dJ8YM0AN9AkpzQ0OlnGWsbr2TPlrfFAm9ty
	wrbQnrbvGwUsS+MAF9psm3p4hVNKI3YI+fUjeJGYoJVKkJ4VUvlSvqwiWZjUTu/CKnZL
	IEor4FByOkKtlQPrFK30/nqrQY3Sh1XNLHVgg56fJl7a0jA/Uad+6/ryH1iI6k0W3sZ3
	F/1RANps7egXqwJag1+7/wW31uJYcAtum2qjw12CgD45v6PBR10xht8C1LsAk73Q5L8I
	pvWaC4N+3jmMhcTEVgYZoo19TzF2Hf501xshQZGoFKg6PGd88rUUvg7qwZO+wnqwoUs5
	UAiA==
X-Received: by 10.66.79.202 with SMTP id l10mr1091338pax.36.1360824074825;
	Wed, 13 Feb 2013 22:41:14 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id e6sm89101625paw.16.2013.02.13.22.41.12
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Feb 2013 22:41:13 -0800 (PST)
Date: Thu, 14 Feb 2013 07:41:10 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130214064110.GH3300@jama>
References: <1360808228-10746-1-git-send-email-jeffrey.honig@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1360808228-10746-1-git-send-email-jeffrey.honig@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] multilib: Fix PN - BPN to make fetch work.
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
X-List-Received-Date: Thu, 14 Feb 2013 06:57:28 -0000
X-Groupsio-MsgNum: 43146
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K1n7F7fSdjvFAEnM"
Content-Disposition: inline

--K1n7F7fSdjvFAEnM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 13, 2013 at 09:17:08PM -0500, Jeffrey C Honig wrote:
> From: Randy MacLeod <Randy.MacLeod@windriver.com>
>=20
> (LOCAL REV: NOT UPSTREAM) -- Sent to oe-devel 20130208

Please indicate for which layer this is intended (read README in target
layer how to send patches for it).

I's not even for meta-webserver, because it has different version:
=2E/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.7.bb

Marking as "Not Applicable" on patchwork..


> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  recipes-httpd/hiawatha/hiawatha_8.6.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes-httpd/hiawatha/hiawatha_8.6.bb b/recipes-httpd/hiawa=
tha/hiawatha_8.6.bb
> index 2e6955e..837354b 100644
> --- a/recipes-httpd/hiawatha/hiawatha_8.6.bb
> +++ b/recipes-httpd/hiawatha/hiawatha_8.6.bb
> @@ -6,7 +6,7 @@ DEPENDS =3D "libxml2 libxslt"
> =20
>  SECTION =3D "net"
> =20
> -SRC_URI =3D "http://hiawatha-webserver.org/files/${PN}-${PV}.tar.gz \
> +SRC_URI =3D "http://hiawatha-webserver.org/files/${BPN}-${PV}.tar.gz \
>             file://hiawatha-init"
> =20
>  SRC_URI[md5sum] =3D "372ea9e8329ed36e4fb781fdc1a6734c"
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

--K1n7F7fSdjvFAEnM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEchwYACgkQN1Ujt2V2gBzowgCgr72iu1Hcf9XvUOFi1Z+IhWtR
8MsAn2Z4jgx52gLs7XQG+UlupG9B3+ZE
=+f9K
-----END PGP SIGNATURE-----

--K1n7F7fSdjvFAEnM--
