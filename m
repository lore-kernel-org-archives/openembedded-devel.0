Received: from [64.233.162.235] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mario.latronico@gmail.com>) id 1HyjaP-0000wY-MS
	for Openembedded-devel@lists.openembedded.org;
	Thu, 14 Jun 2007 09:17:42 +0200
Received: by nz-out-0506.google.com with SMTP id n29so410554nzf
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jun 2007 00:14:35 -0700 (PDT)
Received: by 10.115.15.1 with SMTP id s1mr1598994wai.1181805274497;
	Thu, 14 Jun 2007 00:14:34 -0700 (PDT)
Received: by 10.115.54.2 with HTTP; Thu, 14 Jun 2007 00:14:34 -0700 (PDT)
Message-ID: <69d481ca0706140014o627c12a7gc5806eee21b32af8@mail.gmail.com>
Date: Thu, 14 Jun 2007 09:14:34 +0200
From: "Mario Latronico" <mario.latronico@gmail.com>
To: Openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Error during Enigma2 compilation
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
X-List-Received-Date: Thu, 14 Jun 2007 07:17:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

I tried OpenEmbedded recently to test some application on Dreambox
7025. I'm particulary interested in Enigma2, the software that
controls the dreambox gui.
However, when i try to compile Enigma2 with the command

bitbake enigma2

the following error comes out:

-------------------------------------

mario@mario-laptop:~/src/stuff/build$ bitbake enigma2
NOTE: Using cache in '/home/mario/src/stuff/cache/oe-cache.mario '
NOTE: Parsing finished. 3871 cached, 0 parsed, 171 skipped, 0 masked.
NOTE: package glibc-intermediate-2.3.2+cvs20040726: started
NOTE: package glibc-intermediate-2.3.2+cvs20040726-r22: task do_configure: start
ed
ERROR: function do_configure failed
ERROR: log data follows (/home/mario/src/stuff/build/tmp/work/glibc-intermediate
-2.3.2+cvs20040726-r22/temp/log.do_configure.6776)
| NOTE: Running /home/mario/src/stuff/build/tmp/work/glibc-intermediate-2.3.2+cv
s20040726-r22/libc/configure                --build=i686-linux              --ho
st=mipsel-linux                     --target=mipsel-linux                   --pr
efix=/usr                   --exec_prefix=/usr              --bindir=/usr/bin
   --sbindir=/usr/sbin              --libexecdir=/usr/libexec               --da
tadir=/usr/share                    --sysconfdir=/etc               --sharedstat
edir=/usr/com               --localstatedir=/var                    --libdir=/us
r/lib               --includedir=/usr/include               --oldincludedir=/usr
/include                    --infodir=/usr/share/info               --mandir=/us
r/share/man                     --enable-kernel=2.6.9           --without-cvs --
disable-profile --disable-debug --without-gd            --enable-clocale=gnu
       --enable-add-ons=linuxthreads            --cache-file=pippo             -
-with-headers=/home/mario/src/stuff/build/tmp/cross/mipsel-linux/include
--without-fp                ...
| configure: loading site script /home/mario/src/stuff/org.openembedded.dreambox
/site/mipsel-linux
| configure: creating cache pippo
| checking build system type... i686-pc-linux-gnu
| checking host system type... mipsel-unknown-linux-gnu
| running configure fragment for add-on linuxthreads
| checking sysdep dirs... sysdeps/mips/elf linuxthreads/sysdeps/unix/sysv/linux/
mips linuxthreads/sysdeps/unix/sysv/linux linuxthreads/sysdeps/pthread sysdeps/p
thread linuxthreads/sysdeps/unix/sysv linuxthreads/sysdeps/unix linuxthreads/sys
deps/mips sysdeps/unix/sysv/linux/mips/mips32 sysdeps/unix/sysv/linux/mips sysde
ps/unix/sysv/linux sysdeps/gnu sysdeps/unix/common sysdeps/unix/mman sysdeps/uni
x/inet sysdeps/unix/sysv sysdeps/unix/mips/mips32 sysdeps/unix/mips sysdeps/unix
 sysdeps/posix sysdeps/mips/mips32 sysdeps/mips sysdeps/ieee754/flt-32 sysdeps/i
eee754/dbl-64 sysdeps/wordsize-32 sysdeps/ieee754 sysdeps/generic/elf sysdeps/ge
neric
| checking for a BSD-compatible install... /home/mario/src/stuff/build/tmp/stagi
ng/i686-linux/bin/install -c
| checking whether ln -s works... yes
| checking for mipsel-linux-gcc... mipsel-linux-gcc
| checking for suffix of object files... o
| checking whether we are using the GNU C compiler... yes
| checking whether mipsel-linux-gcc accepts -g... yes
| checking for mipsel-linux-gcc option to accept ANSI C... none needed
| checking for gcc... gcc
| checking how to run the C preprocessor... mipsel-linux-gcc -E
| checking for mipsel-linux-g++... mipsel-linux-g++
| checking whether we are using the GNU C++ compiler... yes
| checking whether mipsel-linux-g++ accepts -g... yes
| checking whether /home/mario/src/stuff/build/tmp/cross/lib/gcc/mipsel-linux/4.
1.1/../../../../mipsel-linux/bin/as is GNU as... yes
| checking whether /home/mario/src/stuff/build/tmp/cross/lib/gcc/mipsel-linux/4.
1.1/../../../../mipsel-linux/bin/ld is GNU ld... yes
| checking for /home/mario/src/stuff/build/tmp/cross/lib/gcc/mipsel-linux/4.1.1/
../../../../mipsel-linux/bin/as... /home/mario/src/stuff/build/tmp/cross/lib/gcc
/mipsel-linux/4.1.1/../../../../mipsel-linux/bin/as
| checking version of /home/mario/src/stuff/build/tmp/cross/lib/gcc/mipsel-linux
/4.1.1/../../../../mipsel-linux/bin/as... 2.16.1, ok
| checking for /home/mario/src/stuff/build/tmp/cross/lib/gcc/mipsel-linux/4.1.1/
../../../../mipsel-linux/bin/ld... /home/mario/src/stuff/build/tmp/cross/lib/gcc
/mipsel-linux/4.1.1/../../../../mipsel-linux/bin/ld
| checking version of /home/mario/src/stuff/build/tmp/cross/lib/gcc/mipsel-linux
/4.1.1/../../../../mipsel-linux/bin/ld... 2.16.1, ok
| checking for pwd... /home/mario/src/stuff/build/tmp/staging/i686-linux/bin/pwd
| checking for mipsel-linux-gcc... (cached) mipsel-linux-gcc
| checking version of mipsel-linux-gcc... 4.1.1, bad
| checking for gnumake... make
| checking version of make... 3.81, ok
| checking for gnumsgfmt... no
| checking for gmsgfmt... no
| checking for msgfmt... msgfmt
| checking version of msgfmt... 0.14.1, ok
| checking for makeinfo... makeinfo
| checking version of makeinfo... 4.8, ok
| checking for sed... sed
| checking version of sed... 4.1.5, ok
| checking for autoconf... autoconf
| checking whether autoconf works... yes
| configure: error:
| *** These critical programs are missing or too old: gcc
| *** Check the INSTALL file for required versions.
| FATAL: oe_runconf failed
NOTE: Task failed:
/home/mario/src/stuff/build/tmp/work/glibc-intermediate-2.3.2

                  +cvs20040726-r22/temp/log.do_configure.6776
NOTE: package glibc-intermediate-2.3.2+cvs20040726-r22: task
do_configure: faile
                                               d
ERROR: TaskFailed event exception, aborting
NOTE: package glibc-intermediate-2.3.2+cvs20040726: failed
ERROR: Build of enigma2 failed

-------------------------------
It seems i have an old compiler, even if mipsel-linux-gcc has version
4.1.1 (the INSTALL file requires gcc > 3.2)

Another question: i have already (and correctly) compiled glibc-2.3.5.
How can i set enigma2 dependency to glibc-2.3.5 ?
I've seen that the package enigma2 doesn't depend directly on glibc,
how can i find the dependency ?

Thank you in advance !!!

Mario Latronico


