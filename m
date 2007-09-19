Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IY0me-0003mU-3F
	for openembedded-devel@openembedded.org; Wed, 19 Sep 2007 16:44:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8JEe9kQ014390;
	Wed, 19 Sep 2007 15:40:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14301-02; Wed, 19 Sep 2007 15:40:05 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8JEe0Ka014365
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Wed, 19 Sep 2007 15:40:00 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1190191062.7630.17.camel@localhost.localdomain>
References: <1190191062.7630.17.camel@localhost.localdomain>
Date: Wed, 19 Sep 2007 15:39:59 +0100
Message-Id: <1190212799.7630.48.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Ross Burton <ross@openedhand.com>
Subject: Re: cross and staging directories
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
X-List-Received-Date: Wed, 19 Sep 2007 14:44:10 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2007-09-19 at 09:37 +0100, Richard Purdie wrote:
> I've been experimenting a bit in Poky to find out exactly why we need
> the cross directory.
> 
> The motivation for this is the load of files we duplicate in both,
> particularly linux-libc-headers, headers from glibc-initial, glibc and
> glibc-intermediate and libs from glibc and glibc-intermediate.

I made some changes to Poky's cross directory basically taking the
symlink approach I proposed in the above mail. This adds two symlinks
for lib and include in ${CROSS_DIR}/${TARGET_SYS}/ and then removes all
the staging we do to cross for linux-libc-headers, glibc,
glibc-intermediate and glibc-initial since its no longer needed. I've
included a patch for OE below.

For Poky, this took cross from 100MB (1011 files) to 24MB (72 files). It
also removes two "make install" glibc steps which take an age, hence
builds speed up.

I'll wait for Poky's automated test to complete but my local tests
worked out ok and this change should be safe. I'm providing the patch in
case anyone wishes to experiment/test it. I am in favour of committing
something like this at some point. The reduction in file duplication can
only be a good thing IMO.

I've noticed there is more scope for cleanup of glibc's CROSS references
in the --with-headers options but the symlink takes care of it for now.

Cheers,

Richard


# 
# old_revision [0ba4bbe5ebdf7f3598dd1890a61d14cd356eab54]
# 
# add_file "packages/meta/cross-linkage_1.0.bb"
#  content [9ae4dac33606a42fffa396034fa50cb8a34ee3a2]
# 
# patch "packages/gcc/gcc-cross-initial.inc"
#  from [ac38b14b3c634b0aa2af45a7c226e750ebdc379f]
#    to [fb66b62909bd934c21054254204b8d744c47c58e]
# 
# patch "packages/gcc/gcc3-build-cross.inc"
#  from [f886ca9176dd37a2b84a6e0bc3411eb497df4d2c]
#    to [f5b8eae287025914fe8384905949c0372af6d9d0]
# 
# patch "packages/glibc/eglibc-initial_svn.bb"
#  from [9c710ce312d99de7910b87096145f2da2b1a4863]
#    to [169dc54b63b1a43157895a99b82f0ab100efd9a1]
# 
# patch "packages/glibc/eglibc_svn.bb"
#  from [bb25ed1e0fdfd432e265209f03dfaf36f79bdf1b]
#    to [f21e6fde33775e6d7259b548e8ea613cb6381d7b]
# 
# patch "packages/glibc/glibc-initial_2.2.5.bb"
#  from [d62fede1a76a8d9e838f51570fa22d239c1dc7b3]
#    to [091a2160273ae3b6a382b6cb549666e2353ca0ff]
# 
# patch "packages/glibc/glibc-initial_2.3.2+cvs20040726.bb"
#  from [cd0d6484218b3e006eca5a8a0a9bd6552074c036]
#    to [555ff6237c1b11b408203f153b57d37d0c502d56]
# 
# patch "packages/glibc/glibc-initial_2.3.2.bb"
#  from [7375743390f05bc0c895a55a33187711a6d2a8e5]
#    to [4a30ac1837312bffc7c9867996d7af2e22a02008]
# 
# patch "packages/glibc/glibc-initial_2.4.bb"
#  from [08b7c7a5d7f1b0b88502b6c7afd6a8d0260fd5b9]
#    to [a991b8aa5129a2efdcab9bc56354ae288601b027]
# 
# patch "packages/glibc/glibc-initial_2.5.bb"
#  from [edbbd69c2ecac34792c78eff18010d1fccb0e9ba]
#    to [b6d21207ac7fee6ea7f796f2fabb96031ce91c9c]
# 
# patch "packages/glibc/glibc-initial_2.6.1.bb"
#  from [239d377c761368ba4372dee9a113529686817eaa]
#    to [85a0c5a0c4a303731951d69ad6bfcfc80c5e83f9]
# 
# patch "packages/glibc/glibc-initial_cvs.bb"
#  from [baeda8a9f43dd49844b2d1e49c1943643cd9fa84]
#    to [a3c00f904e9cfb7a61421cde6700bad08cfe65a1]
# 
# patch "packages/glibc/glibc_2.2.5.bb"
#  from [c94ca1957557440865f3a087a491e78c82ac50c8]
#    to [b60012cb66eaa218a4211b1b00dea5abf5edc57e]
# 
# patch "packages/glibc/glibc_2.3.2+cvs20040726.bb"
#  from [9d66f3495d89533b0863b4cbebd1f7bb0178f2a6]
#    to [b4359b2c37ba0e9a9efb05449dbd276a415dd58c]
# 
# patch "packages/glibc/glibc_2.3.2.bb"
#  from [9899b2926f98c47bf6f98b3152712ec3e0402c3d]
#    to [acb2e796eed3503e93fc9185f25ceb8fd6d08192]
# 
# patch "packages/glibc/glibc_2.3.3+cvs20041128.bb"
#  from [7c004eef4c30f17d8e8dbda2fd9474d5780ab4ca]
#    to [88f1350f1c7a6cbb497959a8a1e4455a69db0920]
# 
# patch "packages/glibc/glibc_2.3.3+cvs20050221.bb"
#  from [f8890769d3ce7943c36fa8f56afab1ef7475e346]
#    to [c81a4dcb60d85da204ee67a9cb24ee2248fed1a3]
# 
# patch "packages/glibc/glibc_2.3.3+cvs20050420.bb"
#  from [a9a264d70bf4eece2297cfa0d8e655647c03b3b3]
#    to [9df1e523bbb241ea77f9a42f3a1705e3929ac476]
# 
# patch "packages/glibc/glibc_2.3.3.bb"
#  from [7ebe44a2dd859533057aa8289095737f4da1cea3]
#    to [90e63e009d2f6f56a145e4311c8a40c1e2688dec]
# 
# patch "packages/glibc/glibc_2.3.5+cvs20050627.bb"
#  from [98cebeae3c0ce6e140197e208b78795709e718e0]
#    to [703b7011b4de9f212ca83c995497ecf780665ab1]
# 
# patch "packages/glibc/glibc_2.4.bb"
#  from [15f3f20149c15a3bf357a1bae18153f259f9fe90]
#    to [364445388b67f1d7faba1f8abe200162e43cdf30]
# 
# patch "packages/glibc/glibc_2.5.bb"
#  from [e59d8141690b43e2f369f7656638840f02908a89]
#    to [adbbaef7a3f6be171b33e7148e188d99e04e261c]
# 
# patch "packages/glibc/glibc_2.6.1.bb"
#  from [7a41e230f67e4998589ab65552c2369752fe2137]
#    to [cc783c4e44a3a182955394de28e61f41cb8bfbcf]
# 
# patch "packages/glibc/glibc_cvs.bb"
#  from [8601413e7136492ce2d9b65e94e01bd11de422fe]
#    to [12d6ab5c7d2403f07afda67d7b1fbf30f9b02fd4]
# 
# patch "packages/linux-libc-headers/linux-libc-headers.inc"
#  from [8d23279cdfe7a7a9d3b20655625b2c6424e25069]
#    to [87128c42990e29e5ae8b7fb5934036d4c2f46337]
# 
# patch "packages/linux-libc-headers/linux-libc-headers_2.6.11.1.bb"
#  from [28fd0f60c97c28c7a92bcda3901112d816fb0079]
#    to [a5e398b392cdf0d939f0d10034f2326567a46b5e]
# 
# patch "packages/linux-libc-headers/linux-libc-headers_2.6.15.99.bb"
#  from [f640ff6e9ea5b22c43ad721d47177c5f7beef56e]
#    to [2462887f80c983eb3bd388e906229f9f58bc4aa7]
# 
# patch "packages/linux-libc-headers/linux-libc-headers_2.6.18+2.6.19-rc1.bb"
#  from [1bdb6e44034d998028039d227a58ea1b733413b2]
#    to [111d60dc8a44ea0480a53c0327c6ed039146b438]
# 
# patch "packages/linux-libc-headers/linux-libc-headers_2.6.18.bb"
#  from [c159c3b88f0b339eaba789233fdf8ce097aa3ef4]
#    to [62dcdcd2c929e0438841921e99fbfd336aa71d27]
# 
# patch "packages/linux-libc-headers/linux-libc-headers_2.6.20.bb"
#  from [93b7bd106ed8f8f8a164923c1488cc41488437bb]
#    to [d423e0a23731766a495f814c464864df869a77bd]
# 
# patch "packages/linux-libc-headers/linux-libc-headers_2.6.22.bb"
#  from [315a90b6e90272ad612070887ceec548917a74d4]
#    to [1793c1f183598c2d981b16023c4a14245807fc77]
# 
# patch "packages/linux-libc-headers/linux-libc-headers_2.6.7.0.bb"
#  from [36aa0f707b09ec3a7da7cd2fd580fd8610ce3121]
#    to [a9f62e9c41ff4489d4ce3097d04a44c1688c5b9b]
# 
# patch "packages/linux-libc-headers/linux-libc-headers_2.6.8.1.bb"
#  from [ee9cc943eec258d43d921237e72206155ead074d]
#    to [d9d8521f857b98b5a68a1e131113d039c7fe6854]
# 
============================================================
--- packages/meta/cross-linkage_1.0.bb	9ae4dac33606a42fffa396034fa50cb8a34ee3a2
+++ packages/meta/cross-linkage_1.0.bb	9ae4dac33606a42fffa396034fa50cb8a34ee3a2
@@ -0,0 +1,28 @@
+DESCRIPTION = "cross-linkage sets up symlinks between cross and staging so the compiler can find things"
+SECTION = "devel"
+PACKAGES = ""
+
+INHIBIT_DEFAULT_DEPS = "1"
+PR = "r0"
+
+SRC_URI = ""
+
+do_configure() {
+	:
+}
+
+do_compile () {
+	:
+}
+
+do_install() {
+	:
+}
+
+do_stage () {
+	install -d ${CROSS_DIR}/${TARGET_SYS}/
+	rm -rf ${CROSS_DIR}/${TARGET_SYS}/include
+	ln -s  ${STAGING_INCDIR}/ ${CROSS_DIR}/${TARGET_SYS}/include
+	rm -rf ${CROSS_DIR}/${TARGET_SYS}/lib
+	ln -s  ${STAGING_LIBDIR} ${CROSS_DIR}/${TARGET_SYS}/lib 
+}
============================================================
--- packages/gcc/gcc-cross-initial.inc	ac38b14b3c634b0aa2af45a7c226e750ebdc379f
+++ packages/gcc/gcc-cross-initial.inc	fb66b62909bd934c21054254204b8d744c47c58e
@@ -1,10 +1,10 @@ PACKAGES = ""
 DEPENDS = "virtual/${TARGET_PREFIX}binutils"
 DEPENDS += "${@['virtual/${TARGET_PREFIX}libc-initial',''][bb.data.getVar('TARGET_ARCH', d, 1) in ['arm', 'armeb', 'mips', 'mipsel']]}"
 PROVIDES = "virtual/${TARGET_PREFIX}gcc-initial"
 PACKAGES = ""
 
 # This is intended to be a -very- basic config
-EXTRA_OECONF = "--with-local-prefix=${CROSS_DIR}/${TARGET_SYS} \
+EXTRA_OECONF = "--with-local-prefix=${STAGING_DIR}/${TARGET_SYS} \
 		--with-newlib \
 		--disable-shared \
 		--disable-threads \
============================================================
--- packages/gcc/gcc3-build-cross.inc	f886ca9176dd37a2b84a6e0bc3411eb497df4d2c
+++ packages/gcc/gcc3-build-cross.inc	f5b8eae287025914fe8384905949c0372af6d9d0
@@ -1,8 +1,7 @@ USE_NLS = '${@base_conditional( "TARGET_
 USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibc", "no", "", d )}'
 
-EXTRA_OECONF_PATHS = "--with-local-prefix=${CROSS_DIR}/${TARGET_SYS} \
-		      --with-gxx-include-dir=${CROSS_DIR}/${TARGET_SYS}/include/c++ \
-                      --disable-multilib"
+EXTRA_OECONF_PATHS = "--with-local-prefix=${STAGING_DIR}/${TARGET_SYS} \
+		      --with-gxx-include-dir=${STAGING_DIR}/${TARGET_SYS}/include/c++"
 
 do_configure_prepend () {
 	rm -f ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/libgcc_eh.a
============================================================
--- packages/glibc/eglibc-initial_svn.bb	9c710ce312d99de7910b87096145f2da2b1a4863
+++ packages/glibc/eglibc-initial_svn.bb	169dc54b63b1a43157895a99b82f0ab100efd9a1
@@ -32,14 +32,14 @@ do_stage () {
 }
 
 do_stage () {
-	oe_runmake cross-compiling=yes install_root=${CROSS_DIR}/${TARGET_SYS} prefix="" install-headers
+	oe_runmake cross-compiling=yes install_root=${STAGING_DIR}/${HOST_SYS} includedir=/include prefix="" install-headers
 
 	# Two headers -- stubs.h and features.h -- aren't installed by install-headers,
 	# so do them by hand.  We can tolerate an empty stubs.h for the moment.
 	# See e.g. http://gcc.gnu.org/ml/gcc/2002-01/msg00900.html
-	mkdir -p ${CROSS_DIR}/${TARGET_SYS}/include/gnu
-	touch ${CROSS_DIR}/${TARGET_SYS}/include/gnu/stubs.h
-	cp ${S}/include/features.h ${CROSS_DIR}/${TARGET_SYS}/include/features.h
+	mkdir -p ${STAGING_DIR}/${HOST_SYS}/include/gnu
+	touch ${STAGING_DIR}/${HOST_SYS}/include/gnu/stubs.h
+	cp ${S}/include/features.h ${STAGING_DIR}/${HOST_SYS}/include/features.h
 }
 
 do_install () {
============================================================
--- packages/glibc/eglibc_svn.bb	bb25ed1e0fdfd432e265209f03dfaf36f79bdf1b
+++ packages/glibc/eglibc_svn.bb	f21e6fde33775e6d7259b548e8ea613cb6381d7b
@@ -110,29 +110,6 @@ do_stage() {
         done
         echo 'GROUP ( libpthread.so.0 libpthread_nonshared.a )' > ${STAGING_LIBDIR}/libpthread.so
         echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${STAGING_LIBDIR}/libc.so
-
-        rm -f ${CROSS_DIR}/${TARGET_SYS}/lib/libc.so.6
-        oe_runmake 'install_root=${CROSS_DIR}/${TARGET_SYS}' \
-                   'includedir=/include' 'libdir=/lib' 'slibdir=/lib' \
-                   '${CROSS_DIR}/${TARGET_SYS}/lib/libc.so.6' \
-                   install-headers install-lib
-
-        install -d ${CROSS_DIR}/${TARGET_SYS}/include/gnu \
-                   ${CROSS_DIR}/${TARGET_SYS}/include/bits \
-                   ${CROSS_DIR}/${TARGET_SYS}/include/rpcsvc
-        install -m 0644 ${S}/include/gnu/stubs.h ${CROSS_DIR}/${TARGET_SYS}/include/gnu/
-        install -m 0644 ${B}/bits/stdio_lim.h ${CROSS_DIR}/${TARGET_SYS}/include/bits/
-        install -m 0644 misc/syscall-list.h ${CROSS_DIR}/${TARGET_SYS}/include/bits/syscall.h
-        for r in ${rpcsvc}; do
-                h=`echo $r|sed -e's,\.x$,.h,'`
-                install -m 0644 ${S}/sunrpc/rpcsvc/$h ${CROSS_DIR}/${TARGET_SYS}/include/rpcsvc/
-        done
-
-        for i in libc.a libc_pic.a libc_nonshared.a; do
-                install -m 0644 ${B}/$i ${CROSS_DIR}/${TARGET_SYS}/lib/ || die "failed to install $i"
-        done
-        echo 'GROUP ( libpthread.so.0 libpthread_nonshared.a )' > ${CROSS_DIR}/${TARGET_SYS}/lib/libpthread.so
-        echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${CROSS_DIR}/${TARGET_SYS}/lib/libc.so
 }
 
 require eglibc-package.bbclass
============================================================
--- packages/glibc/glibc-initial_2.2.5.bb	d62fede1a76a8d9e838f51570fa22d239c1dc7b3
+++ packages/glibc/glibc-initial_2.2.5.bb	091a2160273ae3b6a382b6cb549666e2353ca0ff
@@ -33,14 +33,14 @@ do_stage () {
 }
 
 do_stage () {
-	oe_runmake cross-compiling=yes install_root=${CROSS_DIR}/${TARGET_SYS} prefix="" install-headers
+	oe_runmake cross-compiling=yes install_root=${STAGING_DIR}/${HOST_SYS} includedir=/include prefix="" install-headers
 
 	# Two headers -- stubs.h and features.h -- aren't installed by install-headers,
 	# so do them by hand.  We can tolerate an empty stubs.h for the moment.
 	# See e.g. http://gcc.gnu.org/ml/gcc/2002-01/msg00900.html
-	mkdir -p ${CROSS_DIR}/${TARGET_SYS}/include/gnu
-	touch ${CROSS_DIR}/${TARGET_SYS}/include/gnu/stubs.h
-	cp ${S}/include/features.h ${CROSS_DIR}/${TARGET_SYS}/include/features.h
+	mkdir -p ${STAGING_DIR}/${HOST_SYS}/include/gnu
+	touch ${STAGING_DIR}/${HOST_SYS}/include/gnu/stubs.h
+	cp ${S}/include/features.h ${STAGING_DIR}/${HOST_SYS}/include/features.h
 }
 
 do_install () {
============================================================
--- packages/glibc/glibc-initial_2.3.2+cvs20040726.bb	cd0d6484218b3e006eca5a8a0a9bd6552074c036
+++ packages/glibc/glibc-initial_2.3.2+cvs20040726.bb	555ff6237c1b11b408203f153b57d37d0c502d56
@@ -32,14 +32,14 @@ do_stage () {
 }
 
 do_stage () {
-	oe_runmake cross-compiling=yes install_root=${CROSS_DIR}/${TARGET_SYS} prefix="" install-headers
+	oe_runmake cross-compiling=yes install_root=${STAGING_DIR}/${HOST_SYS} includedir=/include prefix="" install-headers
 
 	# Two headers -- stubs.h and features.h -- aren't installed by install-headers,
 	# so do them by hand.  We can tolerate an empty stubs.h for the moment.
 	# See e.g. http://gcc.gnu.org/ml/gcc/2002-01/msg00900.html
-	mkdir -p ${CROSS_DIR}/${TARGET_SYS}/include/gnu
-	touch ${CROSS_DIR}/${TARGET_SYS}/include/gnu/stubs.h
-	cp ${S}/include/features.h ${CROSS_DIR}/${TARGET_SYS}/include/features.h
+	mkdir -p ${STAGING_DIR}/${HOST_SYS}/include/gnu
+	touch ${STAGING_DIR}/${HOST_SYS}/include/gnu/stubs.h
+	cp ${S}/include/features.h ${STAGING_DIR}/${HOST_SYS}/include/features.h
 }
 
 do_install () {
============================================================
--- packages/glibc/glibc-initial_2.3.2.bb	7375743390f05bc0c895a55a33187711a6d2a8e5
+++ packages/glibc/glibc-initial_2.3.2.bb	4a30ac1837312bffc7c9867996d7af2e22a02008
@@ -32,14 +32,14 @@ do_stage () {
 }
 
 do_stage () {
-	oe_runmake cross-compiling=yes install_root=${CROSS_DIR}/${TARGET_SYS} prefix="" install-headers
+	oe_runmake cross-compiling=yes install_root=${STAGING_DIR}/${HOST_SYS} includedir=/include prefix="" install-headers
 
 	# Two headers -- stubs.h and features.h -- aren't installed by install-headers,
 	# so do them by hand.  We can tolerate an empty stubs.h for the moment.
 	# See e.g. http://gcc.gnu.org/ml/gcc/2002-01/msg00900.html
-	mkdir -p ${CROSS_DIR}/${TARGET_SYS}/include/gnu
-	touch ${CROSS_DIR}/${TARGET_SYS}/include/gnu/stubs.h
-	cp ${S}/include/features.h ${CROSS_DIR}/${TARGET_SYS}/include/features.h
+	mkdir -p ${STAGING_DIR}/${HOST_SYS}/include/gnu
+	touch ${STAGING_DIR}/${HOST_SYS}/include/gnu/stubs.h
+	cp ${S}/include/features.h ${STAGING_DIR}/${HOST_SYS}/include/features.h
 }
 
 do_install () {
============================================================
--- packages/glibc/glibc-initial_2.4.bb	08b7c7a5d7f1b0b88502b6c7afd6a8d0260fd5b9
+++ packages/glibc/glibc-initial_2.4.bb	a991b8aa5129a2efdcab9bc56354ae288601b027
@@ -1,3 +1,4 @@
+SECTION = "libs"
 require glibc_${PV}.bb
 
 DEPENDS = "linux-libc-headers"
@@ -5,6 +6,7 @@ PACKAGES = ""
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/glibc-2.4', '${FILE_DIRNAME}/glibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
 
 PACKAGES = ""
+PACKAGES_DYNAMIC = ""
 
 do_configure () {
 	sed -ie 's,{ (exit 1); exit 1; }; },{ (exit 0); }; },g' ${S}/configure
@@ -15,7 +17,7 @@ do_configure () {
 		--enable-hacker-mode
 	if grep -q GLIBC_2.3 ${S}/ChangeLog; then
 		# glibc-2.3.x passes cross options to $(CC) when generating errlist-compat.c, which fails without a real cross-compiler.
-		# Fortunately, we don't need errlist-compat.c, since we just need .h files,
+		# Fortunately, we don't need errlist-compat.c, since we just need .h files, 
 		# so work around this by creating a fake errlist-compat.c and satisfying its dependencies.
 		# Another workaround might be to tell configure to not use any cross options to $(CC).
 		# The real fix would be to get install-headers to not generate errlist-compat.c.
@@ -30,14 +32,14 @@ do_stage () {
 }
 
 do_stage () {
-	oe_runmake cross-compiling=yes install_root=${CROSS_DIR}/${TARGET_SYS} prefix="" install-headers
+	oe_runmake cross-compiling=yes install_root=${STAGING_DIR}/${HOST_SYS} includedir=/include prefix="" install-headers
 
 	# Two headers -- stubs.h and features.h -- aren't installed by install-headers,
 	# so do them by hand.  We can tolerate an empty stubs.h for the moment.
 	# See e.g. http://gcc.gnu.org/ml/gcc/2002-01/msg00900.html
-	mkdir -p ${CROSS_DIR}/${TARGET_SYS}/include/gnu
-	touch ${CROSS_DIR}/${TARGET_SYS}/include/gnu/stubs.h
-	cp ${S}/include/features.h ${CROSS_DIR}/${TARGET_SYS}/include/features.h
+	mkdir -p ${STAGING_DIR}/${HOST_SYS}/include/gnu
+	touch ${STAGING_DIR}/${HOST_SYS}/include/gnu/stubs.h
+	cp ${S}/include/features.h  ${STAGING_DIR}/${HOST_SYS}/include/features.h
 }
 
 do_install () {
============================================================
--- packages/glibc/glibc-initial_2.5.bb	edbbd69c2ecac34792c78eff18010d1fccb0e9ba
+++ packages/glibc/glibc-initial_2.5.bb	b6d21207ac7fee6ea7f796f2fabb96031ce91c9c
@@ -5,18 +5,18 @@ PACKAGES = ""
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/glibc-2.4', '${FILE_DIRNAME}/glibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
 
 PACKAGES = ""
+PACKAGES_DYNAMIC = ""
 
 do_configure () {
 	sed -ie 's,{ (exit 1); exit 1; }; },{ (exit 0); }; },g' ${S}/configure
 	chmod +x ${S}/configure
-	unset CFLAGS
 	CC="${BUILD_CC}" CPP="${BUILD_CPP}" LD="${BUILD_LD}" ${S}/configure --host=${TARGET_SYS} --build=${BUILD_SYS} \
 		--without-cvs --disable-sanity-checks \
 		--with-headers=${CROSS_DIR}/${TARGET_SYS}/include \
 		--enable-hacker-mode
-	if grep -q GLIBC_2.5 ${S}/ChangeLog; then
+	if grep -q GLIBC_2.3 ${S}/ChangeLog; then
 		# glibc-2.3.x passes cross options to $(CC) when generating errlist-compat.c, which fails without a real cross-compiler.
-		# Fortunately, we don't need errlist-compat.c, since we just need .h files,
+		# Fortunately, we don't need errlist-compat.c, since we just need .h files, 
 		# so work around this by creating a fake errlist-compat.c and satisfying its dependencies.
 		# Another workaround might be to tell configure to not use any cross options to $(CC).
 		# The real fix would be to get install-headers to not generate errlist-compat.c.
@@ -31,14 +31,14 @@ do_stage () {
 }
 
 do_stage () {
-	oe_runmake cross-compiling=yes install_root=${CROSS_DIR}/${TARGET_SYS} prefix="" install-headers
+	oe_runmake cross-compiling=yes install_root=${STAGING_DIR}/${HOST_SYS} includedir=/include prefix="" install-headers
 
 	# Two headers -- stubs.h and features.h -- aren't installed by install-headers,
 	# so do them by hand.  We can tolerate an empty stubs.h for the moment.
 	# See e.g. http://gcc.gnu.org/ml/gcc/2002-01/msg00900.html
-	mkdir -p ${CROSS_DIR}/${TARGET_SYS}/include/gnu
-	touch ${CROSS_DIR}/${TARGET_SYS}/include/gnu/stubs.h
-	cp ${S}/include/features.h ${CROSS_DIR}/${TARGET_SYS}/include/features.h
+	mkdir -p ${STAGING_DIR}/${HOST_SYS}/include/gnu
+	touch ${STAGING_DIR}/${HOST_SYS}/include/gnu/stubs.h
+	cp ${S}/include/features.h ${STAGING_DIR}/${HOST_SYS}/include/features.h
 }
 
 do_install () {
============================================================
--- packages/glibc/glibc-initial_2.6.1.bb	239d377c761368ba4372dee9a113529686817eaa
+++ packages/glibc/glibc-initial_2.6.1.bb	85a0c5a0c4a303731951d69ad6bfcfc80c5e83f9
@@ -31,14 +31,14 @@ do_stage () {
 }
 
 do_stage () {
-	oe_runmake cross-compiling=yes install_root=${CROSS_DIR}/${TARGET_SYS} prefix="" install-headers
+	oe_runmake cross-compiling=yes install_root=${STAGING_DIR}/${HOST_SYS} includedir=/include prefix="" install-headers
 
 	# Two headers -- stubs.h and features.h -- aren't installed by install-headers,
 	# so do them by hand.  We can tolerate an empty stubs.h for the moment.
 	# See e.g. http://gcc.gnu.org/ml/gcc/2002-01/msg00900.html
-	mkdir -p ${CROSS_DIR}/${TARGET_SYS}/include/gnu
-	touch ${CROSS_DIR}/${TARGET_SYS}/include/gnu/stubs.h
-	cp ${S}/include/features.h ${CROSS_DIR}/${TARGET_SYS}/include/features.h
+	mkdir -p ${STAGING_DIR}/${HOST_SYS}/include/gnu
+	touch ${STAGING_DIR}/${HOST_SYS}/include/gnu/stubs.h
+	cp ${S}/include/features.h ${STAGING_DIR}/${HOST_SYS}/include/features.h
 }
 
 do_install () {
============================================================
--- packages/glibc/glibc-initial_cvs.bb	baeda8a9f43dd49844b2d1e49c1943643cd9fa84
+++ packages/glibc/glibc-initial_cvs.bb	a3c00f904e9cfb7a61421cde6700bad08cfe65a1
@@ -31,14 +31,14 @@ do_stage () {
 }
 
 do_stage () {
-	oe_runmake cross-compiling=yes install_root=${CROSS_DIR}/${TARGET_SYS} prefix="" install-headers
+	oe_runmake cross-compiling=yes install_root=${STAGING_DIR}/${HOST_SYS} includedir=/include prefix="" install-headers
 
 	# Two headers -- stubs.h and features.h -- aren't installed by install-headers,
 	# so do them by hand.  We can tolerate an empty stubs.h for the moment.
 	# See e.g. http://gcc.gnu.org/ml/gcc/2002-01/msg00900.html
-	mkdir -p ${CROSS_DIR}/${TARGET_SYS}/include/gnu
-	touch ${CROSS_DIR}/${TARGET_SYS}/include/gnu/stubs.h
-	cp ${S}/include/features.h ${CROSS_DIR}/${TARGET_SYS}/include/features.h
+	mkdir -p ${STAGING_DIR}/${HOST_SYS}/include/gnu
+	touch ${STAGING_DIR}/${HOST_SYS}/include/gnu/stubs.h
+	cp ${S}/include/features.h ${STAGING_DIR}/${HOST_SYS}/include/features.h
 }
 
 do_install () {
============================================================
--- packages/glibc/glibc_2.2.5.bb	c94ca1957557440865f3a087a491e78c82ac50c8
+++ packages/glibc/glibc_2.2.5.bb	b60012cb66eaa218a4211b1b00dea5abf5edc57e
@@ -190,40 +190,6 @@ do_stage() {
 		install -m 0644 ${B}/$i ${STAGING_LIBDIR}/ || die "failed to install $i"
 	done
 	echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${STAGING_LIBDIR}/libc.so
-
-	rm -f ${CROSS_DIR}/${TARGET_SYS}/lib/libc.so.6
-	oe_runmake 'install_root=${CROSS_DIR}/${TARGET_SYS}' \
-		   'includedir=/include' 'libdir=/lib' 'slibdir=/lib' \
-		   '${CROSS_DIR}/${TARGET_SYS}/lib/libc.so.6' \
-		   '${CROSS_DIR}/${TARGET_SYS}/include/bits/errno.h' \
-		   '${CROSS_DIR}/${TARGET_SYS}/include/bits/libc-lock.h' \
-		   '${CROSS_DIR}/${TARGET_SYS}/include/gnu/stubs.h' \
-		   install-headers install-lib
-
-	install -d ${CROSS_DIR}/${TARGET_SYS}/include/gnu \
-		   ${CROSS_DIR}/${TARGET_SYS}/include/bits \
-		   ${CROSS_DIR}/${TARGET_SYS}/include/sys \
-		   ${CROSS_DIR}/${TARGET_SYS}/include/rpcsvc
-	install -m 0644 ${B}/bits/stdio_lim.h ${CROSS_DIR}/${TARGET_SYS}/include/bits/
-	install -m 0644 misc/syscall-list.h ${CROSS_DIR}/${TARGET_SYS}/include/bits/syscall.h
-	install -m 0644 ${S}/include/bits/xopen_lim.h ${CROSS_DIR}/${TARGET_SYS}/include/bits/
-	install -m 0644 ${B}/gnu/lib-names.h ${CROSS_DIR}/${TARGET_SYS}/include/gnu/
-	install -m 0644 ${S}/include/limits.h ${CROSS_DIR}/${TARGET_SYS}/include/
-	install -m 0644 ${S}/include/gnu/libc-version.h ${CROSS_DIR}/${TARGET_SYS}/include/gnu/
-	install -m 0644 ${S}/include/gnu-versions.h ${CROSS_DIR}/${TARGET_SYS}/include/
-	install -m 0644 ${S}/include/values.h ${CROSS_DIR}/${TARGET_SYS}/include/
-	install -m 0644 ${S}/include/errno.h ${CROSS_DIR}/${TARGET_SYS}/include/
-	install -m 0644 ${S}/include/sys/errno.h ${CROSS_DIR}/${TARGET_SYS}/include/sys/
-	install -m 0644 ${S}/include/features.h ${CROSS_DIR}/${TARGET_SYS}/include/
-	for r in ${rpcsvc}; do
-		h=`echo $r|sed -e's,\.x$,.h,'`
-		install -m 0644 ${S}/sunrpc/rpcsvc/$h ${CROSS_DIR}/${TARGET_SYS}/include/rpcsvc/
-	done
-
-	for i in libc.a libc_pic.a libc_nonshared.a; do
-		install -m 0644 ${B}/$i ${CROSS_DIR}/${TARGET_SYS}/lib/ || die "failed to install $i"
-	done
-	echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${CROSS_DIR}/${TARGET_SYS}/lib/libc.so
 }
 
 require glibc-package.bbclass
============================================================
--- packages/glibc/glibc_2.3.2+cvs20040726.bb	9d66f3495d89533b0863b4cbebd1f7bb0178f2a6
+++ packages/glibc/glibc_2.3.2+cvs20040726.bb	b4359b2c37ba0e9a9efb05449dbd276a415dd58c
@@ -92,29 +92,6 @@ do_stage() {
 	done
 	echo 'GROUP ( libpthread.so.0 libpthread_nonshared.a )' > ${STAGING_LIBDIR}/libpthread.so
 	echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${STAGING_LIBDIR}/libc.so
-
-	rm -f ${CROSS_DIR}/${TARGET_SYS}/lib/libc.so.6
-	oe_runmake 'install_root=${CROSS_DIR}/${TARGET_SYS}' \
-		   'includedir=/include' 'libdir=/lib' 'slibdir=/lib' \
-		   '${CROSS_DIR}/${TARGET_SYS}/lib/libc.so.6' \
-		   install-headers install-lib
-
-	install -d ${CROSS_DIR}/${TARGET_SYS}/include/gnu \
-		   ${CROSS_DIR}/${TARGET_SYS}/include/bits \
-		   ${CROSS_DIR}/${TARGET_SYS}/include/rpcsvc
-	install -m 0644 ${S}/include/gnu/stubs.h ${CROSS_DIR}/${TARGET_SYS}/include/gnu/
-	install -m 0644 ${B}/bits/stdio_lim.h ${CROSS_DIR}/${TARGET_SYS}/include/bits/
-	install -m 0644 misc/syscall-list.h ${CROSS_DIR}/${TARGET_SYS}/include/bits/syscall.h
-	for r in ${rpcsvc}; do
-		h=`echo $r|sed -e's,\.x$,.h,'`
-		install -m 0644 ${S}/sunrpc/rpcsvc/$h ${CROSS_DIR}/${TARGET_SYS}/include/rpcsvc/
-	done
-
-	for i in libc.a libc_pic.a libc_nonshared.a; do
-		install -m 0644 ${B}/$i ${CROSS_DIR}/${TARGET_SYS}/lib/ || die "failed to install $i"
-	done
-	echo 'GROUP ( libpthread.so.0 libpthread_nonshared.a )' > ${CROSS_DIR}/${TARGET_SYS}/lib/libpthread.so
-	echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${CROSS_DIR}/${TARGET_SYS}/lib/libc.so
 }
 
 require glibc-package.bbclass
============================================================
--- packages/glibc/glibc_2.3.2.bb	9899b2926f98c47bf6f98b3152712ec3e0402c3d
+++ packages/glibc/glibc_2.3.2.bb	acb2e796eed3503e93fc9185f25ceb8fd6d08192
@@ -178,29 +178,6 @@ do_stage() {
 	done
 	echo 'GROUP ( libpthread.so.0 libpthread_nonshared.a )' > ${STAGING_LIBDIR}/libpthread.so
 	echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${STAGING_LIBDIR}/libc.so
-
-	rm -f ${CROSS_DIR}/${TARGET_SYS}/lib/libc.so.6
-	oe_runmake 'install_root=${CROSS_DIR}/${TARGET_SYS}' \
-		   'includedir=/include' 'libdir=/lib' 'slibdir=/lib' \
-		   '${CROSS_DIR}/${TARGET_SYS}/lib/libc.so.6' \
-		   install-headers install-lib
-
-	install -d ${CROSS_DIR}/${TARGET_SYS}/include/gnu \
-		   ${CROSS_DIR}/${TARGET_SYS}/include/bits \
-		   ${CROSS_DIR}/${TARGET_SYS}/include/rpcsvc
-	install -m 0644 ${S}/include/gnu/stubs.h ${CROSS_DIR}/${TARGET_SYS}/include/gnu/
-	install -m 0644 ${B}/bits/stdio_lim.h ${CROSS_DIR}/${TARGET_SYS}/include/bits/
-	install -m 0644 misc/syscall-list.h ${CROSS_DIR}/${TARGET_SYS}/include/bits/syscall.h
-	for r in ${rpcsvc}; do
-		h=`echo $r|sed -e's,\.x$,.h,'`
-		install -m 0644 ${S}/sunrpc/rpcsvc/$h ${CROSS_DIR}/${TARGET_SYS}/include/rpcsvc/
-	done
-
-	for i in libc.a libc_pic.a libc_nonshared.a; do
-		install -m 0644 ${B}/$i ${CROSS_DIR}/${TARGET_SYS}/lib/ || die "failed to install $i"
-	done
-	echo 'GROUP ( libpthread.so.0 libpthread_nonshared.a )' > ${CROSS_DIR}/${TARGET_SYS}/lib/libpthread.so
-	echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${CROSS_DIR}/${TARGET_SYS}/lib/libc.so
 }
 
 require glibc-package.bbclass
============================================================
--- packages/glibc/glibc_2.3.3+cvs20041128.bb	7c004eef4c30f17d8e8dbda2fd9474d5780ab4ca
+++ packages/glibc/glibc_2.3.3+cvs20041128.bb	88f1350f1c7a6cbb497959a8a1e4455a69db0920
@@ -114,29 +114,6 @@ do_stage() {
 	done
 	echo 'GROUP ( libpthread.so.0 libpthread_nonshared.a )' > ${STAGING_LIBDIR}/libpthread.so
 	echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${STAGING_LIBDIR}/libc.so
-
-	rm -f ${CROSS_DIR}/${TARGET_SYS}/lib/libc.so.6
-	oe_runmake 'install_root=${CROSS_DIR}/${TARGET_SYS}' \
-		   'includedir=/include' 'libdir=/lib' 'slibdir=/lib' \
-		   '${CROSS_DIR}/${TARGET_SYS}/lib/libc.so.6' \
-		   install-headers install-lib
-
-	install -d ${CROSS_DIR}/${TARGET_SYS}/include/gnu \
-		   ${CROSS_DIR}/${TARGET_SYS}/include/bits \
-		   ${CROSS_DIR}/${TARGET_SYS}/include/rpcsvc
-	install -m 0644 ${S}/include/gnu/stubs.h ${CROSS_DIR}/${TARGET_SYS}/include/gnu/
-	install -m 0644 ${B}/bits/stdio_lim.h ${CROSS_DIR}/${TARGET_SYS}/include/bits/
-	install -m 0644 misc/syscall-list.h ${CROSS_DIR}/${TARGET_SYS}/include/bits/syscall.h
-	for r in ${rpcsvc}; do
-		h=`echo $r|sed -e's,\.x$,.h,'`
-		install -m 0644 ${S}/sunrpc/rpcsvc/$h ${CROSS_DIR}/${TARGET_SYS}/include/rpcsvc/
-	done
-
-	for i in libc.a libc_pic.a libc_nonshared.a; do
-		install -m 0644 ${B}/$i ${CROSS_DIR}/${TARGET_SYS}/lib/ || die "failed to install $i"
-	done
-	echo 'GROUP ( libpthread.so.0 libpthread_nonshared.a )' > ${CROSS_DIR}/${TARGET_SYS}/lib/libpthread.so
-	echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${CROSS_DIR}/${TARGET_SYS}/lib/libc.so
 }
 
 require glibc-package.bbclass
============================================================
--- packages/glibc/glibc_2.3.3+cvs20050221.bb	f8890769d3ce7943c36fa8f56afab1ef7475e346
+++ packages/glibc/glibc_2.3.3+cvs20050221.bb	c81a4dcb60d85da204ee67a9cb24ee2248fed1a3
@@ -97,29 +97,6 @@ do_stage() {
 	done
 	echo 'GROUP ( libpthread.so.0 libpthread_nonshared.a )' > ${STAGING_LIBDIR}/libpthread.so
 	echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${STAGING_LIBDIR}/libc.so
-
-	rm -f ${CROSS_DIR}/${TARGET_SYS}/lib/libc.so.6
-	oe_runmake 'install_root=${CROSS_DIR}/${TARGET_SYS}' \
-		   'includedir=/include' 'libdir=/lib' 'slibdir=/lib' \
-		   '${CROSS_DIR}/${TARGET_SYS}/lib/libc.so.6' \
-		   install-headers install-lib
-
-	install -d ${CROSS_DIR}/${TARGET_SYS}/include/gnu \
-		   ${CROSS_DIR}/${TARGET_SYS}/include/bits \
-		   ${CROSS_DIR}/${TARGET_SYS}/include/rpcsvc
-	install -m 0644 ${S}/include/gnu/stubs.h ${CROSS_DIR}/${TARGET_SYS}/include/gnu/
-	install -m 0644 ${B}/bits/stdio_lim.h ${CROSS_DIR}/${TARGET_SYS}/include/bits/
-	install -m 0644 misc/syscall-list.h ${CROSS_DIR}/${TARGET_SYS}/include/bits/syscall.h
-	for r in ${rpcsvc}; do
-		h=`echo $r|sed -e's,\.x$,.h,'`
-		install -m 0644 ${S}/sunrpc/rpcsvc/$h ${CROSS_DIR}/${TARGET_SYS}/include/rpcsvc/
-	done
-
-	for i in libc.a libc_pic.a libc_nonshared.a; do
-		install -m 0644 ${B}/$i ${CROSS_DIR}/${TARGET_SYS}/lib/ || die "failed to install $i"
-	done
-	echo 'GROUP ( libpthread.so.0 libpthread_nonshared.a )' > ${CROSS_DIR}/${TARGET_SYS}/lib/libpthread.so
-	echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${CROSS_DIR}/${TARGET_SYS}/lib/libc.so
 }
 
 require glibc-package.bbclass
============================================================
--- packages/glibc/glibc_2.3.3+cvs20050420.bb	a9a264d70bf4eece2297cfa0d8e655647c03b3b3
+++ packages/glibc/glibc_2.3.3+cvs20050420.bb	9df1e523bbb241ea77f9a42f3a1705e3929ac476
@@ -98,29 +98,6 @@ do_stage() {
 	done
 	echo 'GROUP ( libpthread.so.0 libpthread_nonshared.a )' > ${STAGING_LIBDIR}/libpthread.so
 	echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${STAGING_LIBDIR}/libc.so
-
-	rm -f ${CROSS_DIR}/${TARGET_SYS}/lib/libc.so.6
-	oe_runmake 'install_root=${CROSS_DIR}/${TARGET_SYS}' \
-		   'includedir=/include' 'libdir=/lib' 'slibdir=/lib' \
-		   '${CROSS_DIR}/${TARGET_SYS}/lib/libc.so.6' \
-		   install-headers install-lib
-
-	install -d ${CROSS_DIR}/${TARGET_SYS}/include/gnu \
-		   ${CROSS_DIR}/${TARGET_SYS}/include/bits \
-		   ${CROSS_DIR}/${TARGET_SYS}/include/rpcsvc
-	install -m 0644 ${S}/include/gnu/stubs.h ${CROSS_DIR}/${TARGET_SYS}/include/gnu/
-	install -m 0644 ${B}/bits/stdio_lim.h ${CROSS_DIR}/${TARGET_SYS}/include/bits/
-	install -m 0644 misc/syscall-list.h ${CROSS_DIR}/${TARGET_SYS}/include/bits/syscall.h
-	for r in ${rpcsvc}; do
-		h=`echo $r|sed -e's,\.x$,.h,'`
-		install -m 0644 ${S}/sunrpc/rpcsvc/$h ${CROSS_DIR}/${TARGET_SYS}/include/rpcsvc/
-	done
-
-	for i in libc.a libc_pic.a libc_nonshared.a; do
-		install -m 0644 ${B}/$i ${CROSS_DIR}/${TARGET_SYS}/lib/ || die "failed to install $i"
-	done
-	echo 'GROUP ( libpthread.so.0 libpthread_nonshared.a )' > ${CROSS_DIR}/${TARGET_SYS}/lib/libpthread.so
-	echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${CROSS_DIR}/${TARGET_SYS}/lib/libc.so
 }
 
 require glibc-package.bbclass
============================================================
--- packages/glibc/glibc_2.3.3.bb	7ebe44a2dd859533057aa8289095737f4da1cea3
+++ packages/glibc/glibc_2.3.3.bb	90e63e009d2f6f56a145e4311c8a40c1e2688dec
@@ -123,29 +123,6 @@ do_stage() {
 	done
 	echo 'GROUP ( libpthread.so.0 libpthread_nonshared.a )' > ${STAGING_LIBDIR}/libpthread.so
 	echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${STAGING_LIBDIR}/libc.so
-
-	rm -f ${CROSS_DIR}/${TARGET_SYS}/lib/libc.so.6
-	oe_runmake 'install_root=${CROSS_DIR}/${TARGET_SYS}' \
-		   'includedir=/include' 'libdir=/lib' 'slibdir=/lib' \
-		   '${CROSS_DIR}/${TARGET_SYS}/lib/libc.so.6' \
-		   install-headers install-lib
-
-	install -d ${CROSS_DIR}/${TARGET_SYS}/include/gnu \
-		   ${CROSS_DIR}/${TARGET_SYS}/include/bits \
-		   ${CROSS_DIR}/${TARGET_SYS}/include/rpcsvc
-	install -m 0644 ${S}/include/gnu/stubs.h ${CROSS_DIR}/${TARGET_SYS}/include/gnu/
-	install -m 0644 ${B}/bits/stdio_lim.h ${CROSS_DIR}/${TARGET_SYS}/include/bits/
-	install -m 0644 misc/syscall-list.h ${CROSS_DIR}/${TARGET_SYS}/include/bits/syscall.h
-	for r in ${rpcsvc}; do
-		h=`echo $r|sed -e's,\.x$,.h,'`
-		install -m 0644 ${S}/sunrpc/rpcsvc/$h ${CROSS_DIR}/${TARGET_SYS}/include/rpcsvc/
-	done
-
-	for i in libc.a libc_pic.a libc_nonshared.a; do
-		install -m 0644 ${B}/$i ${CROSS_DIR}/${TARGET_SYS}/lib/ || die "failed to install $i"
-	done
-	echo 'GROUP ( libpthread.so.0 libpthread_nonshared.a )' > ${CROSS_DIR}/${TARGET_SYS}/lib/libpthread.so
-	echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${CROSS_DIR}/${TARGET_SYS}/lib/libc.so
 }
 
 require glibc-package.bbclass
============================================================
--- packages/glibc/glibc_2.3.5+cvs20050627.bb	98cebeae3c0ce6e140197e208b78795709e718e0
+++ packages/glibc/glibc_2.3.5+cvs20050627.bb	703b7011b4de9f212ca83c995497ecf780665ab1
@@ -150,29 +150,6 @@ do_stage() {
 	done
 	echo 'GROUP ( libpthread.so.0 libpthread_nonshared.a )' > ${STAGING_LIBDIR}/libpthread.so
 	echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${STAGING_LIBDIR}/libc.so
-
-	rm -f ${CROSS_DIR}/${TARGET_SYS}/lib/libc.so.6
-	oe_runmake 'install_root=${CROSS_DIR}/${TARGET_SYS}' \
-		   'includedir=/include' 'libdir=/lib' 'slibdir=/lib' \
-		   '${CROSS_DIR}/${TARGET_SYS}/lib/libc.so.6' \
-		   install-headers install-lib
-
-	install -d ${CROSS_DIR}/${TARGET_SYS}/include/gnu \
-		   ${CROSS_DIR}/${TARGET_SYS}/include/bits \
-		   ${CROSS_DIR}/${TARGET_SYS}/include/rpcsvc
-	install -m 0644 ${S}/include/gnu/stubs.h ${CROSS_DIR}/${TARGET_SYS}/include/gnu/
-	install -m 0644 ${B}/bits/stdio_lim.h ${CROSS_DIR}/${TARGET_SYS}/include/bits/
-	install -m 0644 misc/syscall-list.h ${CROSS_DIR}/${TARGET_SYS}/include/bits/syscall.h
-	for r in ${rpcsvc}; do
-		h=`echo $r|sed -e's,\.x$,.h,'`
-		install -m 0644 ${S}/sunrpc/rpcsvc/$h ${CROSS_DIR}/${TARGET_SYS}/include/rpcsvc/
-	done
-
-	for i in libc.a libc_pic.a libc_nonshared.a; do
-		install -m 0644 ${B}/$i ${CROSS_DIR}/${TARGET_SYS}/lib/ || die "failed to install $i"
-	done
-	echo 'GROUP ( libpthread.so.0 libpthread_nonshared.a )' > ${CROSS_DIR}/${TARGET_SYS}/lib/libpthread.so
-	echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${CROSS_DIR}/${TARGET_SYS}/lib/libc.so
 }
 
 require glibc-package.bbclass
============================================================
--- packages/glibc/glibc_2.4.bb	15f3f20149c15a3bf357a1bae18153f259f9fe90
+++ packages/glibc/glibc_2.4.bb	364445388b67f1d7faba1f8abe200162e43cdf30
@@ -166,29 +166,6 @@ do_stage() {
 	done
 	echo 'GROUP ( libpthread.so.0 libpthread_nonshared.a )' > ${STAGING_LIBDIR}/libpthread.so
 	echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${STAGING_LIBDIR}/libc.so
-
-	rm -f ${CROSS_DIR}/${TARGET_SYS}/lib/libc.so.6
-	oe_runmake 'install_root=${CROSS_DIR}/${TARGET_SYS}' \
-		   'includedir=/include' 'libdir=/lib' 'slibdir=/lib' \
-		   '${CROSS_DIR}/${TARGET_SYS}/lib/libc.so.6' \
-		   install-headers install-lib
-
-	install -d ${CROSS_DIR}/${TARGET_SYS}/include/gnu \
-		   ${CROSS_DIR}/${TARGET_SYS}/include/bits \
-		   ${CROSS_DIR}/${TARGET_SYS}/include/rpcsvc
-	install -m 0644 ${S}/include/gnu/stubs.h ${CROSS_DIR}/${TARGET_SYS}/include/gnu/
-	install -m 0644 ${B}/bits/stdio_lim.h ${CROSS_DIR}/${TARGET_SYS}/include/bits/
-	install -m 0644 misc/syscall-list.h ${CROSS_DIR}/${TARGET_SYS}/include/bits/syscall.h
-	for r in ${rpcsvc}; do
-		h=`echo $r|sed -e's,\.x$,.h,'`
-		install -m 0644 ${S}/sunrpc/rpcsvc/$h ${CROSS_DIR}/${TARGET_SYS}/include/rpcsvc/
-	done
-
-	for i in libc.a libc_pic.a libc_nonshared.a; do
-		install -m 0644 ${B}/$i ${CROSS_DIR}/${TARGET_SYS}/lib/ || die "failed to install $i"
-	done
-	echo 'GROUP ( libpthread.so.0 libpthread_nonshared.a )' > ${CROSS_DIR}/${TARGET_SYS}/lib/libpthread.so
-	echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${CROSS_DIR}/${TARGET_SYS}/lib/libc.so
 }
 
 require glibc-package.bbclass
============================================================
--- packages/glibc/glibc_2.5.bb	e59d8141690b43e2f369f7656638840f02908a89
+++ packages/glibc/glibc_2.5.bb	adbbaef7a3f6be171b33e7148e188d99e04e261c
@@ -176,29 +176,6 @@ do_stage() {
 	done
 	echo 'GROUP ( libpthread.so.0 libpthread_nonshared.a )' > ${STAGING_LIBDIR}/libpthread.so
 	echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${STAGING_LIBDIR}/libc.so
-
-	rm -f ${CROSS_DIR}/${TARGET_SYS}/lib/libc.so.6
-	oe_runmake 'install_root=${CROSS_DIR}/${TARGET_SYS}' \
-		   'includedir=/include' 'libdir=/lib' 'slibdir=/lib' \
-		   '${CROSS_DIR}/${TARGET_SYS}/lib/libc.so.6' \
-		   install-headers install-lib
-
-	install -d ${CROSS_DIR}/${TARGET_SYS}/include/gnu \
-		   ${CROSS_DIR}/${TARGET_SYS}/include/bits \
-		   ${CROSS_DIR}/${TARGET_SYS}/include/rpcsvc
-	install -m 0644 ${S}/include/gnu/stubs.h ${CROSS_DIR}/${TARGET_SYS}/include/gnu/
-	install -m 0644 ${B}/bits/stdio_lim.h ${CROSS_DIR}/${TARGET_SYS}/include/bits/
-	install -m 0644 misc/syscall-list.h ${CROSS_DIR}/${TARGET_SYS}/include/bits/syscall.h
-	for r in ${rpcsvc}; do
-		h=`echo $r|sed -e's,\.x$,.h,'`
-		install -m 0644 ${S}/sunrpc/rpcsvc/$h ${CROSS_DIR}/${TARGET_SYS}/include/rpcsvc/
-	done
-
-	for i in libc.a libc_pic.a libc_nonshared.a; do
-		install -m 0644 ${B}/$i ${CROSS_DIR}/${TARGET_SYS}/lib/ || die "failed to install $i"
-	done
-	echo 'GROUP ( libpthread.so.0 libpthread_nonshared.a )' > ${CROSS_DIR}/${TARGET_SYS}/lib/libpthread.so
-	echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${CROSS_DIR}/${TARGET_SYS}/lib/libc.so
 }
 
 require glibc-package.bbclass
============================================================
--- packages/glibc/glibc_2.6.1.bb	7a41e230f67e4998589ab65552c2369752fe2137
+++ packages/glibc/glibc_2.6.1.bb	cc783c4e44a3a182955394de28e61f41cb8bfbcf
@@ -173,29 +173,6 @@ do_stage() {
 	done
 	echo 'GROUP ( libpthread.so.0 libpthread_nonshared.a )' > ${STAGING_LIBDIR}/libpthread.so
 	echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${STAGING_LIBDIR}/libc.so
-
-	rm -f ${CROSS_DIR}/${TARGET_SYS}/lib/libc.so.6
-	oe_runmake 'install_root=${CROSS_DIR}/${TARGET_SYS}' \
-		   'includedir=/include' 'libdir=/lib' 'slibdir=/lib' \
-		   '${CROSS_DIR}/${TARGET_SYS}/lib/libc.so.6' \
-		   install-headers install-lib
-
-	install -d ${CROSS_DIR}/${TARGET_SYS}/include/gnu \
-		   ${CROSS_DIR}/${TARGET_SYS}/include/bits \
-		   ${CROSS_DIR}/${TARGET_SYS}/include/rpcsvc
-	install -m 0644 ${S}/include/gnu/stubs.h ${CROSS_DIR}/${TARGET_SYS}/include/gnu/
-	install -m 0644 ${B}/bits/stdio_lim.h ${CROSS_DIR}/${TARGET_SYS}/include/bits/
-	install -m 0644 misc/syscall-list.h ${CROSS_DIR}/${TARGET_SYS}/include/bits/syscall.h
-	for r in ${rpcsvc}; do
-		h=`echo $r|sed -e's,\.x$,.h,'`
-		install -m 0644 ${S}/sunrpc/rpcsvc/$h ${CROSS_DIR}/${TARGET_SYS}/include/rpcsvc/
-	done
-
-	for i in libc.a libc_pic.a libc_nonshared.a; do
-		install -m 0644 ${B}/$i ${CROSS_DIR}/${TARGET_SYS}/lib/ || die "failed to install $i"
-	done
-	echo 'GROUP ( libpthread.so.0 libpthread_nonshared.a )' > ${CROSS_DIR}/${TARGET_SYS}/lib/libpthread.so
-	echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${CROSS_DIR}/${TARGET_SYS}/lib/libc.so
 }
 
 require glibc-package.bbclass
============================================================
--- packages/glibc/glibc_cvs.bb	8601413e7136492ce2d9b65e94e01bd11de422fe
+++ packages/glibc/glibc_cvs.bb	12d6ab5c7d2403f07afda67d7b1fbf30f9b02fd4
@@ -121,29 +121,6 @@ do_stage() {
 	done
 	echo 'GROUP ( libpthread.so.0 libpthread_nonshared.a )' > ${STAGING_LIBDIR}/libpthread.so
 	echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${STAGING_LIBDIR}/libc.so
-
-	rm -f ${CROSS_DIR}/${TARGET_SYS}/lib/libc.so.6
-	oe_runmake 'install_root=${CROSS_DIR}/${TARGET_SYS}' \
-		   'includedir=/include' 'libdir=/lib' 'slibdir=/lib' \
-		   '${CROSS_DIR}/${TARGET_SYS}/lib/libc.so.6' \
-		   install-headers install-lib
-
-	install -d ${CROSS_DIR}/${TARGET_SYS}/include/gnu \
-		   ${CROSS_DIR}/${TARGET_SYS}/include/bits \
-		   ${CROSS_DIR}/${TARGET_SYS}/include/rpcsvc
-	install -m 0644 ${S}/include/gnu/stubs.h ${CROSS_DIR}/${TARGET_SYS}/include/gnu/
-	install -m 0644 ${B}/bits/stdio_lim.h ${CROSS_DIR}/${TARGET_SYS}/include/bits/
-	install -m 0644 misc/syscall-list.h ${CROSS_DIR}/${TARGET_SYS}/include/bits/syscall.h
-	for r in ${rpcsvc}; do
-		h=`echo $r|sed -e's,\.x$,.h,'`
-		install -m 0644 ${S}/sunrpc/rpcsvc/$h ${CROSS_DIR}/${TARGET_SYS}/include/rpcsvc/
-	done
-
-	for i in libc.a libc_pic.a libc_nonshared.a; do
-		install -m 0644 ${B}/$i ${CROSS_DIR}/${TARGET_SYS}/lib/ || die "failed to install $i"
-	done
-	echo 'GROUP ( libpthread.so.0 libpthread_nonshared.a )' > ${CROSS_DIR}/${TARGET_SYS}/lib/libpthread.so
-	echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${CROSS_DIR}/${TARGET_SYS}/lib/libc.so
 }
 
 require glibc-package.bbclass
============================================================
--- packages/linux-libc-headers/linux-libc-headers.inc	8d23279cdfe7a7a9d3b20655625b2c6424e25069
+++ packages/linux-libc-headers/linux-libc-headers.inc	87128c42990e29e5ae8b7fb5934036d4c2f46337
@@ -1,3 +1,5 @@ LICENSE = "GPL"
 DESCRIPTION = "Sanitized set of 2.6 kernel headers for the C library's use."
 SECTION = "devel"
 LICENSE = "GPL"
+
+DEPENDS = "cross-linkage"
============================================================
--- packages/linux-libc-headers/linux-libc-headers_2.6.11.1.bb	28fd0f60c97c28c7a92bcda3901112d816fb0079
+++ packages/linux-libc-headers/linux-libc-headers_2.6.11.1.bb	a5e398b392cdf0d939f0d10034f2326567a46b5e
@@ -48,11 +48,6 @@ do_stage () {
 	rm -rf ${STAGING_INCDIR}/linux ${STAGING_INCDIR}/asm
 	cp -pfLR include/linux ${STAGING_INCDIR}/
 	cp -pfLR include/asm ${STAGING_INCDIR}/
-	rm -rf ${CROSS_DIR}/${TARGET_SYS}/include/linux
-	rm -rf ${CROSS_DIR}/${TARGET_SYS}/include/asm
-	install -d ${CROSS_DIR}/${TARGET_SYS}/include
-	cp -pfLR include/linux ${CROSS_DIR}/${TARGET_SYS}/include/
-	cp -pfLR include/asm ${CROSS_DIR}/${TARGET_SYS}/include/
 }
 
 do_install() {
============================================================
--- packages/linux-libc-headers/linux-libc-headers_2.6.15.99.bb	f640ff6e9ea5b22c43ad721d47177c5f7beef56e
+++ packages/linux-libc-headers/linux-libc-headers_2.6.15.99.bb	2462887f80c983eb3bd388e906229f9f58bc4aa7
@@ -61,13 +61,6 @@ do_stage () {
 	cp -pfLR include/linux ${STAGING_INCDIR}/
 	cp -pfLR include/asm ${STAGING_INCDIR}/
 	cp -pfLR include/asm-generic ${STAGING_INCDIR}/
-	rm -rf ${CROSS_DIR}/${TARGET_SYS}/include/linux
-	rm -rf ${CROSS_DIR}/${TARGET_SYS}/include/asm
-	rm -rf ${CROSS_DIR}/${TARGET_SYS}/include/asm-generic
-	install -d ${CROSS_DIR}/${TARGET_SYS}/include
-	cp -pfLR include/linux ${CROSS_DIR}/${TARGET_SYS}/include/
-	cp -pfLR include/asm ${CROSS_DIR}/${TARGET_SYS}/include/
-	cp -pfLR include/asm-generic ${CROSS_DIR}/${TARGET_SYS}/include/
 }
 
 do_install() {
============================================================
--- packages/linux-libc-headers/linux-libc-headers_2.6.18+2.6.19-rc1.bb	1bdb6e44034d998028039d227a58ea1b733413b2
+++ packages/linux-libc-headers/linux-libc-headers_2.6.18+2.6.19-rc1.bb	111d60dc8a44ea0480a53c0327c6ed039146b438
@@ -46,13 +46,6 @@ do_stage () {
 	cp -pfLR ${S}${includedir}/linux ${STAGING_INCDIR}/
 	cp -pfLR ${S}${includedir}/asm-${ARCH} ${STAGING_INCDIR}/asm
 	cp -pfLR ${S}${includedir}/asm-generic ${STAGING_INCDIR}/
-	rm -rf ${CROSS_DIR}/${TARGET_SYS}/include/linux
-	rm -rf ${CROSS_DIR}/${TARGET_SYS}/include/asm
-	rm -rf ${CROSS_DIR}/${TARGET_SYS}/include/asm-generic
-	install -d ${CROSS_DIR}/${TARGET_SYS}/include
-	cp -pfLR ${S}${includedir}/linux ${CROSS_DIR}/${TARGET_SYS}/include/
-	cp -pfLR ${S}${includedir}/asm-${ARCH} ${CROSS_DIR}/${TARGET_SYS}/include/asm
-	cp -pfLR ${S}${includedir}/asm-generic ${CROSS_DIR}/${TARGET_SYS}/include/
 }
 
 do_stage_append_nylon () {
============================================================
--- packages/linux-libc-headers/linux-libc-headers_2.6.18.bb	c159c3b88f0b339eaba789233fdf8ce097aa3ef4
+++ packages/linux-libc-headers/linux-libc-headers_2.6.18.bb	62dcdcd2c929e0438841921e99fbfd336aa71d27
@@ -1,7 +1,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 require linux-libc-headers.inc
 
 INHIBIT_DEFAULT_DEPS = "1"
-DEPENDS = "unifdef-native"
+DEPENDS += "unifdef-native"
 PR = "r1"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.18.tar.bz2 \
@@ -60,19 +60,12 @@ do_stage () {
 	cp -pfLR ${STAGE_TEMP}${includedir}/linux ${STAGING_INCDIR}/
 	cp -pfLR ${STAGE_TEMP}${includedir}/asm ${STAGING_INCDIR}/
 	cp -pfLR ${STAGE_TEMP}${includedir}/asm-generic ${STAGING_INCDIR}/
-	rm -rf ${CROSS_DIR}/${TARGET_SYS}/include/linux
-	rm -rf ${CROSS_DIR}/${TARGET_SYS}/include/asm
-	rm -rf ${CROSS_DIR}/${TARGET_SYS}/include/asm-generic
-	install -d ${CROSS_DIR}/${TARGET_SYS}/include
-	cp -pfLR ${STAGE_TEMP}${includedir}/linux ${CROSS_DIR}/${TARGET_SYS}/include/
-	cp -pfLR ${STAGE_TEMP}${includedir}/asm ${CROSS_DIR}/${TARGET_SYS}/include/
-	cp -pfLR ${STAGE_TEMP}${includedir}/asm-generic ${CROSS_DIR}/${TARGET_SYS}/include/
 	# Add UTS_RELEASE to version.h. UTS_RELEASE was moved from version.h to 
 	# utsrelease.h in order to avoid recompiling a kernel every time a localversion
 	# changed. Since the our headers are static and we're not compiling an 
 	# actual kernel, re-adding UTS_RELEASE does't hurt, and it allows uclibc to 
 	# compile with kernel headers that work with EABI on ARM
-	echo '#define UTS_RELEASE "2.6.18"' >> ${CROSS_DIR}/${TARGET_SYS}/include/linux/version.h
+	echo '#define UTS_RELEASE "2.6.18"' >> ${STAGING_INCDIR}/linux/version.h
 }
 
 do_stage_append_nylon () {
============================================================
--- packages/linux-libc-headers/linux-libc-headers_2.6.20.bb	93b7bd106ed8f8f8a164923c1488cc41488437bb
+++ packages/linux-libc-headers/linux-libc-headers_2.6.20.bb	d423e0a23731766a495f814c464864df869a77bd
@@ -1,7 +1,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 require linux-libc-headers.inc
 
 INHIBIT_DEFAULT_DEPS = "1"
-DEPENDS = "unifdef-native"
+DEPENDS += "unifdef-native"
 PR = "r7"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
@@ -63,11 +63,4 @@ do_stage () {
 	cp -pfLR ${STAGE_TEMP}${includedir}/linux ${STAGING_INCDIR}/
 	cp -pfLR ${STAGE_TEMP}${includedir}/asm ${STAGING_INCDIR}/
 	cp -pfLR ${STAGE_TEMP}${includedir}/asm-generic ${STAGING_INCDIR}/
-	rm -rf ${CROSS_DIR}/${TARGET_SYS}/include/linux
-	rm -rf ${CROSS_DIR}/${TARGET_SYS}/include/asm
-	rm -rf ${CROSS_DIR}/${TARGET_SYS}/include/asm-generic
-	install -d ${CROSS_DIR}/${TARGET_SYS}/include
-	cp -pfLR ${STAGE_TEMP}${includedir}/linux ${CROSS_DIR}/${TARGET_SYS}/include/
-	cp -pfLR ${STAGE_TEMP}${includedir}/asm ${CROSS_DIR}/${TARGET_SYS}/include/
-	cp -pfLR ${STAGE_TEMP}${includedir}/asm-generic ${CROSS_DIR}/${TARGET_SYS}/include/
 }
============================================================
--- packages/linux-libc-headers/linux-libc-headers_2.6.22.bb	315a90b6e90272ad612070887ceec548917a74d4
+++ packages/linux-libc-headers/linux-libc-headers_2.6.22.bb	1793c1f183598c2d981b16023c4a14245807fc77
@@ -1,7 +1,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 require linux-libc-headers.inc
 
 INHIBIT_DEFAULT_DEPS = "1"
-DEPENDS = "unifdef-native"
+DEPENDS += "unifdef-native"
 PR = "r0"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
@@ -63,11 +63,4 @@ do_stage () {
 	cp -pfLR ${STAGE_TEMP}${includedir}/linux ${STAGING_INCDIR}/
 	cp -pfLR ${STAGE_TEMP}${includedir}/asm ${STAGING_INCDIR}/
 	cp -pfLR ${STAGE_TEMP}${includedir}/asm-generic ${STAGING_INCDIR}/
-	rm -rf ${CROSS_DIR}/${TARGET_SYS}/include/linux
-	rm -rf ${CROSS_DIR}/${TARGET_SYS}/include/asm
-	rm -rf ${CROSS_DIR}/${TARGET_SYS}/include/asm-generic
-	install -d ${CROSS_DIR}/${TARGET_SYS}/include
-	cp -pfLR ${STAGE_TEMP}${includedir}/linux ${CROSS_DIR}/${TARGET_SYS}/include/
-	cp -pfLR ${STAGE_TEMP}${includedir}/asm ${CROSS_DIR}/${TARGET_SYS}/include/
-	cp -pfLR ${STAGE_TEMP}${includedir}/asm-generic ${CROSS_DIR}/${TARGET_SYS}/include/
 }
============================================================
--- packages/linux-libc-headers/linux-libc-headers_2.6.7.0.bb	36aa0f707b09ec3a7da7cd2fd580fd8610ce3121
+++ packages/linux-libc-headers/linux-libc-headers_2.6.7.0.bb	a9f62e9c41ff4489d4ce3097d04a44c1688c5b9b
@@ -43,12 +43,5 @@ do_stage () {
 	rm -rf ${STAGING_INCDIR}/linux ${STAGING_INCDIR}/asm
 	cp -pfLR include/linux ${STAGING_INCDIR}/
 	cp -pfLR include/asm ${STAGING_INCDIR}/
-	rm -rf ${CROSS_DIR}/${TARGET_SYS}/include/linux
-	rm -rf ${CROSS_DIR}/${TARGET_SYS}/include/asm
-	install -d ${CROSS_DIR}/${TARGET_SYS}/include
-	cp -pfLR include/linux ${CROSS_DIR}/${TARGET_SYS}/include/
-	cp -pfLR include/asm ${CROSS_DIR}/${TARGET_SYS}/include/
-
 	ln -sf ${STAGING_KERNEL_DIR}/include/linux/wireless.h ${STAGING_INCDIR}/linux/wireless.h
-	ln -sf ${STAGING_KERNEL_DIR}/include/linux/wireless.h ${CROSS_DIR}/${TARGET_SYS}/include/linux/wireless.h
 }
============================================================
--- packages/linux-libc-headers/linux-libc-headers_2.6.8.1.bb	ee9cc943eec258d43d921237e72206155ead074d
+++ packages/linux-libc-headers/linux-libc-headers_2.6.8.1.bb	d9d8521f857b98b5a68a1e131113d039c7fe6854
@@ -51,9 +51,4 @@ do_stage () {
 	rm -rf ${STAGING_INCDIR}/linux ${STAGING_INCDIR}/asm
 	cp -pfLR include/linux ${STAGING_INCDIR}/
 	cp -pfLR include/asm ${STAGING_INCDIR}/
-	rm -rf ${CROSS_DIR}/${TARGET_SYS}/include/linux
-	rm -rf ${CROSS_DIR}/${TARGET_SYS}/include/asm
-	install -d ${CROSS_DIR}/${TARGET_SYS}/include
-	cp -pfLR include/linux ${CROSS_DIR}/${TARGET_SYS}/include/
-	cp -pfLR include/asm ${CROSS_DIR}/${TARGET_SYS}/include/
 }



