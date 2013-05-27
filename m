Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id 174496A428
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2013 23:43:24 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 6DB184B0024
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 01:43:21 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 May 2013 01:43:49 +0200
Message-Id: <1369698233-4500-4-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1369698233-4500-1-git-send-email-eric@eukrea.com>
References: <1369698233-4500-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 4/8] qtbase: remove non existing parts
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
X-List-Received-Date: Mon, 27 May 2013 23:43:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

make/nomake demos doesn't exist in qt5.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes-qt/qt5/qtbase-native.inc |    1 -
 recipes-qt/qt5/qtbase.inc        |    2 --
 2 files changed, 3 deletions(-)

diff --git a/recipes-qt/qt5/qtbase-native.inc b/recipes-qt/qt5/qtbase-native.inc
index c742858..b50d446 100644
--- a/recipes-qt/qt5/qtbase-native.inc
+++ b/recipes-qt/qt5/qtbase-native.inc
@@ -69,7 +69,6 @@ EXTRA_OECONF = " \
     -silent \
     -nomake examples \
     -nomake tests \
-    -nomake demos \
     -no-rpath \
     -platform linux-oe-g++ \
 "
diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index cabe0b7..81cc2e1 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -52,7 +52,6 @@ QT_STL ?= "-stl"
 QT_SYSTEM_LIBS ?= "-system-libjpeg -system-libpng -system-zlib"
 QT_TESTS ?= "-nomake tests"
 QT_EXAMPLES ?= "-nomake examples"
-QT_DEMOS ?= "-nomake demos"
 QT_RELEASE ?= "-release"
 
 QT_CONFIG_FLAGS += " \
@@ -73,7 +72,6 @@ QT_CONFIG_FLAGS += " \
     ${QT_GLFLAGS} \
     ${QT_TESTS} \
     ${QT_EXAMPLES} \
-    ${QT_DEMOS} \
 "
 
 INC_PR = "r1"
-- 
1.7.10.4


