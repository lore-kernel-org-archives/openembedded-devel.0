Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thebohemian@gmx.net>) id 1KsfWH-0003mr-DL
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Oct 2008 17:21:09 +0200
Received: (qmail invoked by alias); 22 Oct 2008 15:20:40 -0000
Received: from p579E1974.dip.t-dialin.net (EHLO [192.168.10.21])
	[87.158.25.116]
	by mail.gmx.net (mp053) with SMTP; 22 Oct 2008 17:20:40 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+q/1llR6mqT2eIJKF0xM3OU0G5iTzFinsyuaf9Ex
	MMMc2B71WhegCH
Message-ID: <48FF44C8.2000604@gmx.net>
Date: Wed, 22 Oct 2008 17:20:40 +0200
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Thunderbird 2.0.0.17 (X11/20080925)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	openembedded-users@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.62
Subject: reduce the monkey work: BPN/BP available
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
X-List-Received-Date: Wed, 22 Oct 2008 15:21:10 -0000
X-Groupsio-MsgNum: 6346
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig1F6C568376D148DAFC4DDB78"

--------------enig1F6C568376D148DAFC4DDB78
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi,
I just pushed the patches that adds the BP (base package) and BPN (base
package name) variables.

They are there to reduce the amount of 'monkey work' needed for a
-native recipe that has a corresponding (and very similar) non-native
recipe.

I plan to add this to the manual soon but describe it here so you can
use before it ends up there.

The problem with -native (also for -initial, -cross and -intermediate
suffix) recipes ist that they do not work correctly in regard to
SRC_URI, S and FILESPATH when those make use of P or PN.

Current workaround is to use the literal package name instead of the
variable and/or redefine some variables in the -native recipe. The
latter is what Koen called the 'monkey work'.

For future recipes you should consider using BP when you want a P that
does not change in recipes ending with -native, -initial, -cross or
-intermediate (more suffixes can be supported if needed, look at
base.bbclass).

I also added the neccessary things to make dealing with patches that
should be applied to both the non-native and the native recipe easier.
The search path includes BPN and then BP. I added them after the entries
for P and PN.

So for a recipe called foo-native_7.33.bb patches will be searched in
this order automatically:
=2E/foo-native-7.33
=2E/foo-native
=2E/foo-7.33
=2E/foo
(and the others like ./files and whatnot)

The BP/BPN stuff does not affect existing recipes since they do not use
those variables. Obviously it would be nice to simplify them when a new
package version is added or such.

Regards
Robert


--------------enig1F6C568376D148DAFC4DDB78
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFI/0TIG9cfwmwwEtoRAvysAJ9vOGWXIs5twcAqPI4A1irlZ5u2FwCeJp6p
jVc6+t2Mut4rxetAYiYnikU=
=If/m
-----END PGP SIGNATURE-----

--------------enig1F6C568376D148DAFC4DDB78--
