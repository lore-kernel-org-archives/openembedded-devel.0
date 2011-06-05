Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QTE3z-00049O-8u for openembedded-devel@lists.openembedded.org;
	Sun, 05 Jun 2011 16:12:23 +0200
Received: from f053037033.adsl.alicedsl.de ([78.53.37.33]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QTE1a-0004KY-Bz for openembedded-devel@lists.openembedded.org;
	Sun, 05 Jun 2011 14:09:54 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201106051555.45155.schnitzeltony@gmx.de>
References: <1306618191-3066-1-git-send-email-schnitzeltony@gmx.de>
	<201106051555.45155.schnitzeltony@gmx.de>
Date: Sun, 05 Jun 2011 16:09:08 +0200
Message-ID: <1307282948.5181.2.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] mx28evk: correct settings to make machine work
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
X-List-Received-Date: Sun, 05 Jun 2011 14:12:23 -0000
X-Groupsio-MsgNum: 32511
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-urlxrPhUXYD9EPOPqXng"

--=-urlxrPhUXYD9EPOPqXng
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 05.06.2011, 15:55 +0200 schrieb Andreas Mueller:
> On Saturday, May 28, 2011 11:29:51 PM Andreas Mueller wrote:
> > Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
> > ---
> >  conf/machine/include/imx28.inc |    4 ++--
> >  conf/machine/mx28evk.conf      |    2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/conf/machine/include/imx28.inc
> > b/conf/machine/include/imx28.inc index 38248a8..b50f000 100644
> > --- a/conf/machine/include/imx28.inc
> > +++ b/conf/machine/include/imx28.inc
> > @@ -10,8 +10,8 @@ MACHINE_KERNEL_PR =3D "r0"
> >=20
> >  KERNEL_IMAGETYPE =3D "uImage"
> >=20
> > -UBOOT_ENTRYPOINT =3D "0x8000"
> > -UBOOT_LOADADDRESS =3D "0x8000"
> > +UBOOT_ENTRYPOINT =3D "0x40008000"
> > +UBOOT_LOADADDRESS =3D "0x40008000"
> >=20
> >  EXTRA_IMAGEDEPENDS +=3D "u-boot"
> >=20
> > diff --git a/conf/machine/mx28evk.conf b/conf/machine/mx28evk.conf
> > index e093ffa..823b502 100644
> > --- a/conf/machine/mx28evk.conf
> > +++ b/conf/machine/mx28evk.conf
> > @@ -17,7 +17,7 @@ XSERVER =3D "xserver-kdrive-fbdev"
> >  require conf/machine/include/imx28.inc
> >=20
> >  # used by sysvinit_2
> > -SERIAL_CONSOLE =3D "115200 ttymxc0"
> > +SERIAL_CONSOLE =3D "115200 ttyAM0"
> >=20
> >  ROOT_FLASH_SIZE =3D "128"
> Can someone please take a care for this?

I do not have the hardware to test your patch. A elaborate commit
message would be needed.

What is the problem? Why was is committed like this the first place? Was
not it tested? What components changed and most importantly which build
configuration did you use for testing?

If you resend this patch with my questions answered in the commit
message I would be happy to commit your patch.


Thanks,

Paul

--=-urlxrPhUXYD9EPOPqXng
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3rjf8ACgkQPX1aK2wOHVi0VgCeKQKXII3OFnS8Xx9VD0V5dU1k
GWAAnjyHlVtR/k2KEhVclxcdbUo4x63B
=UAXO
-----END PGP SIGNATURE-----

--=-urlxrPhUXYD9EPOPqXng--
