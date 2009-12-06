Received: from mail-ew0-f224.google.com ([209.85.219.224])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NHPsK-0000a6-1P
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 23:46:47 +0100
Received: by ewy24 with SMTP id 24so4866271ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 14:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=496jp8i9C2fk8FCgP16MFmNHqkUBASwNMCV6bVcy8c0=;
	b=MBjtvFPSe24O/43HVHrQAIjF8iK2x5YQWf7fExYtqAvmIkSh8yWf7f9IiZL2L4op8W
	wRzuSClg8IuiSuuPnhM/wiVsQHNaNJOHeF4xAVJbwEtBLGLZiiWKMAtJZRO/vDZrmsct
	ZMVImRz2YUdll8KOfasm5utTJkONXABQzT/xw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=apNm5AO3p8+K5vZNRumCzeMAf98P1EkkGlt1hb3QTGqpASupoRE1gX2DN0MaT9Ew/x
	dhBHbhMxPAT1Zr1MzWrnHYCZxl4yP1zNbUVtXFRgypMJle6u4h5f2hPE5RB38kCBfXDL
	BOpFigP57nkaH17yC0MyUFIXgQMMTp1hx5ZVg=
Received: by 10.213.110.9 with SMTP id l9mr6291152ebp.14.1260139505259;
	Sun, 06 Dec 2009 14:45:05 -0800 (PST)
Received: from localhost.localdomain (82-171-51-231.ip.telfort.nl
	[82.171.51.231])
	by mx.google.com with ESMTPS id 15sm3113864ewy.12.2009.12.06.14.45.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Dec 2009 14:45:04 -0800 (PST)
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Dec 2009 23:44:40 +0100
Message-Id: <1260139496-21442-5-git-send-email-leon@sidebranch.com>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1260139496-21442-4-git-send-email-leon@sidebranch.com>
References: <1260139496-21442-1-git-send-email-leon@sidebranch.com>
	<1260139496-21442-2-git-send-email-leon@sidebranch.com>
	<1260139496-21442-3-git-send-email-leon@sidebranch.com>
	<1260139496-21442-4-git-send-email-leon@sidebranch.com>
X-SA-Exim-Connect-IP: 209.85.219.224
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Leon Woestenberg <leon@sidebranch.com>
Subject: [PATCH] binutils-cross.inc: Stage libiberty.h for elf2flt linker wrapper.
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
X-List-Received-Date: Sun, 06 Dec 2009 22:46:47 -0000

For non-MMU targets, the binutils linker is wrapped by elf2flt,
which converts ELF into a flat memory space file.

The elf2flt-cross tool needs libiberty staged. This patch stages
the header file. The library seems staged into cross elsewhere,
although it is vague under old packaged-staging how exactly.

Tested-by: Walter Goossens <walter.goossens@axon.tv>
Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
---
 conf/distro/angstrom-2008.1.conf        |    2 +-
 conf/distro/include/angstrom-uclibc.inc |    2 +-
 recipes/binutils/binutils-cross.inc     |    3 +++
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
index abc9a93..51d8242 100644
--- a/conf/distro/angstrom-2008.1.conf
+++ b/conf/distro/angstrom-2008.1.conf
@@ -79,7 +79,7 @@ PREFERRED_VERSION_linux-handhelds-2.6 ?= "2.6.21-hh20"
 #KERNEL_INITRAMFS_PATH = "${KERNEL_INITRAMFS_DIR}/$(readlink ${KERNEL_INITRAMFS_DIR}initramfs-bootmenu-image-${MACHINE}.cpio.gz)"
 
 #This is unrelated to the kernel version, but userspace apps (e.g. HAL) require a recent version to build against
-PREFERRED_VERSION_linux-libc-headers 	= "2.6.31"
+PREFERRED_VERSION_linux-libc-headers 	?= "2.6.31"
 
 #Prefer glibc 2.6 and uclibc 0.9.30, these have had the most testing.
 PREFERRED_VERSION_glibc 		?= "2.9"
diff --git a/conf/distro/include/angstrom-uclibc.inc b/conf/distro/include/angstrom-uclibc.inc
index 004d904..e49d078 100644
--- a/conf/distro/include/angstrom-uclibc.inc
+++ b/conf/distro/include/angstrom-uclibc.inc
@@ -27,7 +27,7 @@ BUILD_OPTIMIZATION = "-O2 -ggdb3"
 #Note that this testing was done without the gcc-pr32889.patch.
 FULL_OPTIMIZATION_avr32 = "-Os -fomit-frame-pointer"
 
-TARGET_LINK_HASH_STYLE = "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH',d,1) in ['mips', 'mipsel', 'avr32']]}"
+TARGET_LINK_HASH_STYLE = "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH',d,1) in ['mips', 'mipsel', 'avr32', 'nios2']]}"
 
 CXXFLAGS += "-fvisibility-inlines-hidden"
 
diff --git a/recipes/binutils/binutils-cross.inc b/recipes/binutils/binutils-cross.inc
index 5808c1f..a113f7e 100644
--- a/recipes/binutils/binutils-cross.inc
+++ b/recipes/binutils/binutils-cross.inc
@@ -11,6 +11,9 @@ EXTRA_OECONF = "--with-sysroot=${STAGING_DIR_TARGET} \
 do_stage () {
 	oe_runmake install
 
+	install -d ${CROSS_DIR}/include
+	install -m 0644 ${S}/include/libiberty.h ${CROSS_DIR}/include
+
 	# We don't really need these, so we'll remove them...
 	rm -rf ${CROSS_DIR}/lib/ldscripts
 	rm -rf ${CROSS_DIR}/share/info
-- 
1.6.0.4



