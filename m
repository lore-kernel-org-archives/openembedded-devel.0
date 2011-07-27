Received: from tritech.se ([91.191.137.61])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1QlxEJ-0008V4-PM
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jul 2011 08:04:27 +0200
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id p6R608fb016343
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2011 08:00:13 +0200
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%11]) with mapi id
	14.01.0270.001; Wed, 27 Jul 2011 08:00:08 +0200
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Kernel load address issue
Thread-Index: AcxL3ixhju5iEE6KQd227paPZ9oLdf//4beAgAADSACAAANXgIAAAVKAgABHywCAAFVuvg==
Date: Wed, 27 Jul 2011 06:00:07 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4003C1EB@post.tritech.se>
References: <F7C0AA5DD1508F4789E10B6CC9BB75DB04B1F8B5@nzc-ap-xch-02.ap.trimblecorp.net><20110726220305.GA15286@jama.jama.net><F7C0AA5DD1508F4789E10B6CC9BB75DB04B1F8D9@nzc-ap-xch-02.ap.trimblecorp.net><20110726222646.GB15286@jama.jama.net>
	<F7C0AA5DD1508F4789E10B6CC9BB75DB04B1F8E2@nzc-ap-xch-02.ap.trimblecorp.net>,
	<F7C0AA5DD1508F4789E10B6CC9BB75DB04B1F9D5@nzc-ap-xch-02.ap.trimblecorp.net>
In-Reply-To: <F7C0AA5DD1508F4789E10B6CC9BB75DB04B1F9D5@nzc-ap-xch-02.ap.trimblecorp.net>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.34]
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 27 Jul 2011 06:04:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Bernard,=0A=
=0A=
U-Boot prints "Starting kernel" (in your case probably from "lib_arm/bootm.=
c").=0A=
=0A=
Setting boot arguments from U-Boot before bootm: setenv bootargs "...your a=
rgs..."=0A=
=0A=
// Mats=0A=
________________________________________=0A=
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] on behalf of Bernard Mentink [Bernard_Ment=
ink@trimble.com]=0A=
Sent: Wednesday, July 27, 2011 4:48 AM=0A=
To: openembedded-devel@lists.openembedded.org=0A=
Subject: Re: [oe] Kernel load address issue=0A=
=0A=
I have got a bit further now, I get:=0A=
=0A=
-----------------------------------------------------=0A=
uboot> bootm 80400000=0A=
## Booting kernel from Legacy Image at 80400000 ...=0A=
   Image Name:   Angstrom/2.6.36/mx31ads=0A=
   Created:      2011-07-26  22:30:37 UTC=0A=
   Image Type:   ARM Linux Kernel Image (uncompressed)=0A=
   Data Size:    1765848 Bytes =3D 1.7 MiB=0A=
   Load Address: 80400000=0A=
   Entry Point:  80400000=0A=
   Verifying Checksum ... OK=0A=
   XIP Kernel Image ... OK=0A=
OK=0A=
=0A=
Starting kernel ...=0A=
----------------------------------------------------=0A=
=0A=
And there it hangs ... I don't know who printed out the "Starting=0A=
kernel" was it uboot or the kernel?=0A=
If uboot, how do I pass kernel arguments (i.e the console serial params)=0A=
with this method of booting?=0A=
=0A=
(I am using: " dhcp 0x80400000 IP:file" followed by the above bootm .. )=0A=
=0A=
Thanks,=0A=
Bernie=0A=
=0A=
=0A=
-----Original Message-----=0A=
From: openembedded-devel-bounces@lists.openembedded.org=0A=
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of=0A=
Bernard Mentink=0A=
Sent: Wednesday, 27 July 2011 10:32 a.m.=0A=
To: openembedded-devel@lists.openembedded.org=0A=
Subject: Re: [oe] Kernel load address issue=0A=
=0A=
Hi Martin,=0A=
=0A=
Thanks for that (and to Gary for the same answer) ..=0A=
=0A=
By the way, where do I find this sort of information out? I especially=0A=
would like to know how to configure the kernel, modify source code etc,=0A=
Within the openembedded system ..=0A=
=0A=
Are there some good "howto's" out there?=0A=
=0A=
Thanks,=0A=
Bernie=0A=
=0A=
=0A=
------------------------------------------------------------------------=0A=
------------------=0A=
I want to die peacefully in my sleep, like my grandfather, not screaming=0A=
and yelling like the passengers in his car.=0A=
=0A=
-----Original Message-----=0A=
From: openembedded-devel-bounces@lists.openembedded.org=0A=
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of=0A=
Martin Jansa=0A=
Sent: Wednesday, 27 July 2011 10:27 a.m.=0A=
To: openembedded-devel@lists.openembedded.org=0A=
Subject: Re: [oe] Kernel load address issue=0A=
=0A=
On Wed, Jul 27, 2011 at 10:14:50AM +1200, Bernard Mentink wrote:=0A=
> Many thanks for the reply,=0A=
>=0A=
> By the way where is the machine.conf file, I can't seem to find it=0A=
> anywhere ..=0A=
=0A=
in your case probably=0A=
conf/machine/mx31ads.conf or something like that=0A=
=0A=
I meant ${MACHINE}.conf and machine.conf was just example, sorry I=0A=
wasn't clear.=0A=
=0A=
Cheers,=0A=
=0A=
>=0A=
> Cheers,=0A=
> Bernie=0A=
>=0A=
>=0A=
> ----------------------------------------------------------------------=0A=
> --=0A=
> ------------------=0A=
> I want to die peacefully in my sleep, like my grandfather, not=0A=
> screaming and yelling like the passengers in his car.=0A=
>=0A=
> -----Original Message-----=0A=
> From: openembedded-devel-bounces@lists.openembedded.org=0A=
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf=0A=
> Of Martin Jansa=0A=
> Sent: Wednesday, 27 July 2011 10:03 a.m.=0A=
> To: openembedded-devel@lists.openembedded.org=0A=
> Subject: Re: [oe] Kernel load address issue=0A=
>=0A=
> On Wed, Jul 27, 2011 at 09:51:28AM +1200, Bernard Mentink wrote:=0A=
> >=0A=
> > Hi Guys,=0A=
> >=0A=
> > I am new to OE, but have managed to get u-boot working on my target,=0A=
=0A=
> > got TFTP working so I can transfer a kernel to RAM.=0A=
> > I have modified my conf/local.conf file so that when a kernel is=0A=
> > built=0A=
>=0A=
> > a uImage binary is created that u-boot can use. (added line=0A=
> > KERNEL_IMAGETYPE =3D "uImage")=0A=
> >=0A=
> > However When I try to boot the image in the bootloader, I get this:=0A=
> >=0A=
> > uboot> bootm 0x80300000=0A=
> > ## Booting kernel from Legacy Image at 80300000 ...=0A=
> >    Image Name:   Angstrom/2.6.36/mx31ads=0A=
> >    Created:      2011-07-26  19:55:31 UTC=0A=
> >    Image Type:   ARM Linux Kernel Image (uncompressed)=0A=
> >    Data Size:    1765856 Bytes =3D 1.7 MiB=0A=
> >    Load Address: 20008000=0A=
> >    Entry Point:  20008000=0A=
>=0A=
> machine.conf can define=0A=
> UBOOT_ENTRYPOINT =3D "0x80008000"=0A=
> UBOOT_LOADADDRESS =3D "0x80008000"=0A=
>=0A=
> both used in kernel.bbclass=0A=
> /OE/dev/classes/kernel.bbclass:UBOOT_ENTRYPOINT ?=3D "20008000"=0A=
> /OE/dev/classes/kernel.bbclass:UBOOT_LOADADDRESS ?=3D=0A=
> "${UBOOT_ENTRYPOINT}"=0A=
> /OE/dev/classes/kernel.bbclass:            uboot-mkimage -A=0A=
> ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e=0A=
> $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin=0A=
> arch/${ARCH}/boot/uImage=0A=
>=0A=
> Cheers,=0A=
>=0A=
> >    Verifying Checksum ... OK=0A=
> >    Loading Kernel Image ...   <-- gets stuck here! ...=0A=
> >=0A=
> > The Load Address is wrong, my ram starts at 0x80000000 ... can=0A=
> > someone=0A=
>=0A=
> > tell me how to change this? I presume mkimage is responsible for=0A=
> > this as the kernel is configured as relocatable ..=0A=
> >=0A=
> > Many Thanks,=0A=
> > Bernie=0A=
> >=0A=
> >=0A=
> >=0A=
> >=0A=
> >=0A=
> > _______________________________________________=0A=
> > Openembedded-devel mailing list=0A=
> > Openembedded-devel@lists.openembedded.org=0A=
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-dev=0A=
> > el=0A=
>=0A=
> --=0A=
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com=0A=
>=0A=
> _______________________________________________=0A=
> Openembedded-devel mailing list=0A=
> Openembedded-devel@lists.openembedded.org=0A=
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=0A=
=0A=
--=0A=
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com=0A=
=0A=
_______________________________________________=0A=
Openembedded-devel mailing list=0A=
Openembedded-devel@lists.openembedded.org=0A=
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=0A=
=0A=
_______________________________________________=0A=
Openembedded-devel mailing list=0A=
Openembedded-devel@lists.openembedded.org=0A=
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=0A=


