Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5900A77846
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 05:32:27 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 79so9252161pgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Mar 2017 22:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2lgLYU95eorvMfBe2w78Bu5RNvxQ2qvH4z/9WppsHoE=;
	b=N+bbWpXc1M6UueYbk27gf1jl7ar2H8ghXoinUsXiaA2vT/1zUCDLcK/LroVlI/HMkR
	H7PHqzUgFiVi5qFJd3kEMa1Ab+I3jpXuZ/Z8cfv9lUOC0gjGHvEZQGvujVUyxQI12gH/
	UW9aokBIXijvwL5W2f4ZPnplykWmoKv0LeoM3hG7Q6f1irDxPHSsDR4Kc4c64wAYle52
	IUy/jOmNgun99n61n/Ooyf9HxBJ+WDkDjd3j2QKjeSx+TnsHN+NP+IN8jO9i0CDoTt+H
	pgH8xgdIuHMnwURqHD4LI9TyiI5RlZwnn0L5Iph0mztc1qrgOrnHIUUWHBVzMJb+6kH6
	1mCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2lgLYU95eorvMfBe2w78Bu5RNvxQ2qvH4z/9WppsHoE=;
	b=IedyTLN9KmwYeu6egNI8++zuA6i62RkBkwfO2ZH/t+fLQwMRgTu3XMlp3gYA35MxOq
	E/vbvD9gD+signKfJNlwpsS+fvsC2zqixVIpFo3o5q534eQwGQkfbO+wyZsYeu4MAgsZ
	Bkp7HQHyqP5GcvQQqa4H/PR6IPNwtnYrzutwnE3bk2ajZutzf4eajgmA4UD1znk7iIsk
	IJe7Shcbk4u/onseusafOjJo2VzpqX0OuEwgKmy6N1UfX9zY5ih9HP7ReaG+PB8GOxs7
	QR1IoZ2dt6IdoLWuqdhhrk+TQjA4FhMQ+bgA7eLXtDV03h52QJQMnyJvAkuI+SutZvbD
	pobw==
X-Gm-Message-State: AFeK/H3znewV3kXPGiytPKyEe8zCefA0gOfgepNahvXzC0HTkSE0TOkubnFu4CgANh1G2w==
X-Received: by 10.84.192.137 with SMTP id c9mr37645440pld.17.1489987948722;
	Sun, 19 Mar 2017 22:32:28 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	o189sm30203934pga.12.2017.03.19.22.32.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Mar 2017 22:32:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Mar 2017 22:31:52 -0700
Message-Id: <20170320053152.29352-16-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170320053152.29352-1-raj.khem@gmail.com>
References: <20170320053152.29352-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 16/16] libexecinfo: Add recipe
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
X-List-Received-Date: Mon, 20 Mar 2017 05:32:27 -0000

This package is handy especially with musl to port
apps which use glibc backtrace APIs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-makefile-Fix-build-on-linux.patch         | 59 ++++++++++++++++
 ...x-compiler-errors-found-with-newer-gcc-cl.patch | 79 ++++++++++++++++++++++
 .../libexecinfo/libexecinfo_1.1.bb                 | 27 ++++++++
 3 files changed, 165 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libexecinfo/libexecinfo/0001-makefile-Fix-build-on-linux.patch
 create mode 100644 meta-oe/recipes-extended/libexecinfo/libexecinfo/0002-execinfo-Fix-compiler-errors-found-with-newer-gcc-cl.patch
 create mode 100644 meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb

diff --git a/meta-oe/recipes-extended/libexecinfo/libexecinfo/0001-makefile-Fix-build-on-linux.patch b/meta-oe/recipes-extended/libexecinfo/libexecinfo/0001-makefile-Fix-build-on-linux.patch
new file mode 100644
index 000000000..f1863f14b
--- /dev/null
+++ b/meta-oe/recipes-extended/libexecinfo/libexecinfo/0001-makefile-Fix-build-on-linux.patch
@@ -0,0 +1,59 @@
+From 910bbc2cb6cc1cfa6deed9d170da02a639902c7c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 19 Mar 2017 16:14:54 -0700
+Subject: [PATCH 1/2] makefile: Fix build on linux
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 33 +++++++++++++++++----------------
+ 1 file changed, 17 insertions(+), 16 deletions(-)
+
+Index: libexecinfo-1.1/Makefile
+===================================================================
+--- libexecinfo-1.1.orig/Makefile
++++ libexecinfo-1.1/Makefile
+@@ -23,24 +23,25 @@
+ # SUCH DAMAGE.
+ #
+ # $Id: Makefile,v 1.3 2004/07/19 05:19:55 sobomax Exp $
++#
++# Linux Makefile by Matt Smith <mcs@darkregion.net>, 2011/01/04
+ 
+-LIB=	execinfo
+-
+-SRCS=	stacktraverse.c stacktraverse.h execinfo.c execinfo.h
+-
+-INCS=	execinfo.h
+-
+-SHLIB_MAJOR=	1
+-SHLIB_MINOR=	0
+-
+-NOPROFILE=	yes
+-
+-DPADD=		${LIBM}
+-LDADD=		-lm
+-
+-#WARNS?=	4
+-
+-#stacktraverse.c: gen.py
+-#	./gen.py > stacktraverse.c
++CC?=cc
++AR?=ar
++EXECINFO_CFLAGS=$(CFLAGS) -O2 -pipe -fno-strict-aliasing -std=gnu99 -fstack-protector -c
++EXECINFO_LDFLAGS=$(LDFLAGS)
++
++all: static dynamic
++
++static:
++	$(CC) $(EXECINFO_CFLAGS) $(EXECINFO_LDFLAGS) stacktraverse.c
++	$(CC) $(EXECINFO_CFLAGS) $(EXECINFO_LDFLAGS) execinfo.c
++	$(AR) rcs libexecinfo.a stacktraverse.o execinfo.o
++
++dynamic:
++	$(CC) -fpic -DPIC $(EXECINFO_CFLAGS) $(EXECINFO_LDFLAGS) stacktraverse.c -o stacktraverse.So
++	$(CC) -fpic -DPIC $(EXECINFO_CFLAGS) $(EXECINFO_LDFLAGS) execinfo.c -o execinfo.So
++	$(CC) -shared -Wl,-soname,libexecinfo.so.1 -o libexecinfo.so.1 $(EXECINFO_LDFLAGS) stacktraverse.So execinfo.So
+ 
+-.include <bsd.lib.mk>
++clean:
++	rm -rf *.o *.So *.a *.so
diff --git a/meta-oe/recipes-extended/libexecinfo/libexecinfo/0002-execinfo-Fix-compiler-errors-found-with-newer-gcc-cl.patch b/meta-oe/recipes-extended/libexecinfo/libexecinfo/0002-execinfo-Fix-compiler-errors-found-with-newer-gcc-cl.patch
new file mode 100644
index 000000000..423b67082
--- /dev/null
+++ b/meta-oe/recipes-extended/libexecinfo/libexecinfo/0002-execinfo-Fix-compiler-errors-found-with-newer-gcc-cl.patch
@@ -0,0 +1,79 @@
+From 0810817773fb81d7383d2fa8464244c8f79845fb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 19 Mar 2017 16:16:18 -0700
+Subject: [PATCH 2/2] execinfo: Fix compiler errors found with newer gcc/clang
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ execinfo.c | 19 +++++++++++--------
+ 1 file changed, 11 insertions(+), 8 deletions(-)
+
+diff --git a/execinfo.c b/execinfo.c
+index 906fb14..9448b60 100644
+--- a/execinfo.c
++++ b/execinfo.c
+@@ -69,7 +69,8 @@ backtrace(void **buffer, int size)
+ char **
+ backtrace_symbols(void *const *buffer, int size)
+ {
+-    int i, clen, alen, offset;
++    size_t clen, alen;
++    int i, offset;
+     char **rval;
+     char *cp;
+     Dl_info info;
+@@ -78,7 +79,6 @@ backtrace_symbols(void *const *buffer, int size)
+     rval = malloc(clen);
+     if (rval == NULL)
+         return NULL;
+-    (char **)cp = &(rval[size]);
+     for (i = 0; i < size; i++) {
+         if (dladdr(buffer[i], &info) != 0) {
+             if (info.dli_sname == NULL)
+@@ -92,14 +92,14 @@ backtrace_symbols(void *const *buffer, int size)
+                    2 +                      /* " <" */
+                    strlen(info.dli_sname) + /* "function" */
+                    1 +                      /* "+" */
+-                   D10(offset) +            /* "offset */
++                   10 +                     /* "offset */
+                    5 +                      /* "> at " */
+                    strlen(info.dli_fname) + /* "filename" */
+                    1;                       /* "\0" */
+             rval = realloc_safe(rval, clen + alen);
+             if (rval == NULL)
+                 return NULL;
+-            snprintf(cp, alen, "%p <%s+%d> at %s",
++            snprintf((char *) rval + clen, alen, "%p <%s+%d> at %s",
+               buffer[i], info.dli_sname, offset, info.dli_fname);
+         } else {
+             alen = 2 +                      /* "0x" */
+@@ -108,12 +108,15 @@ backtrace_symbols(void *const *buffer, int size)
+             rval = realloc_safe(rval, clen + alen);
+             if (rval == NULL)
+                 return NULL;
+-            snprintf(cp, alen, "%p", buffer[i]);
++            snprintf((char *) rval + clen, alen, "%p", buffer[i]);
+         }
+-        rval[i] = cp;
+-        cp += alen;
++        rval[i] = (char *) clen;
++        clen += alen;
+     }
+ 
++    for (i = 0; i < size; i++)
++        rval[i] += (long) rval;
++
+     return rval;
+ }
+ 
+@@ -155,6 +158,6 @@ backtrace_symbols_fd(void *const *buffer, int size, int fd)
+                 return;
+             snprintf(buf, len, "%p\n", buffer[i]);
+         }
+-        write(fd, buf, len - 1);
++        write(fd, buf, strlen(buf));
+     }
+ }
+-- 
+2.12.0
+
diff --git a/meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb b/meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb
new file mode 100644
index 000000000..48d14dd62
--- /dev/null
+++ b/meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb
@@ -0,0 +1,27 @@
+# Copyright (C) 2017 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "A quick-n-dirty BSD licensed clone of the GNU libc backtrace facility."
+HOMEPAGE = "http://www.freshports.org/devel/libexecinfo"
+LIC_FILES_CHKSUM = "file://execinfo.c;endline=25;md5=85bd3fa4ea9acae5182e29db063fe2e5"
+LICENSE = "BSD-2-Clause"
+SECTION = "libs"
+DEPENDS = ""
+
+SRC_URI = "http://distcache.freebsd.org/local-distfiles/itetcu/${BP}.tar.bz2 \
+           file://0001-makefile-Fix-build-on-linux.patch \
+           file://0002-execinfo-Fix-compiler-errors-found-with-newer-gcc-cl.patch \
+           "
+SRC_URI[md5sum] = "8e9e81c554c1c5d735bc877448e92b91"
+SRC_URI[sha256sum] = "c9a21913e7fdac8ef6b33250b167aa1fc0a7b8a175145e26913a4c19d8a59b1f"
+
+CFLAGS += "-fno-omit-frame-pointer"
+
+do_install() {
+    install -D -m 0744 ${S}/execinfo.h ${D}${includedir}/execinfo.h
+    install -D -m 0744 ${S}/stacktraverse.h ${D}${includedir}/stacktraverse.h
+    install -D -m 0744 ${B}/libexecinfo.a ${D}${libdir}/libexecinfo.a
+    install -D -m 0755 ${B}/libexecinfo.so.1 ${D}${libdir}/libexecinfo.so.1
+    ln -s libexecinfo.so.1 ${D}${libdir}/libexecinfo.so
+}
+
-- 
2.12.0


