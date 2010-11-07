Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1PF8Av-0002XT-P5
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Nov 2010 17:33:12 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <khimov@altell.ru>)
	id 1PF89z-0005mt-IJ; Sun, 07 Nov 2010 19:32:04 +0300
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Sun, 7 Nov 2010 19:32:02 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.14-0.1-desktop; KDE/4.3.5; x86_64; ; )
References: <1288774920.3980.29.camel@mattotaupa>
In-Reply-To: <1288774920.3980.29.camel@mattotaupa>
MIME-Version: 1.0
Message-Id: <201011071932.02392.khimov@altell.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_SOFTFAIL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: libprelude: minimal-uclibc: task `install` fails with `sed: can't read /oe/build-minimal-uclibc/minimal-uclibc-dev/work/armv7a-oe-linux-uclibceabi/libprelude-1.0.0-r0/image/usr/lib/perl/5.8.8/auto/Prelude/.packlist: No such file or directory`
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
X-List-Received-Date: Sun, 07 Nov 2010 16:33:20 -0000
Content-Type: Text/Plain;
  charset="windows-1251"
Content-Transfer-Encoding: quoted-printable

=C2 =F1=EE=EE=E1=F9=E5=ED=E8=E8 =EE=F2 =D1=F0=E5=E4=E0 03 =ED=EE=FF=E1=F0=
=FF 2010 12:02:00 =E0=E2=F2=EE=F0 Paul Menzel =ED=E0=EF=E8=F1=E0=EB:
> Build Configuration:
> BB_VERSION        =3D "1.10.0"
> METADATA_BRANCH   =3D "org.openembedded.dev"
> METADATA_REVISION =3D "8fc09c071a6fba0766c3b002209c758572298d26"
> TARGET_ARCH       =3D "arm"
> TARGET_OS         =3D "linux-uclibceabi"
> MACHINE           =3D "beagleboard"
> DISTRO            =3D "minimal-uclibc"
> DISTRO_VERSION    =3D "dev-snapshot-20101103"
> TARGET_FPU        =3D "hard"
>=20
> testing to build `suricata_1.0.2` (commit f85795) [1] the build fails in
> the task `install` of the dependency `libprelude_1.0.0` (commit 577889)
> [2].
>=20
>         make[1]: Leaving directory
>  `/oe/build-minimal-uclibc/minimal-uclibc-dev/work/armv7a-oe-linux-uclibc=
ea
> bi/libprelude-1.0.0-r0/libprelude-1.0.0' sed: can't read
>  /oe/build-minimal-uclibc/minimal-uclibc-dev/work/armv7a-oe-linux-uclibce=
ab
> i/libprelude-1.0.0-r0/image/usr/lib/perl/5.8.8/auto/Prelude/.packlist: No
>  such file or directory ERROR: Function do_install failed

Hmm. Tried to build with your configuration and it doesn't even get to this=
=20
stage failing on perl:

arm-oe-linux-uclibceabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneo=
n -
mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -o libperl.so -L/home/rik/=
oe-
angstrom-beagleboard/tmp/sysroots/armv7a-oe-linux-uclibceabi/usr/lib -Wl,-
rpath-link,/home/rik/oe-angstrom-beagleboard/tmp/sysroots/armv7a-oe-linux-
uclibceabi/usr/lib -Wl,-O1 -Wl,--hash-style=3Dgnu -shared perl.o  gv.o toke=
=2Eo=20
perly.o op.o pad.o regcomp.o dump.o util.o mg.o reentr.o hv.o av.o run.o=20
pp_hot.o sv.o pp.o scope.o pp_ctl.o pp_sys.o doop.o doio.o regexec.o utf8.o=
=20
taint.o deb.o universal.o xsutils.o globals.o perlio.o perlapi.o numeric.o=
=20
locale.o pp_pack.o pp_sort.o  -lnsl -ldl -lm -lcrypt -lutil -lpthread -lc  -
Wl,-soname,libperl.so.5
/home/rik/oe-angstrom-beagleboard/tmp/sysroots/x86_64-
linux/usr/armv7a/lib/gcc/arm-oe-linux-uclibceabi/4.5.2/../../../../arm-oe-
linux-uclibceabi/bin/ld: cannot find -lnsl


