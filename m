Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nazal-0003ef-JI for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jan 2010 23:45:34 +0100
Received: from g229062211.adsl.alicedsl.de ([92.229.62.211]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NazYT-0001E3-RE for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jan 2010 22:43:10 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ac9c93b11001291357qce6ea6eka4a7e3726ab041@mail.gmail.com>
References: <1264289812.3738.265.camel@mattotaupa.wohnung.familie-menzel.net>
	<ac9c93b11001291357qce6ea6eka4a7e3726ab041@mail.gmail.com>
Date: Fri, 29 Jan 2010 23:43:17 +0100
Message-ID: <1264804997.3715.15.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Tools for Patchwork: `pw-am.sh` and `pwclient` (was: [RFC] Perfect(?) workflow for patches.)
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
X-List-Received-Date: Fri, 29 Jan 2010 22:45:34 -0000
X-Groupsio-MsgNum: 16305
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-s6Z138KmLJ6ifSCkXUJo"

--=-s6Z138KmLJ6ifSCkXUJo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 29.01.2010, 22:57 +0100 schrieb Frans Meulenbroeks:
> 2010/1/24 Paul Menzel <paulepanter@users.sourceforge.net>:
> ?
> >
> > 4. Commit (if not go to 5.)
> >  a) If the reviewer has commit access and accepts the patch, s/he can
> > push it. A hook then changes the Patchwork state to =C2=BBApplied=C2=AB=
 with the
> > appropriate commit id and archived(?).
>=20
> What is the best way to commit a patch from patchwork?

If the patch is inlined, i. e. you can use the mbox-message for `git
am`, then you can use `contrib/patchwork/pw-am.sh` to get the mbox-file
from Patchwork and it is automatically committed using `git am`.

If the patch has a different format, you can also use the links in the
web interface or `pwclient get`.

> I've peeked at pwclient, but ended up with python errors.

Do you have the latest revision? There were some UTF-8 related problems.
Can you post your errors?


Thanks,

Paul

--=-s6Z138KmLJ6ifSCkXUJo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktjZIQACgkQPX1aK2wOHVjwvwCfY1Q+ZQVUc9XooAPnRAgscX9M
O5EAn1E9KYHixRHF27CWHoJF57U7f1gz
=766O
-----END PGP SIGNATURE-----

--=-s6Z138KmLJ6ifSCkXUJo--
