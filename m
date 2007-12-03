Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1IyzFc-0002Um-M4
	for openembedded-devel@openembedded.org; Mon, 03 Dec 2007 01:33:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lB30U9af020099;
	Mon, 3 Dec 2007 00:30:09 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20074-01; Mon,  3 Dec 2007 00:30:06 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lB30U2XU020084
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Mon, 3 Dec 2007 00:30:02 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: angstrom-distro-devel <angstrom-distro-devel@linuxtogo.org>
Date: Mon, 03 Dec 2007 00:30:01 +0000
Message-Id: <1196641802.6648.31.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Angstrom builds with prebuilt meta-toolchain output
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
X-List-Received-Date: Mon, 03 Dec 2007 00:33:33 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

This is something I experimented a bit with and wondered if anyone else
was interested in it. I just added external-toolchain.bb to OE which
allows a meta-toolchain generated toolchain to be used by OE instead of
building its own.

The attached patch adds the notion of different toolchains to angstrom,
by default it uses the one specified by the DISTRO_VERSION_MAJOR
variable I added but with ANGSTROM_TOOLCHAIN = "external" use a
pre-supplied toolchain.

I don't know if Angstrom want to support this or not but this should at
least show its possible and document how to do it. The patch shouldn't
be committed in its current form as it needs a 2008-1 version file
adding. Some of the PREFRERRED_VERSION statements related to the
toolchain might also move to the toolchain definition files too but I
have no strong opinions on that.

I was able to generate an external toolchain and then use that to make a
minimal-image, I haven't tested further.

It is also I admit slightly glibc specific. We have to start somewhere
though :).

Cheers,

Richard

============================================================
--- conf/distro/include/angstrom-default-2007-9.inc	f9cdd509d3e8a85e5b4117e9b0d3ece1c04d66e4
+++ conf/distro/include/angstrom-default-2007-9.inc	f9cdd509d3e8a85e5b4117e9b0d3ece1c04d66e4
@@ -0,0 +1,16 @@
+
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc_avr32 = "avr32-gcc-cross"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "gcc-cross-initial"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "gcc-cross"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "gcc-cross"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc               = "glibc-intermediate"
+PREFERRED_PROVIDER_virtual/arm-angstrom-linux-gnueabi-libc-for-gcc    = "glibc-intermediate"
+PREFERRED_PROVIDER_virtual/armeb-angstrom-linux-gnueabi-libc-for-gcc  = "glibc-intermediate"
+PREFERRED_PROVIDER_virtual/arm-angstrom-linux-libc-for-gcc            = "glibc-intermediate"
+PREFERRED_PROVIDER_virtual/powerpc-angstrom-linux-libc-for-gcc        = "glibc-intermediate"
+PREFERRED_PROVIDER_virtual/mipsel-angstrom-linux-libc-for-gcc         = "glibc-intermediate"
+PREFERRED_PROVIDER_virtual/sparc-angstrom-linux-libc-for-gcc          = "glibc-intermediate"
+
+PREFERRED_PROVIDER_virtual/arm-angstrom-linux-uclibcgnueabi-libc-for-gcc    = "uclibc-initial"
+PREFERRED_PROVIDER_virtual/armeb-angstrom-linux-uclibcgnueabi-libc-for-gcc  = "uclibc-initial"
+
============================================================
--- conf/distro/include/angstrom-external.inc	687cb8b10a08398a7399e9233ad4047a9398fb06
+++ conf/distro/include/angstrom-external.inc	687cb8b10a08398a7399e9233ad4047a9398fb06
@@ -0,0 +1,21 @@
+#
+# Configuration to use a toolchain built by meta-toolchain.bb
+#
+
+EXTERNAL_TOOLCHAIN = "${SDK_PREFIX}"
+
+PATH =. "${EXTERNAL_TOOLCHAIN}/bin:"
+
+PREFERRED_PROVIDER_linux-libc-headers = "external-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "external-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "external-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "external-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "external-toolchain"
+PREFERRED_PROVIDER_virtual/libc = "external-toolchain"
+PREFERRED_PROVIDER_virtual/libintl = "external-toolchain"
+PREFERRED_PROVIDER_virtual/libiconv = "external-toolchain"
+PREFERRED_PROVIDER_glibc-thread-db = "external-toolchain"
+PREFERRED_PROVIDER_virtual/linux-libc-headers = "external-toolchain"
+
+TARGET_CPPFLAGS_prepend = " -isystem${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/include "
+TARGET_LDFLAGS_prepend = " -L${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/lib -Wl,-rpath-link,${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/lib "
============================================================
--- conf/distro/angstrom-2007.1.conf	c6bbfa10816eda24513e92b21827c75003bb4daa
+++ conf/distro/angstrom-2007.1.conf	f4b119ae734b56cba69d3263d186c7a2f82748d4
@@ -8,6 +8,7 @@ DISTRO_VERSION = "2007.9-test-${DATE}"
 
 #DISTRO_VERSION = "2007.9"
 DISTRO_VERSION = "2007.9-test-${DATE}"
+DISTRO_VERSION_MAJOR = "2007-9"
 DISTRO_REVISION = "46"
 
 require conf/distro/include/sane-srcdates.inc
@@ -106,7 +107,6 @@ PREFERRED_VERSION_binutils-cross-sdk ?= 
 PREFERRED_VERSION_binutils-cross-sdk ?= "2.18"
 
 #avr32 only has patches for binutils 2.17 and gcc 4.1.2 in OE
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc_avr32 = "avr32-gcc-cross"
 PREFERRED_VERSION_avr32-gcc               = "4.1.2"
 PREFERRED_VERSION_avr32-gcc-cross         = "4.1.2"
 PREFERRED_VERSION_gcc-cross-sdk_avr32     = "4.0.2"
@@ -147,23 +147,6 @@ require conf/distro/include/preferred-e-
 require conf/distro/include/preferred-e-versions.inc
 
 
-# Virtuals:
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "gcc-cross-initial"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "gcc-cross"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "gcc-cross"
-
-#Set preferred provider for the C library that is used to build the crosscompiler (NPTL voodoo)
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc               = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/arm-angstrom-linux-gnueabi-libc-for-gcc    = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/armeb-angstrom-linux-gnueabi-libc-for-gcc  = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/arm-angstrom-linux-libc-for-gcc            = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/powerpc-angstrom-linux-libc-for-gcc        = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/mipsel-angstrom-linux-libc-for-gcc         = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/sparc-angstrom-linux-libc-for-gcc          = "glibc-intermediate"
-
-PREFERRED_PROVIDER_virtual/arm-angstrom-linux-uclibcgnueabi-libc-for-gcc    = "uclibc-initial"
-PREFERRED_PROVIDER_virtual/armeb-angstrom-linux-uclibcgnueabi-libc-for-gcc  = "uclibc-initial"
-
 # hostap stuff, we prefer the in-kernel modules, but those don't work for all machines
 PREFERRED_PROVIDER_hostap-conf                      ?= "hostap-conf"
 PREFERRED_PROVIDER_hostap-modules_h2200             ?= "hostap-modules"
============================================================
--- conf/distro/include/angstrom.inc	fbec2661b476213454b69adc6d89a7b5be329d4d
+++ conf/distro/include/angstrom.inc	5381a13691569036f8c1d2cf932cd1d536a6d909
@@ -13,6 +13,10 @@ require conf/distro/include/angstrom-${A
 DEPLOY_DIR = "${TMPDIR}/deploy/${ANGSTROM_MODE}"
 require conf/distro/include/angstrom-${ANGSTROM_MODE}.inc
 
+# Include the toolchain definitions
+ANGSTROM_TOOLCHAIN ?= "default-${DISTRO_VERSION_MAJOR}"
+require conf/distro/include/angstrom-${ANGSTROM_TOOLCHAIN}.inc
+
 #Use this variable in feeds and other parts that need a URI
 ANGSTROM_URI ?= "http://www.angstrom-distribution.org"
 




