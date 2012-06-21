Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Shcm5-0000LW-F6
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jun 2012 10:29:57 +0200
Received: by wgbdr1 with SMTP id dr1so295786wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2012 01:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=NeQ+N5+JoAeZDiW0HJXMl2AomzPYtIJnMz06UegsVq0=;
	b=0zjOxw6j8NEstqwdSwCVGjKVZjAyT7IXmOOHi4e8h47SF/MbVELtGhg8FsZ9NVVLSf
	QEGtrhGAEntzA5JU+0mkn1+XwVrsyPBJhjl8FHsplVwNqaIXrhjvFfvX/ynASQ+b1lbD
	m0ceN5xyapyabYN0jq/jFf5oAN4XwL7DXQUgbKqDwsEAOIXHPaOoHAp9BaPd8EXiEX3d
	WvdTyozG04TkD2G7towACrZLVZpjc7HNud83qhOzQjtN33YqtF9WnFS7ZQTTJMiFs86y
	l+nyq3TjZbAasrEPX/ImZ0pEHIGEnM6T8FYwfuxyJh/YbcpibqkR6WvchgkQX6QXNlc0
	5HhQ==
Received: by 10.216.143.146 with SMTP id l18mr1520957wej.56.1340266751806;
	Thu, 21 Jun 2012 01:19:11 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id dg2sm86059045wib.4.2012.06.21.01.19.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jun 2012 01:19:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Jun 2012 10:18:46 +0200
Message-Id: <290d03291de93c58a227640ec0e24d4a3a16a6a5.1340266416.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1340266416.git.Martin.Jansa@gmail.com>
References: <cover.1340266416.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1340266416.git.Martin.Jansa@gmail.com>
References: <cover.1340266416.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 2/5] vala: update to 0.16.0 and restructure some stuff into vala.inc
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
X-List-Received-Date: Thu, 21 Jun 2012 08:29:57 -0000

From: Simon Busch <morphis@gravedo.de>

* SRC_URI is now set initially to real upstream and not freesmartphone.org
* reset PR and INC_PR
* moved DEPENDS += "gtk+" to vala.inc

Signed-off-by: Simon Busch <morphis@gravedo.de>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...-gen-don-t-append-dirty-if-we-re-not-in-g.patch |    0
 meta-oe/recipes-devtools/vala/vala.inc             |   15 +++++----------
 meta-oe/recipes-devtools/vala/vala_0.14.2.bb       |   14 --------------
 meta-oe/recipes-devtools/vala/vala_0.16.0.bb       |    8 ++++++++
 4 files changed, 13 insertions(+), 24 deletions(-)
 rename meta-oe/recipes-devtools/vala/{vala-0.14.2 => vala-0.16.0}/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch (100%)
 delete mode 100644 meta-oe/recipes-devtools/vala/vala_0.14.2.bb
 create mode 100644 meta-oe/recipes-devtools/vala/vala_0.16.0.bb

diff --git a/meta-oe/recipes-devtools/vala/vala-0.14.2/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch b/meta-oe/recipes-devtools/vala/vala-0.16.0/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch
similarity index 100%
rename from meta-oe/recipes-devtools/vala/vala-0.14.2/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch
rename to meta-oe/recipes-devtools/vala/vala-0.16.0/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch
diff --git a/meta-oe/recipes-devtools/vala/vala.inc b/meta-oe/recipes-devtools/vala/vala.inc
index 0815c66..3d33953 100644
--- a/meta-oe/recipes-devtools/vala/vala.inc
+++ b/meta-oe/recipes-devtools/vala/vala.inc
@@ -1,25 +1,20 @@
 DESCRIPTION = "Vala is a C#-like language dedicated to ease GObject programming. \
 Vala compiles to plain C and has no runtime environment nor penalities whatsoever."
 SECTION = "devel"
-DEPENDS = "glib-2.0 dbus"
+DEPENDS = "glib-2.0 dbus gtk+"
 BBCLASSEXTEND = "native"
 DEPENDS_virtclass-native = "glib-2.0-native dbus-native"
 HOMEPAGE = "http://vala-project.org"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-INC_PR = "r0"
+INC_PR = "r1"
 
-#
-# WARNING: This source release has specifically been built for OpenEmbedded.
-# Don't update to any upstream release without consulting the recipe maintainer.
-#
-
-SRC_URI = "\
-  http://downloads.freesmartphone.org/sources/vala-${PV}.tar.bz2;name=archive \
-"
+SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
 
+SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/${BP}.tar.xz"
 inherit autotools
 
 EXTRA_OECONF = "--disable-vapigen"
 
 FILES_${PN}-doc += "${datadir}/devhelp"
+FILES_${PN} += "${datadir}/${BPN}-${SHRT_VER}/vapi"
diff --git a/meta-oe/recipes-devtools/vala/vala_0.14.2.bb b/meta-oe/recipes-devtools/vala/vala_0.14.2.bb
deleted file mode 100644
index 18e6346..0000000
--- a/meta-oe/recipes-devtools/vala/vala_0.14.2.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require recipes-devtools/vala/vala.inc
-
-PR = "r1"
-
-DEPENDS += "gtk+"
-
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/vala/0.14/vala-${PV}.tar.xz \
-           file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch \
-"
-
-FILES_${PN} += "${datadir}/vala-0.14/vapi"
-
-SRC_URI[md5sum] = "f05263a56c1e328637e4c97a61befdad"
-SRC_URI[sha256sum] = "807e6978484f66cab3cf4fefd72f37a4293d2831d7a5fd29119bdf9d38a5b3d0"
diff --git a/meta-oe/recipes-devtools/vala/vala_0.16.0.bb b/meta-oe/recipes-devtools/vala/vala_0.16.0.bb
new file mode 100644
index 0000000..1dd190f
--- /dev/null
+++ b/meta-oe/recipes-devtools/vala/vala_0.16.0.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch"
+
+SRC_URI[md5sum] = "84b742e9cca4c90fde3026c3793c03c1"
+SRC_URI[sha256sum] = "3adb37aa2b35e2e2daed47552e85dbcbf752c0f7768b269d856993620073a657"
-- 
1.7.8.6



