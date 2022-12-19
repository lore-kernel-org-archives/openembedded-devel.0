Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E925FC4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 09:13:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.17052.1671441203416195440
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Dec 2022 01:13:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=r+xBPl2T;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9352be1071=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BJ8Z142015361
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 01:13:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=NKkjmSdavsZ9t/0wq2Xe3q/rPLll57Dl+MA2bzDIV0Q=;
 b=r+xBPl2TdLxgmDpV3+GXcgZAZqhuEUGWe6z+ivsxv9NKCi4OZHfxg627425gTRxamve0
 KsVpZaSBJViIdH4nl/hFcDA0K3JpmYn0S9p8BqQxrYBPqvNrRidl4vx5lmz1HaKfjVXQ
 saq3nZtIhhLUpLh4Elaw8A++Bb7vooO+vCOWEQ7yE8IxLDsOjxZHHpg4ny/k6OgpsLGA
 Y3autnVWNL/FFda1kZXBBmv20YVLl6IIRhKUo6fqbknT8y8QeyUUDNFFCDKYpLu40jGv
 iscNe4APAQoZ8AlHhbJ5q3vTxjOgXCt3/eJdFn9snRPIsraomP3b+gFJ1jW3Z8/d83bm 1g== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mhe5q926b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 01:13:22 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 19 Dec 2022 01:13:22 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2308.27 via Frontend Transport; Mon, 19 Dec 2022 01:13:20 -0800
From: Yogita Urade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>, Yogita Urade <yogita.urade@windriver.com>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] multipath-tools:fix CVE-2022-41973
Date: Mon, 19 Dec 2022 09:13:19 +0000
Message-ID: <20221219091319.2641561-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Le68DF7MhKWLY4kAkAKQXXA_v8-swoXv
X-Proofpoint-GUID: Le68DF7MhKWLY4kAkAKQXXA_v8-swoXv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-18_13,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212190081
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 09:13:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100093

/dev/shm may have unsafe permissions. Use /run instead.
Use systemd's tmpfiles.d mechanism to create /run/multipath
early during boot.

For backward compatibilty, make the runtime directory configurable
via the "runtimedir" make variable.

CVE: CVE-2022-41973

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-41973

Upstream-Status: Backport [https://github.com/opensvc/multipath-tools/commit/cb57b930fa690ab79b3904846634681685e3470f]

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 ...ath-tools-use-run-instead-of-dev-shm.patch | 151 ++++++++++++++++++
 .../multipath-tools/multipath-tools_0.8.4.bb  |   4 +
 2 files changed, 155 insertions(+)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-multipath-tools-use-run-instead-of-dev-shm.patch

diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-multipath-tools-use-run-instead-of-dev-shm.patch b/meta-oe/recipes-support/multipath-tools/files/0001-multipath-tools-use-run-instead-of-dev-shm.patch
new file mode 100644
index 000000000..865da1c4e
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0001-multipath-tools-use-run-instead-of-dev-shm.patch
@@ -0,0 +1,151 @@
+From 5dded5fa9a36e7687e3be1ffe5c428f0e1b012e4 Mon Sep 17 00:00:00 2001
+From: Yogita Urade <yogita.urade@windriver.com>
+Date: Mon, 19 Dec 2022 08:29:35 +0000
+Subject: [PATCH] multipath-tools: use /run instead of /dev/shm
+
+/dev/shm may have unsafe permissions. Use /run instead.
+Use systemd's tmpfiles.d mechanism to create /run/multipath
+early during boot.
+
+For backward compatibilty, make the runtime directory configurable
+via the "runtimedir" make variable.
+
+Signed-off-by: Martin Wilck <mwilck@suse.com>
+Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ .gitignore                                        |  2 ++
+ Makefile.inc                                      |  7 ++++++-
+ libmultipath/defaults.h                           |  2 +-
+ multipath/Makefile                                | 11 ++++++++---
+ multipath/{multipath.rules => multipath.rules.in} |  4 ++--
+ multipath/tmpfiles.conf.in                        |  1 +
+ 6 files changed, 20 insertions(+), 7 deletions(-)
+ rename multipath/{multipath.rules => multipath.rules.in} (95%)
+ create mode 100644 multipath/tmpfiles.conf.in
+
+diff --git a/.gitignore b/.gitignore
+index 9926756b..f90b0350 100644
+--- a/.gitignore
++++ b/.gitignore
+@@ -8,6 +8,8 @@
+ *.d
+ kpartx/kpartx
+ multipath/multipath
++multipath/multipath.rules
++multipath/tmpfiles.conf
+ multipathd/multipathd
+ mpathpersist/mpathpersist
+ .nfs*
+diff --git a/Makefile.inc b/Makefile.inc
+index 4eb08eed..648f91b4 100644
+--- a/Makefile.inc
++++ b/Makefile.inc
+@@ -44,6 +44,7 @@ exec_prefix	= $(prefix)
+ usr_prefix	= $(prefix)
+ bindir		= $(exec_prefix)/usr/sbin
+ libudevdir	= $(prefix)/$(SYSTEMDPATH)/udev
++tmpfilesdir	= $(prefix)/$(SYSTEMDPATH)/tmpfiles.d
+ udevrulesdir	= $(libudevdir)/rules.d
+ multipathdir	= $(TOPDIR)/libmultipath
+ man8dir		= $(prefix)/usr/share/man/man8
+@@ -60,6 +61,7 @@ libdmmpdir	= $(TOPDIR)/libdmmp
+ nvmedir		= $(TOPDIR)/libmultipath/nvme
+ includedir	= $(prefix)/usr/include
+ pkgconfdir	= $(usrlibdir)/pkgconfig
++runtimedir      := /$(RUN)
+ 
+ GZIP		= gzip -9 -c
+ RM		= rm -f
+@@ -95,7 +97,10 @@ OPTFLAGS       += -Wextra -Wstrict-prototypes -Wformat=2 -Werror=implicit-int \
+                   -Wno-unused-parameter -Werror=cast-qual \
+                   -Werror=discarded-qualifiers
+ 
+-CPPFLAGS	:= -Wp,-D_FORTIFY_SOURCE=2 
++CPPFLAGS	:= $(FORTIFY_OPT) \
++		   -DBIN_DIR=\"$(bindir)\" -DMULTIPATH_DIR=\"$(plugindir)\" -DRUN_DIR=\"${RUN}\" \
++		   -DRUNTIME_DIR=\"$(runtimedir)\" \
++		   -DCONFIG_DIR=\"$(configdir)\" -DEXTRAVERSION=\"$(EXTRAVERSION)\" -MMD -MP 
+ CFLAGS		:= $(OPTFLAGS) -DBIN_DIR=\"$(bindir)\" -DLIB_STRING=\"${LIB}\" -DRUN_DIR=\"${RUN}\" \
+ 		   -MMD -MP $(CFLAGS)
+ BIN_CFLAGS	= -fPIE -DPIE
+diff --git a/libmultipath/defaults.h b/libmultipath/defaults.h
+index c2164c16..2cc655d4 100644
+--- a/libmultipath/defaults.h
++++ b/libmultipath/defaults.h
+@@ -64,7 +64,7 @@
+ #define DEFAULT_WWIDS_FILE	"/etc/multipath/wwids"
+ #define DEFAULT_PRKEYS_FILE    "/etc/multipath/prkeys"
+ #define DEFAULT_CONFIG_DIR	"/etc/multipath/conf.d"
+-#define MULTIPATH_SHM_BASE	"/dev/shm/multipath/"
++#define MULTIPATH_SHM_BASE	RUNTIME_DIR "/multipath/"
+ 
+ 
+ static inline char *set_default(char *str)
+diff --git a/multipath/Makefile b/multipath/Makefile
+index e720c7f6..3e2c88c9 100644
+--- a/multipath/Makefile
++++ b/multipath/Makefile
+@@ -12,7 +12,7 @@ EXEC = multipath
+ 
+ OBJS = main.o
+ 
+-all: $(EXEC)
++all: $(EXEC) multipath.rules tmpfiles.conf
+ 
+ $(EXEC): $(OBJS) $(multipathdir)/libmultipath.so $(mpathcmddir)/libmpathcmd.so
+ 	$(CC) $(CFLAGS) $(OBJS) -o $(EXEC) $(LDFLAGS) $(LIBDEPS)
+@@ -26,7 +26,9 @@ install:
+ 	$(INSTALL_PROGRAM) -m 755 mpathconf $(DESTDIR)$(bindir)/
+ 	$(INSTALL_PROGRAM) -d $(DESTDIR)$(udevrulesdir)
+ 	$(INSTALL_PROGRAM) -m 644 11-dm-mpath.rules $(DESTDIR)$(udevrulesdir)
+-	$(INSTALL_PROGRAM) -m 644 $(EXEC).rules $(DESTDIR)$(libudevdir)/rules.d/62-multipath.rules
++	$(INSTALL_PROGRAM) -m 644 multipath.rules $(DESTDIR)$(udevrulesdir)/56-multipath.rules
++	$(INSTALL_PROGRAM) -d $(DESTDIR)$(tmpfilesdir)
++	$(INSTALL_PROGRAM) -m 644 tmpfiles.conf $(DESTDIR)$(tmpfilesdir)/multipath.conf	
+ 	$(INSTALL_PROGRAM) -d $(DESTDIR)$(man8dir)
+ 	$(INSTALL_PROGRAM) -m 644 $(EXEC).8.gz $(DESTDIR)$(man8dir)
+ 	$(INSTALL_PROGRAM) -d $(DESTDIR)$(man5dir)
+@@ -43,9 +45,12 @@ uninstall:
+ 	$(RM) $(DESTDIR)$(man8dir)/mpathconf.8.gz
+ 
+ clean: dep_clean
+-	$(RM) core *.o $(EXEC) *.gz
++	$(RM) core *.o $(EXEC) multipath.rules tmpfiles.conf
+ 
+ include $(wildcard $(OBJS:.o=.d))
+ 
+ dep_clean:
+ 	$(RM) $(OBJS:.o=.d)
++
++%:	%.in
++	sed 's,@RUNTIME_DIR@,$(runtimedir),' $< >$@	
+diff --git a/multipath/multipath.rules b/multipath/multipath.rules.in
+similarity index 95%
+rename from multipath/multipath.rules
+rename to multipath/multipath.rules.in
+index 0486bf70..5fb499e6 100644
+--- a/multipath/multipath.rules
++++ b/multipath/multipath.rules.in
+@@ -1,8 +1,8 @@
+ # Set DM_MULTIPATH_DEVICE_PATH if the device should be handled by multipath
+ SUBSYSTEM!="block", GOTO="end_mpath"
+ KERNEL!="sd*|dasd*|nvme*", GOTO="end_mpath"
+-ACTION=="remove", TEST=="/dev/shm/multipath/find_multipaths/$major:$minor", \
+-	RUN+="/usr/bin/rm -f /dev/shm/multipath/find_multipaths/$major:$minor"
++ACTION=="remove", TEST=="@RUNTIME_DIR@/multipath/find_multipaths/$major:$minor", \
++	RUN+="/usr/bin/rm -f @RUNTIME_DIR@/multipath/find_multipaths/$major:$minor"
+ ACTION!="add|change", GOTO="end_mpath"
+ 
+ IMPORT{cmdline}="nompath"
+diff --git a/multipath/tmpfiles.conf.in b/multipath/tmpfiles.conf.in
+new file mode 100644
+index 00000000..21be438a
+--- /dev/null
++++ b/multipath/tmpfiles.conf.in
+@@ -0,0 +1 @@
++d @RUNTIME_DIR@/multipath 0700 root root -
+-- 
+2.32.0
+
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
index 5a8db0877..02cfe3ee5 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
@@ -48,6 +48,7 @@ SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=http;branch=mas
            file://0001-add-explicit-dependency-on-libraries.patch \
            file://0001-fix-boolean-value-with-json-c-0.14.patch \
            file://0001-libmultipath-uevent.c-fix-error-handling-for-udev_mo.patch \
+  	    file://0001-multipath-tools-use-run-instead-of-dev-shm.patch \
            "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
@@ -120,3 +121,6 @@ FILES:kpartx = "${base_sbindir}/kpartx \
 
 RDEPENDS:${PN} += "kpartx"
 PARALLEL_MAKE = ""
+
+FILES:${PN}-libs += "usr/lib"
+FILES:${PN}-libs += "usr/lib/tmpfiles.d/*"
-- 
2.32.0


