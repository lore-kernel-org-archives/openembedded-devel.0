Received: from smtp4.nedap.com ([213.160.213.85] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1TbqbA-0007IW-Tw
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Nov 2012 11:35:16 +0100
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.83.0; Fri, 23 Nov 2012
	11:20:57 +0100
X-TM-IMSS-Message-ID: <15c57cf00021dd39@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 15c57cf00021dd39 ;
	Fri, 23 Nov 2012 11:20:48 +0100
Message-ID: <50AF4E08.7010402@nedap.com>
Date: Fri, 23 Nov 2012 11:20:56 +0100
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: libftdi
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
X-List-Received-Date: Fri, 23 Nov 2012 10:35:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,
on my buildserver under debian, libftdi does not compile.
Looks like some library issue.
Anyone an idea how to solve?
Thanks in advance!
Jaap


NOTE: package libftdi-0.19-r0: task do_compile: Started
ERROR: Function failed: do_compile (see 
/var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/work/armv5te-angstrom-linux-gnueabi/libftdi-0.19-r0/temp/log.do_compile.21748 
for further information)
ERROR: Logfile of failure stored in: 
/var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/work/armv5te-angstrom-linux-gnueabi/libftdi-0.19-r0/temp/log.do_compile.21748
Log data follows:
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 
'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| ERROR: Function failed: do_compile (see 
/var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/work/armv5te-angstrom-linux-gnueabi/libftdi-0.19-r0/temp/log.do_compile.21748 
for further information)
| NOTE: make -j2
| make  all-recursive
| make[1]: Entering directory 
`/data/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/work/armv5te-angstrom-linux-gnueabi/libftdi-0.19-r0/libftdi-0.19'
| Making all in src
| make[2]: Entering directory 
`/data/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/work/armv5te-angstrom-linux-gnueabi/libftdi-0.19-r0/libftdi-0.19/src'
| ../arm-angstrom-linux-gnueabi-libtool --tag=CC   --mode=compile 
arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -marm -mthumb-interwork  
-mtune=arm926ej-s 
--sysroot=/var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/sysroots/nedap9g45 
-DHAVE_CONFIG_H -I. -I..     -O2 -pipe -g -feliminate-unused-debug-types 
-I/var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/sysroots/nedap9g45/usr/include 
-c -o ftdi.lo ftdi.c
| arm-angstrom-linux-gnueabi-libtool: compile: 
arm-angstrom-linux-gnueabi-gcc -march=armv5te -marm -mthumb-interwork 
-mtune=arm926ej-s 
--sysroot=/var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/sysroots/nedap9g45 
-DHAVE_CONFIG_H -I. -I.. -O2 -pipe -g -feliminate-unused-debug-types 
-I/var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/sysroots/nedap9g45/usr/include 
-c ftdi.c  -fPIC -DPIC -o .libs/ftdi.o
| arm-angstrom-linux-gnueabi-libtool: compile: 
arm-angstrom-linux-gnueabi-gcc -march=armv5te -marm -mthumb-interwork 
-mtune=arm926ej-s 
--sysroot=/var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/sysroots/nedap9g45 
-DHAVE_CONFIG_H -I. -I.. -O2 -pipe -g -feliminate-unused-debug-types 
-I/var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/sysroots/nedap9g45/usr/include 
-c ftdi.c -o ftdi.o >/dev/null 2>&1
| ../arm-angstrom-linux-gnueabi-libtool --tag=CC   --mode=link 
arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -marm -mthumb-interwork  
-mtune=arm926ej-s 
--sysroot=/var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/sysroots/nedap9g45 
-O2 -pipe -g -feliminate-unused-debug-types 
-I/var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/sysroots/nedap9g45/usr/include 
-version-info 20:0:19 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o 
libftdi.la -rpath /usr/lib ftdi.lo  -L/lib -lusb
| arm-angstrom-linux-gnueabi-libtool: link: 
arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -marm -mthumb-interwork  
-mtune=arm926ej-s 
--sysroot=/var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/sysroots/nedap9g45 
-shared  -fPIC -DPIC  .libs/ftdi.o   -L/lib 
/var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/sysroots/nedap9g45/lib/libusb.so 
-L=/lib 
-L/var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/sysroots/nedap9g45/lib 
/var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/sysroots/nedap9g45/lib/libusb-1.0.so 
-lrt  -march=armv5te -marm -mthumb-interwork -mtune=arm926ej-s 
--sysroot=/var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/sysroots/nedap9g45 
-O2 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed   -pthread -Wl,-soname 
-Wl,libftdi.so.1 -o .libs/libftdi.so.1.19.0
| 
/data/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/sysroots/x86_64-linux/usr/bin/armv5te-angstrom-linux-gnueabi/../../libexec/armv5te-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.5.4/ld: 
warning: library search path "/lib" is unsafe for cross-compilation
| /lib/libgcc_s.so.1: file not recognized: File format not recognized
| collect2: ld returned 1 exit status
| make[2]: *** [libftdi.la] Error 1
| make[2]: Leaving directory 
`/data/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/work/armv5te-angstrom-linux-gnueabi/libftdi-0.19-r0/libftdi-0.19/src'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory 
`/data/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/work/armv5te-angstrom-linux-gnueabi/libftdi-0.19-r0/libftdi-0.19'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
NOTE: package libftdi-0.19-r0: task do_compile: Failed
ERROR: Task 3036 
(/data/jenkins/jobs/oe-core/develop/sources/meta-openembedded/meta-oe/recipes-support/libftdi/libftdi_0.19.bb, 
do_compile) failed with exit code '1'
Waiting for 1 running tasks to finish:
0: linux-2.6.35-r17 do_configure (pid 20050)
NOTE: package linux-2.6.35-r17: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2144 tasks of which 2127 didn't need to 
be rerun and 1 failed.

Summary: 1 task failed:
/data/jenkins/jobs/oe-core/develop/sources/meta-openembedded/meta-oe/recipes-support/libftdi/libftdi_0.19.bb, 
do_compile
Summary: There was 1 ERROR message shown, returning a non-zero exit code.



