Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NCgLV-0006jI-So for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 22:21:20 +0100
Received: from f053035190.adsl.alicedsl.de ([78.53.35.190]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NCgKM-0003Bx-HF for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 21:20:06 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1258631121.5229.22.camel@dax.rpnet.com>
References: <1258311783.18820.149.camel@mattotaupa.wohnung.familie-menzel.net>
	<1258537305.3021.14.camel@mattotaupa.wohnung.familie-menzel.net>
	<1258586470.3071.10.camel@mattotaupa.wohnung.familie-menzel.net>
	<1258589851.5229.17.camel@dax.rpnet.com>
	<1258629037.3093.129.camel@mattotaupa.wohnung.familie-menzel.net>
	<1258631121.5229.22.camel@dax.rpnet.com>
Date: Mon, 23 Nov 2009 22:19:45 +0100
Message-ID: <1259011185.7271.32.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: bitbake base-image: gmp-native: ERROR: function do_configure failed: configure: error: Oops, mp_limb_t is 32 bits, but the assembler code
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
X-List-Received-Date: Mon, 23 Nov 2009 21:21:21 -0000
X-Groupsio-MsgNum: 14649
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-XsKYg903SzlGWRKkB+DW"

--=-XsKYg903SzlGWRKkB+DW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 19.11.2009, 11:45 +0000 schrieb Richard Purdie:
> On Thu, 2009-11-19 at 12:10 +0100, Paul Menzel wrote:
> > Am Donnerstag, den 19.11.2009, 00:17 +0000 schrieb Richard Purdie:
> > > On Thu, 2009-11-19 at 00:21 +0100, Paul Menzel wrote:
> > > [...]
> > > > well, unfortunately my search results did not include any hits from=
 the
> > > > OE bug tracker. I looked there a moment ago and found bug #3470 whi=
ch
> > > > seems to be related to my problem [5].
> > > >=20
> > > > I will try to update it with the information from my messages to th=
e
> > > > list in the next days.
> > > [...]
> > > > > > [2] oe/angstrom-dev/work/x86_64-linux/gmp-native-4.2.4-r0/temp$=
 less log.do_configure.29183
> > >=20
> > > I saw this recently, I wish I could remember how I fixed it :/.
> > >=20
> > > I looked back at the above log and it says:
> > >=20
> > > checking whether to build shared libraries... yes
> > > checking whether to build static libraries... yes
> > > checking for ld used by g++... ld -m elf_i386
> > > checking if the linker (ld -m elf_i386) is GNU ld... yes
> > > checking whether the g++ linker (ld -m elf_i386) supports shared libr=
aries... yes
> > > checking for g++ option to produce PIC... -fPIC -DPIC
> > > checking if g++ PIC flag -fPIC -DPIC works... yes
> > >=20
> > > and the i386 references above show configure is off the rails before =
it
> > > hits the fatal error.
> > >=20
> > > Do you have the config.log file from the broken builds?
> >=20
> > Here you go.
>=20
> So just to be clear, you don't have any 64 bit userspace, just a 32 bit
> one? Running gcc to compile something gives you a 32 bit binary, not a
> 64 bit one?

That is correct.

        $ dpkg --print-architecture
        i386

> I'd try adding:
>=20
> BUILD_ARCH =3D "i686"
> BUILD_OS =3D "linux"
>=20
> to your local.conf

That worked perfectly. Thank you!

I do not know how to proceed with #3470 though. Can it be closed as
won=E2=80=99t fix and a note added to the FAQ?


Bests,

Paul


[5] http://bugs.openembedded.net/show_bug.cgi?id=3D3470

--=-XsKYg903SzlGWRKkB+DW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAksK/HAACgkQPX1aK2wOHVjM5gCdHX/7M61u+KQd904bbneYj0OB
WaYAn3vJkBpefweSHWqZ0OZUu1PUIne3
=+Jc2
-----END PGP SIGNATURE-----

--=-XsKYg903SzlGWRKkB+DW--
