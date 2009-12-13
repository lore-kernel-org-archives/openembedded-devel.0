Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NJsqK-0001Gx-Cf for openembedded-devel@lists.openembedded.org;
	Sun, 13 Dec 2009 19:06:55 +0100
Received: from g229063066.adsl.alicedsl.de ([92.229.63.66]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NJsof-0007Oi-FE for openembedded-devel@lists.openembedded.org;
	Sun, 13 Dec 2009 18:05:09 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hg3523$2lg$3@ger.gmane.org>
References: <1260618520.3373.23.camel@mattotaupa.wohnung.familie-menzel.net>
	<20091212173311.GA3730@rhein.zuhause.netz>
	<1260711980.3110.21.camel@mattotaupa.wohnung.familie-menzel.net>
	<hg3523$2lg$3@ger.gmane.org>
Date: Sun, 13 Dec 2009 19:05:15 +0100
Message-ID: <1260727515.3110.65.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: package VDR for OE
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
X-List-Received-Date: Sun, 13 Dec 2009 18:06:56 -0000
X-Groupsio-MsgNum: 15039
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-jf3WNThY+4wEtvdyJM4z"

--=-jf3WNThY+4wEtvdyJM4z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 13.12.2009, 17:34 +0100 schrieb Koen Kooi:
> On 13-12-09 14:46, Paul Menzel wrote:

[=E2=80=A6]

> > Thank you! I tried this
> >
> >          +-INCLUDES =3D -I/usr/include/freetype2
> >          ++INCLUDES =3D -I${STAGING_INCDIR}/freetype2
> >
> > but the `${STAGING_INCDIR}` was not expanded. The result is the
> > following.
> >
> >          INCLUDES =3D -I${STAGING_INCDIR}freetype2
> >
> > Using an absolute path worked.
> >
> > Could you please point out my mistake?
>=20
> AFAIK Makefiles don't use accolades but parens for variables.

I see. But

        -INCLUDES =3D -I/usr/include/freetype2
        +INCLUDES =3D $(STAGING_INCDIR)/freetype2

did not help and resulted in.

        INCLUDES =3D $(STAGING_INCDIR)/freetype2

So I guess Petr=E2=80=99s solution is the way to go.


Thanks,

Paul

--=-jf3WNThY+4wEtvdyJM4z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkslLNsACgkQPX1aK2wOHVioiwCdGenEWcgAa3KjyHHWEWwDPr5u
0hEAn1euCook/L5b07Tj+pf2XP2B2m9d
=gIc6
-----END PGP SIGNATURE-----

--=-jf3WNThY+4wEtvdyJM4z--
