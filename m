Received: from mail.dns-net.ch ([195.160.190.3] helo=111.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <c.aeschlimann@acn-group.ch>) id 1OEHHG-0001ru-QA
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 May 2010 09:32:00 +0200
Received: from [172.16.145.92] (unknown [212.98.42.40])
	by 111.com (Postfix) with ESMTPA id 24208370DE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 May 2010 09:27:48 +0200 (CEST)
Message-ID: <4BF2417A.6000302@acn-group.ch>
Date: Tue, 18 May 2010 09:27:54 +0200
From: Christophe Aeschlimann <c.aeschlimann@acn-group.ch>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; fr;
	rv:1.9.1.9) Gecko/20100317 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 195.160.190.3
X-SA-Exim-Mail-From: c.aeschlimann@acn-group.ch
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [hawkboard] OE Kernel Not Booting
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
X-List-Received-Date: Tue, 18 May 2010 07:32:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

We are at least three hawkboard owners that have the same issue.

Building org.openembedded.dev HEAD with

MACHINE=3D "hawkboard"
DISTRO =3D "angstrom-2008.1"

produces a Kernel Image that cannot be booted on our hawkboards.

The behaviour is the following with the following kernel bootargs :

console=3DttyS2,115200n8 root=3D/dev/nfs=20
nfsroot=3D172.16.147.10:/srv/nfs/hawkboard ip=3D172.16.100.100=20
eth=3D0a:c1:a8:12:fa:c0

> U-Boot 2009.01-dirty (Nov 26 2009 - 02:15:00)
>
> DRAM:  128 MB
> NAND:  NAND device: Manufacturer ID: 0x2c, Chip ID: 0xa1 (Micron NAND 1=
28MiB 1,8V 8-bit)
> Bad block table found at page 65472, version 0x01
> Bad block table found at page 65408, version 0x01
> 128 MiB
> In:    serial
> Out:   serial
> Err:   serial
> ARM Clock : 300000000 Hz
> DDR Clock : 150000000 Hz
> Ethernet PHY: GENERIC @ 0x07
> Hit any key to stop autoboot:  0
>
> NAND read: device 0 offset 0x200000, size 0x400000
>  4194304 bytes read: OK
> ## Booting kernel from Legacy Image at c0700000 ...
>    Image Name:   Angstrom/2.6.32+2.6.33-rc4-r44+g
>    Image Type:   ARM Linux Kernel Image (uncompressed)
>    Data Size:    2452896 Bytes =3D  2.3 MB
>    Load Address: c0008000
>    Entry Point:  c0008000
>    Verifying Checksum ... OK
>    Loading Kernel Image ... OK
> OK
>
> Starting kernel ...

And it hangs there forever...

If I add earlyprintk to the bootargs :

console=3DttyS2,115200n8 root=3D/dev/nfs=20
nfsroot=3D172.16.147.10:/srv/nfs/hawkboard ip=3D172.16.100.100=20
eth=3D0a:c1:a8:12:fa:c0 earlyprintk=3Dserial,ttyS2,115200n8

then I get the following :

> U-Boot 2009.01-dirty (Nov 26 2009 - 02:15:00)
>
> DRAM:  128 MB
> NAND:  NAND device: Manufacturer ID: 0x2c, Chip ID: 0xa1 (Micron NAND 1=
28MiB 1,8V 8-bit)
> Bad block table found at page 65472, version 0x01
> Bad block table found at page 65408, version 0x01
> 128 MiB
> In:    serial
> Out:   serial
> Err:   serial
> ARM Clock : 300000000 Hz
> DDR Clock : 150000000 Hz
> Ethernet PHY: GENERIC @ 0x07
> Hit any key to stop autoboot:  0
>
> NAND read: device 0 offset 0x200000, size 0x400000
>  4194304 bytes read: OK
> ## Booting kernel from Legacy Image at c0700000 ...
>    Image Name:   Angstrom/2.6.32+2.6.33-rc4-r44+g
>    Image Type:   ARM Linux Kernel Image (uncompressed)
>    Data Size:    2452896 Bytes =3D  2.3 MB
>    Load Address: c0008000
>    Entry Point:  c0008000
>    Verifying Checksum ... OK
>    Loading Kernel Image ... OK
> OK
>
> Starting kernel ...
>
> [    0.000000] Linux version 2.6.33-rc4 (vicos@vicos) (gcc version 4.3.=
3 (GCC) ) #1 PREEMPT Fri May 7 21:11:02 CEST 2010
> [    0.000000] CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=3D0=
0053177
> [    0.000000] CPU: VIVT data cache, VIVT instruction cache
> [    0.000000] Machine: DaVinci DA850/OMAP-L138/AM18xx Hawkboard(.org)
> [    0.000000] Memory policy: ECC disabled, Data cache writeback
> [    0.000000] DaVinci da850/omap-l138 variant 0x0
> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  =
Total pages: 32512
> [    0.000000] Kernel command line: console=3DttyS2,115200n8 root=3D/de=
v/nfs nfsroot=3D172.16.147.10:/srv/nfs/hawkboard ip=3D172.16.100.100 eth=3D=
0a:c1:a8:12:fa:c0 earlyprintk=3Dserial,ttyS2,115200n8
> [    0.000000] bootconsole [earlycon0] enabled
> [    0.000000] PID hash table entries: 512 (order: -1, 2048 bytes)
> [    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 =
bytes)
> [    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 by=
tes)
> [    0.000000] Memory: 128MB =3D 128MB total
> [    0.000000] Memory: 124372KB available (4496K code, 426K data, 468K =
init, 0K highmem)
> [    0.000000] SLUB: Genslabs=3D11, HWalign=3D32, Order=3D0-3, MinObjec=
ts=3D0, CPUs=3D1, Nodes=3D1
> [    0.000000] Hierarchical RCU implementation.
> [    0.000000] NR_IRQS:245
> [    0.000000] Console: colour dummy device 80x30
> [    0.000000] Calibrating delay loop... 149.50 BogoMIPS (lpj=3D747520)
> [    0.210000] Mount-cache hash table entries: 512
> [    0.210000] CPU: Testing write buffer coherency: ok
> [    0.220000] devtmpfs: initialized
> [    0.230000] DaVinci: 144 gpio irqs
> [    0.240000] NET: Registered protocol family 16
> [    0.270000] WARNING: both McASP and McBSP are enabled, but they shar=
e pins.
> [    0.270000]  Disable one of them.
> [    0.310000] bio: create slab <bio-0> at 0
> [    0.310000] SCSI subsystem initialized
> [    0.320000] usbcore: registered new interface driver usbfs
> [    0.330000] usbcore: registered new interface driver hub
> [    0.330000] usbcore: registered new device driver usb
> [    0.340000] i2c-gpio i2c-gpio.1: using pins 20 (SDA) and 21 (SCL)
> [    0.350000] vpif vpif: vpif probe success
> [    0.350000] Switching to clocksource timer0_1

And it hangs there forever.

Could someone who has an hawkboard working with OE please detail his=20
configuration ? (u-boot, kernel config)

If you have any idea of things I might try to get it working is also=20
welcome. Like how to start debugging that ?

Best regards,


--=20
Christophe Aeschlimann

Embedded Software Engineer

Advanced Communications Networks S.A.

Rue du Puits-Godet 8a
2000 Neuch=E2tel, Switzerland

T=E9l. +41 32 724 74 31

c.aeschlimann@acn-group.ch


