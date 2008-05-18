Received: from [65.254.253.234] (helo=mailout08.yourhostingaccount.com)
	by linuxtogo.org with esmtp (Exim 4.69) (envelope-from
	<SRS0=/VCUjl=WB=thegnar.org=markgross@yourhostingaccount.com>)
	id 1Jxsl4-0006c5-7K; Mon, 19 May 2008 01:57:42 +0200
Received: from mailscan16.yourhostingaccount.com ([10.1.15.16]
	helo=mailscan16.yourhostingaccount.com)
	by mailout08.yourhostingaccount.com with esmtp (Exim)
	id 1Jxsix-0004X2-Po; Sun, 18 May 2008 19:55:31 -0400
Received: from impout02.yourhostingaccount.com ([10.1.55.2]
	helo=impout02.yourhostingaccount.com)
	by mailscan16.yourhostingaccount.com with esmtp (Exim)
	id 1Jxsix-0001Fp-HU; Sun, 18 May 2008 19:55:31 -0400
Received: from authsmtp11.yourhostingaccount.com ([10.1.18.11])
	by impout02.yourhostingaccount.com with NO UCE
	id TBvL1Z0010EKrUA0000000; Sun, 18 May 2008 19:55:20 -0400
X-EN-OrigOutIP: 10.1.18.11
X-EN-IMPSID: TBvL1Z0010EKrUA0000000
Received: from pool-71-117-215-48.ptldor.fios.verizon.net ([71.117.215.48]
	helo=desktop) by authsmtp11.yourhostingaccount.com with esmtpa (Exim)
	id 1Jxsil-0008Pp-4K; Sun, 18 May 2008 19:55:20 -0400
Received: by desktop (sSMTP sendmail emulation);
	Sun, 18 May 2008 16:56:08 -0700
Date: Sun, 18 May 2008 16:56:08 -0700
From: mark gross <markgross@thegnar.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080518235608.GB11599@thegnar.org>
References: <1210775543.7097.29.camel@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <1210775543.7097.29.camel@localhost.localdomain>
User-Agent: Mutt/1.5.15+20070412 (2007-04-11)
X-EN-UserInfo: 797c2c580f2f40de3d8825fee4eaf462:2545611f8b0606d1227160eb92fd62ea
X-EN-AuthUser: markgross
Sender: mark gross <markgross@thegnar.org>
X-EN-OrigIP: 71.117.215.48
X-EN-OrigHost: pool-71-117-215-48.ptldor.fios.verizon.net
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Re: Stable Branch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sun, 18 May 2008 23:57:42 -0000
X-Groupsio-MsgNum: 5211
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+pHx0qQiF2pBVqBT"
Content-Disposition: inline

--+pHx0qQiF2pBVqBT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

NSLU2 build deltas between
--branch org. org.openembedded.stable and
--branch org. org.openembedded.dev

I think this is more of a bug report against org.openembedded.dev than
anything.  Basically I can add python and python-pyseral to the
RDEPENDS fro the stable branch and end up with a slugos-image that
builds and boots on my nslu2, where if I do tthe same thing with the
dev branch I end up with a root file system bloated too much to fit.

I've done a little debugging and it seems that the culprit is term
info sucked in by implicit dependencies on terminfo that result in a
lot of rootfs bloat.

--mgross


On Wed, May 14, 2008 at 03:32:23PM +0100, Richard Purdie wrote:
> Just to make things clear the stable branch has the full support of the
> OE core team. We're aware some members of the community are vocal in
> their dislike of the way its being run but these do not reflect the
> views of the majority. To clarify the position with the bugzilla, it
> remains the place to submit and track OE bugs, be them in .dev, stable
> or any other branch. If any branch has a submission procedure for
> changes in addition to that, that is up to the maintainers of the
> branch.
>=20
> We'd like to ask people to work together to make the stable branch a
> success and make best use of our limited resources.
>=20
> --=20
> The OE Core Team
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--+pHx0qQiF2pBVqBT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIMMIYhK5OsmQOmSARAsgMAJ4+9yc7satm8iMXV15YRG61uaIMMACgjAf9
x9NHnF6WDb1X2fQQn+jZZ9o=
=5M6i
-----END PGP SIGNATURE-----

--+pHx0qQiF2pBVqBT--
