Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6865A77EAD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:47 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 79so18588017pgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vpQmrv2CFoD+Sh7i9HUTlKKV3KHHogA20hbTZduES34=;
	b=pxdjmi/iiOA2d9LIHEV1+/nfaIcrySji9fV7VwXX2l/NewOYqwGjPmyA7pM0q8R1XT
	j+++KVlnyzfihlsaI7GhfEnXRgAOK6YQjDCSPIQHVFgkY4QRF+y7D0k820i0qsfJ0Ckt
	SFC0FSNWAZG/IEsqaqZ+EWCJuyIJRD2byjrIe2dW5Y22/X+qJl7H2Dw0QS5XDM0IyCa4
	nsiKrBz9nfXG+i/KaS8JU8kY6WR4Iw9tP62WFNCZEQLYpcJvF+uZZu/jvS1emMM7ctSq
	sf3+yguB/6qWNKvrLjKXKARYVzq5fs7m18ZDdG5guQ8wV6NoShJ9Xpakrp1iuupis5V0
	NnjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vpQmrv2CFoD+Sh7i9HUTlKKV3KHHogA20hbTZduES34=;
	b=CqAOeurFXmac+IXUptmrLXYcU+2WTFT0pWauNuSH+rzkoSyX9JVnoDZAGkBflDybtC
	HUaoqh4+wCsuyHjGowU0APCE0xjoKN1JLFbf91lYueEkfr809uiuKj05ANLKA5QU9FW+
	WWgYuF7772r8gZut7i+9wtUdIGXbq9mHPIBVLon5rUjSxvSb/iR3id4PsPt54ZGUxS7E
	5s2FgV/vfC6PMUMo5Qnsr+5FYOcf/NaiXfGti1SBPJtGyPDH943zmMDS6q27wVXmpGY0
	bgoqnYJtEPPTU7dE9BrDuXtOfwZpLjJfVVwDBtYAJ6UUkjQXXfHJG/nxRBTz8iyO/wSm
	m6UQ==
X-Gm-Message-State: AFeK/H2H+wS3erEBvgKg09JLfO7okDd3i83mfls2apwnGXSgqXY6VbY+sXCQN/bU2W74FQ==
X-Received: by 10.98.216.202 with SMTP id e193mr3617037pfg.80.1490978628190;
	Fri, 31 Mar 2017 09:43:48 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:40 -0700
Message-Id: <20170331164247.5052-36-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2 36/43] libexecinfo: Add recipe
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:47 -0000

This package is handy especially with musl to port
apps which use glibc backtrace APIs

build for musl systems alone

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-makefile-Fix-build-on-linux.patch         | 59 ++++++++++++++++
 ...x-compiler-errors-found-with-newer-gcc-cl.patch | 79 ++++++++++++++++++++++
 .../libexecinfo/libexecinfo_1.1.bb                 | 31 +++++++++
 3 files changed, 169 insertions(+)
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
index 000000000..f79b1ab18
--- /dev/null
+++ b/meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb
@@ -0,0 +1,31 @@
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
+#
+# We will skip parsing for non-musl systems
+#
+COMPATIBLE_HOST = ".*-musl.*"
+
-- 
2.12.1


