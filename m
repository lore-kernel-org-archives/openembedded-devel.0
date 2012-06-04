Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Sbc2t-0005fn-H9
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jun 2012 20:30:27 +0200
Received: by wibhm14 with SMTP id hm14so2760222wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jun 2012 11:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:mime-version:content-type:subject:date:in-reply-to:to
	:references:message-id:x-mailer;
	bh=bqWEWibel5KuLiCj/l8B/muzo03t8m2doIr6XYZ7ki0=;
	b=IMgl5ncQPOcDfIH7pTy4EfOLGXeNyA/TVylk0jSJvo07ZwpRFYc2fblXQBeUoL+T1u
	kUfdjfp+nXwkMD+tpYCVifO5k5W+mx8j0A6j00A/8jTfnRnpja9prRxTi3A7+wI0N4EV
	Pu+5liSsooEffCQvQZW1Km1SEw/da2gM15AUrwCp5OUCldj7FrSRQYBRYhZlPMyAASTG
	1LBeLdgXBBvviFeGa+BxFgUK5w6NUPAxgpIez2dY1Y+8ykCjC3nuT6praEhYRlKtH4xF
	K5i19odxd6Xw+LgZAAx47uYRPfXfwQmz6xc7+yKrflBkDGUdeN6oYthzZeRK9pmyAAjE
	gE5Q==
Received: by 10.216.216.226 with SMTP id g76mr11617551wep.221.1338834002449;
	Mon, 04 Jun 2012 11:20:02 -0700 (PDT)
Received: from [192.168.1.36] (1.Red-83-60-183.dynamicIP.rima-tde.net.
	[83.60.183.1])
	by mx.google.com with ESMTPS id d10sm34600352wiy.3.2012.06.04.11.19.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Jun 2012 11:20:01 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1278)
Date: Mon, 4 Jun 2012 20:19:58 +0200
In-Reply-To: <CAMKF1srC1uxpT1+Z_LqRUagFhxStZb30ZU10wrRtAReSSR7_zg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
References: <D40848EB-C66A-47B6-B3C0-CF743A8E032A@gmail.com>
	<CAMKF1srC1uxpT1+Z_LqRUagFhxStZb30ZU10wrRtAReSSR7_zg@mail.gmail.com>
Message-Id: <77A5818E-F77E-4215-939B-882BC738EB65@gmail.com>
X-Mailer: Apple Mail (2.1278)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Understanding what qemuppc emulates and getting it to emulate a ppc440 CPU
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
X-List-Received-Date: Mon, 04 Jun 2012 18:30:27 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Khem,

On Jun 4, 2012, at 7:01 PM, Khem Raj wrote:

> On Mon, Jun 4, 2012 at 2:07 AM, Elvis Dowson <elvis.dowson@gmail.com> =
wrote:
>>=20
>> Can the yocto build environment be modified so that the qemuppc =
emulator emulates at least the ppc440 CPU subset?
>=20
> default emulation is using mac99 I think which is ppc7xx IIRC

I found that the QEMU sources contains direct support for the Xilinx =
ML507, in file qemu/hw/virtex_ml507.c

$ cd qemu
$ ./configure --target-list=3Dppc-softmmu
$ make -j 8
$ ppc-softmmu/qemu-system-ppc --M ?

Supported machines are:
ref405ep             ref405ep
taihu                taihu
bamboo               bamboo
mac99                Mac99 based PowerMAC
g3beige              Heathrow based PowerMAC (default)
prep                 PowerPC PREP platform
mpc8544ds            mpc8544ds
virtex-ml507         Xilinx Virtex ML507 reference design

I also just checked the version of QEMU built using yocto, and it gives =
the same results

$ runqemu qemuppc qemuparams=3D"--M ?"

Continuing with the following parameters:
KERNEL: [/tool/yocto/poky/build/tmp/deploy/images/vmlinux-qemuppc.bin]
ROOTFS: =
[/tool/yocto/poky/build/tmp/deploy/images/core-image-sato-qemuppc.ext3]
FSTYPE: [ext3]
Setting up tap interface under sudo
[sudo] password for elvis:=20
Acquiring lockfile for tap0...
WARNING: distccd not present, no distcc support loaded.
Running qemu-system-ppc...
/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/qemu-system-ppc =
-kernel /tool/yocto/poky/build/tmp/deploy/images/vmlinux-qemuppc.bin =
-net nic,model=3Dpcnet -net =
tap,vlan=3D0,ifname=3Dtap0,script=3Dno,downscript=3Dno -cpu G4 -M mac99 =
-hda =
/tool/yocto/poky/build/tmp/deploy/images/core-image-sato-qemuppc.ext3 =
-no-reboot -show-cursor -usb -usbdevice wacom-tablet -no-reboot --M ? -m =
128 --append "root=3D/dev/hda rw console=3DttyS0 console=3Dtty =
ip=3D192.168.7.2::192.168.7.1:255.255.255.0 mem=3D128M "
Supported machines are:
prep       PowerPC PREP platform
g3beige    Heathrow based PowerMAC (default)
mac99      Mac99 based PowerMAC
ref405ep   ref405ep
taihu      taihu
bamboo     bamboo (alias of bamboo-0.13)
bamboo-0.13 bamboo
bamboo-0.12 bamboo
mpc8544ds  mpc8544ds
virtex-ml507 Xilinx Virtex ML507 reference design
Set 'tap0' nonpersistent
Releasing lockfile of preconfigured tap device 'tap0'

Best regards,

Elvis Dowson=

