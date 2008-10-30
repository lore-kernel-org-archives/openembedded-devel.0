Received: from [76.96.62.24] (helo=QMTA02.westchester.pa.mail.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tmtalpey@rcn.com>) id 1KvcQE-0007Gz-Cn
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Oct 2008 19:39:06 +0100
Received: from OMTA08.westchester.pa.mail.comcast.net ([76.96.62.12])
	by QMTA02.westchester.pa.mail.comcast.net with comcast
	id Yxn41a00F0Fqzac526e0R8; Thu, 30 Oct 2008 18:38:00 +0000
Received: from tmt.rcn.com ([98.229.118.72])
	by OMTA08.westchester.pa.mail.comcast.net with comcast
	id Z6e01a00L1ZoUlN3U6e05e; Thu, 30 Oct 2008 18:38:01 +0000
X-Authority-Analysis: v=1.0 c=1 a=8ODV3D4d8x_7UrqyLwkA:9
	a=G4fyiQ8ZtTy68dlGAWbYHi9GzRkA:4 a=h9s5Ru71U4oA:10
X-Mailer: QUALCOMM Windows Eudora Version 7.1.0.9
Date: Thu, 30 Oct 2008 14:37:09 -0400
To: openembedded-devel@lists.openembedded.org
From: Tom Talpey <tmtalpey@rcn.com>
In-Reply-To: <E1Kvc17-0001Gl-VY@linuxtogo.org>
References: <1225294016.3822.81.camel@mill.internal.reciva.com>
	<E1KvYmj-0007s2-Og@linuxtogo.org>
	<1225379284.3822.154.camel@mill.internal.reciva.com>
	<E1Kvahy-0001AR-Sj@linuxtogo.org>
	<1225386831.17961.15.camel@mill.internal.reciva.com>
	<E1Kvc17-0001Gl-VY@linuxtogo.org>
Mime-Version: 1.0
Subject: Re: arm kernel configurations
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
X-List-Received-Date: Thu, 30 Oct 2008 18:39:06 -0000
Message-ID: <MADEUP.15FE1A15FDD98EF2.32177@groups.io>
Content-Type: text/plain; charset="us-ascii"

At 02:09 PM 10/30/2008, Tom Talpey wrote:
>At 01:13 PM 10/30/2008, Phil Blundell wrote:
>>I wonder if something has gone wrong with your glibc configuration.  Try
>>disassembling one of your binaries and see if you can find any reference
>
>And no wfs/rfs at all in any binaries. Hmm, let me try the no-OABI
>kernel again. Maybe I can get more status from it. Basically it would
>say "Freeing init memory" then nothing more, while with-OABI it would
>cruise.

Interesting. This time it booted all the way to GPE. But, hid2hci
faulted and the kernel trapped on it. Nothing strange at all about
that binary, and the same one works fine on the OABI kernel.

Well, bottom line I don't think I'm doing anything wrong, but I can
say leaving out the OABI option always gives me trouble. Any light
you can shine would be great!


>root@h1940:~# dmesg
>Linux version 2.6.27.4-h1940-tmt (tmt@tmt) (gcc version 4.2.4) #14 PREEMPT Thu Oct 30 14:20:25 EDT 2008
>CPU: ARM920T [41129200] revision 0 (ARMv4T), cr=c0007177
>Machine: IPAQ-H1940
>...
>VFS: Mounted root (ext2 filesystem).
>Freeing init memory: 120K
>udevd version 124 started
>Unable to handle kernel paging request at virtual address 560000b8
>pgd = c3b38000
>[560000b8] *pgd=00000000
>Internal error: Oops: 5 [#1] PREEMPT
>CPU: 0    Not tainted  (2.6.27.4-h1940-tmt #14)
>PC is at do_coredump+0x24/0x74c
>LR is at get_signal_to_deliver+0x344/0x3a0
>pc : [<c0081004>]    lr : [<c0044ec8>]    psr: 60000013
>sp : c34a3db0  ip : c3b52e00  fp : c38ffaa0
>r10: c3b52e00  r9 : c3bc9ff0  r8 : c34a3f68
>r7 : c34a3ee8  r6 : 00000000  r5 : 000000dc  r4 : c34a2000
>r3 : c346f6a0  r2 : c34a3fb0  r1 : 0000000b  r0 : 56000000
>Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
>Control: c000717f  Table: 33b38000  DAC: 00000015
>Process hid2hci (pid: 976, stack limit = 0xc34a2268)
>Stack: (0xc34a3db0 to 0xc34a4000)
>3da0:                                     00000090 c02f2ca8 ffffffff c34a3dc8 
>3dc0: c00797f8 c00330cc 00000004 00000020 c34a3dec c34a3de0 c003473c c0033178 
>3de0: c34a3e14 c34a3df0 c0034b18 c00330cc c0043068 60000093 c3b43bcc c3b43bc0 
>3e00: c34a3e50 0000000b c34a3fb0 c34a3e18 c00433b4 c0034a70 c346f6a0 80000013 
>3e20: 0000000b c3bca0cc c34a3fb0 c34a3e38 c0043694 c00330cc c34a3fb0 c34a3e48 
>3e40: c00795f8 c00330cc c3b43bc0 c34a3ee8 c346f8f4 0000000b c34a3f68 c3bc9ff0 
>3e60: c34a3ee8 c0043f98 c3ae5000 c346f8dc 400367cc c0044074 c346f8dc c0044280 
>3e80: c34a2000 00000001 c3bcb000 0000000b 000000dc c34a2000 c34a3ee8 c34a3f68 
>3ea0: c3bc9ff0 c3b52e00 c34a3fb0 c0044ec8 00000000 00000000 400367cc c34a3fb0 
>3ec0: 40041174 00000000 c34a2000 00000000 2a00a984 c00291d4 00030001 c34a3fb0 
>3ee0: 00000000 c346f8dc 0000000b 00000000 00030001 00000000 c34a3e70 c3ae5000 
>3f00: c3ae5000 c00847a4 2a00a984 c00261e4 c0304788 00000107 00000001 00000000 
>3f20: 00000000 00000010 00000001 00000000 00000002 c34b4000 c34a3fac 40038480 
>3f40: c38000dc 00024801 00000000 c3b43b40 c3bcbe80 00000003 2a00a984 c34a3f68 
>3f60: 2a00a984 c34a3f70 c0061548 c00330cc 00024800 00000138 fffffffe fffffffe 
>3f80: c3ae5000 c0079e1c f4000000 ffffffff 400367cc bec19c1c 40041174 00000000 
>3fa0: c34a2000 00000000 2a00a984 c0026c8c 00000000 00000003 00000140 4018897c 
>3fc0: 40188600 400367cc bec19c1c 40041174 000010e8 2a00b008 00000000 2a00a984 
>3fe0: 40041174 bec18b20 40038d7c 40031dac 60000010 ffffffff 00000000 00000000 
>Backtrace: 
>Code: e3a06000 e593c234 e593b0ac e3a00456 (e590f0b8) 
>---[ end trace 44c9aec1cc73ba24 ]---
>Alignment trap: gpe-confd (1082) PC=0x401d71a8 Instr=0x15840000 Address=0xbe9401e3 FSR 0x813
>g_ether gadget: full speed config #1: CDC Ethernet (ECM)
>root@h1940:~# 
>root@h1940:~# 


Thanks,

Tom.



