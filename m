Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1OnCwc-0006Tq-Mf
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Aug 2010 17:58:53 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1OnCw7-0000Mc-Uq
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Aug 2010 19:58:23 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Aug 2010 19:58:04 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <1282406626-13837-1-git-send-email-khimov@altell.ru>
	<201008212219.27410.roman@khimov.ru>
	<AANLkTi==V_i_jLyeMQnF+D9Nwm0D5y0-ohUBx6E3AYdN@mail.gmail.com>
In-Reply-To: <AANLkTi==V_i_jLyeMQnF+D9Nwm0D5y0-ohUBx6E3AYdN@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201008221958.18469.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] clamav: allow clamav-data installation
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
X-List-Received-Date: Sun, 22 Aug 2010 15:58:59 -0000
X-Groupsio-MsgNum: 22520
Content-Type: multipart/signed; boundary="nextPart1697444.7VRYICYNzv";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1697444.7VRYICYNzv
Content-Type: Text/Plain;
  charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

=F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F3=D5=C2=C2=CF=D4=C1 21 =C1=D7=C7=
=D5=D3=D4=C1 2010 22:55:18 =C1=D7=D4=CF=D2 Khem Raj =CE=C1=D0=C9=D3=C1=CC:
> On Sat, Aug 21, 2010 at 11:19 AM, Roman I Khimov <roman@khimov.ru> wrote:
> > Technically, there are three possible installation combinations, each h=
as
> > its valid use:
> >  * clamav-data
> >  * clamav-freshclam
> >  * clamav-data & clamav-freshclam
> >
> > Before the patch only second one was possible (probably with the recent
> > BAD_RECOMMENDATIONS fixes to opkg and OE also the first one). After the
> > patch only first and third will be possible. Do we really care about
> > second case?
>=20
> Can clamav-freshclam function without clamav-data?=20

Yes.

> > And if yes, how to allow all of three to coexist?
>=20
> may be have separate recipe for data.

What about:

=2D RDEPENDS_${PN} =3D "${PN}-data"
=2D RDEPENDS_${PN}-daemon =3D "${PN}-data ${PN}-conf"
=2D RDEPENDS_${PN}-freshclam =3D "${PN}-conf"
=2D RRECOMMENDS_${PN} =3D "${PN}-freshclam"
=2D RRECOMMENDS_${PN}-daemon =3D "${PN}-freshclam"
=2D RPROVIDES_${PN}-freshclam =3D "${PN}-data"
+ RDEPENDS_${PN}-daemon =3D "${PN}-conf"
+ RDEPENDS_${PN}-freshclam =3D "${PN}-conf"
+ RRECOMMENDS_${PN} =3D "${PN}-data ${PN}-freshclam"
+ RRECOMMENDS_${PN}-daemon =3D "${PN}-data ${PN}-freshclam"

This way the default is third (both data and freshclam installed) and using=
=20
BAD_RECOMMENDATIONS one can disable one or another to implement first or=20
second.

The only downside is that you can technically put both to BAD_RECOMMENDATIO=
NS=20
and clamav won't work without its databases (and you won't have freshclam t=
o=20
get them). But then you have to be very persistent to get that effect.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1697444.7VRYICYNzv
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkxxSRoACgkQXJ70z+XgVcNNxwCfdGT/ax4j/GTu3kQS1zchVb1p
NHMAn3aOKW3uoGyDVFjkQHrQvVVMOcaE
=9yie
-----END PGP SIGNATURE-----

--nextPart1697444.7VRYICYNzv--
