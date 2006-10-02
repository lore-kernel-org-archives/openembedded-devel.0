Received: from [64.233.166.183] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <axel.lin@gmail.com>) id 1GUDoj-00044O-Dr
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Oct 2006 04:46:05 +0200
Received: by py-out-1112.google.com with SMTP id i75so2025247pye
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Oct 2006 19:40:44 -0700 (PDT)
Received: by 10.35.48.15 with SMTP id a15mr6485372pyk;
	Sun, 01 Oct 2006 19:40:44 -0700 (PDT)
Received: by 10.35.15.17 with HTTP; Sun, 1 Oct 2006 19:40:44 -0700 (PDT)
Message-ID: <427d64720610011940nfe910ds579d206522176340@mail.gmail.com>
Date: Mon, 2 Oct 2006 10:40:44 +0800
From: "axel lin" <axel.lin@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: package gcc-cross-4.1.1-r6: task do_compile: failed
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
X-List-Received-Date: Mon, 02 Oct 2006 02:46:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

hi list,
     I'm trying mainstone/angstrom-2007.1  now.
I got below build error messages:
 make[3]: Leaving directory
`/opt/oe/build/tmp/work/iwmmxt-angstrom-linux-gnueabi/gcc-cross-4.1.1-r6/gcc-4.1.1/build.i686-linux.arm-angstrom-linux-gnueabi/gcc'
| echo timestamp > stmp-multilib
| (SHLIB_LINK='/opt/oe/build/tmp/work/iwmmxt-angstrom-linux-gnueabi/gcc-cross-4.1.1-r6/gcc-4.1.1/build.i686-linux.arm-angstrom-linux-gnueabi/./gcc/xgcc
-B/opt/oe/build/tmp/work/iwmmxt-angstrom-linux-gnueabi/gcc-cross-4.1.1-r6/gcc-4.1.1/build.i686-linux.arm-angstrom-linux-gnueabi/./gcc/
-B/opt/oe/build/tmp/cross/arm-angstrom-linux-gnueabi/bin/
-B/opt/oe/build/tmp/cross/arm-angstrom-linux-gnueabi/lib/ -isystem
/opt/oe/build/tmp/cross/arm-angstrom-linux-gnueabi/include -isystem
/opt/oe/build/tmp/cross/arm-angstrom-linux-gnueabi/sys-include -O2  -g
-Os -DIN_GCC -DCROSS_COMPILE   -W -Wall -Wwrite-strings
-Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition
-isystem ./include  -fPIC -g -DHAVE_GTHR_DEFAULT -DIN_LIBGCC2
-D__GCC_FLOAT_NOT_NEEDED -Dinhibit_libc -shared -nodefaultlibs
-Wl,--soname=@shlib_base_name@.so.1
-Wl,--version-script=@shlib_map_file@ -o
@multilib_dir@/@shlib_base_name@.so.1.tmp @multilib_flags@
@shlib_objs@ -lc && rm -f @multilib_dir@/@shlib_base_name@.so && if [
-f @multilib_dir@/@shlib_base_name@.so.1 ]; then mv -f
@multilib_dir@/@shlib_base_name@.so.1
@multilib_dir@/@shlib_base_name@.so.1.backup; else true; fi && mv
@multilib_dir@/@shlib_base_name@.so.1.tmp
@multilib_dir@/@shlib_base_name@.so.1 && ln -s @shlib_base_name@.so.1
@multilib_dir@/@shlib_base_name@.so' \
|       SHLIB_MULTILIB=''; \
|       ccache gcc -c
-isystem/opt/oe/build/tmp/staging/i686-linux/include -Os -DIN_GCC
-DCROSS_COMPILE  -W -Wall -Wwrite-strings -Wstrict-prototypes
-Wmissing-prototypes -pedantic -Wno-long-long -Wno-variadic-macros
-Wold-style-definition -Wmissing-format-attribute    -DHAVE_CONFIG_H
-I. -I. -I/opt/oe/build/tmp/work/iwmmxt-angstrom-linux-gnueabi/gcc-cross-4.1.1-r6/gcc-4.1.1/gcc
-I/opt/oe/build/tmp/work/iwmmxt-angstrom-linux-gnueabi/gcc-cross-4.1.1-r6/gcc-4.1.1/gcc/.
-I/opt/oe/build/tmp/work/iwmmxt-angstrom-linux-gnueabi/gcc-cross-4.1.1-r6/gcc-4.1.1/gcc/../include
-I/opt/oe/build/tmp/work/iwmmxt-angstrom-linux-gnueabi/gcc-cross-4.1.1-r6/gcc-4.1.1/gcc/../libcpp/include
-I/opt/oe/build/tmp/staging/i686-linux/include
-isystem/opt/oe/build/tmp/staging/i686-linux/include
-DSTANDARD_STARTFILE_PREFIX=\"../../../\"
-DSTANDARD_EXEC_PREFIX=\"/opt/oe/build/tmp/cross/lib/gcc/\"
-DSTANDARD_LIBEXEC_PREFIX=\"/opt/oe/build/tmp/cross/libexec/gcc/\"
-DDEFAULT_TARGET_VERSION=\"4.1.1\"
-DDEFAULT_TARGET_MACHINE=\"arm-angstrom-linux-gnueabi\"
-DSTANDARD_BINDIR_PREFIX=\"/opt/oe/build/tmp/cross/bin/\"
-DTOOLDIR_BASE_PREFIX=\"../../../../\"  `test "X${SHLIB_LINK}" = "X"
|| test "yes" != "yes" || echo "-DENABLE_SHARED_LIBGCC"` `test
"X${SHLIB_MULTILIB}" = "X" || echo "-DNO_SHARED_LIBGCC_MULTILIB"` \
|               -I. -I.
-I/opt/oe/build/tmp/work/iwmmxt-angstrom-linux-gnueabi/gcc-cross-4.1.1-r6/gcc-4.1.1/gcc
-I/opt/oe/build/tmp/work/iwmmxt-angstrom-linux-gnueabi/gcc-cross-4.1.1-r6/gcc-4.1.1/gcc/.
-I/opt/oe/build/tmp/work/iwmmxt-angstrom-linux-gnueabi/gcc-cross-4.1.1-r6/gcc-4.1.1/gcc/../include
-I/opt/oe/build/tmp/work/iwmmxt-angstrom-linux-gnueabi/gcc-cross-4.1.1-r6/gcc-4.1.1/gcc/../libcpp/include
-I/opt/oe/build/tmp/staging/i686-linux/include
/opt/oe/build/tmp/work/iwmmxt-angstrom-linux-gnueabi/gcc-cross-4.1.1-r6/gcc-4.1.1/gcc/cp/g++spec.c)
| /opt/oe/build/tmp/cross/bin/arm-angstrom-linux-gnueabi-as:
unrecognized option `-Qy'
| make[2]: *** [g++spec.o] Error 1
| make[2]: Leaving directory
`/opt/oe/build/tmp/work/iwmmxt-angstrom-linux-gnueabi/gcc-cross-4.1.1-r6/gcc-4.1.1/build.i686-linux.arm-angstrom-linux-gnueabi/gcc'
| make[1]: *** [all-gcc] Error 2
| make[1]: Leaving directory
`/opt/oe/build/tmp/work/iwmmxt-angstrom-linux-gnueabi/gcc-cross-4.1.1-r6/gcc-4.1.1/build.i686-linux.arm-angstrom-linux-gnueabi'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed:
/opt/oe/build/tmp/work/iwmmxt-angstrom-linux-gnueabi/gcc-cross-4.1.1-r6/temp/log.do_compile.10499
NOTE: package gcc-cross-4.1.1-r6: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package gcc-cross-4.1.1: failed
ERROR: Build of gpe-image failed

thanks for your help.
Axel


