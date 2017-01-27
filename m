Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 438B1606A8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 10:11:59 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id v96so57250460ioi.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 02:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=v5hc2WNc4vzJ5ME9tEhL1sj+ywO0xbWmqxx6voalS04=;
	b=M7bo06FcDHndDQMSXs+CL6YMkE9tlOQzZ88VByMPdg3k75LE7m+Xj/djZDwb/MBC4z
	YthsqK6CC/uWfs6O/Fvi0anY55YN+UBiUJfuOxRZ6Qy10mw9kj6jzd3N7vZre959JDyj
	xLch4NqoDWPCAV+haMRtlZMDRqG9KyaoW3SPSjUgQTb9/zmB214QW3DvrSDlbXpO6aki
	jtNfbNe+DX41MbC4nqvM0osIzh6dgXNyDwe7DKOnLZ3wmKjIq2ef0wZ42ejqIEjI8Eyh
	0LEXHdBMmt1vy4QD33yTn8FFNgFz5mjYzkJoZT/XeyNDdwoe2Dg4HxzytleVtv1eDMqs
	X9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=v5hc2WNc4vzJ5ME9tEhL1sj+ywO0xbWmqxx6voalS04=;
	b=aAKx6eDUKAcKPFF1HlZ6+EWvlXk2LHFfTySqlkDnU5PaWZanN0q/NBtVe1xnOnca+M
	yflGj1J1R2w03iRApKUDqaHBbw4v5SMAgY38z2dbzxh1JnMPTZqn7wPzZ7cFTj1XBLHl
	zVAeOTQ/VdTwiduCbAy/PYFUYEm0QefyPqPIHwckFv96pPwy5VcsTd7PkqgEnNRFJEdi
	dBGJC8jhWkcUXkXBwZrJq3TQUMiAQYy/9baK0YRQ3NNvcvHfIV9DTW01NmpUATyjGN6L
	LebP2R62wyYFfInokGZZbZ12IrF7I1m76pHAwliZDosSHMomn5FdPFrpnoybuwshjI1/
	r1lA==
X-Gm-Message-State: AIkVDXJxX6obxyzm71e6bfoocIzXUilPInkvQc2zEm9tSsy9Uvjxi5sYFjf0zQU2ma49XxR7
X-Received: by 10.107.44.74 with SMTP id s71mr7307091ios.111.1485511920269;
	Fri, 27 Jan 2017 02:12:00 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8DB2E.dip0.t-ipconnect.de.
	[93.232.219.46])
	by smtp.gmail.com with ESMTPSA id y71sm1172175itb.1.2017.01.27.02.11.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jan 2017 02:11:59 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jan 2017 11:11:22 +0100
Message-Id: <598b040880601e5fc0b349e4d5cea32d22fcfe48.1485511836.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.c0833b943acf2f997b54ea7a5284afcdeaf3b924.1485511836.git-series.patrick.ohly@intel.com>
References: <cover.c0833b943acf2f997b54ea7a5284afcdeaf3b924.1485511836.git-series.patrick.ohly@intel.com>
Subject: [meta-oe][PATCH 2/2] multipath-tools: update to 0.6.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jan 2017 10:12:00 -0000

No particular reason for updating besides following upstream.

Only kpartx has been tested after updating! Seems to work as before;
unfortunately that means that as in 0.5.0, "kpartx -d" doesn't do
anything.

Upstream refreshed the COPYING file, hence the checksum change:
$ git log --oneline 0.5.0..HEAD COPYING
bf05f63 multipath-tools: replace COPYING with a fresh copy from gnu.org
1d6c88a Update FSF address

The QA error that do-not-link-libmpathpersist-to-TMPDIR.patch fixes
no longer occurs because upstream changed that particular part of
the Makefile.

A new patch is needed to avoid building libcheckerrdb, which depends
on the (currently) unavailable librados.

The other patches had to be refreshed.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta-oe/recipes-support/multipath-tools/files/0001-multipathd.service-Error-fix.patch           | 10 +++++-----
 meta-oe/recipes-support/multipath-tools/files/always-use-libdevmapper-kpartx.patch              | 25 ++++++++++++++++---------
 meta-oe/recipes-support/multipath-tools/files/always-use-libdevmapper.patch                     | 53 +++++++++++++++++++++++++++++++++--------------------
 meta-oe/recipes-support/multipath-tools/files/checkers-disable-libcheckrbd.so.patch             | 31 +++++++++++++++++++++++++++++++
 meta-oe/recipes-support/multipath-tools/files/do-not-link-libmpathpersist-to-TMPDIR.patch       | 30 ------------------------------
 meta-oe/recipes-support/multipath-tools/files/makefile_inc.patch                                | 38 +++++++++++++++++++++++++++++---------
 meta-oe/recipes-support/multipath-tools/files/shared-libs-avoid-linking-.so-as-executable.patch | 44 +++++++++++++++++++++++++-------------------
 meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb                                  | 32 +++++++-------------------------
 8 files changed, 146 insertions(+), 117 deletions(-)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/checkers-disable-libcheckrbd.so.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/do-not-link-libmpathpersist-to-TMPDIR.patch

diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-multipathd.service-Error-fix.patch b/meta-oe/recipes-support/multipath-tools/files/0001-multipathd.service-Error-fix.patch
index 1e48e1c..60c3c0a 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0001-multipathd.service-Error-fix.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0001-multipathd.service-Error-fix.patch
@@ -1,4 +1,4 @@
-From 74ff5e1cf8ef83dabcf6e6b92f87d6761f7f4d51 Mon Sep 17 00:00:00 2001
+From 630483b9738349c8b3e637a00879b96834a33cdb Mon Sep 17 00:00:00 2001
 From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Tue, 7 Jul 2015 11:34:36 +0900
 Subject: [PATCH] multipathd.service: Error fix
@@ -13,10 +13,10 @@ Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
  1 file changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/multipathd/multipathd.service b/multipathd/multipathd.service
-index be3ba3f..b8d3ecd 100644
+index e3d6f91..a7e00b2 100644
 --- a/multipathd/multipathd.service
 +++ b/multipathd/multipathd.service
-@@ -6,11 +6,12 @@ DefaultDependencies=no
+@@ -8,11 +8,12 @@ Wants=local-fs-pre.target multipathd.socket blk-availability.service
  Conflicts=shutdown.target
  
  [Service]
@@ -25,12 +25,12 @@ index be3ba3f..b8d3ecd 100644
  NotifyAccess=main
  LimitCORE=infinity
 +PIDFile=/var/run/multipathd.pid
- ExecStartPre=/sbin/modprobe dm-multipath
+ ExecStartPre=/sbin/modprobe -a scsi_dh_alua scsi_dh_emc scsi_dh_rdac dm-multipath
 -ExecStart=/sbin/multipathd -d -s
 +ExecStart=/sbin/multipathd
  ExecReload=/sbin/multipathd reconfigure
  
  [Install]
 -- 
-1.8.4.2
+2.11.0
 
diff --git a/meta-oe/recipes-support/multipath-tools/files/always-use-libdevmapper-kpartx.patch b/meta-oe/recipes-support/multipath-tools/files/always-use-libdevmapper-kpartx.patch
index a16a854..803e52c 100644
--- a/meta-oe/recipes-support/multipath-tools/files/always-use-libdevmapper-kpartx.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/always-use-libdevmapper-kpartx.patch
@@ -1,4 +1,7 @@
-Always use devmapper for kpartx
+From 7267cf235fc052eaa1ca36e437096576edacb131 Mon Sep 17 00:00:00 2001
+From: Aws Ismail <aws.ismail@windriver.com>
+Date: Mon, 22 Sep 2014 17:22:32 -0700
+Subject: [PATCH] Always use devmapper for kpartx
 
 Do not try to compute the LIBDM_API_COOKIE make variable
 from host information when cross-compiling.
@@ -7,23 +10,27 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
 Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+ kpartx/Makefile | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/kpartx/Makefile b/kpartx/Makefile
-index 2a07334..24bdabc 100644
+index e8a59f2..e694a65 100644
 --- a/kpartx/Makefile
 +++ b/kpartx/Makefile
-@@ -4,13 +4,7 @@
- #
- include ../Makefile.inc
+@@ -7,11 +7,7 @@ CFLAGS += -I. -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
+ 
+ LIBDEPS += -ldevmapper
  
--CFLAGS += -I. -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
--
 -LIBDM_API_COOKIE = $(shell grep -Ecs '^[a-z]*[[:space:]]+dm_task_set_cookie' /usr/include/libdevmapper.h)
 -
 -ifneq ($(strip $(LIBDM_API_COOKIE)),0)
 -	CFLAGS += -DLIBDM_API_COOKIE
 -endif
-+CFLAGS += -I. -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DLIBDM_API_COOKIE
++CFLAGS += -DLIBDM_API_COOKIE
  
- LDFLAGS = -ldevmapper
  OBJS = bsd.o dos.o kpartx.o solaris.o unixware.o dasd.o sun.o \
+ 	gpt.o mac.o ps3.o crc32.o lopart.o xstrncpy.o devmapper.o
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/always-use-libdevmapper.patch b/meta-oe/recipes-support/multipath-tools/files/always-use-libdevmapper.patch
index 89d2352..33834f6 100644
--- a/meta-oe/recipes-support/multipath-tools/files/always-use-libdevmapper.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/always-use-libdevmapper.patch
@@ -1,4 +1,7 @@
-Always use devmapper
+From c4f0dba4e86bfa20252fcc8218398e7468ca9149 Mon Sep 17 00:00:00 2001
+From: Aws Ismail <aws.ismail@windriver.com>
+Date: Mon, 22 Sep 2014 17:22:32 -0700
+Subject: [PATCH] Always use devmapper
 
 Do not try to compute several _API_ make variables
 from host information when cross-compiling.
@@ -7,38 +10,48 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
 Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+ libmultipath/Makefile | 27 ++++-----------------------
+ 1 file changed, 4 insertions(+), 23 deletions(-)
 
 diff --git a/libmultipath/Makefile b/libmultipath/Makefile
-index e5b06b3..efd6cf6 100644
+index 495cebe..9626e69 100644
 --- a/libmultipath/Makefile
 +++ b/libmultipath/Makefile
-@@ -17,23 +17,18 @@ OBJS = memory.o parser.o vector.o devmapper.o \
-        log.o configure.o structs_vec.o sysfs.o prio.o checkers.o \
-        lock.o waiter.o file.o wwids.o
+@@ -20,29 +20,10 @@ ifdef SYSTEMD
+ 	endif
+ endif
  
 -LIBDM_API_FLUSH = $(shell grep -Ecs '^[a-z]*[[:space:]]+dm_task_no_flush' /usr/include/libdevmapper.h)
- 
+-
 -ifneq ($(strip $(LIBDM_API_FLUSH)),0)
-+#ifneq ($(strip $(LIBDM_API_FLUSH)),0)
- 	CFLAGS += -DLIBDM_API_FLUSH -D_GNU_SOURCE
+-	CFLAGS += -DLIBDM_API_FLUSH -D_GNU_SOURCE
 -endif
-+#endif
- 
+-
 -LIBDM_API_COOKIE = $(shell grep -Ecs '^[a-z]*[[:space:]]+dm_task_set_cookie' /usr/include/libdevmapper.h)
 -
 -ifneq ($(strip $(LIBDM_API_COOKIE)),0)
-+#ifneq ($(strip $(LIBDM_API_COOKIE)),0)
- 	CFLAGS += -DLIBDM_API_COOKIE
+-	CFLAGS += -DLIBDM_API_COOKIE
 -endif
 -
--LIBUDEV_API_RECVBUF = $(shell grep -Ecs '^[a-z]*[[:space:]]+udev_monitor_set_resolve_buffer_size' /usr/include/libudev.h)
-+#endif
- 
+-LIBUDEV_API_RECVBUF = $(shell grep -Ecs '^[a-z]*[[:space:]]+udev_monitor_set_receive_buffer_size' /usr/include/libudev.h)
+-
 -ifneq ($(strip $(LIBUDEV_API_RECVBUF)),0)
-+#ifneq ($(strip $(LIBUDEV_API_RECVBUF)),0)
- 	CFLAGS += -DLIBUDEV_API_RECVBUF
+-	CFLAGS += -DLIBUDEV_API_RECVBUF
 -endif
-+#endif
- 
+-
+-LIBDM_API_DEFERRED = $(shell grep -Ecs '^[a-z]*[[:space:]]+dm_task_deferred_remove' /usr/include/libdevmapper.h)
+-
+-ifneq ($(strip $(LIBDM_API_DEFERRED)),0)
+-	CFLAGS += -DLIBDM_API_DEFERRED
+-endif
++CFLAGS += -DLIBDM_API_FLUSH -D_GNU_SOURCE
++CFLAGS += -DLIBDM_API_COOKIE
++CFLAGS += -DLIBUDEV_API_RECVBUF
++CFLAGS += -DLIBDM_API_DEFERRED
  
- all: $(LIBS)
+ OBJS = memory.o parser.o vector.o devmapper.o callout.o \
+ 	hwtable.o blacklist.o util.o dmparser.o config.o \
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/checkers-disable-libcheckrbd.so.patch b/meta-oe/recipes-support/multipath-tools/files/checkers-disable-libcheckrbd.so.patch
new file mode 100644
index 0000000..908a516
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/checkers-disable-libcheckrbd.so.patch
@@ -0,0 +1,31 @@
+From 148b848f45957e5e1c0466e8c79c84ba4a0bf241 Mon Sep 17 00:00:00 2001
+From: Patrick Ohly <patrick.ohly@intel.com>
+Date: Fri, 27 Jan 2017 10:35:54 +0100
+Subject: [PATCH] checkers: disable libcheckrbd.so
+
+libcheckrbd.so depends on librados, which is not currently available
+as a recipe. These checkers seem to be optional, so for now we merely
+disable compilation of libcheckrbd.so.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
+---
+ libmultipath/checkers/Makefile | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/libmultipath/checkers/Makefile b/libmultipath/checkers/Makefile
+index 11ab76f..c848d50 100644
+--- a/libmultipath/checkers/Makefile
++++ b/libmultipath/checkers/Makefile
+@@ -14,7 +14,6 @@ LIBS= \
+ 	libcheckemc_clariion.so \
+ 	libcheckhp_sw.so \
+ 	libcheckrdac.so \
+-	libcheckrbd.so
+ 
+ all: $(LIBS)
+ 
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/do-not-link-libmpathpersist-to-TMPDIR.patch b/meta-oe/recipes-support/multipath-tools/files/do-not-link-libmpathpersist-to-TMPDIR.patch
deleted file mode 100644
index 86d5e0e..0000000
--- a/meta-oe/recipes-support/multipath-tools/files/do-not-link-libmpathpersist-to-TMPDIR.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From fe65ac8face3c88d9d4e12811f44e63ad72c59ae Mon Sep 17 00:00:00 2001
-From: Bian Naimeng <biannm@cn.fujitsu.com>
-Date: Thu, 18 Jun 2015 12:25:25 +0900
-Subject: [PATCH] fix build warning
-
-  NOTE: Executing RunQueue Tasks
-  WARNING: QA Issue: Symlink /lib/libmpathpersist.so in multipath-tools-dev points to TMPDIR [symlink-to-sysroot]
-  NOTE: Tasks Summary: Attempted 1604 tasks of which 1591 didn't need to be rerun and all succeeded.
-
-Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
----
- libmpathpersist/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libmpathpersist/Makefile b/libmpathpersist/Makefile
-index c4ec1c5..62022eb 100644
---- a/libmpathpersist/Makefile
-+++ b/libmpathpersist/Makefile
-@@ -32,7 +32,7 @@ install: $(LIBS)
- 	$(INSTALL_PROGRAM) -m 755 -d $(DESTDIR)$(man3dir)
- 	$(INSTALL_PROGRAM) -m 755 -d $(DESTDIR)/usr/include/
- 	$(INSTALL_PROGRAM) -m 755 -d $(DESTDIR)/usr/share/doc/mpathpersist/
--	ln -sf $(DESTDIR)$(syslibdir)/$(LIBS) $(DESTDIR)$(syslibdir)/$(DEVLIB)
-+	ln -sf $(syslibdir)/$(LIBS) $(DESTDIR)$(syslibdir)/$(DEVLIB)
- 	install -m 644 mpath_persistent_reserve_in.3.gz $(DESTDIR)$(man3dir)	
- 	install -m 644 mpath_persistent_reserve_out.3.gz $(DESTDIR)$(man3dir)	
- 	install -m 644 mpath_persist.h $(DESTDIR)/usr/include/
--- 
-1.8.4.2
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/makefile_inc.patch b/meta-oe/recipes-support/multipath-tools/files/makefile_inc.patch
index 71963e0..5b7b696 100644
--- a/meta-oe/recipes-support/multipath-tools/files/makefile_inc.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/makefile_inc.patch
@@ -1,4 +1,8 @@
-multipath-tools: modify Makefile.inc for cross-compilation
+From 9f5768eca165502b0f17d271aa6f7cf530ec60b2 Mon Sep 17 00:00:00 2001
+From: Joe Slater <joe.slater@windriver.com>
+Date: Mon, 22 Sep 2014 17:22:32 -0700
+Subject: [PATCH] multipath-tools: modify Makefile.inc for
+ cross-compilation
 
 Do not look for systemd info on the host, and allow us to pass in CFLAGS
 using the OPTFLAGS variable.
@@ -10,10 +14,15 @@ Signed-off-by: Joe Slater <joe.slater@windriver.com>
 Update for version 0.5.0-144-g770e6d0
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ Makefile.inc | 17 +++++------------
+ 1 file changed, 5 insertions(+), 12 deletions(-)
 
+diff --git a/Makefile.inc b/Makefile.inc
+index 1cc8f44..15f8b91 100644
 --- a/Makefile.inc
 +++ b/Makefile.inc
-@@ -21,12 +21,6 @@ ifndef LIB
+@@ -29,12 +29,6 @@ ifndef RUN
  	endif
  endif
  
@@ -26,14 +35,25 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  ifndef SYSTEMDPATH
  	SYSTEMDPATH=usr/lib
  endif
-@@ -53,7 +47,10 @@ ifndef RPM_OPT_FLAGS
- 	RPM_OPT_FLAGS = -O2 -g -pipe -Wformat-security -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4
- endif
+@@ -61,13 +55,12 @@ RM		= rm -f
+ LN		= ln -sf
+ INSTALL_PROGRAM	= install
  
+-OPTFLAGS	= -O2 -g -pipe -Wall -Wextra -Wformat=2 \
+-		  -Wno-sign-compare -Wno-unused-parameter -Wno-clobbered \
+-		  -Wp,-D_FORTIFY_SOURCE=2 -fstack-protector \
+-		  --param=ssp-buffer-size=4
 +ifndef OPTFLAGS
- OPTFLAGS     = $(RPM_OPT_FLAGS) -Wunused -Wstrict-prototypes
++OPTFLAGS     = $(RPM_OPT_FLAGS) -Wunused -Wstrict-prototypes
 +endif
-+
- CFLAGS	     = $(OPTFLAGS) -fPIC -DLIB_STRING=\"${LIB}\"
- SHARED_FLAGS = -shared
  
+-CFLAGS		= $(OPTFLAGS) -fPIC -DLIB_STRING=\"${LIB}\" -DRUN_DIR=\"${RUN}\"
+-SHARED_FLAGS	= -shared
++CFLAGS	     = $(OPTFLAGS) -fPIC -DLIB_STRING=\"${LIB}\" -DRUN_DIR=\"${RUN}\"
++SHARED_FLAGS = -shared
+ 
+ %.o:	%.c
+ 	$(CC) $(CFLAGS) -c -o $@ $<
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/shared-libs-avoid-linking-.so-as-executable.patch b/meta-oe/recipes-support/multipath-tools/files/shared-libs-avoid-linking-.so-as-executable.patch
index ae6bb89..88579e6 100644
--- a/meta-oe/recipes-support/multipath-tools/files/shared-libs-avoid-linking-.so-as-executable.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/shared-libs-avoid-linking-.so-as-executable.patch
@@ -14,36 +14,42 @@ Upstream-Status: Inappropriate [OE specific, -pie shouldn't be in CFLAGS?!]
 
 Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
 ---
- libmpathpersist/Makefile | 2 +-
- libmultipath/Makefile    | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
+diff --git a/libmpathcmd/Makefile b/libmpathcmd/Makefile
+index 457c4ca..f68c82c 100644
+--- a/libmpathcmd/Makefile
++++ b/libmpathcmd/Makefile
+@@ -9,7 +9,7 @@ OBJS = mpath_cmd.o
+ all: $(LIBS)
+ 
+ $(LIBS): $(OBJS)
+-	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -Wl,-soname=$@ $(CFLAGS) -o $@ $(OBJS) $(LIBDEPS)
++	$(CC) $(LDFLAGS) $(CFLAGS) $(SHARED_FLAGS) -Wl,-soname=$@ -o $@ $(OBJS) $(LIBDEPS)
+ 	$(LN) $@ $(DEVLIB)
+ 
+ install: $(LIBS)
 diff --git a/libmpathpersist/Makefile b/libmpathpersist/Makefile
-index c4ec1c5..790692a 100644
+index 6e43427..2486302 100644
 --- a/libmpathpersist/Makefile
 +++ b/libmpathpersist/Makefile
-@@ -20,7 +20,7 @@ all: $(LIBS)
+@@ -15,7 +15,7 @@ all: $(LIBS)
  
- $(LIBS): 
- 	$(CC) -Wall -fPIC -c $(CFLAGS) *.c 
--	$(CC)  -shared $(LIBDEPS) -Wl,-soname=$@ $(CFLAGS) -o $@ $(OBJS)
-+	$(CC) $(LIBDEPS) $(CFLAGS) $(SHARED_FLAGS) -Wl,-soname=$@ -o $@ $(OBJS)
- 	ln -s $(LIBS) $(DEVLIB)
- 	$(GZIP) mpath_persistent_reserve_in.3 > mpath_persistent_reserve_in.3.gz	
- 	$(GZIP) mpath_persistent_reserve_out.3 > mpath_persistent_reserve_out.3.gz	
+ $(LIBS):
+ 	$(CC) -c $(CFLAGS) *.c
+-	$(CC) $(LDFLAGS) $(SHARED_FLAGS) $(LIBDEPS) -Wl,-soname=$@ $(CFLAGS) -o $@ $(OBJS)
++	$(CC) $(LDFLAGS) $(CFLAGS) $(SHARED_FLAGS) $(LIBDEPS) -Wl,-soname=$@ -o $@ $(OBJS)
+ 	$(LN) $(LIBS) $(DEVLIB)
+ 	$(GZIP) mpath_persistent_reserve_in.3 > mpath_persistent_reserve_in.3.gz
+ 	$(GZIP) mpath_persistent_reserve_out.3 > mpath_persistent_reserve_out.3.gz
 diff --git a/libmultipath/Makefile b/libmultipath/Makefile
-index fc0f3d6..2287d91 100644
+index 495cebe..752bcc0 100644
 --- a/libmultipath/Makefile
 +++ b/libmultipath/Makefile
-@@ -55,7 +55,7 @@ endif
+@@ -55,7 +55,7 @@ OBJS = memory.o parser.o vector.o devmapper.o callout.o \
  all: $(LIBS)
  
  $(LIBS): $(OBJS)
 -	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -Wl,-soname=$@ $(CFLAGS) -o $@ $(OBJS) $(LIBDEPS)
 +	$(CC) $(LDFLAGS) $(CFLAGS) $(SHARED_FLAGS) -Wl,-soname=$@ -o $@ $(OBJS) $(LIBDEPS)
- 	ln -sf $@ $(DEVLIB)
+ 	$(LN) $@ $(DEVLIB)
  
  install:
--- 
-2.11.0
-
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
index 2ab4dad..e107c8f 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
@@ -1,6 +1,6 @@
 SUMMARY = "The upstream project used to drive the Device Mapper multipathing driver"
 
-DEPENDS = "lvm2 libaio readline udev"
+DEPENDS = "lvm2 libaio liburcu readline udev"
 
 LICENSE = "LGPLv2"
 
@@ -9,36 +9,21 @@ SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http \
            file://makefile_inc.patch \
            file://always-use-libdevmapper.patch \
            file://always-use-libdevmapper-kpartx.patch \
-           file://do-not-link-libmpathpersist-to-TMPDIR.patch \
            file://0001-multipathd.service-Error-fix.patch \
            file://shared-libs-avoid-linking-.so-as-executable.patch \
+           file://checkers-disable-libcheckrbd.so.patch \
            "
-# 0.5.0
-#
-#SRCREV = "82f391e787dc02e9d9294aa391137ab424bb83c4"
-#LIC_FILES_CHKSUM = "file://COPYING;md5=7be2873b6270e45abacc503abbe2aa3d"
-
-# 0.5.0 + commits thru 7/18/2014
-#
-#SRCREV = "0d72f46c12207a6b7b89f5ef4f5ab5f87ed8bc90"
-#LIC_FILES_CHKSUM = "file://COPYING;md5=b06690e7a95c166eefe0199b39118eb1"
-
-# 0.5.0 + commits thru 9/12/2014
-#
-#    includes important systemd related structure size fix
-#
-#SRCREV = "aec68ab217fd2956443b27ceeb97dd6475267789"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b06690e7a95c166eefe0199b39118eb1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
-# 0.5.0 + commits thru 2/16/2015
-SRCREV = "770e6d0da035deaced82885939161c2b69225e10"
+# 0.6.4
+SRCREV = "922421cf795d53d339862bb2d99f1a85c96ad9a3"
 
 inherit systemd
 
 
 S = "${WORKDIR}/git"
 
-PV = "0.5.0+git${@'${SRCPV}'.split('+')[-1]}"
+PV = "0.6.4+git${@'${SRCPV}'.split('+')[-1]}"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
@@ -54,12 +39,9 @@ EXTRA_OEMAKE = 'MULTIPATH_VERSION=${PV} DESTDIR=${D} syslibdir=${base_libdir} \
 do_install() {
     oe_runmake install
 
-    # Copy a sample conf file, but do not rename it multipath.conf.
-    #
-    cp multipath.conf.defaults ${D}${sysconfdir}
-
     # We copy an initscript, but do not start multipathd at init time.
     #
+    install -d ${D}${sysconfdir}/init.d
     cp ${WORKDIR}/multipathd.oe ${D}${sysconfdir}/init.d/multipathd
 
 }
-- 
git-series 0.9.1

