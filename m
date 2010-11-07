Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1PF3nH-0003WD-Lv
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Nov 2010 12:52:23 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1PF3mB-0005Tn-IP
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Nov 2010 14:51:14 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 7 Nov 2010 14:51:04 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.14-0.1-desktop; KDE/4.3.5; x86_64; ; )
References: <1288773858.3980.10.camel@mattotaupa>
	<1289113016-26867-1-git-send-email-khimov@altell.ru>
	<AANLkTikrb+s-A5aXmHN66fU+xG8Vw20YDS96jQfr=_xL@mail.gmail.com>
In-Reply-To: <AANLkTikrb+s-A5aXmHN66fU+xG8Vw20YDS96jQfr=_xL@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201011071451.08781.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libprelude: workaroung build failures with libtool 2.4
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
X-List-Received-Date: Sun, 07 Nov 2010 11:52:23 -0000
X-Groupsio-MsgNum: 25993
Content-Type: multipart/signed; boundary="nextPart1873615.mVhoboSLnh";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1873615.mVhoboSLnh
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=92=D0=BE=D1=81=D0=BA=D1=80=D0=B5=D1=81=D0=B5=D0=BD=D1=8C=D0=B5 07 =D0=
=BD=D0=BE=D1=8F=D0=B1=D1=80=D1=8F 2010 13:06:36 =D0=B0=D0=B2=D1=82=D0=BE=D1=
=80 Khem Raj =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> On Sat, Nov 6, 2010 at 11:56 PM, Roman I Khimov <khimov@altell.ru> wrote:
> > Like:
> >
> > In file included from prelude-plugin.c:56:0:
> > /include/prelude-plugin.h:66:20: error: conflicting types for
> > 'lt__PROGRAM__LTX_preloaded_symbols'
> > /oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnu=
ea
> >bi/usr/include/ltdl.h:106:36: note: previous declaration of
> > 'lt__PROGRAM__LTX_preloaded_symbols' was here make[4]: ***
> > [prelude-plugin.lo] Error 1
>=20
> hmmm is  /include/prelude-plugin.h a generated file then you could see
> if it needs alteration.
> will this patch still work with older libtools

Yes, it works, I've tested that on our internal distro with libtool 2.2.6b.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1873615.mVhoboSLnh
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkzWkqwACgkQXJ70z+XgVcMbvACgmoo7jv1whnQjNSachOL0ijDZ
yZ8AoI5EcOo3vPEwRdHdRjCxxkxLWyW8
=dKU/
-----END PGP SIGNATURE-----

--nextPart1873615.mVhoboSLnh--
