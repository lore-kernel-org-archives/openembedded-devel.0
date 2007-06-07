Received: from [209.85.132.246] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lvcargnini@gmail.com>) id 1HwQlm-0003Mq-9u
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jun 2007 00:47:54 +0200
Received: by an-out-0708.google.com with SMTP id b33so157185ana
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jun 2007 15:45:25 -0700 (PDT)
Received: by 10.100.248.18 with SMTP id v18mr1368905anh.1181256324673;
	Thu, 07 Jun 2007 15:45:24 -0700 (PDT)
Received: by 10.100.38.6 with HTTP; Thu, 7 Jun 2007 15:45:24 -0700 (PDT)
Message-ID: <ae36f8040706071545i772205b2m85d251b45c7f26d7@mail.gmail.com>
Date: Thu, 7 Jun 2007 19:45:24 -0300
From: "=?ISO-8859-1?Q?Lu=EDs_Cargnini?=" <lvcargnini@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ae36f8040706061143o47650436we993cf24bd807174@mail.gmail.com>
MIME-Version: 1.0
References: <ae36f8040706021959p2c020f17k454aa346d7123f95@mail.gmail.com>
	<7C28F02B-B392-4557-9E7A-2991BE0E1BF3@gmx.net>
	<ae36f8040706051251g22ae2a09ha560b3c8b6d0de57@mail.gmail.com>
	<4665CF19.2030501@dominion.kabel.utwente.nl>
	<ae36f8040706051806q120be1bdyae9da9c8f754ab59@mail.gmail.com>
	<4666520C.8060000@dominion.kabel.utwente.nl>
	<4666576A.9030608@dominion.kabel.utwente.nl>
	<ae36f8040706060937la8400adr2f98d7db547a2664@mail.gmail.com>
	<ae36f8040706061036i3662ee38x104bb1896550b64@mail.gmail.com>
	<ae36f8040706061143o47650436we993cf24bd807174@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: problems doing bitbake task-base
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Jun 2007 22:47:55 -0000
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

new problems:
(BD06DC30:~/puc/instramed/openembedded) lvcargnini% bitbake
task-base
NOTE: Handling BitBake files: - (4588/4588) [100 %]
NOTE: Parsing finished. 4373 cached, 0 parsed, 215 skipped, 0 masked.
NOTE: build 200706071941: started

OE Build Configuration:
BB_VERSION     =3D "1.8.2"
OE_REVISION    =3D "79523ae60358a1e775044f45dbbc976308d4148f"
TARGET_ARCH    =3D "arm"
TARGET_OS      =3D "linux-gnueabi"
MACHINE        =3D "omap5912osk"
DISTRO         =3D "angstrom"
DISTRO_VERSION =3D "test-20070607"
TARGET_FPU     =3D "soft"

NOTE: Resolving missing task queue dependencies
NOTE: preferred version 2.5 of glibc not available (for item
virtual/arm-angstrom-linux-gnueabi-libc-for-gcc)
NOTE: Preparing Runqueue
NOTE: Executing runqueue
NOTE: Running task 468 of 1122 (ID: 1022,
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/p=
erl/perl-native_5.8.8.bb,
do_compile)
NOTE: package perl-native-5.8.8: started
NOTE: package perl-native-5.8.8-r11: task do_compile: started
ERROR: function do_compile failed
ERROR: see log in
/home/lvcargnini/puc/instramed/openembedded/tmp/work/i686-linux/perl-
native-5.8.8-r11/temp/log.do_compile.28955
NOTE: Task failed:
/home/lvcargnini/puc/instramed/openembedded/tmp/work/i686-linux/perl-
native-5.8.8-r11/temp/log.do_compile.28955
NOTE: package perl-native-5.8.8-r11: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package perl-native-5.8.8: failed
ERROR: Build of
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/p=
erl/perl-native_5.8.8.bb
do_compile failed
ERROR: Task 1022
(/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/=
perl/perl-native_5.8.8.bb,
do_compile) failed
ERROR:
'/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/=
perl/perl-native_5.8.8.bb'
failed
(BD06DC30:~/puc/instramed/openembedded) lvcargnini%

Making IO (dynamic)
make[1]: Entering directory
`/home/lvcargnini/puc/instramed/openembedded/tmp/work/i686-linux/perl-
native-5.8.8-r11/perl-5.8.8/ext/IO'
make[1]: Leaving directory
`/home/lvcargnini/puc/instramed/openembedded/tmp/work/i686-linux/perl-
native-5.8.8-r11/perl-5.8.8/ext/IO'
make[1]: Entering directory
`/home/lvcargnini/puc/instramed/openembedded/tmp/work/i686-linux/perl-
native-5.8.8-r11/perl-5.8.8/ext/IO'
make[1]: Leaving directory
`/home/lvcargnini/puc/instramed/openembedded/tmp/work/i686-linux/perl-
native-5.8.8-r11/perl-5.8.8/ext/IO'

        Making IPC::SysV (dynamic)
make[1]: Entering directory
`/home/lvcargnini/puc/instramed/openembedded/tmp/work/i686-linux/perl-
native-5.8.8-r11/perl-5.8.8/ext/IPC/SysV'
make[1]: Leaving directory
`/home/lvcargnini/puc/instramed/openembedded/tmp/work/i686-linux/perl-
native-5.8.8-r11/perl-5.8.8/ext/IPC/SysV'
make[1]: Entering directory
`/home/lvcargnini/puc/instramed/openembedded/tmp/work/i686-linux/perl-
native-5.8.8-r11/perl-5.8.8/ext/IPC/SysV'
gcc  -c   -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS
-fno-strict-aliasing -pipe -Wdeclaration-after-statement -D_LARGEFILE_SOURC=
E
-D_FILE_OFFSET_BITS=3D64 -O2   -DVERSION=3D\"1.04\" -DXS_VERSION=3D\"1.04\"=
 -fpic
"-I../../.."   SysV.c
SysV.xs:7:25: error: asm/page.h: No such file or directory
make[1]: *** [SysV.o] Error 1
make[1]: Leaving directory
`/home/lvcargnini/puc/instramed/openembedded/tmp/work/i686-linux/perl-
native-5.8.8-r11/perl-5.8.8/ext/IPC/SysV'
make: *** [lib/auto/IPC/SysV/SysV.so] Error 2
FATAL: oe_runmake failed


On 6/6/07, Lu=EDs Cargnini <lvcargnini@gmail.com> wrote:
>
> well antecipating the critics I'm installing an gcc version 3.4.6, gentoo
> supports multiple gcc versions installed.
>
> On 6/6/07, Lu=EDs Cargnini < lvcargnini@gmail.com> wrote:
> >
> > (enterprise:~/puc/instramed/openembedded) lvcargnini% bitbake task-base
> > NOTE: Handling BitBake files: | (4586/4586) [100 %]
> > NOTE: Parsing finished. 0 cached, 4371 parsed, 215 skipped, 0 masked.
> > NOTE: build 200706061431: started
> >
> > OE Build Configuration:
> > BB_VERSION     =3D "1.8.2"
> > OE_REVISION    =3D "161e1a738dc05762f428e26351dfe3cf5cd65ec4"
> > TARGET_ARCH    =3D "arm"
> > TARGET_OS      =3D "linux-gnueabi"
> > MACHINE        =3D "omap5912osk"
> > DISTRO         =3D "angstrom"
> > DISTRO_VERSION =3D "test-20070606"
> > TARGET_FPU     =3D "soft"
> >
> > NOTE: Resolving missing task queue dependencies
> > NOTE: preferred version 2.5 of glibc not available (for item
> > virtual/arm-angstrom-linux-gnueabi-libc-for-gcc)
> > NOTE: Preparing Runqueue
> > NOTE: Executing runqueue
> > NOTE: Running task 166 of 1122 (ID: 557,
> > /home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packag=
es/qemu/qemu-native_cvs.bb,
> > do_configure)
> > NOTE: package qemu-native-0.8.2+cvs20060723: started
> > NOTE: package qemu-native-0.8.2+cvs20060723-r1: task do_configure:
> > started
> > ERROR: function do_configure failed
> > ERROR: see log in
> > /home/lvcargnini/puc/instramed/openembedded/tmp/work/i686-linux/qemu-
> > native-0.8.2+cvs20060723-r1/temp/log.do_configure.9861
> > NOTE: Task failed:
> > /home/lvcargnini/puc/instramed/openembedded/tmp/work/i686-linux/qemu-
> > native-0.8.2+cvs20060723-r1/temp/log.do_configure.9861
> > NOTE: package qemu-native-0.8.2+cvs20060723-r1: task do_configure:
> > failed
> > ERROR: TaskFailed event exception, aborting
> > NOTE: package qemu-native-0.8.2+cvs20060723: failed
> > ERROR: Build of
> > /home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packag=
es/qemu/qemu-native_cvs.bb
> > do_configure failed
> > ERROR: Task 557
> > (/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packa=
ges/qemu/qemu-native_cvs.bb,
> > do_configure) failed
> > ERROR:
> > '/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packa=
ges/qemu/qemu-native_cvs.bb'
> > failed
> > (enterprise:~/puc/instramed/openembedded) lvcargnini% cat
> > /home/lvcargnini/puc/instramed/openembedded/tmp/work/i686-linux/qemu-
> > native-0.8.2+cvs20060723-r1/temp/log.do_configure.9861
> > NOTE: Running
> > /home/lvcargnini/puc/instramed/openembedded/tmp/work/i686-linux/qemu-
> > native-0.8.2+cvs20060723-r1/qemu/configure
> > --build=3Di686-linux                   --host=3Di686-linux
> > --target=3Di686-linux
> > --prefix=3D/home/lvcargnini/puc/instramed/openembedded/tmp/staging
> > --exec_prefix=3D/home/lvcargnini/puc/instramed/openembedded/tmp/staging=
/i686-linux
> > --bindir=3D/home/lvcargnini/puc/instramed/openembedded/tmp/staging/i686=
-linux/bin
> > --sbindir=3D/home/lvcargnini/puc/instramed/openembedded/tmp/staging/i68=
6-linux/bin
> > --libexecdir=3D/home/lvcargnini/puc/instramed/openembedded/tmp/staging/=
i686-linux/libexec
> > --datadir=3D/home/lvcargnini/puc/instramed/openembedded/tmp/staging/i68=
6-linux/share
> > --sysconfdir=3D/home/lvcargnini/puc/instramed/openembedded/tmp/staging/=
etc
> > --sharedstatedir=3D/home/lvcargnini/puc/instramed/openembedded/tmp/stag=
ing/com
> > --localstatedir=3D/home/lvcargnini/puc/instramed/openembedded/tmp/stagi=
ng/var
> > --libdir=3D/home/lvcargnini/puc/instramed/openembedded/tmp/staging/i686=
-linux/lib
> > --includedir=3D/home/lvcargnini/puc/instramed/openembedded/tmp/staging/=
i686-linux/include
> > --oldincludedir=3D/home/lvcargnini/puc/instramed/openembedded/tmp/stagi=
ng/i686-linux/include
> > --infodir=3D/home/lvcargnini/puc/instramed/openembedded/tmp/staging/i68=
6-linux/share/info
> > --mandir=3D/home/lvcargnini/puc/instramed/openembedded/tmp/staging/i686=
-linux/share/man
> > ...
> > ERROR: "gcc" looks like gcc 4.x
> > QEMU is known to have problems when compiled with gcc 4.x
> > It is recommended that you use gcc 3.x to build QEMU
> > To use this compiler anyway, configure with --disable-gcc-check
> > FATAL: oe_runconf failed
> > (enterprise:~/puc/instramed/openembedded) lvcargnini%
> >  how to solve this little problem with gcc version ???? or how to
> > disable the qemu creation ????
> >
> >
> > On 6/6/07, Lu=EDs Cargnini <lvcargnini@gmail.com> wrote:
> > >
> > > thank you all for all the help, but first are everybody completely
> > > sure that I should remove this ines from my conf file ?????
> > > If yes, why I can remove ?
> > >
> > > On 6/6/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> > > >
> > > > -----BEGIN PGP SIGNED MESSAGE-----
> > > > Hash: SHA1
> > > >
> > > > Koen Kooi schreef:
> > > > > Lu=EDs Cargnini schreef:
> > > > >> so just to make it fast before I could upload everything to some
> > > > server here
> > > > >> follow my local.conf :
> > > > >
> > > > >
> > > > >> TARGET_ARCH =3D "arm"
> > > > >> TARGET_OS =3D "linux"
> > > > >
> > > > > Remove those
> > > > >
> > > > >> DISTRO =3D "angstrom-2007.1"
> > > >
> > > > That one is ok as well
> > > >
> > > > >
> > > > >> GLIBC_GENERATE_LOCALES =3D "en en_GB.UTF-8 fr pt_BR.UTF-8"
> > > > >> INHERIT =3D "package_tar"
> > > > >
> > > > > remove those
> > > > >
> > > > >> IMAGE_FSTYPES =3D "jffs2 tar cramfs"
> > > > >
> > > > > that one is ok
> > > > >
> > > > >> BBDEBUG =3D "yes
> > > > >> BBINCLUDELOGS =3D "yes"
> > > > >
> > > > > and remove those as well
> > > >
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-de=
vel
> > > >
> > > >
> > > > -----BEGIN PGP SIGNATURE-----
> > > > Version: GnuPG v1.4.5 (Darwin)
> > > >
> > > > iD8DBQFGZldqMkyGM64RGpERAv+NAKCDQjW7q7ickqaTwJdZD5DQhZEAtACgrx8p
> > > > Gez+xEq2RxWhnkZcrw97Ook=3D
> > > > =3Dz96W
> > > > -----END PGP SIGNATURE-----
> > > >
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > >
> > > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-de=
vel
> > > >
> > >
> > >
> > >
> > > --
> > > ---------------------------------------------------------------------=
---------
> > >
> > > Thanks && Regards
> > > Msc. Bsc. Lu=EDs Vit=F3rio Cargnini
> > > IEEE Member
> > > Electrical Engineer Faculty @ PUCRS
> > > Ipiranga Avenue, 6681 =96 Building 30
> > > P.O. Box: 90619-900 =96 Porto Alegre/RS
> > > Phone: +55 51 3320 3500  extension: 7696
> > > ---------------------------------------------------------------------=
------------
> > >
> > >
> >
> >
> >
> > --
> >
> > -----------------------------------------------------------------------=
-------
> > Thanks && Regards
> > Msc. Bsc. Lu=EDs Vit=F3rio Cargnini
> > IEEE Member
> > Electrical Engineer Faculty @ PUCRS
> > Ipiranga Avenue, 6681 =96 Building 30
> > P.O. Box: 90619-900 =96 Porto Alegre/RS
> > Phone: +55 51 3320 3500  extension: 7696
> > -----------------------------------------------------------------------=
----------
> >
> >
>
>
>
> --
>
> -------------------------------------------------------------------------=
-----
> Thanks && Regards
> Msc. Bsc. Lu=EDs Vit=F3rio Cargnini
> IEEE Member
> Electrical Engineer Faculty @ PUCRS
> Ipiranga Avenue, 6681 =96 Building 30
> P.O. Box: 90619-900 =96 Porto Alegre/RS
> Phone: +55 51 3320 3500  extension: 7696
> -------------------------------------------------------------------------=
--------
>
>



--=20
---------------------------------------------------------------------------=
---
Thanks && Regards
Msc. Bsc. Lu=EDs Vit=F3rio Cargnini
IEEE Member
Electrical Engineer Faculty @ PUCRS
Ipiranga Avenue, 6681 =96 Building 30
P.O. Box: 90619-900 =96 Porto Alegre/RS
Phone: +55 51 3320 3500  extension: 7696
---------------------------------------------------------------------------=
------

