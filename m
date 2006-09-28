Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GSmJm-00018v-HF for openembedded-devel@lists.openembedded.org;
	Thu, 28 Sep 2006 05:12:11 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 651C04014D2; Wed, 27 Sep 2006 19:42:43 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060928024243.651C04014D2@tinman.treke.net>
Date: Wed, 27 Sep 2006 19:42:43 -0700 (PDT)
Subject: [Bug 1443] glibc-intermediate_2.4 does not build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Sep 2006 03:12:11 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1443


pmiscml@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Severity|major                       |critical
           Priority|P3                          |P1
           Platform|PC                          |ARM
            Version|unspecified                 |Angstrom




------- Comment #1 from pmiscml@gmail.com  2006-09-27 19:42 -------
Confirm for for glibc-2.4 (non-intermediate) with angstrom :

| mv -f
/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/shlib.ldsT
/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/shlib.lds
| arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale   -shared
-static-libgcc -Wl,-O1  -Wl,-z,defs -Wl,-dynamic-linker=/lib/ld-linux.so.3 
-B/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/csu/

-Wl,--version-script=/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/libc.map
-Wl,-soname=libc.so.6 -Wl,-z,combreloc -Wl,-z,relro -nostdlib -nostartfiles -e
__libc_main
-L/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi
-L/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/math
-L/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/elf
-L/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/dlfcn
-L/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/nss
-L/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/nis
-L/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/rt
-L/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/resolv
-L/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/crypt
-L/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/nptl
-Wl,-rpath-link=/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi:/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/math:/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/elf:/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/dlfcn:/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/nss:/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/nis:/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/rt:/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/resolv:/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/crypt:/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/nptl
-o
/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/libc.so
-T
/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/shlib.lds
/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/csu/abi-note.o
/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/elf/soinit.os
/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/libc_pic.os
/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/elf/sofini.os
/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/elf/interp.os
/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/elf/ld.so
-lgcc
|
/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/libc_pic.os:
In function `__GI___fxstatat':
| find_exidx.c:(.text+0x82eec): undefined reference to `__atfct_seterrno'
|
/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/libc_pic.os:
In function `__GI___fxstatat64':
| find_exidx.c:(.text+0x83008): undefined reference to `__atfct_seterrno'
|
/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/libc_pic.os:
In function `fchmodat':
| find_exidx.c:(.text+0x8368c): undefined reference to `__atfct_seterrno'
|
/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/libc_pic.os:
In function `mkdirat':
| find_exidx.c:(.text+0x83774): undefined reference to `__atfct_seterrno'
|
/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/libc_pic.os:
In function `__openat_nocancel':
| find_exidx.c:(.text+0x839bc): undefined reference to `__atfct_seterrno'
|
/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/libc_pic.os:find_exidx.c:(.text+0x83b20):
more undefined references to `__atfct_seterrno' follow
| collect2: ld returned 1 exit status
| make[1]: ***
[/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/build-arm-angstrom-linux-gnueabi/libc.so]
Error 1
| make[1]: Leaving directory
`/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/glibc-2.4'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed:
/home/pfalcon/linux-ppc/build-oe-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.4-r10/temp/log.do_compile.27796


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


