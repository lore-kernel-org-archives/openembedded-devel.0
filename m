Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.3960.1586311020761657731
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2020 18:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,357,1580745600"; 
   d="scan'208";a="88653240"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Apr 2020 09:56:59 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 7648549DF13B
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Apr 2020 09:46:33 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 8 Apr 2020 09:56:56 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 8 Apr 2020 09:57:03 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe][PATCH] collectd: upgrade 5.10.0 -> 5.11.0
Date: Wed, 8 Apr 2020 02:04:07 -0700
Message-ID: <1586336650-19326-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1586336650-19326-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1586336650-19326-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 7648549DF13B.A343E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

refresh 0001-Remove-including-sys-sysctl.h-on-glibc-based-systems.patch

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...-sys-sysctl.h-on-glibc-based-systems.patch | 57 +------------------
 ...{collectd_5.10.0.bb => collectd_5.11.0.bb} |  4 +-
 2 files changed, 3 insertions(+), 58 deletions(-)
 rename meta-oe/recipes-extended/collectd/{collectd_5.10.0.bb => collectd_5.11.0.bb} (96%)

diff --git a/meta-oe/recipes-extended/collectd/collectd/0001-Remove-including-sys-sysctl.h-on-glibc-based-systems.patch b/meta-oe/recipes-extended/collectd/collectd/0001-Remove-including-sys-sysctl.h-on-glibc-based-systems.patch
index 57044057b..7948788f9 100644
--- a/meta-oe/recipes-extended/collectd/collectd/0001-Remove-including-sys-sysctl.h-on-glibc-based-systems.patch
+++ b/meta-oe/recipes-extended/collectd/collectd/0001-Remove-including-sys-sysctl.h-on-glibc-based-systems.patch
@@ -17,40 +17,10 @@ Upstream-Status: Submitted
 [https://github.com/collectd/collectd/pull/3234]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- src/cpu.c       | 2 +-
- src/memory.c    | 2 +-
  src/processes.c | 2 +-
- src/swap.c      | 2 +-
  src/uptime.c    | 2 +-
- src/uuid.c      | 2 +-
- 6 files changed, 6 insertions(+), 6 deletions(-)
+ 2 files changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/src/cpu.c b/src/cpu.c
-index 09d60fe..9d12623 100644
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
-diff --git a/src/memory.c b/src/memory.c
-index 10bccde..50a8086 100644
---- a/src/memory.c
-+++ b/src/memory.c
-@@ -28,7 +28,7 @@
- #include "plugin.h"
- #include "utils/common/common.h"
- 
--#ifdef HAVE_SYS_SYSCTL_H
-+#if defined(HAVE_SYS_SYSCTL_H) && !defined(__GLIBC__)
- #include <sys/sysctl.h>
- #endif
- #ifdef HAVE_SYS_VMMETER_H
 diff --git a/src/processes.c b/src/processes.c
 index f83913a..9f71511 100644
 --- a/src/processes.c
@@ -64,19 +34,6 @@ index f83913a..9f71511 100644
  #include <sys/sysctl.h>
  #endif
  /* #endif HAVE_THREAD_INFO */
-diff --git a/src/swap.c b/src/swap.c
-index 61c9e28..5a475e4 100644
---- a/src/swap.c
-+++ b/src/swap.c
-@@ -49,7 +49,7 @@
- #if HAVE_SYS_PARAM_H
- #include <sys/param.h>
- #endif
--#if HAVE_SYS_SYSCTL_H
-+#if defined(HAVE_SYS_SYSCTL_H) && !defined(__GLIBC__)
- #include <sys/sysctl.h>
- #endif
- #if HAVE_SYS_DKSTAT_H
 diff --git a/src/uptime.c b/src/uptime.c
 index 0892bda..4b15150 100644
 --- a/src/uptime.c
@@ -90,18 +47,6 @@ index 0892bda..4b15150 100644
  #include <sys/sysctl.h>
  /* Using sysctl interface to retrieve the boot time on *BSD / Darwin / OS X
   * systems */
-diff --git a/src/uuid.c b/src/uuid.c
-index 60d09b5..17e4dd8 100644
---- a/src/uuid.c
-+++ b/src/uuid.c
-@@ -29,7 +29,7 @@
- #include "plugin.h"
- #include "utils/common/common.h"
- 
--#if HAVE_SYS_SYSCTL_H
-+#if defined(HAVE_SYS_SYSCTL_H) && !defined(__GLIBC__)
- #include <sys/sysctl.h>
- #endif
  
 -- 
 2.17.1
diff --git a/meta-oe/recipes-extended/collectd/collectd_5.10.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.11.0.bb
similarity index 96%
rename from meta-oe/recipes-extended/collectd/collectd_5.10.0.bb
rename to meta-oe/recipes-extended/collectd/collectd_5.11.0.bb
index df3a5b204..a70e82e03 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.10.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.11.0.bb
@@ -15,8 +15,8 @@ SRC_URI = "http://collectd.org/files/collectd-${PV}.tar.bz2 \
            file://0006-libcollectdclient-Fix-string-overflow-errors.patch \
            file://0001-Remove-including-sys-sysctl.h-on-glibc-based-systems.patch \
            "
-SRC_URI[md5sum] = "a8344a199b124711bdbec57f1c0b624f"
-SRC_URI[sha256sum] = "a03359f563023e744c2dc743008a00a848f4cd506e072621d86b6d8313c0375b"
+SRC_URI[md5sum] = "13b1c946f6684abe453e24b5cd80ec45"
+SRC_URI[sha256sum] = "37b10a806e34aa8570c1cafa6006c604796fae13cc2e1b3e630d33dcba9e5db2"
 
 inherit autotools python3native update-rc.d pkgconfig systemd
 
-- 
2.17.1



