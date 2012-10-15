Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TNiYI-0006UK-4j
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Oct 2012 13:09:42 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 15 Oct 2012 03:56:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,587,1344236400"; d="scan'208";a="204543705"
Received: from unknown (HELO helios.localnet) ([10.252.122.76])
	by azsmga001.ch.intel.com with ESMTP; 15 Oct 2012 03:56:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jaya Kumar <jayakumar.lkml@gmail.com>
Date: Mon, 15 Oct 2012 11:56:23 +0100
Message-ID: <1431551.UhqRm9pUYu@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <CADqH6Vzy+Rtg1fUjGbHyCFN4Fg1kSGx4z8fuguKBKD4FwJCFpQ@mail.gmail.com>
References: <CADqH6Vzy+Rtg1fUjGbHyCFN4Fg1kSGx4z8fuguKBKD4FwJCFpQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: smb* tools larger than expected
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
X-List-Received-Date: Mon, 15 Oct 2012 11:09:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 15 October 2012 18:50:37 Jaya Kumar wrote:
> I noticed my rootfs is filled with large smb* binaries. Investigating
> further:
> 
> ~/oe/setup-scripts$ ls -lhs
> /home/test/oe/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/deploy/ipk/ar
> mv7a/samba_3.5.6-r1_armv7a.ipk 31M -rw-r--r-- 1 test test 31M 2012-09-07
> 13:46
> /home/test/oe/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/deploy/ipk/ar
> mv7a/samba_3.5.6-r1_armv7a.ipk
> 
> ~/oe/setup-scripts$ MACHINE=beagleboard bitbake -c compile samba
> ~/oe/setup-scripts$ ls -lhs
> /home/test/oe/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-a
> ngstrom-linux-gnueabi/samba-3.5.6-r1/package/usr/bin/smb* 5.7M -rwxr-xr-x 2
> test test 5.7M 2012-09-07 13:43
> /home/test/oe/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-a
> ngstrom-linux-gnueabi/samba-3.5.6-r1/package/usr/bin/smbcacls 5.8M
> -rwxr-xr-x 2 test test 5.8M 2012-09-07 13:43
> /home/test/oe/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-a
> ngstrom-linux-gnueabi/samba-3.5.6-r1/package/usr/bin/smbclient 1.4M
> -rwxr-xr-x 2 test test 1.4M 2012-09-07 13:43
> /home/test/oe/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-a
> ngstrom-linux-gnueabi/samba-3.5.6-r1/package/usr/bin/smbcontrol 5.7M
> -rwxr-xr-x 2 test test 5.7M 2012-09-07 13:43
> /home/test/oe/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-a
> ngstrom-linux-gnueabi/samba-3.5.6-r1/package/usr/bin/smbcquotas 5.8M
> -rwxr-xr-x 2 test test 5.8M 2012-09-07 13:43
> /home/test/oe/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-a
> ngstrom-linux-gnueabi/samba-3.5.6-r1/package/usr/bin/smbget 5.7M -rwxr-xr-x
> 2 test test 5.7M 2012-09-07 13:43
> /home/test/oe/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-a
> ngstrom-linux-gnueabi/samba-3.5.6-r1/package/usr/bin/smbpasswd 2.8M
> -rwxr-xr-x 2 test test 2.8M 2012-09-07 13:43
> /home/test/oe/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-a
> ngstrom-linux-gnueabi/samba-3.5.6-r1/package/usr/bin/smbspool 1.4M
> -rwxr-xr-x 2 test test 1.4M 2012-09-07 13:43
> /home/test/oe/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-a
> ngstrom-linux-gnueabi/samba-3.5.6-r1/package/usr/bin/smbstatus 8.0K
> -rwxr-xr-x 2 test test 4.8K 2012-09-07 13:42
> /home/test/oe/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-a
> ngstrom-linux-gnueabi/samba-3.5.6-r1/package/usr/bin/smbtar 5.7M -rwxr-xr-x
> 2 test test 5.7M 2012-09-07 13:43
> /home/test/oe/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-a
> ngstrom-linux-gnueabi/samba-3.5.6-r1/package/usr/bin/smbtree
> 
> At first I thought maybe these binaries were getting statically
> linked, but that doesn't appear to be the case.
> ~/oe/setup-scripts$ file
> /home/test/oe/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-a
> ngstrom-linux-gnueabi/samba-3.5.6-r1/package/usr/bin/smbpasswd
> /home/test/oe/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-
> angstrom-linux-gnueabi/samba-3.5.6-r1/package/usr/bin/smbpasswd: ELF 32-bit
> LSB shared object, ARM, version 1 (SYSV), dynamically
> linked (uses shared libs), for GNU/Linux 2.6.16, stripped
> 
> ~/oe/setup-scripts$ readelf -a
> /home/test/oe/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-a
> ngstrom-linux-gnueabi/samba-3.5.6-r1/package/usr/bin/smbpasswd Section
> Headers:
>   [Nr] Name              Type            Addr     Off    Size   ES Flg Lk
> Inf Al [ 0]                   NULL            00000000 000000 000000 00    
>  0   0  0 [ 1] .interp           PROGBITS        00000154 000154 000013 00 
>  A  0   0  1 [ 2] .note.ABI-tag     NOTE            00000168 000168 000020
> 00   A  0   0  4 [ 3] .gnu.hash         GNU_HASH        00000188 000188
> 00d080 04   A  4   0  4 [ 4] .dynsym           DYNSYM          0000d208
> 00d208 0213f0 10   A  5   3  4 [ 5] .dynstr           STRTAB         
> 0002e5f8 02e5f8 0343c3 00   A  0   0  1 [ 6] .gnu.version      VERSYM      
>    000629bc 0629bc 00427e 02   A  4   0  2 [ 7] .gnu.version_r    VERNEED  
>       00066c3c 066c3c 0000d0 00   A  5   6  4 [ 8] .rel.dyn          REL   
>          00066d0c 066d0c 014c58 08   A  4   0  4 [ 9] .rel.plt          REL
>             0007b964 07b964 0008b0 08   A  4  11  4 [10] .init            
> PROGBITS        0007c214 07c214 00000c 00  AX  0   0  4 [11] .plt          
>    PROGBITS        0007c220 07c220 000d1c 04  AX  0   0  4 [12] .text      
>       PROGBITS        0007cf40 07cf40 3e6788 00  AX  0   0  8 [13] .fini   
>          PROGBITS        004636c8 4636c8 000008 00  AX  0   0  4 [14]
> .rodata           PROGBITS        004636d0 4636d0 12c9e8 00   A  0   0  4
> [15] .ARM.exidx        ARM_EXIDX       005900b8 5900b8 000008 00  AL 12   0
>  4 [16] .init_array       INIT_ARRAY      00598204 590204 000004 00  WA  0 
>  0  4 [17] .fini_array       FINI_ARRAY      00598208 590208 000004 00  WA 
> 0   0  4 [18] .jcr              PROGBITS        0059820c 59020c 000004 00 
> WA  0   0  4 [19] .data.rel.ro      PROGBITS        00598210 590210 010cd0
> 00  WA  0   0  4 [20] .dynamic          DYNAMIC         005a8ee0 5a0ee0
> 000120 08  WA  5   0  4 [21] .got              PROGBITS        005a9000
> 5a1000 00082c 04  WA  0   0  4 [22] .data             PROGBITS       
> 005a982c 5a182c 004360 00  WA  0   0  4 [23] .bss              NOBITS      
>    005adb90 5a5b8c 002cb8 00  WA  0   0  8 [24] .ARM.attributes  
> ARM_ATTRIBUTES  00000000 5a5b8c 000031 00      0   0  1 [25] .gnu_debuglink
>    PROGBITS        00000000 5a5bbd 000010 00      0   0  1 [26] .shstrtab  
>       STRTAB          00000000 5a5bcd 0000f0 00      0   0  1
> 
> Looking at that list, it seems .rodata is massive, about 1MB. I don't
> know enough to know why that could be the case. Is there something I
> can do to get the samba package to be much smaller?

I noticed this a while ago as well. I think it might be an upstream issue:

http://lists.samba.org/archive/samba/2009-October/151106.html

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


