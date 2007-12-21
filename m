Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.68)
	(envelope-from <theBohemian@gmx.net>) id 1J5dPu-0005SY-Rw
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2007 09:39:39 +0100
Received: (qmail invoked by alias); 21 Dec 2007 08:34:25 -0000
Received: from e178102245.adsl.alicedsl.de (EHLO [192.168.4.101])
	[85.178.102.245]
	by mail.gmx.net (mp034) with SMTP; 21 Dec 2007 09:34:25 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/RuBFUZEzRbN6kme6UAT+19KRt/19/80bG1VK/Ot
	f9KWg7H6ideejt
Message-ID: <476B7A8D.4070603@gmx.net>
Date: Fri, 21 Dec 2007 09:34:21 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.6 (X11/20071009)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: RFC: feature request - wrap sources
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
X-List-Received-Date: Fri, 21 Dec 2007 08:39:41 -0000
X-Groupsio-MsgNum: 3722
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig7319AB3E4E082EB7B80B1F69"

--------------enig7319AB3E4E082EB7B80B1F69
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,
I have a feature request that should help dealing with those source
tarballs which do not contain a proper top level directory. The idea is
to allow to add a parameter 'wrap' to the SRC_URI entry denoting the
source tarball. If it is present (and 1) the unpacker creates a
directory named ${P} and unpacks the tarball therein.

This would make it unneccessary to change S for such packages and
furthermore the work directory is not cluttered with files and folders
from inside the source tarball.

Like it? (Any pointer where such code should be put?)

Regards
Robert


--------------enig7319AB3E4E082EB7B80B1F69
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHa3qQG9cfwmwwEtoRCB+OAJ450ud1BwLXpdln1grPyzgMsLwXXQCgj6Lr
q4Vik5Pt5tSU7d3EH5IrxlM=
=De8n
-----END PGP SIGNATURE-----

--------------enig7319AB3E4E082EB7B80B1F69--
