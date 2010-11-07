Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PFAuS-00065h-ME for openembedded-devel@lists.openembedded.org;
	Sun, 07 Nov 2010 20:28:13 +0100
Received: from f053032019.adsl.alicedsl.de ([78.53.32.19]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PFAtb-00032s-6q for openembedded-devel@lists.openembedded.org;
	Sun, 07 Nov 2010 19:27:19 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201011071451.08781.roman@khimov.ru>
References: <1288773858.3980.10.camel@mattotaupa>
	<1289113016-26867-1-git-send-email-khimov@altell.ru>
	<AANLkTikrb+s-A5aXmHN66fU+xG8Vw20YDS96jQfr=_xL@mail.gmail.com>
	<201011071451.08781.roman@khimov.ru>
Date: Sun, 07 Nov 2010 20:27:18 +0100
Message-ID: <1289158038.3878.18.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
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
X-List-Received-Date: Sun, 07 Nov 2010 19:28:15 -0000
X-Groupsio-MsgNum: 25998
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-dU2xXHYvxLHE83P5K+1f"

--=-dU2xXHYvxLHE83P5K+1f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 07.11.2010, 14:51 +0300 schrieb Roman I Khimov:
> =D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=
=82 =D0=92=D0=BE=D1=81=D0=BA=D1=80=D0=B5=D1=81=D0=B5=D0=BD=D1=8C=D0=B5 07 =
=D0=BD=D0=BE=D1=8F=D0=B1=D1=80=D1=8F 2010 13:06:36 =D0=B0=D0=B2=D1=82=D0=BE=
=D1=80 Khem Raj =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> > On Sat, Nov 6, 2010 at 11:56 PM, Roman I Khimov <khimov@altell.ru> wrot=
e:
> > > Like:
> > >
> > > In file included from prelude-plugin.c:56:0:
> > > /include/prelude-plugin.h:66:20: error: conflicting types for 'lt__PR=
OGRAM__LTX_preloaded_symbols'
> > > /oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-g=
nueabi/usr/include/ltdl.h:106:36: note: previous declaration of
> > > 'lt__PROGRAM__LTX_preloaded_symbols' was here make[4]: ***
> > > [prelude-plugin.lo] Error 1
> >=20
> > hmmm is  /include/prelude-plugin.h a generated file then you could see
> > if it needs alteration.
> > will this patch still work with older libtools
>=20
> Yes, it works, I've tested that on our internal distro with libtool 2.2.6=
b.

I tested your patch with `angstrom-2008.1`, `angstrom-2010.1`, `minimal`
and `minimal` with (`LIBC =3D "libc"`) for `MACHINE =3D "beagleboard"`.

Could you amend the commit summary and fix the typo in workaroun*d*
before you push that.

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

Thank you for fixing that issue. Could you report that issue upstream
and if so, could you please add that link to the commit message or the
patch file?


Thanks,

Paul

--=-dU2xXHYvxLHE83P5K+1f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzW/ZYACgkQPX1aK2wOHViyAgCgiZibvJHrggHDLKYQwc2jFBrh
exIAni6ifc4eEvrYW0l7ASzEaXJVv3Sc
=EAA+
-----END PGP SIGNATURE-----

--=-dU2xXHYvxLHE83P5K+1f--
