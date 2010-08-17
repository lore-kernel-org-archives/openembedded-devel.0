Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1OlG0I-0002g1-Pt
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 08:51:03 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1OlG01-0008U7-Ol
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 10:50:18 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Aug 2010 10:50:13 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <1281983778-21054-1-git-send-email-khimov@altell.ru>
	<201008162325.59305.roman@khimov.ru>
	<AANLkTik-LOv_7xTmgsEz8ip_smmZ+L4FeG0Cr5rHc1zF@mail.gmail.com>
In-Reply-To: <AANLkTik-LOv_7xTmgsEz8ip_smmZ+L4FeG0Cr5rHc1zF@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201008171050.16611.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] openssl: update 1.0.0 to 1.0.0a
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
X-List-Received-Date: Tue, 17 Aug 2010 06:51:04 -0000
X-Groupsio-MsgNum: 22310
Content-Type: multipart/signed; boundary="nextPart15085753.5sm9gOdOqz";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart15085753.5sm9gOdOqz
Content-Type: Text/Plain;
  charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

=F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F0=CF=CE=C5=C4=C5=CC=D8=CE=C9=CB 16=
 =C1=D7=C7=D5=D3=D4=C1 2010 23:35:59 =C1=D7=D4=CF=D2 Khem Raj =CE=C1=D0=C9=
=D3=C1=CC:
> IMO the newest version in a recipe should always be default preference
> this way we can
> stabilize recipe upgrades quicker. This also means a wider testing
> before pushing a new recipe
> DEFAULT_PREFERENCE =3D "-1" makes it to escape the testing.

Well, consider Perl, for example. Making 5.10.1 a default preference would=
=20
break binary packaged perl modules built for 5.8.8, so technically some=20
massive PR bump (most probably DISTRO_PR) is needed when updating to 5.10.1=
=2E=20
=46orcing distro maintainers to do that is not nice, IMO.

Although the way it is now Perl 5.10.1 seems to be rarely used, which is al=
so=20
not nice. Probably, there is no way to solve this problem for everyone. Wit=
h=20
D_P it's not used much, removing D_P is asking for "YOU BROKE MY BUILD!!!"=
=20
love messages from random corners.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart15085753.5sm9gOdOqz
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkxqMSgACgkQXJ70z+XgVcOxewCfY7OMJ058MPZODDLrsoL7DEdi
ejUAn2ko1bHlCyiDteV73MOm8pseVVmr
=iQx2
-----END PGP SIGNATURE-----

--nextPart15085753.5sm9gOdOqz--
