Received: from [209.85.146.177] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1KIZok-0000pR-JM
	for openembedded-devel@openembedded.org; Tue, 15 Jul 2008 03:59:03 +0200
Received: by wa-out-1112.google.com with SMTP id j5so4097123wah.4
	for <openembedded-devel@openembedded.org>;
	Mon, 14 Jul 2008 18:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:reply-to:to
	:content-type:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	bh=Y2Z5Gu+/cSIom0BLAgsBrxeGVebp6Iu+5Wta7GnJzPU=;
	b=hW2iS3sQp43LmY0JPII6ASGHQCTrftZiqV9udSMdm05QjNVSC3FRyW0O4gHm0hyjsi
	fkEROKwZUZmLKP5iqwsbJc1CP+U81iwRF65PXPr+vn0+LVYa+KEejEzaj/5bBn2CHJbm
	OAwHdU+v9utthrtRX21XGIgpsbA3Ep5ApGznw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:reply-to:to:content-type:date:message-id:mime-version
	:x-mailer:content-transfer-encoding;
	b=IFNk16tZp3ICnAITHzPtzX2xHPdERPhDnQH9hmtFWd2HhC2BfldjrcU2m32SF/XF26
	UTHm6rz3YaiFIqJ/8szkW/v6SeCQIqkO6Mty2jf93s0pVbWA3NHReF6Aw5Qess2cpJNU
	nQA/cwegi/3ogP9MQ39X7g1zqJEEtxO46ONmk=
Received: by 10.114.152.17 with SMTP id z17mr478829wad.63.1216087108147;
	Mon, 14 Jul 2008 18:58:28 -0700 (PDT)
Received: from ?192.168.1.71? ( [71.146.10.255])
	by mx.google.com with ESMTPS id m29sm9566031poh.4.2008.07.14.18.58.26
	(version=SSLv3 cipher=RC4-MD5); Mon, 14 Jul 2008 18:58:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
Date: Mon, 14 Jul 2008 18:58:25 -0700
Message-Id: <1216087105.10214.7.camel@isis>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.2 
Subject: [RFC]: Toolchain build sequence alteration.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 15 Jul 2008 01:59:03 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

I have faced a problem which took me a while to understand. I was
working on uclibc and therefore I needed to rebuild uclibc many times
and thats when I saw this issue.

When I rebuilt only uclibc after a complete rebuild. Suddenly in the new
root file system with new uclibc application wont load properly
complaining about missing symbols (symbols were from libgcc like
__aeabi_*)

Looking at it the problem is that right now we build uclibc with a
intermediate compiler(gcc-cross-initial) which is build with
--disable-shared. We use this uclibc and its headers and dev-libs and we
rebuild a fresh full cross-gcc (gcc-cross) with -shared-lib support to
build the rest of system/image.

Therefore the uclibc we build in subsequent time will be build using
cross-gcc and not cross-gcc-initial. 

What happens is that some of the libgcc symbols get linked into
uclibc/libc.so when it is built with a gcc without shared lib
support(gcc-initial). When building whole sytem different
applications(e.g. gawk) which need these symbols link as if they will
get these symbols from libc.so at runtime, which is correct if I ran
with the first time build uclibc but when I rebuilt just uclibc all
these symbols were not being resolved by ld.so because there were no
DT_NEEDED entry for libgcc_s.so in the application binary as it was
build to get these symbols from libc.so, but rebuilt uclibc now do not
export these symbols because it was built with a compiler that supports
shared-libs(cross-gcc).

Then I went to see the toolchain build order. Currently we do

cross-binutils -> kernel-headers -> uclibc-headers -> cross-gcc
(--disable-shared) -> uclibc -> cross-gcc

I think this can be improved and I implemented the following steps.

cross-binutils -> cross-gcc (--disable-shared) -> kernel-headers ->
eglibc/glibc/uclibc headers + startup files + dummy libc.so -> cross-gcc
(--enable-shared) -> glibc/eglibc/uclibc -> cross-gcc

These steps work same for uclibc as well as glibc/eglibc toolchains
irrespective of architectures.

These steps work for both NPTL and LinuxThreads toolchains. 

Given we use these steps, we will have same toolchain build sequence in
all circumstances and will help to reduce the current complex toolchain
builds we have.

We will not need glibc-intermediate step and we will introduce a new
step called cross-gcc-intermidiate.

I have so far tested this sequence on arm uclibc and it works well and
understandably solves the issue I am seeing.

I have used this sequence in external scripts to build toolchains too
and it has worked well.

Now, I have a prototype patch for uclibc-0.9.29+gcc-4.2.4 based
toolchain which I am attaching here.

If we agree on this aproach I can go ahead and do the same for
eglibc/glibc toolchains too.

I have not tested it on older compiler/library combinations but I think
it will work there too as I have build various combinations in the past
with same sequence outside OE.

Comments and feedback is welcome.

Thanks

-Khem


#
# old_revision [7131f28196073180061901d8749502f5acea9a0b]
#
# add_file "packages/gcc/gcc-cross-intermediate.inc"
#  content [4b265f0f3a4cb31194b9db1bdbf28b9290477fbe]
# 
# add_file "packages/gcc/gcc-cross-intermediate_4.2.4.bb"
#  content [90a8bfb6cf14f9e38af8a574b9b5fa9d55ccadd4]
# 
# patch "packages/uclibc/uclibc-initial_0.9.29.bb"
#  from [d9cf01fb4dec69ff1f796d39c9078030982eacca]
#    to [af0ccde83d59f1948f1f2b5f7d4952d4855c58bc]
# 
# patch "packages/uclibc/uclibc.inc"
#  from [48b0ba2e4cff05071b3b812ef0be0861870cd00c]
#    to [02fc716a2db98034113d1e097f762628043fc160]
# 
# patch "packages/uclibc/uclibc_0.9.29.bb"
#  from [cbf70d92d0ec5221de098ec3bc7f8ad20c014b7a]
#    to [51f2e05afbbfa8d6e33ce71de586575aef222765]
#
============================================================
--- packages/gcc/gcc-cross-intermediate.inc	4b265f0f3a4cb31194b9db1bdbf28b9290477fbe
+++ packages/gcc/gcc-cross-intermediate.inc	4b265f0f3a4cb31194b9db1bdbf28b9290477fbe
@@ -0,0 +1,21 @@
+DEPENDS = "virtual/${TARGET_PREFIX}binutils"
+# @todo Please add comment on why this is (still?) needed?
+DEPENDS += "virtual/${TARGET_PREFIX}libc-initial"
+PROVIDES = "virtual/${TARGET_PREFIX}gcc-intermediate"
+PACKAGES = ""
+
+# This is intended to be a -very- basic config
+# sysroot is needed in case we use libc-initial
+EXTRA_OECONF = "--with-local-prefix=${STAGING_DIR_TARGET}${layout_prefix} \
+		--enable-shared \
+		--disable-multilib \
+		--enable-languages=c \
+		--enable-target-optspace \
+		--program-prefix=${TARGET_PREFIX} \
+		--with-sysroot=${STAGING_DIR_TARGET} \
+		--with-build-sysroot=${STAGING_DIR_TARGET} \
+		${@get_gcc_fpu_setting(bb, d)}"
+
+do_install () {
+	:
+}
============================================================
--- packages/gcc/gcc-cross-intermediate_4.2.4.bb	90a8bfb6cf14f9e38af8a574b9b5fa9d55ccadd4
+++ packages/gcc/gcc-cross-intermediate_4.2.4.bb	90a8bfb6cf14f9e38af8a574b9b5fa9d55ccadd4
@@ -0,0 +1,5 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
+
+EXTRA_OECONF += "--disable-libmudflap --disable-libgomp \
+		--disable-libssp"
============================================================
--- packages/uclibc/uclibc-initial_0.9.29.bb	d9cf01fb4dec69ff1f796d39c9078030982eacca
+++ packages/uclibc/uclibc-initial_0.9.29.bb	af0ccde83d59f1948f1f2b5f7d4952d4855c58bc
@@ -3,7 +3,7 @@ FILESPATH = "${@base_set_filespath([ '${
 
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${PV}', '${FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
 
-DEPENDS = "linux-libc-headers ncurses-native"
+DEPENDS = "linux-libc-headers ncurses-native virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
 PACKAGES = ""
 
@@ -11,13 +11,20 @@ do_stage() {
 	# Install initial headers into the cross dir
 	make PREFIX= DEVEL_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
 		RUNTIME_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
-		pregen install_dev
+		install_headers
+	make PREFIX= DEVEL_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
+		RUNTIME_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
+		lib/crt1.o lib/crti.o lib/crtn.o
 
 	install -d ${CROSS_DIR}/${TARGET_SYS}	
 	ln -sf include ${CROSS_DIR}/${TARGET_SYS}/sys-include
 
 	# This conflicts with the c++ version of this header
 	rm -f ${UCLIBC_STAGE_PREFIX}/include/bits/atomicity.h
+	install -m 644 lib/crt[1in].o ${UCLIBC_STAGE_PREFIX}/lib
+	${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
+		-o ${UCLIBC_STAGE_PREFIX}/lib/libc.so
+
 }
 
 do_install() {
============================================================
--- packages/uclibc/uclibc.inc	48b0ba2e4cff05071b3b812ef0be0861870cd00c
+++ packages/uclibc/uclibc.inc	02fc716a2db98034113d1e097f762628043fc160
@@ -19,12 +19,6 @@ python __anonymous () {
                                    bb.data.getVar('TARGET_OS', d, 1))
 }
 
-PROVIDES += "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
-PROVIDES += "${@['virtual/libiconv', ''][bb.data.getVar('USE_NLS', d, 1) != 'yes']}"
-DEPENDS = "virtual/${TARGET_PREFIX}binutils \
-	   virtual/${TARGET_PREFIX}gcc-initial linux-libc-headers ncurses-native"
-RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
-
 # Blackfin needs a wrapper around ld
 DEPENDS_append_bfin = " elf2flt "
 
============================================================
--- packages/uclibc/uclibc_0.9.29.bb	cbf70d92d0ec5221de098ec3bc7f8ad20c014b7a
+++ packages/uclibc/uclibc_0.9.29.bb	51f2e05afbbfa8d6e33ce71de586575aef222765
@@ -11,9 +11,12 @@ require uclibc.inc
 DEFAULT_PREFERENCE = "3"
 
 require uclibc.inc
+PROVIDES += "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
+PROVIDES += "${@['virtual/libiconv', ''][bb.data.getVar('USE_NLS', d, 1) != 'yes']}"
+DEPENDS = "virtual/${TARGET_PREFIX}binutils \
+           virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers ncurses-native"
+RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
 
-PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
-
 SRC_URI += "file://uClibc.machine file://uClibc.distro \
 	    file://errno_values.h.patch;patch=1 \
 	    file://termios.h.patch;patch=1 \




