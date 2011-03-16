Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PzsKZ-00086G-SK for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 16:08:11 +0100
Received: from f053032013.adsl.alicedsl.de ([78.53.32.13]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PzsIw-0005vT-R2 for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 15:06:30 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1300284412.2132.13266.camel@phil-desktop>
References: <1300264546.3840.9.camel@mattotaupa>
	<4D80791E.2040803@gmail.com>  <1300265560.3840.10.camel@mattotaupa>
	<1300269370.2132.13010.camel@phil-desktop>
	<1300282755.3840.69.camel@mattotaupa>
	<1300284412.2132.13266.camel@phil-desktop>
Date: Wed, 16 Mar 2011 16:06:30 +0100
Message-ID: <1300287990.3840.85.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: minimal-uclibc: gnutls-2.10.4-r11.0: task compile fails with `make[4]: *** [coding.lo] Error 1`
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
X-List-Received-Date: Wed, 16 Mar 2011 15:08:12 -0000
X-Groupsio-MsgNum: 30273
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-dqd/a2ZwRG9NZGWzPwre"

--=-dqd/a2ZwRG9NZGWzPwre
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 16.03.2011, 14:06 +0000 schrieb Phil Blundell:
> On Wed, 2011-03-16 at 14:39 +0100, Paul Menzel wrote:
> >         arm-oe-linux-uclibceabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8=
 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=
=3D/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-ucl=
ibceabi -DHAVE_CONFIG_H -I. -I.. -DASN1_BUILDING -I./../gl -I./../gl -I./..=
 -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pip=
e -g -MT coding.lo -MD -MP -MF .deps/coding.Tpo -c coding.c -o coding.o
> >         coding.c: In function 'asn1_length_der':
> >         coding.c:101:1: internal compiler error: in dwarf2out_frame_deb=
ug_expr, at dwarf2out.c:2221
> >         Please submit a full bug report,
> >         with preprocessed source if appropriate.
> >         See <http://gcc.gnu.org/bugs.html> for instructions.
> >         {standard input}: Assembler messages:
>=20
> >From the looks of the error, you could probably work around the crash by
> compiling without -g.

Thanks, that worked.

> Obviously you'd lose debuggability but that might or might not be a
> problem for your particular use case.

Well, I am just build testing.

> > I am wondering if the latest GCC 4.5 changes are causing this, but as
> > always this is just an uneducated guess.
>=20
> Could be.  Or it's possible that the bug has been latent for a long time
> and has just been tickled by a recent change to CFLAGS.  I think the
> inclusion of -g in the default opts is a relatively recent innovation.

I think it worked before last Friday, i. e., before the GCC 4.5 updates.

> You could bisect the recent changes if you want but, unless you want to
> debug this for yourself, the best way to proceed is probably to follow
> the directions in the error message and submit a bug report to upstream
> GCC.

I will see, if or when I will get to that and report back.


Thanks,

Paul

--=-dqd/a2ZwRG9NZGWzPwre
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2A0fYACgkQPX1aK2wOHVhR9ACfQkGUg2rKD966vz0lr/kj4U5w
BSMAoIUBjtvfLfM5AqyrLXklv6qboWmL
=ccIL
-----END PGP SIGNATURE-----

--=-dqd/a2ZwRG9NZGWzPwre--
