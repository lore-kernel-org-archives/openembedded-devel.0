Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GUxsA-0007TH-5q for openembedded-devel@lists.openembedded.org;
	Wed, 04 Oct 2006 05:56:43 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id ED2F1401B45; Tue,  3 Oct 2006 20:25:42 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20061004032542.ED2F1401B45@tinman.treke.net>
Date: Tue,  3 Oct 2006 20:25:42 -0700 (PDT)
Subject: [Bug 1449] New: package gcc-cross-4.1.1-r7: task do_compile: failed
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
X-List-Received-Date: Wed, 04 Oct 2006 03:56:43 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1449

           Summary: package gcc-cross-4.1.1-r7: task do_compile: failed
           Product: Openembedded
           Version: Angstrom
          Platform: ARM
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: axel.lin@gmail.com
         QAContact: tinderbox-oe@gmx.net


The setting is: mainstone / angstrom-2007.1
package gcc-cross-4.1.1-r7: task do_compile: failed

Error log:
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/build.i686-linux.arm-angstrom-linux-gnueabi/./gcc/xgcc
-B/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/build.i686-linux.arm-angstrom-linux-gnueabi/./gcc/
-B/opt/oe/build/tmp/cross/arm-angstrom-linux-gnueabi/bin/
-B/opt/oe/build/tmp/cross/arm-angstrom-linux-gnueabi/lib/ -isystem
/opt/oe/build/tmp/cross/arm-angstrom-linux-gnueabi/include -isystem
/opt/oe/build/tmp/cross/arm-angstrom-linux-gnueabi/sys-include -O2  -g -Os
-DIN_GCC -DCROSS_COMPILE   -W -Wall -Wwrite-strings -Wstrict-prototypes
-Wmissing-prototypes -Wold-style-definition  -isystem ./include  -fPIC -g
-DHAVE_GTHR_DEFAULT -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED -Dinhibit_libc -I.
-I.
-I/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/gcc
-I/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/gcc/.
-I/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/gcc/../include
-I/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/gcc/../libcpp/include
-I/opt/oe/build/tmp/staging/i686-linux/include -DSHARED -fexceptions -c
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/gcc/unwind-c.c
-o libgcc/./unwind-c_s.o
{ arm-angstrom-linux-gnueabi-nm -pg libgcc/./_udivsi3_s.o libgcc/./_divsi3_s.o
libgcc/./_umodsi3_s.o libgcc/./_modsi3_s.o libgcc/./_bb_init_func_s.o
libgcc/./_call_via_rX_s.o libgcc/./_interwork_call_via_rX_s.o
libgcc/./_lshrdi3_s.o libgcc/./_ashrdi3_s.o libgcc/./_ashldi3_s.o
libgcc/./_negdf2_s.o libgcc/./_addsubdf3_s.o libgcc/./_muldivdf3_s.o
libgcc/./_cmpdf2_s.o libgcc/./_unorddf2_s.o libgcc/./_fixdfsi_s.o
libgcc/./_fixunsdfsi_s.o libgcc/./_truncdfsf2_s.o libgcc/./_negsf2_s.o
libgcc/./_addsubsf3_s.o libgcc/./_muldivsf3_s.o libgcc/./_cmpsf2_s.o
libgcc/./_unordsf2_s.o libgcc/./_fixsfsi_s.o libgcc/./_fixunssfsi_s.o
libgcc/./_floatdidf_s.o libgcc/./_floatdisf_s.o libgcc/./_aeabi_lcmp_s.o
libgcc/./_aeabi_ulcmp_s.o libgcc/./_aeabi_ldivmod_s.o
libgcc/./_aeabi_uldivmod_s.o libgcc/./_dvmd_lnx_s.o libgcc/./_muldi3_s.o
libgcc/./_negdi2_s.o libgcc/./_cmpdi2_s.o libgcc/./_ucmpdi2_s.o
libgcc/./_fixunsdfdi_s.o libgcc/./_fixdfdi_s.o libgcc/./_fixunssfdi_s.o
libgcc/./_fixsfdi_s.o libgcc/./_fixxfdi_s.o libgcc/./_fixunsxfdi_s.o
libgcc/./_floatdixf_s.o libgcc/./_fixunsxfsi_s.o libgcc/./_fixtfdi_s.o
libgcc/./_fixunstfdi_s.o libgcc/./_floatditf_s.o libgcc/./_clear_cache_s.o
libgcc/./_enable_execute_stack_s.o libgcc/./_trampoline_s.o libgcc/./__main_s.o
libgcc/./_absvsi2_s.o libgcc/./_absvdi2_s.o libgcc/./_addvsi3_s.o
libgcc/./_addvdi3_s.o libgcc/./_subvsi3_s.o libgcc/./_subvdi3_s.o
libgcc/./_mulvsi3_s.o libgcc/./_mulvdi3_s.o libgcc/./_negvsi2_s.o
libgcc/./_negvdi2_s.o libgcc/./_ctors_s.o libgcc/./_ffssi2_s.o
libgcc/./_ffsdi2_s.o libgcc/./_clz_s.o libgcc/./_clzsi2_s.o
libgcc/./_clzdi2_s.o libgcc/./_ctzsi2_s.o libgcc/./_ctzdi2_s.o
libgcc/./_popcount_tab_s.o libgcc/./_popcountsi2_s.o libgcc/./_popcountdi2_s.o
libgcc/./_paritysi2_s.o libgcc/./_paritydi2_s.o libgcc/./_powisf2_s.o
libgcc/./_powidf2_s.o libgcc/./_powixf2_s.o libgcc/./_powitf2_s.o
libgcc/./_mulsc3_s.o libgcc/./_muldc3_s.o libgcc/./_mulxc3_s.o
libgcc/./_multc3_s.o libgcc/./_divsc3_s.o libgcc/./_divdc3_s.o
libgcc/./_divxc3_s.o libgcc/./_divtc3_s.o libgcc/./_divdi3_s.o
libgcc/./_moddi3_s.o libgcc/./_udivdi3_s.o libgcc/./_umoddi3_s.o
libgcc/./_udiv_w_sdiv_s.o libgcc/./_udivmoddi4_s.o libgcc/./bpabi_s.o
libgcc/./unaligned-funcs_s.o libgcc/./unwind-arm_s.o libgcc/./libunwind_s.o
libgcc/./pr-support_s.o libgcc/./unwind-c_s.o; echo %%; \
          cat
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/gcc/libgcc-std.ver
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/gcc/config/libgcc-glibc.ver
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/gcc/config/libgcc-glibc.ver
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/gcc/config/arm/libgcc-bpabi.ver
\
            | sed -e '/^[   ]*#/d' \
                  -e 's/^%\(if\|else\|elif\|endif\|define\)/#\1/' \
            |
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/build.i686-linux.arm-angstrom-linux-gnueabi/./gcc/xgcc
-B/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/build.i686-linux.arm-angstrom-linux-gnueabi/./gcc/
-B/opt/oe/build/tmp/cross/arm-angstrom-linux-gnueabi/bin/
-B/opt/oe/build/tmp/cross/arm-angstrom-linux-gnueabi/lib/ -isystem
/opt/oe/build/tmp/cross/arm-angstrom-linux-gnueabi/include -isystem
/opt/oe/build/tmp/cross/arm-angstrom-linux-gnueabi/sys-include -O2  -g -Os
-DIN_GCC -DCROSS_COMPILE   -W -Wall -Wwrite-strings -Wstrict-prototypes
-Wmissing-prototypes -Wold-style-definition  -isystem ./include  -fPIC -g
-DHAVE_GTHR_DEFAULT -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED -Dinhibit_libc -I.
-I.
-I/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/gcc
-I/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/gcc/.
-I/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/gcc/../include
-I/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/gcc/../libcpp/include
-I/opt/oe/build/tmp/staging/i686-linux/include  -E -xassembler-with-cpp -; \
        } | gawk -f
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/gcc/mkmap-symver.awk
 > libgcc/./tmp-libgcc.map
mv 'libgcc/./tmp-libgcc.map' libgcc/./libgcc.map
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/build.i686-linux.arm-angstrom-linux-gnueabi/./gcc/xgcc
-B/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/build.i686-linux.arm-angstrom-linux-gnueabi/./gcc/
-B/opt/oe/build/tmp/cross/arm-angstrom-linux-gnueabi/bin/
-B/opt/oe/build/tmp/cross/arm-angstrom-linux-gnueabi/lib/ -isystem
/opt/oe/build/tmp/cross/arm-angstrom-linux-gnueabi/include -isystem
/opt/oe/build/tmp/cross/arm-angstrom-linux-gnueabi/sys-include -O2  -g -Os
-DIN_GCC -DCROSS_COMPILE   -W -Wall -Wwrite-strings -Wstrict-prototypes
-Wmissing-prototypes -Wold-style-definition  -isystem ./include  -fPIC -g
-DHAVE_GTHR_DEFAULT -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED -Dinhibit_libc
-shared -nodefaultlibs -Wl,--soname=libgcc_s.so.1
-Wl,--version-script=libgcc/./libgcc.map -o ./libgcc_s.so.1.tmp 
libgcc/./_udivsi3_s.o libgcc/./_divsi3_s.o libgcc/./_umodsi3_s.o
libgcc/./_modsi3_s.o libgcc/./_bb_init_func_s.o libgcc/./_call_via_rX_s.o
libgcc/./_interwork_call_via_rX_s.o libgcc/./_lshrdi3_s.o libgcc/./_ashrdi3_s.o
libgcc/./_ashldi3_s.o libgcc/./_negdf2_s.o libgcc/./_addsubdf3_s.o
libgcc/./_muldivdf3_s.o libgcc/./_cmpdf2_s.o libgcc/./_unorddf2_s.o
libgcc/./_fixdfsi_s.o libgcc/./_fixunsdfsi_s.o libgcc/./_truncdfsf2_s.o
libgcc/./_negsf2_s.o libgcc/./_addsubsf3_s.o libgcc/./_muldivsf3_s.o
libgcc/./_cmpsf2_s.o libgcc/./_unordsf2_s.o libgcc/./_fixsfsi_s.o
libgcc/./_fixunssfsi_s.o libgcc/./_floatdidf_s.o libgcc/./_floatdisf_s.o
libgcc/./_aeabi_lcmp_s.o libgcc/./_aeabi_ulcmp_s.o libgcc/./_aeabi_ldivmod_s.o
libgcc/./_aeabi_uldivmod_s.o libgcc/./_dvmd_lnx_s.o libgcc/./_muldi3_s.o
libgcc/./_negdi2_s.o libgcc/./_cmpdi2_s.o libgcc/./_ucmpdi2_s.o
libgcc/./_fixunsdfdi_s.o libgcc/./_fixdfdi_s.o libgcc/./_fixunssfdi_s.o
libgcc/./_fixsfdi_s.o libgcc/./_fixxfdi_s.o libgcc/./_fixunsxfdi_s.o
libgcc/./_floatdixf_s.o libgcc/./_fixunsxfsi_s.o libgcc/./_fixtfdi_s.o
libgcc/./_fixunstfdi_s.o libgcc/./_floatditf_s.o libgcc/./_clear_cache_s.o
libgcc/./_enable_execute_stack_s.o libgcc/./_trampoline_s.o libgcc/./__main_s.o
libgcc/./_absvsi2_s.o libgcc/./_absvdi2_s.o libgcc/./_addvsi3_s.o
libgcc/./_addvdi3_s.o libgcc/./_subvsi3_s.o libgcc/./_subvdi3_s.o
libgcc/./_mulvsi3_s.o libgcc/./_mulvdi3_s.o libgcc/./_negvsi2_s.o
libgcc/./_negvdi2_s.o libgcc/./_ctors_s.o libgcc/./_ffssi2_s.o
libgcc/./_ffsdi2_s.o libgcc/./_clz_s.o libgcc/./_clzsi2_s.o
libgcc/./_clzdi2_s.o libgcc/./_ctzsi2_s.o libgcc/./_ctzdi2_s.o
libgcc/./_popcount_tab_s.o libgcc/./_popcountsi2_s.o libgcc/./_popcountdi2_s.o
libgcc/./_paritysi2_s.o libgcc/./_paritydi2_s.o libgcc/./_powisf2_s.o
libgcc/./_powidf2_s.o libgcc/./_powixf2_s.o libgcc/./_powitf2_s.o
libgcc/./_mulsc3_s.o libgcc/./_muldc3_s.o libgcc/./_mulxc3_s.o
libgcc/./_multc3_s.o libgcc/./_divsc3_s.o libgcc/./_divdc3_s.o
libgcc/./_divxc3_s.o libgcc/./_divtc3_s.o libgcc/./_divdi3_s.o
libgcc/./_moddi3_s.o libgcc/./_udivdi3_s.o libgcc/./_umoddi3_s.o
libgcc/./_udiv_w_sdiv_s.o libgcc/./_udivmoddi4_s.o libgcc/./bpabi_s.o
libgcc/./unaligned-funcs_s.o libgcc/./unwind-arm_s.o libgcc/./libunwind_s.o
libgcc/./pr-support_s.o libgcc/./unwind-c_s.o -lc && rm -f ./libgcc_s.so && if
[ -f ./libgcc_s.so.1 ]; then mv -f ./libgcc_s.so.1 ./libgcc_s.so.1.backup; else
true; fi && mv ./libgcc_s.so.1.tmp ./libgcc_s.so.1 && ln -s libgcc_s.so.1
./libgcc_s.so
make[3]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/build.i686-linux.arm-angstrom-linux-gnueabi/gcc'
echo timestamp > stmp-multilib
(SHLIB_LINK='/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/build.i686-linux.arm-angstrom-linux-gnueabi/./gcc/xgcc
-B/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/build.i686-linux.arm-angstrom-linux-gnueabi/./gcc/
-B/opt/oe/build/tmp/cross/arm-angstrom-linux-gnueabi/bin/
-B/opt/oe/build/tmp/cross/arm-angstrom-linux-gnueabi/lib/ -isystem
/opt/oe/build/tmp/cross/arm-angstrom-linux-gnueabi/include -isystem
/opt/oe/build/tmp/cross/arm-angstrom-linux-gnueabi/sys-include -O2  -g -Os
-DIN_GCC -DCROSS_COMPILE   -W -Wall -Wwrite-strings -Wstrict-prototypes
-Wmissing-prototypes -Wold-style-definition  -isystem ./include  -fPIC -g
-DHAVE_GTHR_DEFAULT -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED -Dinhibit_libc
-shared -nodefaultlibs -Wl,--soname=@shlib_base_name@.so.1
-Wl,--version-script=@shlib_map_file@ -o
@multilib_dir@/@shlib_base_name@.so.1.tmp @multilib_flags@ @shlib_objs@ -lc &&
rm -f @multilib_dir@/@shlib_base_name@.so && if [ -f
@multilib_dir@/@shlib_base_name@.so.1 ]; then mv -f
@multilib_dir@/@shlib_base_name@.so.1
@multilib_dir@/@shlib_base_name@.so.1.backup; else true; fi && mv
@multilib_dir@/@shlib_base_name@.so.1.tmp @multilib_dir@/@shlib_base_name@.so.1
&& ln -s @shlib_base_name@.so.1 @multilib_dir@/@shlib_base_name@.so' \
        SHLIB_MULTILIB=''; \
        ccache gcc -c   -isystem/opt/oe/build/tmp/staging/i686-linux/include
-Os -DIN_GCC -DCROSS_COMPILE  -W -Wall -Wwrite-strings -Wstrict-prototypes
-Wmissing-prototypes -pedantic -Wno-long-long -Wno-variadic-macros
-Wold-style-definition -Wmissing-format-attribute    -DHAVE_CONFIG_H -I. -I.
-I/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/gcc
-I/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/gcc/.
-I/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/gcc/../include
-I/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/gcc/../libcpp/include
-I/opt/oe/build/tmp/staging/i686-linux/include
-isystem/opt/oe/build/tmp/staging/i686-linux/include  
-DSTANDARD_STARTFILE_PREFIX=\"../../../\"
-DSTANDARD_EXEC_PREFIX=\"/opt/oe/build/tmp/cross/lib/gcc/\"
-DSTANDARD_LIBEXEC_PREFIX=\"/opt/oe/build/tmp/cross/libexec/gcc/\"
-DDEFAULT_TARGET_VERSION=\"4.1.1\"
-DDEFAULT_TARGET_MACHINE=\"arm-angstrom-linux-gnueabi\"
-DSTANDARD_BINDIR_PREFIX=\"/opt/oe/build/tmp/cross/bin/\"
-DTOOLDIR_BASE_PREFIX=\"../../../../\"  `test "X${SHLIB_LINK}" = "X" || test
"yes" != "yes" || echo "-DENABLE_SHARED_LIBGCC"` `test "X${SHLIB_MULTILIB}" =
"X" || echo "-DNO_SHARED_LIBGCC_MULTILIB"` \
                -I. -I.
-I/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/gcc
-I/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/gcc/.
-I/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/gcc/../include
-I/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/gcc/../libcpp/include
-I/opt/oe/build/tmp/staging/i686-linux/include
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/gcc/cp/g++spec.c)
/opt/oe/build/tmp/cross/bin/arm-angstrom-linux-gnueabi-as: unrecognized option
`-Qy'
make[2]: *** [g++spec.o] Error 1
make[2]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/build.i686-linux.arm-angstrom-linux-gnueabi/gcc'
make[1]: *** [all-gcc] Error 2
make[1]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/build.i686-linux.arm-angstrom-linux-gnueabi'
make: *** [all] Error 2
FATAL: oe_runmake failed


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


