Received: from [81.86.55.16] (helo=DeathStar.local)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <tom@settopsolutions.com>) id 1Gf2Ec-0008Ch-CS
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Oct 2006 23:37:30 +0100
Received: from DeathStar.local (localhost [127.0.0.1])
	by DeathStar.local (Postfix) with ESMTP id 553E0460D1C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2006 22:36:45 +0000 (GMT)
Received: from [127.0.0.1] by DeathStar.local (PGP Universal service);
	Tue, 31 Oct 2006 22:36:45 +0000
X-PGP-Universal: processed;
	by DeathStar.local on Tue, 31 Oct 2006 22:36:45 +0000
Mime-Version: 1.0 (Apple Message framework v752.2)
To: openembedded-devel@lists.openembedded.org
Message-Id: <FAB85116-A1EF-4B0C-A146-830F226B9402@settopsolutions.com>
From: Tom Kirkpatrick <tom@settopsolutions.com>
Date: Tue, 31 Oct 2006 22:36:39 +0000
X-Mailer: Apple Mail (2.752.2)
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: openssl fails to compile with external toolchain
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
X-List-Received-Date: Tue, 31 Oct 2006 22:37:31 -0000
Content-Type: text/plain;
	charset=US-ASCII;
	delsp=yes;
	format=flowed
Content-Transfer-Encoding: 7bit

Hi guys,

as some of you probably know from the IRC room (nickname: tkp), I'm  
trying to get my OE setup to use a prebuilt toolchain following the  
instructions from the wiki. I built the toolchain with OE (meta- 
toolchain) and it seems to be working OK now (although meta-toolchain  
needed a little modification to fix some broken symlinks). However,  
when it came to building openssl, oe chocked...

| + LD_LIBRARY_PATH=..:
| + ccache i586-stv-linux-gcc-3.4.4 -march=c3 -mtune=c3 -o openssl - 
DMONOLITH -I.. -I../include -fPIC -DTHREADS -D_REENTRANT -DDSO_DLFCN - 
DHAVE_DLFCN_H -DTERMIO -Wall -fexpensive-optimizations -fomit-frame- 
pointer -frename-registers -O2 -DL_ENDIAN openssl.o verify.o  
asn1pars.o req.o dgst.o dh.o dhparam.o enc.o passwd.o gendh.o  
errstr.o ca.o pkcs7.o crl2p7.o crl.o rsa.o rsautl.o dsa.o dsaparam.o  
x509.o genrsa.o gendsa.o s_server.o s_client.o speed.o s_time.o  
apps.o s_cb.o s_socket.o app_rand.o version.o sess_id.o ciphers.o  
nseq.o pkcs12.o pkcs8.o spkac.o smime.o rand.o engine.o ocsp.o  
prime.o -L.. -lssl -L.. -lcrypto -lgcc -ldl -L/home/tom/stv/oe-stv/ 
build/tmp-stv-via-c3/staging/i586-stv-linux/lib
| /usr/local/i586/oe/lib/gcc/i586-stv-linux/3.4.4/../../../../i586- 
stv-linux/bin/ld: warning: ld-linux.so.2, needed by /usr/local/i586/ 
oe/lib/gcc/i586-stv-linux/3.4.4/../../../../i586-stv-linux/lib/ 
libdl.so, not found (try using -rpath or -rpath-link)
| /usr/local/i586/oe/lib/gcc/i586-stv-linux/3.4.4/../../../../i586- 
stv-linux/lib/libdl.so: undefined reference to  
`_rtld_global@GLIBC_PRIVATE'
| /usr/local/i586/oe/lib/gcc/i586-stv-linux/3.4.4/../../../../i586- 
stv-linux/lib/libc.so.6: undefined reference to  
`__libc_enable_secure@GLIBC_PRIVATE'
| /usr/local/i586/oe/lib/gcc/i586-stv-linux/3.4.4/../../../../i586- 
stv-linux/lib/libc.so.6: undefined reference to  
`__libc_stack_end@GLIBC_2.1'
| /usr/local/i586/oe/lib/gcc/i586-stv-linux/3.4.4/../../../../i586- 
stv-linux/lib/libdl.so: undefined reference to  
`_rtld_global_ro@GLIBC_PRIVATE'
| /usr/local/i586/oe/lib/gcc/i586-stv-linux/3.4.4/../../../../i586- 
stv-linux/lib/libc.so.6: undefined reference to  
`___tls_get_addr@GLIBC_2.3'
| /usr/local/i586/oe/lib/gcc/i586-stv-linux/3.4.4/../../../../i586- 
stv-linux/lib/libc.so.6: undefined reference to `_dl_argv@GLIBC_PRIVATE'
| /usr/local/i586/oe/lib/gcc/i586-stv-linux/3.4.4/../../../../i586- 
stv-linux/lib/libdl.so: undefined reference to  
`_dl_rtld_di_serinfo@GLIBC_PRIVATE'
| /usr/local/i586/oe/lib/gcc/i586-stv-linux/3.4.4/../../../../i586- 
stv-linux/lib/libdl.so: undefined reference to  
`_dl_tls_get_addr_soft@GLIBC_PRIVATE'
| collect2: ld returned 1 exit status
| make[1]: *** [openssl] Error 1

The problem being that it was not finding ld-linux.so.2. Looking at  
the bb file (openssl.inc) I see the line:
      export EX_LIBS = "-lgcc -ldl -L${STAGING_LIBDIR}

Since I'm using an external toolchain, L${STAGING_LIBDIR is clearly  
wrong, as the libs are not in STAGING_LIBDIR, they are in $ 
{PRE_BUILT}/lib , so I managed to get it to compile by changing that  
line to read:
     export EX_LIBS = "-lgcc -ldl ${TARGET_LDFLAGS}"

Does this look like a sensible fix (I'm no expert, and I'm learning  
as I go along), and if so, would someone like to change this in the  
repo?


best regards
tom (tkp)
From tom@settopsolutions.com Wed Nov 01 01:25:35 2006
Received: from [81.86.55.16] (helo=DeathStar.local)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <tom@settopsolutions.com>) id 1Gf3vC-0003JP-PA
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Nov 2006 01:25:35 +0100
Received: from DeathStar.local (localhost [127.0.0.1])
	by DeathStar.local (Postfix) with ESMTP id 53A26460DF0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Nov 2006 00:24:49 +0000 (GMT)
Received: from [127.0.0.1] by DeathStar.local (PGP Universal service);
	Wed, 01 Nov 2006 00:24:49 +0000
X-PGP-Universal: processed;
	by DeathStar.local on Wed, 01 Nov 2006 00:24:49 +0000
Mime-Version: 1.0 (Apple Message framework v752.2)
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Message-Id: <C1F08532-6678-41F4-8FCE-285593BFC5BA@settopsolutions.com>
Content-Transfer-Encoding: 7bit
From: Tom Kirkpatrick <tom@settopsolutions.com>
Date: Wed, 1 Nov 2006 00:24:46 +0000
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.752.2)
Subject: [oe] xserver-xorg, PATH_MAX and limits.h
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
X-List-Received-Date: Wed, 01 Nov 2006 00:25:35 -0000

When trying to use an external toolchain (built with meta- 
toolchain.bb) to compile xserver-xorg, I get an error about PATH_MAX  
being undeclared (see below)...for some reason, the limits.h with  
this define in it is not being picked up... as you can see, my cross- 
toolchain include directory has been included with -I/usr/local/i586/ 
oe/i586-stv-linux/include. The limits.h file exists at /usr/local/ 
i586/oe/i586-stv-linux/include/limits.h and also at /usr/local/i586/ 
oe/i586-stv-linux/include/linux/limits.h. It is this second file  
which has PATH_MAX defined, and this is not being included by gcc. If  
I alter PsFonts.c like so

--- xorg-server-X11R7.1-1.1.0/Xprint/ps/PsFonts.c       2005-07-07  
03:47:06.000000000 +0100
+++ xorg-server-X11R7.1-1.1.0-PATCHED/Xprint/ps/PsFonts.c        
2006-11-01 00:12:23.000000000 +0000
@@ -89,7 +89,7 @@
#include "Ps.h"

#include <ctype.h>
-#include <limits.h>
+#include <linux/limits.h>
#include <sys/stat.h>


then it compiles OK but I'm not sure if this is actually a problem  
with xserver-xorg, or if it's a problem with the toolchain, and  
therefore with the *-cross-sdk/meta-toolchain stuff in general. Would  
this patch be an acceptable fix, or is this likely to just break  
things more?


|  ccache i586-stv-linux-gcc-3.4.4 -march=c3 -mtune=c3 - 
DHAVE_CONFIG_H -I. -I/home/tom/stv/oe-stv/build/tmp-stv-via-c3/work/ 
i586-stv-linux/xserver-xorg-X11R7.1-1.1.0-r0/xorg-server- 
X11R7.1-1.1.0/Xprint/ps -I../../include -I../../include -I../../ 
include -I../../include -I../../include -I../../include -I../../ 
include -I../../include -I/home/tom/stv/oe-stv/build/tmp-stv-via-c3/ 
work/i586-stv-linux/xserver-xorg-X11R7.1-1.1.0-r0/xorg-server- 
X11R7.1-1.1.0/Xprint -I/home/tom/stv/oe-stv/build/tmp-stv-via-c3/work/ 
i586-stv-linux/xserver-xorg-X11R7.1-1.1.0-r0/xorg-server- 
X11R7.1-1.1.0/cfb -I/home/tom/stv/oe-stv/build/tmp-stv-via-c3/work/ 
i586-stv-linux/xserver-xorg-X11R7.1-1.1.0-r0/xorg-server- 
X11R7.1-1.1.0/mfb -isystem/home/tom/stv/oe-stv/build/tmp-stv-via-c3/ 
staging/i586-stv-linux/include -I/usr/local/i586/oe/i586-stv-linux/ 
include -DXFree86Server -DHAVE_DIX_CONFIG_H -I/home/tom/stv/oe-stv/ 
build/tmp-stv-via-c3/staging/i586-stv-linux/include - 
D_XP_PRINT_SERVER_ -DPSZ=8 -DXP_PSTEXT -Wall -Wpointer-arith -Wstrict- 
prototypes -Wmissing-prototypes -Wmissing-declarations -Wnested- 
externs -fno-strict-aliasing -D_BSD_SOURCE -DHAS_FCHOWN - 
DHAS_STICKY_DIR_BIT -I/home/tom/stv/oe-stv/build/tmp-stv-via-c3/ 
staging/i586-stv-linux/include -I/home/tom/stv/oe-stv/build/tmp-stv- 
via-c3/staging/i586-stv-linux/include/X11/Xtrans -I/home/tom/stv/oe- 
stv/build/tmp-stv-via-c3/work/i586-stv-linux/xserver-xorg- 
X11R7.1-1.1.0-r0/xorg-server-X11R7.1-1.1.0/include -I../../include -I/ 
home/tom/stv/oe-stv/build/tmp-stv-via-c3/work/i586-stv-linux/xserver- 
xorg-X11R7.1-1.1.0-r0/xorg-server-X11R7.1-1.1.0/Xext -I/home/tom/stv/ 
oe-stv/build/tmp-stv-via-c3/work/i586-stv-linux/xserver-xorg- 
X11R7.1-1.1.0-r0/xorg-server-X11R7.1-1.1.0/composite -I/home/tom/stv/ 
oe-stv/build/tmp-stv-via-c3/work/i586-stv-linux/xserver-xorg- 
X11R7.1-1.1.0-r0/xorg-server-X11R7.1-1.1.0/damageext -I/home/tom/stv/ 
oe-stv/build/tmp-stv-via-c3/work/i586-stv-linux/xserver-xorg- 
X11R7.1-1.1.0-r0/xorg-server-X11R7.1-1.1.0/xfixes -I/home/tom/stv/oe- 
stv/build/tmp-stv-via-c3/work/i586-stv-linux/xserver-xorg- 
X11R7.1-1.1.0-r0/xorg-server-X11R7.1-1.1.0/Xi -I/home/tom/stv/oe-stv/ 
build/tmp-stv-via-c3/work/i586-stv-linux/xserver-xorg-X11R7.1-1.1.0- 
r0/xorg-server-X11R7.1-1.1.0/mi -I/home/tom/stv/oe-stv/build/tmp-stv- 
via-c3/work/i586-stv-linux/xserver-xorg-X11R7.1-1.1.0-r0/xorg-server- 
X11R7.1-1.1.0/miext/shadow -I/home/tom/stv/oe-stv/build/tmp-stv-via- 
c3/work/i586-stv-linux/xserver-xorg-X11R7.1-1.1.0-r0/xorg-server- 
X11R7.1-1.1.0/miext/damage -I/home/tom/stv/oe-stv/build/tmp-stv-via- 
c3/work/i586-stv-linux/xserver-xorg-X11R7.1-1.1.0-r0/xorg-server- 
X11R7.1-1.1.0/render -I/home/tom/stv/oe-stv/build/tmp-stv-via-c3/work/ 
i586-stv-linux/xserver-xorg-X11R7.1-1.1.0-r0/xorg-server- 
X11R7.1-1.1.0/randr -I/home/tom/stv/oe-stv/build/tmp-stv-via-c3/work/ 
i586-stv-linux/xserver-xorg-X11R7.1-1.1.0-r0/xorg-server- 
X11R7.1-1.1.0/fb -isystem/home/tom/stv/oe-stv/build/tmp-stv-via-c3/ 
staging/i586-stv-linux/include -I/usr/local/i586/oe/i586-stv-linux/ 
include -O -g -MT PsFonts.lo -MD -MP -MF .deps/PsFonts.Tpo -c  
PsFonts.c  -fPIC -DPIC -o .libs/PsFonts.o
| PsFonts.c: In function `getFontFilename':
| PsFonts.c:292: error: `PATH_MAX' undeclared (first use in this  
function)
| PsFonts.c:292: error: (Each undeclared identifier is reported only  
once
| PsFonts.c:292: error: for each function it appears in.)
| PsFonts.c:343: warning: unused variable `full_font_file_path'
| PsFonts.c:289: warning: unused variable `count'
| PsFonts.c:289: warning: unused variable `i'
| PsFonts.c:289: warning: unused variable `status'
| PsFonts.c:291: warning: unused variable `end'
| PsFonts.c:292: warning: unused variable `font_dir_fname'
| PsFonts.c:293: warning: unused variable `font_file_fname'
| PsFonts.c: In function `PsCreateFontTypeInfoRec':
| PsFonts.c:595: warning: unused variable `psname'
| make[2]: *** [PsFonts.lo] Error 1
| make[2]: Leaving directory `/home/tom/stv/oe-stv/build/tmp-stv-via- 
c3/work/i586-stv-linux/xserver-xorg-X11R7.1-1.1.0-r0/xorg-server- 
X11R7.1-1.1.0/Xprint/ps'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/home/tom/stv/oe-stv/build/tmp-stv-via- 
c3/work/i586-stv-linux/xserver-xorg-X11R7.1-1.1.0-r0/xorg-server- 
X11R7.1-1.1.0/Xprint'
| make: *** [all-recursive] Error 1
| FATAL: oe_runmake failed
NOTE: Task failed: /home/tom/stv/oe-stv/build/tmp-stv-via-c3/work/ 
i586-stv-linux/xserver-xorg-X11R7.1-1.1.0-r0/temp/log.do_compile.9219
NOTE: package xserver-xorg-X11R7.1-1.1.0-r0: task do_compile: failed



