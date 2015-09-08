Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f195.google.com (mail-wi0-f195.google.com
	[209.85.212.195])
	by mail.openembedded.org (Postfix) with ESMTP id 624FE65C8A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Sep 2015 15:43:41 +0000 (UTC)
Received: by wiku15 with SMTP id u15so22815742wik.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Sep 2015 08:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=Gn+BaIRekyl+v/zkBSw+fv7jnQBOa7/Rhm27B2gC3tQ=;
	b=a5FR+9XlxkIznS1A35Z+6+TO+JndxVBJxau4z+ugyJEFTVNxcie99TjFF5V7fev1xO
	TARqOu3dyp48X3FFeQCe3kfi+Ry150Nvob2nhsFDH0x2f7e4+aBtWOBTPsHa9FhqGINb
	wmMbKZtSxPRVv67enXLnW/v82bd18MDPV6zMCX1TOe9XpDS6MHbadPos9A/kQvXnV9xT
	nFfbG7B3sM07lrk2vhUzMqHCjSbPyqDQnVxc5p9q4c2p1zQl0FYFcAPs+d3z3o3srPaU
	7I0qbO0UzkTujK8QrIfM40ZoJq0gzuuqD1E8dJbG8CQSiJ4iSA3hEsi5Lzb9ZyjoBURP
	WvXw==
X-Received: by 10.180.8.101 with SMTP id q5mr48039798wia.10.1441727021019;
	Tue, 08 Sep 2015 08:43:41 -0700 (PDT)
Received: from localhost.localdomain ([5.147.14.94])
	by smtp.googlemail.com with ESMTPSA id
	lu5sm5496240wjb.9.2015.09.08.08.43.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Sep 2015 08:43:40 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Sep 2015 17:42:53 +0200
Message-Id: <1441726980-32656-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1441726980-32656-1-git-send-email-schnitzeltony@googlemail.com>
References: <1441726980-32656-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/9] parole: initial add 0.8.0
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
X-List-Received-Date: Tue, 08 Sep 2015 15:43:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../parole/files/parole-0.8.0-appdata.patch        | 30 ++++++++++++++++++
 .../recipes-multimedia/parole/parole_0.8.0.bb      | 37 ++++++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 meta-xfce/recipes-multimedia/parole/files/parole-0.8.0-appdata.patch
 create mode 100644 meta-xfce/recipes-multimedia/parole/parole_0.8.0.bb

diff --git a/meta-xfce/recipes-multimedia/parole/files/parole-0.8.0-appdata.patch b/meta-xfce/recipes-multimedia/parole/files/parole-0.8.0-appdata.patch
new file mode 100644
index 0000000..e076924
--- /dev/null
+++ b/meta-xfce/recipes-multimedia/parole/files/parole-0.8.0-appdata.patch
@@ -0,0 +1,30 @@
+Upstream-Status: submitted [1]
+Taken-From: [2]
+
+[1] https://bugzilla.xfce.org/show_bug.cgi?id=11653
+[2] http://pkgs.fedoraproject.org/cgit/parole.git/tree/parole-0.8.0-appdata.patch
+
+diff -Nur parole-0.8.0.orig/data/appdata/parole.appdata.xml.in parole-0.8.0/data/appdata/parole.appdata.xml.in
+--- parole-0.8.0.orig/data/appdata/parole.appdata.xml.in	2015-02-28 07:23:54.000000000 -0700
++++ parole-0.8.0/data/appdata/parole.appdata.xml.in	2015-03-07 08:25:01.940009844 -0700
+@@ -41,7 +41,7 @@
+   </provides>
+ 
+   <releases>
+-    <release version="0.7.0" timestamp="">
++    <release version="0.7.0" timestamp="1396146123">
+       <description>
+         <_p>This unstable development release adds the new clutter backend and cleans up
+         deprecated Gtk3 symbols. It also adds a "go to position" feature and several bugs
+diff -Nur parole-0.8.0.orig/po/es.po parole-0.8.0/po/es.po
+--- parole-0.8.0.orig/po/es.po	2015-02-28 07:23:54.000000000 -0700
++++ parole-0.8.0/po/es.po	2015-03-07 08:25:17.447726837 -0700
+@@ -514,7 +514,7 @@
+ "This unstable development release adds the new clutter backend and cleans up"
+ " deprecated Gtk3 symbols. It also adds a \"go to position\" feature and "
+ "several bugs have been addressed."
+-msgstr "Esta versión de desarrollo añade un nuevo motor de <i>clutter</i> y elimina símbolos GTK3 obsoletos. Además añade la funcionalidad «Ir a la posición» y corrige un sinnúmero de errores."
++msgstr "Esta versión de desarrollo añade un nuevo motor de clutter y elimina símbolos GTK3 obsoletos. Además añade la funcionalidad «Ir a la posición» y corrige un sinnúmero de errores."
+ 
+ #: ../data/appdata/parole.appdata.xml.in.h:4
+ msgid "This release fixes a problem with detecting DVD drive locations."
diff --git a/meta-xfce/recipes-multimedia/parole/parole_0.8.0.bb b/meta-xfce/recipes-multimedia/parole/parole_0.8.0.bb
new file mode 100644
index 0000000..28bedaf
--- /dev/null
+++ b/meta-xfce/recipes-multimedia/parole/parole_0.8.0.bb
@@ -0,0 +1,37 @@
+DESCRIPTION = "Parole is a modern simple media player based on the GStreamer framework"
+HOMEPAGE = "http://goodies.xfce.org/projects/applications/parole"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+inherit xfce-app gtk-doc mime
+
+DEPENDS = " \
+    glib-2.0 \
+    dbus-glib \
+    gtk+3 \
+    \
+    xfce4-dev-tools-native \
+    libxfce4util \
+    libxfce4ui \
+    xfconf \
+    \
+    gstreamer1.0-plugins-base \
+    taglib \
+"
+
+SRC_URI[md5sum] = "fffdc23d2aa22271f01410a9e27c3404"
+SRC_URI[sha256sum] = "2d966aeb426de81d992829e33b3f66185b19fd031a1891968b3a40d6d50239cc"
+SRC_URI += "file://parole-0.8.0-appdata.patch"
+
+RDEPENDS_${PN} += "gstreamer1.0-plugins-good"
+
+PACKAGECONFIG ??= "notify"
+PACKAGECONFIG[clutter] = "--enable-clutter, --disable-clutter, clutter"
+PACKAGECONFIG[notify] = "--enable-notify-plugin, --disable-notify-plugin, libnotify"
+
+FILES_${PN} += " \
+    ${datadir}/appdata \
+    ${libdir}/parole-0/*.so \
+"
+FILES_${PN}-dbg += "${libdir}/parole-0/.debug"
+FILES_${PN}-dev += "${libdir}/parole-0/*.la"
-- 
2.1.0


