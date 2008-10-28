Received: from [62.250.3.53] (helo=relay.versatel.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <linux@hf-electronics.com>) id 1KukiW-0005Kw-T7
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Oct 2008 10:18:30 +0100
Received: from [62.58.160.127] (helo=hf-electronics.com)
	by relay.versatel.net with smtp (Exim 4.69)
	(envelope-from <linux@hf-electronics.com>) id 1Kukhg-0002x3-SY
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Oct 2008 10:17:33 +0100
Received: from <linux@hf-electronics.com> with PostMaster 4.3.2 (MPS);
	Tue, 28 Oct 2008 10:13:45 +100
From: "Henk Geraads" <linux@hf-electronics.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Oct 2008 10:15:57 +0100
Message-ID: <NGBBLNEOGLJIIJKLFLPFMEAKDKAA.linux@hf-electronics.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.6604 (9.0.2911.0)
Importance: Normal
In-Reply-To: <1225122986.5129.41.camel@hammer.suse.cz>
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
X-List-Received-Date: Tue, 28 Oct 2008 09:21:23 -0000
Content-Type: text/plain;
	charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Hi Stanislav

questions,

> -----Oorspronkelijk bericht-----
> Van: openembedded-devel-bounces@lists.openembedded.org=20
> [mailto:openembedded-devel-bounces@lists.openembedded.org]Namens=20
> Stanislav Brabec
> Verzonden: maandag 27 oktober 2008 16:56
> Aan: openembedded-devel@lists.openembedded.org
> Onderwerp: Re: [oe] Problems building a kernelmodule for OE
>=20
>=20
> Henk Geraads wrote:
>=20
> > when I try to make the module, following error message is produced=
!
>=20
> It seems, that source code is a bit outdated (intended for older ker=
nel
> that you have) or you are compiling it in a bad way.
>=20
> > 	include/linux/calc64.h:25: error: '__LINUX_ARM_ARCH__'=20
> undeclared (first use in this function)
>=20
> Strange. It should be defined.

Where should it be defined?

>=20
> > 	/home/henk/cm270/fifodrv/cfi-ktst/cfi-mod.c:67: warning:=20
> implicit declaration of function 'GPLR'
> > 	/home/henk/cm270/fifodrv/cfi-ktst/cfi-mod.c:67: warning:=20
> implicit declaration of function 'GPIO_bit'
> > 	/home/henk/cm270/fifodrv/cfi-ktst/cfi-mod.c: In function 'cfi_ini=
t':
> > 	/home/henk/cm270/fifodrv/cfi-ktst/cfi-mod.c:204: error:=20
> 'GPIO_IN' undeclared (first use in this function)
> > 	/home/henk/cm270/fifodrv/cfi-ktst/cfi-mod.c:208: error:=20
> 'MSC1' undeclared (first use in this function)
> > 	/home/henk/cm270/fifodrv/cfi-ktst/cfi-mod.c:209: error:=20
> 'GPIO79_nCS_3_MD' undeclared (first use in this function)
>=20
> It indicates that you need to include asm/arch/pxa2xx-regs.h and
> asm/arch/pxa2xx-gpio.h.

Are these not covered by including "asm/uaccess.h" and "asm/io.h" ?

>=20
> --=20
> Best Regards / S pozdravem,
>=20
> Stanislav Brabec
> software developer
> --------------------------------------------------------------------=
-
> SUSE LINUX, s. r. o.                          e-mail: sbrabec@suse.c=
z
> Lihovarsk=E1 1060/12           tel: +420 284 028 966, +49 911 740538747
> 190 00 Praha 9                                  fax: +420 284 028 95=
1
> Czech Republic                                    http://www.suse.cz=
/
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-dev=
el




