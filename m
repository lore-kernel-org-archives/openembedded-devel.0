Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734FBCD11DB
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 19:48:31 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web10.1461.1711396108763671831
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 12:48:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bgC4PAHx;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5a51c063f99so1292028eaf.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 12:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711396108; x=1712000908; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ViRg4QLjetog89jXvebXrZc8f1JGEfrW8LLY75cp6bw=;
        b=bgC4PAHxFXEoxtxgHB9HtWDnpuAwvcLwBG04ayoYLUh21wF9uCIt9HEylYHyedp6b7
         c/WuIuHMeref/qeQRuURDAlVw95T+jud9TO0KlLcLLwfJ/N3TxPiV8hq5cxhkLQwPlMF
         03msLJMfIqAsSwadyD6Vi8qqpuOAp2WupEl3jeXR5O+tgzBPJOGwTG1C+KD+n/Imhznn
         xK30Wieb4Wc8UKGKeRg5/GIZ0T7pDRjzREDp/Bl7wdJ0a/F/AALY8nd+WFWYc8OafcnW
         RQyx8Ux5Iu3TbczOs0DfM2dQNa1VYuKYcMw++PInkFQ62F8gTw4xz4JrqOVUTrD4j/8Q
         Vv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711396108; x=1712000908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ViRg4QLjetog89jXvebXrZc8f1JGEfrW8LLY75cp6bw=;
        b=l9xt0oiwv+Xk/Karq3OsFNibMmPYIMTBazjlhLUShMkjvM4kS2DyfkNfddO1CHS3EM
         WhWxKUhr+wydsIcMqzGdCFNas++XEMnKk+oNHTvXg2nB9resf3CtKrl4qpeqg5WbvJr3
         atrZsEUFaKhmB9yxAkNGWL1odK+XOM0KEPCw/8G4cJSg8BLb2hDCMLUbybMcoY9WY1VF
         jUaBSkY8Ab4zw1tjeker4euxsENDq76s99mWnp4QlYl7Sr3vq38UpcNuWxMZ51BdP/v/
         UzWev5+tVbWSKQsfAM4JndpYsU64OJlaKBs81DUP9flrWxAslZmdZ3QWXICju9zTTOFd
         2S5A==
X-Gm-Message-State: AOJu0Yyuhe5kkfqjqSl6kum7vo/Z6RKo9K7wDwgjhcTxHFFd6wH6HIBg
	RIRjCB8lsRKHK9Mreemcpgsv4ik53YK8/feXzBsTxapCYz4waGoLHGFLfpKB
X-Google-Smtp-Source: AGHT+IGUmP5e74M2CLRIFha9qPz2ZHzZ7rS1CLc4V/kQZmHUw5WZg43P04cxZpe8xpQoTAQx1AZP6A==
X-Received: by 2002:a05:6358:2490:b0:17f:5f17:29a1 with SMTP id m16-20020a056358249000b0017f5f1729a1mr5439558rwc.17.1711396107579;
        Mon, 25 Mar 2024 12:48:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5eba])
        by smtp.gmail.com with ESMTPSA id r14-20020a6560ce000000b005ce472f2d0fsm5122282pgv.66.2024.03.25.12.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 12:48:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/4] net-snmp: Fix build with musl
Date: Mon, 25 Mar 2024 12:48:22 -0700
Message-ID: <20240325194825.641241-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 19:48:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109600

The last patch 0012-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch
brought in with 5.9.4 upgrade is not sufficient and infact has a regression
introduced for clang+musl builds.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../net-snmp/0001-Android-Fix-the-build.patch | 83 +++++++++++++++++++
 .../net-snmp/net-snmp_5.9.4.bb                |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Android-Fix-the-build.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Android-Fix-the-build.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Android-Fix-the-build.patch
new file mode 100644
index 0000000000..097d9f83cd
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Android-Fix-the-build.patch
@@ -0,0 +1,83 @@
+From b4598662a39ff6974119c900ea56a4d020eac366 Mon Sep 17 00:00:00 2001
+From: Bart Van Assche <bvanassche@acm.org>
+Date: Wed, 20 Dec 2023 13:08:06 -0800
+Subject: [PATCH] Android: Fix the build
+
+Include <sys/select.h> for the fd_set type. In the configure script,
+check whether 'unsigned long' is the underlying type of fd_set. Use
+u_long instead of ulong.
+
+Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/b4598662a39ff6974119c900ea56a4d020eac366]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ agent/mibgroup/ip-mib/data_access/ipaddress_linux.c | 4 ++--
+ configure                                           | 2 +-
+ configure.d/config_project_types                    | 2 +-
+ include/net-snmp/types.h                            | 3 +++
+ 4 files changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/agent/mibgroup/ip-mib/data_access/ipaddress_linux.c b/agent/mibgroup/ip-mib/data_access/ipaddress_linux.c
+index b38beb57dd..232202d0f9 100644
+--- a/agent/mibgroup/ip-mib/data_access/ipaddress_linux.c
++++ b/agent/mibgroup/ip-mib/data_access/ipaddress_linux.c
+@@ -50,7 +50,7 @@ int _load_v6(netsnmp_container *container, int idx_offset);
+ int
+ netsnmp_access_ipaddress_extra_prefix_info(int index,
+                                            u_long *preferedlt,
+-                                           ulong *validlt,
++                                           u_long *validlt,
+                                            char *addr);
+ #endif
+ 
+@@ -523,7 +523,7 @@ out:
+ 
+ int
+ netsnmp_access_ipaddress_extra_prefix_info(int index, u_long *preferedlt,
+-                                           ulong *validlt, char *addr)
++                                           u_long *validlt, char *addr)
+ {
+ 
+     struct {
+diff --git a/configure b/configure
+index e7bf859bba..48abcbab11 100755
+--- a/configure
++++ b/configure
+@@ -31577,7 +31577,7 @@ CFLAGS="$CFLAGS -Werror"
+ 
+ { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for the type of fd_set::fds_bits" >&5
+ printf %s "checking for the type of fd_set::fds_bits... " >&6; }
+-for type in __fd_mask __int32_t long\ int unknown; do
++for type in __fd_mask __int32_t long 'unsigned long' unknown; do
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
+ 
+diff --git a/configure.d/config_project_types b/configure.d/config_project_types
+index a78e8ebb06..ac958d6712 100644
+--- a/configure.d/config_project_types
++++ b/configure.d/config_project_types
+@@ -66,7 +66,7 @@ netsnmp_save_CFLAGS=$CFLAGS
+ CFLAGS="$CFLAGS -Werror"
+ 
+ AC_MSG_CHECKING([for the type of fd_set::fds_bits])
+-for type in __fd_mask __int32_t long\ int unknown; do
++for type in __fd_mask __int32_t long 'unsigned long' unknown; do
+   AC_COMPILE_IFELSE([AC_LANG_PROGRAM([
+ #include <sys/select.h>
+ #include <stddef.h>
+diff --git a/include/net-snmp/types.h b/include/net-snmp/types.h
+index b78f53ffd7..6228170e5f 100644
+--- a/include/net-snmp/types.h
++++ b/include/net-snmp/types.h
+@@ -23,6 +23,9 @@
+ #endif
+ 
+ #include <sys/types.h>
++#ifdef __ANDROID__
++#include <sys/select.h>
++#endif
+ 
+ #if defined(WIN32) && !defined(cygwin)
+ typedef HANDLE netsnmp_pid_t;
+-- 
+2.44.0
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
index 5da06bb6d7..395b02df00 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
@@ -27,6 +27,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            file://0010-net-snmp-Reproducibility-Don-t-check-build-host-for.patch \
            file://0011-ac_add_search_path.m4-keep-consistent-between-32bit-.patch \
            file://0012-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch \
+           file://0001-Android-Fix-the-build.patch \
           "
 SRC_URI[sha256sum] = "8b4de01391e74e3c7014beb43961a2d6d6fa03acc34280b9585f4930745b0544"
 
-- 
2.44.0


