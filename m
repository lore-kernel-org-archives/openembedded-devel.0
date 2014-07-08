Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2F0966ACE5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Jul 2014 07:51:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s687pDvx014943
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 8 Jul 2014 00:51:13 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.137) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 8 Jul 2014 00:51:12 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 8 Jul 2014 15:51:17 +0800
Message-ID: <1404805877-7423-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] tnftp: add tnftp recipes file
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
X-List-Received-Date: Tue, 08 Jul 2014 07:51:14 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../tnftp/tnftp/tnftp-autotools.patch              |   42 ++++++++++++++++++++
 .../recipes-support/tnftp/tnftp_20130505.bb        |   33 +++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 meta-networking/recipes-support/tnftp/tnftp/tnftp-autotools.patch
 create mode 100644 meta-networking/recipes-support/tnftp/tnftp_20130505.bb

diff --git a/meta-networking/recipes-support/tnftp/tnftp/tnftp-autotools.patch b/meta-networking/recipes-support/tnftp/tnftp/tnftp-autotools.patch
new file mode 100644
index 0000000..1bda576
--- /dev/null
+++ b/meta-networking/recipes-support/tnftp/tnftp/tnftp-autotools.patch
@@ -0,0 +1,42 @@
+[PATCH] Update configure.ac and Makefile.am to resolve warnings/errors
+
+Upstream-Status: Pending
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ configure.ac          |    2 ++
+ libnetbsd/Makefile.am |    2 +-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index a96d2ab..b3b3069 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -71,9 +71,11 @@ AH_TEMPLATE([WITH_SSL],
+ #
+ # Checks for programs.
+ #
++AM_PROG_AR()
+ AC_PROG_CC()
+ AC_PROG_AWK()
+ AC_PROG_LIBTOOL()
++AM_PROG_CC_C_O()
+ 
+ #
+ # Checks for tool features.
+diff --git a/libnetbsd/Makefile.am b/libnetbsd/Makefile.am
+index 3e5c3ce..39bb12d 100644
+--- a/libnetbsd/Makefile.am
++++ b/libnetbsd/Makefile.am
+@@ -5,7 +5,7 @@ noinst_LTLIBRARIES = libnetbsd.la
+ libnetbsd_la_SOURCES =
+ 
+ 
+-CPPFLAGS = \
++AM_CPPFLAGS = \
+ 	-I$(srcdir) \
+ 	-I$(top_srcdir) \
+ 	-I$(top_builddir)
+-- 
+1.7.10.4
+
diff --git a/meta-networking/recipes-support/tnftp/tnftp_20130505.bb b/meta-networking/recipes-support/tnftp/tnftp_20130505.bb
new file mode 100644
index 0000000..80690c5
--- /dev/null
+++ b/meta-networking/recipes-support/tnftp/tnftp_20130505.bb
@@ -0,0 +1,33 @@
+SUMMARY = "Enhanced NetBSD ftp client"
+DESCRIPTION = "tnftp (formerly known as lukemftp) is a port of the NetBSD FTP client \
+to other systems. It offers many enhancements over the traditional \
+BSD FTP client, including command-line editing, command-line fetches \
+of FTP and HTTP URLs (including via proxies), command-line uploads of \
+FTP URLs, context-sensitive word completion, dynamic progress bar, \
+IPv6 support, modification time preservation, paging of local and \
+remote files, passive mode support (with fallback to active mode), \
+SOCKS support, TIS FWTK gate-ftp server support, and transfer rate \
+throttling."
+
+SECTION = "console/network"
+LICENSE = "BSD-4-Clause"
+
+DEPENDS = "ncurses"
+
+SRC_URI = "ftp://ftp.netbsd.org/pub/NetBSD/misc/tnftp/${BPN}-${PV}.tar.gz \
+	   file://tnftp-autotools.patch \
+	  "
+
+inherit autotools update-alternatives
+
+ALTERNATIVE_PRIORITY = "100"
+
+ALTERNATIVE_${PN} = "ftp"
+ALTERNATIVE_LINK_NAME_${PN} = "${bindir}/ftp"
+ALTERNATIVE_TARGET_${PN}  = "${bindir}/tnftp"
+
+FILES_${PN} = "${bindir}/tnftp"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6d6796cb166a9bb050958241dad9479e"
+SRC_URI[md5sum] = "66e218d02ec7d9fc39ab70ba2900305a"
+SRC_URI[sha256sum] = "6f650e25f6fd51538f677b789b49379f367ae9f1dee74c94cfe24d92abc2cffb"
-- 
1.7.10.4


