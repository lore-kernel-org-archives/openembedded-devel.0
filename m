Received: from [69.89.21.15] (helo=outbound-mail-05.bluehost.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <chow.ming@linuxbj.com>) id 1Mem4O-0003hW-GV
	for openembedded-devel@openembedded.org; Sat, 22 Aug 2009 10:35:29 +0200
Received: (qmail 13774 invoked by uid 0); 22 Aug 2009 08:17:58 -0000
Received: from unknown (HELO host285.hostmonster.com) (74.220.215.85)
	by outboundproxy1.bluehost.com with SMTP; 22 Aug 2009 08:17:58 -0000
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=default; d=linuxbj.com;
	h=Received:Message-ID:Date:From:User-Agent:MIME-Version:To:Subject:Content-Type:Content-Transfer-Encoding:X-Identified-User;
	b=oV86/QA2nNOcy23Vw4oWUp8GpiUtNsSqk78Ug16nNyD5q7C/XbK8bR28jmr0yeldzgz1TeuDdneTBhbO8DrKjQ59MQvVUP9/MCq3qqaf4gUaPoGMdisxjLj+qoWS0ZJi;
Received: from [125.33.189.198] (helo=[192.168.200.199])
	by host285.hostmonster.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <chow.ming@linuxbj.com>)
	id 1MelnQ-0007wG-8V for openembedded-devel@lists.openembedded.org;
	Sat, 22 Aug 2009 02:17:58 -0600
Message-ID: <4A8FA9A8.5070106@linuxbj.com>
Date: Sat, 22 Aug 2009 16:17:44 +0800
From: =?UTF-8?B?TWluZyBDaG93IOWRqOaYjg==?= <chow.ming@linuxbj.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Identified-User: {2055:host285.hostmonster.com:linuxbjc:linuxbj.com}
	{sentby:smtp auth 125.33.189.198 authed with
	chow.ming@linuxbj.com}
Subject: [PATCH] added compcache-0.6
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
X-List-Received-Date: Sat, 22 Aug 2009 08:35:29 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Signed-off-by: Ming Zhou <chow.ming@linuxbj.com>
---
 .../compcache/003-compcache-0.6-KERNELDIR.patch    |   31 
++++++++++++++++++++
 recipes/compcache/compcache_0.6.bb                 |   27 +++++++++++++++++
 2 files changed, 58 insertions(+), 0 deletions(-)
 create mode 100644 
recipes/compcache/compcache/003-compcache-0.6-KERNELDIR.patch
 create mode 100644 recipes/compcache/compcache_0.6.bb

diff --git 
a/recipes/compcache/compcache/003-compcache-0.6-KERNELDIR.patch 
b/recipes/compcache/compcache/003-compcache-0.6-KERNELDIR.patch
new file mode 100644
index 0000000..98d7e68
--- /dev/null
+++ b/recipes/compcache/compcache/003-compcache-0.6-KERNELDIR.patch
@@ -0,0 +1,31 @@
+--- compcache-0.6/Makefile.orig    2009-08-21 03:15:29.775353453 +0800
++++ compcache-0.6/Makefile    2009-08-21 03:15:49.965346252 +0800
+@@ -1,15 +1,15 @@
+ EXTRA_CFLAGS    :=    -DCONFIG_BLK_DEV_RAMZSWAP_STATS \
+             -g -Wall
+
+-KERNEL_BUILD_PATH ?= "/lib/modules/$(shell uname -r)/build"
++KERNELDIR ?= "/lib/modules/$(shell uname -r)/build"
+
+ obj-m    +=    sub-projects/allocators/xvmalloc-kmod/xvmalloc.o \
+         ramzswap.o
+
+ all:
+-    make -C $(KERNEL_BUILD_PATH) \
++    make -C $(KERNELDIR) \
+         M=$(PWD)/sub-projects/allocators/xvmalloc-kmod modules
+-    make -C $(KERNEL_BUILD_PATH) M=$(PWD) modules
++    make -C $(KERNELDIR) M=$(PWD) modules
+     make -C sub-projects/rzscontrol
+     @ln -sf sub-projects/allocators/xvmalloc-kmod/xvmalloc.ko
+
+@@ -17,7 +17,7 @@
+     make -C sub-projects/rzscontrol doc
+
+ clean:
+-    make -C $(KERNEL_BUILD_PATH) M=$(PWD) clean
+-    make -C $(KERNEL_BUILD_PATH) 
M=$(PWD)/sub-projects/allocators/xvmalloc-kmod clean
++    make -C $(KERNELDIR) M=$(PWD) clean
++    make -C $(KERNELDIR) 
M=$(PWD)/sub-projects/allocators/xvmalloc-kmod clean
+     make -C sub-projects/rzscontrol clean
+     @rm -rf *.ko
diff --git a/recipes/compcache/compcache_0.6.bb 
b/recipes/compcache/compcache_0.6.bb
new file mode 100644
index 0000000..a24574c
--- /dev/null
+++ b/recipes/compcache/compcache_0.6.bb
@@ -0,0 +1,27 @@
+HOMEPAGE = "http://code.google.com/p/compcache"
+DESCRIPTION = "Kernel drivers version 0.6x and related tool for the 
compcache (compressed in-memory swap device for linux)"
+LICENSE = "GPLv2"
+
+inherit module
+
+SRC_URI = "http://compcache.googlecode.com/files/${PN}-${PV}.tar.gz \
+    file://003-compcache-0.6-KERNELDIR.patch;patch=1 \
+    file://001-compcache-rzscontrol-cross-compile.patch;patch=1 \
+    file://002-compcache-modules-install.patch;patch=1 \
+       "
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+PACKAGES = "kernel-module-compcache compcache-utils compcache-utils-dbg 
compcache-utils-doc"
+
+FILES_kernel-module-compcache = ${FILES_compcache}
+FILES_compcache-utils = "${bindir}/rzscontrol"
+FILES_compcache-utils-dbg = "${bindir}/.debug/rzscontrol"
+FILES_compcache-utils-doc = "${mandir}/man1/rzscontrol.1"
+
+do_install_prepend() {
+    mkdir -p ${D}${bindir}
+    mkdir -p ${D}${mandir}/man1
+    install -m 0755 ${S}/sub-projects/rzscontrol/rzscontrol ${D}${bindir}
+    install -m 0644 ${S}/sub-projects/rzscontrol/man/rzscontrol.1 
${D}${mandir}/man1
+}
+
-- 
1.5.4.3


 From 6a2d9f113117436e2a6fccec5b067b593f354033 Mon Sep 17 00:00:00 2001
From: Ming Zhou <chow.ming@linuxbj.com>
Date: Sat, 22 Aug 2009 16:11:37 +0800
Subject: [PATCH] added compcache-0.6 checksum entry


Signed-off-by: Ming Zhou <chow.ming@linuxbj.com>
---
 conf/checksums.ini |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 12e5642..1928a87 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -28654,3 +28654,6 @@ 
sha256=f57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af
 md5=532fbc4e6a8ae0670ec15a49484f313f
 sha256=3e54f26665bd1b7ece4e4621a15f82da66a95bafd04286d447be5a596790a7db
 
+[http://compcache.googlecode.com/files/compcache-0.6pre3.tar.gz]
+md5=0a574643c0eb857b946adcd5d5a22eb0
+sha256=e5f697be6c1b7bfb9ac9ba5b8d836ff20f880c161f998c482caba83caf443c0c
-- 
1.5.4.3



