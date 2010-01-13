Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NV0ka-0004KH-TN for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 11:46:59 +0100
Received: from f053038039.adsl.alicedsl.de ([78.53.38.39]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NV0iW-0008L9-QY for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 10:44:49 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100113102738.GA15906@gmail.com>
References: <1263109998.16109.11.camel@mattotaupa.wohnung.familie-menzel.net>
	<20100110123923.GB6363@rhein.zuhause.netz>
	<1263156477.3423.6.camel@mattotaupa.wohnung.familie-menzel.net>
	<1263249767.3308.236.camel@mattotaupa.wohnung.familie-menzel.net>
	<1263296160.20557.136.camel@mattotaupa.wohnung.familie-menzel.net>
	<20100113102738.GA15906@gmail.com>
Date: Wed, 13 Jan 2010 11:44:47 +0100
Message-ID: <1263379487.3228.23.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [vdr] TARGET_CXXFLAGS do not include CXX_FLAGS from Makefile
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
X-List-Received-Date: Wed, 13 Jan 2010 10:47:00 -0000
X-Groupsio-MsgNum: 15640
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-kRlpmH8vpygN/iWYP/gm"

--=-kRlpmH8vpygN/iWYP/gm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 13.01.2010, 02:27 -0800 schrieb Khem Raj:
> On (12/01/10 12:36), Paul Menzel wrote:
> > Am Montag, den 11.01.2010, 23:42 +0100 schrieb Paul Menzel:
> >=20
> > [=E2=80=A6]
> >=20
> > > Putting
> > >=20
> > >         PREFERRED_VERSION_binutils               =3D "2.20"
> > >         PREFERRED_VERSION_binutils-cross         =3D "2.20"
> > >         PREFERRED_VERSION_binutils-cross-sdk     =3D "2.20"
> > >        =20
> > >         PREFERRED_VERSION_gcc                    =3D "4.4.2"
> > >         PREFERRED_VERSION_gcc-cross              =3D "4.4.2"
> > >         PREFERRED_VERSION_gcc-cross-sdk          =3D "4.4.2"
> > >         PREFERRED_VERSION_gcc-cross-initial      =3D "4.4.2"
> > >         PREFERRED_VERSION_gcc-cross-intermediate =3D "4.4.2"
> > >=20
> > > in my `local.conf` and running `bitbake vdr` gave me an error in
> > > `do_compile` for `libcap_1.10.bb`.
> > >=20
> > >         arm-angstrom-linux-gnueabi-ld -soname libcap.so.1 -x -shared =
-o libcap.so.1.10 cap_alloc.o cap_proc.o cap_extint.o cap_flag.o cap_text.o=
 cap_sys.o
> > >         arm-angstrom-linux-gnueabi-ld: cap_text.o: relocation R_ARM_M=
OVW_ABS_NC against `a local symbol' can not be used when making a shared ob=
ject; recompile with -fPIC
> >=20
> > I opened a new thread for this [2].
> >=20
> > Anyways compiling the plugins for VDR in `do_install` [3]
> >=20
> >         do_install () {
> >               oe_runmake 'DESTDIR=3D${D}' \
> >                          'PREFIX=3D${prefix}' \
> >                          'CONFDIR=3D${sysconfdir}/vdr' \
> >                          'VIDEODIR=3D/var/lib/vdr/video' \
> >                          'PLUGINLIBDIR=3D${PLUGINDIR}' \
> >                          'LOCDIR=3D${datadir}/locale' \
> >                          install
> >         }
> >=20
> > I also get the same error which I did not get before with GCC 4.1.1.
>=20
> Older versions of binutils/ld can not detect MOVT/MOVW relocations which
> are absolute and cant be used in PIC code.
> hence even if the error was there it remained latent.

Sorry for the noob question. In earlier versions would the resulting
binaries/packages have been buggy?

> >=20
> >         /oe/tangstrom-dev/cross/armv7a/lib/gcc/arm-angstrom-linux-gnuea=
bi/4.4.2/../../../../arm-angstrom-linux-gnueabi/bin/ld: hello.o: relocation=
 R_ARM_MOVW_ABS_NC against `a local symbol' can not be used when making a s=
hared object; recompile with -fPIC
> >         hello.o: could not read symbols: Bad value
> >         collect2: ld returned 1 exit status
> >         make[1]: *** [libvdr-hello.so] Error 1
> >         make[1]: Leaving directory `/oe/tangstrom-dev/work/armv7a-angst=
rom-linux-gnueabi/vdr-1.7.10-r3/vdr-1.7.10/PLUGINS/src/hello'
> >        =20
> >         [=E2=80=A6 same for all other plugins]
> >=20
> > The thing that puzzles me is, that in the plugin=E2=80=99s Makefile [4]=
 `-fPIC`
> > is specified
> >=20
> >         CXX      ?=3D g++
> >         CXXFLAGS ?=3D -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-pare=
ntheses
> >         LIBS     ?=3D ${LDFLAGS}
> >=20
> > but in the above command it is not included.
>=20
> These are conditional so may be you already have defined CXXFLAGS in
> your environment infact bitbake will do it for you.

I did not define any CXXFLAGS. It looks like BitBake is setting them and
not respecting those in the Makefile.

> >         arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex=
-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -isystem/oe/tangstrom-dev/staging/arm=
v7a-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -frename-r=
egisters -fomit-frame-pointer -O2 -ggdb3 -fpermissive -fvisibility-inlines-=
hidden -c -D_GNU_SOURCE -DPLUGIN_NAME_I18N=3D'"hello"' -I../../../include h=
ello.c
> >=20
> > Looking at `run.do_install.28829` I cannot see find the `-fPIC` in
> > there. So my question is, why is it not included. Is it because of =C2=
=BB?=3D=C2=AB?
> > How do I get it included?
>=20
> you could do CXXFLAGS_append =3D ... in the recipe.

Is that the recommended behavior? Is `oe_runmake` maybe not the correct
command to use? As written above, it is very strange for me, that
BitBake does not respect the flags in the Makefile automatically,
because I think it is common in upstream Makefiles to use =C2=BB?=3D=C2=AB,=
 is not
is?

Or is that the default behavior running `oe_runmake` in `do_install`?


Thanks,

Paul

--=-kRlpmH8vpygN/iWYP/gm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktNpB4ACgkQPX1aK2wOHVjEywCfXDnlPNENl+6+GLpKbW3m7ibL
ynUAn0bn7lJKhdAO0OgWhQ3B9aHt9Hv8
=jByd
-----END PGP SIGNATURE-----

--=-kRlpmH8vpygN/iWYP/gm--
