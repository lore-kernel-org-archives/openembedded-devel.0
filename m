Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f46.google.com (mail-pg0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 637C56E668
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Feb 2017 05:01:27 +0000 (UTC)
Received: by mail-pg0-f46.google.com with SMTP id v184so24888784pgv.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Feb 2017 21:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=7v1PRTH7BO8Lyo2wBnd0MRTGprSlAdjzOYtYRYfUJ+Q=;
	b=pe0OalcFGmbXTt3PVmR5edoelh45vpQdPtPnKz/3KKgYFN1mWGJusikbMgJ2EzN75c
	AE+CSIxMHXA10Oo+oAebK2PIPw78CWMpNm7MUSB35DPjjW4M9lSjPA83qPy9J0hrivbO
	Qsxi/Q9zWSV1W4D9fcPmFhgjtWgkF5E4yKpcGT1WMWcpTcPgWtoSl7N7eV/YXmDDdTej
	xjM21p0gnVr42WhtQxhdCS+uLq+Qi5/242s4Vy9enW5nMbHoCmP/BXX66BIRywU1nxb9
	idusUiX5y4nuVSujqYXe09cYdQZ+sapmG4VwmwtVEWAzsYFgYspRa75EMnTnlIgBO122
	efpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=7v1PRTH7BO8Lyo2wBnd0MRTGprSlAdjzOYtYRYfUJ+Q=;
	b=RRjkuSz9zf/tkEPppSXpgBLnUxzBcTYgwDBShdOgMrc1q8yh/UYKB8/EWpgGe+fGHg
	15IpV5627i+02gzQaepS9d1rZ4KBovWYYyoZOqnIe7r4cEtNKi2jat9xHd/eGDwLrYH0
	okZMk+Hh/hU7bCzElaprE5xnQed1W7znhJAoLf8+1+mliQmiRuSAIy/Kjr8QrMa1XBzD
	xfowExa+uxGXlXe/1q53Qur6FG0fWlDqcKacrJ1QbpMY3aDVSBxIFiNdVVYoaCHNtKW9
	PKKcQn2j4Vip4fIsqTX60tzIS/k4VEvTzyjrhpm0YtNM+TV5TGIW7VbcpRAnaPBot97G
	T88g==
X-Gm-Message-State: AIkVDXLKh0vOmpuiBSn9d/COb0W7FMASgiDtFYtvQFQhE6twypSurWAVyY6URG4M9n5RzQ==
X-Received: by 10.84.248.10 with SMTP id p10mr14593267pll.87.1486357288117;
	Sun, 05 Feb 2017 21:01:28 -0800 (PST)
Received: from akuster-ThinkPad-X240.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:ac48:9a90:c71a:12ad])
	by smtp.gmail.com with ESMTPSA id
	w123sm84621129pfb.44.2017.02.05.21.01.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 05 Feb 2017 21:01:27 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Feb 2017 21:01:25 -0800
Message-Id: <1486357285-15113-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] iperf: remove depricated package
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
X-List-Received-Date: Mon, 06 Feb 2017 05:01:28 -0000

Now the we have iPerf3, we should drop iPerf. This is the recommendation from the website.
https://sourceforge.net/projects/iperf/

"This is the old, Iperf 2 code base. This version of Iperf is deprecated and we do not recommend it any longer. Please use Iperf3. "

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../iperf-2.0.5/0001-fix-out-of-tree-config.patch  | 52 ----------------------
 .../iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch  | 16 -------
 .../iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch    |  8 ----
 meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb     | 23 ----------
 4 files changed, 99 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch
 delete mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch
 delete mode 100755 meta-oe/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch
 delete mode 100644 meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb

diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch
deleted file mode 100644
index e8a0297..0000000
--- a/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-iperf: fix out of tree configuration
-
-The configure step uses a package header to check for support of types/declares,
-this package header encapsulates all the required system header for providing
-the needed resources. When configured from an out of tree directory the package
-header is not found due to the hard path.
-We now make the path for package header relative to our 'srcdir' so it is
-found appropriately.
-
-Signed-off-by: Awais Belal <awais_belal@mentor.com>
----
-diff --git a/configure.ac b/configure.ac
-index 2b3fd20..d420f9e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -176,8 +176,8 @@ dnl Check for system services
- 
- dnl check for multicast
- if test "$ac_cv_multicast" != no; then
--  AC_CHECK_TYPES(struct ip_mreq,,,[#include "compat/headers_slim.h"])
--  AC_CHECK_DECLS(IP_ADD_MEMBERSHIP,,,[#include "compat/headers_slim.h"])
-+  AC_CHECK_TYPES(struct ip_mreq,,,[#include "${srcdir}/compat/headers_slim.h"])
-+  AC_CHECK_DECLS(IP_ADD_MEMBERSHIP,,,[#include "${srcdir}/compat/headers_slim.h"])
-   AC_MSG_CHECKING(for multicast support)
-   ac_cv_multicast=no
-   if test "$ac_cv_have_decl_IP_ADD_MEMBERSHIP" = yes; then
-@@ -193,9 +193,9 @@ fi
- 
- dnl check for IPv6
- if test "$ac_cv_have_ipv6" != no; then
--  AC_CHECK_TYPES(struct sockaddr_storage,,,[#include "compat/headers_slim.h"])
--  AC_CHECK_TYPES(struct sockaddr_in6,,,[#include "compat/headers_slim.h"])
--  AC_CHECK_DECLS(AF_INET6,,,[#include "compat/headers_slim.h"])
-+  AC_CHECK_TYPES(struct sockaddr_storage,,,[#include "${srcdir}/compat/headers_slim.h"])
-+  AC_CHECK_TYPES(struct sockaddr_in6,,,[#include "${srcdir}/compat/headers_slim.h"])
-+  AC_CHECK_DECLS(AF_INET6,,,[#include "${srcdir}/compat/headers_slim.h"])
-   AC_MSG_CHECKING(for IPv6 headers and structures)
-   ac_cv_have_ipv6=no
-   if test "$ac_cv_type_struct_sockaddr_storage" = yes; then
-@@ -211,9 +211,9 @@ fi
- 
- if test "$ac_cv_have_ipv6" = yes; then
-   if test "$ac_cv_multicast" = yes; then
--    AC_CHECK_TYPES(struct ipv6_mreq,,,[#include "compat/headers_slim.h"])
--    AC_CHECK_DECLS(IPV6_ADD_MEMBERSHIP,,,[#include "compat/headers_slim.h"])
--    AC_CHECK_DECLS(IPV6_MULTICAST_HOPS,,,[#include "compat/headers_slim.h"])
-+    AC_CHECK_TYPES(struct ipv6_mreq,,,[#include "${srcdir}/compat/headers_slim.h"])
-+    AC_CHECK_DECLS(IPV6_ADD_MEMBERSHIP,,,[#include "${srcdir}/compat/headers_slim.h"])
-+    AC_CHECK_DECLS(IPV6_MULTICAST_HOPS,,,[#include "${srcdir}/compat/headers_slim.h"])
-     AC_MSG_CHECKING(for IPv6 multicast support)
-     ac_cv_have_ipv6_multicast=no
-     if test "$ac_cv_type_struct_ipv6_mreq" = yes; then
diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch
deleted file mode 100644
index 348e316..0000000
--- a/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch
+++ /dev/null
@@ -1,16 +0,0 @@
---- iperf-2.0.5/m4/dast.m4.orig	2016-06-15 11:42:03.945581785 -0400
-+++ iperf-2.0.5/m4/dast.m4	2016-06-15 11:42:11.053581641 -0400
-@@ -11,7 +11,12 @@
- 
- AC_DEFUN(DAST_CHECK_BOOL, [
- 
--AC_CHECK_SIZEOF(bool)
-+if test "$ac_cv_header_stdbool_h" = yes; then
-+  AC_CHECK_SIZEOF(bool,,[#include <stdbool.h>])
-+else
-+    AC_CHECK_SIZEOF(bool)
-+fi
-+
- if test "$ac_cv_sizeof_bool" = 0 ; then
-   AC_DEFINE(bool, int)
- fi
diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch
deleted file mode 100755
index 12e8f46..0000000
--- a/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch
+++ /dev/null
@@ -1,8 +0,0 @@
-diff --git iperf-2.0.5/man/Makefile.am iperf-2.0.5/man/Makefile.am
- index ed97bc6..728873f 100644
---- iperf-2.0.5/man/Makefile.am
-+++ iperf-2.0.5/man/Makefile.am
-@@ -1,2 +1 @@
--man_MANS = iperf.1
--dist_man_MANS = $(man_MANS)
-+dist_man_MANS = iperf.1
diff --git a/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb b/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb
deleted file mode 100644
index 9981d82..0000000
--- a/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "Iperf is a tool to measure maximum TCP bandwidth, allowing the tuning of various parameters and UDP characteristics"
-HOMEPAGE = "http://dast.nlanr.net/Projects/Iperf/"
-SECTION = "console/network"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e8478eae9f479e39bc34975193360298"
-
-SRC_URI = " ${SOURCEFORGE_MIRROR}/iperf/${BP}.tar.gz \
-            file://iperf-2.0.5_ManPage.patch \
-            file://0001-fix-out-of-tree-config.patch \
-            file://0002-fix-bool-size-m4.patch \
-          "
-
-SRC_URI[md5sum] = "44b5536b67719f4250faed632a3cd016"
-SRC_URI[sha256sum] = "636b4eff0431cea80667ea85a67ce4c68698760a9837e1e9d13096d20362265b"
-
-S = "${WORKDIR}/${BP}"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF = "--exec-prefix=${STAGING_DIR_HOST}${layout_exec_prefix}"
-
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
-PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.7.4


