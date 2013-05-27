Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id 862176A4E5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2013 23:43:27 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id CCDDE4B0045
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 01:43:24 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 May 2013 01:43:50 +0200
Message-Id: <1369698233-4500-5-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1369698233-4500-1-git-send-email-eric@eukrea.com>
References: <1369698233-4500-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 5/8] qtbase-5.0.2: fix v8 and allow build of examples
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
X-List-Received-Date: Mon, 27 May 2013 23:43:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- fix v8 segfault (at least on armv7)
- examples are only provided as sources but in our case, binaries
are more interesting for user to test the features on the target.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 .../0001-qtbase-allow-build-of-examples.patch      |   49 ++++++++++++++++++++
 recipes-qt/qt5/qtbase_5.0.2.bb                     |    4 ++
 2 files changed, 53 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase-5.0.2/0001-qtbase-allow-build-of-examples.patch

diff --git a/recipes-qt/qt5/qtbase-5.0.2/0001-qtbase-allow-build-of-examples.patch b/recipes-qt/qt5/qtbase-5.0.2/0001-qtbase-allow-build-of-examples.patch
new file mode 100644
index 0000000..17b951a
--- /dev/null
+++ b/recipes-qt/qt5/qtbase-5.0.2/0001-qtbase-allow-build-of-examples.patch
@@ -0,0 +1,49 @@
+From 66558b78b5ff8c8ae9fa00a33d1d89285b8e3a00 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
+Date: Sat, 25 May 2013 17:34:32 +0200
+Subject: [PATCH] qtbase: allow build of examples
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+this revert the following commit :
+
+commit 2b397f985e4ef6ae5c0571a928bb1320fb048c61
+Author: Oswald Buddenhagen <oswald.buddenhagen@digia.com>
+Date:   Fri Dec 21 19:36:12 2012 +0100
+
+    do not actually build examples in production builds
+
+    -developer-build enables an actual build of examples, based on the
+    assumption that developers want to test it (it can be still disabled
+    with -nomake examples). regular users otoh want only the examples
+    sources installed.
+
+    Change-Id: Ifc6a108099929175a3960480802b271a758fdd38
+    Reviewed-by: Joerg Bornemann <joerg.bornemann@digia.com>
+
+Signed-off-by: Eric Bénard <eric@eukrea.com>
+---
+ mkspecs/features/qt_example_installs.prf | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/mkspecs/features/qt_example_installs.prf b/mkspecs/features/qt_example_installs.prf
+index 479a16a..ca1b0c7 100644
+--- a/mkspecs/features/qt_example_installs.prf
++++ b/mkspecs/features/qt_example_installs.prf
+@@ -92,12 +92,4 @@ probase = $$relative_path($$_PRO_FILE_PWD_, $$dirname(_QMAKE_CONF_)/examples)
+         allfiles -= doc
+         !isEmpty(allfiles): warning("remaining files in $$_PRO_FILE_PWD_: $$allfiles")
+     }
+-
+-    # Do not actually build the examples in production builds with -prefix
+-    !equals(TEMPLATE, subdirs):prefix_build:!contains(QT_CONFIG, private_tests) {
+-        TEMPLATE = aux
+-        CONFIG -= have_target qt staticlib dll
+-        SOURCES =
+-        INSTALLS -= target
+-    }
+ }
+-- 
+1.8.1.4
+
diff --git a/recipes-qt/qt5/qtbase_5.0.2.bb b/recipes-qt/qt5/qtbase_5.0.2.bb
index 3df434e..357c06e 100644
--- a/recipes-qt/qt5/qtbase_5.0.2.bb
+++ b/recipes-qt/qt5/qtbase_5.0.2.bb
@@ -3,5 +3,9 @@ require ${PN}.inc
 
 PR = "${INC_PR}.0"
 
+SRC_URI += "file://0004-Disable-mkv8snapshot.patch \
+    file://0001-qtbase-allow-build-of-examples.patch \
+    "
+
 SRC_URI[md5sum] = "a4fec8ed03867c4ee4fe5a46001a11f0"
 SRC_URI[sha256sum] = "31851ee2f844c100554506a9a446d4b6abb5270bca799c2a683e5f937456a9c8"
-- 
1.7.10.4


