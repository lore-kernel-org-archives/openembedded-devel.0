Received: from 3.27.mail-out.ovh.net ([46.105.56.209] helo=27.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Pyqbv-00015V-Sb
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Mar 2011 20:05:52 +0100
Received: (qmail 17741 invoked by uid 503); 13 Mar 2011 19:51:08 -0000
Received: from b9.ovh.net (HELO mail625.ha.ovh.net) (213.186.33.59)
	by 27.mail-out.ovh.net with SMTP; 13 Mar 2011 19:51:02 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 13 Mar 2011 20:57:27 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 13 Mar 2011 20:57:27 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Mar 2011 19:58:52 +0100
Message-Id: <1300042739-17381-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1300042739-17381-1-git-send-email-eric@eukrea.com>
References: <1300042739-17381-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 1411597008858099018
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH 2/9] apr-util: add 1.3.10
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
X-List-Received-Date: Sun, 13 Mar 2011 19:05:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/apr/apr-util_1.3.10.bb |   36 ++++++++++++++++++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 recipes/apr/apr-util_1.3.10.bb

diff --git a/recipes/apr/apr-util_1.3.10.bb b/recipes/apr/apr-util_1.3.10.bb
new file mode 100644
index 0000000..ee32ddd
--- /dev/null
+++ b/recipes/apr/apr-util_1.3.10.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "Apache Portable Runtime (APR) companion library"
+SECTION = "libs"
+DEPENDS = "apr expat gdbm"
+LICENSE = "Apache License, Version 2.0"
+
+PR = "r0"
+
+SRC_URI = "${APACHE_MIRROR}/apr/${P}.tar.gz \
+           file://configfix.patch \
+           file://configure_fixes.patch"
+
+EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \ 
+		--with-dbm=gdbm \
+		--with-gdbm=${STAGING_DIR_HOST}${layout_prefix} \
+		--without-sqlite2 \
+		--without-sqlite3 \
+		--without-pgsql \
+		--with-expat=${STAGING_DIR_HOST}${layout_prefix}"
+
+SRC_URI[md5sum] = "82acd25cf3df8c72eba44eaee8b80c19"
+SRC_URI[sha256sum] = "7c37ac40b2351bfc23000fb6b7b54a67e0872255df315c82eb60c821bcef4b23"
+
+inherit autotools lib_package binconfig
+
+OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
+
+do_configure_prepend() {
+	cp ${STAGING_DATADIR}/apr/apr_rules.mk ${S}/build/rules.mk
+	echo "AC_PROG_LIBTOOL" >> ${S}/configure.in
+}
+
+do_configure_append() {
+	sed -i -e  s:apr_builders=/usr/share/build-1:apr_builders=${STAGING_DATADIR}/build-1:g ${S}/build/rules.mk
+	sed -i /^LIBTOOL/d ${S}/build/rules.mk
+	echo LIBTOOL="${HOST_SYS}-libtool --tag=CC" >> ${S}/build/rules.mk
+}
-- 
1.7.0.4



