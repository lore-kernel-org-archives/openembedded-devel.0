Received: from snvl-smtp1.trimble.com ([155.63.64.31])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernard_Mentink@trimble.com>) id 1QluEp-0006B7-2V
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jul 2011 04:52:47 +0200
Received: (qmail 16491 invoked by uid 501); 26 Jul 2011 19:48:30 -0700
Received: from 10.3.0.166 by snvl-smtp1.trimble.com (envelope-from
	<Bernard_Mentink@trimble.com>, uid 108) with qmail-scanner-2.08 
	(clamdscan: 0.97.1/13361. avast: v3.2.0/110725-1. sophie:
	3.06/3.21.0/4.67. spamassassin: 3.3.1. Clear:RC:1(10.3.0.166):. 
	Processed in 0.03976 secs); 27 Jul 2011 02:48:30 -0000
Received: from unknown (HELO nzc-ap-xch-02.ap.trimblecorp.net) (10.3.0.166)
	by snvl-smtp1.trimble.com with SMTP; 26 Jul 2011 19:48:30 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 27 Jul 2011 14:48:28 +1200
Message-ID: <F7C0AA5DD1508F4789E10B6CC9BB75DB04B1F9D5@nzc-ap-xch-02.ap.trimblecorp.net>
In-Reply-To: <F7C0AA5DD1508F4789E10B6CC9BB75DB04B1F8E2@nzc-ap-xch-02.ap.trimblecorp.net>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Kernel load address issue
Thread-Index: AcxL4y7TQKezOhfeRxKVlxIm0o5YhAAAEKhgAAdvTdA=
References: <F7C0AA5DD1508F4789E10B6CC9BB75DB04B1F8B5@nzc-ap-xch-02.ap.trimblecorp.net><20110726220305.GA15286@jama.jama.net><F7C0AA5DD1508F4789E10B6CC9BB75DB04B1F8D9@nzc-ap-xch-02.ap.trimblecorp.net><20110726222646.GB15286@jama.jama.net>
	<F7C0AA5DD1508F4789E10B6CC9BB75DB04B1F8E2@nzc-ap-xch-02.ap.trimblecorp.net>
From: "Bernard Mentink" <Bernard_Mentink@trimble.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: Kernel load address issue
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
X-List-Received-Date: Wed, 27 Jul 2011 02:52:47 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

=20
I have got a bit further now, I get:

-----------------------------------------------------
uboot> bootm 80400000
## Booting kernel from Legacy Image at 80400000 ...
   Image Name:   Angstrom/2.6.36/mx31ads
   Created:      2011-07-26  22:30:37 UTC
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    1765848 Bytes =3D 1.7 MiB
   Load Address: 80400000
   Entry Point:  80400000
   Verifying Checksum ... OK
   XIP Kernel Image ... OK
OK

Starting kernel ...
----------------------------------------------------

And there it hangs ... I don't know who printed out the "Starting
kernel" was it uboot or the kernel?
If uboot, how do I pass kernel arguments (i.e the console serial params)
with this method of booting?

(I am using: " dhcp 0x80400000 IP:file" followed by the above bootm .. )

Thanks,
Bernie


-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
Bernard Mentink
Sent: Wednesday, 27 July 2011 10:32 a.m.
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] Kernel load address issue

Hi Martin,

Thanks for that (and to Gary for the same answer) ..

By the way, where do I find this sort of information out? I especially
would like to know how to configure the kernel, modify source code etc,
Within the openembedded system ..

Are there some good "howto's" out there?

Thanks,
Bernie=20


------------------------------------------------------------------------
------------------
I want to die peacefully in my sleep, like my grandfather, not screaming
and yelling like the passengers in his car.

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
Martin Jansa
Sent: Wednesday, 27 July 2011 10:27 a.m.
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] Kernel load address issue

On Wed, Jul 27, 2011 at 10:14:50AM +1200, Bernard Mentink wrote:
> Many thanks for the reply,
>=20
> By the way where is the machine.conf file, I can't seem to find it=20
> anywhere ..

in your case probably
conf/machine/mx31ads.conf or something like that

I meant ${MACHINE}.conf and machine.conf was just example, sorry I
wasn't clear.

Cheers,

>=20
> Cheers,
> Bernie
>=20
>=20
> ----------------------------------------------------------------------
> --
> ------------------
> I want to die peacefully in my sleep, like my grandfather, not=20
> screaming and yelling like the passengers in his car.
>=20
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf=20
> Of Martin Jansa
> Sent: Wednesday, 27 July 2011 10:03 a.m.
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] Kernel load address issue
>=20
> On Wed, Jul 27, 2011 at 09:51:28AM +1200, Bernard Mentink wrote:
> >=20
> > Hi Guys,
> >=20
> > I am new to OE, but have managed to get u-boot working on my target,

> > got TFTP working so I can transfer a kernel to RAM.
> > I have modified my conf/local.conf file so that when a kernel is=20
> > built
>=20
> > a uImage binary is created that u-boot can use. (added line=20
> > KERNEL_IMAGETYPE =3D "uImage")
> >=20
> > However When I try to boot the image in the bootloader, I get this:
> >=20
> > uboot> bootm 0x80300000
> > ## Booting kernel from Legacy Image at 80300000 ...
> >    Image Name:   Angstrom/2.6.36/mx31ads
> >    Created:      2011-07-26  19:55:31 UTC
> >    Image Type:   ARM Linux Kernel Image (uncompressed)
> >    Data Size:    1765856 Bytes =3D 1.7 MiB
> >    Load Address: 20008000
> >    Entry Point:  20008000
>=20
> machine.conf can define
> UBOOT_ENTRYPOINT =3D "0x80008000"
> UBOOT_LOADADDRESS =3D "0x80008000"
>=20
> both used in kernel.bbclass
> /OE/dev/classes/kernel.bbclass:UBOOT_ENTRYPOINT ?=3D "20008000"
> /OE/dev/classes/kernel.bbclass:UBOOT_LOADADDRESS ?=3D=20
> "${UBOOT_ENTRYPOINT}"
> /OE/dev/classes/kernel.bbclass:            uboot-mkimage -A
> ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e=20
> $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin=20
> arch/${ARCH}/boot/uImage
>=20
> Cheers,
>=20
> >    Verifying Checksum ... OK
> >    Loading Kernel Image ...   <-- gets stuck here! ...
> >=20
> > The Load Address is wrong, my ram starts at 0x80000000 ... can=20
> > someone
>=20
> > tell me how to change this? I presume mkimage is responsible for=20
> > this as the kernel is configured as relocatable ..
> >=20
> > Many Thanks,
> > Bernie
> >=20
> >=20
> >=20
> >=20
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-dev
> > el
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


