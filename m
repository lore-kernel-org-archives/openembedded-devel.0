Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id E7F2072D23
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 22:54:04 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id fl12so204633pdb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 14:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=uMDhdukrMaTJF6PDPOHs9uOaORSHsdZatomTrA4+Yjc=;
	b=mFPGVdqkWcNjAwrcIGAXhHIpaxr147ous/ph/9KmIi/LrLLxgPOVsvn52aLt3MYtxN
	JL5YLgO5PDM2Ufr2hp+gl6RiBTamKOqgIrWheKzgmq9S/BjqcHInGUN9a+y6swkKDPlP
	W9SOuYhAUVc8w8BmDCzA58r8CRmBr1fWPKLV52pP/b/xF8rWBNWjydJ2dirD3fwpgI9G
	54dtXINwrleQJGVds4g9FQbM44kTIRerKKFwm8ab28RUChpIWrzvICneA0YY5XHxHRDI
	MYOTW80BqgZD8ipD+fcxCqs7R7/E6cyKCzetwAYixAXOaMpe786ITMldp3UEPQ2KSily
	yAQg==
X-Received: by 10.70.22.227 with SMTP id h3mr15146103pdf.160.1422053645290;
	Fri, 23 Jan 2015 14:54:05 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id gz6sm2932760pbc.38.2015.01.23.14.54.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Jan 2015 14:54:04 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Fri, 23 Jan 2015 14:53:41 -0800
Message-Id: <f3765d513c8971761e10bb0f249f8745b9aa3504.1422053452.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1422053452.git.akuster808@gmail.com>
References: <cover.1422053452.git.akuster808@gmail.com>
In-Reply-To: <cover.1422053452.git.akuster808@gmail.com>
References: <cover.1422053452.git.akuster808@gmail.com>
Subject: [PATCH 01/11] iperf: fix out of tree configuration
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
X-List-Received-Date: Fri, 23 Jan 2015 22:54:10 -0000

From: "Belal, Awais" <Awais_Belal@mentor.com>

The configure step uses a package header to check for support
of types/declares, this package header encapsulates all the
required system headers for providing the needed resources.
When configured from an out of tree directory the package
header is not found due to the hard path.
We now make the path for package header relative to 'srcdir' so
it is found appropriately.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../iperf-2.0.5/0001-fix-out-of-tree-config.patch  | 52 ++++++++++++++++++++++
 meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb     |  1 +
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
1.9.1


