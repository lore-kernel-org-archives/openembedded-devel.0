Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwhU3-0006By-Bv
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Aug 2012 00:33:39 +0200
Received: by wgbdr1 with SMTP id dr1so6562891wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Aug 2012 15:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=NxtB5jJtq3idNrGWs7tpftFfAfq5HX/Zcr4hjkM/XZk=;
	b=0OVpLQBcmFRq6RwW4MyQGjvP4sUiZBwkQABktVeRxXg0KO7UW6BQV/xvx/j1PSaDMD
	xJrCNF1dKd6o9qvELs8SE0sKC9O25mYLmg0UYvTWKSICTRWfy1koVD1UIuH1tj/WbpCa
	DJeVXbx2VFjd7PQGvuklhcB7+pCeTzGqzTD8tMqLBDp619zDdo519swNPyB39KwIyfTh
	/fj47zn0q5EJjfnDnoBudhjsGA0ycupPn88FR7V/rhEWY4icdUVQEiMkp89ttMXkKNT0
	zIjMBUX78ig7Qu4h/Gp5JujJVTbUHHdqg2WQj7IWBslrZamMcJ2Piak1iEYhpx4qpr1n
	xmnQ==
Received: by 10.180.107.2 with SMTP id gy2mr15370907wib.2.1343859720677;
	Wed, 01 Aug 2012 15:22:00 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o2sm12055456wiz.11.2012.08.01.15.21.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 15:21:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Aug 2012 00:21:03 +0200
Message-Id: <afb5591b8bcf46b213884b65ecf7a3ad0511e07b.1343859304.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343859304.git.Martin.Jansa@gmail.com>
References: <cover.1343859304.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343859304.git.Martin.Jansa@gmail.com>
References: <cover.1343859304.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 6/8] python-sip: import from oe-classic and upgrade to latest
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
X-List-Received-Date: Wed, 01 Aug 2012 22:33:39 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/python/python-sip.inc     |   42 ++++++++++++++++++++
 .../recipes-devtools/python/python-sip_4.13.3.bb   |    1 +
 2 files changed, 43 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/python/python-sip.inc
 create mode 100644 meta-oe/recipes-devtools/python/python-sip_4.13.3.bb

diff --git a/meta-oe/recipes-devtools/python/python-sip.inc b/meta-oe/recipes-devtools/python/python-sip.inc
new file mode 100644
index 0000000..19abbba
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-sip.inc
@@ -0,0 +1,42 @@
+DESCRIPTION = "Runtime helper for sip-generated python wrapper libraries"
+SECTION = "devel/python"
+HOMEPAGE = "http://www.riverbankcomputing.co.uk/sip"
+AUTHOR = "Phil Thompson"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://siplib.sbf.in;endline=15;md5=e0e7b5d0c4656666df09826ea1d2071c"
+DEPENDS = "python"
+RDEPENDS_${PN} = "python-core"
+
+SRC_URI = "http://www.riverbankcomputing.com/static/Downloads/sip4/sip-${PV}.tar.gz"
+
+S = "${WORKDIR}/sip-${PV}/siplib"
+
+inherit qt4x11 distutils-base
+
+EXTRA_QMAKEVARS_POST += " TEMPLATE=lib \
+                         CONFIG=console \
+                         DESTDIR= \
+                         VERSION=1.0.0 \
+                         TARGET=sip \
+                         DEFINES=SIP_QT_SUPPORT \
+                         INCLUDEPATH+=. \
+                         INCLUDEPATH+=${STAGING_INCDIR}/${PYTHON_DIR} \
+                         INCLUDEPATH+=${STAGING_INCDIR}"
+
+
+do_configure_prepend() {
+	cat siplib.sbf.in | sed s,target,TARGET, | sed s,sources,SOURCES, | sed s,headers,HEADERS, | sed s,@CFG_MODULE_BASENAME@,sip, > siplib.pro
+	cat siplib.c.in | sed s,@CFG_MODULE_BASENAME@,sip, > siplib.c
+	cat sip.h.in | sed -e s,@CFG_MODULE_NAME@,sip,g > sip.h
+}
+
+do_install() {
+	install -d ${D}${libdir}/${PYTHON_DIR}/site-packages/
+	install -m 0755 libsip.so.1.0.0 ${D}${libdir}/${PYTHON_DIR}/site-packages/sip.so
+	# sipconfig.py sipdistutils.py
+	install -d ${D}${includedir}
+	install -m 0644 ../siplib/sip.h ${D}${includedir}/sip.h
+}
+
+FILES_${PN} = "${libdir}/${PYTHON_DIR}/site-packages/sip.so"
+
diff --git a/meta-oe/recipes-devtools/python/python-sip_4.13.3.bb b/meta-oe/recipes-devtools/python/python-sip_4.13.3.bb
new file mode 100644
index 0000000..b1bda92
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-sip_4.13.3.bb
@@ -0,0 +1 @@
+require python-sip.inc
-- 
1.7.8.6



