Received: from ns0.zlo.nu ([85.17.141.90] helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcolz@zlo.nu>) id 1NAitK-0001tf-1D
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 12:40:09 +0100
Received: by mzh.zlo.nu (Postfix, from userid 1000)
	id 7AC16140B0; Wed, 18 Nov 2009 12:38:42 +0100 (CET)
Date: Wed, 18 Nov 2009 12:38:42 +0100
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091118113842.GB17441@zlo.nu>
References: <1258467896-28370-1-git-send-email-zlo@zlo.nu>
	<1258541929.26517.96.camel@mill.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1258541929.26517.96.camel@mill.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: marcolz@zlo.nu
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] cURL: Add 7.19.7 which supports CRLs.
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
X-List-Received-Date: Wed, 18 Nov 2009 11:40:09 -0000
X-Groupsio-MsgNum: 14416
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mojUlQ0s9EVzWg2t"
Content-Disposition: inline

--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2009 at 10:58:49AM +0000, Phil Blundell wrote:
> On Tue, 2009-11-17 at 15:24 +0100, Marc Olzheim wrote:
> > From: Marc Olzheim <marc@iphion.nl>
> >=20
> > Also remove unused curl checksums for older versions.
> > ---
> >  conf/checksums.ini          |   32 ++++----------------------------
> >  recipes/curl/curl_7.19.7.bb |    5 +++++
> >  2 files changed, 9 insertions(+), 28 deletions(-)
> >  create mode 100644 recipes/curl/curl_7.19.7.bb
>=20
> Thanks for the patch.  I checked in the latter half of this but not the
> former: there doesn't seem to be any real merit in removing things from
> checksums.ini.

Ok, could you apply the second hunk in that patch then ? Otherwise curl
7.19.7 will miss its checksum.

I did not add yet another curl-native in my patch because I did not
think that OE needed CRLs to work, but I can send a patch for that as
well of course.

The seoncd hunk:

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 467b97e..c84ee75 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -4742,6 +4742,10 @@ sha256=3D05ad84a9c8d340917370f357ad9fdce5ea595deb11f=
4cb70f946fa48c7b02cd0
 md5=3D8402c1f654c51ad7287aad57c3aa79be
 sha256=3Dea88f48c8415f7d3af482e4d241277b2bdbfaffaf285e8001c88c1376cbc1021
=20
+[http://curl.haxx.se/download/curl-7.19.7.tar.bz2]
+md5=3D79a8fbb2eed5464b97bdf94bee109380
+sha256=3D1a15f94ae3401e3bd6208ce64155c2577815019824bceae7fd3221a12bc54a70
+
 [http://downloads.sourceforge.net/curlftpfs/curlftpfs-0.9.2.tar.gz]
 md5=3Db452123f755114cd4461d56c648d9f12
 sha256=3D4eb44739c7078ba0edde177bdd266c4cfb7c621075f47f64c85a06b12b3c6958

--
Marc

--mojUlQ0s9EVzWg2t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksD3MIACgkQezjnobFOgrHkEwCgg6jY4S0M25ldNdOxKn5cGxdU
sw4AoMYAc9bVQFXc/8FzXuGnZEUvdGpV
=XJ4S
-----END PGP SIGNATURE-----

--mojUlQ0s9EVzWg2t--
