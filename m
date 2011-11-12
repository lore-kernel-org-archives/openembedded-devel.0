Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RPAuj-0007Q1-Lb for openembedded-devel@lists.openembedded.org;
	Sat, 12 Nov 2011 11:34:21 +0100
Received: from f053044109.adsl.alicedsl.de ([78.53.44.109]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RPAop-0003lk-Nm for openembedded-devel@lists.openembedded.org;
	Sat, 12 Nov 2011 10:28:15 +0000
Message-ID: <1321093682.3557.14.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Nov 2011 11:28:02 +0100
In-Reply-To: <CA+M6bXmuTYrJ=_ALera0NnhrQyqZD+nUH64kv2g1z9eQfsptqg@mail.gmail.com>
References: <4EBC2FEF.5020405@kernelconcepts.de>
	<j9hc2l$b8u$3@dough.gmane.org> <4EBC39EB.2060004@kernelconcepts.de>
	<CA+M6bXmuTYrJ=_ALera0NnhrQyqZD+nUH64kv2g1z9eQfsptqg@mail.gmail.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: RFC: Clean up omap3.inc
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
X-List-Received-Date: Sat, 12 Nov 2011 10:34:21 -0000
X-Groupsio-MsgNum: 35361
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-gPJ10Pzc0fu0DaI85xfx"

--=-gPJ10Pzc0fu0DaI85xfx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 10.11.2011, 14:55 -0700 schrieb Tom Rini:
> On Thu, Nov 10, 2011 at 1:54 PM, Florian Boor wrote:

> > Am 10.11.2011 21:27, schrieb Koen Kooi:
> >> Wrong. You can do the following in your machine.conf:
> >>
> >> require omap3.inc
> >>
> >> EXTRA_IMAGEDEPENDS =3D "whatever"
> >
> > this is a workaround for a bad misconception. EXTRA_IMAGEDEPENDS could =
have been
> > appended everywhere and this intrusive override might break quite a lot=
.
> >
> >> In OE classic, no. In meta-ti the cleanup is already underway.
> >
> > I do not care bout meta-ti, its is broken in OE classic.
> >
> >
> > Removing this hardcoded dependency would not break anything. Only the b=
oard
> > maintainers who want to get it built automatically would have to add it=
.
>=20
> But, that's most of them today.

Sorry Tom, could you try harder to explain the reason, please? How many
boards are there in the upstream OE repository depending on this and
would have to be changed? I think Florian could commit that with his
clean up easily.

On the other side developers opposing this clean up could at least offer
to add a comment to the file with a proposed work around for people
hitting this issue. Still there should be a good reason. Like all your
internal TI projects depend on this for example.


Thanks,

Paul

--=-gPJ10Pzc0fu0DaI85xfx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk6+SjIACgkQPX1aK2wOHVgXegCgiTEx5XMuZkfvFQcjBWVN1Zac
tzwAn3JKOkZooW9zdBgOgEuW1YDCMFbO
=ROtg
-----END PGP SIGNATURE-----

--=-gPJ10Pzc0fu0DaI85xfx--
