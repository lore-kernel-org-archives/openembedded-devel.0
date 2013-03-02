Received: from mail-pb0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UBmZz-0001AF-3l
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Mar 2013 14:34:24 +0100
Received: by mail-pb0-f53.google.com with SMTP id un1so2254569pbc.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Mar 2013 05:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7qA6mw1P2xEztCP+4JbFr97y1c+GauUuOyndQGCrcTA=;
	b=N/48LjVQKyiCzJx/WPPYIbJe16J1JMD4QBFEt5Pa7PuHWbUhKhG+AbHr6NgaWIpPUq
	Fj01/I8fuFgQCv09HCcFWr5lUmdUElBY/9l9mM9IwrDdddXC3hm98sEN7OGTHmakW+Mp
	QkV5xVj1HjAcZZlxREarUMSqmNudwH1rcf9kxgft5HcGxAbT9lzZVTAM8DrY9hSF3WEa
	a2orlRjqIXivLzu4sMmX40gKsSqxb//1+0P8yShPn6pF5p8M5OtAi4B+buPRlFFN6erh
	x7N7WHFY35sHtlmyh7SW24bdOc19Jv1GCjnArR8ddT+bcCNMyin0wTktaETEDByQHdKI
	9AHg==
X-Received: by 10.68.116.169 with SMTP id jx9mr19199394pbb.94.1362230277586;
	Sat, 02 Mar 2013 05:17:57 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id kt5sm15541960pbc.30.2013.03.02.05.17.54
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 02 Mar 2013 05:17:56 -0800 (PST)
Date: Sat, 2 Mar 2013 14:17:49 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130302131749.GZ3279@jama>
References: <cover.1362223895.git.apelete@seketeli.net>
	<79357068d009b46c93485c118c12886a394a78f7.1362223895.git.apelete@seketeli.net>
MIME-Version: 1.0
In-Reply-To: <79357068d009b46c93485c118c12886a394a78f7.1362223895.git.apelete@seketeli.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [2011.03-maintenance][PATCH 2/7] git: update SRC_URI
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
X-List-Received-Date: Sat, 02 Mar 2013 13:34:28 -0000
X-Groupsio-MsgNum: 43365
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="t8N2qprAjL+0GVly"
Content-Disposition: inline

--t8N2qprAjL+0GVly
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 02, 2013 at 12:57:03PM +0100, Apelete Seketeli wrote:
> Update SRC_URI to build.shr-project.org since git source packages are
> no longer available from kernel.org.
> ---
>  recipes/git/git.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes/git/git.inc b/recipes/git/git.inc
> index eb59a2c..ae656e1 100644
> --- a/recipes/git/git.inc
> +++ b/recipes/git/git.inc
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "The git revision control system used by =
the Linux kernel develope
>  SECTION =3D "console/utils"
>  LICENSE =3D "GPLv2"
> =20
> -SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/software/scm/git/git-${PV}.ta=
r.bz2;name=3Dsrc"
> +SRC_URI =3D "http://build.shr-project.org/sources/git-${PV}.tar.bz2;name=
=3Dsrc"

I don't know how long I'll keep "old" PREMIRROR there, it would be
better to send missing archives to Tom King to add them to
sources.oe.org which is more official source (and probably already
listed in default MIRRORS)

> =20
>  S =3D "${WORKDIR}/git-${PV}"
> =20
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--t8N2qprAjL+0GVly
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEx+/0ACgkQN1Ujt2V2gByeRACfSrevIAEBtFfLJ7J67KYIsl4W
70gAnArUa7zigqxhrmovk5SgdbKwpwCW
=ZKFd
-----END PGP SIGNATURE-----

--t8N2qprAjL+0GVly--
