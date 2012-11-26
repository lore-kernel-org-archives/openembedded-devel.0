Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Td1lS-0002Yc-1L
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2012 17:42:34 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so6198921eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2012 08:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fBHkukHII3sdkRcKeafatOWgX1RhOcurORSLoZ+kzxE=;
	b=xEI6mil/Wsq+/ZDlejFAmq8Nvsql2RlE9y9Fh2ehecMjASxyjwFHoOStHGaRrCoR6a
	ZF3Hv+xApb5xbg6aox4t4qf9iLPKGIuer6PmSkaTUp9XeAM65fJ+Cq3rG5UN+PnZ+oBt
	JAYKNgfpFsFIfoEEKwUiaJJgaGPdowWH1ah8YeJrx9GbYItN0deDRUejRJiuKk5crREr
	Wg8VI2iUR55UvZrnp+sa8vGzc19s26EBhFqeruuyf1DxpsxbQeqd+8GORr9+of5JLPxy
	7214E6w05fHAJexowCE4wfUGQ9QrtdQKFNYNCRk6i6wIN5HchN8wZMi5R1OUQ1FbAWdT
	u69g==
Received: by 10.14.184.134 with SMTP id s6mr46984964eem.43.1353947302411;
	Mon, 26 Nov 2012 08:28:22 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o49sm35004362eep.5.2012.11.26.08.28.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Nov 2012 08:28:21 -0800 (PST)
Date: Mon, 26 Nov 2012 17:28:28 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121126162828.GD3401@jama.jama.net>
References: <cover.1353602922.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1353602922.git.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH v2 0/2] ntp fixes
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
X-List-Received-Date: Mon, 26 Nov 2012 16:42:34 -0000
X-Groupsio-MsgNum: 41721
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6Nae48J/T25AfBN4"
Content-Disposition: inline

--6Nae48J/T25AfBN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 22, 2012 at 04:49:33PM +0000, Paul Eggleton wrote:
> Changes since v1:
> * Fix hardcoded paths in scripts
> * Move contents of ntp-bin package to previously empty ntp-utils package
> * Move the ntp server configuration to runtime (/etc/default/ntpdate)
> * Specify configuration files using CONFFILES
> * Remove unused init script path from FILES_ntpdate

Finally no need to see failed ntp* in systemd log, Thanks!

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> The following changes since commit d08ee5a51d4e89ae587d170f8b990626898414=
28:
>=20
>   qt4-embedded: drop bbappend for 4.8.1 (2012-11-22 09:48:36 +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded-contrib paule/ntp
>   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=
=3Dpaule/ntp
>=20
> Paul Eggleton (2):
>   ntp: cleanup recipes and fix SSL support
>   ntp: make servers configurable and default to none configured
>=20
>  meta-networking/recipes-support/ntp/files/ntp      |   31 -------
>  meta-networking/recipes-support/ntp/files/ntp.conf |    2 +-
>  meta-networking/recipes-support/ntp/files/ntpdate  |   11 ++-
>  .../recipes-support/ntp/files/ntpdate.default      |    7 ++
>  .../recipes-support/ntp/files/openssl-check.patch  |   59 ++++++++++++
>  .../recipes-support/ntp/ntp-ssl_4.2.6p5.bb         |   11 ---
>  meta-networking/recipes-support/ntp/ntp.inc        |   94 ++++++++++++++=
++----
>  meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb |   44 +--------
>  8 files changed, 154 insertions(+), 105 deletions(-)
>  delete mode 100755 meta-networking/recipes-support/ntp/files/ntp
>  create mode 100644 meta-networking/recipes-support/ntp/files/ntpdate.def=
ault
>  create mode 100644 meta-networking/recipes-support/ntp/files/openssl-che=
ck.patch
>  delete mode 100644 meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p5.bb
>=20
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

--6Nae48J/T25AfBN4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCzmKwACgkQN1Ujt2V2gBwPpgCeM2CHrFmQDKVTae23sTGLN3Vf
ylUAnR+qz2MedmW0IysaO/qG1+SkEHGh
=x1Xe
-----END PGP SIGNATURE-----

--6Nae48J/T25AfBN4--
