Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1OmsfX-0000Qo-3A
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Aug 2010 20:19:52 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1OmsfA-0005cG-Jg
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Aug 2010 22:19:30 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Aug 2010 22:19:24 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <1282406626-13837-1-git-send-email-khimov@altell.ru>
	<AANLkTimSd5v_KD7cz92JHTxp-sELd4ri9OLdpkNU4zO_@mail.gmail.com>
In-Reply-To: <AANLkTimSd5v_KD7cz92JHTxp-sELd4ri9OLdpkNU4zO_@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201008212219.27410.roman@khimov.ru>
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
X-List-Received-Date: Sat, 21 Aug 2010 18:19:52 -0000
X-Groupsio-MsgNum: 22510
Content-Type: multipart/signed; boundary="nextPart2757531.Um6L8ycxRg";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2757531.Um6L8ycxRg
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A1=D1=83=D0=B1=D0=B1=D0=BE=D1=82=D0=B0 21 =D0=B0=D0=B2=D0=B3=D1=83=D1=
=81=D1=82=D0=B0 2010 21:38:48 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Khem Raj =D0=
=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> On Sat, Aug 21, 2010 at 9:03 AM, Roman I Khimov <khimov@altell.ru> wrote:
> > It wasn't possible to install prepackaged clamav-data with the way it's
> > been packaged. And there are situations where you want to have at least
> > prepackaged AV databases before you could do any sort of update. Also,
> > logically freshclam doesn't substitute clamav-data, but rather
> > complements it.
> >
> > Signed-off-by: Roman I Khimov <khimov@altell.ru>
>=20
> Will there be any conflicts with prepackaged clamav-data
> otherwise you have the ack.

Well, -data is data. -freshclam is freshclam. Freshclam updates the data, b=
ut=20
the data files are defined as CONFFILES already, so there is no conflict at=
=20
this level.

But thinking another 5 minutes about it there is an issue with this patch i=
n=20
that it actually makes clamav-data installation (and that is huge, 25M)=20
_mandatory_, whether you want that or not depends on situation. We want tha=
t=20
(hence the patch), someone might not.

Technically, there are three possible installation combinations, each has i=
ts=20
valid use:
 * clamav-data
 * clamav-freshclam
 * clamav-data & clamav-freshclam

Before the patch only second one was possible (probably with the recent=20
BAD_RECOMMENDATIONS fixes to opkg and OE also the first one). After the pat=
ch=20
only first and third will be possible. Do we really care about second case?=
=20
And if yes, how to allow all of three to coexist?

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart2757531.Um6L8ycxRg
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkxwGK8ACgkQXJ70z+XgVcM4wACfUB6sdwP0WvZHWHLPOx8uDED1
GucAoONxPB5FNLuH+zA+0locq90Wvv5/
=Uvs1
-----END PGP SIGNATURE-----

--nextPart2757531.Um6L8ycxRg--
