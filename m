Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P7Sr4-0004jr-Do
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Oct 2010 15:00:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id A66B23149F7C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Oct 2010 15:00:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id ZqPe+3UdEqQ0; Sun, 17 Oct 2010 15:00:12 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 1169F3149F79;
	Sun, 17 Oct 2010 15:00:11 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Sun, 17 Oct 2010 13:00:11 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Oct 2010 13:00:07 +0000
Message-Id: <1287320407-17965-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1286535392-1111-2-git-send-email-obi@opendreambox.org>
References: <1286535392-1111-2-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] libdvdnav: add recipe for version 4.1.3-7 from debian
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
X-List-Received-Date: Sun, 17 Oct 2010 13:00:51 -0000

* v2: inherit lib_package before binconfig

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 ...-dvdnavmini.pc-link-against-libdvdnavmini.patch |   25 ++++++++++++++++++++
 recipes/libdvdnav/libdvdnav_4.1.3-7.bb             |    5 ++++
 recipes/libdvdnav/libdvdnav_git.inc                |   24 +++++++++++++++++++
 3 files changed, 54 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libdvdnav/files/0001-dvdnavmini.pc-link-against-libdvdnavmini.patch
 create mode 100644 recipes/libdvdnav/libdvdnav_4.1.3-7.bb
 create mode 100644 recipes/libdvdnav/libdvdnav_git.inc

diff --git a/recipes/libdvdnav/files/0001-dvdnavmini.pc-link-against-libdvdnavmini.patch b/recipes/libdvdnav/files/0001-dvdnavmini.pc-link-against-libdvdnavmini.patch
new file mode 100644
index 0000000..84ce442
--- /dev/null
+++ b/recipes/libdvdnav/files/0001-dvdnavmini.pc-link-against-libdvdnavmini.patch
@@ -0,0 +1,25 @@
+upstream: Daniel Baumann <daniel@debian.org>
+status: pending
+
+From 2329cd28d7508f9809f849fa547362aa7df160ba Mon Sep 17 00:00:00 2001
+From: Andreas Oberritter <obi@opendreambox.org>
+Date: Fri, 8 Oct 2010 00:50:54 +0000
+Subject: [PATCH] dvdnavmini.pc: link against libdvdnavmini
+
+---
+ misc/dvdnavmini.pc.in |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/misc/dvdnavmini.pc.in b/misc/dvdnavmini.pc.in
+index 52945b3..773be2f 100644
+--- a/misc/dvdnavmini.pc.in
++++ b/misc/dvdnavmini.pc.in
+@@ -8,4 +8,4 @@ Description: DVD Navigation mini library
+ Version: @VERSION@
+ 
+ Cflags: -I${includedir} @DVDREAD_CFLAGS@ @THREAD_CFLAGS@
+-Libs: -L${libdir} -ldvdnav @THREAD_LIBS@
++Libs: -L${libdir} -ldvdnavmini @THREAD_LIBS@
+-- 
+1.7.1
+
diff --git a/recipes/libdvdnav/libdvdnav_4.1.3-7.bb b/recipes/libdvdnav/libdvdnav_4.1.3-7.bb
new file mode 100644
index 0000000..b1d75ad
--- /dev/null
+++ b/recipes/libdvdnav/libdvdnav_4.1.3-7.bb
@@ -0,0 +1,5 @@
+require libdvdnav_git.inc
+
+SRC_URI += "file://0001-dvdnavmini.pc-link-against-libdvdnavmini.patch"
+
+SRCREV = "850e513d4fea29b40879378b13003cd677e5214b"
diff --git a/recipes/libdvdnav/libdvdnav_git.inc b/recipes/libdvdnav/libdvdnav_git.inc
new file mode 100644
index 0000000..242f765
--- /dev/null
+++ b/recipes/libdvdnav/libdvdnav_git.inc
@@ -0,0 +1,24 @@
+DESCRIPTION = "DVD navigation multimeda library"
+SECTION = "libs/multimedia"
+LICENSE = "GPL"
+DEPENDS = "libdvdread"
+
+SRC_URI = "git://git.debian-maintainers.org/git/daniel/${PN}.git;protocol=git;branch=debian"
+
+S = "${WORKDIR}/git"
+
+inherit autotools lib_package binconfig pkgconfig
+
+do_unpackpost() {
+        QUILT_PATCHES=debian/patches quilt push -a
+}
+
+FILES_${PN} = "${libdir}/${PN}${SOLIB}"
+
+addtask unpackpost after do_unpack before do_patch
+
+python populate_packages_prepend () {
+        description = bb.data.expand('${DESCRIPTION}', d)
+        libdir = bb.data.expand('${libdir}', d)
+        do_split_packages(d, libdir, '^lib(.*)\.so\..*', 'lib%s', description + ' (%s)', extra_depends='', allow_links=True)
+}
-- 
1.7.1



