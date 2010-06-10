Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1OMlub-0005K6-50
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jun 2010 19:51:30 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1OMlqM-0001un-7e
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jun 2010 21:47:07 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Jun 2010 21:47:02 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <1276130175-28095-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1276130175-28095-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Message-Id: <201006102147.05242.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] lib/oe/patch.py: Dont import patches but symlink them instead
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
X-List-Received-Date: Thu, 10 Jun 2010 17:51:30 -0000
X-Groupsio-MsgNum: 20074
Content-Type: multipart/signed; boundary="nextPart3061718.a6EvSAhB55";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart3061718.a6EvSAhB55
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3 10 =D0=B8=D1=8E=D0=BD=D1=8F 2010=
 04:36:15 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Khem Raj =D0=BD=D0=B0=D0=BF=D0=B8=
=D1=81=D0=B0=D0=BB:
> * This patch removes the usage of quilt import <patch>
>   instead it creasted a symlink to the patch in the patches
>   directory and synthesizes the series file which otherwise
>   would be done automatically by quilt import.
>=20
> * This should help a bit in reducing build time as it avoids
>   copying of the patch and also other things that quilt import
>   would otherwise do.
>=20
> * Tested by doing minimal-image on qemuarm.
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Roman I Khimov <khimov@altell.ru>

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart3061718.a6EvSAhB55
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkwRJRkACgkQXJ70z+XgVcOGqQCgiIW/jRMRb5xVLH33n72mUXs3
w/4AoKKxuGYhq27mBIfHYdNZ6fyJPMZW
=UkUx
-----END PGP SIGNATURE-----

--nextPart3061718.a6EvSAhB55--
