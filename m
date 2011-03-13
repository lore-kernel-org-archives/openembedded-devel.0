Received: from 3.27.mail-out.ovh.net ([46.105.56.209] helo=27.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PyqvM-00027R-IB
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Mar 2011 20:25:56 +0100
Received: (qmail 17739 invoked by uid 503); 13 Mar 2011 19:51:08 -0000
Received: from b9.ovh.net (HELO mail625.ha.ovh.net) (213.186.33.59)
	by 27.mail-out.ovh.net with SMTP; 13 Mar 2011 19:51:02 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 13 Mar 2011 20:57:27 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 13 Mar 2011 20:57:27 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Mar 2011 19:58:51 +0100
Message-Id: <1300042739-17381-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-Ovh-Tracer-Id: 1411597008858099017
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH 1/9] apr: add 1.4.2
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
X-List-Received-Date: Sun, 13 Mar 2011 19:25:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/apr/apr_1.4.2.bb |   33 +++++++++++++++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 recipes/apr/apr_1.4.2.bb

diff --git a/recipes/apr/apr_1.4.2.bb b/recipes/apr/apr_1.4.2.bb
new file mode 100644
index 0000000..0595731
--- /dev/null
+++ b/recipes/apr/apr_1.4.2.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "Apache Portable Runtime (APR) library"
+SECTION = "libs"
+LICENSE = "Apache License, Version 2.0"
+
+SRC_URI = "${APACHE_MIRROR}/apr/${P}.tar.bz2 \
+           file://configure_fixes.patch \
+           file://configfix.patch"
+
+inherit autotools lib_package binconfig
+
+OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
+
+do_configure_prepend() {
+	echo "top_builddir=@apr_builddir@" >> ${S}/Makefile.in
+}
+
+FILES_${PN}-dev += "${datadir}/build-1/* ${libdir}/apr.exp"
+
+do_install_append() {
+	install -d ${D}${datadir}/apr
+	cp ${S}/build/apr_rules.mk ${D}${datadir}/apr/
+	sed -i s,apr_builddir=.*,apr_builddir=,g ${D}${datadir}/apr/apr_rules.mk
+	sed -i s,apr_builders=.*,apr_builders=,g ${D}${datadir}/apr/apr_rules.mk
+	sed -i s,LIBTOOL=.*,LIBTOOL=\$\(SHELL\)\ ${HOST_SYS}-libtool,g ${D}${datadir}/apr/apr_rules.mk
+	sed -i s,\$\(apr_builders\),${D}${datadir}/apr/,g ${D}${datadir}/apr/apr_rules.mk
+	cp ${S}/build/mkdir.sh ${D}${datadir}/apr/
+	cp ${S}/build/make_exports.awk ${D}${datadir}/apr/
+	cp ${S}/build/make_var_export.awk ${D}${datadir}/apr/
+	cp ${S}/${HOST_SYS}-libtool ${D}${datadir}/build-1/libtool
+}
+
+SRC_URI[md5sum] = "4b00e8f70c067893d075577962656b35"
+SRC_URI[sha256sum] = "2017ca700694d09d2b0b21dd7c4d195e43a48735aac88526160c6195ee8f5391"
-- 
1.7.0.4



