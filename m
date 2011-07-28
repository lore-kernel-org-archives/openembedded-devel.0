Received: from snvl-smtp1.trimble.com ([155.63.64.31])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernard_Mentink@trimble.com>) id 1QmYrM-0006Ay-Vr
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jul 2011 00:15:17 +0200
Received: (qmail 19874 invoked by uid 501); 28 Jul 2011 15:10:59 -0700
Received: from 10.3.0.166 by snvl-smtp1.trimble.com (envelope-from
	<Bernard_Mentink@trimble.com>, uid 108) with qmail-scanner-2.08 
	(clamdscan: 0.97.2/13370. avast: v3.2.0/110727-1. sophie:
	3.06/3.21.0/4.67. spamassassin: 3.3.1. Clear:RC:1(10.3.0.166):. 
	Processed in 0.042937 secs); 28 Jul 2011 22:10:59 -0000
Received: from unknown (HELO nzc-ap-xch-02.ap.trimblecorp.net) (10.3.0.166)
	by snvl-smtp1.trimble.com with SMTP; 28 Jul 2011 15:10:58 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Fri, 29 Jul 2011 10:10:57 +1200
Message-ID: <F7C0AA5DD1508F4789E10B6CC9BB75DB04B7A3D8@nzc-ap-xch-02.ap.trimblecorp.net>
In-Reply-To: <4E31D71D.9010109@mlbassoc.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Kernel boot problems
Thread-Index: AcxNbuDsnV4KAQifRzuDXJ3LtHU8rAAAwUXw
References: <F7C0AA5DD1508F4789E10B6CC9BB75DB04B7A25E@nzc-ap-xch-02.ap.trimblecorp.net>
	<4E314658.2040900@mlbassoc.com>
	<F7C0AA5DD1508F4789E10B6CC9BB75DB04B7A35C@nzc-ap-xch-02.ap.trimblecorp.net>
	<4E31D71D.9010109@mlbassoc.com>
From: "Bernard Mentink" <Bernard_Mentink@trimble.com>
To: "Gary Thomas" <gary@mlbassoc.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Kernel boot problems
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
X-List-Received-Date: Thu, 28 Jul 2011 22:15:17 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Gary,

Further down I see a confirmation of the boot params ... i.e
console=3Dttymxc0,115200

8030d600: 73747369 206e6920 656e6f5a 64726f20    ists in Zone ord
8030d610: 202c7265 69626f6d 7974696c 6f726720    er, mobility gro
8030d620: 6e697075 6e6f2067 5420202e 6c61746f    uping on.  Total
8030d630: 67617020 203a7365 31353233 353c0a32     pages: 32512.<5
8030d640: 72654b3e 206c656e 6d6d6f63 20646e61    >Kernel command
8030d650: 656e696c 6f63203a 6c6f736e 74743d65    line: console=3Dtt
8030d660: 63786d79 31312c30 30303235 3e363c0a    ymxc0,115200.<6>
8030d670: 20444950 68736168 62617420 6520656c    PID hash table e
8030d680: 6972746e 203a7365 20323135 64726f28    ntries: 512 (ord
8030d690: 203a7265 202c312d 38343032 74796220    er: -1, 2048 byt
8030d6a0: 0a297365 443e363c 72746e65 61632079    es).<6>Dentry ca
8030d6b0: 20656863 68736168 62617420 6520656c    che hash table e
8030d6c0: 6972746e 203a7365 38333631 6f282034    ntries: 16384 (o
8030d6d0: 72656472 2c34203a 35353620 62203633    rder: 4, 65536 b
8030d6e0: 73657479 363c0a29 6f6e493e 632d6564    ytes).<6>Inode-c
8030d6f0: 65686361 73616820 61742068 20656c62    ache hash table

The only mention of serial port is:

8030df00: 20656e69 69676572 72657473 3c0a6465    ine registered.<
8030df10: 6f693e36 68637320 6c756465 63207265    6>io scheduler c
8030df20: 72207166 73696765 65726574 64282064    fq registered (d
8030df30: 75616665 0a29746c 533e363c 61697265    efault).<6>Seria
8030df40: 49203a6c 6420584d 65766972 353c0a72    l: IMX driver.<5
8030df50: 7968703e 70616d73 616c7020 726f6674    >physmap platfor
8030df60: 6c66206d 20687361 69766564 203a6563    m flash device:
8030df70: 30303230 30303030 20746120 30303061    02000000 at a000
8030df80: 30303030 3e363c0a 73796870 2d70616d    0000.<6>physmap-
8030df90: 73616c66 3a302e68 756f4620 3120646e    flash.0: Found 1
8030dfa0: 36317820 76656420 73656369 20746120     x16 devices at
8030dfb0: 20307830 31206e69 69622d36 61622074    0x0 in 16-bit ba
8030dfc0: 202e6b6e 756e614d 74636166 72657275    nk. Manufacturer
8030dfd0: 20444920 30307830 39383030 69684320     ID 0x000089 Chi
8030dfe0: 44492070 30783020 31393830 353c0a63    p ID 0x00891c.<5
8030dff0: 7075533e 74726f70 726f6620 6d6f6320    >Support for com

.. And yes I did turn on early debug in the kernel config .. But I don't
see any extra messages out the serial port.
How can I check that my .config changes have propagated through ok? ..


Regards,
bernie
=20


------------------------------------------------------------------------
------------------
I want to die peacefully in my sleep, like my grandfather, not screaming
and yelling like the passengers in his car.

-----Original Message-----
From: Gary Thomas [mailto:gary@mlbassoc.com]=20
Sent: Friday, 29 July 2011 9:40 a.m.
To: Bernard Mentink
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] Kernel boot problems

On 2011-07-28 14:51, Bernard Mentink wrote:
> Many thanks for that,
>
> I had a look through the buffer and I see pretty much normal bootup=20
> text ... It just isn't coming out of the serial port ..
>
> The only error I saw was the following:
> -----------------------------------------
> 8030cf80: 00000000 00000001 3a534656 6e614320    ........VFS: Can
> 8030cf90: 20746f6e 6e65706f 6f6f7220 65642074    not open root de
> 8030cfa0: 65636976 6e282220 296c6c75 726f2022    vice "(null)" or
> 8030cfb0: 6b6e7520 6e776f6e 6f6c622d 32286b63     unknown-block(2
> 8030cfc0: 64646100 66663d72 66666666 303a6666    .addr=3Dffffffff:0
> 8030cfd0: 69202c31 2d3d7172 000a2931 20393830    1, irq=3D-1)..089
> 8030cfe0: 30373178 20000a29 30307830 63313938    x170).. 0x00891c
> 8030cff0: 2030000a 7830202d 65666666 30303030    ..0 - 0xfffe0000
> 8030d000: 28202020 36393820 29426b20 2020200a       ( 896 kB).
> 8030d010: 414d4420 20202020 30203a20 63666678     DMA     : 0xffc
> 8030d020: 30303030 202d2030 66667830 30303065    00000 - 0xffe000
> 8030d030: 20203030 20202820 4d203220 200a2942    00   (   2 MB).
> 8030d040: 76202020 6c6c616d 3a20636f 63783020       vmalloc : 0xc
> 8030d050: 30303834 20303030 7830202d 30303466    4800000 - 0xf400
> 8030d060: 30303030 28202020 30363720 29424d20    0000   ( 760 MB)
> 8030d070: 2020200a 776f6c20 206d656d 30203a20    .    lowmem  : 0
> 8030d080: 30306378 30303030 202d2030 34637830    xc0000000 - 0xc4
> 8030d090: 30303030 20203030 20202820 4d203436    000000   (  64 M
> 8030d0a0: 200a2942 6d202020 6c75646f 3a207365    B).    modules :
> 8030d0b0: 62783020 30303066 20303030 7830202d     0xbf000000 - 0x
> 8030d0c0: 30303063 30303030 28202020 36312020    c0000000   (  16
> 8030d0d0: 29424d20 2020200a 2e202020 74696e69     MB).      .init
> 8030d0e0: 30203a20 30306378 30303830 202d2030     : 0xc0008000 -
> 8030d0f0: 30637830 30653130 20203030 20202820    0xc001e000   (
> 8030d100: 6b203838 200a2942 20202020 65742e20    88 kB).      .te
> 8030d110: 3a207478 63783020 65313030 20303030    xt : 0xc001e000
> 8030d120: 7830202d 65323063 30303031 28202020    - 0xc02e1000   (
> 8030d130: 38323832 29426b20 2020200a 2e202020    2828 kB).      .
> 8030d140: 61746164 30203a20 32306378 30303666    data : 0xc02f600
> 8030d150: 202d2030 30637830 36633033 20203065    0 - 0xc030c6e0
> 8030d160: 20202820 6b203039 000a2942 00000000     (  90 kB)......
> --------------------------------------------
>
> A bit futher down the buffer I saw normal printout ..
>
> ______________________________________________
>
> 8030d380: 00000000 00000000 00000000 00000000    ................
> 8030d390: 00000000 00000000 00000000 4c3e353c    ............<5>L
> 8030d3a0: 78756e69 72657620 6e6f6973 362e3220    inux version 2.6
> 8030d3b0: 2e36332e 62282031 746e656d 406b6e69    .36.1 (bmentink@
> 8030d3c0: 68637241 29786f42 63672820 65762063    ArchBox) (gcc ve
> 8030d3d0: 6f697372 2e34206e 20332e35 31313032    rsion 4.5.3 2011
> 8030d3e0: 31313330 72702820 6c657265 65736165    0311 (prerelease
> 8030d3f0: 47282029 20294343 31232029 45525020    ) (GCC) ) #1 PRE
> 8030d400: 54504d45 69724620 6c754a20 20393220    EMPT Fri Jul 29
> 8030d410: 303a3830 36313a31 535a4e20 30322054    08:01:16 NZST 20
> 8030d420: 3c0a3131 50433e34 41203a55 36764d52    11.<4>CPU: ARMv6
> 8030d430: 6d6f632d 69746170 20656c62 636f7270    -compatible proc
> 8030d440: 6f737365 345b2072 62373031 5d343633    essor [4107b364]
> 8030d450: 76657220 6f697369 2034206e 4d524128     revision 4 (ARM
> 8030d460: 45543676 202c294a 303d7263 33356330    v6TEJ), cr=3D00c53
> 8030d470: 0a663738 433e343c 203a5550 54504956    87f.<4>CPU: VIPT
> 8030d480: 6e6f6e20 61696c61 676e6973 74616420     nonaliasing dat
> 8030d490: 61632061 2c656863 50495620 6f6e2054    a cache, VIPT no
> 8030d4a0: 696c616e 6e697361 6e692067 75727473    naliasing instru
> 8030d4b0: 6f697463 6163206e 0a656863 4d3e343c    ction cache.<4>M
> 8030d4c0: 69686361 203a656e 69676f4c 20445063    achine: LogicPD
> 8030d4d0: 584d2e69 53203133 3c0a4d4f 654d3e34    i.MX31 SOM.<4>Me
> 8030d4e0: 79726f6d 6c6f7020 3a796369 43434520    mory policy: ECC
> 8030d4f0: 73696420 656c6261 44202c64 20617461     disabled, Data
> 8030d500: 68636163 72772065 62657469 0a6b6361    cache writeback.
> 8030d510: 4f3e373c 6f6e206e 30206564 746f7420<7>On node 0 tot
> 8030d520: 61706c61 3a736567 33363120 3c0a3438    alpages: 16384.<
> 8030d530: 72663e37 615f6565 5f616572 74696e69    7>free_area_init
> 8030d540: 646f6e5f 6e203a65 2065646f 70202c30    _node: node 0, p
> 8030d550: 74616467 33306320 64306330 6e202c38    gdat c030c0d8, n
> 8030d560: 5f65646f 5f6d656d 2070616d 32333063    ode_mem_map c032
> 8030d570: 30303031 3e373c0a 6f4e2020 6c616d72    1000.<7>   Normal
> 8030d580: 6e6f7a20 31203a65 70203832 73656761     zone: 128 pages
> 8030d590: 65737520 6f662064 656d2072 70616d6d     used for memmap
> 8030d5a0: 3e373c0a 6f4e2020 6c616d72 6e6f7a20    .<7>   Normal zon
> 8030d5b0: 30203a65 67617020 72207365 72657365    e: 0 pages reser
> 8030d5c0: 0a646576 203e373c 726f4e20 206c616d    ved.<7>   Normal
> ----------------------------------------------------------------------
>
> I am not sure why it is not printing out the port, my boot param =3D=20
> "console=3Dttymxc0,115200"
> And the relevent part of conf/machine/mx31ads.conf =3D SERIAL_CONSOLE =
=3D=20
> "115200 ttymxc0"
>
> Any idea's?

If you look a bit further you may see some messages about what the
serial ports are called, e.g. on my OMAP/3530 I see these messages:
   omap_uart.0: ttyO0 at MMIO 0x4806a000 (irq =3D 72) is a OMAP UART0
   console [ttyO0] enabled
   omap_uart.1: ttyO1 at MMIO 0x4806c000 (irq =3D 73) is a OMAP UART1
   omap_uart.2: ttyO2 at MMIO 0x49020000 (irq =3D 74) is a OMAP UART2

I don't have an iMX31 available so it's hard to know what they are
called.

Did you try enabling the early print messages like was suggested?  If it
works these can be a big help.  Your problem is that the kernel is
getting started, albeit failing because of no root file system but
that's the next step.  If the console=3DXXX selection on the command =
line
is incorrect, there will be no place for the bootup messages to go,
hence the silence.


> ----------------------------------------------------------------------
> --
> ------------------
> I want to die peacefully in my sleep, like my grandfather, not=20
> screaming and yelling like the passengers in his car.
>
> -----Original Message-----
> From: Gary Thomas [mailto:gary@mlbassoc.com]
> Sent: Thursday, 28 July 2011 11:22 p.m.
> To: openembedded-devel@lists.openembedded.org
> Cc: Bernard Mentink
> Subject: Re: [oe] Kernel boot problems
>
> On 2011-07-27 20:20, Bernard Mentink wrote:
>>
>> Hi Guys,
>>
>> I have got a bit further with my efforts to boot linux on an imx31=20
>> based platform using u-boot.
>>
>> My console output is now:
>>
>> ----------------------------------------------------------------
>> uboot>   bootm 80100000
>> ## Booting kernel from Legacy Image at 80100000 ...
>>      Image Name:   Angstrom/2.6.36/mx31ads
>>      Created:      2011-07-28   2:03:27 UTC
>>      Image Type:   ARM Linux Kernel Image (uncompressed)
>>      Data Size:    1586172 Bytes =3D 1.5 MiB
>>      Load Address: 8f000000
>>      Entry Point:  8f000000
>>      Verifying Checksum ... OK
>>      Loading Kernel Image ... OK
>> OK
>>
>> Starting kernel ...
>>
>> Uncompressing Linux... done, booting the kernel.
>> -------------------------------------------------------------------
>>
>> So it seems to be getting to the 1st part of the kernel boot process,

>> then hangs (I presume the last line comes from kernel code.) I don't=20
>> know if the kernel is hanging, or if I don't have any more serial out

>> ....
>> I am passing "console=3Dttymxc0,115200" to the kernel ..
>> Can someone confirm:
>> A) If I have the correct Entry point, or does this need to be offset=20
>> into the kernel? ..
>> B) Is the serial console parameters correct?
>> C) What is the correct way to set up the memory map? (my ram starts=20
>> at
>
>> 0x80000000, ends at 0x8fffffff)
>> D) Is there a way to debug initial kernel stuff with serial output?
>> In the above, I have decompressed the kernel to the top of the 256M
> ram,
>> but have only advertised 120M via the bootloader   ... for now, not
>> knowing what is correct and not wanting the kernel to stomp all over=20
>> itself running in ram.
>
> Analyzing this failure can be hard.  If you have some sort of JTAG=20
> setup you might be able to break in at this point, figure out where=20
> it's hanging up, etc.
>
> Even if you don't have JTAG, there might be some crumbs left around=20
> for you to look at.  Linux keeps everything that goes to the "console"

> in a circular buffer __log_buf[].  Look up that symbol in System.map=20
> (which will be found in your linux build tree).  Here's the tricky=20
> part - the map will show a logical address, but U-Boot only knows=20
> physical addresses.
> Normally the mapping is pretty easy, e.g. on my OMAP/3530 I might see:
>     $ grep __log_buf linux-2.6.37/System.map
>     c0527058 b __log_buf
> So in U-Boot, I would look at the buffer like this:
>     U-Boot>  md 0x80527058
>     80527058: 4c3e353c 78756e69 72657620 6e6f6973<5>Linux version
>     80527068: 362e3220 2e37332e 67282033 6d6f6874     2.6.37.3 (gthom
>     80527078: 74407361 6e617469 67282029 76206363    as@titan) (gcc v
>     80527088: 69737265 34206e6f 312e362e 31303220    ersion 4.6.1 201
>     80527098: 32363031 70282037 65726572 7361656c    10627 (prereleas
>     805270a8: 28202965 29434347 23202920 72462031    e) (GCC) ) #1 Fr
>     805270b8: 754a2069 3232206c 3a393020 303a3135    i Jul 22 09:51:0
>        ...
>
> Keep looking through this buffer until it stops with useful
characters.
> That may tell you where the kernel got hung up and why.  If you find=20
> only garbage, it may be more difficult to tell.
>
> Note: hopefully your board has a RESET button which you can use to get

> back into U-Boot once the kernel boot process hangs.  Power cycling to

> reset the board won't work as the contents of RAM will likely be=20
> destroyed.
>
>
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------

--
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


