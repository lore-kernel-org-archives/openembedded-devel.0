Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OslVv-0000Un-DZ
	for Openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 01:54:16 +0200
Received: from compute3.internal (compute3.nyi.mail.srv.osa [10.202.2.43])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 6FE6794;
	Mon,  6 Sep 2010 19:53:37 -0400 (EDT)
Received: from frontend2.messagingengine.com ([10.202.2.161])
	by compute3.internal (MEProxy); Mon, 06 Sep 2010 19:53:37 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	s=smtpout; bh=z3Ljm8nym0xDgaJJQT6BHiZLYZs=;
	b=pHdVWJpuwRZgfWO1jbRVyeDFn4XidCDKtXKVrZSDnYonAbP6NKUyhnoUZ9BqU+ALiOPoZYoPJ4F6z56Kr76y40CrlWUFo1KTSgqp1lDzgSrcwHGtjK9Lz1cURvW4ce5sMs16/7CtuEVlgNPDMlZ9C0NndcTYGEtCkKBYhTRjUT8=
X-Sasl-enc: q2qM7bMgU6eIQ21jsJCiQgPMSc7mrCWtZLy1S9YgJMBg 1283817212
Received: from asterix.crazy-teaparty.dyndns.org
	(hnvr-4d07a3d2.pool.mediaWays.net [77.7.163.210])
	by mail.messagingengine.com (Postfix) with ESMTPA id 9B6215E7362;
	Mon,  6 Sep 2010 19:53:24 -0400 (EDT)
From: Vitus Jensen <vjensen@gmx.de>
To: Openembedded-devel@lists.openembedded.org
Date: Tue,  7 Sep 2010 01:54:02 +0200
Message-Id: <1283817243-7436-3-git-send-email-vjensen@gmx.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1283817243-7436-1-git-send-email-vjensen@gmx.de>
References: <1283817243-7436-1-git-send-email-vjensen@gmx.de>
X-SA-Exim-Connect-IP: 66.111.4.25
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Vitus Jensen <vjensen@gmx.de>
Subject: [PATCH 2/3] htmldoc_1.9.x: merge native and non-native recipes
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
X-List-Received-Date: Mon, 06 Sep 2010 23:54:16 -0000

* switch to SVN fetch as the 1.9.x versions are work in progress,
  released by svn revisions not version numbers.  Snapshot archives
  aren't always provided.
* add DEFAULT_PREFERENCE="-1", it's not the official release

Signed-off-by: Vitus Jensen <vjensen@gmx.de>
---
 recipes/htmldoc/htmldoc-native_1.9.x-r1571.bb |   37 ------------------------
 recipes/htmldoc/htmldoc_1.9.x-r1571.bb        |   25 ----------------
 recipes/htmldoc/htmldoc_1.9.x.bb              |   38 +++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 62 deletions(-)
 delete mode 100644 recipes/htmldoc/htmldoc-native_1.9.x-r1571.bb
 delete mode 100644 recipes/htmldoc/htmldoc_1.9.x-r1571.bb
 create mode 100644 recipes/htmldoc/htmldoc_1.9.x.bb

diff --git a/recipes/htmldoc/htmldoc-native_1.9.x-r1571.bb b/recipes/htmldoc/htmldoc-native_1.9.x-r1571.bb
deleted file mode 100644
index 60d9360..0000000
--- a/recipes/htmldoc/htmldoc-native_1.9.x-r1571.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-require htmldoc.inc
-PR = "r2"
-
-
-SRC_URI = "http://ftp.rz.tu-bs.de/pub/mirror/ftp.easysw.com/ftp/pub/htmldoc/snapshots/htmldoc-${PV}.tar.bz2 \
-file://paths_1.9.x.patch"
-
-
-inherit autotools native
-
-EXTRA_AUTORECONF += "--exclude=autoheader"
-EXTRA_OECONF += "--disable-localpng --disable-localjpeg --disable-localzlib \
-		--with-gui=no"
-
-
-do_compile() {
-	cd htmldoc && oe_runmake all ; cd ${S}
-}
-
-
-do_stage () {
-	install -d ${STAGING_DATADIR}/htmldoc/fonts
-	install -m 0644 ${S}/fonts/*.afm ${STAGING_DATADIR}/htmldoc/fonts/
-	install -m 0644 ${S}/fonts/*.pfa ${STAGING_DATADIR}/htmldoc/fonts/
-
-	install -d ${STAGING_DATADIR}/htmldoc/data
-	install -m 0644 ${S}/data/* ${STAGING_DATADIR}/htmldoc/data/
-
-	install -d ${STAGING_DIR_HOST}${layout_mandir}/man1
-	install -m 0644 ${S}/doc/htmldoc.man ${STAGING_DIR_HOST}${layout_mandir}/man1/
-
-	install -d ${STAGING_BINDIR}
-	install -m 0755 ${S}/htmldoc/htmldoc ${STAGING_BINDIR}/
-}
-
-SRC_URI[md5sum] = "eda75ba1abe14ed8e71c6f40438def85"
-SRC_URI[sha256sum] = "b4c78ff6b47521e980533e52cbe46fe86874c75b3d6bc18bcc2500a2ba854c3e"
diff --git a/recipes/htmldoc/htmldoc_1.9.x-r1571.bb b/recipes/htmldoc/htmldoc_1.9.x-r1571.bb
deleted file mode 100644
index aac761e..0000000
--- a/recipes/htmldoc/htmldoc_1.9.x-r1571.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-require htmldoc.inc
-DEPENDS += "htmldoc-native"
-PR = "r2"
-
-
-SRC_URI = "http://ftp.rz.tu-bs.de/pub/mirror/ftp.easysw.com/ftp/pub/htmldoc/snapshots/htmldoc-${PV}.tar.bz2 \
-file://paths_1.9.x.patch"
-
-
-inherit autotools pkgconfig
-
-EXTRA_AUTORECONF += "--exclude=autoheader"
-EXTRA_OECONF += "--disable-localpng --disable-localjpeg --disable-localzlib \
-		--with-gui=no"
-
-FILES_${PN} += "${datadir}/htmldoc/fonts"
-FILES_${PN} += "${datadir}/htmldoc/data"
-
-
-do_install() {
-	oe_runmake 'DESTDIR=${D}' install
-}
-
-SRC_URI[md5sum] = "eda75ba1abe14ed8e71c6f40438def85"
-SRC_URI[sha256sum] = "b4c78ff6b47521e980533e52cbe46fe86874c75b3d6bc18bcc2500a2ba854c3e"
diff --git a/recipes/htmldoc/htmldoc_1.9.x.bb b/recipes/htmldoc/htmldoc_1.9.x.bb
new file mode 100644
index 0000000..78d9b97
--- /dev/null
+++ b/recipes/htmldoc/htmldoc_1.9.x.bb
@@ -0,0 +1,38 @@
+require htmldoc.inc
+DEPENDS_pn-htmldoc += "htmldoc-native"
+
+# latest dev-snapshot: "1629"
+SRCREV = "1571"
+PV = "1.9.x+r${SRCPV}"
+PR = "r0"
+
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "svn://svn.easysw.com/public/htmldoc;module=trunk;proto=http \
+	file://paths_1.9.x.patch \
+	"
+S = "${WORKDIR}/trunk"
+
+inherit autotools pkgconfig
+
+EXTRA_AUTORECONF += "--exclude=autoheader"
+EXTRA_OECONF += "--disable-localpng --disable-localjpeg --disable-localzlib \
+	     "
+
+FILES_${PN} += "${datadir}/htmldoc/fonts"
+FILES_${PN} += "${datadir}/htmldoc/data"
+
+BBCLASSEXTEND = "native"
+
+do_compile_virtclass-native() {
+	(cd htmldoc && oe_runmake all)
+}
+do_install_virtclass-native() {
+	(cd fonts && oe_runmake 'DESTDIR=${D}' install)
+	(cd data && oe_runmake 'DESTDIR=${D}' install)
+	(cd htmldoc && oe_runmake 'DESTDIR=${D}' install)
+}
+
+do_install() {
+	oe_runmake 'DESTDIR=${D}' install
+}
-- 
1.7.1



