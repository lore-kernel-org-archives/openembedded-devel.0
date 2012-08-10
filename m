Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SzmJa-0005vS-GF
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 12:19:34 +0200
Received: by weyr6 with SMTP id r6so819496wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 03:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JDeA/F99RD6f+V6xR3hcbeUku/AHfbvcQ4t0rwkxjOA=;
	b=AczyLyZbshAUsG5h9RNNk1zo0nClIulS5X5WECRIgjufn2sx5QvD4xMJZeGiLZlper
	tupHPcOby1DH25zImnQzHlOlJY7c0F4n5V82iuTlCSKjwpzx3kwcoVy3dqa6XF3Nsphu
	GvP3I+o1lXKfA/aNPrtm/iFoSXuz6ASI5tCDrTaLKcTFgoSmHRxhA1F79icihbXgENxM
	+sl/1gp37TAXjkTKoVIXHp9c3taW9nLghliU0X8Rtl+Q9c1szL1UX3wuQE5sPGRA8syI
	hdiL6sUTjpipngoK23fRC8ljByU1XT44XA//vqRHyTYuLDlb4UJd6q1Wa/Ai81akosNy
	OAeA==
Received: by 10.180.103.4 with SMTP id fs4mr4807326wib.16.1344593264999;
	Fri, 10 Aug 2012 03:07:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t7sm10245019wix.6.2012.08.10.03.07.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 03:07:43 -0700 (PDT)
Date: Fri, 10 Aug 2012 12:07:45 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120810100745.GA6176@jama.jama.net>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1342645937.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-efl][RFC 00/14] Newer EFL if someone is interested - just RFC now
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
X-List-Received-Date: Fri, 10 Aug 2012 10:19:34 -0000
X-Groupsio-MsgNum: 40124
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Content-Disposition: inline

--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 18, 2012 at 11:19:10PM +0200, Martin Jansa wrote:
> It's RFC because I've tested it only with efl-from-svn-recipes.inc in use=
=20
> (1.2.1 EFL isn't probably compatible with this new e-wm and stuff..) and
> without rebuilding from scratch (will probably force me to fix some other
> recipes too because of new automake etc.. :/)
>=20
> Next EFL release is planed for end of July and first E17 release after th=
at=20
> so it's time for interested people to test their changes, but I'll probab=
ly=20
> send final pull-request only when there are beta/rc tarballs too (so that=
=20
> efl-from-svn-recipes.inc won't be needed).

Small update on this:

that branch has now 43 commits to keep all efl stuff building (quite a
few EFL_SRCREV bumps followed with changes in recipes needed for new
versio - I don't plan to squash them together as it's easier to see why
some changes were needed this way).

And raster said that maybe today he'll cut alpha releases.

My tests with current EFL_SRCREVs shows significant improvements, so as
soon as I test those alpha tarballs I'll send jansa/efl pull request.

And then just update recipes for beta/final later in follow up patches.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAk3XEACgkQN1Ujt2V2gByI6gCdF7y68DZElXxVQiFU6iegS+PP
qlUAoJAc87o7W/BNBLgSuA8m2kh1eFhS
=fxgu
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
