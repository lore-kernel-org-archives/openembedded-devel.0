Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1P0dmh-0006RY-0U
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 19:16:10 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1P0dmS-0005Wh-NV
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 21:15:56 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Sep 2010 21:15:47 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.14-0.1-desktop; KDE/4.3.5; x86_64; ; )
References: <AANLkTinMWT7K-h+hH0LvPD119Nxxpitro=f6igQvL7-K@mail.gmail.com>
In-Reply-To: <AANLkTinMWT7K-h+hH0LvPD119Nxxpitro=f6igQvL7-K@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201009282115.51128.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] kernel NOTE messages fix
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
X-List-Received-Date: Tue, 28 Sep 2010 17:16:10 -0000
X-Groupsio-MsgNum: 24111
Content-Type: multipart/signed; boundary="nextPart1888044.vmuaroA3Mq";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1888044.vmuaroA3Mq
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=92=D1=82=D0=BE=D1=80=D0=BD=D0=B8=D0=BA 28 =D1=81=D0=B5=D0=BD=D1=82=D1=
=8F=D0=B1=D1=80=D1=8F 2010 20:39:42 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Frans Me=
ulenbroeks=20
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> 3) copy the files directly from the work area to staging. That way
> there are no unpackaged files in image/ so no NOTE messages.
> Additional advantage is that it is faster as we save the copy to the image
>  dir.
>=20
> The following patch makes (3) happen:
>=20
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> index 5f8bc8a..05ddcc1 100644
> --- a/classes/kernel.bbclass
> +++ b/classes/kernel.bbclass

I hate those NOTEs. The patch looks good. Thanks!

Acked-by: Roman I Khimov <khimov@altell.ru>

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1888044.vmuaroA3Mq
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkyiIscACgkQXJ70z+XgVcPcUACfUgHbvUp5qwkNAW6/YhknrTES
JtAAn35JSfbIiY+hvwK+ZCHPsAA8SneS
=4AlD
-----END PGP SIGNATURE-----

--nextPart1888044.vmuaroA3Mq--
