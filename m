Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8844978284
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 07:44:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6K7id4P000452
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 20 Jul 2017 00:44:39 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 20 Jul 2017 00:44:38 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 20 Jul 2017 03:44:28 -0400
Message-ID: <8ed13ec40929590cc5daa25b13e8f6c0f10b0f3f.1500536448.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1500536448.git.hongxu.jia@windriver.com>
References: <cover.1500536448.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 1/8] libgnomekbd: 2.32 -> 3.22
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Jul 2017 07:44:40 -0000
Content-Type: text/plain

Remove --disable-schemas-install:
...
|QA Issue: libgnomekbd: configure was passed unrecognised
options: --disable-schemas-install [unknown-configure-option]
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../gnome-settings-daemon_2.32.1.bb                  |  3 ---
 .../recipes-gnome/libgnome/libgnomekbd_2.32.0.bb     | 20 --------------------
 .../recipes-gnome/libgnome/libgnomekbd_3.22.0.bb     | 17 +++++++++++++++++
 3 files changed, 17 insertions(+), 23 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
 create mode 100644 meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.22.0.bb

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
index c1db6d3..9a18972 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
@@ -40,7 +40,4 @@ FILES_${PN}-dbg += "${libdir}/gnome-settings-daemon-2.0/.debug"
 FILES_${PN}-dev += "${libdir}/gnome-settings-daemon-2.0/*.la"
 FILES_${PN}-staticdev += "${libdir}/gnome-settings-daemon-2.0/*.a"
 
-
-PNBLACKLIST[gnome-settings-daemon] ?= "Depends on blacklisted libgnomekbd - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
 PNBLACKLIST[gnome-settings-daemon] ?= "Depends on blacklisted gnome-desktop - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
deleted file mode 100644
index 852d8e1..0000000
--- a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "GNOME keyboard library"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6e29c688d912da12b66b73e32b03d812"
-
-SECTION = "x11/gnome/libs"
-
-DEPENDS = "gconf gtk+ glib-2.0 libxklavier intltool-native gnome-common-native"
-
-inherit gnome
-
-SRC_URI[archive.md5sum] = "de32a6e3e3464b566eecdc4332bf34bd"
-SRC_URI[archive.sha256sum] = "ddd52c4cc7d83ad7ef964a1bcb4db87407e65b00ffc3e70c088ca4ee7383d256"
-GNOME_COMPRESS_TYPE="bz2"
-
-do_configure_append() {
-    find ${B} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
-    find ${B} -name Makefile | xargs sed -i s:'-I/usr/include':'-I${STAGING_INCDIR}':g
-}
-
-PNBLACKLIST[libgnomekbd] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130608/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.22.0.bb b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.22.0.bb
new file mode 100644
index 0000000..12ed81d
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.22.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "GNOME keyboard library"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6e29c688d912da12b66b73e32b03d812"
+
+SECTION = "x11/gnome/libs"
+
+DEPENDS = "gconf glib-2.0 libxklavier gtk+3 intltool-native"
+
+inherit gnome gobject-introspection gettext
+
+GNOME_COMPRESS_TYPE = "xz"
+
+SRC_URI[archive.md5sum] = "7b1ebf99f4254c99922163c262c7ff04"
+SRC_URI[archive.sha256sum] = "340b30dabfebbd4e0e6c0fe34a378966dd5640b5d44595ab8a19b0be255d77df"
+
+EXTRA_OECONF_remove = "--disable-schemas-install"
+
-- 
2.8.1


