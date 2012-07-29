Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SvRph-0004DH-HD
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Jul 2012 13:38:49 +0200
Received: by weyr6 with SMTP id r6so2748824wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jul 2012 04:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bvEOJhu0PJKgk7maxvI5totEGoF+M6LNNqobfJ/MVkQ=;
	b=j1Ek8GgSrUFUdI68K53U5hlhvPpv/zQ+7TSmMCxnqftXzR2IpEpvEEUZXWv0lpTbRC
	WnCqyYnkeKXzlXOoBt2L2fVKd6G1fqlhCUrEfjgn2XYo6hO3+o8lT0YBXzJ0iJA0LMOv
	lrsU2JpNDVXdnPP9HHywmKr6SUq+9sB0iiZ90UnIe37/vENg9ufsqKJusAzUIVYYrzHK
	aj7cHc4IawPDUTxLAR2zHjU8/fSS5/QdBifACxPCsAHw9ol/409EzEL/vV9eXL4f03SE
	JvTBLWAtWRFpIF+udvcggjeC8voY5TOI3hPDOFY4Giuw4qbeQNnpBqw+Jh9Uj1GcZvKD
	oW5Q==
Received: by 10.180.83.106 with SMTP id p10mr34785997wiy.21.1343561235014;
	Sun, 29 Jul 2012 04:27:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t7sm14694952wix.6.2012.07.29.04.27.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Jul 2012 04:27:13 -0700 (PDT)
Date: Sun, 29 Jul 2012 13:27:08 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120729112708.GD3261@jama.jama.net>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<ju8ja5$832$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <ju8ja5$832$1@dough.gmane.org>
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
X-List-Received-Date: Sun, 29 Jul 2012 11:38:49 -0000
X-Groupsio-MsgNum: 39912
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WChQLJJJfbwij+9x"
Content-Disposition: inline

--WChQLJJJfbwij+9x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 19, 2012 at 11:16:53AM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 18-07-12 23:19, Martin Jansa schreef:
> > It's RFC because I've tested it only with efl-from-svn-recipes.inc in u=
se
> >  (1.2.1 EFL isn't probably compatible with this new e-wm and stuff..)
> > and without rebuilding from scratch (will probably force me to fix some
> > other recipes too because of new automake etc.. :/)
> >=20
> > Next EFL release is planed for end of July and first E17 release after
> > that so it's time for interested people to test their changes, but I'll
> > probably send final pull-request only when there are beta/rc tarballs t=
oo
> > (so that efl-from-svn-recipes.inc won't be needed).
>=20
> Any volunteers for adding EPhysics?

I haven't looked into EPhysics as I don't have any use for it, but with
last jansa/efl update, I've added evas-generic-loaders, because evas
doesn't have native svg support anymore (as we probably won't package esvg)

BTW: this branch is regulary updated (sometimes rebased) to track latest
EFL.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WChQLJJJfbwij+9x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAVHgwACgkQN1Ujt2V2gBygDwCfVIRLYNhhBVKYOdsU+UYFzyyQ
XkoAniQsc8gCViLi6o2jsjzh/sTUT2zx
=qvhk
-----END PGP SIGNATURE-----

--WChQLJJJfbwij+9x--
