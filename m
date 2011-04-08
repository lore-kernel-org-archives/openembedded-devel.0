Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q89Ah-0001MG-K6 for openembedded-devel@lists.openembedded.org;
	Fri, 08 Apr 2011 12:44:12 +0200
Received: from f053045107.adsl.alicedsl.de ([78.53.45.107]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q898h-0004og-WF for openembedded-devel@lists.openembedded.org;
	Fri, 08 Apr 2011 10:42:08 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 08 Apr 2011 12:42:02 +0200
Message-ID: <1302259322.7217.28.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: glibc-{charmap-utf-8,glibc-localedata-i18n} and uClibc
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
X-List-Received-Date: Fri, 08 Apr 2011 10:44:12 -0000
X-Groupsio-MsgNum: 31046
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-ulafbMaz166AdAS1kVhr"

--=-ulafbMaz166AdAS1kVhr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


`bitbake e-image-core` and therefore `bitbake e-image` fails to build
using minimal-uclibc. With the following change I am able to run the
commands.

	-IMAGE_INSTALL =3D "${MACHINE_TASK_PROVIDER} task-e-x11-core ${XSERVER} gl=
ibc-charmap-utf-8 glibc-localedata-i18n"
	+IMAGE_INSTALL =3D "${MACHINE_TASK_PROVIDER} task-e-x11-core ${XSERVER}"

Can the `glibc-=E2=80=A6` things somehow be made compatible with uClibc?


Thanks,

Paul

--=-ulafbMaz166AdAS1kVhr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2e5noACgkQPX1aK2wOHVi7gQCeNlAEQex7XZ6hMOIHIjD7uCKm
AYcAnjdIRb4WM1pLbiY22n9V2LLyuDbV
=ti9I
-----END PGP SIGNATURE-----

--=-ulafbMaz166AdAS1kVhr--
