Received: from [195.234.128.72] (helo=scotty.chl-informatik.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <christopher.lang@plus.cablesurf.de>)
	id 1HPPBo-0004Kh-2z
	for openembedded-devel@openembedded.org; Thu, 08 Mar 2007 21:26:16 +0100
Received: from linux64.chl-informatik.de (linux64.chl-informatik.de
	[192.168.10.17])
	by scotty.chl-informatik.de (8.12.3/8.12.3/SuSE Linux 0.6) with ESMTP
	id l28Jbqfl011805 for <openembedded-devel@openembedded.org>;
	Thu, 8 Mar 2007 20:37:52 +0100
From: Christopher Lang <christopher.lang@plus.cablesurf.de>
To: openembedded-devel@openembedded.org
Date: Thu, 8 Mar 2007 21:26:19 +0100
User-Agent: KMail/1.9.1
References: <1173131731.5842.140.camel@localhost.localdomain>
	<1173277608.5826.15.camel@localhost.localdomain>
	<200703082046.06419.christopher.lang@plus.cablesurf.de>
In-Reply-To: <200703082046.06419.christopher.lang@plus.cablesurf.de>
MIME-Version: 1.0
Message-Id: <200703082126.20092.christopher.lang@plus.cablesurf.de>
Subject: Re: Bitbake Request for Testing of bitbake 1.8
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
X-List-Received-Date: Thu, 08 Mar 2007 20:26:17 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


adding:=20

GLIBC_ADDONS =3D "nptl"
GLIBC_EXTRA_OECONF =3D "--with-tls"

to the machine file fixes issues (2) and (3).

cheers
Chris



Am Donnerstag, 8. M=E4rz 2007 20:46 schrieb Christopher Lang:
> here is the follow up (after Richard fixed the traceback):
>
> Using the "generic" distro and bb 1.8 there are some messages that "do not
> look good":
>
> (1) doesn't seem to make sense (3x glibc)
> (2) glibc 2.5 IS available
> (3) circular dependency
>
> see full bitbake -v output (annotated with (x) ) as well as distro/machine
> configuration below.
>
> cheers
> Chris
>
>
>
> Simple custom machine file used:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>
> TARGET_ARCH =3D "i586"
> TARGET_VENDOR =3D "-oe"
>
> # stuff that I use for embedded development
> BOOTSTRAP_EXTRA_DEPENDS =3D "udev mc lrzsz gdb ncurses pciutils"
> BOOTSTRAP_EXTRA_RDEPENDS =3D "udev mc lrzsz gdbserver ncurses libstdc++
> pciutils pciutils-ids"
>
> udevdir =3D "/dev"
>
> # we need to clear HOTPLUG because task-bootstrap puts in linux-hotplug
> otherwise HOTPLUG =3D ""
>
> IPKG_ARCHS =3D "all ${TARGET_ARCH} ${MACHINE}"
>
>
>
> bitbake -v output
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> chris@linux64:~/tmp/oe-test-linux-bb18/build> bitbake -v bootstrap-image
> NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it =
to
> increase performance. NOTE: Handling BitBake files: - (4266/4266) [100 %]
> NOTE: Parsing finished. 0 cached, 4083 parsed, 183 skipped, 0 masked.
> NOTE: build 200703081942: started
>
> OE Build Configuration:
> BB_VERSION     =3D "1.7.999"
> OE_REVISION    =3D "2e1d1df32e14f9dd87ba08d9fa77c9b537683276"
> TARGET_ARCH    =3D "i586"
> TARGET_OS      =3D "linux"
> MACHINE        =3D "i586-OE-MACHINE"
> DISTRO         =3D "generic"
> DISTRO_VERSION =3D ".dev-snapshot-20070308"
> TARGET_FPU     =3D ""
>
> NOTE: Resolving missing task queue dependencies
> NOTE: selecting gcc-cross to satisfy virtual/i586-oe-linux-gcc due to
> PREFERRED_PROVIDERS NOTE: selecting glibc to satisfy virtual/libc due to
> PREFERRED_PROVIDERS NOTE: multiple providers are available for runtime
> kernel (linux-geodelx, linux-xxs1500, linux-colinux, linux-netvista,
> linux-uml, ipod, linux-geodegx, linux-epia, linux-x86, linux,
> linux-h6300-omap1, linux-dht-walnut); NOTE: consider defining a
> PREFERRED_PROVIDER entry to match runtime kernel NOTE: multiple providers
> are available for runtime kernel-module-uinput (linux-geodelx,
> linux-xxs1500, linux-colinux, linux-netvista, linux-uml, ipod,
> linux-geodegx, linux-epia, linux-x86, linux, linux-h6300-omap1,
> linux-dht-walnut); NOTE: consider defining a PREFERRED_PROVIDER entry to
> match runtime kernel-module-uinput NOTE: multiple providers are available
> for runtime kernel-module-input (linux-geodelx, linux-xxs1500,
> linux-colinux, linux-netvista, linux-uml, ipod, linux-geodegx, linux-epia,
> linux-x86, linux, linux-h6300-omap1, linux-dht-walnut); NOTE: consider
> defining a PREFERRED_PROVIDER entry to match runtime kernel-module-input
> NOTE: selecting glibc to satisfy runtime libsegfault due to
> PREFERRED_PROVIDERS NOTE: selecting glibc to satisfy runtime libsegfault
> due to PREFERRED_PROVIDERS NOTE: selecting glibc to satisfy runtime
> libsegfault due to PREFERRED_PROVIDERS (1)NOTE: multiple preferred
> providers are available for runtime libsegfault (glibc, glibc, glibc);
> NOTE: consider defining only one PREFERRED_PROVIDER entry to match runtime
> libsegfault (2)NOTE: preferred version 2.5 of glibc not available (for it=
em
> virtual/i586-oe-linux-libc-for-gcc) NOTE: multiple providers are available
> for virtual/i586-oe-linux-libc-for-gcc (glibc, glibc-intermediate); NOTE:
> consider defining PREFERRED_PROVIDER_virtual/i586-oe-linux-libc-for-gcc
> NOTE: selecting glibc to satisfy virtual/libintl due to PREFERRED_PROVIDE=
RS
> NOTE: multiple providers are available for runtime kernel-image-
> (linux-geodelx, linux-xxs1500, linux-colinux, linux-netvista, linux-uml,
> ipod, linux-geodegx, linux-epia, linux-x86, linux, linux-h6300-omap1,
> linux-dht-walnut); NOTE: consider defining a PREFERRED_PROVIDER entry to
> match runtime kernel-image- NOTE: selecting gcc-cross-initial to satisfy
> virtual/i586-oe-linux-gcc-initial due to PREFERRED_PROVIDERS NOTE:
> Preparing Runqueue
> NOTE: Marking Active Tasks
> NOTE: Pruned 666 inactive tasks, 509 left
> NOTE: Assign Weightings
> NOTE: Compute totals (have 1 endpoint(s))
> ERROR: Task 30
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/file/file-nativ=
e_
>4.20.bb, do_install) (depends: Set([29])) ERROR: Task 34
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/file/file-nativ=
e_
>4.20.bb, do_package) (depends: Set([70, 296, 305, 314, 30, 287])) ERROR:
> Task 269
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/linux-libc-head=
er
>s/linux-libc-headers_2.6.18.bb, do_package) (depends: Set([34, 70, 265, 43,
> 98, 441])) ERROR: Task 352
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/glibc/glibc_2.3=
=2E5
>+cvs20050627.bb, do_package_write) (depends: Set([88, 269, 350])) ERROR:
> Task 351
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/glibc/glibc_2.3=
=2E5
>+cvs20050627.bb, do_populate_staging) (depends: Set([352])) ERROR: Task 78
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/gcc/gcc-cross_4=
=2E1
>.1.bb, do_configure) (depends: Set([288, 99, 71, 351, 76, 306, 44, 77, 370,
> 35, 342, 297, 315, 361])) ERROR: Task 74
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/gcc/gcc-cross_4=
=2E1
>.1.bb, do_compile) (depends: Set([78])) ERROR: Task 75
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/gcc/gcc-cross_4=
=2E1
>.1.bb, do_install) (depends: Set([74])) ERROR: Task 79
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/gcc/gcc-cross_4=
=2E1
>.1.bb, do_package) (depends: Set([360, 34, 75, 70, 305, 296, 43, 98, 369,
> 341, 314, 350, 287])) ERROR: Task 81
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/gcc/gcc-cross_4=
=2E1
>.1.bb, do_package_write) (depends: Set([79])) ERROR: Task 80
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/gcc/gcc-cross_4=
=2E1
>.1.bb, do_populate_staging) (depends: Set([81])) ERROR: Task 87
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/glibc/glibc_2.5=
=2Eb
>b, do_configure) (depends: Set([288, 99, 71, 297, 44, 270, 80, 306, 35, 85,
> 86, 315])) ERROR: Task 83
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/glibc/glibc_2.5=
=2Eb
>b, do_compile) (depends: Set([87])) ERROR: Task 84
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/glibc/glibc_2.5=
=2Eb
>b, do_install) (depends: Set([83])) ERROR: Task 88
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/glibc/glibc_2.5=
=2Eb
>b, do_package) (depends: Set([34, 98, 70, 296, 43, 269, 79, 305, 84, 314,
> 287])) ERROR: Chain ends at Task 88
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/glibc/glibc_2.5=
=2Eb
>b, do_package) ERROR: Task 88
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/glibc/glibc_2.5=
=2Eb
>b, do_package) (depends: Set([34, 98, 70, 296, 43, 269, 79, 305, 84, 314,
> 287])) ERROR: Chain ends at Task 88
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/glibc/glibc_2.5=
=2Eb
>b, do_package) ERROR: Task 495
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/glibc/glibc-ini=
ti
>al_2.5.bb, do_package) (depends: Set([34, 98, 70, 296, 491, 269, 305, 314,
> 287])) ERROR: Task 497
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/glibc/glibc-ini=
ti
>al_2.5.bb, do_package_write) (depends: Set([495])) ERROR: Task 496
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/glibc/glibc-ini=
ti
>al_2.5.bb, do_populate_staging) (depends: Set([497])) ERROR: Task 458
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/gcc/gcc-cross-i=
ni
>tial_4.1.1.bb, do_configure) (depends: Set([288, 35, 71, 456, 297, 306, 49=
6,
> 370, 99, 457, 315])) ERROR: Task 454
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/gcc/gcc-cross-i=
ni
>tial_4.1.1.bb, do_compile) (depends: Set([458])) ERROR: Task 455
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/gcc/gcc-cross-i=
ni
>tial_4.1.1.bb, do_install) (depends: Set([454])) ERROR: Task 459
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/gcc/gcc-cross-i=
ni
>tial_4.1.1.bb, do_package) (depends: Set([34, 70, 369, 296, 455, 98, 495,
> 305, 314, 287])) ERROR: Task 461
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/gcc/gcc-cross-i=
ni
>tial_4.1.1.bb, do_package_write) (depends: Set([459])) ERROR: Task 460
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/gcc/gcc-cross-i=
ni
>tial_4.1.1.bb, do_populate_staging) (depends: Set([461])) ERROR: Task 349
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/glibc/glibc_2.3=
=2E5
>+cvs20050627.bb, do_configure) (depends: Set([288, 99, 71, 297, 44, 460,
> 270, 306, 35, 347, 315, 348])) ERROR: Task 345
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/glibc/glibc_2.3=
=2E5
>+cvs20050627.bb, do_compile) (depends: Set([349])) ERROR: Task 346
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/glibc/glibc_2.3=
=2E5
>+cvs20050627.bb, do_install) (depends: Set([345])) ERROR: Task 350
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/glibc/glibc_2.3=
=2E5
>+cvs20050627.bb, do_package) (depends: Set([34, 459, 98, 70, 296, 43, 269,
> 305, 314, 346, 287])) ERROR: Chain ends at Task 350
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/glibc/glibc_2.3=
=2E5
>+cvs20050627.bb, do_package) ERROR: Task 350
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/glibc/glibc_2.3=
=2E5
>+cvs20050627.bb, do_package) (depends: Set([34, 459, 98, 70, 296, 43, 269,
> 305, 314, 346, 287])) ERROR: Chain ends at Task 350
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/glibc/glibc_2.3=
=2E5
>+cvs20050627.bb, do_package) ERROR: Task 88
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/glibc/glibc_2.5=
=2Eb
>b, do_package) (depends: Set([34, 98, 70, 296, 43, 269, 79, 305, 84, 314,
> 287])) ERROR: Chain ends at Task 88
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/glibc/glibc_2.5=
=2Eb
>b, do_package) ERROR: Task 36
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/file/file-nativ=
e_
>4.20.bb, do_package_write) (depends: Set([34])) ERROR: Task 35
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/file/file-nativ=
e_
>4.20.bb, do_populate_staging) (depends: Set([36])) ERROR: Chain ends at Ta=
sk
> 35
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/file/file-nativ=
e_
>4.20.bb, do_populate_staging) ERROR: Task 88
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/glibc/glibc_2.5=
=2Eb
>b, do_package) (depends: Set([34, 98, 70, 296, 43, 269, 79, 305, 84, 314,
> 287])) ERROR: Chain ends at Task 88
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/glibc/glibc_2.5=
=2Eb
>b, do_package) ERROR: Task 29
> (/home/chris/tmp/oe-test-linux-bb18/openembedded/packages/file/file-nativ=
e_
>4.20.bb, do_compile) not processed! (3)This is probably a circular
> dependency (the chain might be printed above).
> chris@linux64:~/tmp/oe-test-linux-bb18/build>
>
> Am Mittwoch, 7. M=E4rz 2007 15:26 schrieb Richard Purdie:
> > On Wed, 2007-03-07 at 12:17 +0100, Christopher Lang wrote:
> > > Richard,
> > >
> > > I did some tests with bb 1.8 and with same setup with 1.66.
> > >
> > > 1.66 works, 1.8 fails.
> > >
> > > results in: http://bugs.openembedded.org/show_bug.cgi?id=3D1944
> >
> > Sorry for the delay in getting to this, I had seen it and have now
> > committed a fix for the traceback. See the bug report but if you are
> > having dependency issues afterwards, please follow up this thread with
> > them, at least initially.
> >
> > Thanks,
> >
> > Richard
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


