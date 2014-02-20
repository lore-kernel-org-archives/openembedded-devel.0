Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 2F1D36F160
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2014 09:19:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,511,1389740400"; d="scan'208";a="41474394"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 20 Feb 2014 10:19:00 +0100
Received: from COSNPREXC3.usr.ingenico.loc (10.1.1.182) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	id 14.2.328.9; Thu, 20 Feb 2014 10:19:00 +0100
Received: from u85.usr.ingenico.loc ([10.23.7.85]) by
	COSNPREXC3.usr.ingenico.loc with Microsoft SMTPSVC(6.0.3790.1830);
	Thu, 20 Feb 2014 10:19:00 +0100
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 20 Feb 2014 10:13:49 +0100
Message-ID: <1392887629-27256-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.8.5.4
X-OriginalArrivalTime: 20 Feb 2014 09:19:00.0349 (UTC)
	FILETIME=[CA355AD0:01CF2E1C]
MIME-Version: 1.0
Subject: [meta-oe][PATCH] xmlstarlet: add newrecipe for version 1.5.0
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
X-List-Received-Date: Thu, 20 Feb 2014 09:19:04 -0000
Content-Type: text/plain

Useful CLI tool for XML data manipulation.

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 .../xmlstarlet/files/configure.ac.patch            | 28 ++++++++++++++++++++++
 .../recipes-support/xmlstarlet/xmlstarlet_1.5.0.bb | 25 +++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-support/xmlstarlet/files/configure.ac.patch
 create mode 100644 meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.5.0.bb

diff --git a/meta-oe/recipes-support/xmlstarlet/files/configure.ac.patch b/meta-oe/recipes-support/xmlstarlet/files/configure.ac.patch
new file mode 100644
index 0000000..e55f4f3
--- /dev/null
+++ b/meta-oe/recipes-support/xmlstarlet/files/configure.ac.patch
@@ -0,0 +1,28 @@
+configure.ac: don't use xml-config if --with-libxml-prefix is specified to configure
+
+Same behavior for xslt-config.
+
+diff --git a/configure.ac b/configure.ac
+index ed04e0c..39d5d4c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -40,7 +40,8 @@ AC_ARG_PROGRAM          dnl Transforming Program Names When Installing
+ AC_PROG_SED
+ AC_PROG_AWK
+ 
+-XSTAR_LIB_CHECK([LIBXML], [xml2-config])
++AS_IF([test "x$LIBXML_PREFIX" = x],
++      [XSTAR_LIB_CHECK([LIBXML], [xml2-config])])
+ 
+ AS_IF([test "x$LIBXML_SRCDIR" != x],
+       [LIBXML_INCDIR="$LIBXML_SRCDIR/include"])
+@@ -56,7 +57,8 @@ AS_IF([test "x$STATIC_LIBS" != xno],
+ [LIBXML_LDFLAGS="-L$LIBXML_LIBDIR"]
+ 
+ 
+-XSTAR_LIB_CHECK([LIBXSLT], [xslt-config])
++AS_IF([test "x$LIBXSLT_PREFIX" = x],
++      [XSTAR_LIB_CHECK([LIBXSLT], [xslt-config])])
+ 
+ AS_IF([test "x$LIBXSLT_SRCDIR" != x],
+       [XSLTPROC_PATH="$LIBXSLT_SRCDIR/xsltproc:$PATH"
diff --git a/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.5.0.bb b/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.5.0.bb
new file mode 100644
index 0000000..770ccab
--- /dev/null
+++ b/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.5.0.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Command line XML toolkit"
+DESCRIPTION = "XMLStarlet is a command line XML toolkit which can be used to \
+               transform, query, validate, and edit XML documents and files \
+               using  simple set of shell commands in similar way it is done \
+               for plain text files using grep/sed/awk/tr/diff/patch."
+HOMEPAGE = "http://xmlstar.sourceforge.net/"
+BUGTRACKER = "http://xmlstar.sourceforge.net/bugs/"
+
+SECTION = "console/utils"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c04760d09e8b0fe73283d0cc9e8bea53"
+
+DEPENDS = "libxml2 libxslt"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/xmlstar/${BPN}-${PV}.tar.gz \
+           file://configure.ac.patch"
+SRC_URI[md5sum] = "0c6db295d0cf9ff0d439edb755b7e8f6"
+SRC_URI[sha256sum] = "47b4ed042ea2909257f2a386001af49fceb303f84da7214779ccf99fffc6bbba"
+
+inherit autotools
+
+# doc build: requires (native) xstlproc, fop, pdf2ps
+EXTRA_OECONF="--disable-build-docs \
+  --with-libxml-prefix=${STAGING_LIBDIR}/.. \
+  --with-libxslt-prefix=${STAGING_LIBDIR}/.."
-- 
1.8.5.4


