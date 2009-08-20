Received: from [69.89.22.10] (helo=outbound-mail-110.bluehost.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <chow.ming@linuxbj.com>) id 1MdwrC-00069j-Mj
	for openembedded-devel@openembedded.org; Thu, 20 Aug 2009 03:54:29 +0200
Received: (qmail 23005 invoked by uid 0); 20 Aug 2009 01:37:12 -0000
Received: from unknown (HELO host285.hostmonster.com) (74.220.215.85)
	by outboundproxy3.bluehost.com with SMTP; 20 Aug 2009 01:37:12 -0000
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=default; d=linuxbj.com;
	h=Received:Message-ID:Date:From:User-Agent:MIME-Version:To:Subject:References:In-Reply-To:Content-Type:X-Identified-User;
	b=fb/DVE+k7WGiXTgaVQXAezi12MQfz/Sugyjiu3MoJTarj91sMafULkOrA1tPxvlWS0+EgnCh89Wjugkq7RuYQFXbWB7lgghdhIDeSpiDKemI9OPrPiidUbF79TjxJ75k;
Received: from [125.33.189.198] (helo=[192.168.200.199])
	by host285.hostmonster.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <chow.ming@linuxbj.com>)
	id 1MdwaQ-00079a-Ku for openembedded-devel@lists.openembedded.org;
	Wed, 19 Aug 2009 19:37:12 -0600
Message-ID: <4A8CA8B3.2090300@linuxbj.com>
Date: Thu, 20 Aug 2009 09:36:51 +0800
From: =?UTF-8?B?TWluZyBDaG93IOWRqOaYjg==?= <chow.ming@linuxbj.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090608)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A84650F.1080902@linuxbj.com>	<200908140406.00714.holger+oe@freyther.de>	<4A850430.6060809@linuxbj.com>	<4A857D57.4040705@linuxbj.com>	<h63vae$ktr$1@ger.gmane.org>	<4A8C2914.8090604@linuxbj.com>
	<h6hagb$afd$1@ger.gmane.org>
In-Reply-To: <h6hagb$afd$1@ger.gmane.org>
X-Identified-User: {2055:host285.hostmonster.com:linuxbjc:linuxbj.com}
	{sentby:smtp auth 125.33.189.198 authed with
	chow.ming@linuxbj.com}
Subject: Re: patch for compcache recipe
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
X-List-Received-Date: Thu, 20 Aug 2009 01:54:33 -0000
Content-Type: multipart/mixed; boundary="------------070408090203060001020705"

--------------070408090203060001020705
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Signed-off-by: Zhou Ming <chow.ming@linuxbj.com>

Thank you for your kind advice. 4 commits due to the modifications.

Koen Kooi wrote:
> Please send it in git format-patch format so we can keep all metadata 
> when applying it.
>
> regards,
>
> Koen
>
> On 19-08-09 18:32, Ming Chow 周明 wrote:
>> Hi,
>>
>> Thanks for your kind information.
>> I have changed the package version to 0.5+0.6pre3 following the policy
>> guideline Rolf showed to me.
>>
>> Koen Kooi wrote:
>>> On 14-08-09 17:05, Ming Chow 周明 wrote:
>>>> Signed-off-by: Zhou Ming <chow.ming@linuxbj.com>
>>>>
>>>> I have renewed the patch looks like:
>>>>
>>>> - added the checksum entry
>>>> - use kernel-module-compcache as the package name which results 
>>>> throwing
>>>> out packages like
>>>> "kernel-module-compcache_0.6pre3-r41.3_beagleboard.ipk"
>>>> - use compcache-utils as the tool package name which looks like
>>>> "compcache-utils_0.6pre3-r41.3_beagleboard.ipk"
>>>
>>> NAK, 0.6pre3 violated the OE versioning policy, you want something
>>> like 0.5+0.6pre3
>>>
>>> regards,
>>>
>>> Koen
>>>
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>>
>>
>> ------------------------------------------------------------------------
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--------------070408090203060001020705
Content-Type: text/x-patch;
 name="0001-added-compcache.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0001-added-compcache.patch"

From 84da7c0eed1865914981ed9625fa02e8468ecf9d Mon Sep 17 00:00:00 2001
From: Ming Zhou <chow.ming@linuxbj.com>
Date: Fri, 14 Aug 2009 03:53:41 +0800
Subject: [PATCH] added compcache

---
 .../compcache/000-compcache-KERNELDIR.patch        |   34 ++++++++++++++++++++
 .../001-compcache-rzscontrol-cross-compile.patch   |    9 +++++
 .../compcache/002-compcache-modules-install.patch  |   13 +++++++
 recipes/compcache/compcache_0.6pre3.bb             |   28 ++++++++++++++++
 4 files changed, 84 insertions(+), 0 deletions(-)
 create mode 100644 recipes/compcache/compcache/000-compcache-KERNELDIR.patch
 create mode 100644 recipes/compcache/compcache/001-compcache-rzscontrol-cross-compile.patch
 create mode 100644 recipes/compcache/compcache/002-compcache-modules-install.patch
 create mode 100644 recipes/compcache/compcache_0.6pre3.bb

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
-- 
1.5.4.3


--------------070408090203060001020705
Content-Type: text/x-patch;
 name="0002-modified-compcache-to-make-a-more-meanful-package-na.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0002-modified-compcache-to-make-a-more-meanful-package-na.patch"

From cd6bb9cd23bed6ac2132c4b0e6db026aebd7e884 Mon Sep 17 00:00:00 2001
From: Ming Zhou <chow.ming@linuxbj.com>
Date: Fri, 14 Aug 2009 22:46:13 +0800
Subject: [PATCH] modified compcache to make a more meanful package name

---
 conf/checksums.ini                     |    4 ++++
 recipes/compcache/compcache_0.6pre3.bb |   10 +++++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index bc214eb..2fc1abb 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -28578,3 +28578,7 @@ sha256=f57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af
 md5=5f7b88ebb2bcd7e8044328482d079661
 sha256=f57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af
 
+[http://compcache.googlecode.com/files/compcache-0.6pre3.tar.gz]
+md5=532fbc4e6a8ae0670ec15a49484f313f
+sha256=3e54f26665bd1b7ece4e4621a15f82da66a95bafd04286d447be5a596790a7db
+
diff --git a/recipes/compcache/compcache_0.6pre3.bb b/recipes/compcache/compcache_0.6pre3.bb
index 0b59815..ea8772c 100644
--- a/recipes/compcache/compcache_0.6pre3.bb
+++ b/recipes/compcache/compcache_0.6pre3.bb
@@ -12,12 +12,12 @@ SRC_URI = "http://compcache.googlecode.com/files/compcache-${PV}.tar.gz \
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-PACKAGES = "compcache-modules rzscontrol rzscontrol-dbg rzscontrol-doc"
+PACKAGES = "kernel-module-compcache compcache-utils compcache-utils-dbg compcache-utils-doc"
 
-FILES_compcache-modules = ${FILES_compcache}
-FILES_rzscontrol = "${bindir}/rzscontrol"
-FILES_rzscontrol-dbg = "${bindir}/.debug/rzscontrol"
-FILES_rzscontrol-doc = "${mandir}/man1/rzscontrol.1"
+FILES_kernel-module-compcache = ${FILES_compcache}
+FILES_compcache-utils = "${bindir}/rzscontrol"
+FILES_compcache-utils-dbg = "${bindir}/.debug/rzscontrol"
+FILES_compcache-utils-doc = "${mandir}/man1/rzscontrol.1"
 
 do_install_prepend() {
 	mkdir -p ${D}${bindir}
-- 
1.5.4.3


--------------070408090203060001020705
Content-Type: text/x-patch;
 name="0003-modified-compcache_0.6pre3-to-compcache_0.5-0.6pre3.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0003-modified-compcache_0.6pre3-to-compcache_0.5-0.6pre3.patch"

From 22463fbc29215968710fb47d55001099e98541f6 Mon Sep 17 00:00:00 2001
From: Ming Zhou <chow.ming@linuxbj.com>
Date: Wed, 19 Aug 2009 23:38:59 +0800
Subject: [PATCH] modified compcache_0.6pre3 to compcache_0.5+0.6pre3 and added related corrections

---
 recipes/compcache/compcache_0.6pre3.bb |   28 ----------------------------
 1 files changed, 0 insertions(+), 28 deletions(-)
 delete mode 100644 recipes/compcache/compcache_0.6pre3.bb

diff --git a/recipes/compcache/compcache_0.6pre3.bb b/recipes/compcache/compcache_0.6pre3.bb
deleted file mode 100644
index ea8772c..0000000
--- a/recipes/compcache/compcache_0.6pre3.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-HOMEPAGE = "http://code.google.com/p/compcache"
-DESCRIPTION = "Kernel drivers version 0.6x and related tool for the compcache (compressed in-memory swap device for linux)"
-LICENSE = "GPLv2"
-
-inherit module
-
-SRC_URI = "http://compcache.googlecode.com/files/compcache-${PV}.tar.gz \
-	file://000-compcache-KERNELDIR.patch;patch=1 \
-	file://001-compcache-rzscontrol-cross-compile.patch;patch=1 \
-	file://002-compcache-modules-install.patch;patch=1 \
-	   "
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-PACKAGES = "kernel-module-compcache compcache-utils compcache-utils-dbg compcache-utils-doc"
-
-FILES_kernel-module-compcache = ${FILES_compcache}
-FILES_compcache-utils = "${bindir}/rzscontrol"
-FILES_compcache-utils-dbg = "${bindir}/.debug/rzscontrol"
-FILES_compcache-utils-doc = "${mandir}/man1/rzscontrol.1"
-
-do_install_prepend() {
-	mkdir -p ${D}${bindir}
-	mkdir -p ${D}${mandir}/man1
-	install -m 0755 ${S}/sub-projects/rzscontrol/rzscontrol ${D}${bindir}
-	install -m 0644 ${S}/sub-projects/rzscontrol/man/rzscontrol.1 ${D}${mandir}/man1
-}
-
-- 
1.5.4.3


--------------070408090203060001020705
Content-Type: text/x-patch;
 name="0004-fixed-compcache-source-directory.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0004-fixed-compcache-source-directory.patch"

From fc97de55643a0c2aab0645e56137fb0854c9a58b Mon Sep 17 00:00:00 2001
From: Ming Zhou <chow.ming@linuxbj.com>
Date: Thu, 20 Aug 2009 09:31:49 +0800
Subject: [PATCH] fixed compcache source directory

---
 recipes/compcache/compcache_0.5+0.6pre3.bb |   29 ++++++++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 recipes/compcache/compcache_0.5+0.6pre3.bb

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
-- 
1.5.4.3


--------------070408090203060001020705--
