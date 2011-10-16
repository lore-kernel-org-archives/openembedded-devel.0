Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pespin.shar@gmail.com>) id 1RFYSA-0005M1-77
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Oct 2011 23:41:06 +0200
Received: by wyg19 with SMTP id 19so484315wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Oct 2011 14:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=D29du/4Trmqvz7vG9AN30LmS5oUXMc67/RcJIK2HBpg=;
	b=O5jqdPx03Y1AWAfc9wZYVs93RbqGV1RpWvJM9YOHTOCpYPHJs1Nnmobbfr5RsefZ4U
	Q06KraBdJNJfy+hmXCoPV5vm0Fz9etI3rbfUPF3+ZQY3q1EUB2pLXcjX9QZEuZaMIYl6
	JmVbHUD6FOa4NI3CRtFFr7z+pcMKY43ktC8TM=
Received: by 10.216.135.99 with SMTP id t77mr2813074wei.100.1318800918368;
	Sun, 16 Oct 2011 14:35:18 -0700 (PDT)
Received: from localhost.localdomain ([90.163.53.2])
	by mx.google.com with ESMTPS id gd18sm3671142wbb.5.2011.10.16.14.35.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Oct 2011 14:35:17 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Oct 2011 23:33:01 +0200
Message-Id: <1318800781-21037-1-git-send-email-pespin.shar@gmail.com>
X-Mailer: git-send-email 1.7.7
Subject: [PATCH][meta-oe] lightmediascanner: Add version 0.4.4 (initial recipe)
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
X-List-Received-Date: Sun, 16 Oct 2011 21:41:06 -0000

* Copied from oe-classic <http://git.openembedded.org/openembedded/commit/?id=63d3969b0f839fc4b7bf7fe836daec729d9d3c53>
* Remove PE=1
* Add LIC_FILES_CHKSUM
* Builds fine using SHR distro

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 .../lightmediascanner/lightmediascanner_0.4.4.bb   |   29 ++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb

diff --git a/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb b/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb
new file mode 100644
index 0000000..cb35fb0
--- /dev/null
+++ b/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "Lightweight media scanner meant to be used in not-so-powerful devices"
+AUTHOR = "ProFUSION"
+HOMEPAGE = "http://lms.garage.maemo.org/"
+SECTION = "libs/multimedia"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
+DEPENDS = "sqlite3 flac virtual/libiconv"
+
+PR = "r0"
+
+SRC_URI = "http://git.profusion.mobi/cgit.cgi/lightmediascanner.git/snapshot/release_${PV}.tar.bz2 \
+"
+SRC_URI[md5sum] = "f423376a70f8f321af69b12563b176fe"
+SRC_URI[sha256sum] = "302a7f6cc355467cd20332f4e02c8b87ba6c0c7a6818a6a987e007aace19b41e"
+
+S = "${WORKDIR}/release_${PV}"
+
+inherit autotools pkgconfig
+
+do_install_append() {
+    install -d ${D}/${bindir}/
+    install -m 755 ${S}/src/bin/.libs/test  ${D}/${bindir}/test-lms
+}
+
+PACKAGES =+ "${PN}-test"
+
+FILES_${PN}-test = "${bindir}/test-lms"
+
+FILES_${PN}-dbg += "${libdir}/${PN}/plugins/.debug"
-- 
1.7.7



