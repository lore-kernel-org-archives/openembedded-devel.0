Received: from [62.250.3.53] (helo=relay.versatel.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <linux@hf-electronics.com>) id 1Kun8G-0001bV-Sm
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Oct 2008 12:53:08 +0100
Received: from [62.58.160.127] (helo=hf-electronics.com)
	by relay.versatel.net with smtp (Exim 4.69)
	(envelope-from <linux@hf-electronics.com>) id 1Kun7Q-0002wk-MZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Oct 2008 12:52:16 +0100
Received: from <linux@hf-electronics.com> with PostMaster 4.3.2 (MPS);
	Tue, 28 Oct 2008 12:48:24 +100
From: "Henk Geraads" <linux@hf-electronics.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Oct 2008 12:51:30 +0100
Message-ID: <NGBBLNEOGLJIIJKLFLPFEEAMDKAA.linux@hf-electronics.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.6604 (9.0.2911.0)
Importance: Normal
In-Reply-To: <NGBBLNEOGLJIIJKLFLPFMEAKDKAA.linux@hf-electronics.com>
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.5579
Subject: Re: Problems building a kernelmodule for OE
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
X-List-Received-Date: Tue, 28 Oct 2008 11:53:09 -0000
Content-Type: text/plain;
	charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Hi Stanislav,

Found the problem with __LINUX_ARM_ARCH__!
the "-march=3Darmv5t"  in the makefie compiler line did mess up things!!
the include of the "pxa-regs.h" and "gpio.h" solved the other problem.

Now I've got strange error's from the linker;
	make[2]: *** [/home/henk/SystemDev/module/cfi-ktst/cfi-mod.ko] Error =
1
	make[1]: *** [modules] Error 2
	make: *** [default] Error 2
	arm-angstrom-linux-gnueabi-ld: unrecognized option '-Wl,-rpath-link,/=
home/armcore/oe/build/tmp/angstrom/staging/arm-angstrom-linux-gnueabi/=
lib'
	arm-angstrom-linux-gnueabi-ld: use the --help option for usage inform=
ation
	make[2]: *** [/home/henk/SystemDev/module/cfi-ktst/cfi-mod.ko] Error =
1
	make[1]: *** [modules] Error 2
	make: *** [default] Error 2

I thought linker option's are very common?

Henk



> -----Oorspronkelijk bericht-----
> Van: Henk Geraads [mailto:linux@hf-electronics.com]
> Verzonden: dinsdag 28 oktober 2008 10:16
> Aan: openembedded-devel@lists.openembedded.org
> Onderwerp: RE: [oe] Problems building a kernelmodule for OE
>=20
>=20
> Hi Stanislav
>=20
> questions,
>=20
> > -----Oorspronkelijk bericht-----
> > Van: openembedded-devel-bounces@lists.openembedded.org=20
> > [mailto:openembedded-devel-bounces@lists.openembedded.org]Namens=
=20
> > Stanislav Brabec
> > Verzonden: maandag 27 oktober 2008 16:56
> > Aan: openembedded-devel@lists.openembedded.org
> > Onderwerp: Re: [oe] Problems building a kernelmodule for OE
> >=20
> >=20
> > Henk Geraads wrote:
> >=20
> > > when I try to make the module, following error message is produc=
ed!
> >=20
> > It seems, that source code is a bit outdated (intended for older k=
ernel
> > that you have) or you are compiling it in a bad way.
> >=20
> > > 	include/linux/calc64.h:25: error: '__LINUX_ARM_ARCH__'=20
> > undeclared (first use in this function)
> >=20
> > Strange. It should be defined.
>=20
> Where should it be defined?
>=20
> >=20
> > > 	/home/henk/cm270/fifodrv/cfi-ktst/cfi-mod.c:67: warning:=20
> > implicit declaration of function 'GPLR'
> > > 	/home/henk/cm270/fifodrv/cfi-ktst/cfi-mod.c:67: warning:=20
> > implicit declaration of function 'GPIO_bit'
> > > 	/home/henk/cm270/fifodrv/cfi-ktst/cfi-mod.c: In function 'cfi_i=
nit':
> > > 	/home/henk/cm270/fifodrv/cfi-ktst/cfi-mod.c:204: error:=20
> > 'GPIO_IN' undeclared (first use in this function)
> > > 	/home/henk/cm270/fifodrv/cfi-ktst/cfi-mod.c:208: error:=20
> > 'MSC1' undeclared (first use in this function)
> > > 	/home/henk/cm270/fifodrv/cfi-ktst/cfi-mod.c:209: error:=20
> > 'GPIO79_nCS_3_MD' undeclared (first use in this function)
> >=20
> > It indicates that you need to include asm/arch/pxa2xx-regs.h and
> > asm/arch/pxa2xx-gpio.h.
>=20
> Are these not covered by including "asm/uaccess.h" and "asm/io.h" ?
>=20
> >=20
> > --=20
> > Best Regards / S pozdravem,
> >=20
> > Stanislav Brabec
> > software developer
> > ------------------------------------------------------------------=
---
> > SUSE LINUX, s. r. o.                          e-mail: sbrabec@suse=
=2Ecz
> > Lihovarsk=E1 1060/12           tel: +420 284 028 966, +49 911 7405387=
47
> > 190 00 Praha 9                                  fax: +420 284 028 =
951
> > Czech Republic                                    http://www.suse.=
cz/
> >=20
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-d=
evel




