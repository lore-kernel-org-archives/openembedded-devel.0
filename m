Received: from [65.254.253.112] (helo=mailout14.yourhostingaccount.com)
	by linuxtogo.org with esmtp (Exim 4.67) (envelope-from
	<SRS0=jthTDO=NQ=thegnar.org=markgross@yourhostingaccount.com>)
	id 1IMrpa-0002uN-QZ; Sun, 19 Aug 2007 22:57:07 +0200
Received: from mailscan04.yourhostingaccount.com ([10.1.15.4]
	helo=mailscan04.yourhostingaccount.com)
	by mailout14.yourhostingaccount.com with esmtp (Exim)
	id 1IMron-0006rY-Cy; Sun, 19 Aug 2007 16:56:17 -0400
Received: from impout03.yourhostingaccount.com ([10.1.55.3]
	helo=impout03.yourhostingaccount.com)
	by mailscan04.yourhostingaccount.com with esmtp (Exim)
	id 1IMrom-0007ru-S6; Sun, 19 Aug 2007 16:56:16 -0400
Received: from authsmtp08.yourhostingaccount.com ([10.1.18.8])
	by impout03.yourhostingaccount.com with NO UCE
	id dwvu1X0050ASqTN0000000; Sun, 19 Aug 2007 16:55:54 -0400
X-EN-OrigOutIP: 10.1.18.8
X-EN-IMPSID: dwvu1X0050ASqTN0000000
Received: from pool-71-245-102-239.ptldor.fios.verizon.net ([71.245.102.239]
	helo=mgross-desktop)
	by authsmtp08.yourhostingaccount.com with esmtpa (Exim)
	id 1IMroR-0005Mj-3p; Sun, 19 Aug 2007 16:55:55 -0400
Received: by mgross-desktop (Postfix, from userid 1000)
	id 6ADECC2E3B; Sun, 19 Aug 2007 13:56:05 -0700 (PDT)
Date: Sun, 19 Aug 2007 13:56:05 -0700
From: Mark Gross <markgross@thegnar.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070819205605.GA8181@thegnar.org>
References: <44C22A1C-2EC8-41C9-AC47-17C35A1389A2@selfish.org>
MIME-Version: 1.0
In-Reply-To: <44C22A1C-2EC8-41C9-AC47-17C35A1389A2@selfish.org>
User-Agent: Mutt/1.5.11
X-EN-UserInfo: 797c2c580f2f40de3d8825fee4eaf462:2545611f8b0606d1227160eb92fd62ea
X-EN-AuthUser: markgross
Sender: Mark Gross <markgross@thegnar.org>
X-EN-OrigIP: 71.245.102.239
X-EN-OrigHost: pool-71-245-102-239.ptldor.fios.verizon.net
Cc: openembedded-users@lists.openembedded.org,
	bitbake-dev <bitbake-dev@lists.berlios.de>
Subject: Re: [ANN] BitBake 1.8.8 available for download
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
X-List-Received-Date: Sun, 19 Aug 2007 20:57:07 -0000
X-Groupsio-MsgNum: 2713
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline

--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 18, 2007 at 09:12:45PM +0200, Holger Freyther wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> For Your Information,
>=20
> Version 1.8.8 of BitBake from the stable branch is available for =20
> download [1]. Thanks to the hard labor of Richard this release =20
> contains support for SRCREV, bug fixes and speed improvements. For =20
> more changes please consult the ChangeLog.
>=20
> This release adds a requirement on pysqlite2 for sqlite3. On most =20
> distributions this package is called python-pysqlite2. It is required =20
> to support concurrent access to persistent data. This is a =20
> requirement of the SRCREV implementation.
>=20
> We have tested the branch on old and new OE metadata and it should =20
> work for you as well. Please send comments and issues to the bitbake-=20
> dev mailinglist and file bug reports.
>=20
>=20
> kind regards
> 	z.
>=20
>=20

version dependencies?

I'm running Ubuntu 6.0.6.1 and I'm getting the following error:
mgross@mgross:~/_dev/oe$ bitbake
Traceback (most recent call last):
File "/home/mgross/_dev/oe/bitbake/bin/bitbake", line 134, in ?
main()
File "/home/mgross/_dev/oe/bitbake/bin/bitbake", line 114, in
main
cooker =3D bb.cooker.BBCooker(configuration)
File "/home/mgross/_dev/oe/bitbake/lib/bb/cooker.py", line
65, in __init__
self.parseConfigurationFile( os.path.join( "conf", "bitbake.conf" ) )
File "/home/mgross/_dev/oe/bitbake/lib/bb/cooker.py",
line 353, in parseConfigurationFile
bb.fetch.fetcher_init(self.configuration.data)
File "/home/mgross/_dev/oe/bitbake/lib/bb/fetch/__init__.py",
line 97, in fetcher_init pd.delDomain("BB_URI_HEADREVS")
File "/home/mgross/_dev/oe/bitbake/lib/bb/persist_data.py", line 66, in del=
Domain
self.connection.execute("DROP TABLE IF EXISTS %s;" % domain)

BTW I'm running Python 2.4.3 (#2, Oct  6 2006, 07:49:22)

thanks,

--mgross
>=20
>=20
>=20
>=20
>=20
> [1]  http://download.berlios.de/bitbake/bitbake-1.8.8.tar.gz and =20
> http://download2.berlios.de/bitbake/bitbake-1.8.8.tar.gz
> PS: 78f6c7507d33e7dcd7e001e7c7c113898114f001d3489e30a2ad556c56139171  =20
> bitbake-1.8.8.tar.gz
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.7 (Darwin)
>=20
> iD8DBQFGx0SvGckbdURWU2oRAiI0AJ9sa8ExX+f8paQYxnohN51WZM3CjQCcCsiW
> 6ZImbCpEX30yCOKJVfnT1vc=3D
> =3D/Hjh
> -----END PGP SIGNATURE-----
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFGyK5lhK5OsmQOmSARAhzSAJwOEMl2FWmDWB3p1fTX22oMi53LOQCfQB8A
bp9ILhJSNLcoWIIkkuSxmoY=
=dvqp
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
