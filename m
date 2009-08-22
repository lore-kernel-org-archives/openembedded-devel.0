Received: from [69.89.17.211] (helo=outbound-mail-29.bluehost.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <chow.ming@linuxbj.com>) id 1MeupP-00065v-OT
	for openembedded-devel@openembedded.org; Sat, 22 Aug 2009 19:56:36 +0200
Received: (qmail 10141 invoked by uid 0); 22 Aug 2009 17:39:03 -0000
Received: from unknown (HELO host285.hostmonster.com) (74.220.215.85)
	by outboundproxy2.bluehost.com with SMTP; 22 Aug 2009 17:39:03 -0000
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=default; d=linuxbj.com;
	h=Received:Message-ID:Date:From:User-Agent:MIME-Version:To:Subject:References:In-Reply-To:Content-Type:X-Identified-User;
	b=blzNO8FfUp2UNbpX5lbNic1qBF59V/65Y9nZGuMQzCui73QbfcPdTN460iFCTvYLW9t2j2GmIJVDn4rpYVzQJpk5dxyzYzOuP0Qr7OHkUqNIYjkPiw72w9vAB6PObPcF;
Received: from [125.33.189.198] (helo=[192.168.200.199])
	by host285.hostmonster.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <chow.ming@linuxbj.com>)
	id 1MeuYP-0006G8-Rd for openembedded-devel@lists.openembedded.org;
	Sat, 22 Aug 2009 11:39:03 -0600
Message-ID: <4A902D29.2020100@linuxbj.com>
Date: Sun, 23 Aug 2009 01:38:49 +0800
From: =?UTF-8?B?TWluZyBDaG93IOWRqOaYjg==?= <chow.ming@linuxbj.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A8FA9A8.5070106@linuxbj.com>
	<200908220913.35169.holger+oe@freyther.de>
In-Reply-To: <200908220913.35169.holger+oe@freyther.de>
X-Identified-User: {2055:host285.hostmonster.com:linuxbjc:linuxbj.com}
	{sentby:smtp auth 125.33.189.198 authed with
	chow.ming@linuxbj.com}
Subject: Re: [PATCH] added compcache-0.6
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
X-List-Received-Date: Sat, 22 Aug 2009 17:56:36 -0000
Content-Type: multipart/mixed; boundary="------------090909050702040303010308"

--------------090909050702040303010308
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Holger,

Great thanks for your kind advices. I am sorry for mis-squash these 
patches. I reseted my git to original status and applied these patches 
back to form a single commit.

Holger Hans Peter Freyther wrote:
> On Saturday 22 August 2009 10:17:44 Ming Chow 周明 wrote:
>
> Hey Ming,
>
> I love the patch there are quite some problems with it though. Please do not 
> send two patches in one mail. Patchwork does not like it[1], second you have 
> line wrapping in your mail program, which breaks the formatting of the patch, 
> third you seem to add version 0.6 but the checksums.ini is old, and 5th you 
> should look here[2] to try to write a better commit message. I'm sorry for the 
> complication.
>
> love
> 	z.
>
>
> [1] http://patchwork.openembedded.org/patch/980/mbox/
> [2] http://wiki.openembedded.net/index.php/Commit_Policy
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>   


--------------090909050702040303010308
Content-Type: text/x-patch;
 name="0001-compcache-Add-version-0.5-0.6pre3-and-version-0.6.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0001-compcache-Add-version-0.5-0.6pre3-and-version-0.6.patch"

From b09195ba2faa7bbb6becc6314bd7a946187530f8 Mon Sep 17 00:00:00 2001
From: Ming Zhou <chow.ming@linuxbj.com>
Date: Sun, 23 Aug 2009 01:14:39 +0800
Subject: [PATCH] compcache: Add version 0.5+0.6pre3 and version 0.6

* compcache creates RAM based block device (named ramzswap) which acts as swap disk. Pages swapped to this disk are compressed and stored in memory itself.
* Compressing pages and keeping them in RAM virtually increases its capacity. This allows more applications to fit in given amount of memory.
* added modules_install target in top Makefile to fit the automatically modules build process
* added KERNELDIR variable to make 2.6 style KBUILD system work
* modified the Makefile for rzscontrol tool to use cross toolchain instead of local gcc

Signed-off-by: Ming Zhou <chow.ming@linuxbj.com>
---
 conf/checksums.ini                                 |    7 ++++
 .../compcache/000-compcache-KERNELDIR.patch        |   34 ++++++++++++++++++++
 .../001-compcache-rzscontrol-cross-compile.patch   |    9 +++++
 .../compcache/002-compcache-modules-install.patch  |   13 +++++++
 .../compcache/003-compcache-0.6-KERNELDIR.patch    |   31 ++++++++++++++++++
 recipes/compcache/compcache_0.5+0.6pre3.bb         |   29 +++++++++++++++++
 recipes/compcache/compcache_0.6.bb                 |   27 +++++++++++++++
 7 files changed, 150 insertions(+), 0 deletions(-)
 create mode 100644 recipes/compcache/compcache/000-compcache-KERNELDIR.patch
 create mode 100644 recipes/compcache/compcache/001-compcache-rzscontrol-cross-compile.patch
 create mode 100644 recipes/compcache/compcache/002-compcache-modules-install.patch
 create mode 100644 recipes/compcache/compcache/003-compcache-0.6-KERNELDIR.patch
 create mode 100644 recipes/compcache/compcache_0.5+0.6pre3.bb
 create mode 100644 recipes/compcache/compcache_0.6.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 85de9c2..3e9915e 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -28650,3 +28650,10 @@ sha256=f57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af
 md5=5f7b88ebb2bcd7e8044328482d079661
 sha256=f57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af
 
+[http://compcache.googlecode.com/files/compcache-0.6pre3.tar.gz]
+md5=532fbc4e6a8ae0670ec15a49484f313f
+sha256=3e54f26665bd1b7ece4e4621a15f82da66a95bafd04286d447be5a596790a7db
+
+[http://compcache.googlecode.com/files/compcache-0.6.tar.gz]
+md5=0a574643c0eb857b946adcd5d5a22eb0
+sha256=e5f697be6c1b7bfb9ac9ba5b8d836ff20f880c161f998c482caba83caf443c0c
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
diff --git a/recipes/compcache/compcache/003-compcache-0.6-KERNELDIR.patch b/recipes/compcache/compcache/003-compcache-0.6-KERNELDIR.patch
new file mode 100644
index 0000000..98d7e68
--- /dev/null
+++ b/recipes/compcache/compcache/003-compcache-0.6-KERNELDIR.patch
@@ -0,0 +1,31 @@
+--- compcache-0.6/Makefile.orig	2009-08-21 03:15:29.775353453 +0800
++++ compcache-0.6/Makefile	2009-08-21 03:15:49.965346252 +0800
+@@ -1,15 +1,15 @@
+ EXTRA_CFLAGS	:=	-DCONFIG_BLK_DEV_RAMZSWAP_STATS \
+ 			-g -Wall
+ 
+-KERNEL_BUILD_PATH ?= "/lib/modules/$(shell uname -r)/build"
++KERNELDIR ?= "/lib/modules/$(shell uname -r)/build"
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
+@@ -17,7 +17,7 @@
+ 	make -C sub-projects/rzscontrol doc
+ 
+ clean:
+-	make -C $(KERNEL_BUILD_PATH) M=$(PWD) clean
+-	make -C $(KERNEL_BUILD_PATH) M=$(PWD)/sub-projects/allocators/xvmalloc-kmod clean
++	make -C $(KERNELDIR) M=$(PWD) clean
++	make -C $(KERNELDIR) M=$(PWD)/sub-projects/allocators/xvmalloc-kmod clean
+ 	make -C sub-projects/rzscontrol clean
+ 	@rm -rf *.ko
diff --git a/recipes/compcache/compcache_0.5+0.6pre3.bb b/recipes/compcache/compcache_0.5+0.6pre3.bb
new file mode 100644
index 0000000..7cd2997
--- /dev/null
+++ b/recipes/compcache/compcache_0.5+0.6pre3.bb
@@ -0,0 +1,29 @@
+HOMEPAGE = "http://code.google.com/p/compcache"
+DESCRIPTION = "Kernel drivers version 0.6x and related tool for the compcache (compressed in-memory swap device for linux)"
+LICENSE = "GPLv2"
+
+inherit module
+
+SRC_URI = "http://compcache.googlecode.com/files/${PN}-0.6pre3.tar.gz \
+	file://000-compcache-KERNELDIR.patch;patch=1 \
+	file://001-compcache-rzscontrol-cross-compile.patch;patch=1 \
+	file://002-compcache-modules-install.patch;patch=1 \
+	   "
+S = "${WORKDIR}/${PN}-0.6pre3"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+PACKAGES = "kernel-module-compcache compcache-utils compcache-utils-dbg compcache-utils-doc"
+
+FILES_kernel-module-compcache = ${FILES_compcache}
+FILES_compcache-utils = "${bindir}/rzscontrol"
+FILES_compcache-utils-dbg = "${bindir}/.debug/rzscontrol"
+FILES_compcache-utils-doc = "${mandir}/man1/rzscontrol.1"
+
+do_install_prepend() {
+	mkdir -p ${D}${bindir}
+	mkdir -p ${D}${mandir}/man1
+	install -m 0755 ${S}/sub-projects/rzscontrol/rzscontrol ${D}${bindir}
+	install -m 0644 ${S}/sub-projects/rzscontrol/man/rzscontrol.1 ${D}${mandir}/man1
+}
+
diff --git a/recipes/compcache/compcache_0.6.bb b/recipes/compcache/compcache_0.6.bb
new file mode 100644
index 0000000..a24574c
--- /dev/null
+++ b/recipes/compcache/compcache_0.6.bb
@@ -0,0 +1,27 @@
+HOMEPAGE = "http://code.google.com/p/compcache"
+DESCRIPTION = "Kernel drivers version 0.6x and related tool for the compcache (compressed in-memory swap device for linux)"
+LICENSE = "GPLv2"
+
+inherit module
+
+SRC_URI = "http://compcache.googlecode.com/files/${PN}-${PV}.tar.gz \
+	file://003-compcache-0.6-KERNELDIR.patch;patch=1 \
+	file://001-compcache-rzscontrol-cross-compile.patch;patch=1 \
+	file://002-compcache-modules-install.patch;patch=1 \
+	   "
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+PACKAGES = "kernel-module-compcache compcache-utils compcache-utils-dbg compcache-utils-doc"
+
+FILES_kernel-module-compcache = ${FILES_compcache}
+FILES_compcache-utils = "${bindir}/rzscontrol"
+FILES_compcache-utils-dbg = "${bindir}/.debug/rzscontrol"
+FILES_compcache-utils-doc = "${mandir}/man1/rzscontrol.1"
+
+do_install_prepend() {
+	mkdir -p ${D}${bindir}
+	mkdir -p ${D}${mandir}/man1
+	install -m 0755 ${S}/sub-projects/rzscontrol/rzscontrol ${D}${bindir}
+	install -m 0644 ${S}/sub-projects/rzscontrol/man/rzscontrol.1 ${D}${mandir}/man1
+}
+
-- 
1.5.4.3


--------------090909050702040303010308--
