Received: from [67.222.38.26] (helo=outbound-mail-126.bluehost.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <chow.ming@linuxbj.com>) id 1MdoME-0008Mk-Bz
	for openembedded-devel@openembedded.org; Wed, 19 Aug 2009 18:49:54 +0200
Received: (qmail 16928 invoked by uid 0); 19 Aug 2009 16:32:42 -0000
Received: from unknown (HELO host285.hostmonster.com) (74.220.215.85)
	by outboundproxy4.bluehost.com with SMTP; 19 Aug 2009 16:32:42 -0000
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=default; d=linuxbj.com;
	h=Received:Message-ID:Date:From:User-Agent:MIME-Version:To:Subject:References:In-Reply-To:Content-Type:X-Identified-User;
	b=FeFt8mDlJ/kUip6qB9haF+YSR2pLctZJEHhkAKht3pDkemNWeYDlp1TH49ta3KPeEBGEukRxQ3YA0g0yfaa3Vynu1c9Po3qEIPwhwwvFCHMEsfyIIwr+iOqsE+EVVxYL;
Received: from [125.33.189.198] (helo=[192.168.200.199])
	by host285.hostmonster.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <chow.ming@linuxbj.com>)
	id 1Mdo5Y-0003bV-85 for openembedded-devel@lists.openembedded.org;
	Wed, 19 Aug 2009 10:32:42 -0600
Message-ID: <4A8C2914.8090604@linuxbj.com>
Date: Thu, 20 Aug 2009 00:32:20 +0800
From: =?UTF-8?B?TWluZyBDaG93IOWRqOaYjg==?= <chow.ming@linuxbj.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090608)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A84650F.1080902@linuxbj.com>	<200908140406.00714.holger+oe@freyther.de>	<4A850430.6060809@linuxbj.com>	<4A857D57.4040705@linuxbj.com>
	<h63vae$ktr$1@ger.gmane.org>
In-Reply-To: <h63vae$ktr$1@ger.gmane.org>
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
X-List-Received-Date: Wed, 19 Aug 2009 16:49:54 -0000
Content-Type: multipart/mixed; boundary="------------090202010107010505060503"

--------------090202010107010505060503
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Thanks for your kind information.
I have changed the package version to 0.5+0.6pre3 following the policy 
guideline Rolf showed to me.

Koen Kooi wrote:
> On 14-08-09 17:05, Ming Chow 周明 wrote:
>> Signed-off-by: Zhou Ming <chow.ming@linuxbj.com>
>>
>> I have renewed the patch looks like:
>>
>> - added the checksum entry
>> - use kernel-module-compcache as the package name which results throwing
>> out packages like 
>> "kernel-module-compcache_0.6pre3-r41.3_beagleboard.ipk"
>> - use compcache-utils as the tool package name which looks like
>> "compcache-utils_0.6pre3-r41.3_beagleboard.ipk"
>
> NAK, 0.6pre3 violated the OE versioning policy, you want something 
> like 0.5+0.6pre3
>
> regards,
>
> Koen
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



--------------090202010107010505060503
Content-Type: text/x-patch;
 name="patch-compcache-0.5+0.6pre3.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-compcache-0.5+0.6pre3.diff"

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


--------------090202010107010505060503--
