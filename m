Received: from [87.193.137.100] (helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1N60hF-0004yv-Aq
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 12:40:12 +0100
Received: from hiob.intern.dresearch.de (unknown [10.32.0.138])
	by mail.dresearch.de (Postfix) with ESMTP id 4D7BB491292
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2009 12:38:58 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 5 Nov 2009 12:41:26 +0100
Message-ID: <4AF2B936.4020105@dresearch.de>
Date: Thu, 05 Nov 2009 12:38:30 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 05 Nov 2009 11:41:26.0109 (UTC)
	FILETIME=[E828D8D0:01CA5E0C]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: opkg memory problem?
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
X-List-Received-Date: Thu, 05 Nov 2009 11:40:13 -0000
Content-Type: multipart/mixed; boundary="------------050804080404030402020502"

--------------050804080404030402020502
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

While building a (bigger) image for hipox (arm926ejs) machine: :(

NOTE: Running task 3603 of 3604 (ID: 10,
/home/DRESEARCH/sledz/work/HydraIP/OE/hipox/recipes/images/hydraip-hipox-devimage.bb,
 do_rootfs)
*** glibc detected *** opkg-cl: realloc(): invalid next size:
0x08068908 ***
======= Backtrace: =========
/lib/libc.so.6[0xb7367654]
/lib/libc.so.6[0xb736b161]
/lib/libc.so.6(realloc+0x110)[0xb736bdb0]
/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libopkg.so.0[0xb76e6d4a]
/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libopkg.so.0[0xb76db6eb]
/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libopkg.so.0(opkg_cmd_exec+0x3a)[0xb76d93ca]
/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libopkg.so.0(opkg_op+0x19e)[0xb76d6ece]
opkg-cl[0x8048622]
/lib/libc.so.6(__libc_start_main+0xe5)[0xb7311705]
opkg-cl[0x8048561]

For full output see attached log file.

An interesting point is that bitbake reports the build as successful.

Steffen
NOTE: Running task 3603 of 3604 (ID: 10, /home/DRESEARCH/sledz/work/HydraIP/OE/hipox/recipes/images/hydraip-hipox-devimage.bb, do_rootfs)
*** glibc detected *** opkg-cl: realloc(): invalid next size: 0x08068908 ***
======= Backtrace: =========
/lib/libc.so.6[0xb7367654]
/lib/libc.so.6[0xb736b161]
/lib/libc.so.6(realloc+0x110)[0xb736bdb0]
/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libopkg.so.0[0xb76e6d4a]
/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libopkg.so.0[0xb76db6eb]
/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libopkg.so.0(opkg_cmd_exec+0x3a)[0xb76d93ca]
/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libopkg.so.0(opkg_op+0x19e)[0xb76d6ece]
opkg-cl[0x8048622]
/lib/libc.so.6(__libc_start_main+0xe5)[0xb7311705]
opkg-cl[0x8048561]
======= Memory map: ========
08048000-08049000 r-xp 00000000 08:11 24850197   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/bin/opkg-cl
08049000-0804a000 r--p 00000000 08:11 24850197   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/bin/opkg-cl
0804a000-0804b000 rw-p 00001000 08:11 24850197   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/bin/opkg-cl
0804b000-081ba000 rw-p 0804b000 00:00 0          [heap]
b7100000-b7121000 rw-p b7100000 00:00 0 
b7121000-b7200000 ---p b7121000 00:00 0 
b728b000-b7298000 r-xp 00000000 08:02 1327222    /lib/libgcc_s.so.1
b7298000-b7299000 r--p 0000c000 08:02 1327222    /lib/libgcc_s.so.1
b7299000-b729a000 rw-p 0000d000 08:02 1327222    /lib/libgcc_s.so.1
b729a000-b729b000 rw-p b729a000 00:00 0 
b729b000-b72b1000 r-xp 00000000 08:02 1327141    /lib/libpthread-2.9.so
b72b1000-b72b2000 r--p 00015000 08:02 1327141    /lib/libpthread-2.9.so
b72b2000-b72b3000 rw-p 00016000 08:02 1327141    /lib/libpthread-2.9.so
b72b3000-b72b6000 rw-p b72b3000 00:00 0 
b72b6000-b72c8000 r-xp 00000000 08:02 1328830    /lib/libresolv-2.9.so
b72c8000-b72c9000 r--p 00011000 08:02 1328830    /lib/libresolv-2.9.so
b72c9000-b72ca000 rw-p 00012000 08:02 1328830    /lib/libresolv-2.9.so
b72ca000-b72cc000 rw-p b72ca000 00:00 0 
b72cc000-b72e4000 r-xp 00000000 08:02 3940779    /usr/lib/libsasl2.so.2.0.22
b72e4000-b72e5000 r--p 00018000 08:02 3940779    /usr/lib/libsasl2.so.2.0.22
b72e5000-b72e6000 rw-p 00019000 08:02 3940779    /usr/lib/libsasl2.so.2.0.22
b72e6000-b72f4000 r-xp 00000000 08:02 3944497    /usr/lib/liblber-2.4.so.2.2.0
b72f4000-b72f5000 r--p 0000d000 08:02 3944497    /usr/lib/liblber-2.4.so.2.2.0
b72f5000-b72f6000 rw-p 0000e000 08:02 3944497    /usr/lib/liblber-2.4.so.2.2.0
b72f6000-b72f9000 r-xp 00000000 08:02 1328814    /lib/libdl-2.9.so
b72f9000-b72fa000 r--p 00002000 08:02 1328814    /lib/libdl-2.9.so
b72fa000-b72fb000 rw-p 00003000 08:02 1328814    /lib/libdl-2.9.so
b72fb000-b7450000 r-xp 00000000 08:02 1327115    /lib/libc-2.9.so
b7450000-b7451000 ---p 00155000 08:02 1327115    /lib/libc-2.9.so
b7451000-b7453000 r--p 00155000 08:02 1327115    /lib/libc-2.9.so
b7453000-b7454000 rw-p 00157000 08:02 1327115    /lib/libc-2.9.so
b7454000-b7458000 rw-p b7454000 00:00 0 
b7458000-b746a000 r-xp 00000000 08:11 24849064   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libz.so.1.2.3
b746a000-b746b000 r--p 00011000 08:11 24849064   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libz.so.1.2.3
b746b000-b746c000 rw-p 00012000 08:11 24849064   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libz.so.1.2.3
b746c000-b75b1000 r-xp 00000000 08:11 24849469   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libcrypto.so.0.9.8
b75b1000-b75b9000 r--p 00144000 08:11 24849469   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libcrypto.so.0.9.8
b75b9000-b75c8000 rw-p 0014c000 08:11 24849469   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libcrypto.so.0.9.8
b75c8000-b75cb000 rw-p b75c8000 00:00 0 
b75cb000-b7615000 r-xp 00000000 08:11 24849472   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libssl.so.0.9.8
b7615000-b7616000 ---p 0004a000 08:11 24849472   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libssl.so.0.9.8
b7616000-b7617000 r--p 0004a000 08:11 24849472   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libssl.so.0.9.8
b7617000-b761a000 rw-p 0004b000 08:11 24849472   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libssl.so.0.9.8
b761a000-b7622000 r-xp 00000000 08:02 1328832    /lib/librt-2.9.so
b7622000-b7623000 r--p 00007000 08:02 1328832    /lib/librt-2.9.so
b7623000-b7624000 rw-p 00008000 08:02 1328832    /lib/librt-2.9.so
b7624000-b7666000 r-xp 00000000 08:02 3944499    /usr/lib/libldap-2.4.so.2.2.0
b7666000-b7667000 r--p 00041000 08:02 3944499    /usr/lib/libldap-2.4.so.2.2.0
b7667000-b7668000 rw-p 00042000 08:02 3944499    /usr/lib/libldap-2.4.so.2.2.0
b7668000-b7669000 rw-p b7668000 00:00 0 
b768f000-b76d1000 r-xp 00000000 08:11 24849679   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libcurl.so.4.1.1
b76d1000-b76d2000 r--p 00042000 08:11 24849679   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libcurl.so.4.1.1
b76d2000-b76d3000 rw-p 00043000 08:11 24849679   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libcurl.so.4.1.1
b76d3000-b76ff000 r-xp 00000000 08:11 24850204   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libopkg.so.0.0.0
b76ff000-b7700000 r--p 0002b000 08:11 24850204   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libopkg.so.0.0.0
b7700000-b7701000 rw-p 0002c000 08:11 24850204   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libopkg.so.0.0.0
b7701000-b7708000 r-xp 00000000 08:11 24849181   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libfakeroot-0.so
b7708000-b7709000 r--p 00006000 08:11 24849181   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libfakeroot-0.so
b7709000-b770a000 rw-p 00007000 08:11 24849181   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libfakeroot-0.so
b770a000-b770b000 rw-p b770a000 00:00 0 
b770b000-b7729000 r-xp 00000000 08:02 1328123    /lib/ld-2.9.so
b7729000-b772a000 r--p 0001d000 08:02 1328123    /lib/ld-2.9.so
b772a000-b772b000 rw-p 0001e000 08:02 1328123    /lib/ld-2.9.so
bfd2a000-bfd3f000 rwxp bffe9000 00:00 0          [stack]
bfd3f000-bfd41000 rw-p bfffe000 00:00 0 
ffffe000-fffff000 r-xp 00000000 00:00 0          [vdso]
*** glibc detected *** opkg-cl: realloc(): invalid next size: 0x08068908 ***
======= Backtrace: =========
/lib/libc.so.6[0xb74ae654]
/lib/libc.so.6[0xb74b2161]
/lib/libc.so.6(realloc+0x110)[0xb74b2db0]
/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libopkg.so.0[0xb782dd4a]
/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libopkg.so.0[0xb78226eb]
/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libopkg.so.0(opkg_cmd_exec+0x3a)[0xb78203ca]
/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libopkg.so.0(opkg_op+0x19e)[0xb781dece]
opkg-cl[0x8048622]
/lib/libc.so.6(__libc_start_main+0xe5)[0xb7458705]
opkg-cl[0x8048561]
======= Memory map: ========
08048000-08049000 r-xp 00000000 08:11 24850197   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/bin/opkg-cl
08049000-0804a000 r--p 00000000 08:11 24850197   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/bin/opkg-cl
0804a000-0804b000 rw-p 00001000 08:11 24850197   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/bin/opkg-cl
0804b000-081ba000 rw-p 0804b000 00:00 0          [heap]
b7200000-b7221000 rw-p b7200000 00:00 0 
b7221000-b7300000 ---p b7221000 00:00 0 
b73d2000-b73df000 r-xp 00000000 08:02 1327222    /lib/libgcc_s.so.1
b73df000-b73e0000 r--p 0000c000 08:02 1327222    /lib/libgcc_s.so.1
b73e0000-b73e1000 rw-p 0000d000 08:02 1327222    /lib/libgcc_s.so.1
b73e1000-b73e2000 rw-p b73e1000 00:00 0 
b73e2000-b73f8000 r-xp 00000000 08:02 1327141    /lib/libpthread-2.9.so
b73f8000-b73f9000 r--p 00015000 08:02 1327141    /lib/libpthread-2.9.so
b73f9000-b73fa000 rw-p 00016000 08:02 1327141    /lib/libpthread-2.9.so
b73fa000-b73fd000 rw-p b73fa000 00:00 0 
b73fd000-b740f000 r-xp 00000000 08:02 1328830    /lib/libresolv-2.9.so
b740f000-b7410000 r--p 00011000 08:02 1328830    /lib/libresolv-2.9.so
b7410000-b7411000 rw-p 00012000 08:02 1328830    /lib/libresolv-2.9.so
b7411000-b7413000 rw-p b7411000 00:00 0 
b7413000-b742b000 r-xp 00000000 08:02 3940779    /usr/lib/libsasl2.so.2.0.22
b742b000-b742c000 r--p 00018000 08:02 3940779    /usr/lib/libsasl2.so.2.0.22
b742c000-b742d000 rw-p 00019000 08:02 3940779    /usr/lib/libsasl2.so.2.0.22
b742d000-b743b000 r-xp 00000000 08:02 3944497    /usr/lib/liblber-2.4.so.2.2.0
b743b000-b743c000 r--p 0000d000 08:02 3944497    /usr/lib/liblber-2.4.so.2.2.0
b743c000-b743d000 rw-p 0000e000 08:02 3944497    /usr/lib/liblber-2.4.so.2.2.0
b743d000-b7440000 r-xp 00000000 08:02 1328814    /lib/libdl-2.9.so
b7440000-b7441000 r--p 00002000 08:02 1328814    /lib/libdl-2.9.so
b7441000-b7442000 rw-p 00003000 08:02 1328814    /lib/libdl-2.9.so
b7442000-b7597000 r-xp 00000000 08:02 1327115    /lib/libc-2.9.so
b7597000-b7598000 ---p 00155000 08:02 1327115    /lib/libc-2.9.so
b7598000-b759a000 r--p 00155000 08:02 1327115    /lib/libc-2.9.so
b759a000-b759b000 rw-p 00157000 08:02 1327115    /lib/libc-2.9.so
b759b000-b759f000 rw-p b759b000 00:00 0 
b759f000-b75b1000 r-xp 00000000 08:11 24849064   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libz.so.1.2.3
b75b1000-b75b2000 r--p 00011000 08:11 24849064   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libz.so.1.2.3
b75b2000-b75b3000 rw-p 00012000 08:11 24849064   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libz.so.1.2.3
b75b3000-b76f8000 r-xp 00000000 08:11 24849469   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libcrypto.so.0.9.8
b76f8000-b7700000 r--p 00144000 08:11 24849469   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libcrypto.so.0.9.8
b7700000-b770f000 rw-p 0014c000 08:11 24849469   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libcrypto.so.0.9.8
b770f000-b7712000 rw-p b770f000 00:00 0 
b7712000-b775c000 r-xp 00000000 08:11 24849472   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libssl.so.0.9.8
b775c000-b775d000 ---p 0004a000 08:11 24849472   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libssl.so.0.9.8
b775d000-b775e000 r--p 0004a000 08:11 24849472   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libssl.so.0.9.8
b775e000-b7761000 rw-p 0004b000 08:11 24849472   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libssl.so.0.9.8
b7761000-b7769000 r-xp 00000000 08:02 1328832    /lib/librt-2.9.so
b7769000-b776a000 r--p 00007000 08:02 1328832    /lib/librt-2.9.so
b776a000-b776b000 rw-p 00008000 08:02 1328832    /lib/librt-2.9.so
b776b000-b77ad000 r-xp 00000000 08:02 3944499    /usr/lib/libldap-2.4.so.2.2.0
b77ad000-b77ae000 r--p 00041000 08:02 3944499    /usr/lib/libldap-2.4.so.2.2.0
b77ae000-b77af000 rw-p 00042000 08:02 3944499    /usr/lib/libldap-2.4.so.2.2.0
b77af000-b77b0000 rw-p b77af000 00:00 0 
b77d6000-b7818000 r-xp 00000000 08:11 24849679   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libcurl.so.4.1.1
b7818000-b7819000 r--p 00042000 08:11 24849679   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libcurl.so.4.1.1
b7819000-b781a000 rw-p 00043000 08:11 24849679   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libcurl.so.4.1.1
b781a000-b7846000 r-xp 00000000 08:11 24850204   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libopkg.so.0.0.0
b7846000-b7847000 r--p 0002b000 08:11 24850204   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libopkg.so.0.0.0
b7847000-b7848000 rw-p 0002c000 08:11 24850204   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libopkg.so.0.0.0
b7848000-b784f000 r-xp 00000000 08:11 24849181   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libfakeroot-0.so
b784f000-b7850000 r--p 00006000 08:11 24849181   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libfakeroot-0.so
b7850000-b7851000 rw-p 00007000 08:11 24849181   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libfakeroot-0.so
b7851000-b7852000 rw-p b7851000 00:00 0 
b7852000-b7870000 r-xp 00000000 08:02 1328123    /lib/ld-2.9.so
b7870000-b7871000 r--p 0001d000 08:02 1328123    /lib/ld-2.9.so
b7871000-b7872000 rw-p 0001e000 08:02 1328123    /lib/ld-2.9.so
bffc0000-bffd4000 rwxp bffe9000 00:00 0          [stack]
bffd4000-bffd7000 rw-p bfffd000 00:00 0 
ffffe000-fffff000 r-xp 00000000 00:00 0          [vdso]
*** glibc detected *** opkg-cl: realloc(): invalid next size: 0x08068908 ***
======= Backtrace: =========
/lib/libc.so.6[0xb752c654]
/lib/libc.so.6[0xb7530161]
/lib/libc.so.6(realloc+0x110)[0xb7530db0]
/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libopkg.so.0[0xb78abd4a]
/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libopkg.so.0[0xb78a06eb]
/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libopkg.so.0(opkg_cmd_exec+0x3a)[0xb789e3ca]
/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libopkg.so.0(opkg_op+0x19e)[0xb789bece]
opkg-cl[0x8048622]
/lib/libc.so.6(__libc_start_main+0xe5)[0xb74d6705]
opkg-cl[0x8048561]
======= Memory map: ========
08048000-08049000 r-xp 00000000 08:11 24850197   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/bin/opkg-cl
08049000-0804a000 r--p 00000000 08:11 24850197   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/bin/opkg-cl
0804a000-0804b000 rw-p 00001000 08:11 24850197   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/bin/opkg-cl
0804b000-081ba000 rw-p 0804b000 00:00 0          [heap]
b7300000-b7321000 rw-p b7300000 00:00 0 
b7321000-b7400000 ---p b7321000 00:00 0 
b7450000-b745d000 r-xp 00000000 08:02 1327222    /lib/libgcc_s.so.1
b745d000-b745e000 r--p 0000c000 08:02 1327222    /lib/libgcc_s.so.1
b745e000-b745f000 rw-p 0000d000 08:02 1327222    /lib/libgcc_s.so.1
b745f000-b7460000 rw-p b745f000 00:00 0 
b7460000-b7476000 r-xp 00000000 08:02 1327141    /lib/libpthread-2.9.so
b7476000-b7477000 r--p 00015000 08:02 1327141    /lib/libpthread-2.9.so
b7477000-b7478000 rw-p 00016000 08:02 1327141    /lib/libpthread-2.9.so
b7478000-b747b000 rw-p b7478000 00:00 0 
b747b000-b748d000 r-xp 00000000 08:02 1328830    /lib/libresolv-2.9.so
b748d000-b748e000 r--p 00011000 08:02 1328830    /lib/libresolv-2.9.so
b748e000-b748f000 rw-p 00012000 08:02 1328830    /lib/libresolv-2.9.so
b748f000-b7491000 rw-p b748f000 00:00 0 
b7491000-b74a9000 r-xp 00000000 08:02 3940779    /usr/lib/libsasl2.so.2.0.22
b74a9000-b74aa000 r--p 00018000 08:02 3940779    /usr/lib/libsasl2.so.2.0.22
b74aa000-b74ab000 rw-p 00019000 08:02 3940779    /usr/lib/libsasl2.so.2.0.22
b74ab000-b74b9000 r-xp 00000000 08:02 3944497    /usr/lib/liblber-2.4.so.2.2.0
b74b9000-b74ba000 r--p 0000d000 08:02 3944497    /usr/lib/liblber-2.4.so.2.2.0
b74ba000-b74bb000 rw-p 0000e000 08:02 3944497    /usr/lib/liblber-2.4.so.2.2.0
b74bb000-b74be000 r-xp 00000000 08:02 1328814    /lib/libdl-2.9.so
b74be000-b74bf000 r--p 00002000 08:02 1328814    /lib/libdl-2.9.so
b74bf000-b74c0000 rw-p 00003000 08:02 1328814    /lib/libdl-2.9.so
b74c0000-b7615000 r-xp 00000000 08:02 1327115    /lib/libc-2.9.so
b7615000-b7616000 ---p 00155000 08:02 1327115    /lib/libc-2.9.so
b7616000-b7618000 r--p 00155000 08:02 1327115    /lib/libc-2.9.so
b7618000-b7619000 rw-p 00157000 08:02 1327115    /lib/libc-2.9.so
b7619000-b761d000 rw-p b7619000 00:00 0 
b761d000-b762f000 r-xp 00000000 08:11 24849064   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libz.so.1.2.3
b762f000-b7630000 r--p 00011000 08:11 24849064   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libz.so.1.2.3
b7630000-b7631000 rw-p 00012000 08:11 24849064   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libz.so.1.2.3
b7631000-b7776000 r-xp 00000000 08:11 24849469   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libcrypto.so.0.9.8
b7776000-b777e000 r--p 00144000 08:11 24849469   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libcrypto.so.0.9.8
b777e000-b778d000 rw-p 0014c000 08:11 24849469   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libcrypto.so.0.9.8
b778d000-b7790000 rw-p b778d000 00:00 0 
b7790000-b77da000 r-xp 00000000 08:11 24849472   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libssl.so.0.9.8
b77da000-b77db000 ---p 0004a000 08:11 24849472   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libssl.so.0.9.8
b77db000-b77dc000 r--p 0004a000 08:11 24849472   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libssl.so.0.9.8
b77dc000-b77df000 rw-p 0004b000 08:11 24849472   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libssl.so.0.9.8
b77df000-b77e7000 r-xp 00000000 08:02 1328832    /lib/librt-2.9.so
b77e7000-b77e8000 r--p 00007000 08:02 1328832    /lib/librt-2.9.so
b77e8000-b77e9000 rw-p 00008000 08:02 1328832    /lib/librt-2.9.so
b77e9000-b782b000 r-xp 00000000 08:02 3944499    /usr/lib/libldap-2.4.so.2.2.0
b782b000-b782c000 r--p 00041000 08:02 3944499    /usr/lib/libldap-2.4.so.2.2.0
b782c000-b782d000 rw-p 00042000 08:02 3944499    /usr/lib/libldap-2.4.so.2.2.0
b782d000-b782e000 rw-p b782d000 00:00 0 
b7854000-b7896000 r-xp 00000000 08:11 24849679   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libcurl.so.4.1.1
b7896000-b7897000 r--p 00042000 08:11 24849679   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libcurl.so.4.1.1
b7897000-b7898000 rw-p 00043000 08:11 24849679   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libcurl.so.4.1.1
b7898000-b78c4000 r-xp 00000000 08:11 24850204   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libopkg.so.0.0.0
b78c4000-b78c5000 r--p 0002b000 08:11 24850204   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libopkg.so.0.0.0
b78c5000-b78c6000 rw-p 0002c000 08:11 24850204   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libopkg.so.0.0.0
b78c6000-b78cd000 r-xp 00000000 08:11 24849181   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libfakeroot-0.so
b78cd000-b78ce000 r--p 00006000 08:11 24849181   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libfakeroot-0.so
b78ce000-b78cf000 rw-p 00007000 08:11 24849181   /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/libfakeroot-0.so
b78cf000-b78d0000 rw-p b78cf000 00:00 0 
b78d0000-b78ee000 r-xp 00000000 08:02 1328123    /lib/ld-2.9.so
b78ee000-b78ef000 r--p 0001d000 08:02 1328123    /lib/ld-2.9.so
b78ef000-b78f0000 rw-p 0001e000 08:02 1328123    /lib/ld-2.9.so
bf93f000-bf953000 rwxp bffe9000 00:00 0          [stack]
bf953000-bf956000 rw-p bfffd000 00:00 0 
ffffe000-fffff000 r-xp 00000000 00:00 0          [vdso]
NOTE: Running task 3604 of 3604 (ID: 0, /home/DRESEARCH/sledz/work/HydraIP/OE/hipox/recipes/images/hydraip-hipox-devimage.bb, do_build)
NOTE: Tasks Summary: Attempted 3604 tasks of which 3588 didn't need to be rerun and 0 failed.

--------------050804080404030402020502--
