Return-Path: <B40290@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0136.outbound.protection.outlook.com [65.55.169.136])
	by mail.openembedded.org (Postfix) with ESMTP id 9D3F57210A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Nov 2014 08:13:12 +0000 (UTC)
Received: from BY2PR03MB441.namprd03.prod.outlook.com (10.141.141.142) by
	BY2PR03MB441.namprd03.prod.outlook.com (10.141.141.142) with Microsoft
	SMTP Server (TLS) id 15.1.16.15; Thu, 13 Nov 2014 07:57:12 +0000
Received: from BY2PR03MB441.namprd03.prod.outlook.com ([10.141.141.142]) by
	BY2PR03MB441.namprd03.prod.outlook.com ([10.141.141.142]) with mapi id
	15.01.0016.006; Thu, 13 Nov 2014 07:57:12 +0000
From: "B40290@freescale.com" <B40290@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] runqemu + Layerscape1 kernel
Thread-Index: AQHP/wPYl3vQy1E/OEyNNwi8n6+r5ZxeLWXw
Date: Thu, 13 Nov 2014 07:57:12 +0000
Message-ID: <a728293875ff476c8248717ee811a481@BY2PR03MB441.namprd03.prod.outlook.com>
References: <2d93949c468142ae8569ded7377786c5@BY2PR03MB441.namprd03.prod.outlook.com>
	<CAMKF1sp2mQx3q2KHsEcF38AgqzoeHSVbMqnhoZOfXFbu_6sHfQ@mail.gmail.com>
In-Reply-To: <CAMKF1sp2mQx3q2KHsEcF38AgqzoeHSVbMqnhoZOfXFbu_6sHfQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [123.151.195.1]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB441;
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB441;
x-forefront-prvs: 0394259C80
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(24454002)(164054003)(199003)(13464003)(189002)(377454003)(51704005)(99286002)(19580395003)(105586002)(64706001)(108616004)(46102003)(40100003)(20776003)(76576001)(74316001)(551544002)(19580405001)(15975445006)(122556002)(66066001)(99396003)(15202345003)(120916001)(97736003)(33646002)(95666004)(50986999)(76176999)(54356999)(77156002)(2656002)(62966003)(101416001)(92566001)(86362001)(107046002)(87936001)(106116001)(107886001)(2351001)(450100001)(106356001)(4396001)(31966008)(110136001)(21056001)(24736002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR03MB441;
	H:BY2PR03MB441.namprd03.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: runqemu + Layerscape1 kernel
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Nov 2014 08:13:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I had been able  the following options in kernel.

<*> ARM AMBA PL011 serial port support                       =20
 [*]   Support for console on AMBA serial port


Thanks
Chunrong


-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Khem Raj
Sent: Thursday, November 13, 2014 1:36 PM
To: openembeded-devel
Subject: Re: [oe] runqemu + Layerscape1 kernel

On Wed, Nov 12, 2014 at 11:01 PM, B40290@freescale.com <B40290@freescale.co=
m> wrote:
> Hello,
>
> I am trying to startup  Layerscape1  kernel  in qemu-system-arm.
>
> Qemu-system-arm  do not  restart  Layerscape1   kernel .
>
>
> There is the following log information:
>
> [b40290@eclipse build]$ runqemu qemuarm /home/b40290/zImage.bin=20
> /home/b40290/opensource/poky/build/tmp/deploy/qemuarm/core-image-sato-
> qemuarm.ext3
>
> Continuing with the following parameters:
> KERNEL: [/home/b40290/zImage.bin]
> ROOTFS:=20
> [/home/b40290/opensource/poky/build/tmp/deploy/qemuarm/core-image-sato
> -qemuarm.ext3]
> FSTYPE: [ext3]
> Setting up tap interface under sudo
> [sudo] password for b40290:
> Acquiring lockfile for tap0...
> Running qemu-system-arm...
> /home/b40290/opensource/poky/build/tmp/sysroots/x86_64-linux/usr/bin/qemu=
-system-arm -kernel /home/b40290/zImage.bin -net nic,vlan=3D0 -net tap,vlan=
=3D0,ifname=3Dtap0,script=3Dno,downscript=3Dno -M versatilepb -hda /home/b4=
0290/opensource/poky/build/tmp/deploy/qemuarm/core-image-sato-qemuarm.ext3 =
-no-reboot -show-cursor -usb -usbdevice wacom-tablet -no-reboot -m 128 --ap=
pend "root=3D/dev/sda rw console=3DttyAMA0,115200 console=3Dtty ip=3D192.16=
8.7.2::192.168.7.1:255.255.255.0 mem=3D128M highres=3Doff "
>
>
> Does anyone know if there is something that I am missing?


is you console=3D matching to what kernel expects ?
>
>
> Thanks,
> Chunrong
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

