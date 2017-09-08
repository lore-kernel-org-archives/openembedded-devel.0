Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0CEB17757F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Sep 2017 18:29:25 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id g65so1549575pfe.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Sep 2017 11:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=gfcqRp7CXW38zq8gp0bk2VasCJR8Vk//ijydrZ9ejlc=;
	b=hE89mnES/PkJxf6yWtkGEUmCmMjYElHD4FIPEyCTjdhJ9GJKa8m8Lpq15ycIxw7cWz
	yNXQL/h3uTBwuNzi88Ib3D7lPGXWx/cFW1WNohn6IE2OOCHw5IPTY6CvxJ4OundWCn1k
	XBbvwkA0Pl2i50RdUj9oPJvgPyyTaFKmfQOPi+j9AYS0z4jhOXkTSPZedtC2uoFdvpym
	T7jwgCIiQwgHGwgPIy7MXmSG3tNvOMgZlAO8AWFDfBMiy0CKNofZfn2nM6RfbuHgPqff
	A2fH7B0z8sA9wky9csUNLOxKhRay4oPaEWGXxejqleYAJu3Qc6p9psig+DsKtzRDeTq3
	wj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gfcqRp7CXW38zq8gp0bk2VasCJR8Vk//ijydrZ9ejlc=;
	b=hXTaf3xW4HGTJdx2Rbc1V4EKsBmWk71ku5Q0324+0Bgc7OzpqYCDu4B81EjUVRpLIg
	30ushHgYvf+zto1ohZY7H383DJPfUK5rRTr+qZc1xudIa3AOZXuhbyKsua6SqoZ953YU
	kYnf8Ymupb+omVIBNfEjdk5B1z0EJp7fnbSPAbOB8oAcXJ64wZIe3AVrcqHfMuJ+Uz2r
	dIX556OzQW4efethXqdI0u0lXmL0pc0xnc/nk1DfF2aZco0kxXDgNbW1Z6IBdUrsfQ5J
	LR4edONsygz0EdBF26sKAD2hq0frHDJQz3kS+OtIza9l62nzWBpfXHSahbv9NtXumHQS
	qj8A==
X-Gm-Message-State: AHPjjUhw6Rk6i+wTR2yFbnqlPzOCDeuaGCghgxxz/78HE0NkzQ5xY8dC
	rXK85Neos8EgZxVo
X-Google-Smtp-Source: ADKCNb5qE1EEsaHnJ182PZ0BTuUACnfbpaxqvDZY9AL+CnLg2niY+DpE8J1rHcLwlgw5ib8WbWqbnQ==
X-Received: by 10.84.210.35 with SMTP id z32mr4504281plh.345.1504895366691;
	Fri, 08 Sep 2017 11:29:26 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::be3d])
	by smtp.gmail.com with ESMTPSA id m5sm4993977pfh.35.2017.09.08.11.29.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Sep 2017 11:29:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Sep 2017 11:29:17 -0700
Message-Id: <20170908182918.39345-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-networking][PATCH 1/2] yp-tools: Upgrade to 4.2.2
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
X-List-Received-Date: Fri, 08 Sep 2017 18:29:26 -0000

Fix build with musl along the way
drop upstreamed patches as well as ones not required anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-lib-yp_all_host.c-Fix-build-with-gcc-7.patch |  33 -------
 ...ding_dup.c-Include-string.h-for-strdup-de.patch |  28 ++++++
 ...mp_bindings.c-Include-string.h-for-memset.patch |  30 ++++++
 .../nis/yp-tools/alignment-cheat.patch             |  52 ----------
 ...rovide-an-in-place-version-of-mapv4v6addr.patch | 110 ---------------------
 .../nis/{yp-tools_3.3.bb => yp-tools_4.2.2.bb}     |  16 ++-
 6 files changed, 65 insertions(+), 204 deletions(-)
 delete mode 100644 meta-networking/recipes-support/nis/yp-tools/0001-lib-yp_all_host.c-Fix-build-with-gcc-7.patch
 create mode 100644 meta-networking/recipes-support/nis/yp-tools/0001-ypbind3_binding_dup.c-Include-string.h-for-strdup-de.patch
 create mode 100644 meta-networking/recipes-support/nis/yp-tools/0002-yp_dump_bindings.c-Include-string.h-for-memset.patch
 delete mode 100644 meta-networking/recipes-support/nis/yp-tools/alignment-cheat.patch
 delete mode 100644 meta-networking/recipes-support/nis/yp-tools/yp-tools-ipv4-ipv6-Provide-an-in-place-version-of-mapv4v6addr.patch
 rename meta-networking/recipes-support/nis/{yp-tools_3.3.bb => yp-tools_4.2.2.bb} (69%)

diff --git a/meta-networking/recipes-support/nis/yp-tools/0001-lib-yp_all_host.c-Fix-build-with-gcc-7.patch b/meta-networking/recipes-support/nis/yp-tools/0001-lib-yp_all_host.c-Fix-build-with-gcc-7.patch
deleted file mode 100644
index d1d5f9ca7..000000000
--- a/meta-networking/recipes-support/nis/yp-tools/0001-lib-yp_all_host.c-Fix-build-with-gcc-7.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 71fdfdfcea2bfa5f522512366bfcdf95f861ecc6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 23 Apr 2017 23:44:37 -0700
-Subject: [PATCH] lib/yp_all_host.c: Fix build with gcc 7
-
-fixes
-
-| ../../../../../../../workspace/sources/yp-tools/lib/yp_all_host.c: In function 'yp_all_host':
-| ../../../../../../../workspace/sources/yp-tools/lib/yp_all_host.c:109:30: error: comparison between pointer and zero character constant [-Werror=pointer-compare]
-|        inmap == NULL || inmap == '\0')
-|                               ^~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/yp_all_host.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/yp_all_host.c b/lib/yp_all_host.c
-index 59cf236..4a07a7e 100644
---- a/lib/yp_all_host.c
-+++ b/lib/yp_all_host.c
-@@ -106,7 +106,7 @@ yp_all_host (const char *indomain, const char *inmap,
- 
-   if (hostname == NULL || hostname[0] == '\0' ||
-       indomain == NULL || indomain[0] == '\0' ||
--      inmap == NULL || inmap == '\0')
-+      inmap == NULL || inmap[0] == '\0')
-     return YPERR_BADARGS;
- 
-   res = YPERR_YPERR;
--- 
-2.12.2
-
diff --git a/meta-networking/recipes-support/nis/yp-tools/0001-ypbind3_binding_dup.c-Include-string.h-for-strdup-de.patch b/meta-networking/recipes-support/nis/yp-tools/0001-ypbind3_binding_dup.c-Include-string.h-for-strdup-de.patch
new file mode 100644
index 000000000..3d4d4f278
--- /dev/null
+++ b/meta-networking/recipes-support/nis/yp-tools/0001-ypbind3_binding_dup.c-Include-string.h-for-strdup-de.patch
@@ -0,0 +1,28 @@
+From 420cb6927553bbca5b49b7681cf208e6df6e4d7c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 8 Sep 2017 08:42:45 -0700
+Subject: [PATCH 1/2] ypbind3_binding_dup.c: Include string.h for strdup
+ declaration
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ lib/ypbind3_binding_dup.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/ypbind3_binding_dup.c b/lib/ypbind3_binding_dup.c
+index ce4aadf..8199c0b 100644
+--- a/lib/ypbind3_binding_dup.c
++++ b/lib/ypbind3_binding_dup.c
+@@ -19,6 +19,7 @@
+ 
+ #if defined(HAVE_YPBIND3)
+ 
++#include <string.h>
+ #include <rpcsvc/yp_prot.h>
+ #include "internal.h"
+ 
+-- 
+2.14.1
+
diff --git a/meta-networking/recipes-support/nis/yp-tools/0002-yp_dump_bindings.c-Include-string.h-for-memset.patch b/meta-networking/recipes-support/nis/yp-tools/0002-yp_dump_bindings.c-Include-string.h-for-memset.patch
new file mode 100644
index 000000000..0562e58af
--- /dev/null
+++ b/meta-networking/recipes-support/nis/yp-tools/0002-yp_dump_bindings.c-Include-string.h-for-memset.patch
@@ -0,0 +1,30 @@
+From 03ccabb6264c008430c4b1739351df5a63829f8e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 8 Sep 2017 08:52:32 -0700
+Subject: [PATCH 2/2] yp_dump_bindings.c: Include string.h for memset
+
+Fixes
+error: implicitly declaring library function 'memset'
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ src/yp_dump_binding.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/yp_dump_binding.c b/src/yp_dump_binding.c
+index a5ab920..d75e2c2 100644
+--- a/src/yp_dump_binding.c
++++ b/src/yp_dump_binding.c
+@@ -26,6 +26,7 @@
+ #include <libintl.h>
+ #include <locale.h>
+ #include <getopt.h>
++#include <string.h>
+ #include <sys/stat.h>
+ #include <arpa/inet.h>
+ #include <rpcsvc/ypclnt.h>
+-- 
+2.14.1
+
diff --git a/meta-networking/recipes-support/nis/yp-tools/alignment-cheat.patch b/meta-networking/recipes-support/nis/yp-tools/alignment-cheat.patch
deleted file mode 100644
index be9b62b8c..000000000
--- a/meta-networking/recipes-support/nis/yp-tools/alignment-cheat.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-yp-tools: avoid fatal cast warning
-
-The way casting is done, we will get a fatal alignment warning on some
-architectures.  This patch cheats our way around this.
-
-We also eliminate an unused constant which causes a fatal warning.
-
-Upstream-status: Inappropriate [code does not exist in version 4.x]
-
-Signed-off-by: Joe Slater <jslater@windriver.com>
-
---- a/lib/do_ypcall.c
-+++ b/lib/do_ypcall.c
-@@ -44,7 +44,6 @@ struct dom_binding
- typedef struct dom_binding dom_binding;
- 
- static const struct timeval RPCTIMEOUT = {25, 0};
--static const struct timeval UDPTIMEOUT = {5, 0};
- static int const MAXTRIES = 2;
- static pthread_mutex_t ypbindlist_lock = PTHREAD_MUTEX_INITIALIZER;
- static dom_binding *ypbindlist = NULL;
-@@ -381,7 +380,7 @@ __ypclnt_call (u_long prog, xdrproc_t xa
- 
- int
- do_ypcall (const char *domain, u_long prog, xdrproc_t xargs,
--	   caddr_t req, xdrproc_t xres, caddr_t resp)
-+	   caddr_t req, xdrproc_t xres, void *resp)
- {
-   dom_binding *ydb;
-   int status;
-@@ -450,7 +449,7 @@ do_ypcall (const char *domain, u_long pr
- /* Like do_ypcall, but translate the status value if necessary.  */
- int
- do_ypcall_tr (const char *domain, u_long prog, xdrproc_t xargs,
--	      caddr_t req, xdrproc_t xres, caddr_t resp)
-+	      caddr_t req, xdrproc_t xres, void *resp)
- {
-   int status = do_ypcall (domain, prog, xargs, req, xres, resp);
-   if (status == YPERR_SUCCESS)
---- a/lib/internal.h
-+++ b/lib/internal.h
-@@ -17,8 +17,8 @@
- #define _INTERNAL_H_
- 
- extern int do_ypcall (const char *domain, u_long prog, xdrproc_t xargs,
--		      caddr_t req, xdrproc_t xres, caddr_t resp);
-+		      caddr_t req, xdrproc_t xres, void *resp);
- extern int do_ypcall_tr (const char *domain, u_long prog, xdrproc_t xargs,
--			 caddr_t req, xdrproc_t xres, caddr_t resp);
-+			 caddr_t req, xdrproc_t xres, void *resp);
- extern int yp_maplist (const char *, struct ypmaplist **);
- #endif
diff --git a/meta-networking/recipes-support/nis/yp-tools/yp-tools-ipv4-ipv6-Provide-an-in-place-version-of-mapv4v6addr.patch b/meta-networking/recipes-support/nis/yp-tools/yp-tools-ipv4-ipv6-Provide-an-in-place-version-of-mapv4v6addr.patch
deleted file mode 100644
index 9ef569f15..000000000
--- a/meta-networking/recipes-support/nis/yp-tools/yp-tools-ipv4-ipv6-Provide-an-in-place-version-of-mapv4v6addr.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From a1ef10d63b0ea34c788d5432e94c72b00ae55e04 Mon Sep 17 00:00:00 2001
-From: Joe MacDonald <joe_macdonald@mentor.com>
-Date: Fri, 27 Feb 2015 12:04:10 -0500
-Subject: [PATCH] ipv4/ipv6: Provide an in-place version of mapv4v6addr.h
-
-mapv4v6addr.h isn't always available, depending on your build, but
-nis-hosts.c only needs it for a single, inline function.  So drop a copy
-here rather than playing games with the include path that would
-potentially lead to cross-compilation issues.
-
-Upstream-status: Inappropriate [embedded specific]
-
-Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
----
- nss_nis6/mapv4v6addr.h | 69 ++++++++++++++++++++++++++++++++++++++++++++++++++
- nss_nis6/nis-hosts.c   |  2 +-
- 2 files changed, 70 insertions(+), 1 deletion(-)
- create mode 100644 nss_nis6/mapv4v6addr.h
-
-diff --git a/nss_nis6/mapv4v6addr.h b/nss_nis6/mapv4v6addr.h
-new file mode 100644
-index 0000000..7f85f7d
---- /dev/null
-+++ b/nss_nis6/mapv4v6addr.h
-@@ -0,0 +1,69 @@
-+/*
-+ * ++Copyright++ 1985, 1988, 1993
-+ * -
-+ * Copyright (c) 1985, 1988, 1993
-+ *    The Regents of the University of California.  All rights reserved.
-+ *
-+ * Redistribution and use in source and binary forms, with or without
-+ * modification, are permitted provided that the following conditions
-+ * are met:
-+ * 1. Redistributions of source code must retain the above copyright
-+ *    notice, this list of conditions and the following disclaimer.
-+ * 2. Redistributions in binary form must reproduce the above copyright
-+ *    notice, this list of conditions and the following disclaimer in the
-+ *    documentation and/or other materials provided with the distribution.
-+ * 4. Neither the name of the University nor the names of its contributors
-+ *    may be used to endorse or promote products derived from this software
-+ *    without specific prior written permission.
-+ *
-+ * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
-+ * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
-+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
-+ * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
-+ * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
-+ * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
-+ * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
-+ * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
-+ * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
-+ * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
-+ * SUCH DAMAGE.
-+ * -
-+ * Portions Copyright (c) 1993 by Digital Equipment Corporation.
-+ *
-+ * Permission to use, copy, modify, and distribute this software for any
-+ * purpose with or without fee is hereby granted, provided that the above
-+ * copyright notice and this permission notice appear in all copies, and that
-+ * the name of Digital Equipment Corporation not be used in advertising or
-+ * publicity pertaining to distribution of the document or software without
-+ * specific, written prior permission.
-+ *
-+ * THE SOFTWARE IS PROVIDED "AS IS" AND DIGITAL EQUIPMENT CORP. DISCLAIMS ALL
-+ * WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES
-+ * OF MERCHANTABILITY AND FITNESS.   IN NO EVENT SHALL DIGITAL EQUIPMENT
-+ * CORPORATION BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
-+ * DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
-+ * PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS
-+ * ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
-+ * SOFTWARE.
-+ * -
-+ * --Copyright--
-+ */
-+
-+#include <string.h>
-+#include <arpa/nameser.h>
-+
-+static void
-+map_v4v6_address (const char *src, char *dst)
-+{
-+  u_char *p = (u_char *) dst;
-+  int i;
-+
-+  /* Move the IPv4 part to the right position.  */
-+  memcpy (dst + 12, src, INADDRSZ);
-+
-+  /* Mark this ipv6 addr as a mapped ipv4. */
-+  for (i = 0; i < 10; i++)
-+    *p++ = 0x00;
-+  *p++ = 0xff;
-+  *p = 0xff;
-+}
-diff --git a/nss_nis6/nis-hosts.c b/nss_nis6/nis-hosts.c
-index af99c74..96d8fa1 100644
---- a/nss_nis6/nis-hosts.c
-+++ b/nss_nis6/nis-hosts.c
-@@ -36,7 +36,7 @@
- #include "nss-nis6.h"
- 
- /* Get implementation for some internal functions. */
--#include <resolv/mapv4v6addr.h>
-+#include "mapv4v6addr.h"
- 
- #define ENTNAME         hostent
- #define DATABASE        "hosts"
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-support/nis/yp-tools_3.3.bb b/meta-networking/recipes-support/nis/yp-tools_4.2.2.bb
similarity index 69%
rename from meta-networking/recipes-support/nis/yp-tools_3.3.bb
rename to meta-networking/recipes-support/nis/yp-tools_4.2.2.bb
index 7bd4630f7..a3f0a7698 100644
--- a/meta-networking/recipes-support/nis/yp-tools_3.3.bb
+++ b/meta-networking/recipes-support/nis/yp-tools_4.2.2.bb
@@ -13,14 +13,13 @@ and ypdomainname. \
 
 SRC_URI = "http://www.linux-nis.org/download/yp-tools/${BP}.tar.bz2 \
            file://domainname.service \
-           file://yp-tools-ipv4-ipv6-Provide-an-in-place-version-of-mapv4v6addr.patch \
-           file://alignment-cheat.patch \
-           file://0001-lib-yp_all_host.c-Fix-build-with-gcc-7.patch \
+           file://0001-ypbind3_binding_dup.c-Include-string.h-for-strdup-de.patch \
+           file://0002-yp_dump_bindings.c-Include-string.h-for-memset.patch \
            "
-SRC_URI[md5sum] = "acebeecc11a73fb8097503670344834c"
-SRC_URI[sha256sum] = "812be817df3d4c25813552be336c6c6ad5aedaf65611b81af3ad9f98fb3c2e50"
+SRC_URI[md5sum] = "fb4a8bffb44ae5d3390351d67f320ef3"
+SRC_URI[sha256sum] = "137f19a986382b275bf4a2b1a69eb26689d6f4ac056ddaa21784d6b80eb98faa"
 
-DEPENDS = "libtirpc"
+DEPENDS = "libtirpc libnsl2"
 
 inherit autotools systemd
 SYSTEMD_SERVICE_${PN} = "domainname.service"
@@ -32,10 +31,9 @@ RCONFLICTS_${PN} += "${PN}-systemd"
 CACHED_CONFIGUREVARS += "ac_cv_prog_STRIP=/bin/true"
 
 EXTRA_OECONF = " \
-                --disable-rpath \
-                --libdir=${libdir}/yp-nis/ \
-                --includedir=${includedir}/yp-nis/ \
+                --disable-rpath --disable-domainname \
                "
+CFLAGS_append_libc-musl = " -Wno-error=\#warnings"
 
 FILES_${PN} += " ${libdir}/yp-nis/*.so.*.* ${libdir}/yp-nis/pkgconfig/"
 FILES_${PN}-dbg += " ${libdir}/yp-nis/.debug"
-- 
2.14.1


