Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 8444A601F5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Dec 2014 07:22:10 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1XzKYE-0002ZR-1z from Awais_Belal@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Dec 2014 23:22:10 -0800
Received: from awais-Precision-M4700.mgc.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.181.6; Fri, 12 Dec 2014 07:22:08 +0000
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 12 Dec 2014 12:21:51 +0500
Message-ID: <1418368911-23987-1-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe][PATCH] iperf: fix out of tree configuration
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
X-List-Received-Date: Fri, 12 Dec 2014 07:22:22 -0000
Content-Type: text/plain

The configure step uses a package header to check for support
of types/declares, this package header encapsulates all the
required system headers for providing the needed resources.
When configured from an out of tree directory the package
header is not found due to the hard path.
We now make the path for package header relative to 'srcdir' so
it is found appropriately.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 .../iperf-2.0.5/0001-fix-out-of-tree-config.patch  |   52 ++++++++++++++++++++
 meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb     |    1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch

diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch
new file mode 100644
index 0000000..e8a0297
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
diff --git a/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb b/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb
index 1bd554b..20adc0d 100644
--- a/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb
+++ b/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e8478eae9f479e39bc34975193360298"
 
 SRC_URI = " ${SOURCEFORGE_MIRROR}/iperf/${BP}.tar.gz \
             file://iperf-2.0.5_ManPage.patch \
+            file://0001-fix-out-of-tree-config.patch \
           "
 
 SRC_URI[md5sum] = "44b5536b67719f4250faed632a3cd016"
-- 
1.7.9.5


