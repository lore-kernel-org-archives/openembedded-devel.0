Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <thebohemian@gmx.net>) id 1OPAMI-0003FD-MN
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jun 2010 10:22:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id DE60140008230
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jun 2010 10:17:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id D6192400057EB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jun 2010 10:17:07 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CQGx5kfyCWyP
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jun 2010 10:17:07 +0200 (CEST)
Received: from [192.168.4.51] (entw2.tarent.buero [192.168.4.51])
	by ugs.tarent.de (Postfix) with ESMTPSA id 9DBB740008230
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jun 2010 10:17:07 +0200 (CEST)
Message-ID: <4C19DA49.3020206@gmx.net>
Date: Thu, 17 Jun 2010 10:18:17 +0200
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100423 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 212.79.178.249
X-SA-Exim-Mail-From: thebohemian@gmx.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_FAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: problem with SHLIBs and RDEPENDS
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
X-List-Received-Date: Thu, 17 Jun 2010 08:24:29 -0000
X-Groupsio-MsgNum: 20226
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig241E848C4637EEC7A82889C8"

--------------enig241E848C4637EEC7A82889C8
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi,
I am trying to make the OpenJDK recipes 'OE ready'. One hard issue I am
facing has to do with the shlibs mechanism in OE.

In order to get OpenJDKs dependencies right its libraries and binaries
are checked for library dependencies. That is all fine and I would love
to activate that.

Actually we have three kinds of OpenJDK builds atm:
 - zero (interpreter only; but with enhancements on ARM to make it fly)
 - shark (zero interpreter plus JIT based on LLVM)
 - cacao (completely different runtime)

The binary version of those recipes all bring a libjvm.so. Theoretically
a user could install all three packages (you can do that in
Debian/Ubuntu for example). However when the shlibs mechanism is
activated it puts the first built openjdk variant into a registry and
all subsequent variants get a hard runtime dependency on that package
(e.g. openjdk-shark will depend on openjdk-zero if I built zero first)
although there is no technical reason for this.

So my question is: How can I solve this issue without resorting to:

EXCLUDE_FROM_SHLIBS =3D "1"

which I currently use and which has the bad side-effect of not having
openjdk's own dependencies. :(

Regards,
Robert


--------------enig241E848C4637EEC7A82889C8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAkwZ2k0ACgkQG9cfwmwwEtqbmACfcLny8vygcMR1zU7Fxm3wJzxl
KKIAnjQsHz5pkzLuFOgOWnreG0ACtwGL
=rcuR
-----END PGP SIGNATURE-----

--------------enig241E848C4637EEC7A82889C8--
