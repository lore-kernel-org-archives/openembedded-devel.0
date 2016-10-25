Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8E6F170016
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Oct 2016 09:19:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u9P9J3T6009460
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 25 Oct 2016 02:19:03 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 25 Oct 2016 02:19:02 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Oct 2016 05:18:59 -0400
Message-ID: <81fb1551c2699cd2f579720d1640c70d85887776.1477386993.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1477386993.git.hongxu.jia@windriver.com>
References: <cover.1477386993.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libxklavier: upgrade 5.4
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
X-List-Received-Date: Tue, 25 Oct 2016 09:19:02 -0000
Content-Type: text/plain

The gnome does not support 5.4 any more,
get 5.4 from fedora to upgrade.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../files/fix-do_installe-failure.patch            | 36 ++++++++++++++++++++++
 .../{libxklavier_5.3.bb => libxklavier_5.4.bb}     | 15 ++++++---
 2 files changed, 47 insertions(+), 4 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/libxklavier/files/fix-do_installe-failure.patch
 rename meta-gnome/recipes-gnome/libxklavier/{libxklavier_5.3.bb => libxklavier_5.4.bb} (55%)

diff --git a/meta-gnome/recipes-gnome/libxklavier/files/fix-do_installe-failure.patch b/meta-gnome/recipes-gnome/libxklavier/files/fix-do_installe-failure.patch
new file mode 100644
index 0000000..29eeef3
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libxklavier/files/fix-do_installe-failure.patch
@@ -0,0 +1,36 @@
+From 2343283caf88d2390afee08fe034b4c970b20f2e Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sat, 16 Apr 2016 06:40:04 -0400
+Subject: [PATCH] fix do_installe failure
+
+| 18  /usr/bin/install -c -m 644 ../../libxklavier-5.4/libxklavier/libxklavier.vapi
+libxklavier.deps 'tmp/work/corei7-64-wrs-linux/libxklavier/5.4-r0/image/
+usr/share/vala/vapi'
+| 19 /usr/bin/install: cannot stat '../../libxklavier-5.4/libxklavier/
+libxklavier.vapi': No such file or directory
+| 20 Makefile:621: recipe for target 'install-vapiDATA' failed
+| 21 make[3]: *** [install-vapiDATA] Error 1
+| 22 make[3]: *** Waiting for unfinished jobs....
+
+Upstream-Stauts: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ libxklavier/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libxklavier/Makefile.am b/libxklavier/Makefile.am
+index c9c1bbe..f0efa32 100644
+--- a/libxklavier/Makefile.am
++++ b/libxklavier/Makefile.am
+@@ -131,6 +131,6 @@ libxklavier.deps:
+ 	done
+ 
+ vapidir = $(datadir)/vala/vapi
+-vapi_DATA = $(VAPIGEN_VAPIS) $(VAPIGEN_VAPIS:.vapi=.deps)
++vapi_DATA = $(VAPIGEN_VAPIS:.vapi=.deps)
+ endif
+ endif
+-- 
+1.9.1
+
diff --git a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb
similarity index 55%
rename from meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb
rename to meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb
index 384841a..ff9853d 100644
--- a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb
+++ b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb
@@ -4,11 +4,18 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6e29c688d912da12b66b73e32b03d812"
 
 DEPENDS = "xkbcomp gtk+ iso-codes libxi libxml2"
 
-GNOME_COMPRESS_TYPE = "xz"
+inherit autotools pkgconfig gettext gobject-introspection
 
-inherit gnomebase gettext gobject-introspection
-SRC_URI[archive.md5sum] = "290ea2a8abc40f78a3a16bdae6f02808"
-SRC_URI[archive.sha256sum] = "ebec3bc54b5652838502b96223152fb1cd8fcb14ace5cb02d718fc3276bbd404"
+RDEPENDS_${PN} += "iso-codes xkbcomp"
+
+SRC_URI = " \
+    http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BPN}-${PV}.tar.bz2/13af74dcb6011ecedf1e3ed122bd31fa/${BPN}-${PV}.tar.bz2 \
+    file://fix-do_installe-failure.patch \
+"
+SRC_URI[md5sum] = "13af74dcb6011ecedf1e3ed122bd31fa"
+SRC_URI[sha256sum] = "17a34194df5cbcd3b7bfd0f561d95d1f723aa1c87fca56bc2c209514460a9320"
+
+FILES_${PN} += "${datadir}/*"
 
 EXTRA_OECONF = "--with-xkb-bin-base=${bindir}"
 
-- 
2.8.1


