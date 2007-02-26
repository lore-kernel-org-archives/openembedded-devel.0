Received: from [212.227.126.188] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <fischer@4g-systems.com>) id 1HLeZp-0003dQ-Af
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Feb 2007 13:03:33 +0100
Received: from [213.238.49.68] (helo=dehamox1a.intra.4g-systems.com)
	by mrelayeu.kundenserver.de (node=mrelayeu0) with ESMTP (Nemesis),
	id 0MKwh2-1HLeZi3zOQ-0006Nh; Mon, 26 Feb 2007 13:03:33 +0100
Received: from [172.31.20.70] (deham-pc1070.intra.4g-systems.com
	[172.31.20.70])
	by dehamox1a.intra.4g-systems.com (Postfix) with ESMTP id 11590610B12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Feb 2007 13:03:22 +0100 (CET)
Message-ID: <45E2CC8E.5040505@4g-systems.com>
Date: Mon, 26 Feb 2007 13:03:26 +0100
From: Patrick Fischer <fischer@4g-systems.com>
User-Agent: Icedove 1.5.0.9 (X11/20061220)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200702231326.37015.ranaldo@unina.it>	<7010259346.20070225203430@gmail.com>
	<200702261215.07980.ranaldo@unina.it>
In-Reply-To: <200702261215.07980.ranaldo@unina.it>
X-Provags-ID: kundenserver.de abuse@kundenserver.de
	login:2073f051fc1b72daa8cde2c9d21098b2
X-Provags-ID2: V01U2FsdGVkX1+hv0UsxZ+fL+GZhsFOiudoN7qD+KYENnWFlE4
	Q9da1c/nQBe/9/tB8Ah0gyV9dsNioyufyATEWH+E8nKTYuKHFc
	HXPaspManpL05ON0ZwOBQ==
Subject: Re: testing with qemu, was Re: Angstrom and h2200
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Feb 2007 12:03:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Nicola Ranaldo wrote:
> On Sunday 25 February 2007 19:34:30 Paul Sokolovsky wrote:
> [...]
>  =20
>>> * the last, may i use some kind of emulator before deploying the fs i=
mage
>>> to the ipaq?
>>>      =20
>>   Yes, QEMU.
>>    =20
>
> I already use it to emulate x86 machines, but i was not able before to =
find=20
> the qemu-system-arm command!!! the poky-runqemu documentation seems to =
be=20
> complex, to run the test images at=20
> http://www.angstrom-distribution.org/unstable/images/20070120/qemuarm/ =
 i=20
> simply used the following command:
>
> qemu-system-arm -M versatilepb -kernel=20
> zImage-2.6.18-qemuarm-20070120215313.bin -hda=20
> Angstrom-gpe-image-test-20070120-qemuarm.rootfs.ext2  -append "root=3D/=
dev/sda"
> When the system asked to calibrate to touchscreen i pressed ESC and gpe=
=20
> appeared!
> I did not use the file modules-2.6.18-qemuarm.tgz.... is there a reason=
 it's=20
> there?
>
> thanks
>
> 	Nicola Ranaldo
>  =20
This is my test script for qemu

#!/bin/sh

KERNEL=3D$1
IMAGE=3D$2
IP=3D192.168.1.42
GATEWAY=3D192.168.1.1=20

cp $KERNEL /tmp/kernel.bin
cp $IMAGE /tmp/image.ext2.gz
gzip -d /tmp/image.ext2.gz

/usr/local/bin/qemu -kernel /tmp/kernel.bin -std-vga \
-append "root=3D/dev/hda rw mem=3D64M ip=3D${IP}::${GATEWAY}:255.255.255.=
0" \
-net nic,vlan=3D0 -net tap,vlan=3D0,ifname=3Dtap0,script=3D \
-hda /tmp/image.ext2=20

rm /tmp/image.ext2
rm /tmp/kernel.bin

---
call it like

./testqemu.sh tmp/deploy/images/bzImage-qemux86.bin tmp/deploy/images/boo=
tstrap-image-qemux86-20070112211142.rootfs.ext2.gz




--=20
Mit freundlichen Gr=FC=DFen
Best Regards=20

Dipl.-Ing. (FH) Patrick Fischer
Software Engineer


Meet 4G Systems at CeBIT=20
March 15th - 21st, Hanover=20
Hall 13, Stand B86


4G Systems GmbH =20
Jarrestrasse 4,
D-22303 Hamburg

Phone: +49 (0)40-70 38 33-327
Fax:   +49 (0)40-70 38 33-700
Mail: Patrick.Fischer@4g-systems.com
www.4g-systems.com

Amtsgericht Hamburg, HRB 85342
Gesch=E4ftsf=FChrer: Enrico Just, Achim Schaller






