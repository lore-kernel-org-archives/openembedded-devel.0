Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kg4ysn@gmail.com>) id 1QXZkJ-0002zX-K5
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Jun 2011 16:10:03 +0200
Received: by iwn19 with SMTP id 19so2206653iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2011 07:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=cP211Vlgo877/4DJV3u80OCKtROui4/QOSlupDvLACo=;
	b=BjATzDLm/h+xvzZwyCAqZGg7P8JqfEZ0EGp3cwZd+YJV3GxeaEdeViW/et5rnBia7m
	Vvuzp+28HxxqUSzl6jrzzKOjgN4Rk/zBZerAKkTVGNLOoouPGfa9VRzGgB5t6bz5QYF5
	K6ZGMi1+Yx4xS6b8CfLQD0o7pLRRlbeoraT3U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=PJGRFHSZIZUqDd6DF2hbGrTv75jbVJCYXW/HO0CSO/0K2FkwvBHnneYONgbrb5yBp0
	pNjznOkn7AgZDlyDvBvoBNc0hboZOJ0VwDvgDJBz2Um8PQ57Tzv1xmbhgrhw76+njTOo
	ZpJsgNCS+KSbZY8eiv5HtoHBkIBhlAIfcGMO4=
Received: by 10.42.154.73 with SMTP id p9mr1984192icw.378.1308319593684;
	Fri, 17 Jun 2011 07:06:33 -0700 (PDT)
Received: from localhost.localdomain ([173.8.168.17])
	by mx.google.com with ESMTPS id d8sm2619495icy.9.2011.06.17.07.06.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Jun 2011 07:06:33 -0700 (PDT)
From: Chris Verges <kg4ysn@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jun 2011 07:06:05 -0700
Message-Id: <1308319565-29375-1-git-send-email-kg4ysn@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] libtinyxml: added recipe for v2.6.2
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
X-List-Received-Date: Fri, 17 Jun 2011 14:10:03 -0000

tinyxml is a small C++ library for parsing XML data on embedded
systems.  Currently, no recipe exists in OE for tinyxml, so this
patch attempts to rectify that.

Signed-off-by: Chris Verges <kg4ysn@gmail.com>
---
 recipes/libtinyxml/libtinyxml_2.6.2.bb |   37 ++++++++++++++++++++++++++++++++
 1 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libtinyxml/libtinyxml_2.6.2.bb

diff --git a/recipes/libtinyxml/libtinyxml_2.6.2.bb b/recipes/libtinyxml/libtinyxml_2.6.2.bb
new file mode 100644
index 0000000..6693e5c
--- /dev/null
+++ b/recipes/libtinyxml/libtinyxml_2.6.2.bb
@@ -0,0 +1,37 @@
+DESCRIPTION = "a simple, small, minimal, C++ XML parser"
+HOMEPAGE = "http://www.sourceforge.net/projects/tinyxml"
+LICENSE = "zlib"
+SECTION = "libs"
+
+PR = "r3"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/tinyxml/tinyxml_2_6_2.tar.gz"
+
+S = "${WORKDIR}/tinyxml"
+
+do_compile() {
+	${CXX} ${CXXFLAGS} -I${S} -c -o ${S}/tinyxml.o ${S}/tinyxml.cpp
+	${CXX} ${CXXFLAGS} -I${S} -c -o ${S}/tinyxmlerror.o ${S}/tinyxmlerror.cpp
+	${CXX} ${CXXFLAGS} -I${S} -c -o ${S}/tinyxmlparser.o ${S}/tinyxmlparser.cpp
+	${CXX} ${CXXFLAGS} \
+			-shared \
+			-Wl,-soname,libtinyxml.so.${PV} \
+			-o ${S}/libtinyxml.so.${PV} \
+			${LDFLAGS} \
+			${S}/tinyxml.o \
+			${S}/tinyxmlparser.o \
+			${S}/tinyxmlerror.o
+}
+
+do_install() {
+	install -d ${D}${libdir}
+	install -m 0755 ${S}/libtinyxml.so.${PV} ${D}${libdir}
+	ln -sf libtinyxml.so.${PV} ${D}${libdir}/libtinyxml.so
+
+	install -d ${D}${includedir}
+	install -m 0666 ${S}/tinyxml.h ${D}${includedir}
+}
+
+SRC_URI[md5sum] = "c1b864c96804a10526540c664ade67f0"
+SRC_URI[sha256sum] = "15bdfdcec58a7da30adc87ac2b078e4417dbe5392f3afb719f9ba6d062645593"
+
-- 
1.7.4.1



