Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P1dd9-0005dl-RG
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 13:18:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 6A7DC3148EF9
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Oct 2010 13:18:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id DNXEJ9ppUNkr; Fri,  1 Oct 2010 13:18:05 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id F00C43148F00;
	Fri,  1 Oct 2010 13:18:03 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Fri, 01 Oct 2010 11:18:03 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Oct 2010 11:17:34 +0000
Message-Id: <1285931854-17148-4-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1285931854-17148-1-git-send-email-obi@opendreambox.org>
References: <1285931854-17148-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 4/4] libcdio-0.82: reduce package size, add dependencies, move recipe
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
X-List-Received-Date: Fri, 01 Oct 2010 11:18:28 -0000

* Move recipe out of xbmc directory.
* Depend on libcddb and ncurses.
* Use the GNU_MIRROR variable.
* Move executables into new package "libcdio-utils".

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/libcdio/libcdio.inc     |   22 ++++++++++++++++++++++
 recipes/libcdio/libcdio_0.82.bb |    4 ++++
 recipes/xbmc/libcdio_0.82.bb    |   19 -------------------
 3 files changed, 26 insertions(+), 19 deletions(-)
 create mode 100644 recipes/libcdio/libcdio.inc
 create mode 100644 recipes/libcdio/libcdio_0.82.bb
 delete mode 100644 recipes/xbmc/libcdio_0.82.bb

diff --git a/recipes/libcdio/libcdio.inc b/recipes/libcdio/libcdio.inc
new file mode 100644
index 0000000..5ab25bd
--- /dev/null
+++ b/recipes/libcdio/libcdio.inc
@@ -0,0 +1,22 @@
+DESCRIPTION = "The GNU Compact Disc Input and Control library (libcdio) contains a library for CD-ROM and CD image access."
+HOMEPAGE = "http://www.gnu.org/software/libcdio/"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "GPLv3+"
+DEPENDS = "libcddb ncurses"
+
+SRC_URI = "${GNU_MIRROR}/${PN}/${P}.tar.gz"
+
+inherit autotools
+
+EXTRA_OECONF = "ac_cv_member_struct_tm_tm_gmtoff=no"
+
+PACKAGES += "${PN}-utils"
+
+FILES_${PN} = "${libdir}/lib${PN}${SOLIB}"
+FILES_${PN}-utils = "${bindir}/*"
+
+python populate_packages_prepend () {
+        glibdir = bb.data.expand('${libdir}', d)
+        do_split_packages(d, glibdir, '^lib(.*)\.so\..*', 'lib%s', 'gstreamer %s library', extra_depends='', allow_links=True)
+}
diff --git a/recipes/libcdio/libcdio_0.82.bb b/recipes/libcdio/libcdio_0.82.bb
new file mode 100644
index 0000000..ec9c8c9
--- /dev/null
+++ b/recipes/libcdio/libcdio_0.82.bb
@@ -0,0 +1,4 @@
+SRC_URI[md5sum] = "1c29b18e01ab2b966162bc727bf3c360"
+SRC_URI[sha256sum] = "1acb3de8e0927906ade7a34c5853173d3068b87b02dfba80d0bf11e47f0b5d39"
+
+require libcdio.inc
diff --git a/recipes/xbmc/libcdio_0.82.bb b/recipes/xbmc/libcdio_0.82.bb
deleted file mode 100644
index 3201f70..0000000
--- a/recipes/xbmc/libcdio_0.82.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "The GNU Compact Disc Input and Control library (libcdio) contains a library for CD-ROM and CD image access."
-LICENSE = "GPLv3+"
-
-SRC_URI = "http://ftp.gnu.org/gnu/libcdio/libcdio-${PV}.tar.gz"
-
-inherit autotools
-
-EXTRA_OECONF = " ac_cv_member_struct_tm_tm_gmtoff=no"
-
-FILES_${PN} = "${bindir}/*"
-
-python populate_packages_prepend () {
-	glibdir = bb.data.expand('${libdir}', d)
-	do_split_packages(d, glibdir, '^lib(.*)\.so\.*', 'lib%s', 'gstreamer %s library', extra_depends='', allow_links=True)
-}
-
-SRC_URI[md5sum] = "1c29b18e01ab2b966162bc727bf3c360"
-SRC_URI[sha256sum] = "1acb3de8e0927906ade7a34c5853173d3068b87b02dfba80d0bf11e47f0b5d39"
-
-- 
1.7.1



