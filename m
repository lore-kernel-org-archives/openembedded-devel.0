Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id 380316CE5C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 08:46:50 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 89699A62F2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 10:46:48 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2013 10:46:12 +0200
Message-Id: <1381221981-1585-12-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1381221981-1585-1-git-send-email-eric@eukrea.com>
References: <1381221981-1585-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [PATCH 12/21] qtsystems: doesn't depends on qtjsondb
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
X-List-Received-Date: Tue, 08 Oct 2013 08:46:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes-qt/qt5/qtsystems.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtsystems.inc b/recipes-qt/qt5/qtsystems.inc
index f7672b1..8b2a770 100644
--- a/recipes-qt/qt5/qtsystems.inc
+++ b/recipes-qt/qt5/qtsystems.inc
@@ -1,6 +1,6 @@
 require qt5.inc
 
-DEPENDS += "qtbase qtdeclarative qtjsondb udev bluez4 gconf" 
+DEPENDS += "qtbase qtdeclarative udev bluez4 gconf"
 
 LICENSE = "BSD & LGPL-2.1 & GFDL-1.3"
 # LICENSE files are missing in 5.0.0
-- 
1.8.4.rc3


