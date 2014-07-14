Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E2BDF6ACBA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 06:12:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6E6CLLb021541
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jul 2014 23:12:21 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Sun, 13 Jul 2014 23:12:20 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 Jul 2014 14:12:19 +0800
Message-ID: <1405318339-20529-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-perl] libxml-libxml-perl: add recipe
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
X-List-Received-Date: Mon, 14 Jul 2014 06:12:20 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

This module is an interface to libxml2, providing XML and HTML parsers \
with DOM, SAX and XMLReader interfaces, a large subset of DOM Layer 3 \
interface and a XML::XPath-like interface to XPath API of libxml2. \
The module is split into several packages which are not described in this \
section; unless stated otherwise, you only need to use XML::LibXML; in \
your programs.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../fix-CATALOG-conditional-compile.patch          |   31 +++++++
 .../using-DOCB-conditional.patch                   |   91 ++++++++++++++++++++
 .../libxml/libxml-libxml-perl_2.0116.bb            |   46 ++++++++++
 3 files changed, 168 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libxml/libxml-libxml-perl/fix-CATALOG-conditional-compile.patch
 create mode 100644 meta-perl/recipes-perl/libxml/libxml-libxml-perl/using-DOCB-conditional.patch
 create mode 100644 meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0116.bb

diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl/fix-CATALOG-conditional-compile.patch b/meta-perl/recipes-perl/libxml/libxml-libxml-perl/fix-CATALOG-conditional-compile.patch
new file mode 100644
index 0000000..1dd9fb3
--- /dev/null
+++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl/fix-CATALOG-conditional-compile.patch
@@ -0,0 +1,31 @@
+[PATCH] Fix a compile error 
+
+Upstream-Status: Pending
+
+Fix a compile error by conditional using 'catal' since catal
+is only defined when LIBXML_CATALOG_ENABLED is enabled.
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ LibXML.xs |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/LibXML.xs b/LibXML.xs
+index 66da04b..45da681 100644
+--- a/LibXML.xs
++++ b/LibXML.xs
+@@ -2777,9 +2777,11 @@ _default_catalog( self, catalog )
+         xmlCatalogPtr catal = INT2PTR(xmlCatalogPtr,SvIV(SvRV(catalog)));
+ #endif
+     INIT:
++#ifdef LIBXML_CATALOG_ENABLED
+         if ( catal == NULL ) {
+             croak( "empty catalog\n" );
+         }
++#endif
+     CODE:
+         warn( "this feature is not implemented" );
+         RETVAL = 0;
+-- 
+1.7.10.4
+
diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl/using-DOCB-conditional.patch b/meta-perl/recipes-perl/libxml/libxml-libxml-perl/using-DOCB-conditional.patch
new file mode 100644
index 0000000..d255ec7
--- /dev/null
+++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl/using-DOCB-conditional.patch
@@ -0,0 +1,91 @@
+[PATCH] Fix a compile error 
+
+Upstream-Status: Pending
+
+by conditional using 'XML_DOCB_DOCUMENT_NODE' since it is only
+defined when LIBXML_DOCB_ENABLED is enabled in xmlversion.h.
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ LibXML.xs        |    9 +-
+ dom.c            |    2 +
+ perl-libxml-mm.c |    4 +
+ 4 files changed, 678 insertions(+), 658 deletions(-)
+
+diff --git a/LibXML.xs b/LibXML.xs
+index b299ba4..66da04b 100644
+--- a/LibXML.xs
++++ b/LibXML.xs
+@@ -5026,7 +5026,9 @@ addChild( self, nNode )
+             XSRETURN_UNDEF;
+         case XML_DOCUMENT_NODE :
+         case XML_HTML_DOCUMENT_NODE :
++#ifdef LIBXML_DOCB_ENABLED
+         case XML_DOCB_DOCUMENT_NODE :
++#endif
+             croak("addChild: HIERARCHY_REQUEST_ERR\n");
+             XSRETURN_UNDEF;
+         case XML_NOTATION_NODE :
+@@ -5286,7 +5288,9 @@ _toStringC14N(self, comments=0, xpath=&PL_sv_undef, exclusive=0, inc_prefix_list
+         if ( nodepath == NULL
+              && self->type != XML_DOCUMENT_NODE
+              && self->type != XML_HTML_DOCUMENT_NODE
++#ifdef LIBXML_DOCB_ENABLED
+              && self->type != XML_DOCB_DOCUMENT_NODE
++#endif
+            ) {
+             if (comments)
+ 	      nodepath = xmlStrdup( (const xmlChar *) "(. | .//node() | .//@* | .//namespace::*)" );
+@@ -5297,7 +5301,10 @@ _toStringC14N(self, comments=0, xpath=&PL_sv_undef, exclusive=0, inc_prefix_list
+         if ( nodepath != NULL ) {
+             if ( self->type == XML_DOCUMENT_NODE
+                  || self->type == XML_HTML_DOCUMENT_NODE
+-                 || self->type == XML_DOCB_DOCUMENT_NODE ) {
++#ifdef LIBXML_DOCB_ENABLED
++                 || self->type == XML_DOCB_DOCUMENT_NODE
++#endif
++	    ) {
+                 refNode = xmlDocGetRootElement( self->doc );
+             }
+ 	    if (SvOK(xpath_context)) {
+diff --git a/dom.c b/dom.c
+index 87eb61d..cbd391b 100644
+--- a/dom.c
++++ b/dom.c
+@@ -654,7 +654,9 @@ domName(xmlNodePtr node) {
+ 
+     case XML_DOCUMENT_NODE :
+     case XML_HTML_DOCUMENT_NODE :
++#ifdef LIBXML_DOCB_ENABLED
+     case XML_DOCB_DOCUMENT_NODE :
++#endif
+         name = (const xmlChar *) "#document";
+         break;
+ 
+diff --git a/perl-libxml-mm.c b/perl-libxml-mm.c
+index d162b06..7ac5436 100644
+--- a/perl-libxml-mm.c
++++ b/perl-libxml-mm.c
+@@ -331,7 +331,9 @@ PmmNewNode(xmlNodePtr node)
+         switch ( node->type ) {
+         case XML_DOCUMENT_NODE:
+         case XML_HTML_DOCUMENT_NODE:
++#ifdef LIBXML_DOCB_ENABLED
+         case XML_DOCB_DOCUMENT_NODE:
++#endif
+             proxy = (ProxyNodePtr)xmlMalloc(sizeof(struct _DocProxyNode));
+             if (proxy != NULL) {
+                 ((DocProxyNodePtr)proxy)->psvi_status = Pmm_NO_PSVI;
+@@ -550,7 +552,9 @@ PmmNodeToSv( xmlNodePtr node, ProxyNodePtr owner )
+         switch ( node->type ) {
+         case XML_DOCUMENT_NODE:
+         case XML_HTML_DOCUMENT_NODE:
++#ifdef LIBXML_DOCB_ENABLED
+         case XML_DOCB_DOCUMENT_NODE:
++#endif
+             if ( ((xmlDocPtr)node)->encoding != NULL ) {
+                 SetPmmENCODING(dfProxy, (int)xmlParseCharEncoding( (const char*)((xmlDocPtr)node)->encoding ));
+             }
+-- 
+1.7.10.4
+
diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0116.bb b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0116.bb
new file mode 100644
index 0000000..f337313
--- /dev/null
+++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0116.bb
@@ -0,0 +1,46 @@
+SUMMARY = "Perl interface to the libxml2 library"
+DESCRIPTION = "This module is an interface to libxml2, providing XML and HTML parsers \ 
+with DOM, SAX and XMLReader interfaces, a large subset of DOM Layer 3 \
+interface and a XML::XPath-like interface to XPath API of libxml2. \
+The module is split into several packages which are not described in this \
+section; unless stated otherwise, you only need to use XML::LibXML; in \
+your programs."
+
+HOMEPAGE = "http://search.cpan.org/dist/XML-LibXML-1.99/"
+SECTION = "libs"
+LICENSE = "Artistic-1.0|GPLv1+"
+DEPENDS += "libxml2 \
+        libxml-sax-perl-native \
+        zlib \
+"
+RDEPENDS_${PN} += "libxml2 \
+        libxml-sax-perl \
+        libxml-sax-base-perl \
+        zlib \
+"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/XML-LibXML-${PV}.tar.gz;name=libxml \
+	file://fix-CATALOG-conditional-compile.patch \
+	file://using-DOCB-conditional.patch \
+"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=75e021e35a906347f46c9ff163653e2a \
+			file://LICENSE;md5=97871bde150daeb5e61ad95137ff2446"
+SRC_URI[libxml.md5sum] = "a53a743bf053a0cb4afb41513fb8a684"
+SRC_URI[libxml.sha256sum] = "b154f2dad3033b30d22ac81b8985b69ad35450b0c552db394cd03bb36845812a"
+
+S = "${WORKDIR}/XML-LibXML-${PV}"
+
+inherit cpan
+
+EXTRA_CPANFLAGS = "INC=-I${STAGING_INCDIR}/libxml2 LIBS=-L${STAGING_LIBDIR}"
+
+BBCLASSEXTEND = "native"
+
+CFLAGS += " -D_GNU_SOURCE "
+BUILD_CFLAGS += " -D_GNU_SOURCE "
+
+do_configure_prepend() {
+	rm -rf ${S}/.pc/*
+}
+
+FILES_${PN}-dbg =+ "${libdir}/perl/vendor_perl/*/auto/XML/LibXML/.debug/"
-- 
1.7.10.4


