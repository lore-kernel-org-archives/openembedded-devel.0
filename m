Return-Path: <jose.alarcon@ge.com>
Received: from mx0a-00176a03.pphosted.com (mx0b-00176a03.pphosted.com
	[67.231.157.48])
	by mail.openembedded.org (Postfix) with ESMTP id BCC9E6093A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Aug 2017 05:25:01 +0000 (UTC)
Received: from pps.filterd (m0048204.ppops.net [127.0.0.1])
	by m0048204.ppops.net-00176a03. (8.16.0.20/8.16.0.20) with SMTP id
	v735OlSB031862 for <openembedded-devel@lists.openembedded.org>;
	Thu, 3 Aug 2017 01:25:02 -0400
From: Jose Alarcon <jose.alarcon@ge.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Aug 2017 08:24:54 +0300
Message-Id: <20170803052454.105035-1-jose.alarcon@ge.com>
X-Mailer: git-send-email 2.10.1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-08-03_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=15 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 impostorscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx scancount=1 engine=8.0.1-1706020000
	definitions=main-1708030082
Subject: [meta-networking][PATCH] tcpdump: remove unnecessary patch
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
X-List-Received-Date: Thu, 03 Aug 2017 05:25:02 -0000

The removed patch added an unncessary (and incorrect) test for
cross compiling: if there is no libdlpi on the target, the test
will fail (as it should) and not add libdlpi to the list of libraries.

If we would be cross compiling for Solaris (e.g., compiling for SPARC
on Solaris x86 or for x86 on Solaris SPARC), we should check for libdlpi.
---
 .../tcpdump/tcpdump/tcpdump-configure-dlpi.patch   | 31 ----------------------
 .../recipes-support/tcpdump/tcpdump_4.9.0.bb       |  1 -
 2 files changed, 32 deletions(-)
 delete mode 100644 meta-networking/recipes-support/tcpdump/tcpdump/tcpdump-configure-dlpi.patch

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/tcpdump-configure-dlpi.patch b/meta-networking/recipes-support/tcpdump/tcpdump/tcpdump-configure-dlpi.patch
deleted file mode 100644
index 50e2d54..0000000
--- a/meta-networking/recipes-support/tcpdump/tcpdump/tcpdump-configure-dlpi.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-[PATCH] tcpdump: cross-compiling not check dlpi.
-
-For cross-compiling on Linux platforms, we do not need to check libdlpi 
-since it is only placed on Solaris.
-Also, checking libdlpi in native /lib would cause do_qa_configure fail.
-
-Upstream-Status: Pending.
-
-Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
----
- configure.in |    4 +++-
- 1 files changed, 3 insertions(+), 1 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index 7f9591c..ca277c0 100644
---- a/configure.in
-+++ b/configure.in
-@@ -716,7 +716,9 @@ don't.])
- fi
- 
- # libdlpi is needed for Solaris 11 and later.
--AC_CHECK_LIB(dlpi, dlpi_walk, LIBS="$LIBS -ldlpi" LDFLAGS="-L/lib $LDFLAGS", ,-L/lib)
-+if test "$cross_compiling" != yes; then
-+	AC_CHECK_LIB(dlpi, dlpi_walk, LIBS="$LIBS -ldlpi" LDFLAGS="-L/lib $LDFLAGS", ,-L/lib)
-+fi
- 
- dnl portability macros for getaddrinfo/getnameinfo
- dnl
--- 
-1.7.5.4
-
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.0.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.0.bb
index 43e388c..c7123d7 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.0.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.0.bb
@@ -8,7 +8,6 @@ DEPENDS = "libpcap"
 SRC_URI = " \
     http://www.tcpdump.org/release/${BP}.tar.gz \
     file://unnecessary-to-check-libpcap.patch \
-    file://tcpdump-configure-dlpi.patch \
     file://add-ptest.patch \
     file://run-ptest \
 "
-- 
2.10.1


