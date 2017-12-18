Return-Path: <adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 1291378213
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Dec 2017 14:00:50 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	vBIDuVjc008494 for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Dec 2017 08:00:51 -0600
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2ew1vuvfx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Dec 2017 08:00:51 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com
	(us-aus-exhub1.ni.corp.natinst.com [130.164.68.41])
	by us-aus-skprod3.natinst.com (8.16.0.21/8.16.0.21) with ESMTPS id
	vBIE0mYw009439
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Dec 2017 08:00:48 -0600
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 18 Dec 2017 08:00:48 -0600
Received: from ionel-work.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Mon, 18 Dec 2017 08:00:47 -0600
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 18 Dec 2017 16:01:09 +0200
Message-ID: <20171218140110.1395-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-12-18_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=4 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1711220000 definitions=main-1712180186
Subject: [meta-oe][PATCH 1/2] Revert "iperf: remove depricated package"
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
X-List-Received-Date: Mon, 18 Dec 2017 14:00:51 -0000
Content-Type: text/plain

This reverts commit 2b6cad9522582b0816251b5efbbc4601d037ae0e.

iperf3 is a complete rewrite which does not have full parity with
iperf2 and in some cases it's intentionally backwards incompatble so
moving to iperf3 is not possible for everyone. That's why the project
got forked.

These recipes/packages can live side by side because their projects
are now independent (separate codebases and maintainers).

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 .../iperf-2.0.5/0001-fix-out-of-tree-config.patch  | 52 ++++++++++++++++++++++
 .../iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch  | 16 +++++++
 .../iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch    |  8 ++++
 meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb     | 23 ++++++++++
 4 files changed, 99 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch
 create mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch
 create mode 100755 meta-oe/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch
 create mode 100644 meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb

diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch
new file mode 100644
index 000000000..e8a029790
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch
@@ -0,0 +1,52 @@
+iperf: fix out of tree configuration
+
+The configure step uses a package header to check for support of types/declares,
+this package header encapsulates all the required system header for providing
+the needed resources. When configured from an out of tree directory the package
+header is not found due to the hard path.
+We now make the path for package header relative to our 'srcdir' so it is
+found appropriately.
+
+Signed-off-by: Awais Belal <awais_belal@mentor.com>
+---
+diff --git a/configure.ac b/configure.ac
+index 2b3fd20..d420f9e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -176,8 +176,8 @@ dnl Check for system services
+ 
+ dnl check for multicast
+ if test "$ac_cv_multicast" != no; then
+-  AC_CHECK_TYPES(struct ip_mreq,,,[#include "compat/headers_slim.h"])
+-  AC_CHECK_DECLS(IP_ADD_MEMBERSHIP,,,[#include "compat/headers_slim.h"])
++  AC_CHECK_TYPES(struct ip_mreq,,,[#include "${srcdir}/compat/headers_slim.h"])
++  AC_CHECK_DECLS(IP_ADD_MEMBERSHIP,,,[#include "${srcdir}/compat/headers_slim.h"])
+   AC_MSG_CHECKING(for multicast support)
+   ac_cv_multicast=no
+   if test "$ac_cv_have_decl_IP_ADD_MEMBERSHIP" = yes; then
+@@ -193,9 +193,9 @@ fi
+ 
+ dnl check for IPv6
+ if test "$ac_cv_have_ipv6" != no; then
+-  AC_CHECK_TYPES(struct sockaddr_storage,,,[#include "compat/headers_slim.h"])
+-  AC_CHECK_TYPES(struct sockaddr_in6,,,[#include "compat/headers_slim.h"])
+-  AC_CHECK_DECLS(AF_INET6,,,[#include "compat/headers_slim.h"])
++  AC_CHECK_TYPES(struct sockaddr_storage,,,[#include "${srcdir}/compat/headers_slim.h"])
++  AC_CHECK_TYPES(struct sockaddr_in6,,,[#include "${srcdir}/compat/headers_slim.h"])
++  AC_CHECK_DECLS(AF_INET6,,,[#include "${srcdir}/compat/headers_slim.h"])
+   AC_MSG_CHECKING(for IPv6 headers and structures)
+   ac_cv_have_ipv6=no
+   if test "$ac_cv_type_struct_sockaddr_storage" = yes; then
+@@ -211,9 +211,9 @@ fi
+ 
+ if test "$ac_cv_have_ipv6" = yes; then
+   if test "$ac_cv_multicast" = yes; then
+-    AC_CHECK_TYPES(struct ipv6_mreq,,,[#include "compat/headers_slim.h"])
+-    AC_CHECK_DECLS(IPV6_ADD_MEMBERSHIP,,,[#include "compat/headers_slim.h"])
+-    AC_CHECK_DECLS(IPV6_MULTICAST_HOPS,,,[#include "compat/headers_slim.h"])
++    AC_CHECK_TYPES(struct ipv6_mreq,,,[#include "${srcdir}/compat/headers_slim.h"])
++    AC_CHECK_DECLS(IPV6_ADD_MEMBERSHIP,,,[#include "${srcdir}/compat/headers_slim.h"])
++    AC_CHECK_DECLS(IPV6_MULTICAST_HOPS,,,[#include "${srcdir}/compat/headers_slim.h"])
+     AC_MSG_CHECKING(for IPv6 multicast support)
+     ac_cv_have_ipv6_multicast=no
+     if test "$ac_cv_type_struct_ipv6_mreq" = yes; then
diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch
new file mode 100644
index 000000000..348e316ce
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch
@@ -0,0 +1,16 @@
+--- iperf-2.0.5/m4/dast.m4.orig	2016-06-15 11:42:03.945581785 -0400
++++ iperf-2.0.5/m4/dast.m4	2016-06-15 11:42:11.053581641 -0400
+@@ -11,7 +11,12 @@
+ 
+ AC_DEFUN(DAST_CHECK_BOOL, [
+ 
+-AC_CHECK_SIZEOF(bool)
++if test "$ac_cv_header_stdbool_h" = yes; then
++  AC_CHECK_SIZEOF(bool,,[#include <stdbool.h>])
++else
++    AC_CHECK_SIZEOF(bool)
++fi
++
+ if test "$ac_cv_sizeof_bool" = 0 ; then
+   AC_DEFINE(bool, int)
+ fi
diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch
new file mode 100755
index 000000000..12e8f4631
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch
@@ -0,0 +1,8 @@
+diff --git iperf-2.0.5/man/Makefile.am iperf-2.0.5/man/Makefile.am
+ index ed97bc6..728873f 100644
+--- iperf-2.0.5/man/Makefile.am
++++ iperf-2.0.5/man/Makefile.am
+@@ -1,2 +1 @@
+-man_MANS = iperf.1
+-dist_man_MANS = $(man_MANS)
++dist_man_MANS = iperf.1
diff --git a/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb b/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb
new file mode 100644
index 000000000..9981d8275
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Iperf is a tool to measure maximum TCP bandwidth, allowing the tuning of various parameters and UDP characteristics"
+HOMEPAGE = "http://dast.nlanr.net/Projects/Iperf/"
+SECTION = "console/network"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e8478eae9f479e39bc34975193360298"
+
+SRC_URI = " ${SOURCEFORGE_MIRROR}/iperf/${BP}.tar.gz \
+            file://iperf-2.0.5_ManPage.patch \
+            file://0001-fix-out-of-tree-config.patch \
+            file://0002-fix-bool-size-m4.patch \
+          "
+
+SRC_URI[md5sum] = "44b5536b67719f4250faed632a3cd016"
+SRC_URI[sha256sum] = "636b4eff0431cea80667ea85a67ce4c68698760a9837e1e9d13096d20362265b"
+
+S = "${WORKDIR}/${BP}"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "--exec-prefix=${STAGING_DIR_HOST}${layout_exec_prefix}"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.15.1


