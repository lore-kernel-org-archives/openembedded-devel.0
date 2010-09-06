Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OslWA-0000Yx-1m
	for Openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 01:54:30 +0200
Received: from compute3.internal (compute3.nyi.mail.srv.osa [10.202.2.43])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 13F85155;
	Mon,  6 Sep 2010 19:53:52 -0400 (EDT)
Received: from frontend2.messagingengine.com ([10.202.2.161])
	by compute3.internal (MEProxy); Mon, 06 Sep 2010 19:53:52 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	s=smtpout; bh=vjqdz6m6Bk+OwLNUjc15jvjtaxI=;
	b=B1hoS7iniQxWWUZJihOFiHqnBvSoOwJEdJ5DuDEqLxEw+RDu3bqfZao+py8+cBrU8+CPz8xYjJ/7QPQjn/d+5N0ku9aPoYEkZKFGfHf8pgXYramFPWygCWBN4y9A1AfGZI6Jac+b4Q7CzAwqtVLGcpC66pvBWY78Z8xKejqq+UQ=
X-Sasl-enc: 1smC7RZ82fpfCmIRiUWz73KCYFNCsmZvPpXiOrV5Hp0A 1283817226
Received: from asterix.crazy-teaparty.dyndns.org
	(hnvr-4d07a3d2.pool.mediaWays.net [77.7.163.210])
	by mail.messagingengine.com (Postfix) with ESMTPA id 30F425E7365;
	Mon,  6 Sep 2010 19:53:40 -0400 (EDT)
From: Vitus Jensen <vjensen@gmx.de>
To: Openembedded-devel@lists.openembedded.org
Date: Tue,  7 Sep 2010 01:54:03 +0200
Message-Id: <1283817243-7436-4-git-send-email-vjensen@gmx.de>
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
Subject: [PATCH 3/3] htmldoc_1.8.27:: merge native and non-native recipes
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
X-List-Received-Date: Mon, 06 Sep 2010 23:54:30 -0000


Signed-off-by: Vitus Jensen <vjensen@gmx.de>
---
 recipes/htmldoc/htmldoc-native_1.8.27.bb |   37 ------------------------------
 recipes/htmldoc/htmldoc_1.8.27.bb        |   17 +++++++++++--
 2 files changed, 14 insertions(+), 40 deletions(-)
 delete mode 100644 recipes/htmldoc/htmldoc-native_1.8.27.bb

diff --git a/recipes/htmldoc/htmldoc-native_1.8.27.bb b/recipes/htmldoc/htmldoc-native_1.8.27.bb
deleted file mode 100644
index 36a6dee..0000000
--- a/recipes/htmldoc/htmldoc-native_1.8.27.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-require htmldoc.inc
-PR = "r2"
-
-
-SRC_URI = "http://ftp.rz.tu-bs.de/pub/mirror/ftp.easysw.com/ftp/pub/htmldoc/${PV}/htmldoc-${PV}-source.tar.bz2 \
-file://paths_1.8.27.patch"
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
-SRC_URI[md5sum] = "35589e7b8fe9c54e11be87cd5aec4dcc"
-SRC_URI[sha256sum] = "89ffd223734268375dc959c200622dc5f167576c5cad9d7ce4bd7567faeb9613"
diff --git a/recipes/htmldoc/htmldoc_1.8.27.bb b/recipes/htmldoc/htmldoc_1.8.27.bb
index bb5ce8b..84df876 100644
--- a/recipes/htmldoc/htmldoc_1.8.27.bb
+++ b/recipes/htmldoc/htmldoc_1.8.27.bb
@@ -1,10 +1,11 @@
 require htmldoc.inc
-DEPENDS += "htmldoc-native"
-PR = "r2"
+DEPENDS_pn-htmldoc += "htmldoc-native"
+PR = "r3"
 
 
 SRC_URI = "http://ftp.rz.tu-bs.de/pub/mirror/ftp.easysw.com/ftp/pub/htmldoc/${PV}/htmldoc-${PV}-source.tar.bz2 \
-file://paths_1.8.27.patch"
+	file://paths_1.8.27.patch \
+	"
 
 
 inherit autotools pkgconfig
@@ -16,6 +17,16 @@ EXTRA_OECONF += "--disable-localpng --disable-localjpeg --disable-localzlib \
 FILES_${PN} += "${datadir}/htmldoc/fonts"
 FILES_${PN} += "${datadir}/htmldoc/data"
 
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
 
 do_install() {
 	oe_runmake 'DESTDIR=${D}' install
-- 
1.7.1



