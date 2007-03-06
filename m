Received: from [65.254.253.133] (helo=mailout16.yourhostingaccount.com)
	by linuxtogo.org with esmtp (Exim 4.63) (envelope-from
	<SRS0=KdBdJl=IK=thegnar.org=markgross@yourhostingaccount.com>)
	id 1HOR4p-00004t-NK for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2007 05:15:03 +0100
Received: from mailscan44.yourhostingaccount.com ([10.1.15.44]
	helo=mailscan44.yourhostingaccount.com)
	by mailout16.yourhostingaccount.com with esmtp (Exim)
	id 1HOR4o-0000yF-NH for openembedded-devel@lists.openembedded.org;
	Mon, 05 Mar 2007 23:15:02 -0500
Received: from authsmtp08.yourhostingaccount.com ([10.1.18.8] ident=exim)
	by mailscan44.yourhostingaccount.com with spamscanlookuphost (Exim)
	id 1HOR4o-0004vi-N4 for openembedded-devel@lists.openembedded.org;
	Mon, 05 Mar 2007 23:15:02 -0500
Received: from authsmtp08.yourhostingaccount.com ([10.1.18.8]
	helo=authsmtp08.yourhostingaccount.com)
	by mailscan44.yourhostingaccount.com with esmtp (Exim)
	id 1HOR4n-0004uu-6h; Mon, 05 Mar 2007 23:15:01 -0500
Received: from pool-71-117-247-154.ptldor.fios.verizon.net ([71.117.247.154]
	helo=mgross-desktop)
	by authsmtp08.yourhostingaccount.com with esmtpa (Exim)
	id 1HOR4m-00040h-J1; Mon, 05 Mar 2007 23:15:00 -0500
Received: by mgross-desktop (Postfix, from userid 1000)
	id B92C6C2E59; Mon,  5 Mar 2007 20:15:02 -0800 (PST)
Date: Mon, 5 Mar 2007 20:15:02 -0800
From: Mark Gross <markgross@thegnar.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070306041502.GA542@thegnar.org>
References: <1173131731.5842.140.camel@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <1173131731.5842.140.camel@localhost.localdomain>
User-Agent: Mutt/1.5.11
X-EN-UserInfo: 797c2c580f2f40de3d8825fee4eaf462:2545611f8b0606d1227160eb92fd62ea
X-EN-AuthUser: markgross
Sender: Mark Gross <markgross@thegnar.org>
X-EN-OrigIP: 71.117.247.154
X-EN-OrigHost: pool-71-117-247-154.ptldor.fios.verizon.net
Cc: openembedded-devel <openembedded-devel@openembedded.org>,
	bitbake-dev <bitbake-dev@lists.berlios.de>
Subject: Re: Bitbake Request for Testing of bitbake 1.8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Mar 2007 04:15:04 -0000
X-Groupsio-MsgNum: 1577
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline

--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 05, 2007 at 09:55:31PM +0000, Richard Purdie wrote:
> I've been putting this off for a while but bitbake trunk has branched
> for a new stable release series, 1.8.x which will ultimately replace the
> 1.6.x stable series.
>=20
> Could people give the 1.8 branch in bitbake a try? If you have problems,
> I will do my best to resolve them before 1.8.0 is released. I estimate
> 1.8.0 is say a week away, I want to release soon.
>=20
> For what its worth, some of the core devs have been using trunk for a
> while with success and its been used in poky without incident for a
> while now too.
>=20
>=20
> What's will be new in 1.8?
>=20
> * We basically rewrote half the core. Bitbake used to calculate the
> build path "on the fly" which was no use for multithreading, its now
> been replaced with a calculation in advance (taskdata and runqueue).
> This allows it to do simplistic multithreading. Set BB_NUMBER_THREADS =3D
> "100" in local.conf to lock your machine up or something lower to try
> multithreading ;-).
>=20
> * The -g dependency graph output has changed and now includes a task
> dependency file. Has anyone got a good way to view these graphically
> yet?
>=20
> * The fetchers were refactored removing duplicate code and standardising
> behaviour.
>=20
> * Numerous code changes were made internally to refactor/modularise the
> code. This will be useful in future developments (the last code I
> checked in prepares for the UI).
>=20
>=20
> What will happen in trunk?
>=20
> I've branched as I have some fairly invasive changes planned for trunk.
> The aim of these is to split bitbake into a client/server and look at
> UIs. Whilst 1.7.x was very stable more recently, 1.9.x is going to
> break ;-).=20
>=20
> The current UI code I have is about as secure as publishing your IP
> address and root password on the web and leaving the telnet port open so
> when I check it in, use at your own risk. I will accept patches to
> address these issues ;-). My main concern is the structure at the moment
> rather than security or functionality which can come later.
>=20
>=20
> So please do test the bitbake 1.8 branch and lets make it as successful
> as 1.6!
>=20

FYI 1.8 built my modified slugos-image without any problems. =20

E Build Configuration:
BB_VERSION     =3D "1.7.999"
OE_REVISION    =3D "f1ac1dc451ca12e3634137ddce1c0caf04f46ee9"
TARGET_ARCH    =3D "armeb"
TARGET_OS      =3D "linux"
MACHINE        =3D "nslu2be"
DISTRO         =3D "slugos"
DISTRO_VERSION =3D "4.3-beta"
TARGET_FPU     =3D "soft"


Are there special configurations or settings you would like to see
tried?

--mgross


--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFF7OrGhK5OsmQOmSARAokpAJ90Gq/rFmFmWzTB616vi8Ol4hMKxQCfbYJZ
kZHKG1AItfUpWGhljzOiSsQ=
=e7z1
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
