Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1OYOeM-0001pT-Fw
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 21:26:48 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1OYOZZ-0001bp-TN
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 23:21:51 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Jul 2010 23:21:46 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <201007071352.09254.khimov@altell.ru>
	<1278499134-24718-1-git-send-email-khimov@altell.ru>
	<AANLkTimzHYI6PCsDfbDM2v0zpj1ovyTZ8H-43tvJIluv@mail.gmail.com>
In-Reply-To: <AANLkTimzHYI6PCsDfbDM2v0zpj1ovyTZ8H-43tvJIluv@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201007122321.48994.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] busybox: add suport for FEATURE_INDIVIDUAL setup
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
X-List-Received-Date: Mon, 12 Jul 2010 19:26:48 -0000
X-Groupsio-MsgNum: 20906
Content-Type: multipart/signed; boundary="nextPart2642866.UAs6OJgJgx";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2642866.UAs6OJgJgx
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=9F=D0=BE=D0=BD=D0=B5=D0=B4=D0=B5=D0=BB=D1=8C=D0=BD=D0=B8=D0=BA 12 =D0=
=B8=D1=8E=D0=BB=D1=8F 2010 22:34:48 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Khem Raj=
 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> On Wed, Jul 7, 2010 at 3:38 AM, Roman I Khimov <khimov@altell.ru> wrote:
> > Where each applet is installed as a tiny binary linked against shared
> > libbusybox.
>=20
> may be it should be a DISTRO_FEATURE in OE

Well, I don't think so. First, it doesn't change anything functional, only =
the=20
way busybox is linked/installed/packaged and second is that it only affects=
=20
one package, so if distro wants that, I think it should maintain its own=20
defconfig (at least four distros do that already and IMO busybox is the=20
package you want to tune for your specific needs). Or the distro itself may=
=20
choose not to use busybox at all so such FEATURE would make no sense in tha=
t=20
case.

I view FEATUREs as a way to make distro-global configuration, ipv6 is proba=
bly=20
one of the best examples as it potentially affects many packages.=20
=46EATURE_INDIVIDUAL is completely busybox-specific.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart2642866.UAs6OJgJgx
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkw7a0wACgkQXJ70z+XgVcMtcgCg3ThebMXFZtXeWCT1E0TVBQbs
yrUAoONWjUQHFgky3ksXRWbht8kiANtV
=Rp35
-----END PGP SIGNATURE-----

--nextPart2642866.UAs6OJgJgx--
