Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.2165.1626311609667191453
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jul 2021 18:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dH6T5d39;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id c15so2333764pls.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jul 2021 18:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qNZAC3g0S0xtUYOpkdU1EKqAOsTw9CdFKehGOvEkPpo=;
        b=dH6T5d39OAj87CYqx/u2s7/ZbErKmQOmstryrRvggMseLGO7LTGqUD06hXvY96lImE
         sfk9eYydfuHB4NXLk+GY81pxQHErKhIA4nxWGHEeUYgbrsDSezaF6bZ5YXRLQahrrdvr
         IYTAFNH67BAkSlO0NTTaVwXeXPuQe7wga98tcbGZ5D/2OVsKRpc5neVBgb2oZ7wSyn1K
         YBLyC/4AxZB7OTZINPdmeYxL3O0J/CSDjK+rt3ZtPrXshRqtewmiHQHq1PO0excHHpql
         1N23z+8e459TwfAIFqlZ09zLrZbTYU6PP4h9GtZT2uwNiDIBEjWsx2VmdU+Q1lLwYcXn
         V5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qNZAC3g0S0xtUYOpkdU1EKqAOsTw9CdFKehGOvEkPpo=;
        b=X5SXLLdnAncpSYr+KaySxgIrAQpsBYp7ODa6QXbBL9HH86sKgRJ+TsENWkNUA3P2Zw
         gn1pX5QaPWr/h21xCuVfgV0ekVO3eMUsxnR2PoRx3sI8h+4HKM6O7ZHSbHIolvUkada8
         GGGgPusfa06Nw4/Cp1r3sBkTusCXy9JuzKZRzBL/DujMzN9I0ZMuw7V+ESZqVQdKxQbe
         fmy48WGnEXhNdzNTN8H6ifMAYXM90Gy2Q8IR0b+xmPbaI8LXYfAy4K6LrHa7Y8Oa9XJU
         mWloXPecczdkpaNChZ1CVyByZf280ZDJCqi+S7OsQ0EWuMCU0duVt/TjLoIcT5jPOSbv
         r5bQ==
X-Gm-Message-State: AOAM532SXB3hn0LggYb7k3F7jbot6oJS3hmSBf+h1kALCdGp/o/alL+0
	QAYZDk3BCRNQF/3YZmXSKw3EzmiexEViNQ==
X-Google-Smtp-Source: ABdhPJznxOVYbx3/KR7H57d7NSDuZLwevHDbSdcRU7olg/WgzxxzCABgnKJTSWcQDhoZ552V3UoCWA==
X-Received: by 2002:a17:902:b285:b029:129:c8a4:3934 with SMTP id u5-20020a170902b285b0290129c8a43934mr826168plr.75.1626311608896;
        Wed, 14 Jul 2021 18:13:28 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::5593])
        by smtp.gmail.com with ESMTPSA id j2sm4317159pfb.53.2021.07.14.18.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 18:13:28 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] postfix: Upgrade to 3.6.1
Date: Wed, 14 Jul 2021 18:13:26 -0700
Message-Id: <20210715011326.3714680-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix build with glibc 2.34+
Details of this release [1]

[1] http://cdn.postfix.johnriley.me/mirrors/postfix-release/official/postfix-3.6.1.RELEASE_NOTES

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...7-correct-signature-of-closefrom-API.patch | 101 ++++++++++++++++++
 .../{postfix_3.4.12.bb => postfix_3.6.1.bb}   |   3 +-
 2 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-daemons/postfix/files/0007-correct-signature-of-closefrom-API.patch
 rename meta-networking/recipes-daemons/postfix/{postfix_3.4.12.bb => postfix_3.6.1.bb} (82%)

diff --git a/meta-networking/recipes-daemons/postfix/files/0007-correct-signature-of-closefrom-API.patch b/meta-networking/recipes-daemons/postfix/files/0007-correct-signature-of-closefrom-API.patch
new file mode 100644
index 0000000000..e583354ccb
--- /dev/null
+++ b/meta-networking/recipes-daemons/postfix/files/0007-correct-signature-of-closefrom-API.patch
@@ -0,0 +1,101 @@
+From 1e451ddc15af1a4e19318c8b1ced46c5c41610d3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 14 Jul 2021 18:08:30 -0700
+Subject: [PATCH] correct signature of closefrom() API
+
+glibc 2.34 introduced this function and finds this error which has been
+all along.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/util/sys_compat.c |  6 +++---
+ src/util/sys_defs.h   | 12 ++++++------
+ 2 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/src/util/sys_compat.c b/src/util/sys_compat.c
+index 8bf8e58..c87f043 100644
+--- a/src/util/sys_compat.c
++++ b/src/util/sys_compat.c
+@@ -286,7 +286,7 @@ int     dup2_pass_on_exec(int oldd, int newd)
+
+ /* closefrom() - closes all file descriptors from the given one up */
+
+-int     closefrom(int lowfd)
++void     closefrom(int lowfd)
+ {
+     int     fd_limit = open_limit(0);
+     int     fd;
+@@ -298,14 +298,14 @@ int     closefrom(int lowfd)
+      */
+     if (lowfd < 0) {
+ 	errno = EBADF;
+-	return (-1);
++	return;
+     }
+     if (fd_limit > 500)
+ 	fd_limit = 500;
+     for (fd = lowfd; fd < fd_limit; fd++)
+ 	(void) close(fd);
+
+-    return (0);
++    return;
+ }
+
+ #endif
+diff --git a/src/util/sys_defs.h b/src/util/sys_defs.h
+index 2e1c953..515de6c 100644
+--- a/src/util/sys_defs.h
++++ b/src/util/sys_defs.h
+@@ -1509,7 +1509,7 @@ extern int setsid(void);
+ #endif
+
+ #ifndef HAS_CLOSEFROM
+-extern int closefrom(int);
++extern void closefrom(int);
+
+ #endif
+
+@@ -1563,7 +1563,7 @@ typedef int pid_t;
+
+  /*
+   * Clang-style attribute tests.
+-  *
++  *
+   * XXX Without the unconditional test below, gcc 4.6 will barf on ``elif
+   * defined(__clang__) && __has_attribute(__whatever__)'' with error message
+   * ``missing binary operator before token "("''.
+@@ -1577,7 +1577,7 @@ typedef int pid_t;
+   * warn for missing initializations and other trouble. However, OPENSTEP4
+   * gcc 2.7.x cannot handle this so we define this only if NORETURN isn't
+   * already defined above.
+-  *
++  *
+   * Data point: gcc 2.7.2 has __attribute__ (Wietse Venema) but gcc 2.6.3 does
+   * not (Clive Jones). So we'll set the threshold at 2.7.
+   */
+@@ -1653,12 +1653,12 @@ typedef int pid_t;
+   * write to output parameters (for example, stat- or scanf-like functions)
+   * or from functions that have other useful side effects (for example,
+   * fseek- or rename-like functions).
+-  *
++  *
+   * DO NOT use this for functions that write to a stream; it is entirely
+   * legitimate to detect write errors with fflush() or fclose() only. On the
+   * other hand most (but not all) functions that read from a stream must
+   * never ignore result values.
+-  *
++  *
+   * XXX Prepending "(void)" won't shut up GCC. Clang behaves as expected.
+   */
+ #if ((__GNUC__ == 3 && __GNUC_MINOR__ >= 4) || __GNUC__ > 3)
+@@ -1739,7 +1739,7 @@ typedef const char *CONST_CHAR_STAR;
+   * Safety. On some systems, ctype.h misbehaves with non-ASCII or negative
+   * characters. More importantly, Postfix uses the ISXXX() macros to ensure
+   * protocol compliance, so we have to rule out non-ASCII characters.
+-  *
++  *
+   * XXX The (unsigned char) casts in isalnum() etc arguments are unnecessary
+   * because the ISASCII() guard already ensures that the values are
+   * non-negative; the casts are done anyway to shut up chatty compilers.
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.4.12.bb b/meta-networking/recipes-daemons/postfix/postfix_3.6.1.bb
similarity index 82%
rename from meta-networking/recipes-daemons/postfix/postfix_3.4.12.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.6.1.bb
index db5b41bfbd..c139f06610 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.4.12.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.6.1.bb
@@ -13,6 +13,7 @@ SRC_URI += "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://postfix-install.patch \
            file://icu-config.patch \
            file://0001-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
+           file://0007-correct-signature-of-closefrom-API.patch \
            "
-SRC_URI[sha256sum] = "18555183ae8b52a9e76067799279c86f9f2770cdef3836deb8462ee0a0855dec"
+SRC_URI[sha256sum] = "20a805625601e7b95989220832c8fa14ce374f0711da054188f8cec6a92fd71c"
 UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.3(\.\d+)+).tar.gz"
--
2.32.0
