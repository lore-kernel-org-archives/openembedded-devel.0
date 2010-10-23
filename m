Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fidencio@profusion.mobi>) id 1P9RlU-000342-8B
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 02:15:17 +0200
Received: by ywa8 with SMTP id 8so1213776ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 17:14:37 -0700 (PDT)
Received: by 10.150.52.3 with SMTP id z3mr7040347ybz.347.1287792877021;
	Fri, 22 Oct 2010 17:14:37 -0700 (PDT)
Received: from localhost.localdomain ([201.82.29.28])
	by mx.google.com with ESMTPS id r29sm216413ybn.10.2010.10.22.17.14.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 Oct 2010 17:14:36 -0700 (PDT)
From: fidencio@profusion.mobi
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Oct 2010 22:14:04 -0200
Message-Id: <4cc228ec.1d8b970a.4cbb.0973@mx.google.com>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <y>
References: <y>
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fidencio@profusion.mobi
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/4] Lightmediascanner: Add recipe for 0.4.0 release
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
X-List-Received-Date: Sat, 23 Oct 2010 00:15:21 -0000

From: Eduardo Lima (Etrunko) <eblima@gmail.com>

Also update 0.2.0 recipe to use lightmediascanner.inc

Signed-off-by: Eduardo Lima (Etrunko) <eblima@gmail.com>
---
 recipes/lightmediascanner/lightmediascanner.inc    |   21 ++++++++++++++++++++
 .../lightmediascanner/lightmediascanner_0.2.0.0.bb |   11 +---------
 .../lightmediascanner/lightmediascanner_0.4.0.0.bb |    6 +++++
 3 files changed, 28 insertions(+), 10 deletions(-)
 create mode 100644 recipes/lightmediascanner/lightmediascanner.inc
 create mode 100644 recipes/lightmediascanner/lightmediascanner_0.4.0.0.bb

diff --git a/recipes/lightmediascanner/lightmediascanner.inc b/recipes/lightmediascanner/lightmediascanner.inc
new file mode 100644
index 0000000..9ba7a01
--- /dev/null
+++ b/recipes/lightmediascanner/lightmediascanner.inc
@@ -0,0 +1,21 @@
+DESCRIPTION = "Lightweight media scanner meant to be used in not-so-powerful devices"
+SECTION = "libs/multimedia"
+AUTHOR = "INdT / ProFUSION"
+LICENSE = "LGPL"
+DEPENDS += "sqlite3 libogg libvorbis flac"
+# DEPENDS += "mpeg4ip"
+
+PE = "1"
+RDEPENDS_${PN} += "glibc-gconv-utf-16 \
+             glibc-gconv \
+             "
+RPROVIDES_${PN} += "liblightmediascanner"
+
+inherit autotools pkgconfig
+
+FILES_${PN}-dbg += "${libdir}/${PN}/plugins/.debug"
+
+do_stage() {
+	autotools_stage_all
+}
+
diff --git a/recipes/lightmediascanner/lightmediascanner_0.2.0.0.bb b/recipes/lightmediascanner/lightmediascanner_0.2.0.0.bb
index cbb8f4b..f9ffbaf 100644
--- a/recipes/lightmediascanner/lightmediascanner_0.2.0.0.bb
+++ b/recipes/lightmediascanner/lightmediascanner_0.2.0.0.bb
@@ -1,15 +1,6 @@
-DESCRIPTION = "Lightweight media scanner meant to be used in not-so-powerful devices"
-SECTION = "libs/multimedia"
-AUTHOR = "Profusion"
-LICENSE = "LGPL"
-DEPENDS = "sqlite3"
-PE = "1"
+require lightmediascanner.inc
 
 SRC_URI = "https://garage.maemo.org/frs/download.php/4626/lightmediascanner-0.2.0.0.tar.bz2"
 
-inherit autotools pkgconfig
-
-FILES_${PN}-dbg += "${libdir}/${PN}/plugins/.debug"
-
 SRC_URI[md5sum] = "ee1494b6dff3a50be64a3266819056d5"
 SRC_URI[sha256sum] = "98f980e8971fa4d04a589215c3b90d2eaf317ed70fd0d4988089e0fe5808c853"
diff --git a/recipes/lightmediascanner/lightmediascanner_0.4.0.0.bb b/recipes/lightmediascanner/lightmediascanner_0.4.0.0.bb
new file mode 100644
index 0000000..24b67cb
--- /dev/null
+++ b/recipes/lightmediascanner/lightmediascanner_0.4.0.0.bb
@@ -0,0 +1,6 @@
+require lightmediascanner.inc
+
+SRC_URI = "https://garage.maemo.org/frs/download.php/8497/lightmediascanner-0.4.0.0.tar.bz2"
+
+SRC_URI[md5sum] = "a302107cb17fc0c8fb7c8fe42b4a92f1"
+SRC_URI[sha256sum] = "718965779f43796fa76ffdf36b90a138725bc69c20013d75e8dc7291a939dcb2"
-- 
1.7.3.1



