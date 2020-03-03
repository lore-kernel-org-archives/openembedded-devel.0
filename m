Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4C79060B3D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2020 05:25:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,510,1574092800"; d="scan'208";a="85488701"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Mar 2020 13:25:40 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 7E23D50A9975
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2020 13:15:48 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 3 Mar 2020 13:25:35 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 3 Mar 2020 13:25:43 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 3 Mar 2020 03:51:51 -0800
Message-ID: <1583236320-114088-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 7E23D50A9975.A3397
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] collectd: upgrade 5.8.1 -> 5.10.0
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
X-List-Received-Date: Tue, 03 Mar 2020 05:25:43 -0000
Content-Type: text/plain

0001-conditionally-check-libvirt.patch
Removed because it is not applicable to 5.10.0.

Refresh the following patches:
0001-Remove-including-sys-sysctl.h-on-glibc-based-systems.patch
0001-configure-Check-for-Wno-error-format-truncation-comp.patch
0001-fix-to-build-with-glibc-2.25.patch

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...-sys-sysctl.h-on-glibc-based-systems.patch | 106 ++++++++++--------
 .../0001-conditionally-check-libvirt.patch    |  39 -------
 ...for-Wno-error-format-truncation-comp.patch |   6 +-
 .../0001-fix-to-build-with-glibc-2.25.patch   |   4 +-
 .../{collectd_5.8.1.bb => collectd_5.10.0.bb} |   5 +-
 5 files changed, 65 insertions(+), 95 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/collectd/collectd/0001-conditionally-check-libvirt.patch
 rename meta-oe/recipes-extended/collectd/{collectd_5.8.1.bb => collectd_5.10.0.bb} (95%)

diff --git a/meta-oe/recipes-extended/collectd/collectd/0001-Remove-including-sys-sysctl.h-on-glibc-based-systems.patch b/meta-oe/recipes-extended/collectd/collectd/0001-Remove-including-sys-sysctl.h-on-glibc-based-systems.patch
index 3dee34cd0..57044057b 100644
--- a/meta-oe/recipes-extended/collectd/collectd/0001-Remove-including-sys-sysctl.h-on-glibc-based-systems.patch
+++ b/meta-oe/recipes-extended/collectd/collectd/0001-Remove-including-sys-sysctl.h-on-glibc-based-systems.patch
@@ -3,44 +3,69 @@ From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 27 Jul 2019 14:20:14 -0700
 Subject: [PATCH] Remove including sys/sysctl.h on glibc based systems
 
-Glibc 2.30 has added deprecation notice and collectd detects it as warning [1]
+Glibc 2.30 has added deprecation notice and collectd detects it as
+warning [1]
 
 Fixes
-sys/sysctl.h:21:2: error: "The <sys/sysctl.h> header is deprecated and will be removed." [-Werror,-W#warnings]
+sys/sysctl.h:21:2: error: "The <sys/sysctl.h> header is deprecated and
+will be removed." [-Werror,-W#warnings]
 
-[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=744e829637162bb7d5029632aacf341c64b86990
+[1]
+https://sourceware.org/git/?p=glibc.git;a=commit;h=744e829637162bb7d5029632aacf341c64b86990
 
-Upstream-Status: Submitted [https://github.com/collectd/collectd/pull/3234]
+Upstream-Status: Submitted
+[https://github.com/collectd/collectd/pull/3234]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- src/contextswitch.c | 2 +-
- src/memory.c        | 2 +-
- src/swap.c          | 2 +-
- src/uuid.c          | 2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
+ src/cpu.c       | 2 +-
+ src/memory.c    | 2 +-
+ src/processes.c | 2 +-
+ src/swap.c      | 2 +-
+ src/uptime.c    | 2 +-
+ src/uuid.c      | 2 +-
+ 6 files changed, 6 insertions(+), 6 deletions(-)
 
---- a/src/contextswitch.c
-+++ b/src/contextswitch.c
-@@ -26,7 +26,7 @@
- #include "common.h"
- #include "plugin.h"
+diff --git a/src/cpu.c b/src/cpu.c
+index 09d60fe..9d12623 100644
+--- a/src/cpu.c
++++ b/src/cpu.c
+@@ -60,7 +60,7 @@
  
+ #if (defined(HAVE_SYSCTL) && HAVE_SYSCTL) ||                                   \
+     (defined(HAVE_SYSCTLBYNAME) && HAVE_SYSCTLBYNAME)
 -#ifdef HAVE_SYS_SYSCTL_H
 +#if defined(HAVE_SYS_SYSCTL_H) && !defined(__GLIBC__)
  #include <sys/sysctl.h>
  #endif
  
+diff --git a/src/memory.c b/src/memory.c
+index 10bccde..50a8086 100644
 --- a/src/memory.c
 +++ b/src/memory.c
 @@ -28,7 +28,7 @@
- #include "common.h"
  #include "plugin.h"
+ #include "utils/common/common.h"
  
 -#ifdef HAVE_SYS_SYSCTL_H
 +#if defined(HAVE_SYS_SYSCTL_H) && !defined(__GLIBC__)
  #include <sys/sysctl.h>
  #endif
  #ifdef HAVE_SYS_VMMETER_H
+diff --git a/src/processes.c b/src/processes.c
+index f83913a..9f71511 100644
+--- a/src/processes.c
++++ b/src/processes.c
+@@ -87,7 +87,7 @@
+ #if HAVE_MACH_VM_PROT_H
+ #include <mach/vm_prot.h>
+ #endif
+-#if HAVE_SYS_SYSCTL_H
++#if defined(HAVE_SYS_SYSCTL_H) && !defined(__GLIBC__)
+ #include <sys/sysctl.h>
+ #endif
+ /* #endif HAVE_THREAD_INFO */
+diff --git a/src/swap.c b/src/swap.c
+index 61c9e28..5a475e4 100644
 --- a/src/swap.c
 +++ b/src/swap.c
 @@ -49,7 +49,7 @@
@@ -52,39 +77,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include <sys/sysctl.h>
  #endif
  #if HAVE_SYS_DKSTAT_H
---- a/src/uuid.c
-+++ b/src/uuid.c
-@@ -29,7 +29,7 @@
- #include "common.h"
- #include "plugin.h"
- 
--#if HAVE_SYS_SYSCTL_H
-+#if defined(HAVE_SYS_SYSCTL_H) && !defined(__GLIBC__)
- #include <sys/sysctl.h>
- #endif
- 
---- a/src/cpu.c
-+++ b/src/cpu.c
-@@ -60,7 +60,7 @@
- 
- #if (defined(HAVE_SYSCTL) && HAVE_SYSCTL) ||                                   \
-     (defined(HAVE_SYSCTLBYNAME) && HAVE_SYSCTLBYNAME)
--#ifdef HAVE_SYS_SYSCTL_H
-+#if defined(HAVE_SYS_SYSCTL_H) && !defined(__GLIBC__)
- #include <sys/sysctl.h>
- #endif
- 
---- a/src/processes.c
-+++ b/src/processes.c
-@@ -82,7 +82,7 @@
- #if HAVE_MACH_VM_PROT_H
- #include <mach/vm_prot.h>
- #endif
--#if HAVE_SYS_SYSCTL_H
-+#if defined(HAVE_SYS_SYSCTL_H) && !defined(__GLIBC__)
- #include <sys/sysctl.h>
- #endif
- /* #endif HAVE_THREAD_INFO */
+diff --git a/src/uptime.c b/src/uptime.c
+index 0892bda..4b15150 100644
 --- a/src/uptime.c
 +++ b/src/uptime.c
 @@ -33,7 +33,7 @@
@@ -96,3 +90,19 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include <sys/sysctl.h>
  /* Using sysctl interface to retrieve the boot time on *BSD / Darwin / OS X
   * systems */
+diff --git a/src/uuid.c b/src/uuid.c
+index 60d09b5..17e4dd8 100644
+--- a/src/uuid.c
++++ b/src/uuid.c
+@@ -29,7 +29,7 @@
+ #include "plugin.h"
+ #include "utils/common/common.h"
+ 
+-#if HAVE_SYS_SYSCTL_H
++#if defined(HAVE_SYS_SYSCTL_H) && !defined(__GLIBC__)
+ #include <sys/sysctl.h>
+ #endif
+ 
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/collectd/collectd/0001-conditionally-check-libvirt.patch b/meta-oe/recipes-extended/collectd/collectd/0001-conditionally-check-libvirt.patch
deleted file mode 100644
index 5ee75cb4d..000000000
--- a/meta-oe/recipes-extended/collectd/collectd/0001-conditionally-check-libvirt.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 385bf1c2ec57942e17ee529e57eef0dcd99904e6 Mon Sep 17 00:00:00 2001
-From: Roy Li <rongqing.li@windriver.com>
-Date: Tue, 1 Sep 2015 17:00:33 +0800
-Subject: [PATCH] [PATCH] conditionally check libvirt
-
-Upstream-Statue: Pending
-
-check if libvirt is available only when a user wants to use libvirt
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
-
----
- configure.ac | 13 ++++++++-----
- 1 file changed, 8 insertions(+), 5 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 101d6f9f..a7eca97d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -5758,11 +5758,14 @@ else
-   with_libxml2="no (pkg-config doesn't know libxml-2.0)"
- fi
- 
--$PKG_CONFIG --exists libvirt 2>/dev/null
--if test $? = 0; then
--  with_libvirt="yes"
--else
--  with_libvirt="no (pkg-config doesn't know libvirt)"
-+if test "x$enable_libvirt" = "xyes"; then
-+	$PKG_CONFIG --exists libvirt 2>/dev/null
-+	if test "$?" = "0"
-+	then
-+		with_libvirt="yes"
-+	else
-+		with_libvirt="no (pkg-config doesn't know libvirt)"
-+	fi
- fi
- 
- if test "x$with_libxml2" = "xyes"; then
diff --git a/meta-oe/recipes-extended/collectd/collectd/0001-configure-Check-for-Wno-error-format-truncation-comp.patch b/meta-oe/recipes-extended/collectd/collectd/0001-configure-Check-for-Wno-error-format-truncation-comp.patch
index d2c726800..8d31e12f9 100644
--- a/meta-oe/recipes-extended/collectd/collectd/0001-configure-Check-for-Wno-error-format-truncation-comp.patch
+++ b/meta-oe/recipes-extended/collectd/collectd/0001-configure-Check-for-Wno-error-format-truncation-comp.patch
@@ -23,9 +23,9 @@ diff --git a/configure.ac b/configure.ac
 index a7eca97d..560eb988 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -6794,6 +6794,7 @@ if test "x$enable_werror" != "xno"; then
-   AM_CFLAGS="$AM_CFLAGS -Werror"
-   AM_CXXFLAGS="$AM_CXXFLAGS -Werror"
+@@ -7101,6 +7101,7 @@ if test "x$GCC" = "xyes"; then
+     AM_CXXFLAGS="$AM_CXXFLAGS -Werror"
+   fi
  fi
 +AX_CHECK_COMPILE_FLAG([-Werror -Werror=format-truncation],[AM_CFLAGS="$AM_CFLAGS -Wno-error=format-truncation" AM_CXXFLAGS="$AM_CXXFLAGS -Wno-error=format-truncation"])
  
diff --git a/meta-oe/recipes-extended/collectd/collectd/0001-fix-to-build-with-glibc-2.25.patch b/meta-oe/recipes-extended/collectd/collectd/0001-fix-to-build-with-glibc-2.25.patch
index be942e5ef..1e140f975 100644
--- a/meta-oe/recipes-extended/collectd/collectd/0001-fix-to-build-with-glibc-2.25.patch
+++ b/meta-oe/recipes-extended/collectd/collectd/0001-fix-to-build-with-glibc-2.25.patch
@@ -11,8 +11,8 @@ diff --git a/src/md.c b/src/md.c
 index 3725f9a..202225b 100644
 --- a/src/md.c
 +++ b/src/md.c
-@@ -25,6 +25,7 @@
- #include "utils_ignorelist.h"
+@@ -26,6 +26,7 @@
+ #include "utils/ignorelist/ignorelist.h"
  
  #include <sys/ioctl.h>
 +#include <sys/sysmacros.h>
diff --git a/meta-oe/recipes-extended/collectd/collectd_5.8.1.bb b/meta-oe/recipes-extended/collectd/collectd_5.10.0.bb
similarity index 95%
rename from meta-oe/recipes-extended/collectd/collectd_5.8.1.bb
rename to meta-oe/recipes-extended/collectd/collectd_5.10.0.bb
index 8b9fd74a8..df3a5b204 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.8.1.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.10.0.bb
@@ -9,15 +9,14 @@ SRC_URI = "http://collectd.org/files/collectd-${PV}.tar.bz2 \
            file://collectd.init \
            file://collectd.service \
            file://no-gcrypt-badpath.patch \
-           file://0001-conditionally-check-libvirt.patch \
            file://0001-fix-to-build-with-glibc-2.25.patch \
            file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch \
            file://0005-Disable-new-gcc8-warnings.patch \
            file://0006-libcollectdclient-Fix-string-overflow-errors.patch \
            file://0001-Remove-including-sys-sysctl.h-on-glibc-based-systems.patch \
            "
-SRC_URI[md5sum] = "bfce96c42cede5243028510bcc57c1e6"
-SRC_URI[sha256sum] = "e796fda27ce06377f491ad91aa286962a68c2b54076aa77a29673d53204453da"
+SRC_URI[md5sum] = "a8344a199b124711bdbec57f1c0b624f"
+SRC_URI[sha256sum] = "a03359f563023e744c2dc743008a00a848f4cd506e072621d86b6d8313c0375b"
 
 inherit autotools python3native update-rc.d pkgconfig systemd
 
-- 
2.17.1




