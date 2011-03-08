Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <thebohemian@gmx.net>) id 1Pwqlw-0003cv-SW
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Mar 2011 07:51:56 +0100
Received: (qmail invoked by alias); 08 Mar 2011 06:50:20 -0000
Received: from 168.163.71-86.rev.gaoland.net (EHLO [192.168.42.71])
	[86.71.163.168]
	by mail.gmx.net (mp022) with SMTP; 08 Mar 2011 07:50:20 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX19HokABe7ZHUq/BBXI5IwFqLRPBxhbkGoOvHSsEDG
	GtoUalXPTpIKAD
Message-ID: <4D75D1A7.9040103@gmx.net>
Date: Tue, 08 Mar 2011 07:50:15 +0100
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 1.1.2
X-Y-GMX-Trusted: 0
Subject: libffi-native 3.0.9 fails to build on at least x86_64
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
X-List-Received-Date: Tue, 08 Mar 2011 06:51:57 -0000
X-Groupsio-MsgNum: 29977
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig27FD46ED17881757C132238B"

--------------enig27FD46ED17881757C132238B
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi,
I tried building libffi-native on an Ubuntu 10.04 amd64 box (during
angstrom build for pandaboard) and it fails. Investigation found out
that during libffi's configure it will symlink 'src/x86/ffitarget.h' to
'include/ffitarget.h'. Unfortunately this will create a broken softlink
because 'src' and 'include' are on the same directory level. I manually
corrected the softlink to '../src/x86/ffitarget.h' and then I could
continue the build.

Clearly this is not what should happen. Anyone an idea why ffi does that?=


(For testing purposes I tried brand new libffi 3.0.10rc8 and it shows
exactly the same error).

Regards,
Robert


--------------enig27FD46ED17881757C132238B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk110aoACgkQG9cfwmwwEtrOqgCglU/dsdonjj0iQZ6AvLxc9/v0
XwwAn3MMcpXNihuyaoQ6lsOeUi33nHH5
=dFUq
-----END PGP SIGNATURE-----

--------------enig27FD46ED17881757C132238B--
