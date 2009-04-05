Received: from [85.33.2.26] (helo=smtp-out26.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1LqXMv-0008St-5e
	for openembedded-devel@openembedded.org; Sun, 05 Apr 2009 20:47:22 +0200
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out26.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 5 Apr 2009 20:44:09 +0200
Received: from FBCMCL01B08.fbc.local ([192.168.171.46]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 5 Apr 2009 20:44:06 +0200
Received: from [192.168.1.107] ([79.17.29.155]) by FBCMCL01B08.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Sun, 5 Apr 2009 20:39:18 +0200
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@openembedded.org
Date: Sun, 05 Apr 2009 16:02:49 +0200
Message-Id: <1238940170.8935.87.camel@port4>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.4 
X-OriginalArrivalTime: 05 Apr 2009 18:39:19.0000 (UTC)
	FILETIME=[D45DE580:01C9B61D]
X-SA-Exim-Connect-IP: 85.33.2.26
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,DATE_IN_PAST_03_06,
	RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Boost 1.36.0 'improvements' and wesnoth 1.6a
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
X-List-Received-Date: Sun, 05 Apr 2009 18:47:29 -0000
X-Groupsio-MsgNum: 9114
Content-Type: multipart/mixed; boundary="=-nzIVZzXnKdh1kki4+KIQ"

--=-nzIVZzXnKdh1kki4+KIQ
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello,
I have:
*An improved but not commitable yet boost 1.36.0 recipe
*A wesnoth(1.6a) recipe that I'll commit when the improved boost recipe
hit the tree
What is for review here is the improved boost 1.36.0(I need it for the
new(as 1.6a) wesnoth recipe).
I send it for review because it's a dependency used by others
packages.(even if it's not the default I heard that this version was
needed for packages like GNU radio)

The Main problem is that the *new* wesnoth recipe doesn't work on arm <
armv6 that lack ldrex and strex instructions...that's a boost problem.
I've (cross)compiled boost and wesnoth for the bug device(armv6) and it
cross compiled fine with minor issues such as:
ERROR: QA Issue: No GNU_HASH in the elf binary for each boost library
and:
NOTE: Not creating empty archive for boost-1.36.0-r5
NOTE: Not creating empty archive for boost-doc-1.36.0-r5
NOTE: Not creating empty archive for boost-locale-1.36.0-r5
NOTE: Not creating empty archive for boost-graph-1.36.0-r5
This is because in the install dir there are no doc or locales files and
no graph library...
I should fix it.

The big problem is that I couldn't test it(my bug device had a defect
and will be replaced,it's replacement is coming soon)
But according to:
http://thread.gmane.org/gmane.comp.handhelds.openembedded/22228/focus=22369
Packages can be commited even if they are not tested(even in stable) but
they must compile fine...(I've tested every other package I commited but
here I'm in the impossibility to test it until my device arrive)

Here the explanation of the main problem:
Fisrt I'd like to say that it was there before and is not specific to
this boost version(boost 1.36.0)...for instance it was observed on boost
1.33.1 with the new wesnoth(the old compiles and runs fine)
The error is attached boost_error.txt
The Documentation is here:
http://gcc.gnu.org/onlinedocs/gcc-4.3.2/gcc/Atomic-Builtins.html
The important part is:
"Not all operations are supported by all target processors. If a
particular operation cannot be implemented on the target processor, a
warning will be generated and a call an external function will be
generated. The external function will carry the same name as the
builtin, with an additional suffix `_n' where n is the size of the data
type. "
So an external function must be written such as the one in the
arm-intrinsics.patch (attached)
The function written in the arm-intrinsics.patch only work for
architecture >= armv6
Question:
According to the manual(14128.pdf : ARM Architecture Reference Manual)
the ldrex and strex function are avaliable since ARMv6 and here there
is: 
+#if __ARM_ARCH_7A__
which doesn't work for my bug device because it's an armv6 so can
will the fact of changing it to:
+#ifdef __ARM_ARCH_6J__
break arm > v6
(or is there something defined like __HAVE_LDREX__? )

Then I tried something for not having to write the function:
*echo '#define BOOST_SP_USE_PTHREADS' >> ${S}/boost/config/user.hpp
in the recipe
that added it to the user.hpp file but there still was the same
compilation error
There was also -DBOOST_SP_USE_PTHREADS defined in the original recipe:
echo 'using gcc : 4.3.1 : ${CXX} : compileflags -DBOOST_SP_USE_PTHREADS
-I${includedir} linkflags -L${libdir} ;' >>
${S}/tools/build/v2/user-config.jam

none of them worked.

Before that I was told to steal the function somewhere but I didn't find
it in GCC nor looked deeply at the possible licensing issues


So the last option remaining is to write this function...
On IRC woglinde pointed me to that article:
http://lwn.net/Articles/314235/
The interresting part is at Posted Jan 12, 2009 19:58 UTC (Mon) by
npitre (subscriber, #5680)
But there are things that I didn't understand yet(but I understood the
bare assembly part) such as:
what is r0 in:
subs r3, r3, r0 @ compare with oldval
what is #TASK_SIZE ?
why is r3 assigned to 0xffff0fff in : 
mov r3, #0xffff0fff ?
what is add 0xffff0fc0 - 0xffff0fff in :
add pc, r3, #(0xffff0fc0 - 0xffff0fff)

So I won't use,modify and commit what I dont' understand...it could have
disastrous results...who knows...

PS: I've a stupid question:
what's the simpliest way to put a default preference = "-1" only to
certain arm arch such as:
armv4 armv4t armv5te
DEFAULT_PREFERENCE_armv4 = "-1" 
DEFAULT_PREFERENCE_armv4t = "-1"
DEFAULT_PREFERENCE_armv5te = "-1"
?

I'll attach the git diff

Denis.


--=-nzIVZzXnKdh1kki4+KIQ
Content-Disposition: attachment; filename="boost_error.txt"
Content-Type: text/plain; name="boost_error.txt"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

| [ 97%] Building CXX object src/CMakeFiles/wesnoth.dir/editor2/mouse_action.o
| Linking CXX executable ../wesnoth
| CMakeFiles/wesnoth.dir/formula_ai.o: In function `boost::exception_detail::exception_clone<boost::exception_detail::error_info_injector<boost::bad_lexical_cast> >::release() const':
| 
formula_ai.cpp:(.text._ZNK5boost16exception_detail15exception_cloneINS0_19error_info_injectorINS_16bad_lexical_castEEEE7releaseEv[boost::exception_detail::exception_clone<boost::exception_detail::error_info_injector<boost::bad_lexical_cast> 
>::release() const]+0x18): undefined reference to `__sync_add_and_fetch_4'
| CMakeFiles/wesnoth.dir/formula_ai.o: In function `boost::exception_detail::exception_clone<boost::exception_detail::error_info_injector<boost::bad_lexical_cast> >::add_ref() const':
| 
formula_ai.cpp:(.text._ZNK5boost16exception_detail15exception_cloneINS0_19error_info_injectorINS_16bad_lexical_castEEEE7add_refEv[boost::exception_detail::exception_clone<boost::exception_detail::error_info_injector<boost::bad_lexical_cast> 
>::add_ref() const]+0x18): undefined reference to `__sync_add_and_fetch_4'
| CMakeFiles/wesnoth.dir/gui/dialogs/editor_settings.o: In function `boost::exception_detail::exception_clone<boost::exception_detail::error_info_injector<boost::bad_function_call> >::release() const':
| 
editor_settings.cpp:(.text._ZNK5boost16exception_detail15exception_cloneINS0_19error_info_injectorINS_17bad_function_callEEEE7releaseEv[boost::exception_detail::exception_clone<boost::exception_detail::error_info_injector<boost::bad_function_call> 
>::release() const]+0x18): undefined reference to `__sync_add_and_fetch_4'
| CMakeFiles/wesnoth.dir/gui/dialogs/editor_settings.o: In function `boost::exception_detail::exception_clone<boost::exception_detail::error_info_injector<boost::bad_function_call> >::add_ref() const':
| 
editor_settings.cpp:(.text._ZNK5boost16exception_detail15exception_cloneINS0_19error_info_injectorINS_17bad_function_callEEEE7add_refEv[boost::exception_detail::exception_clone<boost::exception_detail::error_info_injector<boost::bad_function_call> 
>::add_ref() const]+0x18): undefined reference to `__sync_add_and_fetch_4'
| collect2: ld returned 1 exit status
| make[2]: *** [wesnoth] Error 1
| make[1]: *** [src/CMakeFiles/wesnoth.dir/all] Error 2
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed: /home/embedded/oetmp_openmoko/work/armv4t-angstrom-linux-gnueabi/wesnoth-1.6a-r0/temp/log.do_compile.19287
NOTE: package wesnoth-1.6a-r0: task do_compile: failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/embedded/oe/local_recipes/recipes/westnoth/wesnoth_1.6a.bb do_compile failed
ERROR: Task 7 (/home/embedded/oe/local_recipes/recipes/westnoth/wesnoth_1.6a.bb, do_compile) failed
NOTE: Tasks Summary: Attempted 772 tasks of which 771 didn't need to be rerun and 1 failed.
ERROR: '/home/embedded/oe/local_recipes/recipes/westnoth/wesnoth_1.6a.bb' failed
NOTE: build 200903281458: completed


--=-nzIVZzXnKdh1kki4+KIQ
Content-Disposition: attachment; filename="arm-intrinsics.patch"
Content-Type: text/x-patch; name="arm-intrinsics.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

diff -Nurd boost_1_36_0.orig/boost/detail/atomic_count_sync.hpp boost_1_36_0.arm/boost/detail/atomic_count_sync.hpp
--- boost_1_36_0.orig/boost/detail/atomic_count_sync.hpp	2007-11-23 12:03:14.000000000 -0500
+++ boost_1_36_0.arm/boost/detail/atomic_count_sync.hpp	2008-09-09 13:15:21.000000000 -0400
@@ -29,17 +29,46 @@
 
     void operator++()
     {
+#ifdef __ARM_ARCH_6J__
+       int v1, tmp;
+       asm volatile ("1:                 \n\t"
+                     "ldrex   %0, %1     \n\t"
+                     "add     %0 ,%0, #1 \n\t"
+                     "strex   %2, %0, %1 \n\t"
+                     "cmp     %2, #0     \n\t"
+                     "bne     1b         \n\t"
+                     : "=&r" (v1), "+Q"(value_), "=&r"(tmp)
+                    );
+#else
         __sync_add_and_fetch( &value_, 1 );
+#endif
     }
 
     long operator--()
     {
+#ifdef __ARM_ARCH_6J__
+       int v1, tmp;
+       asm volatile ("1:                 \n\t"
+                     "ldrex   %0, %1     \n\t"
+                     "sub     %0 ,%0, #1 \n\t"
+                     "strex   %2, %0, %1 \n\t"
+                     "cmp     %2, #0     \n\t"
+                     "bne     1b         \n\t"
+                     : "=&r" (v1), "+Q"(value_), "=&r"(tmp)
+                    );
+       return value_;
+#else
         return __sync_add_and_fetch( &value_, -1 );
+#endif
     }
 
     operator long() const
     {
+#if __ARM_ARCH_6J__
+        return value_;
+#else
         return __sync_fetch_and_add( &value_, 0 );
+#endif
     }
 
 private:
Binary files boost_1_36_0.orig/boost/detail/.atomic_count_sync.hpp.swp and boost_1_36_0.arm/boost/detail/.atomic_count_sync.hpp.swp differ

--=-nzIVZzXnKdh1kki4+KIQ
Content-Disposition: attachment; filename="boost_1.36.0.diff"
Content-Type: text/x-patch; name="boost_1.36.0.diff"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

diff --git a/recipes/boost/boost-36.inc b/recipes/boost/boost-36.inc
index 5a4faaf..f7ed0d3 100644
--- a/recipes/boost/boost-36.inc
+++ b/recipes/boost/boost-36.inc
@@ -9,126 +9,38 @@ SECTION = "libs"
 DEPENDS = "boost-jam-native zlib"
 PRIORITY = "optional"
 LICENSE = "Boost Software License"
-PR = "r3"
 
-ARM_INSTRUCTION_SET = "arm"
+#ARM_INSTRUCTION_SET = "arm" # we can now (cross)compile it with thumb support thanks to one of the patches
 BOOST_VER = "${@"_".join(bb.data.getVar("PV",d,1).split("."))}"
 BOOST_MAJ = "${@"_".join(bb.data.getVar("PV",d,1).split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
-BOOST_LIBS = "\
-	date_time \
-	filesystem \
-	graph \
-	iostreams \
-	program_options \
-	regex \
-	signals \
-	system \
-	test \
-	thread \
-	"
-
-# FIXME: for some reason this fails on powerpc
-#BOOST_LIBS += "serialization"
-
-# To enable python, uncomment the following:
-#BOOST_LIBS += "python"
-#DEPENDS += "python"
-#PYTHON_ROOT = "${STAGING_DIR_HOST}/${layout_prefix}"
-#PYTHON_VERSION = "2.5"
-
 S = "${WORKDIR}/${BOOST_P}"
 
-# Make a package for each library, plus -dev
-PACKAGES = "${PN}-dbg ${BOOST_PACKAGES}"
-python __anonymous () {
-	import bb
-
-	packages = []
-	extras = [] 
-	for lib in bb.data.getVar('BOOST_LIBS', d, 1).split( ):
-		pkg = "boost-%s" % lib.replace("_", "-")
-		extras.append("--with-%s" % lib)
-		packages.append(pkg)
-		if not bb.data.getVar("FILES_%s" % pkg, d, 1):
-			bb.data.setVar("FILES_%s" % pkg, "${libdir}/libboost_%s*.so*" % lib, d)
-	bb.data.setVar("BOOST_PACKAGES", " ".join(packages), d)
-	bb.data.setVar("BJAM_EXTRA", " ".join(extras), d)
-}
-
-# Override the contents of specific packages
-FILES_boost-serialization = "${libdir}/libboost_serialization*.so* \
-	${libdir}/libboost_wserialization*.so*"
-FILES_boost-test = "${libdir}/libboost_prg_exec_monitor*.so \
-	${libdir}/libboost_unit_test_framework*.so*"
-
-# -dev last to pick up the remaining stuff
-PACKAGES += "${PN}-dev"
-FILES_${PN}-dev = "${includedir} ${libdir}/libboost_*.so ${libdir}/libboost_*.a"
-
-# "boost" is a metapackage which pulls in all boost librabries
-PACKAGES += "${PN}"
-RRECOMMENDS_${PN} += "${BOOST_PACKAGES}"
-
-# to avoid GNU_HASH QA errors added LDFLAGS to ARCH; a little bit dirty but at least it works
-TARGET_CC_ARCH += " ${LDFLAGS}" 
-
-# Oh yippee, a new build system, it's sooo cooool I could eat my own
-# foot.  inlining=on lets the compiler choose, I think.  At least this
-# stuff is documented...
-# NOTE: if you leave <debug-symbols>on then in a debug build the build sys
-# objcopy will be invoked, and that won't work.  Building debug apparently
-# requires hacking gcc-tools.jam
-#
-# Sometimes I wake up screaming.  Famous figures are gathered in the nightmare,
-# Steve Bourne, Larry Wall, the whole of the ANSI C committee.  They're just
-# standing there, waiting, but the truely terrifying thing is what they carry
-# in their hands.  At first sight each seems to bear the same thing, but it is
-# not so for the forms in their grasp are ever so slightly different one from
-# the other.  Each is twisted in some grotesque way from the other to make each
-# an unspeakable perversion impossible to perceive without the onset of madness.
-# True insanity awaits anyone who perceives all of these horrors together.
-#
-# Quotation marks, there might be an easier way to do this, but I can't find
-# it.  The problem is that the user.hpp configuration file must receive a
-# pre-processor macro defined as the appropriate string - complete with "'s
-# around it.  (<> is a possibility here but the danger to that is that the
-# failure case interprets the < and > as shell redirections, creating
-# random files in the source tree.)
-#
-#bjam: '-DBOOST_PLATFORM_CONFIG=\"config\"'
-#do_compile: '-sGCC=... '"'-DBOOST_PLATFORM_CONFIG=\"config\"'"
-SQD = '"'
-EQD = '\"'
-#boost.bb:   "...  '-sGCC=... '${SQD}'-DBOOST_PLATFORM_CONFIG=${EQD}config${EQD}'${SQD} ..."
-BJAM_CONF = "${SQD}'-DBOOST_PLATFORM_CONFIG=${EQD}boost/config/platform/${TARGET_OS}.hpp${EQD}'${SQD}"
-
-# bzip2 and zip are disabled because... they're broken - the compilation simply
-# isn't working with bjam.  I guess they will fix it, but who needs it?  This
-# only affects the (new in 33) iostream library.
-BJAM_TOOLS   = "-sTOOLS=gcc \
-		'-sGCC=${CC} '${BJAM_CONF} \
-		'-sGXX=${CXX} '${BJAM_CONF} \
-		'-sGCC_INCLUDE_DIRECTORY=${STAGING_INCDIR}' \
-		'-sGCC_STDLIB_DIRECTORY=${STAGING_LIBDIR}' \
-		'-sNO_BZIP2=1' \
-		'-sNO_ZLIB=1' \
-		'-sBUILD=release <optimization>space <inlining>on <debug-symbols>off' \
-		'-sPYTHON_VERSION=${PYTHON_VERSION}' \
-		'--layout=system' \
+DEFAULT_PREFERENCE_armv4 = "-1" 
+DEFAULT_PREFERENCE_armv4t = "-1"
+DEFAULT_PREFERENCE_armv5te = "-1"
+
+#removing -sNO_BZIP2=1 is untested
+#we build zip for wesnoth(all versions)
+BJAM_TOOLS   = "toolset=gcc \
+		--prefix=${prefix} \
+		--exec-prefix=${prefix} \
+		-sNO_BZIP2=1 \
+		release optimization=space \
+		--layout=system \
 		"
 
-BJAM_OPTS    = '${BJAM_TOOLS} \
+BJAM_OPTS    = "${BJAM_TOOLS} \
 		--builddir=${S}/${TARGET_SYS} \
-		--with-python-root=${PYTHON_ROOT} \
-		${BJAM_EXTRA}'
+		${BJAM_EXTRA}"
 
 
 do_configure_prepend() {
 	cp -f boost/config/platform/linux.hpp boost/config/platform/linux-gnueabi.hpp
 
-	echo 'using gcc : 4.3.1 : ${CXX} : compileflags -DBOOST_SP_USE_PTHREADS -I${includedir} linkflags -L${libdir} ;' >> ${S}/tools/build/v2/user-config.jam
+	echo 'using gcc : 4.3.1 : ${CXX} : compileflags -I${includedir} linkflags -L${libdir} ;' >> ${S}/tools/build/v2/user-config.jam
+#	echo '#define BOOST_SP_USE_PTHREADS' >> ${S}/boost/config/user.hpp #this trick should have fixed the __sync_add_and_fetch_4  on arm <v6(has ldrex+strex) but it didn't
 }
 
 do_compile() {
@@ -154,3 +66,50 @@ do_install() {
 		--includedir=${D}${includedir} \
 		install
 }
+
+BOOST_LIBS = "\
+        date_time \
+        filesystem \
+        graph \
+        iostreams \
+        program_options \
+        regex \
+        signals \
+        system \
+        test \
+        thread \
+        math \
+	"
+											
+python populate_packages_prepend() {
+        packages = []
+        extras = []
+        for lib in bb.data.getVar('BOOST_LIBS', d, 1).split( ):
+		pkg = "boost-%s" % lib.replace("_", "-")
+                extras.append("--with-%s" % lib)
+                packages.append(pkg)
+                if not bb.data.getVar("FILES_%s" % pkg, d, 1):
+		        bb.data.setVar("BOOST_PACKAGES", " ".join(packages), d)
+#		        bb.data.setVar("BJAM_EXTRA", " ".join(extras), d)
+			bb.data.setVar("FILES_%s" % pkg, "${libdir}/libboost_%s*.so*" % lib, d)
+		tmpvar = bb.data.getVar("FILES_%s" % pkg, d, 1)
+
+}
+
+
+
+PACKAGES += " ${BOOST_PACKAGES}"
+FILES_${PN}-dev = "\
+  ${includedir} \
+  ${libdir}/libboost_*.a \
+  "
+
+# Override the contents of specific packages
+FILES_boost-serialization = "${libdir}/libboost_serialization*.so* \
+  ${libdir}/libboost_wserialization*.so*"
+
+FILES_boost-test = "${libdir}/libboost_prg_exec_monitor*.so \
+  ${libdir}/libboost_unit_test_framework*.so*"
+
+# "boost" is a metapackage which pulls in all boost librabries
+RRECOMMENDS_${PN} += "${BOOST_PACKAGES}"
diff --git a/recipes/boost/boost_1.36.0.bb b/recipes/boost/boost_1.36.0.bb
index 140ab29..0675ec4 100644
--- a/recipes/boost/boost_1.36.0.bb
+++ b/recipes/boost/boost_1.36.0.bb
@@ -1,12 +1,20 @@
 include boost-36.inc
 
-PR = "r6"
+PR = "r5"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/boost/${BOOST_P}.tar.bz2 \
            file://arm-intrinsics.patch;patch=1 \
-          "
+           file://no-long-double-math.patch;patch=1 \
+	   file://math_tools_config.patch;patch=1 \
+           file://add-disable-long-double.patch;patch=1 \
+	   file://spinlock-no-swp-thumb.patch;patch=1 \
+	   "
 
-BJAM_OPTS    = '${BJAM_TOOLS} \
+BJAM_OPTS    = "${BJAM_TOOLS} \
                 --builddir=${S}/${TARGET_SYS} \
-                ${BJAM_EXTRA}'
-
+		--disable-long-double \
+		--without-serialization \
+		--without-python \
+		--without-graph \
+		--without-wave \
+                ${BJAM_EXTRA}"
diff --git a/recipes/boost/files/add-disable-long-double.patch b/recipes/boost/files/add-disable-long-double.patch
new file mode 100644
index 0000000..d0e8f72
--- /dev/null
+++ b/recipes/boost/files/add-disable-long-double.patch
@@ -0,0 +1,61 @@
+Add option --disable-long-double to Boost build procedure.
+Specifying this option essentially allows us to ignore
+a build failure.
+
+c.f. http://lists.boost.org/boost-build/2008/11/20683.php
+
+
+--- boost1.36-1.36.0.orig/libs/math/build/Jamfile.v2
++++ boost1.36-1.36.0/libs/math/build/Jamfile.v2
+@@ -51,7 +51,18 @@
+ sph_neumann
+ ;
+ 
+-compile has_long_double_support.cpp ;
++if --disable-long-double in [ modules.peek : ARGV ]
++{
++    build-long-double = false ;
++}
++else
++{
++    build-long-double = true ;
++    compile has_long_double_support.cpp ;
++}
++
++ECHO "Build long double: " $(build-long-double) ;
++
+ 
+ lib boost_math_tr1 : ../src/tr1/$(TR1_SOURCES).cpp
+     :         
+@@ -63,11 +74,15 @@
+  	     <link>shared:<define>BOOST_MATH_TR1_DYN_LINK=1
+    ;
+ 
++if $(build-long-double) = true
++{
++echo "BUILDING MATH_TR1 LONG" ;
+ lib boost_math_tr1l : ../src/tr1/$(TR1_SOURCES)l.cpp
+     :         
+  	     <link>shared:<define>BOOST_MATH_TR1_DYN_LINK=1
+  	     <dependency>has_long_double_support
+    ;
++}
+ 
+ lib boost_math_c99 : ../src/tr1/$(C99_SOURCES).cpp
+     :         
+@@ -79,11 +94,15 @@
+  	     <link>shared:<define>BOOST_MATH_TR1_DYN_LINK=1
+    ;
+ 
++if $(build-long-double) = true
++{
++echo "BUILDING MATH_C99 LONG" ;
+ lib boost_math_c99l : ../src/tr1/$(C99_SOURCES)l.cpp
+     :         
+  	     <link>shared:<define>BOOST_MATH_TR1_DYN_LINK=1
+  	     <dependency>has_long_double_support
+    ;
++}
+ 
+ 
+ boost-install boost_math_c99 boost_math_c99f boost_math_c99l boost_math_tr1 boost_math_tr1f boost_math_tr1l ;
diff --git a/recipes/boost/files/arm-intrinsics.patch b/recipes/boost/files/arm-intrinsics.patch
index 860b6df..cc8c3ed 100644
--- a/recipes/boost/files/arm-intrinsics.patch
+++ b/recipes/boost/files/arm-intrinsics.patch
@@ -5,7 +5,7 @@ diff -Nurd boost_1_36_0.orig/boost/detail/atomic_count_sync.hpp boost_1_36_0.arm
  
      void operator++()
      {
-+#ifdef __ARM_ARCH_7A__
++#ifdef __ARM_ARCH_6J__
 +       int v1, tmp;
 +       asm volatile ("1:                 \n\t"
 +                     "ldrex   %0, %1     \n\t"
@@ -22,7 +22,7 @@ diff -Nurd boost_1_36_0.orig/boost/detail/atomic_count_sync.hpp boost_1_36_0.arm
  
      long operator--()
      {
-+#ifdef __ARM_ARCH_7A__
++#ifdef __ARM_ARCH_6J__
 +       int v1, tmp;
 +       asm volatile ("1:                 \n\t"
 +                     "ldrex   %0, %1     \n\t"
@@ -40,7 +40,7 @@ diff -Nurd boost_1_36_0.orig/boost/detail/atomic_count_sync.hpp boost_1_36_0.arm
  
      operator long() const
      {
-+#if __ARM_ARCH_7A__
++#if __ARM_ARCH_6J__
 +        return value_;
 +#else
          return __sync_fetch_and_add( &value_, 0 );
diff --git a/recipes/boost/files/math_tools_config.patch b/recipes/boost/files/math_tools_config.patch
new file mode 100644
index 0000000..1ce8481
--- /dev/null
+++ b/recipes/boost/files/math_tools_config.patch
@@ -0,0 +1,11 @@
+--- boost1.36-1.36.0.orig/boost/math/tools/config.hpp
++++ boost1.36-1.36.0/boost/math/tools/config.hpp
+@@ -23,7 +23,7 @@
+ #include <boost/math/tools/user.hpp>
+ #include <boost/math/special_functions/detail/round_fwd.hpp>
+
+-#if defined(__CYGWIN__) || defined(__FreeBSD__) || defined(__hppa)
++#if defined(__CYGWIN__) || defined(__FreeBSD__) || defined(__arm__) || defined(__armel__) || defined(__hppa) || defined(__mips__) || defined(__mipsel__)
+ #  define BOOST_MATH_NO_LONG_DOUBLE_MATH_FUNCTIONS
+ #endif
+ #if BOOST_WORKAROUND(__BORLANDC__, BOOST_TESTED_AT(0x582))
diff --git a/recipes/boost/files/no-long-double-math.patch b/recipes/boost/files/no-long-double-math.patch
new file mode 100644
index 0000000..01dc8c5
--- /dev/null
+++ b/recipes/boost/files/no-long-double-math.patch
@@ -0,0 +1,20 @@
+Index: boost_1_36_0/boost/math/special_functions/log1p.hpp
+===================================================================
+--- boost_1_36_0.orig/boost/math/special_functions/log1p.hpp
++++ boost_1_36_0/boost/math/special_functions/log1p.hpp
+@@ -330,6 +330,7 @@ inline float log1p(float x, const Policy
+          "log1p<%1%>(%1%)", 0, pol);
+    return ::log1pf(x); 
+ }
++#ifndef BOOST_MATH_NO_LONG_DOUBLE_MATH_FUNCTIONS
+ template <class Policy>
+ inline long double log1p(long double x, const Policy& pol)
+ { 
+@@ -341,6 +342,7 @@ inline long double log1p(long double x, 
+          "log1p<%1%>(%1%)", 0, pol);
+    return ::log1pl(x); 
+ }
++#endif
+ #else
+ template <class Policy>
+ inline float log1p(float x, const Policy& pol)
diff --git a/recipes/boost/files/spinlock-no-swp-thumb.patch b/recipes/boost/files/spinlock-no-swp-thumb.patch
new file mode 100644
index 0000000..31ec4bd
--- /dev/null
+++ b/recipes/boost/files/spinlock-no-swp-thumb.patch
@@ -0,0 +1,16 @@
+Index: boost_1_36_0/boost/detail/spinlock.hpp
+===================================================================
+--- boost_1_36_0.orig/boost/detail/spinlock.hpp
++++ boost_1_36_0/boost/detail/spinlock.hpp
+@@ -30,9 +30,9 @@
+ 
+ #include <boost/config.hpp>
+ 
+-#if defined(__GNUC__) && defined( __arm__ )
++#if defined(__GNUC__) && defined( __arm__ ) && !defined( __thumb__ ) 
+ #  include <boost/detail/spinlock_gcc_arm.hpp>
+-#elif defined(__GNUC__) && ( __GNUC__ * 100 + __GNUC_MINOR__ >= 401 )
++#elif defined(__GNUC__) && ( __GNUC__ * 100 + __GNUC_MINOR__ >= 401 ) && !defined( __arm__ ) 
+ #  include <boost/detail/spinlock_sync.hpp>
+ #elif defined(WIN32) || defined(_WIN32) || defined(__WIN32__) || defined(__CYGWIN__)
+ #  include <boost/detail/spinlock_w32.hpp>


--=-nzIVZzXnKdh1kki4+KIQ--
