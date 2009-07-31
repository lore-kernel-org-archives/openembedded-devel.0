Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MWsL0-00075e-Cx
	for openembedded-devel@openembedded.org; Fri, 31 Jul 2009 15:39:58 +0200
Received: (qmail 28959 invoked by uid 813007); 31 Jul 2009 13:24:46 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 31 Jul 2009 13:24:46 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Jul 2009 15:24:41 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4-00009-g83a3792-dirty; KDE/4.2.96;
	x86_64; ; )
References: <4A6FD077.1060001@gmail.com> <4A72D676.6060304@xora.org.uk>
	<6ec4247d0907310535h345a22a9sfe98c6cae8336aaf@mail.gmail.com>
In-Reply-To: <6ec4247d0907310535h345a22a9sfe98c6cae8336aaf@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200907311524.44818.marcin@juszkiewicz.com.pl>
Subject: Re: [PATCH] remove duplicated code from linux.inc
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
X-List-Received-Date: Fri, 31 Jul 2009 13:39:59 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia pi=C4=85tek, 31 lipca 2009 o 14:35:19 Graham Gower napisa=C5=82(a):
> And for those playing at home, the value to assign to UBOOT_ENTRYSYM
> for a given arch can be found by grepping
> linux/arch/${ARCH}/kernel/vmlinux.lds.S for 'ENTRY'.

So according to your post for ARM it will be 'stext':

15:10 hrw@home:linux-2.6.30$ grep ^ENTRY arch/arm/kernel/vmlinux.lds.S
ENTRY(stext)

=46or AT91SAM9263-EK we get:

15:10 hrw@home:linux-2.6.30$ arm-angstrom-linux-gnueabi-nm vmlinux|grep=20
stext
c0008000 T _stext
c0008000 T stext

But when I boot this device I have:

## Booting kernel from Legacy Image at 22200000 ...                        =
                                                                           =
    =20
   Image Name:   Angstrom/2.6.30/at91sam9263ek                             =
                                                                           =
    =20
   Image Type:   ARM Linux Kernel Image (uncompressed)                     =
                                                                           =
    =20
   Data Size:    2074384 Bytes =3D  2 MB                                   =
                                                                           =
      =20
   Load Address: 20008000                                                  =
                                                                           =
    =20
   Entry Point:  20008000                                                  =
                                                                           =
    =20
   Verifying Checksum ... OK                                               =
                                                                           =
    =20
   Loading Kernel Image ... OK                                             =
                                                                           =
    =20

So entry point is different.

=46or NHK15 which runs kernel 2.6.20 I got "stext" same as Entry point=20
used by U-Boot:

15:12 hrw@home:linux-2.6.20$ arm-angstrom-linux-gnueabi-nm vmlinux|grep=20
stext
c0008000 T _stext
c02bcba0 t snstext
c0008000 T stext

## Booting image at 00100000 ...
   Image Name:   Linux-2.6.20  =20
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    1714260 Bytes =3D  1.6 MB             =20
   Load Address: 00008000                            =20
   Entry Point:  00008000                            =20
OK         =20

=46or BUG which runs 2.6.27.2 I got:

15:16 hrw@home:bug-linux-2.6.27.2$ arm-angstrom-linux-gnueabi-nm=20
vmlinux|grep stext
c0008000 T _stext
c0008000 T stext

When U-Boot says:

## Booting kernel from Legacy Image at 80800000 ...
   Image Name:   Linux-2.6.27.2
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    1722736 Bytes =3D  1.6 MB
   Load Address: 80008000
   Entry Point:  80008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK

I also have avr32 NGW100 but lack kernel tree for it to check values.=20
Can test will those devices boot with entry point set to 0x00080000=20
address.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




