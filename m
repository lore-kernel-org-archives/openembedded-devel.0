Received: from moutng.kundenserver.de ([212.227.17.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eng1@koblersystems.de>) id 1Q3DnL-0004Yd-Ga
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Mar 2011 21:39:43 +0100
Received: from mars.fritz.box (p57B40C33.dip0.t-ipconnect.de [87.180.12.51])
	by mrelayeu.kundenserver.de (node=mrbap4) with ESMTP (Nemesis)
	id 0Lwqt6-1PwLwH0zrk-016N1f; Fri, 25 Mar 2011 21:32:41 +0100
From: Jan Kobler <eng1@koblersystems.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Mar 2011 21:32:37 +0100
Message-Id: <1301085157-6980-1-git-send-email-eng1@koblersystems.de>
X-Mailer: git-send-email 1.7.3.4
X-Provags-ID: V02:K0:JEjCmT3tGw1RuQBJanT1My3IC16psZCQokRgV2EEiDV
	IyEWucEMAg+ViUK9fNIgqhp9qgRMkvaEFgZupLhGX0u6EyD/nM
	LU/uHBT78cateBRzNAXtMaSdDzV3kU2hAaDUMs+gE3I0LH45Yu
	I8FCHZlZhysQdeYL0zeRB8clfFvz4tc+Yds5GXA4nAOA6jxw9y
	gtUGjAag7zMZUK8LzUEGA==
Subject: [PATCH] gphoto2: search libdir in sysroot
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
X-List-Received-Date: Fri, 25 Mar 2011 20:39:43 -0000

In the configuration file of gphoto2 the wrong libdir was searched for popt_libdir. The libdir should be searched in the sysroot folder, if sysroot is not empty.

This is a fix for this kind of error message:

| powerpc-angstrom-linux-libtool: link: powerpc-angstrom-linux-gcc -mcpu=e300c3 --sysroot=/my_openembedded/tmp/sysroots/ppce300c3-angstrom-linux -I..
-I../gphoto2 -DLOCALEDIR=\"/usr/share/locale\" -Wall -Wmissing-declarations -Wmissing-prototypes -g -D_GPHOTO2_INTERNAL_CODE
-I/my_openembedded/tmp/sysroots/ppce300c3-angstrom-linux/my_openembedded/tmp/sysroots/ppce300c3-angstrom-linux/usr/include/gphoto2
-I/my_openembedded/tmp/sysroots/ppce300c3-angstrom-linux/usr/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -Wl,-O1
-Wl,--hash-style=gnu -Wall -g -Wl,-O1 -Wl,--hash-style=gnu -o gphoto2 gphoto2-actions.o gphoto2-foreach.o gphoto2-gp-params.o gphoto2-spawnve.o gphoto2-main.o
gphoto2-version.o gphoto2-range.o gphoto2-shell.o  /my_openembedded/tmp/sysroots/ppce300c3-angstrom-linux/usr/lib/libjpeg.so -lreadline
/usr/lib64/libgphoto2.so -L/usr/lib64 /usr/lib64/libgphoto2_port.so /usr/lib64/libltdl.so -ldl -lpthread /usr/lib64/libexif.so -lm /usr/lib64/libusb.so
/usr/lib64/libpopt.so -Wl,-rpath -Wl,/usr/lib
| /my_openembedded/tmp/sysroots/x86_64-linux/usr/ppce300c3/lib/gcc/powerpc-angstrom-linux/4.5.3/../../../../powerpc-angstrom-linux/bin/ld: skipping
incompatible /usr/lib64/libreadline.so when searching for -lreadline
| /my_openembedded/tmp/sysroots/x86_64-linux/usr/ppce300c3/lib/gcc/powerpc-angstrom-linux/4.5.3/../../../../powerpc-angstrom-linux/bin/ld: skipping
incompatible /usr/lib64/libreadline.a when searching for -lreadline
| /usr/lib64/libgphoto2.so: could not read symbols: File in wrong format
| collect2: ld returned 1 exit status
| make[2]: *** [gphoto2] Error 1
| make[2]: Leaving directory `/my_openembedded/tmp/work/ppce300c3-angstrom-linux/gphoto2-2.4.8-r0/gphoto2-2.4.8/gphoto2'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/my_openembedded/tmp/work/ppce300c3-angstrom-linux/gphoto2-2.4.8-r0/gphoto2-2.4.8'
| make: *** [all] Error 2

NOTE: package gphoto2-2.4.8-r0: task do_compile: Failed
ERROR: Function 'do_compile' failed (see /my_openembedded/tmp/work/ppce300c3-angstrom-linux/gphoto2-2.4.8-r0/temp/log.do_compile.20262 for further
information)
ERROR: Task 6 (/my_openembedded/openembedded/recipes/gphoto2/gphoto2_2.4.8.bb, do_compile) failed with exit code '1'
ERROR: '/my_openembedded/openembedded/recipes/gphoto2/gphoto2_2.4.8.bb' failed

There is no lib64 in /my_openembedded/tmp/sysroots/ppce300c3-angstrom-linux. The configure script is testing the wrong folder /usr/lib64.

Instead of

elif test -d "${popt_libdir}"; then

the test should be

elif test -d "${lt_sysroot}/${popt_libdir}"; then

Because ${lt_sysroot} may be also an empty string, it is important to test it and define a new variable ${popt_sysroot} accordingly.

Because there is already a patch file "recipes/gphoto2/files/gphoto-popt-fixup.patch", I am providing a patch for this patch file.

After "bitbake -c configure gphoto2" the changed part of the file "/my_openembedded/tmp/work/ppce300c3-angstrom-linux/gphoto2-2.4.8-r0/gphoto2-2.4.8/configure" is

	# try to find options to link against popt
	LDFLAGS_save="$LDFLAGS"
	popt_links=no
	popt_sysroot=""
	if test "x${lt_sysroot}" != x; then
		popt_sysroot="${lt_sysroot}/"
	fi
	for popt_prefix in /usr "" /usr/local; do
		# We could have "/usr" and "lib64" at the beginning of the
		# lists. Then the first tested location would
		# incidentally be the right one on 64bit systems, and
		# thus work around a bug in libtool on 32bit systems:
		#
		# 32bit libtool doesn't know about 64bit systems, and so the
		# compilation will fail when linking a 32bit library from
		# /usr/lib to a 64bit binary.
		#
		# This hack has been confirmed to workwith a
		# 32bit Debian Sarge and 64bit Fedora Core 3 system.
		for ldir in lib64 "" lib; do
			popt_libdir="${popt_prefix}/${ldir}"
			if test "${popt_libdir}" = "/"; then
				popt_libdir=""
			elif test -d "${popt_sysroot}${popt_libdir}"; then
				LDFLAGS="-L${popt_libdir} ${LDFLAGS_save}"
			else
				continue
			fi
			# Avoid caching of results
			ac_cv_lib_popt_poptStuffArgs=""
			unset ac_cv_lib_popt_poptStuffArgs
			{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for poptStuffArgs in -lpopt" >&5


Signed-off-by: Jan Kobler <eng1@koblersystems.de>
---
 recipes/gphoto2/files/gphoto-popt-fixup.patch |   17 +++++++++++++++--
 1 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/recipes/gphoto2/files/gphoto-popt-fixup.patch b/recipes/gphoto2/files/gphoto-popt-fixup.patch
index 66b6168..61a4216 100644
--- a/recipes/gphoto2/files/gphoto-popt-fixup.patch
+++ b/recipes/gphoto2/files/gphoto-popt-fixup.patch
@@ -11,11 +11,24 @@ Index: gphoto2-2.4.2/m4m/gp-check-popt.m4
 		else
 			continue
 		fi
-@@ -113,7 +113,7 @@
+@@ -96,6 +96,10 @@
+	# try to find options to link against popt
+	LDFLAGS_save="$LDFLAGS"
+	popt_links=no
++	popt_sysroot=""
++	if test "x${lt_sysroot}" != x; then
++		popt_sysroot="${lt_sysroot}/"
++	fi
+	for popt_prefix in /usr "" /usr/local; do
+		# We could have "/usr" and "lib64" at the beginning of the
+		# lists. Then the first tested location would
+@@ -112,8 +116,8 @@
+			popt_libdir="${popt_prefix}/${ldir}"
 			if test "${popt_libdir}" = "/"; then
 				popt_libdir=""
-			elif test -d "${popt_libdir}"; then
+-			elif test -d "${popt_libdir}"; then
 -				LDFLAGS="-L${popt_libdir} ${LDFLAGS}"
++			elif test -d "${popt_sysroot}${popt_libdir}"; then
 +				LDFLAGS="-L${popt_libdir} ${LDFLAGS_save}"
 			else
 				continue
-- 
1.7.3.4



