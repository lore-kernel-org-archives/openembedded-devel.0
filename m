Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.7646.1604900672430774759
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2020 21:44:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,462,1596470400"; 
   d="scan'208";a="101079614"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 09 Nov 2020 13:44:27 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 0E1C04CE3A51
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Nov 2020 13:44:25 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 9 Nov 2020 13:44:26 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] opensaf: upgrade 5.20.05 -> 5.20.08
Date: Mon, 9 Nov 2020 13:44:18 +0800
Message-ID: <1604900658-62519-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 0E1C04CE3A51.A23FC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0001-Add-configure-time-check-for-gettid-API.patch
Removed since this is included in 5.20.08

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...-configure-time-check-for-gettid-API.patch | 67 -------------------
 ...{opensaf_5.20.05.bb => opensaf_5.20.08.bb} |  5 +-
 2 files changed, 2 insertions(+), 70 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-Add-configure-time-check-for-gettid-API.patch
 rename meta-networking/recipes-daemons/opensaf/{opensaf_5.20.05.bb => opensaf_5.20.08.bb} (94%)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-Add-configure-time-check-for-gettid-API.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-Add-configure-time-check-for-gettid-API.patch
deleted file mode 100644
index 2b03b1800..000000000
--- a/meta-networking/recipes-daemons/opensaf/opensaf/0001-Add-configure-time-check-for-gettid-API.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 91c7362834ccd88d1432b3e6c5c51748b72b10ad Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 27 Jul 2019 07:21:16 -0700
-Subject: [PATCH] Add configure time check for gettid API
-
-glibc 2.30 has added syscalls wrapper for gettid
-it should now be checked during configure if C library provides
-this API then do not define local function
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac         | 4 ++++
- src/base/logtrace.cc | 3 +++
- src/osaf/config.h.in | 3 +++
- 3 files changed, 10 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 22ab936..90f3da4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -480,6 +480,10 @@ fi
- 
- AC_SUBST([localstatedir])
- 
-+#############################################
-+# Checks for functions.
-+#############################################
-+AC_CHECK_FUNCS([ gettid ])
- 
- #############################################
- # Checks for programs.
-diff --git a/src/base/logtrace.cc b/src/base/logtrace.cc
-index 8908c1f..fe87e8d 100644
---- a/src/base/logtrace.cc
-+++ b/src/base/logtrace.cc
-@@ -31,6 +31,7 @@
- #include "base/logtrace_client.h"
- #include "base/logtrace_buffer.h"
- #include "base/ncsgl_defs.h"
-+#include "osaf/config.h"
- 
- namespace global {
- 
-@@ -58,7 +59,9 @@ std::once_flag init_flag;
- thread_local LogTraceBuffer gl_thread_buffer{gl_local_thread_trace,
-   global::thread_trace_buffer_size};
- 
-+#ifndef HAVE_GETTID
- static pid_t gettid() { return syscall(SYS_gettid); }
-+#endif
- 
- /**
-  * USR2 signal handler to enable/disable trace (toggle)
-diff --git a/src/osaf/config.h.in b/src/osaf/config.h.in
-index d1f6d1a..0a3f27d 100644
---- a/src/osaf/config.h.in
-+++ b/src/osaf/config.h.in
-@@ -18,6 +18,9 @@
- /* Define if experimental code is enabled */
- #undef HAVE_EXPERIMENTAL
- 
-+/* Define to 1 if you have the `gettid' function. */
-+#undef HAVE_GETTID
-+
- /* SAHPI_INTERFACE_VERSION == A01 */
- #undef HAVE_HPI_A01
- 
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.20.05.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.20.08.bb
similarity index 94%
rename from meta-networking/recipes-daemons/opensaf/opensaf_5.20.05.bb
rename to meta-networking/recipes-daemons/opensaf/opensaf_5.20.08.bb
index bd972e346..7c7051eff 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.20.05.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.20.08.bb
@@ -24,13 +24,12 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://0001-configure-Disable-format-overflow-if-supported-by-gc.patch \
            file://0001-src-Add-missing-header-limits.h-for-_POSIX_HOST_NAME.patch \
            file://0001-immpbe_dump.cc-Use-sys-wait.h-instead-of-wait.h.patch \
-           file://0001-Add-configure-time-check-for-gettid-API.patch \
            file://0001-create_empty_library-Use-CC-variable-intead-of-hardc.patch \
            file://0001-immom_python-convert-to-python3.patch \
            file://0001-Fix-build-with-fno-common.patch \
            "
-SRC_URI[md5sum] = "d56bacf4c234c134e60e9b25f6f26671"
-SRC_URI[sha256sum] = "2478e298c0bce3b2cfdeb20875022cc11d7d3b53ecd3255422d22eb64c04953b"
+SRC_URI[md5sum] = "02cfe732d194339237da6adce8e54384"
+SRC_URI[sha256sum] = "84268b90dc48a6675e5a77e2b20390a04bb59deb48a829102a9dbc4b9ac27483"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/opensaf/files/releases"
 
-- 
2.25.1



