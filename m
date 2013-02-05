Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U2fuw-0000Cb-7n
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2013 11:38:22 +0100
Received: by mail-wi0-f177.google.com with SMTP id hm14so4012820wib.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Feb 2013 02:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mAgkTH/YuCo1Kd0n497f8bJVvV7Jted3Tlht+2Na6Ls=;
	b=KORkxkN68D/I/tCqnWusdCPUQMHYi8+LGrF6gpSSa1b+PlKwnjCv6QjWwC/jV38Q3s
	WPJTF2l3luNeKuHu2n0gpnZMyIjpcGYSdjerKcoITju6eh8A2/nEFX7i+EP4fhb+Epgu
	pYA6wvooOAfE/4b7IKT+ivjs0CKfKwxNM1qQk0NTCapnhHd59PSvMxBgzD3JXW6CjO20
	bluirm9VOKiUDVjASRFnYW7GLGkz1q6V/AgwrVph7FavdScB2JeWLPkhH/ft7Oh+Rdxo
	L+2vKmKQTD5ISRk/8XyPl28BEVlyKHP6UH6DdwkGlB0djc42Z+pJTH/xIEKVXjdEO2hg
	L0GA==
X-Received: by 10.194.171.198 with SMTP id aw6mr41230745wjc.3.1360059753096;
	Tue, 05 Feb 2013 02:22:33 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id w5sm5488048wif.11.2013.02.05.02.22.32
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 02:22:32 -0800 (PST)
Date: Tue, 5 Feb 2013 11:22:32 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130205102232.GN3271@jama>
References: <cover.1359977333.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1359977333.git.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 0/3] Fix use of R* package variables
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
X-List-Received-Date: Tue, 05 Feb 2013 10:38:22 -0000
X-Groupsio-MsgNum: 43000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KaGhPsiNaI6/sRd6"
Content-Disposition: inline

--KaGhPsiNaI6/sRd6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 04, 2013 at 11:29:35AM +0000, Paul Eggleton wrote:
> The package needs to be specified when using R* variables, so fix the
> few cases where it wasn't.

All 3 merged, thanks.

>=20
>=20
>=20
> The following changes since commit 74ec0813562525d02da6ac45eb0237382e98a7=
2f:
>=20
>   xchat: add libsexy to DEPENDS (2013-02-01 17:44:22 +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded-contrib paule/pkgvar-fixes
>   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=
=3Dpaule/pkgvar-fixes
>=20
> Paul Eggleton (3):
>   gnome-vfs: use RPROVIDES correctly
>   tiobench: use RDEPENDS correctly
>   qconnman: use RCONFLICTS correctly
>=20
>  meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb |    2 +-
>  meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb   |    2 +-
>  meta-oe/recipes-qt/qconnman/qconnman-e_git.bb          |    2 +-
>  meta-oe/recipes-qt/qconnman/qconnman_git.bb            |    2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>=20
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

--KaGhPsiNaI6/sRd6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEQ3WgACgkQN1Ujt2V2gBy9dQCePPtt7e7riXNxrxzbKCRHHj1k
ETwAnjr95Riw31J30hTX2bgpl7N06Kf4
=F3g3
-----END PGP SIGNATURE-----

--KaGhPsiNaI6/sRd6--
