Return-Path: <joe@deserted.net>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id D38597212A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2015 05:22:44 +0000 (UTC)
Received: by igal13 with SMTP id l13so14461397iga.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Mar 2015 21:22:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id;
	bh=283PGT22sm4PtBn9nvyoPYP2CC4vxEHLBHuBkW4TvmI=;
	b=BD7NIPJQeY456+0hcxCcErrkdU4UN3szxNdUu40SppxcZLExv9EQMv1xbGwx0sW/Ae
	rXoIlp/PewlTNfMmz6zmwXk3bOF7pKm9pA36YagW0TH1dSI3Qzcz7V+j+Q1tZOIRbkot
	+UfqCpTaGphXn5Gdgbsls0A65Yy2Kse0yFfBQ3tn0RGY7wHpNpoaHSK/7jQZjxrVBu+X
	Dys0KmFFYqUD22086hgK7OcyOchNSxTIcUlGe+Rgq3H6FBa1l7AaOBkZKNkTNzwRjXFJ
	KrnjdIfhtumYV0YhUGbejqMpzNzpCH8chIO8LrZ4nOjg98Rhyjachl5bEaCgPhWlGu8u
	fY+A==
X-Gm-Message-State: ALoCoQlmUBIJK+BbF1j9I/6XE9vOAg6PXlCu2bEQl33mcqjm/+y+63nIRpffCdhrKMITe3ltpdXV
X-Received: by 10.50.114.4 with SMTP id jc4mr18663638igb.14.1425273765846;
	Sun, 01 Mar 2015 21:22:45 -0800 (PST)
Received: from mir.deserted.net (24-246-4-250.cable.teksavvy.com.
	[24.246.4.250])
	by mx.google.com with ESMTPSA id b1sm6395347igl.7.2015.03.01.21.22.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Mar 2015 21:22:44 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Mar 2015 00:23:43 -0500
Message-Id: <1425273823-31509-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] nis: integrate latest stable yp-tools and ypbind
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Mar 2015 05:22:48 -0000

Update to the latest stable NIS tools.  The yp-tools libraries and headers
conflict with the RPC headers provided by glibc, so install them to a
different location.  Systems that intend to build using the NIS-provided
versions will need to specify the alternate location, but that is covered
by pkg-config, so it should only be necessary to point pkg-config at the
alternate .pc file.

The older stable versions are suitable for IPv4-only setups, so keep them
around in case those are required for some systems.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 ...rovide-an-in-place-version-of-mapv4v6addr.patch | 110 +++++++++++++++++++++
 .../recipes-support/nis/yp-tools_3.3.bb            |  46 +++++++++
 .../recipes-support/nis/ypbind-mt_2.2.bb           |  51 ++++++++++
 3 files changed, 207 insertions(+)
 create mode 100644 meta-networking/recipes-support/nis/yp-tools/yp-tools-ipv4-ipv6-Provide-an-in-place-version-of-mapv4v6addr.patch
 create mode 100644 meta-networking/recipes-support/nis/yp-tools_3.3.bb
 create mode 100644 meta-networking/recipes-support/nis/ypbind-mt_2.2.bb

diff --git a/meta-networking/recipes-support/nis/yp-tools/yp-tools-ipv4-ipv6-Provide-an-in-place-version-of-mapv4v6addr.patch b/meta-networking/recipes-support/nis/yp-tools/yp-tools-ipv4-ipv6-Provide-an-in-place-version-of-mapv4v6addr.patch
new file mode 100644
index 0000000..9ef569f
--- /dev/null
+++ b/meta-networking/recipes-support/nis/yp-tools/yp-tools-ipv4-ipv6-Provide-an-in-place-version-of-mapv4v6addr.patch
@@ -0,0 +1,110 @@
+From a1ef10d63b0ea34c788d5432e94c72b00ae55e04 Mon Sep 17 00:00:00 2001
+From: Joe MacDonald <joe_macdonald@mentor.com>
+Date: Fri, 27 Feb 2015 12:04:10 -0500
+Subject: [PATCH] ipv4/ipv6: Provide an in-place version of mapv4v6addr.h
+
+mapv4v6addr.h isn't always available, depending on your build, but
+nis-hosts.c only needs it for a single, inline function.  So drop a copy
+here rather than playing games with the include path that would
+potentially lead to cross-compilation issues.
+
+Upstream-status: Inappropriate [embedded specific]
+
+Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
+---
+ nss_nis6/mapv4v6addr.h | 69 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ nss_nis6/nis-hosts.c   |  2 +-
+ 2 files changed, 70 insertions(+), 1 deletion(-)
+ create mode 100644 nss_nis6/mapv4v6addr.h
+
+diff --git a/nss_nis6/mapv4v6addr.h b/nss_nis6/mapv4v6addr.h
+new file mode 100644
+index 0000000..7f85f7d
+--- /dev/null
++++ b/nss_nis6/mapv4v6addr.h
+@@ -0,0 +1,69 @@
++/*
++ * ++Copyright++ 1985, 1988, 1993
++ * -
++ * Copyright (c) 1985, 1988, 1993
++ *    The Regents of the University of California.  All rights reserved.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ * 1. Redistributions of source code must retain the above copyright
++ *    notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *    notice, this list of conditions and the following disclaimer in the
++ *    documentation and/or other materials provided with the distribution.
++ * 4. Neither the name of the University nor the names of its contributors
++ *    may be used to endorse or promote products derived from this software
++ *    without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
++ * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
++ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
++ * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
++ * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
++ * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
++ * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
++ * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
++ * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
++ * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
++ * SUCH DAMAGE.
++ * -
++ * Portions Copyright (c) 1993 by Digital Equipment Corporation.
++ *
++ * Permission to use, copy, modify, and distribute this software for any
++ * purpose with or without fee is hereby granted, provided that the above
++ * copyright notice and this permission notice appear in all copies, and that
++ * the name of Digital Equipment Corporation not be used in advertising or
++ * publicity pertaining to distribution of the document or software without
++ * specific, written prior permission.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS" AND DIGITAL EQUIPMENT CORP. DISCLAIMS ALL
++ * WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES
++ * OF MERCHANTABILITY AND FITNESS.   IN NO EVENT SHALL DIGITAL EQUIPMENT
++ * CORPORATION BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
++ * DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
++ * PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS
++ * ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
++ * SOFTWARE.
++ * -
++ * --Copyright--
++ */
++
++#include <string.h>
++#include <arpa/nameser.h>
++
++static void
++map_v4v6_address (const char *src, char *dst)
++{
++  u_char *p = (u_char *) dst;
++  int i;
++
++  /* Move the IPv4 part to the right position.  */
++  memcpy (dst + 12, src, INADDRSZ);
++
++  /* Mark this ipv6 addr as a mapped ipv4. */
++  for (i = 0; i < 10; i++)
++    *p++ = 0x00;
++  *p++ = 0xff;
++  *p = 0xff;
++}
+diff --git a/nss_nis6/nis-hosts.c b/nss_nis6/nis-hosts.c
+index af99c74..96d8fa1 100644
+--- a/nss_nis6/nis-hosts.c
++++ b/nss_nis6/nis-hosts.c
+@@ -36,7 +36,7 @@
+ #include "nss-nis6.h"
+ 
+ /* Get implementation for some internal functions. */
+-#include <resolv/mapv4v6addr.h>
++#include "mapv4v6addr.h"
+ 
+ #define ENTNAME         hostent
+ #define DATABASE        "hosts"
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-support/nis/yp-tools_3.3.bb b/meta-networking/recipes-support/nis/yp-tools_3.3.bb
new file mode 100644
index 0000000..75ad989
--- /dev/null
+++ b/meta-networking/recipes-support/nis/yp-tools_3.3.bb
@@ -0,0 +1,46 @@
+# This package builds tools to manage NIS
+# The source package is utils/net/NIS/yp-tools
+#
+require nis.inc
+
+SUMMARY = "NIS client programs"
+DESCRIPTION = " \
+Network Information Service tools.  \
+This package contains ypcat, ypmatch, ypset, \
+ypwhich, yppasswd, domainname, nisdomainname \
+and ypdomainname. \
+"
+
+SRC_URI = "http://www.linux-nis.org/download/yp-tools/${BP}.tar.bz2 \
+           file://domainname.service \
+           file://yp-tools-ipv4-ipv6-Provide-an-in-place-version-of-mapv4v6addr.patch \
+"
+SRC_URI[md5sum] = "acebeecc11a73fb8097503670344834c"
+SRC_URI[sha256sum] = "812be817df3d4c25813552be336c6c6ad5aedaf65611b81af3ad9f98fb3c2e50"
+
+DEPENDS = "libtirpc"
+
+inherit autotools systemd
+SYSTEMD_SERVICE_${PN} = "domainname.service"
+
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
+
+CACHED_CONFIGUREVARS += "ac_cv_prog_STRIP=/bin/true"
+
+EXTRA_OECONF = " \
+                --disable-rpath \
+                --libdir=${libdir}/yp-nis/ \
+                --includedir=${includedir}/yp-nis/ \
+               "
+
+FILES_${PN} += " ${libdir}/yp-nis/*.so.*.* ${libdir}/yp-nis/pkgconfig/"
+FILES_${PN}-dbg += " ${libdir}/yp-nis/.debug"
+FILES_${PN}-dev += " ${libdir}/yp-nis/*.so ${libdir}/yp-nis/*.so.[12] ${libdir}/yp-nis/*.la"
+FILES_${PN}-staticdev += " ${libdir}/yp-nis/*.a"
+
+do_install_append() {
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/domainname.service ${D}${systemd_unitdir}/system
+}
diff --git a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb b/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
new file mode 100644
index 0000000..b960757
--- /dev/null
+++ b/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
@@ -0,0 +1,51 @@
+# This package builds the NIS ypbind daemon
+# The source package is utils/net/NIS/ypbind-mt
+#
+require nis.inc
+
+DESCRIPTION = " \
+Multithreaded NIS bind service (ypbind-mt).  \
+ypbind-mt is a complete new implementation of a NIS \
+binding daemon for Linux. It has the following \
+features.  Supports ypbind protocol V1 and V2.  \
+Uses threads for better response.  Supports multiple \
+domain bindings.  Supports /var/yp/binding/* file \
+for Linux libc 4/5 and glibc 2.x.  Supports a list \
+of known secure NIS server (/etc/yp.conf) Binds to \
+the server which answered as first. \
+"
+HOMEPAGE = "http://www.linux-nis.org/nis/ypbind-mt/index.html"
+DEPENDS = "yp-tools"
+PROVIDES += "ypbind"
+
+SRC_URI = "http://www.linux-nis.org/download/ypbind-mt/${BP}.tar.bz2 \
+           file://ypbind-yocto.init \
+           file://ypbind.service \
+"
+SRC_URI[md5sum] = "54e2040d8266ae7d302d081ca310c8a8"
+SRC_URI[sha256sum] = "dc2f7d97c94dcab0acfdcd115cd8b464eb8c427e4bb0fe68404ae7465f517cd3"
+
+inherit systemd update-rc.d
+
+SYSTEMD_SERVICE_${PN} = "ypbind.service"
+INITSCRIPT_NAME = "ypbind"
+INITSCRIPT_PARAMS = "start 44 3 5 . stop 70 0 1 2 6 ."
+
+CACHED_CONFIGUREVARS = "ac_cv_prog_STRIP=/bin/true"
+
+EXTRA_OECONF = "PKG_CONFIG_PATH='${STAGING_LIBDIR}/yp-nis/pkgconfig/'"
+
+do_install_append () {
+    install -d ${D}${sysconfdir}/init.d
+    install -d ${D}${sysconfdir}/rcS.d
+
+    install -m 0755 ${WORKDIR}/ypbind-yocto.init ${D}${sysconfdir}/init.d/ypbind
+
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/ypbind.service ${D}${systemd_unitdir}/system
+}
+
+
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
-- 
1.9.1


