Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P13V3-0001kW-MS
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 22:43:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 48F233148E56
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 22:37:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id I+WzR75ZNp6U; Wed, 29 Sep 2010 22:37:23 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 66CC33148E22;
	Wed, 29 Sep 2010 22:37:14 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Wed, 29 Sep 2010 20:37:14 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Sep 2010 20:36:33 +0000
Message-Id: <1285792594-10032-18-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
References: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	URI_NOVOWEL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 17/18] libxmlccwrap-0.0.12: initial recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Sep 2010 20:43:47 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/libxmlccwrap/files/disable_libxslt.patch   |   96 ++++++++++++++++++++
 .../libxmlccwrap/files/dont_build_unneeded.patch   |    6 ++
 .../files/fix_assignment_operator.patch            |   10 ++
 recipes/libxmlccwrap/libxmlccwrap_0.0.12.bb        |   20 ++++
 4 files changed, 132 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libxmlccwrap/files/disable_libxslt.patch
 create mode 100644 recipes/libxmlccwrap/files/dont_build_unneeded.patch
 create mode 100644 recipes/libxmlccwrap/files/fix_assignment_operator.patch
 create mode 100644 recipes/libxmlccwrap/libxmlccwrap_0.0.12.bb

diff --git a/recipes/libxmlccwrap/files/disable_libxslt.patch b/recipes/libxmlccwrap/files/disable_libxslt.patch
new file mode 100644
index 0000000..b178641
--- /dev/null
+++ b/recipes/libxmlccwrap/files/disable_libxslt.patch
@@ -0,0 +1,96 @@
+diff -Naur libxmlccwrap-0.0.12_org/configure.ac libxmlccwrap-0.0.12/configure.ac
+--- libxmlccwrap-0.0.12_org/configure.ac	2005-07-28 21:27:58.000000000 +0200
++++ libxmlccwrap-0.0.12/configure.ac	2007-10-29 15:36:49.000000000 +0100
+@@ -15,7 +15,7 @@
+ AM_PROG_LIBTOOL
+ 
+ AC_CHECK_LIB(xml2,main)
+-AC_CHECK_LIB(xslt,main)
++#AC_CHECK_LIB(xslt,main)
+ 
+ AC_OUTPUT([Makefile \
+           xmlccwrap/Makefile \
+diff -Naur libxmlccwrap-0.0.12_org/xmlccwrap/xmlccwrap.cc libxmlccwrap-0.0.12/xmlccwrap/xmlccwrap.cc
+--- libxmlccwrap-0.0.12_org/xmlccwrap/xmlccwrap.cc	2003-12-18 23:48:08.000000000 +0100
++++ libxmlccwrap-0.0.12/xmlccwrap/xmlccwrap.cc	2007-10-24 22:54:15.000000000 +0200
+@@ -23,8 +23,10 @@
+ #include <libxml/tree.h>
+ #include <libxml/HTMLparser.h>
+ #include <libxml/encoding.h>
++/*
+ #include <libxslt/xsltutils.h>
+ #include <libxslt/transform.h>
++*/
+ #include "xmlccwrap.h"
+ #include "libxmlexport.h"
+ 
+@@ -47,7 +49,7 @@
+   Element *readnode(xmlNodePtr);
+   void writenode(xmlDocPtr, Element *, xmlNodePtr, int = 0);
+ 
+-
++/*
+   XSLTTree::XSLTTree()
+   {
+     xsltP = 0;
+@@ -83,7 +85,7 @@
+   {
+     return xsltP;
+   }
+-
++*/
+ 
+   XMLTree::XMLTree() : _filename(), _root(), _compression(0)
+   { }
+@@ -380,7 +382,7 @@
+     return retval;
+   }
+ 
+-
++/*
+   bool XMLTree::xslt(const XSLTTree & xsltTree, const std::string & outputfile, ParameterMap & parameterMap)
+   {
+     bool ret = false;
+@@ -425,7 +427,7 @@
+     ParameterMap parameterMap;
+     return xslt(xsltTree, outputfile, parameterMap);
+   }
+-
++*/
+ 
+   const std::string & XMLTree::getErrorString()
+   {
+diff -Naur libxmlccwrap-0.0.12_org/xmlccwrap/xmlccwrap.h libxmlccwrap-0.0.12/xmlccwrap/xmlccwrap.h
+--- libxmlccwrap-0.0.12_org/xmlccwrap/xmlccwrap.h	2003-12-18 23:42:37.000000000 +0100
++++ libxmlccwrap-0.0.12/xmlccwrap/xmlccwrap.h	2007-10-24 22:54:15.000000000 +0200
+@@ -43,7 +41,7 @@
+     typedef std::multimap<std::string, std::string> ParameterMap;
+     typedef ParameterMap::value_type ValuePair;
+ 
+-
++/*
+     class XSLTTree
+     {
+       private:
+@@ -60,7 +58,7 @@
+         bool read(const std::string &fn);
+         const void * exportxsltStylesheetPtr() const;
+     };
+-
++*/
+ 
+     class XMLTree
+     {
+@@ -102,10 +100,10 @@
+         bool write(const std::string &fn);
+         const std::string & writeBuffer() const;
+ 
+-
++/*
+         bool xslt(const XSLTTree & xsltTree, const std::string & outputfile, ParameterMap & parameterMap);
+         bool xslt(const XSLTTree & xsltTree, const std::string & outputfile);
+-
++*/
+         const std::string & getErrorString();
+     };
+ 
diff --git a/recipes/libxmlccwrap/files/dont_build_unneeded.patch b/recipes/libxmlccwrap/files/dont_build_unneeded.patch
new file mode 100644
index 0000000..69eaa15
--- /dev/null
+++ b/recipes/libxmlccwrap/files/dont_build_unneeded.patch
@@ -0,0 +1,6 @@
+diff -Naur libxmlccwrap-0.0.12_org/Makefile.am libxmlccwrap-0.0.12/Makefile.am
+--- libxmlccwrap-0.0.12_org/Makefile.am	2002-12-11 23:18:41.000000000 +0100
++++ libxmlccwrap-0.0.12/Makefile.am	2007-10-29 15:35:11.000000000 +0100
+@@ -1 +1 @@
+-SUBDIRS = xmlccwrap html testlib
++SUBDIRS = xmlccwrap
diff --git a/recipes/libxmlccwrap/files/fix_assignment_operator.patch b/recipes/libxmlccwrap/files/fix_assignment_operator.patch
new file mode 100644
index 0000000..1d64590
--- /dev/null
+++ b/recipes/libxmlccwrap/files/fix_assignment_operator.patch
@@ -0,0 +1,10 @@
+--- libxmlccwrap-0.0.12_org/xmlccwrap/xmlccwrap.cc	2003-12-18 23:48:08.000000000 +0100
++++ libxmlccwrap-0.0.12/xmlccwrap/xmlccwrap.cc	2007-10-24 22:54:15.000000000 +0200
+@@ -498,6 +500,7 @@
+     for (ElementIterator curnode = nodes.begin(); curnode != nodes.end(); curnode++)
+       add
+         (**curnode);
++    return *this;
+   }
+ 
+ 
diff --git a/recipes/libxmlccwrap/libxmlccwrap_0.0.12.bb b/recipes/libxmlccwrap/libxmlccwrap_0.0.12.bb
new file mode 100644
index 0000000..1860a85
--- /dev/null
+++ b/recipes/libxmlccwrap/libxmlccwrap_0.0.12.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "A small libxml2 c++ wrapper"
+AUTHOR = "Jürgen Rinas <jrinas@gmx.de>"
+HOMEPAGE = "http://www.ant.uni-bremen.de/whomes/rinas/libxmlccwrap/"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "LGPL"
+DEPENDS = "libxml2"
+
+SRC_URI = "http://www.ant.uni-bremen.de/whomes/rinas/libxmlccwrap/download/${P}.tar.gz \
+	   file://dont_build_unneeded.patch \
+	   file://disable_libxslt.patch \
+	   file://fix_assignment_operator.patch"
+
+SRC_URI[md5sum] = "9f8bbad3452d704603246273b2dda758"
+SRC_URI[sha256sum] = "38fb5f75f8b7dad1c8d535cc7b18ea9f1603e14a8b9256a2f60cf721513dc299"
+
+inherit autotools
+
+FILES_${PN} = "${libdir}/${P}${SOLIBSDEV}"
+FILES_${PN}-dev = "${includedir} ${libdir}/${PN}${SOLIBSDEV} ${libdir}/*.la"
-- 
1.7.1



