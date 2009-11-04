Received: from [195.77.234.26] (helo=pegasus.cirsa.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <prvs=jorgefm=552e172a1@cirsa.com>)
	id 1N5d6w-0004k6-Nn for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 11:29:10 +0100
X-IronPort-AV: E=Sophos;i="4.44,679,1249250400"; 
   d="scan'208";a="3768886"
Received: from unknown (HELO NTCASA.central.cirsa.com) ([172.17.102.9])
	by pegasus.cirsa.com with ESMTP; 04 Nov 2009 11:27:54 +0100
Received: from ntdes2.central.cirsa.com (172.17.102.2) by
	NTCASA.central.cirsa.com (172.17.102.9) with Microsoft SMTP Server id
	8.2.176.0; Wed, 4 Nov 2009 11:27:53 +0100
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Mailer: Lotus Notes Release 6.5.3 September 14, 2004
Message-ID: <OF0E05AE88.6B7EB133-ONC1257664.003886C4-C1257664.0039937B@cirsa.com>
From: jorge fernandez monteagudo <jorgefm@cirsa.com>
Date: Wed, 4 Nov 2009 11:27:53 +0100
X-MIMETrack: Serialize by Router on ntdes2/DESAR(Release 8.0.2|August 07,
	2008) at 04/11/2009 11:27:53,
	Serialize complete at 04/11/2009 11:27:53
X-SA-Exim-Connect-IP: 195.77.234.26
X-SA-Exim-Mail-From: prvs=jorgefm=552e172a1@cirsa.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Problems building binutils-cross_2.18.50.0.7.bb
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
X-List-Received-Date: Wed, 04 Nov 2009 10:29:10 -0000
Content-Type: text/plain; charset="US-ASCII"

Hi OE list members!

It's my first message on this list, and it's related to the problems I 
have building
OE for my beagleboard. My host machine is a mandriva 2008.0.

I'm following the steps from 
http://elinux.org/BeagleBoardAndOpenEmbeddedGit
and I've been able to do the next steps:

$ git clone http://repo.or.cz/r/openembedded.git
$ cd openembedded
$ git checkout -b stable/2009 origin/stable/2009
$ git pull

I have the repository updated but when I try to build the OE with:

$ bitbake console-image

the process begins ok, but in the 'binutils-cross_2.18.50.0.7.bb' recipe 
fails.
The messages I get are:

NOTE: Running task 253 of 2892 (ID: 1124, 
/mnt/hdb1/arm-beagle/openembedded/recipes/binutils/binutils-cross_2.18.50.0.7.bb, 
do_setscene)
NOTE: Running task 254 of 2892 (ID: 1125, 
/mnt/hdb1/arm-beagle/openembedded/recipes/binutils/binutils-cross_2.18.50.0.7.bb, 
do_fetch)
NOTE: fetch 
http://kernel.org/pub/linux/devel/binutils/binutils-2.18.50.0.7.tar.bz2
--10:12:07-- 
http://kernel.org/pub/linux/devel/binutils/binutils-2.18.50.0.7.tar.bz2
           => 
`/mnt/hdb1/arm-beagle/tmp/downloads/binutils-2.18.50.0.7.tar.bz2'
Connecting to xxx.xxx.xxx.xxx:8080... connected.
Proxy request sent, awaiting response... 200 OK
Length: 14,788,318 (14M) [application/x-bzip2]

100%[=======================================================================================================================>] 
14,788,318    59.23K/s    ETA 00:00

10:17:05 (48.64 KB/s) - 
`/mnt/hdb1/arm-beagle/tmp/downloads/binutils-2.18.50.0.7.tar.bz2' saved 
[14788318/14788318]

NOTE: Running task 255 of 2892 (ID: 1127, 
/mnt/hdb1/arm-beagle/openembedded/recipes/binutils/binutils-cross_2.18.50.0.7.bb, 
do_unpack)
NOTE: Unpacking tmp/downloads/binutils-2.18.50.0.7.tar.bz2 to 
tmp/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r6/
NOTE: Running task 256 of 2892 (ID: 1128, 
/mnt/hdb1/arm-beagle/openembedded/recipes/binutils/binutils-cross_2.18.50.0.7.bb, 
do_patch)
NOTE: Applying patch 'binutils-2.16.91.0.6-objcopy-rename-errorcode.patch' 
(openembedded/recipes/binutils/binutils-2.18.50.0.7/binutils-2.16.91.0.6-objcopy-rename-errorcode.patch)
NOTE: Applying patch 'binutils-uclibc-100-uclibc-conf.patch' 
(openembedded/recipes/binutils/binutils-2.18.50.0.7/binutils-uclibc-100-uclibc-conf.patch)
NOTE: Applying patch '110-arm-eabi-conf.patch' 
(openembedded/recipes/binutils/binutils-2.18.50.0.7/110-arm-eabi-conf.patch)
NOTE: Applying patch 'binutils-uclibc-300-001_ld_makefile_patch.patch' 
(openembedded/recipes/binutils/binutils-2.18.50.0.7/binutils-uclibc-300-001_ld_makefile_patch.patch)
NOTE: Applying patch 'binutils-uclibc-300-006_better_file_error.patch' 
(openembedded/recipes/binutils/binutils-2.18.50.0.7/binutils-uclibc-300-006_better_file_error.patch)
NOTE: Applying patch 
'binutils-uclibc-300-012_check_ldrunpath_length.patch' 
(openembedded/recipes/binutils/binutils-2.18.50.0.7/binutils-uclibc-300-012_check_ldrunpath_length.patch)
NOTE: Applying patch 'binutils-uclibc-gas-needs-libm.patch' 
(openembedded/recipes/binutils/binutils-2.18.50.0.7/binutils-uclibc-gas-needs-libm.patch)
NOTE: Applying patch 'binutils-arm-pr7093.patch' 
(openembedded/recipes/binutils/binutils-2.18.50.0.7/binutils-arm-pr7093.patch)
NOTE: Applying patch 'binutils-2.16.1-e300c2c3.patch' 
(openembedded/recipes/binutils/binutils-2.18.50.0.7/binutils-2.16.1-e300c2c3.patch)
NOTE: Running task 257 of 2892 (ID: 1129, 
/mnt/hdb1/arm-beagle/openembedded/recipes/binutils/binutils-cross_2.18.50.0.7.bb, 
do_configure)
NOTE: Running task 258 of 2892 (ID: 1130, 
/mnt/hdb1/arm-beagle/openembedded/recipes/binutils/binutils-cross_2.18.50.0.7.bb, 
do_qa_configure)
NOTE: Running task 259 of 2892 (ID: 1131, 
/mnt/hdb1/arm-beagle/openembedded/recipes/binutils/binutils-cross_2.18.50.0.7.bb, 
do_compile)
ERROR: function do_compile failed
ERROR: see log in 
/mnt/hdb1/arm-beagle/tmp/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r6/temp/log.do_compile.1958
NOTE: Task failed: 
/mnt/hdb1/arm-beagle/tmp/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r6/temp/log.do_compile.1958
ERROR: TaskFailed event exception, aborting
ERROR: Build of 
/mnt/hdb1/arm-beagle/openembedded/recipes/binutils/binutils-cross_2.18.50.0.7.bb 
do_compile failed
ERROR: Task 1131 
(/mnt/hdb1/arm-beagle/openembedded/recipes/binutils/binutils-cross_2.18.50.0.7.bb, 
do_compile) failed
NOTE: Tasks Summary: Attempted 258 tasks of which 0 didn't need to be 
rerun and 1 failed.
ERROR: 
'/mnt/hdb1/arm-beagle/openembedded/recipes/binutils/binutils-cross_2.18.50.0.7.bb' 
failed


and the log messages are:


if [ x"" != x ]; then \
          gcc -c -DHAVE_CONFIG_H 
-isystem/mnt/hdb1/arm-beagle/tmp/staging/i686-linux/usr/include -O2 -I. 
-I/mnt/hdb1/arm-beagle/tmp/work/armv7a-angstrom-linux-gnue
abi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/../include 
 -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic 
/mnt/hdb1/arm-be
agle/tmp/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c 
-o pic/fibheap.o; \
        else true; fi
gcc -c -DHAVE_CONFIG_H 
-isystem/mnt/hdb1/arm-beagle/tmp/staging/i686-linux/usr/include -O2 -I. 
-I/mnt/hdb1/arm-beagle/tmp/work/armv7a-angstrom-linux-gnueabi/binuti
ls-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/../include  -W 
-Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic 
/mnt/hdb1/arm-beagle/tmp/wo
rk/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c 
-o fibheap.o
Use of uninitialized value in concatenation (.) or string at 
/usr/share/colorgcc/gcc line 200.
/mnt/hdb1/arm-beagle/tmp/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c: 
In function 'fibheap_union':
/mnt/hdb1/arm-beagle/tmp/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c:151: 
warning: implicit declarati
on of function 'free'
/mnt/hdb1/arm-beagle/tmp/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c: 
In function 'fibheap_delete_nod
e':
/mnt/hdb1/arm-beagle/tmp/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c:258: 
error: 'LONG_MIN' undeclare
d (first use in this function)
/mnt/hdb1/arm-beagle/tmp/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c:258: 
error: (Each undeclared ide
ntifier is reported only once
/mnt/hdb1/arm-beagle/tmp/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c:258: 
error: for each function it
 appears in.)
/mnt/hdb1/arm-beagle/tmp/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c: 
In function 'fibheap_consolidat
e':
/mnt/hdb1/arm-beagle/tmp/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c:360: 
warning: implicit declarati
on of function 'memset'
/mnt/hdb1/arm-beagle/tmp/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c:360: 
warning: incompatible impli
cit declaration of built-in function 'memset'
make[2]: *** [fibheap.o] Error 1
make[2]: Leaving directory 
`/mnt/hdb1/arm-beagle/tmp/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/build.i686-linux.arm-ang
strom-linux-gnueabi/libiberty'
make[1]: *** [all-libiberty] Error 2
make[1]: Leaving directory 
`/mnt/hdb1/arm-beagle/tmp/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/build.i686-linux.arm-ang
strom-linux-gnueabi'
make: *** [all] Error 2
FATAL: oe_runmake failed


Any comment is welcome!

Best regards

Jorge 
From dp@xora.org.uk Wed Nov 04 12:03:32 2009
Received: from [209.85.219.209] (helo=mail-ew0-f209.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1N5deD-0001GT-MH
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 12:03:32 +0100
Received: by ewy5 with SMTP id 5so1546175ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2009 03:02:17 -0800 (PST)
Received: by 10.213.51.140 with SMTP id d12mr1728150ebg.9.1257332537259;
	Wed, 04 Nov 2009 03:02:17 -0800 (PST)
Received: from xora-eee (www.xora.org.uk [80.68.91.202])
	by mx.google.com with ESMTPS id 28sm3145162eyg.14.2009.11.04.03.02.16
	(version=SSLv3 cipher=RC4-MD5); Wed, 04 Nov 2009 03:02:16 -0800 (PST)
Date: Wed, 4 Nov 2009 11:02:14 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091104110214.GB3275@xora-eee>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.219.209
X-SA-Exim-Mail-From: dp@xora.org.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [oe] Transfer of OE development devices
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
X-List-Received-Date: Wed, 04 Nov 2009 11:03:32 -0000

Hi, this has been discussed on the list a couple of times
and there have been no objects so this is just final notice
that the transfer will take place.

I am transfering the collie and tosa devices I have in
my posession to Yuri (Jay7) for active devel work.

I have been trying to find a more active developer for
these devices since FOSDEM and Yuri has stepped in.

Graeme



