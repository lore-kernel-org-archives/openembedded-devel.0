Return-Path: <ashcharles@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 846F46AC1E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 00:11:37 +0000 (UTC)
Received: by pdjm12 with SMTP id m12so24959665pdj.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jun 2015 17:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=pUqpJTTyJjcjaGIBy1F2osu4Nz9MuIjmFvBOCjS0/s4=;
	b=dXRaPevQjw62malGsuLI5f+TP+/i32nNSyS+0kcn0olwrnb0JyNzmD4dAKCZiwEhLe
	wUBWV1U5Z9vrXa4q1DHXvQniWXFQu9mAzP9Xs0+1VSxsh/H3uaTesBDQpknyluhevOcY
	HaK1D59AsXym4LDCnOPoBimEqDUiwn4dQWgBSOwUxyaCrcb3SAkXauV+I+WNfs1okVil
	8xYvWE0KxYOloRMIyXiBUoacTM1oYxmB82m2HyCjN7EFgQH4hm31cNVvKzkMr4pYULAX
	4t8BM0BhKxWyEkq5n1JXQLitj6VEvNNvQgS+eer9niQ7lBiG6CsaBGp9DZIGrlmes1q3
	5ABg==
X-Received: by 10.68.218.103 with SMTP id pf7mr5314913pbc.32.1434499899263;
	Tue, 16 Jun 2015 17:11:39 -0700 (PDT)
Received: from gumstux.mystix.com (s206-116-3-180.bc.hsia.telus.net.
	[206.116.3.180]) by mx.google.com with ESMTPSA id
	fe10sm2575165pdb.59.2015.06.16.17.11.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Jun 2015 17:11:38 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Jun 2015 17:11:36 -0700
Message-Id: <1434499897-20805-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [fido][PATCH 1/2] polkit-gnome: Upgrade 0.102 -> 0.105
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
X-List-Received-Date: Wed, 17 Jun 2015 00:11:38 -0000

From: Khem Raj <raj.khem@gmail.com>

add missing dep on gtk+3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../polkit/files/gtk-doc-check.patch               | 12 +++++++++
 .../recipes-extended/polkit/polkit-gnome_0.102.bb  | 28 --------------------
 .../recipes-extended/polkit/polkit-gnome_0.105.bb  | 30 ++++++++++++++++++++++
 3 files changed, 42 insertions(+), 28 deletions(-)
 create mode 100644 meta-oe/recipes-extended/polkit/files/gtk-doc-check.patch
 delete mode 100644 meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb
 create mode 100644 meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb

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
diff --git a/meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb b/meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb
deleted file mode 100644
index f5480e7..0000000
--- a/meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY = "GNOME Authentication Agent for PolicyKit"
-DESCRIPTION = "PolicyKit-gnome provides an Authentication Agent for PolicyKit that integrates well with the GNOME desktop environment"
-HOMEPAGE = "http://www.packagekit.org/"
-BUGTRACKER = "http://bugzilla.gnome.org/"
-DEPENDS = "polkit dbus-glib gconf gtk+ intltool-native gnome-common"
-LICENSE = "LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=74579fab173e4c5e12aac0cd83ee98ec \
-                    file://src/main.c;beginline=1;endline=20;md5=aba145d1802f2329ba561e3e48ecb795"
-
-SRC_URI = "http://hal.freedesktop.org/releases/polkit-gnome-${PV}.tar.bz2 \
-"
-
-PNBLACKLIST[polkit-gnome] ?= "Fails to build, m4:configure.ac:125: recursion limit of 1024 exceeded, use -L<N> to change it"
-
-PR = "r2"
-
-EXTRA_OECONF = "\
-    --disable-examples \
-    --disable-introspection \
-"
-
-inherit autotools gtk-doc pkgconfig
-
-FILES_${PN} += " ${datadir}/dbus-1 \
-                 ${datadir}/PolicyKit \
-"
-SRC_URI[md5sum] = "f6b485ffd7bd605af815fd2747180481"
-SRC_URI[sha256sum] = "81caa6972e651e90ef4ac31d7ed41bc79543d46b850dbd5b14b40f8ef7107d11"
diff --git a/meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb b/meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb
new file mode 100644
index 0000000..be33908
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb
@@ -0,0 +1,30 @@
+SUMMARY = "GNOME Authentication Agent for PolicyKit"
+DESCRIPTION = "PolicyKit-gnome provides an Authentication Agent for PolicyKit that integrates well with the GNOME desktop environment"
+HOMEPAGE = "http://www.packagekit.org/"
+BUGTRACKER = "http://bugzilla.gnome.org/"
+DEPENDS = "polkit dbus-glib gconf gtk+ intltool-native gnome-common"
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=74579fab173e4c5e12aac0cd83ee98ec \
+                    file://src/main.c;beginline=1;endline=20;md5=aba145d1802f2329ba561e3e48ecb795"
+
+SRC_URI = "https://download.gnome.org/sources/polkit-gnome/${PV}/polkit-gnome-${PV}.tar.xz \
+           file://gtk-doc-check.patch \
+"
+SRC_URI[md5sum] = "50ecad37c8342fb4a52f590db7530621"
+SRC_URI[sha256sum] = "1784494963b8bf9a00eedc6cd3a2868fb123b8a5e516e66c5eda48df17ab9369"
+
+#PNBLACKLIST[polkit-gnome] ?= "Fails to build, m4:configure.ac:125: recursion limit of 1024 exceeded, use -L<N> to change it"
+
+EXTRA_OECONF = "\
+    --disable-examples \
+    --disable-introspection \
+    --disable-static \
+"
+
+DEPENDS += "gtk+3"
+
+inherit autotools gtk-doc pkgconfig
+
+FILES_${PN} += " ${datadir}/dbus-1 \
+                 ${datadir}/PolicyKit \
+"
-- 
2.1.4


