Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E90CC25B74
	for <webhook@archiver.kernel.org>; Sat, 18 May 2024 17:47:32 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.23116.1716054452033117757
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 May 2024 10:47:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eEz7tL/s;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f2f566a7c7so7313645ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 May 2024 10:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716054451; x=1716659251; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=elu1KSvE3EKMpmFlhHxGfuqOzyHCX5iN6MafcWd2MTA=;
        b=eEz7tL/s0sWLRewhdffNyGSxCacRY+Ten+OpMOUnTo0e/tLH7EzekluRf28CT5+Ehy
         on6c0eDCbUcWpUa3Vi/YwEqKww6UMPWe0Lv0LUIp9vFzV9hZ5pi29ymJA5mmoL0fEUKL
         GtL94htVndaeiUCJgweDLzrqvBU/+Ye/6RTVTyEUHl5GD0LRtVH4aecOuXG/6JoHT3Xr
         jGyG7IQecytmvpCYr8TIOb2Zk5NcKHxS7W/gBVaeltK4U0+G/6BXnzKbjUiqh6FHHaAu
         U+J581HZMhQ/M9SlqwuOWzL2Rdnw5xt86WWcSRJ2e5FHjzC6omDFV6swKqwOJMzQnPPU
         Nvmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716054451; x=1716659251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=elu1KSvE3EKMpmFlhHxGfuqOzyHCX5iN6MafcWd2MTA=;
        b=xEgVKJoA7FXhs7BoHyJEuvPUrodjKDmm/yGLiNDcgUcLvhDNSFg5B//49CZOOWCOVg
         tUDtbwO6MxDqDqmMgvm5tQRDBQXqjOjkYBmwB7rOtx4RHgDHB2sL2lIbmzzJAdt72Fbg
         v2h+mCTTiSJmy1rjNjwanF/p9mN8IqiZIoRiYRgKs5UPjjQ/TtkIetHvpUUlH6Y/87+G
         8hU7WD4MZSi4Et/SwDUJIxzxpKXXYB3uCK1hyOpw49odO9ZlBd0d8aRkEVh+g0ocuAfA
         t5delXT+aqfcBlh0wEnnGSLdZlc8gJWPDZXHHL5Zthsu6huX27Ak07bYJRsHTGqygcMg
         ABdg==
X-Gm-Message-State: AOJu0Yw0Lftf61uqboI3X/NthoKmSnoSym1UBS5ZLZwSV9a7yRVXRLw/
	R3pg8NkPHL+lqqPYHy+3u4OAGisQFg2yI7lqFcp/p03Vn/XjaC8YyKpvS8oUec4=
X-Google-Smtp-Source: AGHT+IFEl9UDoTm98+ZEVdpql8InnSV0ksghrxSE3ovw1gLiLbg8+T8QREYx+Bs2Ui/Z2pM8kd2X4A==
X-Received: by 2002:a05:6a21:788e:b0:1af:a5b1:290a with SMTP id adf61e73a8af0-1afde0a994amr28539850637.13.1716054451018;
        Sat, 18 May 2024 10:47:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ba378088efsm5274691a91.15.2024.05.18.10.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 May 2024 10:47:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] openflow: Fix build build with musl/gcc14
Date: Sat, 18 May 2024 10:47:27 -0700
Message-ID: <20240518174727.2643414-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 May 2024 17:47:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110432

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-libexecinfo-if-it-has-backtrace-API.patch | 62 +++++++++++++++++++
 .../openflow/openflow_git.bb                  |  3 +-
 2 files changed, 63 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/openflow/openflow/0001-Link-in-libexecinfo-if-it-has-backtrace-API.patch

diff --git a/meta-networking/recipes-protocols/openflow/openflow/0001-Link-in-libexecinfo-if-it-has-backtrace-API.patch b/meta-networking/recipes-protocols/openflow/openflow/0001-Link-in-libexecinfo-if-it-has-backtrace-API.patch
new file mode 100644
index 0000000000..6382c2a9a6
--- /dev/null
+++ b/meta-networking/recipes-protocols/openflow/openflow/0001-Link-in-libexecinfo-if-it-has-backtrace-API.patch
@@ -0,0 +1,62 @@
+From 2272df8407d86519d72504d6468b710e7eb56de8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 18 May 2024 00:23:43 -0700
+Subject: [PATCH] Link in libexecinfo if it has backtrace() API
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ m4/libopenflow.m4     | 5 +++++
+ tests/automake.mk     | 2 +-
+ utilities/automake.mk | 4 ++--
+ 3 files changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/m4/libopenflow.m4 b/m4/libopenflow.m4
+index 58014ed..c9302b8 100644
+--- a/m4/libopenflow.m4
++++ b/m4/libopenflow.m4
+@@ -96,6 +96,11 @@ AC_DEFUN([OFP_CHECK_FAULT_LIBS],
+   [AC_CHECK_LIB([dl], [dladdr], [FAULT_LIBS=-ldl])
+    AC_SUBST([FAULT_LIBS])])
+ 
++dnl Checks for libraries needed by lib/fault.c.
++AC_DEFUN([OFP_CHECK_FAULT_LIBS],
++  [AC_CHECK_LIB([execinfo], [backtrace], [FAULT_LIBS=-lexecinfo])
++   AC_SUBST([FAULT_LIBS])])
++
+ dnl Checks for libraries needed by lib/socket-util.c.
+ AC_DEFUN([OFP_CHECK_SOCKET_LIBS],
+   [AC_CHECK_LIB([socket], [connect])
+diff --git a/tests/automake.mk b/tests/automake.mk
+index a4e945a..0944275 100644
+--- a/tests/automake.mk
++++ b/tests/automake.mk
+@@ -27,7 +27,7 @@ EXTRA_DIST += tests/test-stp.sh
+ noinst_PROGRAMS += tests/test-stp
+ 
+ tests_test_stp_SOURCES = tests/test-stp.c
+-tests_test_stp_LDADD = lib/libopenflow.a
++tests_test_stp_LDADD = lib/libopenflow.a $(FAULT_LIBS)
+ stp_files = \
+ 	tests/test-stp-ieee802.1d-1998 \
+ 	tests/test-stp-ieee802.1d-2004-fig17.4 \
+diff --git a/utilities/automake.mk b/utilities/automake.mk
+index d6f79a8..0608655 100644
+--- a/utilities/automake.mk
++++ b/utilities/automake.mk
+@@ -36,10 +36,10 @@ utilities_dpctl_SOURCES = utilities/dpctl.c
+ utilities_dpctl_LDADD = lib/libopenflow.a $(FAULT_LIBS) $(SSL_LIBS)
+ 
+ utilities_vlogconf_SOURCES = utilities/vlogconf.c
+-utilities_vlogconf_LDADD = lib/libopenflow.a
++utilities_vlogconf_LDADD = lib/libopenflow.a $(FAULT_LIBS)
+ 
+ utilities_ofp_discover_SOURCES = utilities/ofp-discover.c
+-utilities_ofp_discover_LDADD = lib/libopenflow.a
++utilities_ofp_discover_LDADD = lib/libopenflow.a $(FAULT_LIBS)
+ 
+ utilities_ofp_kill_SOURCES = utilities/ofp-kill.c
+ utilities_ofp_kill_LDADD = lib/libopenflow.a
+-- 
+2.45.1
+
diff --git a/meta-networking/recipes-protocols/openflow/openflow_git.bb b/meta-networking/recipes-protocols/openflow/openflow_git.bb
index 1ee8a702ff..0061565f90 100644
--- a/meta-networking/recipes-protocols/openflow/openflow_git.bb
+++ b/meta-networking/recipes-protocols/openflow/openflow_git.bb
@@ -21,6 +21,7 @@ SRC_URI = "git://github.com/mininet/openflow;protocol=https;branch=master \
            file://0001-generate-not-static-get_dh-functions.patch \
            file://0001-socket-util-Include-sys-stat.h-for-fchmod.patch \
            file://0001-Makefile.am-Specify-export-dynamic-directly-to-linke.patch \
+           file://0001-Link-in-libexecinfo-if-it-has-backtrace-API.patch \
 "
 CVE_STATUS[CVE-2015-1611] = "not-applicable-config: Not referred to our implementation of openflow"
 CVE_STATUS[CVE-2015-1612] = "not-applicable-config: Not referred to our implementation of openflow"
@@ -34,9 +35,7 @@ EXTRA_OECONF += " \
                  KARCH=${TARGET_ARCH} \
                  ${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'SSL_LIBS="-lssl -lcrypto"', '', d)} \
                 "
-
 DEPENDS:append:libc-musl = " libexecinfo"
-LDFLAGS:append:libc-musl = " -lexecinfo"
 
 S = "${WORKDIR}/git"
 
-- 
2.45.1


