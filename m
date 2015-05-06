Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id C099473C5B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 May 2015 03:45:49 +0000 (UTC)
Received: by iedfl3 with SMTP id fl3so5696644ied.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 May 2015 20:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=3oULgqBzFYkrFiD8RZ6mm/GDUNmnaNH2QF36MCOVAqY=;
	b=wgHDPE1EnJbMO0ksjh1hTK1PNwRRy5w9z/k7mXnk3IoYDYxtrohRaKfvUnxW5GdyWI
	DhfRchYq0tgZZxdI9gvhcQtoQTDJkZLT9BpZN2OcQSbPat30OxKmfke7J9MJK+AyUN1h
	ANAcY3HU5Chi4prYed0pLIr3q+c0xN4rt/VnNXji9RQOkN48/xUVrk5DfVeNHMPpTR99
	OE2PISLPijk/JXpKO9fxEMmc78WR8OCPdKUX2QZ9Ci/B/x7Qu18gaICzL/LZoDWgfHac
	GitSzFX9rKiDx9oenB5EngES51Ni3n8C9gwLMIJ9CkzJTebfOHZm7QqD59wzEmi6KieV
	CLFw==
X-Received: by 10.50.142.2 with SMTP id rs2mr750837igb.1.1430883951193;
	Tue, 05 May 2015 20:45:51 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id fm3sm64325igb.1.2015.05.05.20.45.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 May 2015 20:45:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 May 2015 20:45:42 -0700
Message-Id: <1430883943-30031-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH V2 2/8] polkit-gnome: Upgrade 0.102 -> 0.105
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 May 2015 03:45:52 -0000

add missing dep on gtk+3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/polkit/files/gtk-doc-check.patch  | 12 ++++++++++++
 .../{polkit-gnome_0.102.bb => polkit-gnome_0.105.bb}       | 14 ++++++++------
 2 files changed, 20 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-extended/polkit/files/gtk-doc-check.patch
 rename meta-oe/recipes-extended/polkit/{polkit-gnome_0.102.bb => polkit-gnome_0.105.bb} (62%)

diff --git a/meta-oe/recipes-extended/polkit/files/gtk-doc-check.patch b/meta-oe/recipes-extended/polkit/files/gtk-doc-check.patch
new file mode 100644
index 0000000..4b6ad75
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/files/gtk-doc-check.patch
@@ -0,0 +1,12 @@
+--- polkit-gnome-0.105/configure.ac.org	2015-05-04 22:33:03.925977953 -0700
++++ polkit-gnome-0.105/configure.ac	2015-05-04 22:33:16.862288030 -0700
+@@ -120,6 +120,9 @@
+ # Check for required packages
+ # ***************************
+ 
++# check for gtk-doc
++GTK_DOC_CHECK([1.14],[--flavour no-tmpl])
++
+ POLKIT_AGENT_REQUIRED=0.97
+ POLKIT_GOBJECT_REQUIRED=0.97
+ GTK_REQUIRED=3.0.0
diff --git a/meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb b/meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb
similarity index 62%
rename from meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb
rename to meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb
index f5480e7..be33908 100644
--- a/meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb
+++ b/meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb
@@ -7,22 +7,24 @@ LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=74579fab173e4c5e12aac0cd83ee98ec \
                     file://src/main.c;beginline=1;endline=20;md5=aba145d1802f2329ba561e3e48ecb795"
 
-SRC_URI = "http://hal.freedesktop.org/releases/polkit-gnome-${PV}.tar.bz2 \
+SRC_URI = "https://download.gnome.org/sources/polkit-gnome/${PV}/polkit-gnome-${PV}.tar.xz \
+           file://gtk-doc-check.patch \
 "
+SRC_URI[md5sum] = "50ecad37c8342fb4a52f590db7530621"
+SRC_URI[sha256sum] = "1784494963b8bf9a00eedc6cd3a2868fb123b8a5e516e66c5eda48df17ab9369"
 
-PNBLACKLIST[polkit-gnome] ?= "Fails to build, m4:configure.ac:125: recursion limit of 1024 exceeded, use -L<N> to change it"
-
-PR = "r2"
+#PNBLACKLIST[polkit-gnome] ?= "Fails to build, m4:configure.ac:125: recursion limit of 1024 exceeded, use -L<N> to change it"
 
 EXTRA_OECONF = "\
     --disable-examples \
     --disable-introspection \
+    --disable-static \
 "
 
+DEPENDS += "gtk+3"
+
 inherit autotools gtk-doc pkgconfig
 
 FILES_${PN} += " ${datadir}/dbus-1 \
                  ${datadir}/PolicyKit \
 "
-SRC_URI[md5sum] = "f6b485ffd7bd605af815fd2747180481"
-SRC_URI[sha256sum] = "81caa6972e651e90ef4ac31d7ed41bc79543d46b850dbd5b14b40f8ef7107d11"
-- 
2.1.4


