Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7406465C91
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Nov 2014 05:36:08 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id x19so15138120ier.33
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Nov 2014 21:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=e4qpjpclDkowHT2jjr3AooOifwTHL7Jlzzv57YAPPnM=;
	b=VlALrgxo1ivmZdyerBooQE/s+rqr32KuY+7iBgXYlgB4XE8mCKV3EF5G8tgKemkjdn
	qZ55ByzQiXABNPQ6SUvmESakTepcc1L8JcJ1FeGLkhnkBK0YJgKeEmztc+n7sCy9Gi5g
	/cxtz3JjmcBStLYPbH/z/Lb4fm8t1Eoz7gK6AyAEItyxCNBOo5MGdUTXfygfi9tzV+Ny
	etELOvWmEGkz8d1apjLXolUApYgHETUn/udg+8n+kz2oXaiC+jXwRhydoWZzP/FwWiGa
	5B+MsTdcj7FBPoDSw1HKGhnlDhCq3O7N/1c1vm8jjctxaIrUeUj5Wq7jwZrkrt9XHps3
	7N8Q==
X-Received: by 10.43.76.67 with SMTP id zd3mr3060750icb.42.1415856969051; Wed,
	12 Nov 2014 21:36:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.169.2 with HTTP; Wed, 12 Nov 2014 21:35:38 -0800 (PST)
In-Reply-To: <2d93949c468142ae8569ded7377786c5@BY2PR03MB441.namprd03.prod.outlook.com>
References: <2d93949c468142ae8569ded7377786c5@BY2PR03MB441.namprd03.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Nov 2014 00:35:38 -0500
Message-ID: <CAMKF1sp2mQx3q2KHsEcF38AgqzoeHSVbMqnhoZOfXFbu_6sHfQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Thu, 13 Nov 2014 05:36:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2014 at 11:01 PM, B40290@freescale.com
<B40290@freescale.com> wrote:
> Hello,
>
> I am trying to startup  Layerscape1  kernel  in qemu-system-arm.
>
> Qemu-system-arm  do not  restart  Layerscape1   kernel .
>
>
> There is the following log information:
>
> [b40290@eclipse build]$ runqemu qemuarm /home/b40290/zImage.bin /home/b40=
290/opensource/poky/build/tmp/deploy/qemuarm/core-image-sato-qemuarm.ext3
>
> Continuing with the following parameters:
> KERNEL: [/home/b40290/zImage.bin]
> ROOTFS: [/home/b40290/opensource/poky/build/tmp/deploy/qemuarm/core-image=
-sato-qemuarm.ext3]
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

