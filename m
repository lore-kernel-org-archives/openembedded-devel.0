Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.30554.1590739816903024628
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 May 2020 01:10:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,447,1583164800"; 
   d="scan'208";a="93343086"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 May 2020 16:10:05 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id DC0544BCC8A9
	for <openembedded-devel@lists.openembedded.org>; Fri, 29 May 2020 16:10:04 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 29 May 2020 16:10:06 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] snort: upgrade 2.9.15 -> 2.9.16
Date: Sat, 30 May 2020 01:10:00 +0800
Message-ID: <1590772202-42997-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1590772202-42997-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1590772202-42997-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: DC0544BCC8A9.A659B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-0001-chdeck-for-gettid-API-during-configure.patch
Removed since this is included in 2.9.16

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...deck-for-gettid-API-during-configure.patch | 48 -------------------
 .../{snort_2.9.15.bb => snort_2.9.16.bb}      |  5 +-
 2 files changed, 2 insertions(+), 51 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/snort/snort/0001-chdeck-for-gettid-API-during-configure.patch
 rename meta-networking/recipes-connectivity/snort/{snort_2.9.15.bb => snort_2.9.16.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/snort/snort/0001-chdeck-for-gettid-API-during-configure.patch b/meta-networking/recipes-connectivity/snort/snort/0001-chdeck-for-gettid-API-during-configure.patch
deleted file mode 100644
index eff610de7c..0000000000
--- a/meta-networking/recipes-connectivity/snort/snort/0001-chdeck-for-gettid-API-during-configure.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From c45ab69f9428e4d2fc1146301a4546bb2b42c9ae Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 27 Jul 2019 00:25:58 -0700
-Subject: [PATCH] chdeck for gettid API during configure
-
-glibc 2.30 added gettid syscall wrapper
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.in | 2 +-
- src/util.h   | 2 ++
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/configure.in b/configure.in
-index 000bb91..d79e6d0 100644
---- a/configure.in
-+++ b/configure.in
-@@ -256,7 +256,7 @@ SN_CHECK_DECLS(printf fprintf syslog puts fputs fputc fopen  \
-            strcasecmp strncasecmp strerror perror socket sendto   \
-            vsnprintf snprintf strtoul)
- 
--AC_CHECK_FUNCS([sigaction strlcpy strlcat strerror vswprintf wprintf memrchr inet_ntop])
-+AC_CHECK_FUNCS([sigaction strlcpy strlcat strerror vswprintf wprintf memrchr inet_ntop gettid])
- 
- AC_CHECK_FUNC([snprintf],[have_snprintf="yes"],[have_snprintf="no"])
- AM_CONDITIONAL(BUILD_SNPRINTF, test "x$have_snprintf" != "xyes")
-diff --git a/src/util.h b/src/util.h
-index 6880906..c310b83 100644
---- a/src/util.h
-+++ b/src/util.h
-@@ -374,6 +374,7 @@ static inline int IsEmptyStr(const char *str)
-     return 0;
- }
- 
-+#if !HAVE_GETTID
- static inline pid_t gettid(void)
- {
- #if defined(LINUX) && defined(SYS_gettid)
-@@ -382,5 +383,6 @@ static inline pid_t gettid(void)
-     return getpid();
- #endif
- }
-+#endif
- 
- #endif /*__UTIL_H__*/
--- 
-2.22.0
-
diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.15.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.16.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/snort/snort_2.9.15.bb
rename to meta-networking/recipes-connectivity/snort/snort_2.9.16.bb
index fbec1950d4..d8073d865b 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.15.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.16.bb
@@ -13,11 +13,10 @@ SRC_URI = "https://www.snort.org/downloads/archive/snort/${BP}.tar.gz \
     file://fix-host-contamination-when-enable-static-daq.patch \
     file://disable-run-test-program-while-cross-compiling.patch \
     file://configure.in-disable-tirpc-checking-for-fedora.patch \
-    file://0001-chdeck-for-gettid-API-during-configure.patch \
 "
 
-SRC_URI[md5sum] = "b56cadfa840f706ff67d4df0256c03eb"
-SRC_URI[sha256sum] = "bfb437746446ef72a03c501db13cd6da5edd2b41f55c80c437ba288be6da7dba"
+SRC_URI[md5sum] = "1cec58babaea3420014d61a93e6e1545"
+SRC_URI[sha256sum] = "9688d8edf1da09dec6574000fb3c0e62f99c56428587616e17c60103c0bcbad7"
 
 UPSTREAM_CHECK_URI = "https://www.snort.org/downloads"
 UPSTREAM_CHECK_REGEX = "snort-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.17.1



