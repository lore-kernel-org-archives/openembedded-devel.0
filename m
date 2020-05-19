Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web10.12998.1589899425652220290
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2020 07:43:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FfIhkBwF;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id 23so6637415pfy.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2020 07:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/oaLnjHUqo9ZTF84DyEJdlB9H9XEkf5P6/OtkyUSK60=;
        b=FfIhkBwFRF2eklDDSV6+EfwiPDR65hjgleA1gw4PHC1ZA8plOcNIqOWSOqwCDig+G9
         Q3QmUusblcuIFSZ5YxSNGVa2Kjog4tSVC3exLE5ZY+o+XHnO2fTzlrbJ1gC+ybI1Rt7s
         jxiLWvXpp9JG6HkwINFpX6wzBc/zQchKJsCD0mfxHtdDIEU09tQLKDZ2qIOCFLiNxgko
         58UsfirZYB2rmsYtwv1xoVWX5bjxPXkcoiH0HwM5jZWINPUrWLZfjmew4u+m689ipdrS
         zct+/rH+OX7pYD5iLjq9MMTzWUhHgoufewIpkav0rg0MKLA1XnI/qoUu4HsxTsVzPHOp
         klDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/oaLnjHUqo9ZTF84DyEJdlB9H9XEkf5P6/OtkyUSK60=;
        b=nrgfWj3ZlBaQ0X672aHz+i9ZTSS92zTipRXapX1EG81uQuKnc6REeue26W9tE57mrU
         VnNVfSsSzBalvBkzETJGVosH8ZE6vIg0DRrlKYcHcyMaWCZV1hMEnllC9xnB7YybZtch
         f0Dum8IzWI0bsJdKsdLgSUdRGX2BKUoM276Bnr9aUv9StPG4XrBJcBCF5Ub7uMOX9bCO
         0XOzOLWN40Bd/5Lt2ZnlsYp4yk8QsqKGQtw/DEm/UNTrk78BCbwm8+7nU0/XfyZBdSHQ
         IdcU5/WPoQSgCAYcCvg9iIRF88Xo7Hf6X/QjsAdsp6Z4XrWNtwX90n7Jn9t4YGb7L0rX
         eQUQ==
X-Gm-Message-State: AOAM533ypVB7/TUrLRS0OBWaPr0V4ssmnemSC1RVbA0fJSb+H8ikX6W7
	6oiClaMkWOzWX7krtReiByn0A6Ic
X-Google-Smtp-Source: ABdhPJy+zUCEimj/VN0Hs/fViCt25/cDC4LYhzanfMq4tcw/o1JwKrJPav9W+4YtxNvXcS1/B/xbcA==
X-Received: by 2002:a62:19cf:: with SMTP id 198mr8105683pfz.247.1589899424720;
        Tue, 19 May 2020 07:43:44 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9de6:6921:ec78:716d])
        by smtp.gmail.com with ESMTPSA id h3sm2382099pjk.10.2020.05.19.07.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 07:43:43 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [dunfell][PATCH 09/18] multipath-tools: upgrade 0.8.3 -> 0.8.4
Date: Tue, 19 May 2020 07:43:23 -0700
Message-Id: <20200519144332.12822-9-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519144332.12822-1-akuster808@gmail.com>
References: <20200519144332.12822-1-akuster808@gmail.com>

From: Wang Mingyu <wangmy@cn.fujitsu.com>

refresh the following patches:
0024-RH-use-rpm-optflags-if-present.patch
0026-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch

add patch 0001-fix-bug-of-do_compile-and-do_install.patch to fix
the bug of do_conpile and do_install

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0b98738428a67549775ec8bd603ed7ff9506e272)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...fix-bug-of-do_compile-and-do_install.patch | 44 +++++++++
 .../0024-RH-use-rpm-optflags-if-present.patch | 33 ++++---
 ...om-kernel-cmdline-mpath.wwids-with-A.patch | 93 +++----------------
 ...ools_0.8.3.bb => multipath-tools_0.8.4.bb} |  3 +-
 4 files changed, 77 insertions(+), 96 deletions(-)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-fix-bug-of-do_compile-and-do_install.patch
 rename meta-oe/recipes-support/multipath-tools/{multipath-tools_0.8.3.bb => multipath-tools_0.8.4.bb} (97%)

diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-fix-bug-of-do_compile-and-do_install.patch b/meta-oe/recipes-support/multipath-tools/files/0001-fix-bug-of-do_compile-and-do_install.patch
new file mode 100644
index 0000000000..ac87337694
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0001-fix-bug-of-do_compile-and-do_install.patch
@@ -0,0 +1,44 @@
+From fd90d952edaa4b27e62a29fdba7a201288d440eb Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@cn.fujitsu.com>
+Date: Sun, 10 May 2020 21:22:53 +0800
+Subject: [PATCH] fix bug of do_compile and do_install
+
+when multiple processes make run in parallel,
+because of dependency error will occur.
+
+Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
+---
+ Makefile | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 1dee3680..bea0a0b2 100644
+--- a/Makefile
++++ b/Makefile
+@@ -28,9 +28,22 @@ all:	$(BUILDDIRS)
+ $(BUILDDIRS):
+ 	$(MAKE) -C $@
+ 
+-multipath multipathd mpathpersist: libmultipath
++multipath multipathd mpathpersist libmpathpersist : libmultipath
+ mpathpersist:  libmpathpersist
+ 
++DEPS_ON_MULTIPATH := \
++	multipath \
++	libmultipath/prioritizers \
++	libmultipath/checkers \
++	libmultipath/foreign \
++	multipathd \
++	mpathpersist \
++	libmpathpersist
++
++$(DEPS_ON_MULTIPATH:=.install): libmultipath.install
++mpathpersist.install:  libmpathpersist.install
++libdmmp.install libmultipath/foreign.install:  mpathpersist.install
++
+ $(BUILDDIRS.clean):
+ 	$(MAKE) -C ${@:.clean=} clean
+ 
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0024-RH-use-rpm-optflags-if-present.patch b/meta-oe/recipes-support/multipath-tools/files/0024-RH-use-rpm-optflags-if-present.patch
index 77dd96fee6..17542fd4fd 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0024-RH-use-rpm-optflags-if-present.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0024-RH-use-rpm-optflags-if-present.patch
@@ -1,9 +1,12 @@
 From 436f7594485e35523269e662c4b5dc3a2c10ff9b Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 26 Nov 2018 09:19:17 +0800
-Subject: [PATCH] From 0000000000000000000000000000000000000000 Mon Sep 17
- 00:00:00 2001 From: Benjamin Marzinski <bmarzins@redhat.com> Date: Wed, 19
- Apr 2017 06:10:01 -0500 Subject: [PATCH] RH: use rpm optflags if present
+Subject: [PATCH] From 0000000000000000000000000000000000000000 Mon Sep
+17
+ 00:00:00 2001 From: Benjamin Marzinski <bmarzins@redhat.com> Date: Wed,
+19
+ Apr 2017 06:10:01 -0500 Subject: [PATCH] RH: use rpm optflags if
+present
 
 Use the passed in optflags when compiling as an RPM, and keep the
 default flags as close as possible to the current fedora flags, while
@@ -17,26 +20,20 @@ update this patch to new version
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- Makefile.inc | 25 ++++++++++++++++---------
- 1 file changed, 16 insertions(+), 9 deletions(-)
+ Makefile.inc | 24 ++++++++++++++++--------
+ 1 file changed, 16 insertions(+), 8 deletions(-)
 
 diff --git a/Makefile.inc b/Makefile.inc
-index b86cba6..295afb9 100644
+index 42dbb5bf..55a06c60 100644
 --- a/Makefile.inc
 +++ b/Makefile.inc
-@@ -85,15 +85,22 @@ TEST_CC_OPTION = $(shell \
+@@ -89,15 +89,23 @@ TEST_CC_OPTION = $(shell \
  		echo "$(2)"; \
  	fi)
  
 -STACKPROT := $(call TEST_CC_OPTION,-fstack-protector-strong,-fstack-protector)
 -ERROR_DISCARDED_QUALIFIERS := $(call TEST_CC_OPTION,-Werror=discarded-qualifiers,)
--
--OPTFLAGS	= -O2 -g -pipe -Wall -Wextra -Wformat=2 -Werror=implicit-int \
--		  -Werror=implicit-function-declaration -Werror=format-security \
--		  -Wno-sign-compare -Wno-unused-parameter -Wno-clobbered \
--		  -Werror=cast-qual $(ERROR_DISCARDED_QUALIFIERS) \
--		  -Wp,-D_FORTIFY_SOURCE=2 $(STACKPROT) \
--		  --param=ssp-buffer-size=4
+-WNOCLOBBERED := $(call TEST_CC_OPTION,-Wno-clobbered,)
 +ifndef RPM_OPT_FLAGS
 +       STACKPROT := $(call TEST_CC_OPTION,-fstack-protector-strong,-fstack-protector)
 +       OPTFLAGS        = -O2 -g -pipe -Wall -Werror=format-security \
@@ -54,8 +51,14 @@ index b86cba6..295afb9 100644
 +                  -Wno-unused-parameter -Werror=cast-qual \
 +                  -Werror=discarded-qualifiers
  
+-OPTFLAGS	= -O2 -g -pipe -Werror -Wall -Wextra -Wformat=2 -Werror=implicit-int \
+-		  -Werror=implicit-function-declaration -Werror=format-security \
+-		  $(WNOCLOBBERED) \
+-		  -Werror=cast-qual $(ERROR_DISCARDED_QUALIFIERS) \
+-		  $(STACKPROT) --param=ssp-buffer-size=4
+ CPPFLAGS	:= -Wp,-D_FORTIFY_SOURCE=2 
  CFLAGS		:= $(OPTFLAGS) -DBIN_DIR=\"$(bindir)\" -DLIB_STRING=\"${LIB}\" -DRUN_DIR=\"${RUN}\" \
  		   -MMD -MP $(CFLAGS)
 -- 
-2.7.4
+2.17.1
 
diff --git a/meta-oe/recipes-support/multipath-tools/files/0026-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch b/meta-oe/recipes-support/multipath-tools/files/0026-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch
index 724bef813a..5fd6d668e2 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0026-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0026-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch
@@ -1,9 +1,12 @@
 From 0f54b3120ca06ff3168cdbf901a27b68c4638398 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 26 Sep 2019 16:29:48 +0800
-Subject: [PATCH] From 0000000000000000000000000000000000000000 Mon Sep 17 
- 00:00:00 2001 From: Benjamin Marzinski <bmarzins@redhat.com> Date: Fri, 17 
- Oct 2014 11:20:34 -0500 Subject: [PATCH] RH: add wwids from kernel cmdline 
+Subject: [PATCH] From 0000000000000000000000000000000000000000 Mon Sep
+17
+ 00:00:00 2001 From: Benjamin Marzinski <bmarzins@redhat.com> Date: Fri,
+17
+ Oct 2014 11:20:34 -0500 Subject: [PATCH] RH: add wwids from kernel
+cmdline
  mpath.wwids with -A
 
 This patch adds another option to multipath, "-A", which reads
@@ -23,18 +26,15 @@ Update this patch to new version 0.8.2
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- libmultipath/wwids.c          | 44 +++++++++++++++++++++++++++++++++++++++++++
- libmultipath/wwids.h          |  1 +
- multipath/main.c              |  9 ++++++++-
- multipath/multipath.8         |  3 +++
- multipathd/multipathd.service |  1 +
- 5 files changed, 57 insertions(+), 1 deletion(-)
+ libmultipath/wwids.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
+ libmultipath/wwids.h |  1 +
+ 2 files changed, 45 insertions(+)
 
 diff --git a/libmultipath/wwids.c b/libmultipath/wwids.c
-index ef74812..19c4d68 100644
+index 28a2150d..a0bfa851 100644
 --- a/libmultipath/wwids.c
 +++ b/libmultipath/wwids.c
-@@ -444,3 +444,47 @@ int op ## _wwid(const char *wwid) \
+@@ -454,3 +454,47 @@ int op ## _wwid(const char *wwid) \
  declare_failed_wwid_op(is_failed, false)
  declare_failed_wwid_op(mark_failed, true)
  declare_failed_wwid_op(unmark_failed, true)
@@ -83,7 +83,7 @@ index ef74812..19c4d68 100644
 +       return ret;
 +}
 diff --git a/libmultipath/wwids.h b/libmultipath/wwids.h
-index 0c6ee54..e32a0b0 100644
+index 0c6ee54d..e32a0b0e 100644
 --- a/libmultipath/wwids.h
 +++ b/libmultipath/wwids.h
 @@ -17,6 +17,7 @@ int remember_wwid(char *wwid);
@@ -94,73 +94,6 @@ index 0c6ee54..e32a0b0 100644
  
  enum {
  	WWID_IS_NOT_FAILED = 0,
-diff --git a/multipath/main.c b/multipath/main.c
-index 96a1146..5fc65ef 100644
---- a/multipath/main.c
-+++ b/multipath/main.c
-@@ -139,6 +139,7 @@ usage (char * progname)
- 	fprintf (stderr, "  %s [-v level] [-l|-ll] [device]\n", progname);
- 	fprintf (stderr, "  %s [-v level] [-a|-w] device\n", progname);
- 	fprintf (stderr, "  %s [-v level] -W\n", progname);
-+        fprintf (stderr, "  %s [-v level] -A\n", progname);
- 	fprintf (stderr, "  %s [-v level] [-i] [-c|-C] device\n", progname);
- 	fprintf (stderr, "  %s [-v level] [-i] [-u|-U]\n", progname);
- 	fprintf (stderr, "  %s [-h|-t|-T]\n", progname);
-@@ -151,6 +152,8 @@ usage (char * progname)
- 		"  -f      flush a multipath device map\n"
- 		"  -F      flush all multipath device maps\n"
- 		"  -a      add a device wwid to the wwids file\n"
-+                "  -A      add devices from kernel command line mpath.wwids\n"
-+                "          parameters to wwids file\n"
- 		"  -c      check if a device should be a path in a multipath device\n"
- 		"  -C      check if a multipath device has usable paths\n"
- 		"  -q      allow queue_if_no_path when multipathd is not running\n"
-@@ -905,7 +908,7 @@ main (int argc, char *argv[])
- 		exit(RTVL_FAIL);
- 	multipath_conf = conf;
- 	conf->retrigger_tries = 0;
--	while ((arg = getopt(argc, argv, ":adcChl::FfM:v:p:b:BrR:itTquUwW")) != EOF ) {
-+	while ((arg = getopt(argc, argv, ":aAdcChl::FfM:v:p:b:BrR:itTquUwW")) != EOF ) {
- 		switch(arg) {
- 		case 1: printf("optarg : %s\n",optarg);
- 			break;
-@@ -998,6 +1001,10 @@ main (int argc, char *argv[])
- 		case 'R':
- 			retries = atoi(optarg);
- 			break;
-+		case 'A':
-+			if (remember_cmdline_wwid() != 0)
-+				exit(1);
-+			exit(0);
- 		case ':':
- 			fprintf(stderr, "Missing option argument\n");
- 			usage(argv[0]);
-diff --git a/multipath/multipath.8 b/multipath/multipath.8
-index 9cdd05a..1e120f3 100644
---- a/multipath/multipath.8
-+++ b/multipath/multipath.8
-@@ -167,6 +167,9 @@ itself doesn't attempt to do I/O on the device.
- Check if the device specified in the program environment should be
- a path in a multipath device.
- .
-+.B \-A
-+add wwids from any kernel command line mpath.wwid parameters to the wwids file
-+.
- .TP
- .B \-U
- Check if the device specified in the program environment is a multipath device
-diff --git a/multipathd/multipathd.service b/multipathd/multipathd.service
-index 17434ce..0fbcc46 100644
---- a/multipathd/multipathd.service
-+++ b/multipathd/multipathd.service
-@@ -15,6 +15,7 @@ Type=notify
- NotifyAccess=main
- LimitCORE=infinity
- ExecStartPre=-/sbin/modprobe -a scsi_dh_alua scsi_dh_emc scsi_dh_rdac dm-multipath
-+ExecStartPre=-/sbin/multipath -A
- ExecStart=/sbin/multipathd -d -s
- ExecReload=/sbin/multipathd reconfigure
- TasksMax=infinity
 -- 
-2.7.4
+2.17.1
 
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.3.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
similarity index 97%
rename from meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.3.bb
rename to meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
index 9e2d86b9a6..2795a8d091 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.3.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
@@ -43,11 +43,12 @@ SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http \
            file://0029-multipath-tools-modify-Makefile.inc-for-cross-compil.patch \
            file://0030-Always-use-devmapper.patch \
            file://0031-Always-use-devmapper-for-kpartx.patch \
+           file://0001-fix-bug-of-do_compile-and-do_install.patch \
            "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
-SRCREV = "6c3bd369b23e959700527e0e2e6d5b2a1bd36294"
+SRCREV = "d4915917655b3d205aa0e339ca13080ed8182d0d"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

