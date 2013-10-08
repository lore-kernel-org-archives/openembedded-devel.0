Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id 976F46CF08
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 08:47:46 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp3-g21.free.fr (Postfix) with ESMTP id E20D4A6262
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 10:47:43 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2013 10:47:28 +0200
Message-Id: <1381222066-2737-3-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1381222066-2737-1-git-send-email-eric@eukrea.com>
References: <1381222066-2737-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 03/21] qtjsbackend: update to 5.1.1
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
X-List-Received-Date: Tue, 08 Oct 2013 08:47:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 .../0001-Install-the-mkv8snapshot-tool-to-the-native-side.patch      | 0
 .../0002-v8.pro-respect-external-host-bindir-when-set.patch          | 0
 recipes-qt/qt5/qtjsbackend-native_5.1.0.bb                           | 5 -----
 recipes-qt/qt5/qtjsbackend-native_5.1.1.bb                           | 5 +++++
 recipes-qt/qt5/qtjsbackend_5.1.0.bb                                  | 5 -----
 recipes-qt/qt5/qtjsbackend_5.1.1.bb                                  | 5 +++++
 6 files changed, 10 insertions(+), 10 deletions(-)
 rename recipes-qt/qt5/{qtjsbackend-5.1.0 => qtjsbackend-5.1.1}/0001-Install-the-mkv8snapshot-tool-to-the-native-side.patch (100%)
 rename recipes-qt/qt5/{qtjsbackend-5.1.0 => qtjsbackend-5.1.1}/0002-v8.pro-respect-external-host-bindir-when-set.patch (100%)
 delete mode 100644 recipes-qt/qt5/qtjsbackend-native_5.1.0.bb
 create mode 100644 recipes-qt/qt5/qtjsbackend-native_5.1.1.bb
 delete mode 100644 recipes-qt/qt5/qtjsbackend_5.1.0.bb
 create mode 100644 recipes-qt/qt5/qtjsbackend_5.1.1.bb

diff --git a/recipes-qt/qt5/qtjsbackend-5.1.0/0001-Install-the-mkv8snapshot-tool-to-the-native-side.patch b/recipes-qt/qt5/qtjsbackend-5.1.1/0001-Install-the-mkv8snapshot-tool-to-the-native-side.patch
similarity index 100%
rename from recipes-qt/qt5/qtjsbackend-5.1.0/0001-Install-the-mkv8snapshot-tool-to-the-native-side.patch
rename to recipes-qt/qt5/qtjsbackend-5.1.1/0001-Install-the-mkv8snapshot-tool-to-the-native-side.patch
diff --git a/recipes-qt/qt5/qtjsbackend-5.1.0/0002-v8.pro-respect-external-host-bindir-when-set.patch b/recipes-qt/qt5/qtjsbackend-5.1.1/0002-v8.pro-respect-external-host-bindir-when-set.patch
similarity index 100%
rename from recipes-qt/qt5/qtjsbackend-5.1.0/0002-v8.pro-respect-external-host-bindir-when-set.patch
rename to recipes-qt/qt5/qtjsbackend-5.1.1/0002-v8.pro-respect-external-host-bindir-when-set.patch
diff --git a/recipes-qt/qt5/qtjsbackend-native_5.1.0.bb b/recipes-qt/qt5/qtjsbackend-native_5.1.0.bb
deleted file mode 100644
index fcc7cde..0000000
--- a/recipes-qt/qt5/qtjsbackend-native_5.1.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "bb4a74f3cd1db59274c9f4aaca0912af"
-SRC_URI[sha256sum] = "8df057d527f98b1c2aa2941ff22adaf9b9c6441ea0e6c44f91f49bbcdbab57ce"
diff --git a/recipes-qt/qt5/qtjsbackend-native_5.1.1.bb b/recipes-qt/qt5/qtjsbackend-native_5.1.1.bb
new file mode 100644
index 0000000..aac7b85
--- /dev/null
+++ b/recipes-qt/qt5/qtjsbackend-native_5.1.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "7225169d7d166cc5660384a85e4d4a2f"
+SRC_URI[sha256sum] = "42628eac133738df30e9104c2014eb70478e8fcf2cc86c1f500359c12216b192"
diff --git a/recipes-qt/qt5/qtjsbackend_5.1.0.bb b/recipes-qt/qt5/qtjsbackend_5.1.0.bb
deleted file mode 100644
index fcc7cde..0000000
--- a/recipes-qt/qt5/qtjsbackend_5.1.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "bb4a74f3cd1db59274c9f4aaca0912af"
-SRC_URI[sha256sum] = "8df057d527f98b1c2aa2941ff22adaf9b9c6441ea0e6c44f91f49bbcdbab57ce"
diff --git a/recipes-qt/qt5/qtjsbackend_5.1.1.bb b/recipes-qt/qt5/qtjsbackend_5.1.1.bb
new file mode 100644
index 0000000..aac7b85
--- /dev/null
+++ b/recipes-qt/qt5/qtjsbackend_5.1.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "7225169d7d166cc5660384a85e4d4a2f"
+SRC_URI[sha256sum] = "42628eac133738df30e9104c2014eb70478e8fcf2cc86c1f500359c12216b192"
-- 
1.8.4.rc3


