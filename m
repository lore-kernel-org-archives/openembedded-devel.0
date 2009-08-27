Received: from [69.89.22.13] (helo=outbound-mail-103.bluehost.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <openembedded-devel@lists.openembedded.org>)
	id 1Mgf8w-0003d0-Ax
	for openembedded-devel@openembedded.org; Thu, 27 Aug 2009 15:35:58 +0200
Received: (qmail 26874 invoked by uid 0); 27 Aug 2009 13:17:54 -0000
Received: from unknown (HELO host285.hostmonster.com) (74.220.215.85)
	by outboundproxy3.bluehost.com with SMTP; 27 Aug 2009 13:17:54 -0000
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=default; d=linuxbj.com;
	h=Received:Message-ID:Date:From:User-Agent:MIME-Version:To:Subject:References:In-Reply-To:Content-Type:X-Identified-User;
	b=iNpVrS2jzBkJprMFMn2O7U7RvDE8GCss+koa9d1VsoZuSpwly9+aTIdxgbDncMGR5v7eAQyC9qTSZkRakWVGqtUrOnzFj4Dp8YaK+SvY+ZgYLB9zHOTd9r11yMbSd2jA;
Received: from [221.221.246.44] (helo=[192.168.200.199])
	by host285.hostmonster.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <chow.ming@linuxbj.com>)
	id 1MgerQ-0000fr-UB for openembedded-devel@lists.openembedded.org;
	Thu, 27 Aug 2009 07:17:54 -0600
Message-ID: <4A96877A.4030004@linuxbj.com>
Date: Thu, 27 Aug 2009 21:17:46 +0800
From: =?UTF-8?B?TWluZyBDaG93IOWRqOaYjg==?= <chow.ming@linuxbj.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A8D91A2.1080602@linuxbj.com>
	<200908251501.59031.holger+oe@freyther.de>
In-Reply-To: <200908251501.59031.holger+oe@freyther.de>
X-Identified-User: {2055:host285.hostmonster.com:linuxbjc:linuxbj.com}
	{sentby:smtp auth 221.221.246.44 authed with
	chow.ming@linuxbj.com}
Subject: Re: [PATCH] linux-nokia800-2.6.21-osso71.bb fixed undefined reference to __aeabi_uldivmod problem when using gcc-4.3	compile linux-nokia800-2.6.21-osso71
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
X-List-Received-Date: Thu, 27 Aug 2009 13:35:59 -0000
Content-Type: multipart/mixed; boundary="------------050804010707070203040207"

--------------050804010707070203040207
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Sure. Thank you.

Holger Hans Peter Freyther wrote:
> On Thursday 20 August 2009 20:10:42 Ming Chow 周明 wrote:
>   
>>  From bc8990dbee051e9f36a2b90761ce1f405f8dabc6 Mon Sep 17 00:00:00 2001
>> From: Ming Zhou <chow.ming@linuxbj.com>
>> Date: Fri, 21 Aug 2009 02:04:15 +0800
>> Subject: [PATCH] linux-nokia800-2.6.21-osso71.bb fixed undefined
>> reference to __aeabi_uldivmod problem when using gcc-4.3 compile
>> linux-nokia800-2.6.21-osso71
>>     
>
>
> http://patchwork.openembedded.org/patch/975/
>
>
> Your mailer created a total mess, could you attempt to fix that?
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>   


--------------050804010707070203040207
Content-Type: text/x-patch;
 name="0001-fixed-undefined-reference-to-__aeabi_uldivmod-proble.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0001-fixed-undefined-reference-to-__aeabi_uldivmod-proble.patch"

From bc8990dbee051e9f36a2b90761ce1f405f8dabc6 Mon Sep 17 00:00:00 2001
From: Ming Zhou <chow.ming@linuxbj.com>
Date: Fri, 21 Aug 2009 02:04:15 +0800
Subject: [PATCH] linux-nokia800_2.6.21-osso71.bb fixed undefined reference to __aeabi_uldivmod problem when using gcc-4.3 compile linux-nokia800-2.6.21-osso71


Signed-off-by: Ming Zhou <chow.ming@linuxbj.com>
---
 ...x-gcc-4.3-false-modulo-optimization.patch.patch |   48 ++++++++++++++++++++
 recipes/linux/linux-nokia800_2.6.21-osso71.bb      |    1 +
 2 files changed, 49 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linux/linux-nokia800-2.6.21-osso71/1300-fix-gcc-4.3-false-modulo-optimization.patch.patch

diff --git a/recipes/linux/linux-nokia800-2.6.21-osso71/1300-fix-gcc-4.3-false-modulo-optimization.patch.patch b/recipes/linux/linux-nokia800-2.6.21-osso71/1300-fix-gcc-4.3-false-modulo-optimization.patch.patch
new file mode 100644
index 0000000..3ff0c07
--- /dev/null
+++ b/recipes/linux/linux-nokia800-2.6.21-osso71/1300-fix-gcc-4.3-false-modulo-optimization.patch.patch
@@ -0,0 +1,48 @@
+From f5b973489beb1a1239dfad53e3ad6e36ff7ee958 Mon Sep 17 00:00:00 2001
+From: Segher Boessenkool <segher@kernel.crashing.org>
+Date: Thu, 9 Oct 2008 21:18:27 +0100
+Subject: [PATCH] fix-gcc-4.3-false-modulo-optimization.patch
+
+I tried to compile the current stable kernel
+(a2ef813d2f439a3e9f377d33a2e5baad098afb7e)
+and get the following errors:
+
+kernel/built-in.o: In function `timespec_add_ns':
+/mnt/data/Freerunner/Gentoo/rootinstall/usr/src/linux/include/linux/time.h:174:
+undefined reference to `__aeabi_uldivmod'
+/mnt/data/Freerunner/Gentoo/rootinstall/usr/src/linux/include/linux/time.h:179:
+undefined reference to `__aeabi_uldivmod'
+/mnt/data/Freerunner/Gentoo/rootinstall/usr/src/linux/include/linux/time.h:174:
+undefined reference to `__aeabi_uldivmod'
+/mnt/data/Freerunner/Gentoo/rootinstall/usr/src/linux/include/linux/time.h:179:
+undefined reference to `__aeabi_uldivmod'
+
+applying the following patch solved the problem:
+--------
+Prevent gcc-4.3 form "optimizing" the while loop into a costly modulo operation.
+Patch found at http://lkml.org/lkml/2008/2/22/464.
+
+Reported-by: Sven Rebhan <odinshorse@googlemail.com>
+Signed-off-by: Segher Boessenkool <segher@kernel.crashing.org>
+---
+ include/linux/time.h |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/include/linux/time.h b/include/linux/time.h
+index b04136d..3e8fd9e 100644
+--- a/include/linux/time.h
++++ b/include/linux/time.h
+@@ -173,6 +173,10 @@ static inline void timespec_add_ns(struct timespec *a, u64 ns)
+ {
+ 	ns += a->tv_nsec;
+ 	while(unlikely(ns >= NSEC_PER_SEC)) {
++		/* The following asm() prevents the compiler from
++		 * optimising this loop into a modulo operation.  */
++		asm("" : "+r"(ns));
++
+ 		ns -= NSEC_PER_SEC;
+ 		a->tv_sec++;
+ 	}
+-- 
+1.5.6.5
+
diff --git a/recipes/linux/linux-nokia800_2.6.21-osso71.bb b/recipes/linux/linux-nokia800_2.6.21-osso71.bb
index 1ac4cf1..388df4f 100644
--- a/recipes/linux/linux-nokia800_2.6.21-osso71.bb
+++ b/recipes/linux/linux-nokia800_2.6.21-osso71.bb
@@ -8,6 +8,7 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.21.tar.bz2 \
            http://www.rpsys.net/openzaurus/patches/archive/input_power-r7.patch;patch=1 \
 	   file://suspend-button.patch;patch=1 \
            file://linux-2.6-limits.patch;patch=1 \
+           file://1300-fix-gcc-4.3-false-modulo-optimization.patch.patch;patch=1 \
 	   file://defconfig"
 
 S = "${WORKDIR}/linux-2.6.21"
-- 
1.5.4.3


--------------050804010707070203040207--
