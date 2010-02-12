Received: from smtp-out116.alice.it ([85.37.17.116])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1Nfsxf-0003FH-BG
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Feb 2010 11:41:26 +0100
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out116.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 12 Feb 2010 11:37:45 +0100
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 12 Feb 2010 11:37:41 +0100
Received: from [192.168.1.116] ([79.51.152.186]) by FBCMCL01B06.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Fri, 12 Feb 2010 11:37:41 +0100
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ac9c93b11002120031y6c352ccci36ca405ca4da95bb@mail.gmail.com>
References: <f4e6dc971002111503m1d0be8v46d23ff0a1e796b2@mail.gmail.com>
	<ac9c93b11002120031y6c352ccci36ca405ca4da95bb@mail.gmail.com>
Date: Fri, 12 Feb 2010 11:37:37 +0100
Message-Id: <1265971057.3759.19.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-OriginalArrivalTime: 12 Feb 2010 10:37:41.0251 (UTC)
	FILETIME=[67431530:01CAABCF]
X-SA-Exim-Connect-IP: 85.37.17.116
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Recent update to modphp segfaults
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
X-List-Received-Date: Fri, 12 Feb 2010 10:41:26 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2010-02-12 at 09:31 +0100, Frans Meulenbroeks wrote:
> 2010/2/12  <openembedded@status.e4ward.com>:
> > Hello all.
> >
> > I am using OpenEmbedded with my Gumstix Overo. I am attempting to put
> > Apache2 and PHP on there. I tried to build Apache2-2.2.14, and it
> > broke on the configure step saying that some checks can't be done
> > while cross compiling. Rather than figure that out, I was pressed for
> > time and simply used Apache2-2.2.3 instead. That worked fine.
> >
> > I recently pulled new updates, and I tried Apache-2.2.14 again. It
> > built! I was happy about that, but then when I tried to get it working
> > with modphp, the Apache2 error log had a bunch of lines like "[notice]
> > child pid xxxx exit signal Segmentation fault (11)". So I decided to
> > try Apache2-2.2.3 again (just in case) and I have the same problem. So
> > my only conclusion is that, although the package version and release
> > version of modphp remained the same, it was updated (when I had it
> > working correctly there was no /etc/apache2/modules.d/ directory; now
> > there is). Is it now broken? I'm not quite sure what the issue is; any
> > advice would be welcome!
> >
> >    Thanks!
> >
> >         Kyle Fazzari
> 
> It is quite possible that you are running out of memory.
> Kill some processes and try again (or set up swap space).
> 
> Btw, you might want to have a look at lighttpd.
> apache is a PITA
> 
> Frans
also look for things like that in dmesg for knowing that you're really
out of memory:

[42949451.770000] mount invoked oom-killer: gfp_mask=0x1201d2, order=0,
oomkilladj=0
[42949451.780000] [<c02d21b8>] (dump_stack+0x0/0x18) from [<c008150c>]
(oom_kill_process+0x5c/0x1c4)
[42949451.790000] [<c00814b0>] (oom_kill_process+0x0/0x1c4) from
[<c0081cc0>] (out_of_memory+0x1d4/0x244)
[42949451.800000] [<c0081aec>] (out_of_memory+0x0/0x244) from
[<c0084948>] (__alloc_pages_internal+0x318/0x3e0)
[42949451.810000] [<c0084630>] (__alloc_pages_internal+0x0/0x3e0) from
[<c0086b30>] (__do_page_cache_readahead+0x110/0x25c)
[42949451.820000] [<c0086a20>] (__do_page_cache_readahead+0x0/0x25c)
from [<c0086cec>] (do_page_cache_readahead+0x70/0x78)
[42949451.830000] [<c0086c7c>] (do_page_cache_readahead+0x0/0x78) from
[<c007eaac>] (filemap_fault+0x1d4/0x428)
[42949451.840000]  r7:00000000 r6:c0b4c000 r5:00000000 r4:00000000
[42949451.840000] [<c007e8d8>] (filemap_fault+0x0/0x428) from
[<c008d45c>] (__do_fault+0x58/0x404)
[42949451.850000] [<c008d404>] (__do_fault+0x0/0x404) from [<c008e534>]
(handle_mm_fault+0x2c4/0x768)
[42949451.860000] [<c008e270>] (handle_mm_fault+0x0/0x768) from
[<c002c608>] (do_page_fault+0xf8/0x24c)
[42949451.870000] [<c002c510>] (do_page_fault+0x0/0x24c) from
[<c002c7f0>] (do_translation_fault+0x20/0x88)
[42949451.880000] [<c002c7d0>] (do_translation_fault+0x0/0x88) from
[<c002622c>] (do_PrefetchAbort+0x1c/0x20)
[42949451.890000]  r6:beff6854 r5:00000020 r4:ffffffff
[42949451.900000] [<c0026210>] (do_PrefetchAbort+0x0/0x20) from
[<c0026c60>] (ret_from_exception+0x0/0x10)
[42949451.900000] Exception stack(0xc0b4dfb0 to 0xc0b4dff8)
[42949451.910000] dfa0:                                     0001e160
00000000 00000073 ffffffff 
[42949451.920000] dfc0: 0001e160 00000020 beff6854 beff6850 4016e000
0000000c beff6780 beff6774 
[42949451.930000] dfe0: 00000000 beff6180 40089e7c 400b8250 60000010
ffffffff                   
[42949451.940000] Mem-info:
[42949451.940000] DMA per-cpu:
[42949451.940000] CPU    0: hi:    0, btch:   1 usd:   0
[42949451.950000] Active:83 inactive:76 dirty:0 writeback:0 unstable:0
[42949451.950000]  free:127 slab:431 mapped:4 pagetables:15 bounce:0
[42949451.960000] DMA free:508kB min:508kB low:632kB high:760kB
active:332kB inactive:304kB present:16256kB pages_scanned:665
all_unreclaimable? yes
[42949451.970000] lowmem_reserve[]: 0 0 0
[42949451.980000] DMA: 1*4kB 1*8kB 1*16kB 1*32kB 1*64kB 1*128kB 1*256kB
0*512kB 0*1024kB 0*2048kB 0*4096kB = 508kB
[42949451.990000] 85 total pagecache pages
[42949451.990000] 0 pages in swap cache
[42949451.990000] Swap cache stats: add 0, delete 0, find 0/0
[42949452.000000] Free swap  = 0kB
[42949452.000000] Total swap = 0kB
[42949452.010000] 4096 pages of RAM
[42949452.010000] 167 free pages
[42949452.010000] 1690 reserved pages
[42949452.020000] 431 slab pages
[42949452.020000] 41 pages shared
[42949452.020000] 0 pages swap cached
[42949452.030000] Out of memory: kill process 843 (rc) score 61 or a
child
[42949452.030000] Killed process 847 (S03sysfs)
Killed
Starting udev
[42949479.080000] awk invoked oom-killer: gfp_mask=0x1201d2, order=0,
oomkilladj=0
[42949479.090000] [<c02d21b8>] (dump_stack+0x0/0x18) from [<c008150c>]
(oom_kill_process+0x5c/0x1c4)
[42949479.090000] [<c00814b0>] (oom_kill_process+0x0/0x1c4) from
[<c0081cc0>] (out_of_memory+0x1d4/0x244)
[42949479.100000] [<c0081aec>] (out_of_memory+0x0/0x244) from
[<c0084948>] (__alloc_pages_internal+0x318/0x3e0)
[42949479.110000] [<c0084630>] (__alloc_pages_internal+0x0/0x3e0) from
[<c0086b30>] (__do_page_cache_readahead+0x110/0x25c)
[42949479.120000] [<c0086a20>] (__do_page_cache_readahead+0x0/0x25c)
from [<c0086cec>] (do_page_cache_readahead+0x70/0x78)
[42949479.140000] [<c0086c7c>] (do_page_cache_readahead+0x0/0x78) from
[<c007eaac>] (filemap_fault+0x1d4/0x428)
[42949479.150000]  r7:00000000 r6:c0b7a000 r5:00000000 r4:00000000
[42949479.150000] [<c007e8d8>] (filemap_fault+0x0/0x428) from
[<c008d45c>] (__do_fault+0x58/0x404)
[42949479.160000] [<c008d404>] (__do_fault+0x0/0x404) from [<c008e534>]
(handle_mm_fault+0x2c4/0x768)
[42949479.170000] [<c008e270>] (handle_mm_fault+0x0/0x768) from
[<c002c608>] (do_page_fault+0xf8/0x24c)
[42949479.180000] [<c002c510>] (do_page_fault+0x0/0x24c) from
[<c002c7f0>] (do_translation_fault+0x20/0x88)
[42949479.190000] [<c002c7d0>] (do_translation_fault+0x0/0x88) from
[<c002622c>] (do_PrefetchAbort+0x1c/0x20)
[42949479.200000]  r6:bea68e14 r5:bea68e04 r4:ffffffff
[42949479.200000] [<c0026210>] (do_PrefetchAbort+0x0/0x20) from
[<c0026c60>] (ret_from_exception+0x0/0x10)
[42949479.210000] Exception stack(0xc0b7bfb0 to 0xc0b7bff8)
[42949479.220000] bfa0:                                     00000000
401bd494 000000b4 bea68ee2 
[42949479.230000] bfc0: 401bd000 bea68e04 bea68e14 00000003 bea68e04
00000000 00000003 40025050 
[42949479.230000] bfe0: bea68ee4 bea68da0 401076b4 400aeed4 60000010
ffffffff                   
[42949479.240000] Mem-info:
[42949479.250000] DMA per-cpu:
[42949479.250000] CPU    0: hi:    0, btch:   1 usd:   0
[42949479.250000] Active:80 inactive:75 dirty:0 writeback:0 unstable:0
[42949479.250000]  free:127 slab:433 mapped:3 pagetables:15 bounce:0
[42949479.270000] DMA free:508kB min:508kB low:632kB high:760kB
active:320kB inactive:300kB present:16256kB pages_scanned:615
all_unreclaimable? yes
[42949479.280000] lowmem_reserve[]: 0 0 0
[42949479.280000] DMA: 1*4kB 1*8kB 1*16kB 1*32kB 1*64kB 1*128kB 1*256kB
0*512kB 0*1024kB 0*2048kB 0*4096kB = 508kB
[42949479.290000] 84 total pagecache pages
[42949479.300000] 0 pages in swap cache
[42949479.300000] Swap cache stats: add 0, delete 0, find 0/0
[42949479.310000] Free swap  = 0kB
[42949479.310000] Total swap = 0kB
[42949479.310000] 4096 pages of RAM
[42949479.320000] 167 free pages
[42949479.320000] 1690 reserved pages
[42949479.320000] 433 slab pages
[42949479.330000] 34 pages shared
[42949479.330000] 0 pages swap cached
[42949479.330000] Out of memory: kill process 843 (rc) score 61 or a
child
[42949479.340000] Killed process 850 (S03udev)
Killed

(booting an angstrom image with mem=16M)

Denis.




