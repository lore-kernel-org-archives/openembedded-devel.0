Return-Path: <jose.alarcon@ge.com>
X-Greylist: delayed 3461 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 02 Aug 2017 09:26:50 UTC
Received: from mx0a-00176a03.pphosted.com (mx0b-00176a03.pphosted.com
	[67.231.157.48])
	by mail.openembedded.org (Postfix) with ESMTP id EDEA178207
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Aug 2017 09:26:50 +0000 (UTC)
Received: from pps.filterd (m0048299.ppops.net [127.0.0.1])
	by m0048299.ppops.net-00176a03. (8.16.0.20/8.16.0.20) with SMTP id
	v728SKqe015400 for <openembedded-devel@lists.openembedded.org>;
	Wed, 2 Aug 2017 04:29:11 -0400
From: Jose Alarcon <jose.alarcon@ge.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Aug 2017 11:29:04 +0300
Message-Id: <20170802082904.28659-1-jose.alarcon@ge.com>
X-Mailer: git-send-email 2.11.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-08-02_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=48 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
	lowpriorityscore=0 impostorscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx scancount=1 engine=8.0.1-1706020000
	definitions=main-1708020137
Cc: Xin.Ouyang@windriver.com
Subject: [PATCH] tcpdump: remove unnecessary patch
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
X-List-Received-Date: Wed, 02 Aug 2017 09:26:51 -0000

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
index 50e2d5439..000000000
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
index 43e388ccc..c7123d799 100644
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
2.11.0


