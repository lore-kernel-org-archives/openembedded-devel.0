Return-Path: <fabien.lahoudere@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id E81B377EE4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 12:50:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: aragua) with ESMTPSA id 8524D26D057
From: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Sep 2017 14:50:09 +0200
Message-Id: <20170911125009.9837-1-fabien.lahoudere@collabora.co.uk>
X-Mailer: git-send-email 2.11.0
Subject: [meta-multimedia][PATCH v2] libupnp: Bump to version 1.8.2
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
X-List-Received-Date: Mon, 11 Sep 2017 12:50:19 -0000

Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
---
 .../libupnp/libupnp/sepbuildfix.patch              | 34 ----------------------
 .../{libupnp_1.6.21.bb => libupnp_1.8.2.bb}        | 12 ++++----
 2 files changed, 7 insertions(+), 39 deletions(-)
 delete mode 100644 meta-multimedia/recipes-connectivity/libupnp/libupnp/sepbuildfix.patch
 rename meta-multimedia/recipes-connectivity/libupnp/{libupnp_1.6.21.bb => libupnp_1.8.2.bb} (66%)

diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp/sepbuildfix.patch b/meta-multimedia/recipes-connectivity/libupnp/libupnp/sepbuildfix.patch
deleted file mode 100644
index 0493cea0e..000000000
--- a/meta-multimedia/recipes-connectivity/libupnp/libupnp/sepbuildfix.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From e198f0a87660a048164ca0e16d18517d0aee846e Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <armccurdy@gmail.com>
-Date: Tue, 9 Jun 2015 12:20:45 -0700
-Subject: [PATCH] Fix builds when using separate source and build directories.
-
-Upstream-Status: Pending
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
----
- configure.ac           | 10 +++++-----
- 1 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index a8731b5..54a3c3d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -744,9 +744,9 @@ AC_OUTPUT
- #
- # Files copied for windows compilation.
- #
--echo "configure: copying \"autoconfig.h\"          to \"build/inc/autoconfig.h\""
--test -d build/inc || mkdir -p build/inc
--cp autoconfig.h build/inc/autoconfig.h
--echo "configure: copying \"upnp/inc/upnpconfig.h\" to \"build/inc/upnpconfig.h\""
--cp upnp/inc/upnpconfig.h build/inc/upnpconfig.h
-+echo "configure: copying \"autoconfig.h\"          to \"\$srcdir/build/inc/autoconfig.h\""
-+test -d $srcdir/build/inc || mkdir -p $srcdir/build/inc
-+cp autoconfig.h $srcdir/build/inc/autoconfig.h
-+echo "configure: copying \"upnp/inc/upnpconfig.h\" to \"\$srcdir/build/inc/upnpconfig.h\""
-+cp upnp/inc/upnpconfig.h $srcdir/build/inc/upnpconfig.h
- 
--- 
-1.9.1
-
diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.6.21.bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.8.2.bb
similarity index 66%
rename from meta-multimedia/recipes-connectivity/libupnp/libupnp_1.6.21.bb
rename to meta-multimedia/recipes-connectivity/libupnp/libupnp_1.8.2.bb
index a1988295a..61b209ab8 100644
--- a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.6.21.bb
+++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.8.2.bb
@@ -8,11 +8,13 @@ HOMEPAGE = "http://pupnp.sourceforge.net/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b3190d5244e08e78e4c8ee78544f4863"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/pupnp/${BP}.tar.bz2 \
-           file://sepbuildfix.patch \
-"
+SRC_URI = "https://github.com/mrjimenez/pupnp/archive/release-${PV}.tar.gz "
 
-SRC_URI[md5sum] = "513adadb07fa039a8aeb0ceb7b7b0f6e"
-SRC_URI[sha256sum] = "af3f3c0846a1d75baeadae4aa5a2bda427567e2a1fb4559bf73ccff0a4f9a39b"
+SRC_URI[md5sum] = "db8061f7cbd7f9af993ac4e87ad084cb"
+SRC_URI[sha256sum] = "438ad86bfd933cb1e9be1c41bf3bd69f049daba11d71bbb5d715336e00106cb4"
+
+S="${WORKDIR}/pupnp-release-${PV}"
 
 inherit autotools
+
+EXTRA_OECONF += "--enable-reuseaddr"
\ No newline at end of file
-- 
2.11.0


