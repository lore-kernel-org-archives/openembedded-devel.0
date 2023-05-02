Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 137C0C77B73
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 04:58:08 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.121438.1683003484381041810
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 May 2023 21:58:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=B6zmCssU;
 spf=pass (domain: mvista.com, ip: 209.85.215.180, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-517bdc9e81dso1689235a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 May 2023 21:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1683003483; x=1685595483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jzA7BfDikRi8+YNRDSZlAsd+cbRNvcUohQ7m15s0k5s=;
        b=B6zmCssUiWN2dst7wxoUt2gOLH5qumD9hccJgq/8HizJ4p5WTZrmMmS//AnNGCwm0O
         nO93UmzMiTPTI71p2iVRFT14xLN2e9/KrB26Yuvh/1owZZjz108TP2Z2ZSganKmJttx4
         Fft/UueYd9GqMD3XSJdhuJGsWUcWfNjoh20es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683003483; x=1685595483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jzA7BfDikRi8+YNRDSZlAsd+cbRNvcUohQ7m15s0k5s=;
        b=cxMI3asK67GCCR7MEwlxYWJhOqUs9vdmZiMpmXqBJ3sp3nd/zs7cqGbkoC6N9HTgNT
         H8qs2z0QPXCuLLYlSqrkjORBC6Kk34y000lnEVYd9pW3OM9tTZDa9mJAYUoYnvJaAljL
         o6cirzSotFboyX1dEWmlwGwFrhtDIuDUnH9wtzLHxL5WUutB09oUpXuka5R5hcwDyiNw
         baUxNccxr6fkHjMj5tO5ApsRqJR4dMSxv/JiyWmPInDV1+BdKg3g13nPODj903Ih3Ero
         z/bZBOZKrATQgca+xItG6YrnpgYtxnihhhTzRCyFRMw7OkeZWBLOc/nt5zw9o0eIt0Y+
         GZ6g==
X-Gm-Message-State: AC+VfDwwDWObK+oDjuF+VTm1Cd5JO+A55rzZXrAgTrSCYNv+TI/5y4h7
	CGZMLf7eg9SqQ5toEu7UcBXm7URHbTp16C6iPr4=
X-Google-Smtp-Source: ACHHUZ5+Wf0e5xIOZiXUxIwCYnrrObHpFqSblHxDGdZOsdx3zsFds99XezsObaTKG3itxbAsUhvz2A==
X-Received: by 2002:a05:6a20:9d91:b0:d3:78ab:77c3 with SMTP id mu17-20020a056a209d9100b000d378ab77c3mr16080137pzb.48.1683003483283;
        Mon, 01 May 2023 21:58:03 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.249])
        by smtp.gmail.com with ESMTPSA id g13-20020aa7874d000000b0063b8f17768dsm20782760pfo.129.2023.05.01.21.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 21:58:02 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Tue, 02 May 2023 10:27:57 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][dunfell][PATCH] multipath-tools: CVE-2022-41973 Symlink attack multipathd operates insecurely
Date: Tue,  2 May 2023 10:27:56 +0530
Message-Id: <20230502045756.62108-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 04:58:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102246

Upstream-Status: Backport from https://github.com/opensvc/multipath-tools/commit/cb57b930fa690ab79b3904846634681685e3470f

dev/shm may have unsafe permissions. Use /run instead.
Use systemd's tmpfiles.d mechanism to create /run/multipath
early during boot.

For backward compatibilty, make the runtime directory configurable
via the "runtimedir" make variable.

QA Issue: non -dev/-dbg/nativesdk- package multipath-tools-libs
  contains symlink .so '/usr/lib/libdmmp.so'
  ...

Fix this by making the new pattern for multipath-tools-libs package
more specific.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../files/CVE-2022-41973.patch                | 154 ++++++++++++++++++
 .../multipath-tools/multipath-tools_0.8.4.bb  |   4 +
 2 files changed, 158 insertions(+)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/CVE-2022-41973.patch

diff --git a/meta-oe/recipes-support/multipath-tools/files/CVE-2022-41973.patch b/meta-oe/recipes-support/multipath-tools/files/CVE-2022-41973.patch
new file mode 100644
index 000000000..d06ef44f6
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/CVE-2022-41973.patch
@@ -0,0 +1,154 @@
+From cb57b930fa690ab79b3904846634681685e3470f Mon Sep 17 00:00:00 2001
+From: Martin Wilck <mwilck@suse.com>
+Date: Thu, 1 Sep 2022 19:21:30 +0200
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
+CVE: CVE-2022-41973
+Upstream-Status: Backport [https://github.com/opensvc/multipath-tools/commit/cb57b930fa690ab79b3904846634681685e3470f]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ .gitignore                                        |  2 ++
+ Makefile.inc                                      |  7 ++++++-
+ libmultipath/defaults.h                           |  3 +--
+ multipath/Makefile                                | 11 ++++++++---
+ multipath/{multipath.rules => multipath.rules.in} |  4 ++--
+ multipath/tmpfiles.conf.in                        |  1 +
+ 6 files changed, 20 insertions(+), 8 deletions(-)
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
+index c2164c16..908e0ca3 100644
+--- a/libmultipath/defaults.h
++++ b/libmultipath/defaults.h
+@@ -64,8 +64,7 @@
+ #define DEFAULT_WWIDS_FILE	"/etc/multipath/wwids"
+ #define DEFAULT_PRKEYS_FILE    "/etc/multipath/prkeys"
+ #define DEFAULT_CONFIG_DIR	"/etc/multipath/conf.d"
+-#define MULTIPATH_SHM_BASE	"/dev/shm/multipath/"
+-
++#define MULTIPATH_SHM_BASE	RUNTIME_DIR "/multipath/"
+ 
+ static inline char *set_default(char *str)
+ {
+diff --git a/multipath/Makefile b/multipath/Makefile
+index e720c7f6..28976546 100644
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
+2.25.1
+
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
index 90cfd7d20..23273f5d5 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
@@ -45,6 +45,7 @@ SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=http;branch=mas
            file://0031-Always-use-devmapper-for-kpartx.patch \
            file://0001-fix-bug-of-do_compile-and-do_install.patch \
            file://0001-add-explicit-dependency-on-libraries.patch \
+           file://CVE-2022-41973.patch \
            "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
@@ -117,3 +118,6 @@ FILES_kpartx = "${base_sbindir}/kpartx \
 
 RDEPENDS_${PN} += "kpartx"
 PARALLEL_MAKE = ""
+
+FILES:${PN}-libs += "usr/lib/*.so.*"
+FILES:${PN}-libs += "usr/lib/tmpfiles.d/*"
-- 
2.25.1


