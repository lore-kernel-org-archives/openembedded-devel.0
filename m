Received: from snvl-smtp1.trimble.com ([155.63.64.31])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernard_Mentink@trimble.com>) id 1QgioH-0002AN-Hj
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jul 2011 21:39:58 +0200
Received: (qmail 3379 invoked by uid 501); 12 Jul 2011 12:35:56 -0700
Received: from 10.3.0.166 by snvl-smtp1.trimble.com (envelope-from
	<Bernard_Mentink@trimble.com>, uid 108) with qmail-scanner-2.08 
	(clamdscan: 0.97.1/13313. avast: v3.2.0/110711-1. sophie:
	3.06/3.21.0/4.67. spamassassin: 3.3.1. Clear:RC:1(10.3.0.166):. 
	Processed in 0.037739 secs); 12 Jul 2011 19:35:56 -0000
Received: from unknown (HELO nzc-ap-xch-02.ap.trimblecorp.net) (10.3.0.166)
	by snvl-smtp1.trimble.com with SMTP; 12 Jul 2011 12:35:56 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 13 Jul 2011 07:35:54 +1200
Message-ID: <F7C0AA5DD1508F4789E10B6CC9BB75DB04AD2179@nzc-ap-xch-02.ap.trimblecorp.net>
In-Reply-To: <201107121016.47983.manningc2@actrix.gen.nz>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Debugging u-boot
Thread-Index: AcxAGEnPq33JO2ZdQHaUpt8U/Y/o2gAsjWdg
References: <F7C0AA5DD1508F4789E10B6CC9BB75DB04A78E50@nzc-ap-xch-02.ap.trimblecorp.net>
	<CAE21AQq6YfPtuqxKfBs5cCGvBeO4ALk4d+_iZpZOpGZyBUNETw@mail.gmail.com>
	<F7C0AA5DD1508F4789E10B6CC9BB75DB04A78FCB@nzc-ap-xch-02.ap.trimblecorp.net>
	<201107121016.47983.manningc2@actrix.gen.nz>
From: "Bernard Mentink" <Bernard_Mentink@trimble.com>
To: "Charles Manning" <manningc2@actrix.gen.nz>,
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Debugging u-boot
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
X-List-Received-Date: Tue, 12 Jul 2011 19:39:58 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Charles,

Building for Angstom and imx31 ..

Cheers,
Bernie=20


-------------------------------------------------------------------------=
-----------------
I want to die peacefully in my sleep, like my grandfather, not screaming =
and yelling like the passengers in his car.

-----Original Message-----
From: Charles Manning [mailto:manningc2@actrix.gen.nz]=20
Sent: Tuesday, 12 July 2011 10:17 a.m.
To: openembedded-devel@lists.openembedded.org
Cc: Bernard Mentink
Subject: Re: [oe] Debugging u-boot

Hmmm.

What are you building for?
Works fine for me using the Angstrom build for omap3 (beagleboard, overo =
etc).



On Friday 08 July 2011 07:25:04 Bernard Mentink wrote:
> Hi Charles,
>
> Tried that but got the following linker error:
>
> ---------------------------------------------------------- error
> ---------------------------------------
>
> |=20
> |/home/bernie/Stuff/build/tmp/sysroots/i686-linux/usr/armv6/arm-angstr
> |om-l
> |inux-gnueabi/bin/ld: failed to merge target specific data of file =20
> |emutls_s.o =20
> |/home/bernie/Stuff/build/tmp/sysroots/i686-linux/usr/armv6/arm-angstr
> |om-l
> |inux-gnueabi/bin/ld: error:
> |=20
> |/home/bernie/Stuff/build/tmp/work/i686-armv6-sdk-angstrom-linux-gnuea
> |bi/g=20
> |cc-cross-sdk-4.5-r36.2+svnr170880/gcc-4_5-branch/build.i686-linux.arm
> |-angs trom-linux-gnueabi/./gcc/crtendS.o uses VFP register arguments, =
=20
> |./libgcc_s.so.1.tmp does not =20
> |/home/bernie/Stuff/build/tmp/sysroots/i686-linux/usr/armv6/arm-angstr
> |om-l
> |inux-gnueabi/bin/ld: failed to merge target specific data of file =20
> |/home/bernie/Stuff/build/tmp/work/i686-armv6-sdk-angstrom-linux-gnuea
> |bi/g=20
> |cc-cross-sdk-4.5-r36.2+svnr170880/gcc-4_5-branch/build.i686-linux.arm
> |-angs trom-linux-gnueabi/./gcc/crtendS.o collect2: ld returned 1 exit =

> |status
> | make[2]: *** [libgcc_s.so] Error 1
> | make[2]: Leaving directory
> |=20
> |`/home/bernie/Stuff/build/tmp/work/i686-armv6-sdk-angstrom-linux-gnue
> |abi/=20
> |gcc-cross-sdk-4.5-r36.2+svnr170880/gcc-4_5-branch/build.i686-linux.ar
> |m-ang strom-linux-gnueabi/arm-angstrom-linux-gnueabi/libgcc' make[1]: =

> |***  [all-target-libgcc] Error 2
> | make[1]: Leaving directory
> |=20
> |`/home/bernie/Stuff/build/tmp/work/i686-armv6-sdk-angstrom-linux-gnue
> |abi/=20
> |gcc-cross-sdk-4.5-r36.2+svnr170880/gcc-4_5-branch/build.i686-linux.ar
> |m-ang strom-linux-gnueabi' make: *** [all] Error 2
> | + die 'oe_runmake failed'
> | + oefatal 'oe_runmake failed'
> | + echo FATAL
>
> NOTE: package gcc-cross-sdk-4.5-r36.2+svnr170880: task do_compile:=20
>Failed
> ERROR: Function 'do_compile' failed (see =20
>/home/bernie/Stuff/build/tmp/work/i686-armv6-sdk-angstrom-linux-gnueabi
>/gcc
>-cross-sdk-4.5-r36.2+svnr170880/temp/log.do_compile.14514 for further
> information) ERROR: Task 594
> (/home/bernie/Stuff/openembedded/recipes/gcc/gcc-cross-sdk_4.5.bb,
> do_compile) failed with exit code '1' ERROR:
> '/home/bernie/Stuff/openembedded/recipes/gcc/gcc-cross-sdk_4.5.bb'=20
>failed
>=20
>-----------------------------------------------------------------------
>----
>--------------------------
>
> Any idea what it could be?
>
> Cheers,
> bernie
>
>
>
>
>=20
>-----------------------------------------------------------------------
>----
>--------------- I want to die peacefully in my sleep, like my=20
>grandfather,  not screaming and yelling like the passengers in his car.
>
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf=20
> Of Charles Manning Sent: Thursday, 7 July 2011 1:52 p.m.
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] Debugging u-boot
>
> On Thu, Jul 7, 2011 at 1:13 PM, Bernard Mentink
<Bernard_Mentink@trimble.com> wrote:
> > Hi Charles,
> >
> > Didn't know you were lurking on this list ... ;-)
>
> You can run but you can't hide.
>
> > I have built for the angstom distro (arm-angstrom-linux-gnueabi-*),=20
> > but the tools got put in my project path I described in my earlier=20
> > email, but There was no GDB included for some reason ..
>
> The regular toolchian than oe builds for its own purposes does not use =

> gdb because gdb is not needed for building. That toolchain is intended =

> for use within OE bitbakery only.
>
> A meta-toolchain is built as a standalone toolchain intended for use=20
> outside of OE (eg. if you pull u-boot to a standalone directory for=20
> development purposes or want to do your own app development outside of =

> OE.)
>
> > How do you build the meta-toolchain, and how will that help.
>
> bitbake meta-toolchain.
>
> This makes a toolchain which you can unpack thus:
>
> $ cd /
> $ sudo tar xvjf
>=20
>${OETOP}/tmp/deploy/glibc/sdk/angstrom-2009.X-test-20110301-armv7a-linu
>x-gn
>ueabi-toolchain.tar.bz2
>
> [NB your toolchain name will be something different]
>
>
> To set up all the paths etc use
>
> . /usr/local/angstrom/arm/environment-setup
>
> Google openembedded metatoolchain will also give some interesting =
info.
>
> NB If you're building apps and need extra libraries you will need to=20
> make your own SDK. That's a bit more effort and you don't need all=20
> that just for gdbing u-boot
>
> -- Charles
>
> > Cheers,
> > Bernie
> >
> >
> > --------------------------------------------------------------------
> > --
> > -------------------- I want to die peacefully in my sleep, like my=20
> > grandfather, not screaming and yelling like the passengers in his =
car.
> >
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf =

> > Of Charles Manning
> > Sent: Thursday, 7 July 2011 12:38 p.m.
> > To: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] Debugging u-boot
> >
> > Bernie
> >
> > What toolchain are you building?
> >
> > If you build meta-toolchain that should build all the stuff you can=20
> > put into /usr/local/angstrom/arm/... which includes gdb.
> >
> > That should then work with a JTAG debugger etc.
> >
> > -- Charles
> >
> > On Thu, Jul 7, 2011 at 11:25 AM, Bernard Mentink
<Bernard_Mentink@trimble.com> wrote:
> >> Hi All,
> >>
> >> Can some one please tell me how to debug u-boot =A0on my target. I=20
> >> have built u-boot for similar hardware and I want to debug with=20
> >> gdb, but cannot even find the cross-compile version of gdb, It does =

> >> not exist in the directory=20
> >> "build/tmp/sysroots/i686-linux/usr/armv6/bin/" where the other =
cross-compile tools live ..
> >>
> >> I want to execute "${CROSS_COMPILE}gdb u-boot"
> >> =A0.. and breakpoint at some very early symbol ..... Some steps to=20
> >> achieving this would be much appreciated ..
> >>
> >> Many Thanks,
> >> Bernie
> >>
> >>
> >>
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-de
> >> ve
> >> l
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-dev
> > el
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-dev
> > el
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




