Received: from [209.85.128.184] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M6yJe-0005cd-6n
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 04:47:30 +0200
Received: by fk-out-0910.google.com with SMTP id z22so354587fkz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2009 19:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=h9U91ib74iTF1jIOOjdUqjcy2NosHG7HhM3G+gztjAg=;
	b=vxWMtCLCgb9IAa6toYFbZZJdUjjhdVtCrZoa1lwQN5udAYsC4rf/aVHdz0i2rElLML
	bVnHymgrtkwP5gx0XaZxiN5V9uVmRV1RVPMXk3wEBlH0eRfBCZo6pZKj71HRBR4zo9lp
	RumlyhzERR4e6j9/BlyPWtDP4hD8rTFXAqNnY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=wAsVAA8+wFprXfVkPRdeZcnEgzWT8T1GggZ6wtbx73VqWumQvIpcIinLlIoFWl+VxE
	WBgbr0j6G7gIy33E7ZPTtFFSZeubl/0I4L7QoPdVsaRzXB1ul1hECUF5jb3Zn9rnNice
	eHzpqtewgsbdPwNIyd1NjC69rUXbZ6TPmEJyw=
Received: by 10.103.182.3 with SMTP id j3mr1059009mup.135.1242873598922;
	Wed, 20 May 2009 19:39:58 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id e8sm1797188muf.6.2009.05.20.19.39.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 May 2009 19:39:55 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 0FB166103C5; Wed, 20 May 2009 23:39:42 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 May 2009 23:39:36 -0300
Message-Id: <1242873578-17444-22-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.1.54.g99dd
In-Reply-To: <1242873578-17444-21-git-send-email-otavio@ossystems.com.br>
References: <1242873578-17444-1-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-2-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-3-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-4-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-5-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-6-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-7-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-8-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-9-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-10-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-11-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-12-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-13-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-14-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-15-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-16-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-17-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-18-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-19-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-20-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-21-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 21/23] gnumeric: update to 1.8.4
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
X-List-Received-Date: Thu, 21 May 2009 02:47:30 -0000

We updated it to latest stable release and droped the old versions
since noone is preferring those. Another small change is to depends on
gdk-pixbuf-csource-native otherwise the build can fail if the host
doesn't has the development files of GTK+ installed.

The only reference to a gnumeric version has been found at
preferred-om-2008-versions.inc and it referred to a missing
version. This also makes it to point to the latest one.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 conf/checksums.ini                                 |    4 ++
 conf/distro/include/preferred-om-2008-versions.inc |    2 +-
 recipes/gnumeric/gnumeric_1.8.2.bb                 |   31 --------------------
 recipes/gnumeric/gnumeric_1.8.3.bb                 |   31 --------------------
 recipes/gnumeric/gnumeric_1.8.4.bb                 |   31 ++++++++++++++++++++
 5 files changed, 36 insertions(+), 63 deletions(-)
 delete mode 100644 recipes/gnumeric/gnumeric_1.8.2.bb
 delete mode 100644 recipes/gnumeric/gnumeric_1.8.3.bb
 create mode 100644 recipes/gnumeric/gnumeric_1.8.4.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 447957e..39f4f2c 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -8382,6 +8382,10 @@ sha256=8418ed3a2e8dad923a6626d22eaffe796aab9cbcf827a17ab95bf99956e22a6d
 md5=3ce6ba6483ccd6fe9974cface582337a
 sha256=173df749482f7391e50a6eb8339107b2b201582978637c63190c4a79f8e66d07
 
+[http://ftp.gnome.org/pub/GNOME/sources/gnumeric/1.8/gnumeric-1.8.4.tar.bz2]
+md5=338f0084f04a16f78797ad01f85d3251
+sha256=a3c7fdbbafa6c9cfee7f16c067b043c3041cd0240292aa92b653a2221ae04503
+
 [ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-1.4.2.2.tar.bz2]
 md5=c34736eb7cb687f9e5b6d4df48aaf7c8
 sha256=174e7f78c670d76984c4c4bd6077a0b9fec7b4be700b9f3e40c6889b78110c57
diff --git a/conf/distro/include/preferred-om-2008-versions.inc b/conf/distro/include/preferred-om-2008-versions.inc
index 8c5c4f7..65676ec 100644
--- a/conf/distro/include/preferred-om-2008-versions.inc
+++ b/conf/distro/include/preferred-om-2008-versions.inc
@@ -503,7 +503,7 @@ PREFERRED_VERSION_gnome-vfs ?= "2.22.0"
 PREFERRED_VERSION_gnome-vfs-extras ?= "0.99.13"
 PREFERRED_VERSION_gnome-vfs-obexftp ?= "0.4"
 PREFERRED_VERSION_gnuchess ?= "5.05"
-PREFERRED_VERSION_gnumeric ?= "1.6.3"
+PREFERRED_VERSION_gnumeric ?= "1.8.4"
 PREFERRED_VERSION_gnupg ?= "1.4.2.2"
 PREFERRED_VERSION_gnuplot ?= "4.2.2"
 PREFERRED_VERSION_gnuradio ?= "3.0.4"
diff --git a/recipes/gnumeric/gnumeric_1.8.2.bb b/recipes/gnumeric/gnumeric_1.8.2.bb
deleted file mode 100644
index 8d3b1b5..0000000
--- a/recipes/gnumeric/gnumeric_1.8.2.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-LICENSE = "GPL"
-SECTION = "x11/utils"
-S = "${WORKDIR}/gnumeric-${PV}"
-DEPENDS = "libgsf gtk+ libxml2 goffice libglade libart-lgpl intltool-native libgnomecanvas libgnomeprint libgnomeprintui libbonoboui orbit2-native"
-DESCRIPTION = "Gnumeric spreadsheet for GNOME"
-
-PR = "r1"
-
-PARALLEL_MAKE = ""
-
-inherit gnome flow-lossage
-
-SRC_URI += "file://remove-docs.patch;patch=1"
-
-EXTRA_OECONF=" --without-perl "
-
-PACKAGES_DYNAMIC = "gnumeric-plugin-*"
-
-FILES_${PN}-dbg += "${libdir}/gnumeric/1.8.2/plugins/*/.debug"
-FILES_gnumeric_append = " /usr/lib/libspreadsheet-${PV}.so "
-
-# We need native orbit-idl with target idl files. No way to say it in a clean way:
-do_configure_append () {
-	find -name Makefile -exec sed -i '/\/usr\/bin\/orbit-idl-2/{s:/usr/bin:${STAGING_BINDIR_NATIVE}:;s:/usr/share:${STAGING_DATADIR}:g}' {} \;
-}
-
-python populate_packages_prepend () {
-	gnumeric_libdir = bb.data.expand('${libdir}/gnumeric/${PV}/plugins', d)
-
-	do_split_packages(d, gnumeric_libdir, '(.*)', 'gnumeric-plugin-%s', 'Gnumeric plugin for %s', allow_dirs=True)
-}
diff --git a/recipes/gnumeric/gnumeric_1.8.3.bb b/recipes/gnumeric/gnumeric_1.8.3.bb
deleted file mode 100644
index 92cdc4c..0000000
--- a/recipes/gnumeric/gnumeric_1.8.3.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-LICENSE = "GPL"
-SECTION = "x11/utils"
-S = "${WORKDIR}/gnumeric-${PV}"
-DEPENDS = "libgsf gtk+ libxml2 goffice libglade libart-lgpl intltool-native libgnomecanvas libgnomeprint libgnomeprintui libbonoboui orbit2-native"
-DESCRIPTION = "Gnumeric spreadsheet for GNOME"
-
-PR = "r0"
-
-PARALLEL_MAKE = ""
-
-inherit gnome flow-lossage
-
-SRC_URI += "file://remove-docs.patch;patch=1"
-
-EXTRA_OECONF=" --without-perl "
-
-PACKAGES_DYNAMIC += "gnumeric-plugin-*"
-
-FILES_${PN}-dbg += "${libdir}/gnumeric/${PV}/plugins/*/.debug"
-FILES_gnumeric_append = " /usr/lib/libspreadsheet-${PV}.so "
-
-# We need native orbit-idl with target idl files. No way to say it in a clean way:
-do_configure_append () {
-	find -name Makefile -exec sed -i '/\/usr\/bin\/orbit-idl-2/{s:/usr/bin:${STAGING_BINDIR_NATIVE}:;s:/usr/share:${STAGING_DATADIR}:g}' {} \;
-}
-
-python populate_packages_prepend () {
-	gnumeric_libdir = bb.data.expand('${libdir}/gnumeric/${PV}/plugins', d)
-
-	do_split_packages(d, gnumeric_libdir, '(.*)', 'gnumeric-plugin-%s', 'Gnumeric plugin for %s', allow_dirs=True)
-}
diff --git a/recipes/gnumeric/gnumeric_1.8.4.bb b/recipes/gnumeric/gnumeric_1.8.4.bb
new file mode 100644
index 0000000..e375f27
--- /dev/null
+++ b/recipes/gnumeric/gnumeric_1.8.4.bb
@@ -0,0 +1,31 @@
+LICENSE = "GPL"
+SECTION = "x11/utils"
+S = "${WORKDIR}/gnumeric-${PV}"
+DEPENDS = "gdk-pixbuf-csource-native libgsf gtk+ libxml2 goffice libglade libart-lgpl intltool-native libgnomecanvas libgnomeprint libgnomeprintui libbonoboui orbit2-native"
+DESCRIPTION = "Gnumeric spreadsheet for GNOME"
+
+PR = "r0"
+
+PARALLEL_MAKE = ""
+
+inherit gnome flow-lossage
+
+SRC_URI += "file://remove-docs.patch;patch=1"
+
+EXTRA_OECONF=" --without-perl "
+
+PACKAGES_DYNAMIC += "gnumeric-plugin-*"
+
+FILES_${PN}-dbg += "${libdir}/gnumeric/${PV}/plugins/*/.debug"
+FILES_gnumeric_append = " /usr/lib/libspreadsheet-${PV}.so "
+
+# We need native orbit-idl with target idl files. No way to say it in a clean way:
+do_configure_append () {
+	find -name Makefile -exec sed -i '/\/usr\/bin\/orbit-idl-2/{s:/usr/bin:${STAGING_BINDIR_NATIVE}:;s:/usr/share:${STAGING_DATADIR}:g}' {} \;
+}
+
+python populate_packages_prepend () {
+	gnumeric_libdir = bb.data.expand('${libdir}/gnumeric/${PV}/plugins', d)
+
+	do_split_packages(d, gnumeric_libdir, '(.*)', 'gnumeric-plugin-%s', 'Gnumeric plugin for %s', allow_dirs=True)
+}
-- 
1.6.3.1.54.g99dd



