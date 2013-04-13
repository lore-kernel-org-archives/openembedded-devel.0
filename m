Received: from mail-yh0-f50.google.com ([209.85.213.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UR4JZ-0007dU-8u
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 19:32:41 +0200
Received: by mail-yh0-f50.google.com with SMTP id 25so578023yhr.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 10:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=V5rb8CVcjldPRqTVjR9CtBN1hqDtQL/jvToRMerzVq4=;
	b=TWppLzCN1lcl093nMSCV2Tk895kHjTtQoHuVTfjGBX/jAb3sFG73543xmbTUeOVMhr
	ZQl5UARfvvWfGT9lXuIf0at6YOuA/4rYHKlec4Hxm1cIBbKpTWHfiqzDz56HJpvOqblN
	tXnZLdpFoFVEel8mUazasVXYBsUCcJl0FeYNaF7cuFizRMpzLN8/6fICM1DmrnTomHsi
	m5o37BijsmgapxolGULjWOCJ5OPtNIV3VBbwPcrIbCoja/HeA3sZ6Xl2ISqoMr811lew
	FbJayHTdL7wkdoT6zvF3KGJy1VdGzn+Ck82l9rr+jr3+xPest9Jdpux13GHoVNmZkBxd
	Krig==
X-Received: by 10.236.231.71 with SMTP id k67mr9401987yhq.81.1365873310788;
	Sat, 13 Apr 2013 10:15:10 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id x33sm18491838yhn.18.2013.04.13.10.15.08
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 10:15:10 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Sat, 13 Apr 2013 14:15:01 -0300
Message-Id: <1365873301-29552-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1365873301-29552-1-git-send-email-otavio@ossystems.com.br>
References: <1365873301-29552-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-oe PATCH 2/2] gnumeric: add recipe for version 1.12.0
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
X-List-Received-Date: Sat, 13 Apr 2013 17:32:57 -0000
X-List-Received-Date: Sat, 13 Apr 2013 17:32:57 -0000

From: Mario Domenech Goulart <mario@ossystems.com.br>

Based on the OE classic recipe as of
bd204492e0ed296bbac2999da29f831cbdf965f9

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-gnome/gnumeric/gnumeric_1.12.0.bb      | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb

diff --git a/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb b/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
new file mode 100644
index 0000000..cd42e18
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
@@ -0,0 +1,44 @@
+LICENSE = "GPLv2 | GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=be0de417af78dd340558810d1ced52e6"
+SECTION = "x11/utils"
+S = "${WORKDIR}/gnumeric-${PV}"
+DEPENDS = "gdk-pixbuf libgsf gtk+3 libxml2 libglade libart-lgpl intltool-native libgnomecanvas libgnomeprint libbonoboui orbit2-native"
+DESCRIPTION = "Gnumeric spreadsheet for GNOME"
+
+GNOME_COMPRESS_TYPE = "xz"
+BPN="${PN}"
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
1.8.1



