Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TJPPU-0001WE-19
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Oct 2012 15:54:48 +0200
Received: by yenm2 with SMTP id m2so2132724yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2012 06:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=UmGz6e5zSbjGGes1kdAAISh7JETogumKpMb/NGAsYcU=;
	b=Hys3J15Su5MCLYZnfl3gvhKraLuQSNJhSf/7LgNIMCTQOZFVThp1hY3C9a2EBQ6g34
	PbLUBb7Pff36TnbHMBuNXJXef4KrUGqt/OKiBqN+M4bqCVgkAUBuhHjZ0JltqwPwvAPW
	eti2YSUqdaCne7wKE28DI47PYiuZ8K9oXHFRPdzqsovkAxxpyBZwGzzIOzm+PO5YzmN6
	cDjLjA8PM4NE+J0c841whSTOwNT70eMeeMPTaALSr7kCqZKLmBN5Mr7IbXMR7kPANfCq
	fM9aAbdytyI15ApDPKzoHzzjtjz//73eoj+A2Gd8ywo2Z4ZXqiDFEXWJjd9+StiD0K1I
	2szQ==
Received: by 10.236.9.36 with SMTP id 24mr1831681yhs.63.1349271708142;
	Wed, 03 Oct 2012 06:41:48 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id l16sm3906857anm.6.2012.10.03.06.41.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Oct 2012 06:41:47 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Oct 2012 10:41:33 -0300
Message-Id: <1349271693-6378-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1349271693-6378-1-git-send-email-otavio@ossystems.com.br>
References: <1349271693-6378-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 4/4] libtinyxml: Add recipe for 2.6.2
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
X-List-Received-Date: Wed, 03 Oct 2012 13:54:48 -0000

This imports the recipe for TinyXML from meta-WebOS@e5c99c2cf, does
some minor fixes on the recipe and import the patches included in the
Debian package.

We use PR as r5 to ensure the package is updated when removed from
meta-WebOS layer.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../libtinyxml/libtinyxml/enforce-use-stl.patch    |   20 ++++++
 .../libtinyxml/libtinyxml/entity-encoding.patch    |   62 ++++++++++++++++++++
 .../recipes-support/libtinyxml/libtinyxml_2.6.2.bb |   43 ++++++++++++++
 3 files changed, 125 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/libtinyxml/libtinyxml/enforce-use-stl.patch
 create mode 100644 meta-oe/recipes-support/libtinyxml/libtinyxml/entity-encoding.patch
 create mode 100644 meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb

diff --git a/meta-oe/recipes-support/libtinyxml/libtinyxml/enforce-use-stl.patch b/meta-oe/recipes-support/libtinyxml/libtinyxml/enforce-use-stl.patch
new file mode 100644
index 0000000..88c962b
--- /dev/null
+++ b/meta-oe/recipes-support/libtinyxml/libtinyxml/enforce-use-stl.patch
@@ -0,0 +1,20 @@
+Description: TinyXml is built with TIXML_USE_STL, so we have to
+ enforce it when the library is used.
+Author: Felix Geyer <debfx-pkg@fobos.de>
+
+Upstream-Status: Pending
+
+diff -Nur tinyxml-2.5.3/tinyxml.h tinyxml-2.5.3.patch/tinyxml.h
+--- tinyxml-2.5.3/tinyxml.h	2007-05-07 00:41:23.000000000 +0200
++++ tinyxml-2.5.3.patch/tinyxml.h	2009-07-08 22:32:03.000000000 +0200
+@@ -26,6 +26,10 @@
+ #ifndef TINYXML_INCLUDED
+ #define TINYXML_INCLUDED
+ 
++#ifndef TIXML_USE_STL
++	#define TIXML_USE_STL
++#endif
++
+ #ifdef _MSC_VER
+ #pragma warning( push )
+ #pragma warning( disable : 4530 )
diff --git a/meta-oe/recipes-support/libtinyxml/libtinyxml/entity-encoding.patch b/meta-oe/recipes-support/libtinyxml/libtinyxml/entity-encoding.patch
new file mode 100644
index 0000000..b801506
--- /dev/null
+++ b/meta-oe/recipes-support/libtinyxml/libtinyxml/entity-encoding.patch
@@ -0,0 +1,62 @@
+Description: TinyXML incorrectly encodes text element containing
+ an ampersand followed by either x or #.
+
+Origin: http://sourceforge.net/tracker/index.php?func=detail&aid=3031828&group_id=13559&atid=313559
+
+Upstream-Status: Pending
+
+diff -u -r1.105 tinyxml.cpp
+--- a/tinyxml.cpp
++++ b/tinyxml.cpp
+@@ -57,30 +57,7 @@
+ 	{
+ 		unsigned char c = (unsigned char) str[i];
+ 
+-		if (    c == '&' 
+-		     && i < ( (int)str.length() - 2 )
+-			 && str[i+1] == '#'
+-			 && str[i+2] == 'x' )
+-		{
+-			// Hexadecimal character reference.
+-			// Pass through unchanged.
+-			// &#xA9;	-- copyright symbol, for example.
+-			//
+-			// The -1 is a bug fix from Rob Laveaux. It keeps
+-			// an overflow from happening if there is no ';'.
+-			// There are actually 2 ways to exit this loop -
+-			// while fails (error case) and break (semicolon found).
+-			// However, there is no mechanism (currently) for
+-			// this function to return an error.
+-			while ( i<(int)str.length()-1 )
+-			{
+-				outString->append( str.c_str() + i, 1 );
+-				++i;
+-				if ( str[i] == ';' )
+-					break;
+-			}
+-		}
+-		else if ( c == '&' )
++		if ( c == '&' )
+ 		{
+ 			outString->append( entity[0].str, entity[0].strLength );
+ 			++i;
+diff -u -r1.89 xmltest.cpp
+--- a/xmltest.cpp
++++ b/xmltest.cpp
+@@ -1340,6 +1340,16 @@
+ 		}*/
+ 	}
+ 
++	#ifdef TIXML_USE_STL
++	{
++		TiXmlDocument xml;
++		xml.Parse("<foo>foo&amp;#xa+bar</foo>");
++		std::string str;
++		str << xml;
++		XmlTest( "Entity escaping", "<foo>foo&amp;#xa+bar</foo>", str.c_str() );
++	}
++	#endif
++
+ 	/*  1417717 experiment
+ 	{
+ 		TiXmlDocument xml;
diff --git a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
new file mode 100644
index 0000000..fdadebd
--- /dev/null
+++ b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
@@ -0,0 +1,43 @@
+# (c) Copyright 2012  Hewlett-Packard Development Company, L.P. 
+
+DESCRIPTION = "a simple, small, minimal, C++ XML parser"
+HOMEPAGE = "http://www.sourceforge.net/projects/tinyxml"
+LICENSE = "Zlib"
+LIC_FILES_CHKSUM = "file://readme.txt;md5=f8f366f3370dda889f60faa7db162cf4"
+SECTION = "libs"
+
+PR = "r5"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/tinyxml/tinyxml_${@'${PV}'.replace('.', '_')}.tar.gz \
+           file://enforce-use-stl.patch \
+           file://entity-encoding.patch"
+SRC_URI[md5sum] = "c1b864c96804a10526540c664ade67f0"
+SRC_URI[sha256sum] = "15bdfdcec58a7da30adc87ac2b078e4417dbe5392f3afb719f9ba6d062645593"
+
+S = "${WORKDIR}/tinyxml"
+
+CXXFLAGS += "-fPIC"
+
+do_compile() {
+    ${CXX} ${CXXFLAGS} -I${S} -c -o ${S}/tinyxml.o ${S}/tinyxml.cpp
+    ${CXX} ${CXXFLAGS} -I${S} -c -o ${S}/tinyxmlerror.o ${S}/tinyxmlerror.cpp
+    ${CXX} ${CXXFLAGS} -I${S} -c -o ${S}/tinyxmlparser.o ${S}/tinyxmlparser.cpp
+    ${CXX} ${CXXFLAGS} \
+            -shared \
+            -Wl,-soname,libtinyxml.so.${PV} \
+            -o ${S}/libtinyxml.so.${PV} \
+            ${LDFLAGS} \
+            ${S}/tinyxml.o \
+            ${S}/tinyxmlparser.o \
+            ${S}/tinyxmlerror.o
+}
+
+do_install() {
+    install -d ${D}${libdir}
+    install -m 0755 ${S}/libtinyxml.so.${PV} ${D}${libdir}
+    ln -sf libtinyxml.so.${PV} ${D}${libdir}/libtinyxml.so
+
+    install -d ${D}${includedir}
+    install -m 0644 ${S}/tinyxml.h ${D}${includedir}
+}
+
-- 
1.7.2.5



