Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1Ju5Tt-00071j-IS
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 May 2008 14:44:17 +0200
Received: (qmail invoked by alias); 08 May 2008 12:43:34 -0000
Received: from brln-4db884d9.pool.einsundeins.de (EHLO [192.168.4.110])
	[77.184.132.217]
	by mail.gmx.net (mp010) with SMTP; 08 May 2008 14:43:34 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+cHgpPTVycLiYn55iQN2XjoFVXKhEJgY18D4KR+R
	u8APtMX9pDG5bS
Message-ID: <4822F56F.4010304@gmx.net>
Date: Thu, 08 May 2008 14:43:27 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.12 (X11/20080420)
MIME-Version: 1.0
To: Using OE <openembedded-users@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: add midpath 0.3 soon and then dump midpath 0.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Thu, 08 May 2008 12:44:18 -0000
X-Groupsio-MsgNum: 5120
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig5A7017FBB01809A7D0F9F81E"

--------------enig5A7017FBB01809A7D0F9F81E
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
I was helping Guillaume Legris with their build script. This work will
make it trivial to write proper recipes in OE.

I would like to include MIDPath 0.3 when it is released and get rid of
version 0.1. The reason is that the midpath recipes are effectively
rewriting the its build system and are a nightmare to maintain. This
would be worse when we have eg. midpath-cldc_0.1 and midpath-cldc_0.3
which would look very different.

Please speak out loudly if you are against removing midpath 0.1 from the
development branch of OE (I will move the 0.1 recipes (and patches) to
obsolete/ first, of course.).

Btw: There are midpath 0.2 recipes in our Jalimo overlay. I did not
manage to merge those into OE because they are also very complicated
(but more structured) and I could not get agreement on removing 0.1 for
them. The good news is that the things I learned while doing the 0.2
recipes have been applied when changing the upstream build script. So
from 0.3 on it will be much easier to maintain midpath recipes.

Regards
Robert


--------------enig5A7017FBB01809A7D0F9F81E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFIIvVyG9cfwmwwEtoRCDQeAJ4z5ewG/Ou3fTrFNHg3QIV4aq1zQACeOq9/
uby54ZMNvMs8c6gkBMy9sbs=
=YIDU
-----END PGP SIGNATURE-----

--------------enig5A7017FBB01809A7D0F9F81E--
