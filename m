Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OlGZo-0007bO-Pc for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 09:27:25 +0200
Received: from f053036067.adsl.alicedsl.de ([78.53.36.67]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OlGZY-0005He-Pr for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 07:27:00 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201008171050.16611.roman@khimov.ru>
References: <1281983778-21054-1-git-send-email-khimov@altell.ru>
	<201008162325.59305.roman@khimov.ru>
	<AANLkTik-LOv_7xTmgsEz8ip_smmZ+L4FeG0Cr5rHc1zF@mail.gmail.com>
	<201008171050.16611.roman@khimov.ru>
Date: Tue, 17 Aug 2010 09:26:57 +0200
Message-ID: <1282030017.3641.18.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: `DEFAULT_PREFERENCE = "-1"` of current (upstream) releases (was: [PATCH] openssl: update 1.0.0 to 1.0.0a)
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
X-List-Received-Date: Tue, 17 Aug 2010 07:27:26 -0000
X-Groupsio-MsgNum: 22314
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-dAzcdJZHddXc+lt7llH/"

--=-dAzcdJZHddXc+lt7llH/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 17.08.2010, 10:50 +0400 schrieb Roman I Khimov:
> =D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=
=82 =D0=9F=D0=BE=D0=BD=D0=B5=D0=B4=D0=B5=D0=BB=D1=8C=D0=BD=D0=B8=D0=BA 16 =
=D0=B0=D0=B2=D0=B3=D1=83=D1=81=D1=82=D0=B0 2010 23:35:59 =D0=B0=D0=B2=D1=82=
=D0=BE=D1=80 Khem Raj =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> > IMO the newest version in a recipe should always be default preference
> > this way we can
> > stabilize recipe upgrades quicker. This also means a wider testing
> > before pushing a new recipe
> > DEFAULT_PREFERENCE =3D "-1" makes it to escape the testing.
>=20
> Well, consider Perl, for example. Making 5.10.1 a default preference woul=
d=20
> break binary packaged perl modules built for 5.8.8, so technically some=
=20
> massive PR bump (most probably DISTRO_PR) is needed when updating to 5.10=
.1.=20
> Forcing distro maintainers to do that is not nice, IMO.
>=20
> Although the way it is now Perl 5.10.1 seems to be rarely used, which is =
also=20
> not nice. Probably, there is no way to solve this problem for everyone. W=
ith=20
> D_P it's not used much, removing D_P is asking for "YOU BROKE MY BUILD!!!=
"=20
> love messages from random corners.

What about removing `DEFAULT_PREFERENCE =3D "-1"` and have the
distributions not wanting it pinning to the old version? This could be
done after a period of time after the push and an announcement to the
list asking what distribution prefers what and make that change in one
commit.


Thanks,

Paul

--=-dAzcdJZHddXc+lt7llH/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxqOcEACgkQPX1aK2wOHVgdQACeKZF0gRaAi5Sbwy4aIHlV1wgX
LTQAn3dLKSgXuNXhMc2r0L4OFZoj6z6Y
=RJGJ
-----END PGP SIGNATURE-----

--=-dAzcdJZHddXc+lt7llH/--
