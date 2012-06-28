Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SkIsY-0002la-M0
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jun 2012 19:51:42 +0200
Received: by wgbdr1 with SMTP id dr1so2247843wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2012 10:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tTOSgmNJtjH2ctVIeo/EL+M/bjs5ZOXM+GM+ohglR3c=;
	b=MByTNjV625+9oRxdRtDDtiSUclwNQa4Qlh+PcQFSlmzGDz1D5R/g2bnpa3++SDll/2
	Dxu/xkLcIPGZrkFF3ZHsl+DCfHCfNjNrYJjq5cRI3auKI1TIiamUbjDVadjQ+D1NhXvL
	Tibo0hVzkaVzY5sLpgbNCRI+GFAE1pKUvFTMC0+7wgKE7bBSLcjcZka/GDbZqNo3WPhR
	q2JHNCZX2+mUstezuDe4Bq2Fe05Q0ikV8mcqx4QY8j5TKDTmJbOT1ebBpuif/lw5qojd
	Rv/QrPwXRLFxafsvVNEiWwGSzlDAtuWkQYZzBCO1MjRoadQ93z0GLuIbj1N8Clptcnyw
	Ef2A==
Received: by 10.216.143.213 with SMTP id l63mr1662502wej.117.1340905248007;
	Thu, 28 Jun 2012 10:40:48 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y2sm1282730wix.7.2012.06.28.10.40.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jun 2012 10:40:47 -0700 (PDT)
Date: Thu, 28 Jun 2012 19:40:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120628174041.GB24537@localhost.jama.net>
References: <CADZ6=avV5=3g9CkMMDc9cKLUpw_-Bk_q7fb5MceJmtR0gH6YvQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADZ6=avV5=3g9CkMMDc9cKLUpw_-Bk_q7fb5MceJmtR0gH6YvQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: meta-oe breakage since oe-core removed gcc-4.6
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
X-List-Received-Date: Thu, 28 Jun 2012 17:51:42 -0000
X-Groupsio-MsgNum: 39436
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O5XBE6gyVG5Rl6Rj"
Content-Disposition: inline

--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 28, 2012 at 03:06:29PM +0200, Thilo Fromm wrote:
> Hi meta-openembedded maintainers,
>=20
> meta-openembedded buid is currently broken since oe-core removed
> recipes for gcc-4.6, and meta-oe has .bbappends for several gcc 4.6
> recipes now unavailable in oe-core.
>=20
> No matter what's meta-oe's plan to handle this (i.e. move gcc-4.6 into
> meta-oe/toolchain-layer completely vs. remove gcc 4.6 .bbappends
> altogether), the current state - having the .bbappends in meta-oe and
> no original recipes anymore in oe-core - breaks the build. Is this
> going to change anytime soon? In either way?

khem's patches which removed it from oe-core said:
gcc-4.6: Retire into toochain-layer

so I guess he has some patches adding whole recipes to toolchain-layer
(I had a feeling that I've even seen them somewhere, but cannot find
them later).=20

So for now I've removed all .bbappends as I'm using gcc-4.7.1 anyway.

you can cherry-pick this one for now:
http://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Dshr&id=3D=
a31c882c8e336b9ffaa00c074fc24da50deb83a7

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--O5XBE6gyVG5Rl6Rj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/slxkACgkQN1Ujt2V2gByc1QCeKesJrQq6zNB+7Jzz0bBHf0nR
FL8AmgJI1k70t+MsB2IksL7bHi8HlbC0
=qbeU
-----END PGP SIGNATURE-----

--O5XBE6gyVG5Rl6Rj--
