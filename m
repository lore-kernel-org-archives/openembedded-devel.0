Received: from mail-ye0-f174.google.com ([209.85.213.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1URqZT-0000EG-J7
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 23:04:17 +0200
Received: by mail-ye0-f174.google.com with SMTP id l2so809667yen.33
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 13:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=d+ea77I88NKYBj9n28xHA7nWYRTS9K6Xde96Ja9Oz4A=;
	b=nS2S2MsKp+9e3K2bKzG2v02+DAQ/b+FM0Gm2OcQhmnZJr9p+Ys4YII6YvXHte9q/zO
	QVU4Q/+5WItnS9RuvDeSUWqQMfQsoWnSCqg6f1bgY7ciRJ2kMDb6L9uWR8wVqD/3xwr1
	vC3OBoVa70l+oDxqjeriLv1WcEllQMjpUm+lwNL3PHqv5mnkrdlg6C/uVlIWXnyLSdPe
	5gyYfZ0Z1232+3P1wlEjQirKrQQcBYTzsPDrUDc8Q4l46/Qg18rfrDhlfwlZZV5cv/KV
	90RS0XrFKRnSsP/W1D7fBgeDtvu7U4O2oFF62hmZOVoyT9BVUMlqZSc/w9BC4A52Jttw
	GvAQ==
X-Received: by 10.236.31.68 with SMTP id l44mr12460571yha.158.1366058805924;
	Mon, 15 Apr 2013 13:46:45 -0700 (PDT)
Received: from localhost.localdomain ([187.23.144.59])
	by mx.google.com with ESMTPS id z26sm30390325yhg.14.2013.04.15.13.46.15
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 13:46:44 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Apr 2013 17:45:39 -0300
Message-Id: <1366058739-15453-1-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-oe][PATCH v2] gnumeric: add recipe for version 1.12.0
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
X-List-Received-Date: Mon, 15 Apr 2013 21:04:18 -0000

Based on the OE classic recipe as of
bd204492e0ed296bbac2999da29f831cbdf965f9

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 .../recipes-gnome/gnumeric/gnumeric_1.12.0.bb      |   43 ++++++++++++++++++++
 1 files changed, 43 insertions(+), 0 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb

diff --git a/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb b/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
new file mode 100644
index 0000000..4f40594
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
@@ -0,0 +1,43 @@
+LICENSE = "GPLv2 | GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=be0de417af78dd340558810d1ced52e6"
+SECTION = "x11/utils"
+S = "${WORKDIR}/gnumeric-${PV}"
+DEPENDS = "gdk-pixbuf libgsf gtk+3 libxml2 libglade libart-lgpl intltool-native libgnomecanvas libgnomeprint libbonoboui orbit2-native goffice"
+DESCRIPTION = "Gnumeric spreadsheet for GNOME"
+
+GNOME_COMPRESS_TYPE = "xz"
+
+SRC_URI[archive.md5sum] = "3fd87cca95334b5d8ac922989670fe27"
+SRC_URI[archive.sha256sum] = "037b53d909e5d1454b2afda8c4fb1e7838e260343e36d4e36245f4a5d0e04111"
+
+inherit gnome
+
+EXTRA_OECONF=" --without-perl "
+
+PACKAGES_DYNAMIC += "gnumeric-plugin-*"
+PACKAGES += "libspreadsheet libspreadsheet-dev gnumeric-goffice gnumeric-goffice-dbg"
+
+FILES_${PN}-dbg += "${libdir}/gnumeric/${PV}/plugins/*/.debug"
+FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
+FILES_${PN}-staticdev = "${libdir}/libspreadsheet.la"
+FILES_libspreadsheet = "${libdir}/libspreadsheet-${PV}.so"
+FILES_libspreadsheet-dev = "${libdir}/libspreadsheet.so"
+FILES_gnumeric-goffice-dbg += "${libdir}/goffice/*/plugins/gnumeric/.debug"
+FILES_gnumeric-goffice = "${libdir}/goffice/*/plugins/gnumeric/*"
+
+# This hack works around the problem mentioned here:
+# https://mail.gnome.org/archives/gnumeric-list/2010-February/msg00006.html
+do_install_prepend() {
+    sed -i ${S}/doc/C/Makefile -e 's/\tfor file in $(omffile); do/\t-for file in $(omffile); do/'
+}
+
+python populate_packages_prepend () {
+    gnumeric_libdir = bb.data.expand('${libdir}/gnumeric/${PV}/plugins', d)
+
+    do_split_packages(d, gnumeric_libdir, '^(.*)/.*$',
+        output_pattern='gnumeric-plugin-%s',
+        description='Gnumeric plugin %s',
+        extra_depends='',
+        recursive=True,
+        prepend=True)
+}
-- 
1.7.2.5



