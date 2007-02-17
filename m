Received: from [65.254.253.133] (helo=mailout16.yourhostingaccount.com)
	by linuxtogo.org with esmtp (Exim 4.63) (envelope-from
	<SRS0=yJUEIq=HZ=thegnar.org=markgross@yourhostingaccount.com>)
	id 1HIU2k-0004RC-VK for openembedded-devel@lists.openembedded.org;
	Sat, 17 Feb 2007 19:12:21 +0100
Received: from mailscan34.yourhostingaccount.com ([10.1.15.34]
	helo=mailscan34.yourhostingaccount.com)
	by mailout16.yourhostingaccount.com with esmtp (Exim)
	id 1HIU2k-0008Na-1Y for openembedded-devel@lists.openembedded.org;
	Sat, 17 Feb 2007 13:12:18 -0500
Received: from authsmtp11.yourhostingaccount.com ([10.1.18.11] ident=exim)
	by mailscan34.yourhostingaccount.com with spamscanlookuphost (Exim)
	id 1HIU2k-0006cp-3Q for openembedded-devel@lists.openembedded.org;
	Sat, 17 Feb 2007 13:12:18 -0500
Received: from authsmtp11.yourhostingaccount.com ([10.1.18.11]
	helo=authsmtp11.yourhostingaccount.com)
	by mailscan34.yourhostingaccount.com with esmtp (Exim)
	id 1HIU2j-0006ch-10 for openembedded-devel@lists.openembedded.org;
	Sat, 17 Feb 2007 13:12:17 -0500
Received: from pool-71-117-247-154.ptldor.fios.verizon.net ([71.117.247.154]
	helo=mgross-desktop)
	by authsmtp11.yourhostingaccount.com with esmtpa (Exim)
	id 1HIU2i-0000B2-Ln for openembedded-devel@lists.openembedded.org;
	Sat, 17 Feb 2007 13:12:16 -0500
Received: by mgross-desktop (Postfix, from userid 1000)
	id 1ADBFC2E39; Sat, 17 Feb 2007 10:12:08 -0800 (PST)
Date: Sat, 17 Feb 2007 10:12:08 -0800
From: Mark Gross <markgross@thegnar.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070217181208.GA4616@thegnar.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.11
X-EN-UserInfo: 797c2c580f2f40de3d8825fee4eaf462:2545611f8b0606d1227160eb92fd62ea
X-EN-AuthUser: markgross
Sender: Mark Gross <markgross@thegnar.org>
X-EN-OrigIP: 71.117.247.154
X-EN-OrigHost: pool-71-117-247-154.ptldor.fios.verizon.net
Subject: getting started with bug reports in OE
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
X-List-Received-Date: Sat, 17 Feb 2007 18:12:27 -0000
X-Groupsio-MsgNum: 1405
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline

--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I'm moving from nslug to oe .dev branch and I'm trying to ramp up on all
the bitbake and configuration details.  While bringing up a build of
slugos-image I had to debug an issue with udev-100.

udev-100 would fail on the comple because of a link time issue relating
to extras/volume_id.  I hacked a quick fix into packages/udev/udev_100.bb, =
where I changed

UDEV_EXTRAS =3D "extras/firmware/ extras/scsi_id/ extras/volume_id/ extras/=
run_directory/"
to
UDEV_EXTRAS =3D "extras/firmware/ extras/scsi_id/ extras/run_directory/"

This is good for my build, but my questions are now
1) is this the right way to fix this?
and if so then=20
2) how do I share this fix back to the OE community?

Thanks for any advice.


--mgross


--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFF10V4hK5OsmQOmSARAiRdAJsHl8X6x4VpAxk30wFNo0w27M5t+ACfZTRc
LNqciQ3VRuA8CMXwguktVVQ=
=jnj1
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
