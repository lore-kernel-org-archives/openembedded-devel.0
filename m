Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sw1wy-0008Qc-AW
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 04:12:44 +0200
Received: by wibhm11 with SMTP id hm11so2102063wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2012 19:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=vm3wpUTv9SAQYMMY4UH3GXqQZZNV7lQEIBJL2H+zPms=;
	b=uraX/UK4RtrzLgWS1o68sGHojKI+QPOZw2CeKewCGn45fdR5/xF1+P4cirjEQlO1ME
	a7TRpGL2aNXHtZIY9WNa7EF0RdBcXDiHgIIWZUCsKSi6Yemqb/cxwITSOlEWJvj4nFNZ
	i4Ps06TwSp6M+BgZFg3LC7nfPXFaaOM+b90a2ptVQNaXBzsh7AyFwKYTyCOxU+lSm+uI
	Z0NMaSCbnEiEnAjdcFHBmVnK2rLQjyUjxl/snvDydrS2kan7+RpZ/k7ZOecaHRHzljM0
	QCaMRxW2PjXYEeyTXE7vIp+UOSTERO3tXJfXn5aTHOHHg0lXdRJ0ad0dUi4TYT3WF5fO
	h8YA==
Received: by 10.216.136.66 with SMTP id v44mr6936112wei.159.1343700067973;
	Mon, 30 Jul 2012 19:01:07 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ef5sm28769702wib.3.2012.07.30.19.01.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 19:01:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jul 2012 03:58:48 +0200
Message-Id: <72e02b4625dceb0cc72e1edfc28215786c7de63a.1343699377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343699377.git.Martin.Jansa@gmail.com>
References: <cover.1343478744.git.Martin.Jansa@gmail.com>
	<cover.1343699377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343699377.git.Martin.Jansa@gmail.com>
References: <cover.1343699377.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 23/24] pixman: add patch to fix SEGFAULT when parsing auxv
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
X-List-Received-Date: Tue, 31 Jul 2012 02:12:44 -0000

* without this patch emacs won't build
* temacs is executed in qemu and fails like this:
qemu: uncaught target signal 11 (Segmentation fault) - core dumped
Segmentation fault
which is actually:
Program received signal SIGSEGV, Segmentation fault.
__GI_strncmp (s1=s1@entry=0x0, s2=s2@entry=0x40d68638 "v7l", n=n@entry=3) at strncmp.c:64
64      strncmp.c: No such file or directory.
(gdb) bt
Backtrace stopped: previous frame identical to this frame (corrupt stack?)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...lated-workarounds-in-cpu-features-detecti.patch |  121 ++++++++++++++++++++
 .../xorg-lib/pixman_0.26.2.bbappend                |    6 +-
 2 files changed, 125 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch

diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch b/meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
new file mode 100644
index 0000000..b56e690
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
@@ -0,0 +1,121 @@
+From dad8537110c27b45795f8879a3e0a54aa77546b9 Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Tue, 11 Jan 2011 18:10:39 +0200
+Subject: [PATCH] ARM: qemu related workarounds in cpu features detection code
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ pixman/pixman-cpu.c |   67 +++++++++++++++++++++++++++++++++++++++++---------
+ 1 files changed, 55 insertions(+), 12 deletions(-)
+
+diff --git a/pixman/pixman-cpu.c b/pixman/pixman-cpu.c
+index aa9036f..a8f2494 100644
+--- a/pixman/pixman-cpu.c
++++ b/pixman/pixman-cpu.c
+@@ -333,15 +333,30 @@ pixman_arm_read_auxv_or_cpu_features ()
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <sys/mman.h>
++#include <sys/utsname.h>
+ #include <fcntl.h>
+ #include <string.h>
+ #include <elf.h>
+ 
++/*
++ * The whole CPU capabilities detection is a bit ugly: when running in
++ * userspace qemu, we see /proc/self/auxv from the host system. To make
++ * everything even worse, the size of each value is 64-bit when running
++ * on a 64-bit host system. So the data is totally bogus because we expect
++ * 32-bit values. As AT_PLATFORM value is used as a pointer, it may cause
++ * segfault (null pointer dereference on x86-64 host). So in order to be
++ * on a safe side, we require that AT_PLATFORM value is found only once,
++ * and it has non-zero value (this is still not totally reliable for a big
++ * endian 64-bit host system running qemu and may theoretically fail).
++ */
+ static void
+ pixman_arm_read_auxv_or_cpu_features ()
+ {
+     int fd;
+     Elf32_auxv_t aux;
++    uint32_t hwcap = 0;
++    const char *plat = NULL;
++    int plat_cnt = 0;
+ 
+     fd = open ("/proc/self/auxv", O_RDONLY);
+     if (fd >= 0)
+@@ -350,32 +365,60 @@ pixman_arm_read_auxv_or_cpu_features ()
+ 	{
+ 	    if (aux.a_type == AT_HWCAP)
+ 	    {
+-		uint32_t hwcap = aux.a_un.a_val;
+-		/* hardcode these values to avoid depending on specific
+-		 * versions of the hwcap header, e.g. HWCAP_NEON
+-		 */
+-		arm_has_vfp = (hwcap & 64) != 0;
+-		arm_has_iwmmxt = (hwcap & 512) != 0;
+-		/* this flag is only present on kernel 2.6.29 */
+-		arm_has_neon = (hwcap & 4096) != 0;
++		hwcap = aux.a_un.a_val;
+ 	    }
+ 	    else if (aux.a_type == AT_PLATFORM)
+ 	    {
+-		const char *plat = (const char*) aux.a_un.a_val;
+-		if (strncmp (plat, "v7l", 3) == 0)
++		plat = (const char*) aux.a_un.a_val;
++		plat_cnt++;
++	    }
++	}
++	close (fd);
++
++	if (plat == NULL || plat_cnt != 1 || *plat != 'v')
++	{
++	    /*
++	     * Something seems to be really wrong, most likely we are
++	     * running under qemu. Let's use machine type from "uname" for
++	     * CPU capabilities detection:
++	     * http://www.mail-archive.com/qemu-devel at nongnu.org/msg22212.html
++	     */
++	    struct utsname u;
++	    hwcap = 0; /* clear hwcap, because it is bogus */
++	    if (uname (&u) == 0)
++	    {
++		if (strcmp (u.machine, "armv7l") == 0)
+ 		{
+ 		    arm_has_v7 = TRUE;
+ 		    arm_has_v6 = TRUE;
++		    hwcap |= 64; /* qemu is supposed to emulate vfp */
++		    hwcap |= 4096; /* qemu is supposed to emulate neon */
+ 		}
+-		else if (strncmp (plat, "v6l", 3) == 0)
++		else if (strcmp (u.machine, "armv6l") == 0)
+ 		{
+ 		    arm_has_v6 = TRUE;
++		    hwcap |= 64; /* qemu is supposed to emulate vfp */
+ 		}
+ 	    }
+ 	}
+-	close (fd);
++	else if (strncmp (plat, "v7l", 3) == 0)
++	{
++	    arm_has_v7 = TRUE;
++	    arm_has_v6 = TRUE;
++	}
++	else if (strncmp (plat, "v6l", 3) == 0)
++	{
++	    arm_has_v6 = TRUE;
++	}
+     }
+ 
++    /* hardcode these values to avoid depending on specific
++     * versions of the hwcap header, e.g. HWCAP_NEON
++     */
++    arm_has_vfp = (hwcap & 64) != 0;
++    arm_has_iwmmxt = (hwcap & 512) != 0;
++    arm_has_neon = (hwcap & 4096) != 0;
++
+     arm_tests_initialized = TRUE;
+ }
+ 
+-- 
+1.7.8.6
+
diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman_0.26.2.bbappend b/meta-oe/recipes-graphics/xorg-lib/pixman_0.26.2.bbappend
index 579d508..b5be2b5 100644
--- a/meta-oe/recipes-graphics/xorg-lib/pixman_0.26.2.bbappend
+++ b/meta-oe/recipes-graphics/xorg-lib/pixman_0.26.2.bbappend
@@ -1,8 +1,10 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
 
-PRINC := "${@int(PRINC) + 9}"
+PRINC := "${@int(PRINC) + 10}"
 
-SRC_URI += " file://0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch"
+SRC_URI += " file://0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch \
+  file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
+"
 
 NEON = " --disable-arm-neon "
 NEON_armv7a = " "
-- 
1.7.8.6



