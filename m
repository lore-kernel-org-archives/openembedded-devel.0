Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1Qzvbk-0005RH-PE
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Sep 2011 21:10:25 +0200
Received: by mail-bw0-f47.google.com with SMTP id zu17so3354733bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Sep 2011 12:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=4p5i1F3AH33E9XnE3GqD3HSUL++RAAvXWqroiCmYwPk=;
	b=aVolLOfIuKUGH8WMjr2+0q6NxcaMxu3AOmf92Sx+qPkRXosmb4R45JKZV5zN4ep+IV
	BAIXKEdGCTDGWAIssWjf7VNVVPFX4OVBNp70e2X+1sabx/BMSQgTniHNdRpzwhhKtt+i
	ju1wUv95K5H/H8mhZzULxq1SRi66TeT3KT2CU=
Received: by 10.204.139.78 with SMTP id d14mr1251163bku.239.1315076725255;
	Sat, 03 Sep 2011 12:05:25 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id k23sm657019bkd.6.2011.09.03.12.05.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 03 Sep 2011 12:05:24 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 Sep 2011 23:05:17 +0400
Message-Id: <1315076717-10236-2-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1315076717-10236-1-git-send-email-dbaryshkov@gmail.com>
References: <1315076717-10236-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [RESEND][meta-oe 2/2] gnome-disk-utility: fix path for dbus interface definitions
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
X-List-Received-Date: Sat, 03 Sep 2011 19:10:25 -0000

During compilation gdu looks for several UDisks dbus xml files. However
it looks for them in system root and not in sysroot, failing if those
don't exist. Fix that.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../gnome-disk-utility/fix-dbus-interfaces.patch   |   34 ++++++++++++++++++++
 .../gnome-disk-utility_2.32.0.bb                   |    1 +
 2 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/fix-dbus-interfaces.patch

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/fix-dbus-interfaces.patch b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/fix-dbus-interfaces.patch
new file mode 100644
index 0000000..6ba3979
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/fix-dbus-interfaces.patch
@@ -0,0 +1,34 @@
+Index: gnome-disk-utility-2.32.0/src/gdu/Makefile.am
+===================================================================
+--- gnome-disk-utility-2.32.0.orig/src/gdu/Makefile.am	2011-08-20 01:59:16.000000000 +0400
++++ gnome-disk-utility-2.32.0/src/gdu/Makefile.am	2011-08-20 02:08:18.000000000 +0400
+@@ -14,20 +14,20 @@
+ gdu-marshal.c: gdu-marshal.list
+	echo "#include \"gdu-marshal.h\"" > $@ && glib-genmarshal $< --prefix=gdu_marshal --body >> $@
+
+-udisks-daemon-glue.h: /usr/share/dbus-1/interfaces/org.freedesktop.UDisks.xml Makefile.am
+-	dbus-binding-tool --prefix=devkit_disks_daemon --mode=glib-client --output=udisks-daemon-glue.h /usr/share/dbus-1/interfaces/org.freedesktop.UDisks.xml
++udisks-daemon-glue.h: $(PKG_CONFIG_SYSROOT_DIR)/usr/share/dbus-1/interfaces/org.freedesktop.UDisks.xml Makefile.am
++	dbus-binding-tool --prefix=devkit_disks_daemon --mode=glib-client --output=udisks-daemon-glue.h $(PKG_CONFIG_SYSROOT_DIR)/usr/share/dbus-1/interfaces/org.freedesktop.UDisks.xml
+
+-udisks-device-glue.h: /usr/share/dbus-1/interfaces/org.freedesktop.UDisks.Device.xml Makefile.am
+-	dbus-binding-tool --prefix=devkit_disks_daemon --mode=glib-client --output=udisks-device-glue.h /usr/share/dbus-1/interfaces/org.freedesktop.UDisks.Device.xml
++udisks-device-glue.h: $(PKG_CONFIG_SYSROOT_DIR)/usr/share/dbus-1/interfaces/org.freedesktop.UDisks.Device.xml Makefile.am
++	dbus-binding-tool --prefix=devkit_disks_daemon --mode=glib-client --output=udisks-device-glue.h $(PKG_CONFIG_SYSROOT_DIR)/usr/share/dbus-1/interfaces/org.freedesktop.UDisks.Device.xml
+
+-udisks-adapter-glue.h: /usr/share/dbus-1/interfaces/org.freedesktop.UDisks.Adapter.xml Makefile.am
+-	dbus-binding-tool --prefix=devkit_disks_daemon --mode=glib-client --output=udisks-adapter-glue.h /usr/share/dbus-1/interfaces/org.freedesktop.UDisks.Adapter.xml
++udisks-adapter-glue.h: $(PKG_CONFIG_SYSROOT_DIR)/usr/share/dbus-1/interfaces/org.freedesktop.UDisks.Adapter.xml Makefile.am
++	dbus-binding-tool --prefix=devkit_disks_daemon --mode=glib-client --output=udisks-adapter-glue.h $(PKG_CONFIG_SYSROOT_DIR)/usr/share/dbus-1/interfaces/org.freedesktop.UDisks.Adapter.xml
+
+-udisks-expander-glue.h: /usr/share/dbus-1/interfaces/org.freedesktop.UDisks.Expander.xml Makefile.am
+-	dbus-binding-tool --prefix=devkit_disks_daemon --mode=glib-client --output=udisks-expander-glue.h /usr/share/dbus-1/interfaces/org.freedesktop.UDisks.Expander.xml
++udisks-expander-glue.h: $(PKG_CONFIG_SYSROOT_DIR)/usr/share/dbus-1/interfaces/org.freedesktop.UDisks.Expander.xml Makefile.am
++	dbus-binding-tool --prefix=devkit_disks_daemon --mode=glib-client --output=udisks-expander-glue.h $(PKG_CONFIG_SYSROOT_DIR)/usr/share/dbus-1/interfaces/org.freedesktop.UDisks.Expander.xml
+
+-udisks-port-glue.h: /usr/share/dbus-1/interfaces/org.freedesktop.UDisks.Port.xml Makefile.am
+-	dbus-binding-tool --prefix=devkit_disks_daemon --mode=glib-client --output=udisks-port-glue.h /usr/share/dbus-1/interfaces/org.freedesktop.UDisks.Port.xml
++udisks-port-glue.h: $(PKG_CONFIG_SYSROOT_DIR)/usr/share/dbus-1/interfaces/org.freedesktop.UDisks.Port.xml Makefile.am
++	dbus-binding-tool --prefix=devkit_disks_daemon --mode=glib-client --output=udisks-port-glue.h $(PKG_CONFIG_SYSROOT_DIR)/usr/share/dbus-1/interfaces/org.freedesktop.UDisks.Port.xml
+
+ lib_LTLIBRARIES=libgdu.la
diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
index f7945c5..ab1113c 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
@@ -11,6 +11,7 @@ SRC_URI[archive.sha256sum] = "03e461b6bda7f773f8018d25fa3213d3073d4dc83a76e6b39d
 
 SRC_URI += "\
      file://disable-scrollkeeper.patch \
+     file://fix-dbus-interfaces.patch \
      "
 
 EXTRA_OECONF += "--disable-scrollkeeper"
-- 
1.7.2.5



