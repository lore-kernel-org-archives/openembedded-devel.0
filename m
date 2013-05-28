Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id AD40B6A537
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 13:24:06 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 1F1974B0130
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 15:24:02 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 May 2013 15:24:42 +0200
Message-Id: <1369747482-29077-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1369747482-29077-1-git-send-email-eric@eukrea.com>
References: <1369747482-29077-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 2/2] qtjsbackend: hardfloat patch is only needed for 5.0.2
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
X-List-Received-Date: Tue, 28 May 2013 13:24:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes-qt/qt5/qtjsbackend.inc      |    1 -
 recipes-qt/qt5/qtjsbackend_5.0.2.bb |    4 ++++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtjsbackend.inc b/recipes-qt/qt5/qtjsbackend.inc
index a0dc632..4479654 100644
--- a/recipes-qt/qt5/qtjsbackend.inc
+++ b/recipes-qt/qt5/qtjsbackend.inc
@@ -13,5 +13,4 @@ INC_PR = "r0"
 
 SRC_URI += " \
     file://0002-v8.pro-respect-external-host-bindir-when-set.patch \
-    file://0001-Fix-hardfloat-detection.patch \
 "
diff --git a/recipes-qt/qt5/qtjsbackend_5.0.2.bb b/recipes-qt/qt5/qtjsbackend_5.0.2.bb
index 9dcbcc0..0f8638e 100644
--- a/recipes-qt/qt5/qtjsbackend_5.0.2.bb
+++ b/recipes-qt/qt5/qtjsbackend_5.0.2.bb
@@ -3,5 +3,9 @@ require ${PN}.inc
 
 PR = "${INC_PR}.0"
 
+SRC_URI += " \
+    file://0001-Fix-hardfloat-detection.patch \
+    "
+
 SRC_URI[md5sum] = "610f011757755888153cb2004c04446f"
 SRC_URI[sha256sum] = "65071ab9ab7d9024b7ba6d128a1c97ac09cf1b37818affb4238e4ba7d6665cc0"
-- 
1.7.10.4


