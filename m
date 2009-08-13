Received: from [67.222.39.26] (helo=outbound-mail-136.bluehost.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <chow.ming@linuxbj.com>) id 1Mbfwk-0001CF-HI
	for openembedded-devel@openembedded.org; Thu, 13 Aug 2009 21:26:46 +0200
Received: (qmail 28992 invoked by uid 0); 13 Aug 2009 19:10:13 -0000
Received: from unknown (HELO host285.hostmonster.com) (74.220.215.85)
	by outboundproxy4.bluehost.com with SMTP; 13 Aug 2009 19:10:13 -0000
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=default; d=linuxbj.com;
	h=Received:Message-ID:Date:From:User-Agent:MIME-Version:To:Subject:Content-Type:X-Identified-User;
	b=KZtq29be7Uz8bmrJximaG/Vks+xaWGwCgTKQu7XRT64ibRMsyEXdQfxmuHD2GiLLtdkN0ETVKOxYAieWgxOgHy69oJqpCs/lNaVpAjEdWq0HIN9Ehq51+OFkeO/ZsXNn;
Received: from [222.131.143.214] (helo=[192.168.200.199])
	by host285.hostmonster.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <chow.ming@linuxbj.com>)
	id 1Mbfgi-0002s9-3F for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 13:10:13 -0600
Message-ID: <4A84650F.1080902@linuxbj.com>
Date: Fri, 14 Aug 2009 03:10:07 +0800
From: =?UTF-8?B?TWluZyBDaG93IOWRqOaYjg==?= <chow.ming@linuxbj.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090608)
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Identified-User: {2055:host285.hostmonster.com:linuxbjc:linuxbj.com}
	{sentby:smtp auth 222.131.143.214 authed with
	chow.ming@linuxbj.com}
Subject: patch for compcache recipe
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
X-List-Received-Date: Thu, 13 Aug 2009 19:26:47 -0000
Content-Type: multipart/mixed; boundary="------------080606070804010300000806"

--------------080606070804010300000806
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I have tried compcache from code.google.com on beagleboard rev B5 and 
n800 for a couple of weeks. It seems helping me getting more usable memory.
The patch will add compcache stuff which provides both compcache kernel 
modules and managing tool.
Tested with recent oe repo on my boards, more evaluation on various real 
hardware platforms needed though.
BTW not touched checksum.ini for the tarball yet.

Cheers,

Zhou Ming



--------------080606070804010300000806
Content-Type: text/x-patch;
 name="patch-compcache-0.6pre3.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-compcache-0.6pre3.diff"

diff --git a/recipes/compcache/compcache/000-compcache-KERNELDIR.patch b/recipes/compcache/compcache/000-compcache-KERNELDIR.patch
new file mode 100644
index 0000000..e80f75b
--- /dev/null
+++ b/recipes/compcache/compcache/000-compcache-KERNELDIR.patch
@@ -0,0 +1,34 @@
+--- compcache-0.6pre3/Makefile.orig	2009-08-14 00:25:45.904934007 +0800
++++ compcache-0.6pre3/Makefile	2009-08-14 00:25:58.404938574 +0800
+@@ -1,17 +1,17 @@
+ EXTRA_CFLAGS	:=	-DCONFIG_BLK_DEV_RAMZSWAP_STATS \
+ 			-g -Wall
+ 
+-ifndef $(KERNEL_BUILD_PATH)
+-	KERNEL_BUILD_PATH="/lib/modules/$(shell uname -r)/build"
++ifndef $(KERNELDIR)
++	KERNELDIR="/lib/modules/$(shell uname -r)/build"
+ endif
+ 
+ obj-m	+=	sub-projects/allocators/xvmalloc-kmod/xvmalloc.o \
+ 		ramzswap.o
+ 
+ all:
+-	make -C $(KERNEL_BUILD_PATH) \
++	make -C $(KERNELDIR) \
+ 		M=$(PWD)/sub-projects/allocators/xvmalloc-kmod modules
+-	make -C $(KERNEL_BUILD_PATH) M=$(PWD) modules
++	make -C $(KERNELDIR) M=$(PWD) modules
+ 	make -C sub-projects/rzscontrol
+ 	@ln -sf sub-projects/allocators/xvmalloc-kmod/xvmalloc.ko
+ 
+@@ -19,7 +19,7 @@
+ 	make -C sub-projects/rzscontrol doc
+ 
+ clean:
+-	make -C $(KERNEL_BUILD_PATH) M=$(PWD) clean
+-	make -C $(KERNEL_BUILD_PATH) M=$(PWD)/sub-projects/allocators/xvmalloc-kmod clean
++	make -C $(KERNELDIR) M=$(PWD) clean
++	make -C $(KERNELDIR) M=$(PWD)/sub-projects/allocators/xvmalloc-kmod clean
+ 	make -C sub-projects/rzscontrol clean
+ 	@rm -rf *.ko
diff --git a/recipes/compcache/compcache/001-compcache-rzscontrol-cross-compile.patch b/recipes/compcache/compcache/001-compcache-rzscontrol-cross-compile.patch
new file mode 100644
index 0000000..8dbb590
--- /dev/null
+++ b/recipes/compcache/compcache/001-compcache-rzscontrol-cross-compile.patch
@@ -0,0 +1,9 @@
+--- compcache-0.6pre3.orig/sub-projects/rzscontrol/Makefile	2009-08-06 23:27:40.000000000 +0800
++++ compcache-0.6pre3/sub-projects/rzscontrol/Makefile	2009-08-14 00:19:38.374938229 +0800
+@@ -1,5 +1,5 @@
+ all:
+-	@gcc -g -Wall -D_GNU_SOURCE rzscontrol.c -o rzscontrol -I ../include -I../..
++	${CCLD} -g -Wall -D_GNU_SOURCE rzscontrol.c -o rzscontrol -I ../include -I../..
+ 
+ doc:
+ 	@xmllint --noout --valid man/rzscontrol.xml
diff --git a/recipes/compcache/compcache/002-compcache-modules-install.patch b/recipes/compcache/compcache/002-compcache-modules-install.patch
new file mode 100644
index 0000000..cf9b9b1
--- /dev/null
+++ b/recipes/compcache/compcache/002-compcache-modules-install.patch
@@ -0,0 +1,13 @@
+--- compcache-0.6pre3/Makefile.orig	2009-08-14 02:33:45.169249060 +0800
++++ compcache-0.6pre3/Makefile	2009-08-14 02:34:15.594938335 +0800
+@@ -13,7 +13,9 @@
+ 		M=$(PWD)/sub-projects/allocators/xvmalloc-kmod modules
+ 	make -C $(KERNELDIR) M=$(PWD) modules
+ 	make -C sub-projects/rzscontrol
+-	@ln -sf sub-projects/allocators/xvmalloc-kmod/xvmalloc.ko
++
++modules_install:
++	make -C $(KERNELDIR) M=$(PWD) modules_install
+ 
+ doc:
+ 	make -C sub-projects/rzscontrol doc
diff --git a/recipes/compcache/compcache_0.6pre3.bb b/recipes/compcache/compcache_0.6pre3.bb
new file mode 100644
index 0000000..0b59815
--- /dev/null
+++ b/recipes/compcache/compcache_0.6pre3.bb
@@ -0,0 +1,28 @@
+HOMEPAGE = "http://code.google.com/p/compcache"
+DESCRIPTION = "Kernel drivers version 0.6x and related tool for the compcache (compressed in-memory swap device for linux)"
+LICENSE = "GPLv2"
+
+inherit module
+
+SRC_URI = "http://compcache.googlecode.com/files/compcache-${PV}.tar.gz \
+	file://000-compcache-KERNELDIR.patch;patch=1 \
+	file://001-compcache-rzscontrol-cross-compile.patch;patch=1 \
+	file://002-compcache-modules-install.patch;patch=1 \
+	   "
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+PACKAGES = "compcache-modules rzscontrol rzscontrol-dbg rzscontrol-doc"
+
+FILES_compcache-modules = ${FILES_compcache}
+FILES_rzscontrol = "${bindir}/rzscontrol"
+FILES_rzscontrol-dbg = "${bindir}/.debug/rzscontrol"
+FILES_rzscontrol-doc = "${mandir}/man1/rzscontrol.1"
+
+do_install_prepend() {
+	mkdir -p ${D}${bindir}
+	mkdir -p ${D}${mandir}/man1
+	install -m 0755 ${S}/sub-projects/rzscontrol/rzscontrol ${D}${bindir}
+	install -m 0644 ${S}/sub-projects/rzscontrol/man/rzscontrol.1 ${D}${mandir}/man1
+}
+

--------------080606070804010300000806--
