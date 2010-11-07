Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PFAzd-0006BV-Q1 for openembedded-devel@lists.openembedded.org;
	Sun, 07 Nov 2010 20:33:59 +0100
Received: from f053032019.adsl.alicedsl.de ([78.53.32.19]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PFAym-00033e-CW for openembedded-devel@lists.openembedded.org;
	Sun, 07 Nov 2010 19:32:40 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201011071932.02392.khimov@altell.ru>
References: <1288774920.3980.29.camel@mattotaupa>
	<201011071932.02392.khimov@altell.ru>
Date: Sun, 07 Nov 2010 20:32:39 +0100
Message-ID: <1289158359.3878.22.camel@mattotaupa>
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
Subject: minimal-uclibc: perl_5.8.8: fails with `ld: cannot find -lnsl` (was: libprelude: minimal-uclibc: task `install` fails with `sed: can't read /oe/build-minimal-uclibc/minimal-uclibc-dev/work/armv7a-oe-linux-uclibceabi/libprelude-1.0.0-r0/image/usr/lib/perl/5.8.8/auto/Prelude/.packlist: No such file or directory`)
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
X-List-Received-Date: Sun, 07 Nov 2010 19:34:02 -0000
X-Groupsio-MsgNum: 25999
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-0AQSI6BrpHIyn/J6uzuY"

--=-0AQSI6BrpHIyn/J6uzuY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 07.11.2010, 19:32 +0300 schrieb Roman I Khimov:
> =D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=
=82 =D0=A1=D1=80=D0=B5=D0=B4=D0=B0 03 =D0=BD=D0=BE=D1=8F=D0=B1=D1=80=D1=8F =
2010 12:02:00 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Paul Menzel =D0=BD=D0=B0=D0=BF=
=D0=B8=D1=81=D0=B0=D0=BB:
> > Build Configuration:
> > BB_VERSION        =3D "1.10.0"
> > METADATA_BRANCH   =3D "org.openembedded.dev"
> > METADATA_REVISION =3D "8fc09c071a6fba0766c3b002209c758572298d26"
> > TARGET_ARCH       =3D "arm"
> > TARGET_OS         =3D "linux-uclibceabi"
> > MACHINE           =3D "beagleboard"
> > DISTRO            =3D "minimal-uclibc"
> > DISTRO_VERSION    =3D "dev-snapshot-20101103"
> > TARGET_FPU        =3D "hard"
> >=20
> > testing to build `suricata_1.0.2` (commit f85795) [1] the build fails i=
n
> > the task `install` of the dependency `libprelude_1.0.0` (commit 577889)
> > [2].
> >=20
> >         make[1]: Leaving directory
> >  `/oe/build-minimal-uclibc/minimal-uclibc-dev/work/armv7a-oe-linux-ucli=
bcea
> > bi/libprelude-1.0.0-r0/libprelude-1.0.0' sed: can't read
> >  /oe/build-minimal-uclibc/minimal-uclibc-dev/work/armv7a-oe-linux-uclib=
ceab
> > i/libprelude-1.0.0-r0/image/usr/lib/perl/5.8.8/auto/Prelude/.packlist: =
No
> >  such file or directory ERROR: Function do_install failed
>=20
> Hmm. Tried to build with your configuration and it doesn't even get to th=
is=20
> stage failing on perl:
>=20
> arm-oe-linux-uclibceabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dn=
eon -
> mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -o libperl.so -L/home/ri=
k/oe-
> angstrom-beagleboard/tmp/sysroots/armv7a-oe-linux-uclibceabi/usr/lib -Wl,=
-
> rpath-link,/home/rik/oe-angstrom-beagleboard/tmp/sysroots/armv7a-oe-linux=
-
> uclibceabi/usr/lib -Wl,-O1 -Wl,--hash-style=3Dgnu -shared perl.o  gv.o to=
ke.o=20
> perly.o op.o pad.o regcomp.o dump.o util.o mg.o reentr.o hv.o av.o run.o=
=20
> pp_hot.o sv.o pp.o scope.o pp_ctl.o pp_sys.o doop.o doio.o regexec.o utf8=
.o=20
> taint.o deb.o universal.o xsutils.o globals.o perlio.o perlapi.o numeric.=
o=20
> locale.o pp_pack.o pp_sort.o  -lnsl -ldl -lm -lcrypt -lutil -lpthread -lc=
  -
> Wl,-soname,libperl.so.5
> /home/rik/oe-angstrom-beagleboard/tmp/sysroots/x86_64-
> linux/usr/armv7a/lib/gcc/arm-oe-linux-uclibceabi/4.5.2/../../../../arm-oe=
-
> linux-uclibceabi/bin/ld: cannot find -lnsl

What is `-lnsl`?

`perl` builds just fine for me. I tried it again with a clean temporary
directory. My build host runs Debian Squeeze.


Thanks,

Paul

--=-0AQSI6BrpHIyn/J6uzuY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzW/tcACgkQPX1aK2wOHVjZlwCfaGMsXWHUaPb6umvwMRw5XWlu
wWUAnj58CI3X3YCfee+q9G2+Mm3gZoWV
=z9xU
-----END PGP SIGNATURE-----

--=-0AQSI6BrpHIyn/J6uzuY--
