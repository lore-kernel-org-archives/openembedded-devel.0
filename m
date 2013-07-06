Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id 114F8619DD
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Jul 2013 20:31:05 +0000 (UTC)
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 84AAAA61C4;
	Sat,  6 Jul 2013 22:31:01 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Jul 2013 22:30:59 +0200
Message-Id: <1373142659-13482-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] qtbase-native-5.0.2: fix compilation on Fedora 19
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
X-List-Received-Date: Sat, 06 Jul 2013 20:31:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

the patch 0017-Rename-qAbs-Function-for-timeval.patch is also
needed for native else, on Fedora 19, we get :
| ../../include/QtCore/../../../qtbase-opensource-src-5.0.2/src/corelib/global/qglobal.h:483:27: error: from previous declaration 'constexpr T qAbs(const T&) [with T = timeval]'
|  Q_DECL_CONSTEXPR inline T qAbs(const T &t) { return t >= 0 ? t : -t; }

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes-qt/qt5/qtbase-native_5.0.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-qt/qt5/qtbase-native_5.0.2.bb b/recipes-qt/qt5/qtbase-native_5.0.2.bb
index 3df434e..623b17a 100644
--- a/recipes-qt/qt5/qtbase-native_5.0.2.bb
+++ b/recipes-qt/qt5/qtbase-native_5.0.2.bb
@@ -3,5 +3,9 @@ require ${PN}.inc
 
 PR = "${INC_PR}.0"
 
+SRC_URI += " \
+    file://0017-Rename-qAbs-Function-for-timeval.patch \
+"
+
 SRC_URI[md5sum] = "a4fec8ed03867c4ee4fe5a46001a11f0"
 SRC_URI[sha256sum] = "31851ee2f844c100554506a9a446d4b6abb5270bca799c2a683e5f937456a9c8"
-- 
1.8.3.1


