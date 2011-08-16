Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QtF01-0001P9-0F for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 10:27:49 +0200
Received: from f053034117.adsl.alicedsl.de ([78.53.34.117]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QtEvO-0007NI-Uw for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 08:23:03 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <j2d8fl$5qf$3@dough.gmane.org>
References: <1313436905.4058.47.camel@mattotaupa>
	<j2d8fl$5qf$3@dough.gmane.org>
Date: Tue, 16 Aug 2011 10:22:57 +0200
Message-ID: <1313482978.3496.11.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: Coordination for updating the XBMC recipe
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
X-List-Received-Date: Tue, 16 Aug 2011 08:27:49 -0000
X-Groupsio-MsgNum: 33611
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-ZeVofAplHnxd72SLYaJL"

--=-ZeVofAplHnxd72SLYaJL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 16.08.2011, 10:07 +0200 schrieb Koen Kooi:

> Op 15-08-11 21:35, Paul Menzel schreef:
> > Dear OE folks and especially Koen,
> >=20
> >=20
> > Scott Davilla from the XBMC project asked me for build instructions for=
 XBMC for the PandaBoard.
> >=20
> > Currently the XBMC recipe does not build for the PandaBoard
> >=20
> > COMPATIBLE_MACHINE =3D "omap3|ti816x"
> >=20
> > and 'virtual/egl' is not available for `MACHINE =3D "omap4430-panda"` i=
n oe.dev. Additionally the recipe is quite outdated.
> >=20
> > This is a good occasion to update and clean up the current XBMC recipes=
.
> >=20
> > I have some patches locally and I build test the latest commits for `MA=
CHINE =3D "beagleboard"` unfortunately still for oe.dev. On LinuxTag you to=
ld me that you also had some patches but they conflicted with my pushed com=
mits.
> >=20
> > So what is the best way to go forward? Did you already do some work on =
this so that no wheel is reinvented? Please publish your patches somewhere.=
 That would be awesome.
> >=20
> > Without knowing your answer I propose the following.
> >=20
> > 1. I try to clean up my patches and push them right to oe.dev? (I could=
 also publish a tree on Gitorious where I am already registered.)
>=20
> OE .dev is a dead end, no use working there
>=20
> > Unfortunately I am only able to build test XBMC as I do not have a setu=
p BeagleBoard or PandaBoard currently and no time to set them up.
> >=20
> > 2. Not having used meta-oe/oe-core it would be great if you could port =
those to meta-oe.
>=20
> Importing the current recipe into meta-oe and working on it there would b=
e a better idea.

Looking more into it, it looks like `virtual/egl` is not yet available
in meta-oe or oe-core. So that would be quite an effort. Additionally I
only have a working oe.dev build setup right now.

Regarding the PandaBoard it looks like there is only `libgles-omap3` and
nothing for OMAP4. Is that correct?

Do you have some patches you could post somewhere?


Thanks,

Paul

--=-ZeVofAplHnxd72SLYaJL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5KKOEACgkQPX1aK2wOHVgQ0gCdEDIQnJGL/rBCQsTcUmyBL0Ik
VuoAn1owY+720EAySwX2L8XnO2sh9iGG
=HzUn
-----END PGP SIGNATURE-----

--=-ZeVofAplHnxd72SLYaJL--
