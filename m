Received: from [194.187.214.26] (helo=iohazard.net)
	by linuxtogo.org with esmtp (Exim 4.69) (envelope-from <czr@iki.fi>)
	id 1MpJMY-0000Po-24 for openembedded-devel@lists.openembedded.org;
	Sun, 20 Sep 2009 12:09:49 +0200
Received: from chehov.intranet (a88-114-240-122.elisa-laajakaista.fi
	[::ffff:88.114.240.122])
	(AUTH: PLAIN czr, SSL: TLSv1/SSLv3,256bits,AES256-SHA)
	by iohazard.net with esmtp; Sun, 20 Sep 2009 13:09:10 +0300
	id 00065942.4AB5FF46.00007E64
Message-ID: <4AB5FF42.30204@iki.fi>
Date: Sun, 20 Sep 2009 13:09:06 +0300
From: Aleksandr Koltsoff <czr@iki.fi>
User-Agent: Thunderbird 2.0.0.18 (X11/20081125)
Mime-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-SA-Exim-Connect-IP: 194.187.214.26
X-SA-Exim-Mail-From: czr@iki.fi
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] strace: Update to 4.5.18
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
X-List-Received-Date: Sun, 20 Sep 2009 10:09:49 -0000
Content-Type: multipart/mixed;
	boundary="=_iohazard.net-32356-1253441350-0001-2"

--=_iohazard.net-32356-1253441350-0001-2
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

Please note that only ARM (arm and thumb) has received testing. For this
reason DEFAULT_PREFERENCE is set to -1.

--
Signed-off-by: Aleksandr Koltsoff <czr@iki.fi>



--=_iohazard.net-32356-1253441350-0001-2
Content-Type: text/x-diff; name="0002-strace-Update-to-4.5.18.patch"; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0002-strace-Update-to-4.5.18.patch"

From cbf4f807b9c6a23444baf174483945ce86aa1eb8 Mon Sep 17 00:00:00 2001
From: Aleksandr Koltsoff <czr@iki.fi>
Date: Sun, 20 Sep 2009 12:55:24 +0300
Subject: [PATCH] strace: Update to 4.5.18

Please note that only ARM (arm and thumb) has received testing.
---
 .../strace-4.5.18/strace-4.5.17-arm-syscalls.patch |  140 ++++++++++++++++++++
 .../strace-4.5.18/strace-arm-no-cachectl.patch     |   34 +++++
 recipes/strace/strace_4.5.18.bb                    |   14 ++
 3 files changed, 188 insertions(+), 0 deletions(-)
 create mode 100644 recipes/strace/strace-4.5.18/strace-4.5.17-arm-syscalls.patch
 create mode 100644 recipes/strace/strace-4.5.18/strace-arm-no-cachectl.patch
 create mode 100644 recipes/strace/strace_4.5.18.bb

diff --git a/recipes/strace/strace-4.5.18/strace-4.5.17-arm-syscalls.patch b/recipes/strace/strace-4.5.18/strace-4.5.17-arm-syscalls.patch
new file mode 100644
index 0000000..d336892
--- /dev/null
+++ b/recipes/strace/strace-4.5.18/strace-4.5.17-arm-syscalls.patch
@@ -0,0 +1,140 @@
+This patch was required to build 4.5.18 (arm). It was meant for 4.5.17 originally,
+but applies cleanly against 4.5.18.
+
+Patch found on gentoo bugtracker:
+http://bugs.gentoo.org/attachment.cgi?id=181917&action=view
+
+diff --git a/linux/arm/syscallent.h b/linux/arm/syscallent.h
+index 5ccef2f..edc3641 100644
+--- a/linux/arm/syscallent.h
++++ b/linux/arm/syscallent.h
+@@ -431,6 +431,7 @@
+ 	{ 5,	0,	printargs,		"SYS_398"	}, /* 398 */
+ 	{ 5,	0,	printargs,		"SYS_399"	}, /* 399 */
+ 
++#ifndef __ARM_EABI__
+ #if SYS_socket_subcall != 400
+  #error fix me
+ #endif
+@@ -481,3 +482,4 @@
+ 	{ 4,	TI,	sys_shmdt,		"shmdt"		}, /* 440 */
+ 	{ 4,	TI,	sys_shmget,		"shmget"	}, /* 441 */
+ 	{ 4,	TI,	sys_shmctl,		"shmctl"	}, /* 442 */
++#endif
+diff --git a/linux/arm/syscallent.h b/linux/arm/syscallent.h
+index edc3641..6dd783a 100644
+--- a/linux/arm/syscallent.h
++++ b/linux/arm/syscallent.h
+@@ -328,63 +328,63 @@
+ 	{ 5,	TN,	sys_getsockopt,		"getsockopt"	}, /* 295 */
+ 	{ 3,	TN,	sys_sendmsg,		"sendmsg"	}, /* 296 */
+ 	{ 3,	TN,	sys_recvmsg,		"recvmsg"	}, /* 297 */
+-	{ 5,	0,	printargs,		"SYS_298"	}, /* 298 */
+-	{ 5,	0,	printargs,		"SYS_299"	}, /* 299 */
+-	{ 5,	0,	printargs,		"SYS_300"	}, /* 300 */
+-	{ 5,	0,	printargs,		"SYS_301"	}, /* 301 */
+-	{ 5,	0,	printargs,		"SYS_302"	}, /* 302 */
+-	{ 5,	0,	printargs,		"SYS_303"	}, /* 303 */
+-	{ 5,	0,	printargs,		"SYS_304"	}, /* 304 */
+-	{ 5,	0,	printargs,		"SYS_305"	}, /* 305 */
+-	{ 5,	0,	printargs,		"SYS_306"	}, /* 306 */
+-	{ 5,	0,	printargs,		"SYS_307"	}, /* 307 */
+-	{ 5,	0,	printargs,		"SYS_308"	}, /* 308 */
+-	{ 5,	0,	printargs,		"SYS_309"	}, /* 309 */
+-	{ 5,	0,	printargs,		"SYS_310"	}, /* 310 */
+-	{ 5,	0,	printargs,		"SYS_311"	}, /* 311 */
+-	{ 5,	0,	printargs,		"SYS_312"	}, /* 312 */
+-	{ 5,	0,	printargs,		"SYS_313"	}, /* 313 */
+-	{ 5,	0,	printargs,		"SYS_314"	}, /* 314 */
+-	{ 5,	0,	printargs,		"SYS_315"	}, /* 315 */
+-	{ 5,	0,	printargs,		"SYS_316"	}, /* 316 */
+-	{ 5,	0,	printargs,		"SYS_317"	}, /* 317 */
+-	{ 5,	0,	printargs,		"SYS_318"	}, /* 318 */
+-	{ 5,	0,	printargs,		"SYS_319"	}, /* 319 */
+-	{ 5,	0,	printargs,		"SYS_320"	}, /* 320 */
+-	{ 5,	0,	printargs,		"SYS_321"	}, /* 321 */
+-	{ 5,	0,	printargs,		"SYS_322"	}, /* 322 */
+-	{ 5,	0,	printargs,		"SYS_323"	}, /* 323 */
+-	{ 5,	0,	printargs,		"SYS_324"	}, /* 324 */
+-	{ 5,	0,	printargs,		"SYS_325"	}, /* 325 */
+-	{ 5,	0,	printargs,		"SYS_326"	}, /* 326 */
+-	{ 5,	0,	printargs,		"SYS_327"	}, /* 327 */
+-	{ 5,	0,	printargs,		"SYS_328"	}, /* 328 */
+-	{ 5,	0,	printargs,		"SYS_329"	}, /* 329 */
+-	{ 5,	0,	printargs,		"SYS_330"	}, /* 330 */
+-	{ 5,	0,	printargs,		"SYS_331"	}, /* 331 */
+-	{ 5,	0,	printargs,		"SYS_332"	}, /* 332 */
+-	{ 5,	0,	printargs,		"SYS_333"	}, /* 333 */
+-	{ 5,	0,	printargs,		"SYS_334"	}, /* 334 */
++	{ 4,	TI,	sys_semop,		"semop"		}, /* 298 */
++	{ 4,	TI,	sys_semget,		"semget"	}, /* 299 */
++	{ 4,	TI,	sys_semctl,		"semctl"	}, /* 300 */
++	{ 4,	TI,	sys_msgsnd,		"msgsnd"	}, /* 301 */
++	{ 4,	TI,	sys_msgrcv,		"msgrcv"	}, /* 302 */
++	{ 4,	TI,	sys_msgget,		"msgget"	}, /* 303 */
++	{ 4,	TI,	sys_msgctl,		"msgctl"	}, /* 304 */
++	{ 4,	TI,	sys_shmat,		"shmat"		}, /* 305 */
++	{ 4,	TI,	sys_shmdt,		"shmdt"		}, /* 306 */
++	{ 4,	TI,	sys_shmget,		"shmget"	}, /* 307 */
++	{ 4,	TI,	sys_shmctl,		"shmctl"	}, /* 308 */
++	{ 5,	0,	printargs,		"add_key"	}, /* 309 */
++	{ 4,	0,	printargs,		"request_key"	}, /* 310 */
++	{ 5,	0,	printargs,		"keyctl"	}, /* 311 */
++	{ 5,	TI,	sys_semtimedop,		"semtimedop"	}, /* 312 */
++	{ 5,	0,	printargs,		"vserver"	}, /* 313 */
++	{ 3,	0,	printargs,		"ioprio_set"	}, /* 314 */
++	{ 2,	0,	printargs,		"ioprio_get"	}, /* 315 */
++	{ 0,	TD,	printargs,		"inotify_init"	}, /* 316 */
++	{ 3,	TD,	sys_inotify_add_watch,	"inotify_add_watch" }, /* 317 */
++	{ 2,	TD,	sys_inotify_rm_watch,	"inotify_rm_watch" }, /* 318 */
++	{ 6,	0,	sys_mbind,		"mbind"		}, /* 319 */
++	{ 3,	0,	sys_set_mempolicy,	"set_mempolicy"	}, /* 320 */
++	{ 5,	0,	sys_get_mempolicy,	"get_mempolicy"	}, /* 321 */
++	{ 4,	TD|TF,	sys_openat,		"openat"	}, /* 322 */
++	{ 3,	TD|TF,	sys_mkdirat,		"mkdirat"	}, /* 323 */
++	{ 4,	TD|TF,	sys_mknodat,		"mknodat"	}, /* 324 */
++	{ 5,	TD|TF,	sys_fchownat,		"fchownat"	}, /* 325 */
++	{ 3,	TD|TF,	sys_futimesat,		"futimesat"	}, /* 326 */
++	{ 4,	TD|TD,	sys_newfstatat,		"newfstatat"	}, /* 327 */
++	{ 3,	TD|TF,	sys_unlinkat,		"unlinkat"	}, /* 328 */
++	{ 4,	TD|TF,	sys_renameat,		"renameat"	}, /* 329 */
++	{ 5,	TD|TF,	sys_linkat,		"linkat"	}, /* 330 */
++	{ 3,	TD|TF,	sys_symlinkat,		"symlinkat"	}, /* 331 */
++	{ 4,	TD|TF,	sys_readlinkat,		"readlinkat"	}, /* 332 */
++	{ 3,	TD|TF,	sys_fchmodat,		"fchmodat"	}, /* 333 */
++	{ 3,	TD|TF,	sys_faccessat,		"faccessat"	}, /* 334 */
+ 	{ 5,	0,	printargs,		"SYS_335"	}, /* 335 */
+ 	{ 5,	0,	printargs,		"SYS_336"	}, /* 336 */
+-	{ 5,	0,	printargs,		"SYS_337"	}, /* 337 */
+-	{ 5,	0,	printargs,		"SYS_338"	}, /* 338 */
+-	{ 5,	0,	printargs,		"SYS_339"	}, /* 339 */
+-	{ 5,	0,	printargs,		"SYS_340"	}, /* 340 */
++	{ 1,	TP,	sys_unshare,		"unshare"	}, /* 337 */
++	{ 2,	0,	printargs,		"set_robust_list" }, /* 338 */
++	{ 3,	0,	printargs,		"get_robust_list" }, /* 339 */
++	{ 6,	TD,	printargs,		"splice"	}, /* 340 */
+ 	{ 5,	0,	printargs,		"SYS_341"	}, /* 341 */
+-	{ 5,	0,	printargs,		"SYS_342"	}, /* 342 */
+-	{ 5,	0,	printargs,		"SYS_343"	}, /* 343 */
++	{ 4,	TD,	printargs,		"tee"		}, /* 342 */
++	{ 4,	TD,	printargs,		"vmsplice"	}, /* 343 */
+ 	{ 6,	0,	sys_move_pages,		"move_pages"	}, /* 344 */
+ 	{ 3,	0,	sys_getcpu,		"getcpu"	}, /* 345 */
+ 	{ 5,	0,	printargs,		"SYS_346"	}, /* 346 */
+-	{ 5,	0,	printargs,		"SYS_347"	}, /* 347 */
+-	{ 5,	0,	printargs,		"SYS_348"	}, /* 348 */
++	{ 5,	0,	printargs,		"kexec_load"	}, /* 347 */
++	{ 4,	TD|TF,	sys_utimensat,		"utimensat"	}, /* 348 */
+ 	{ 3,	TD|TS,	sys_signalfd,		"signalfd"	}, /* 349 */
+ 	{ 4,	TD,	sys_timerfd,		"timerfd"	}, /* 350 */
+ 	{ 1,	TD,	sys_eventfd,		"eventfd"	}, /* 351 */
+-	{ 5,	0,	printargs,		"SYS_352"	}, /* 352 */
+-	{ 5,	0,	printargs,		"SYS_353"	}, /* 353 */
+-	{ 5,	0,	printargs,		"SYS_354"	}, /* 354 */
++	{ 6,	TF,	sys_fallocate,		"fallocate"	}, /* 352 */
++	{ 4,	TD,	sys_timerfd_settime,	"timerfd_settime"}, /* 353 */
++	{ 2,	TD,	sys_timerfd_gettime,	"timerfd_gettime"}, /* 354 */
+ 	{ 5,	0,	printargs,		"SYS_355"	}, /* 355 */
+ 	{ 5,	0,	printargs,		"SYS_356"	}, /* 356 */
+ 	{ 5,	0,	printargs,		"SYS_357"	}, /* 357 */
+	
\ No newline at end of file
diff --git a/recipes/strace/strace-4.5.18/strace-arm-no-cachectl.patch b/recipes/strace/strace-4.5.18/strace-arm-no-cachectl.patch
new file mode 100644
index 0000000..b71995d
--- /dev/null
+++ b/recipes/strace/strace-4.5.18/strace-arm-no-cachectl.patch
@@ -0,0 +1,34 @@
+
+
+This patch is needed on newer uclibc becuase the uclibc header generation mechanism generates the sysnum.h properly NR_cacheflush is defined for ARM but there is no cachectl.h file which is exported to userspace. Strace assumes that if SYS_cacheflush is defined than it icludes asm/cachectl.h which breaks the build for ARM now.
+
+This patch adds a check for ARM architecture.
+
+-Khem
+
+Here is error
+
+| if ccache arm-angstrom-linux-uclibcgnueabi-gcc -march=armv5te -mtune=arm926ej-s -DHAVE_CONFIG_H -I. -I. -I. -Ilinux/arm -I./linux/arm -Ilinux -I./linux  -isystem/home/kraj/work/oe/build/uclibc/tmp-omap5912osk/staging/arm-angstrom-linux-uclibcgnueabi/usr/include -Wall -isystem/home/kraj/work/oe/build/uclibc/tmp-omap5912osk/staging/arm-angstrom-linux-uclibcgnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -MT term.o -MD -MP -MF ".deps/term.Tpo" -c -o term.o term.c; \
+| 	then mv -f ".deps/term.Tpo" ".deps/term.Po"; else rm -f ".deps/term.Tpo"; exit 1; fi
+| system.c:69:26: error: asm/cachectl.h: No such file or directory
+| make[1]: *** [system.o] Error 1
+| make[1]: *** Waiting for unfinished jobs....
+| signal.c: In function 'sys_sigreturn':
+| signal.c:1221: warning: passing argument 4 of 'ptrace' makes integer from pointer without a cast
+| make[1]: Leaving directory `/home/kraj/work/oe/build/uclibc/tmp-omap5912osk/work/armv5te-angstrom-linux-uclibcgnueabi/strace-4.5.14-r5/strace-4.5.14'
+| make: *** [all] Error 2
+| FATAL: oe_runmake failed
+
+Index: strace-4.5.14/system.c
+===================================================================
+--- strace-4.5.14.orig/system.c	2008-05-15 20:23:16.000000000 -0700
++++ strace-4.5.14/system.c	2008-05-15 20:24:03.000000000 -0700
+@@ -65,7 +65,7 @@
+ #include <linux/capability.h>
+ #endif
+ 
+-#ifdef SYS_cacheflush
++#if defined SYS_cacheflush && !defined ARM
+ #include <asm/cachectl.h>
+ #endif
+ 
diff --git a/recipes/strace/strace_4.5.18.bb b/recipes/strace/strace_4.5.18.bb
new file mode 100644
index 0000000..d3ebbf6
--- /dev/null
+++ b/recipes/strace/strace_4.5.18.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "strace is a system call tracing tool."
+SECTION = "console/utils"
+LICENSE = "GPL"
+PR = "r1"
+
+# only arm tested
+DEFAULT_PREFERENCE = "-1"
+#DEFAULT_PREFERENCE_arm = "1"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.bz2 \
+	   file://strace-4.5.17-arm-syscalls.patch;patch=1 \
+	   file://strace-arm-no-cachectl.patch;patch=1"
+
+inherit autotools
-- 
1.6.4.3


--=_iohazard.net-32356-1253441350-0001-2--
