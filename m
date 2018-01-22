Return-Path: <prvs=05603e3aa4=adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 4FB02786E7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jan 2018 17:44:38 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w0MHf567017380 for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jan 2018 11:44:39 -0600
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2fm2p1narp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jan 2018 11:44:39 -0600
Received: from us-aus-exch1.ni.corp.natinst.com
	(us-aus-exch1.ni.corp.natinst.com [130.164.68.11])
	by us-aus-skprod2.natinst.com (8.16.0.21/8.16.0.21) with ESMTPS id
	w0MHicva002370
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jan 2018 11:44:38 -0600
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch1.ni.corp.natinst.com (130.164.68.11) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 22 Jan 2018 11:44:38 -0600
Received: from ionel-work.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Mon, 22 Jan 2018 11:44:37 -0600
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 22 Jan 2018 19:45:15 +0200
Message-ID: <20180122174515.5029-3-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.16.0
In-Reply-To: <20180122174515.5029-1-adrian.ratiu@ni.com>
References: <20180122174515.5029-1-adrian.ratiu@ni.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2018-01-22_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=4 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1711220000 definitions=main-1801220248
Subject: [meta-oe][PATCH RESEND 2/2] iperf: rename to iperf2 and bump 2.0.5 -> 2.0.10
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
X-List-Received-Date: Mon, 22 Jan 2018 17:44:38 -0000
Content-Type: text/plain

Both iperf2 and iperf3 are actively maintained projects. iperf2 was
forked from the old iperf codebase because iperf3 is an incompatible
and as of yet incomplete rewrite from scratch.

Rename the old iperf to ipref2 to avoid ambiguity. Drop all 3 patches
we were carrying because they got merged upstream.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 .../iperf-2.0.5/0001-fix-out-of-tree-config.patch  | 52 ----------------------
 .../iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch  | 16 -------
 .../iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch    |  8 ----
 meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb     | 23 ----------
 meta-oe/recipes-benchmark/iperf2/iperf2_2.0.10.bb  | 19 ++++++++
 5 files changed, 19 insertions(+), 99 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch
 delete mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch
 delete mode 100755 meta-oe/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch
 delete mode 100644 meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb
 create mode 100644 meta-oe/recipes-benchmark/iperf2/iperf2_2.0.10.bb

diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch
deleted file mode 100644
index e8a029790..000000000
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
index 348e316ce..000000000
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
index 12e8f4631..000000000
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
index 9981d8275..000000000
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
diff --git a/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.10.bb b/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.10.bb
new file mode 100644
index 000000000..1322d0788
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.10.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Iperf is a tool to measure maximum TCP bandwidth, allowing the tuning of various parameters and UDP characteristics"
+HOMEPAGE = "https://sourceforge.net/projects/iperf2/"
+SECTION = "console/network"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e136a7b2560d80bcbf0d9b3e1356ecff"
+
+SRC_URI = " ${SOURCEFORGE_MIRROR}/iperf2/iperf-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "097cf0754bc1afa165975c06a91e6906"
+SRC_URI[sha256sum] = "7fe4348dcca313b74e0aa9c34a8ccd713b84a5615b8578f4aa94cedce9891ef2"
+
+S = "${WORKDIR}/iperf-${PV}"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "--exec-prefix=${STAGING_DIR_HOST}${layout_exec_prefix}"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.16.0


