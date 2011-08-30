Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1QyONT-0004fe-1v
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 15:29:19 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1QyOIl-0007Re-4Y from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 06:24:27 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 30 Aug 2011 15:24:26 +0200
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Aug 2011 18:24:53 +0500
Message-Id: <6fd3391284356229f914262016ff77276d88f054.1314710438.git.noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1314710438.git.noor_ahsan@mentor.com>
References: <cover.1314710438.git.noor_ahsan@mentor.com>
In-Reply-To: <noor_ahsan@mentor.com>
References: <noor_ahsan@mentor.com>
X-OriginalArrivalTime: 30 Aug 2011 13:24:26.0419 (UTC)
	FILETIME=[23C99030:01CC6718]
Subject: [meta-oe][PATCH 1/1] debianutils: Add version 2.30 (initial recipe)
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
X-List-Received-Date: Tue, 30 Aug 2011 13:29:19 -0000

From: Noor Ahsan <noor_ahsan@mentor.com>

* Imported from oe.dev commit id 280a17bc1d8132f97cf6a89b8bc08a32380fa357.
* Merged .bb and .inc file

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 .../debianutils/debianutils_2.30.bb                |   49 ++++++++++++++++++++
 1 files changed, 49 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/debianutils/debianutils_2.30.bb

diff --git a/meta-oe/recipes-support/debianutils/debianutils_2.30.bb b/meta-oe/recipes-support/debianutils/debianutils_2.30.bb
new file mode 100644
index 0000000..ff8bdde
--- /dev/null
+++ b/meta-oe/recipes-support/debianutils/debianutils_2.30.bb
@@ -0,0 +1,49 @@
+DESCRIPTION = "Miscellaneous utilities specific to Debian"
+SECTION = "base"
+LICENSE = "GPLv2 & BSD & SMAIL_GPL"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=b948675029f79c64840e78881e91e1d4"
+
+SRC_URI = "${DEBIAN_MIRROR}/main/d/${PN}/${PN}_${PV}.tar.gz"
+SRC_URI[md5sum] = "7fdd5f8395162d8728d4b79e97b9819e"
+SRC_URI[sha256sum] = "d62e98fee5b1a758d83b62eed8d8bdec473677ff782fed89fc4ae3ba3f381401"
+
+inherit autotools
+
+do_configure_prepend() {
+	sed -i -e 's:tempfile.1 which.1:which.1:g' Makefile.am
+}
+
+do_install_append() {
+    for app in ${D}${sbindir}/* ${D}${bindir}/*; do
+        mv $app $app.${PN}
+    done
+    if [ "${base_bindir}" != "${bindir}" ]; then
+        # Debian places some utils into ${base_bindir} as does busybox
+        install -d ${D}${base_bindir}
+        for app in run-parts.${PN} tempfile.${PN}; do
+            mv ${D}${bindir}/$app ${D}${base_bindir}/$app
+        done
+    fi
+}
+
+pkg_prerm_${PN} () {
+for app in add-shell  installkernel  mkboot  remove-shell run-parts  savelog  sensible-browser  sensible-editor  sensible-pager  tempfile  which ; do
+   update-alternatives --remove $app $app.${PN}
+done
+}
+
+pkg_postinst_${PN} () {
+#!/bin/sh
+for app in add-shell  installkernel  mkboot  remove-shell ; do
+    update-alternatives --install ${sbindir}/$app $app $app.${PN} 100
+done
+for app in savelog  sensible-browser  sensible-editor  sensible-pager  which ; do
+    update-alternatives --install ${bindir}/$app $app $app.${PN} 100
+done
+for app in run-parts  tempfile ; do
+    update-alternatives --install ${base_bindir}/$app $app $app.${PN} 100
+done
+}
+
+
+
-- 
1.7.0.4



