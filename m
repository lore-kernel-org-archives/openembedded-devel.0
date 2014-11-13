Return-Path: <B40290@freescale.com>
X-Greylist: delayed 1030 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 13 Nov 2014 04:33:13 UTC
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0144.outbound.protection.outlook.com [65.55.169.144])
	by mail.openembedded.org (Postfix) with ESMTP id 8026B65C91
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Nov 2014 04:33:13 +0000 (UTC)
Received: from BY2PR03MB441.namprd03.prod.outlook.com (10.141.141.142) by
	BY2PR03MB443.namprd03.prod.outlook.com (10.141.141.152) with Microsoft
	SMTP Server (TLS) id 15.1.16.15; Thu, 13 Nov 2014 04:01:27 +0000
Received: from BY2PR03MB441.namprd03.prod.outlook.com ([10.141.141.142]) by
	BY2PR03MB441.namprd03.prod.outlook.com ([10.141.141.142]) with mapi id
	15.01.0016.006; Thu, 13 Nov 2014 04:01:27 +0000
From: "B40290@freescale.com" <B40290@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: runqemu + Layerscape1  kernel    
Thread-Index: Ac/+9n1YvkzwzqubSv+rJL4hiw0zPA==
Date: Thu, 13 Nov 2014 04:01:26 +0000
Message-ID: <2d93949c468142ae8569ded7377786c5@BY2PR03MB441.namprd03.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [123.151.195.49]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB443;
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB443;
x-forefront-prvs: 0394259C80
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(164054003)(189002)(199003)(15975445006)(92566001)(95666004)(19300405004)(33646002)(86362001)(229853001)(99286002)(551544002)(19625215002)(19580395003)(19580405001)(15202345003)(110136001)(107886001)(2351001)(107046002)(97736003)(50986999)(101416001)(54356999)(105586002)(106356001)(31966008)(18717965001)(19609705001)(2656002)(77156002)(62966003)(450100001)(87936001)(40100003)(122556002)(20776003)(16236675004)(64706001)(76576001)(4396001)(99396003)(46102003)(74316001)(66066001)(21056001)(120916001)(108616004)(24736002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR03MB443;
	H:BY2PR03MB441.namprd03.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: runqemu + Layerscape1 kernel
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
X-List-Received-Date: Thu, 13 Nov 2014 04:33:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I am trying to startup  Layerscape1  kernel  in qemu-system-arm.

Qemu-system-arm  do not  restart  Layerscape1   kernel .


There is the following log information:

[b40290@eclipse build]$ runqemu qemuarm /home/b40290/zImage.bin /home/b4029=
0/opensource/poky/build/tmp/deploy/qemuarm/core-image-sato-qemuarm.ext3

Continuing with the following parameters:
KERNEL: [/home/b40290/zImage.bin]
ROOTFS: [/home/b40290/opensource/poky/build/tmp/deploy/qemuarm/core-image-s=
ato-qemuarm.ext3]
FSTYPE: [ext3]
Setting up tap interface under sudo
[sudo] password for b40290:
Acquiring lockfile for tap0...
Running qemu-system-arm...
/home/b40290/opensource/poky/build/tmp/sysroots/x86_64-linux/usr/bin/qemu-s=
ystem-arm -kernel /home/b40290/zImage.bin -net nic,vlan=3D0 -net tap,vlan=
=3D0,ifname=3Dtap0,script=3Dno,downscript=3Dno -M versatilepb -hda /home/b4=
0290/opensource/poky/build/tmp/deploy/qemuarm/core-image-sato-qemuarm.ext3 =
-no-reboot -show-cursor -usb -usbdevice wacom-tablet -no-reboot -m 128 --ap=
pend "root=3D/dev/sda rw console=3DttyAMA0,115200 console=3Dtty ip=3D192.16=
8.7.2::192.168.7.1:255.255.255.0 mem=3D128M highres=3Doff "


Does anyone know if there is something that I am missing?


Thanks,
Chunrong


