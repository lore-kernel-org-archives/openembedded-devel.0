Return-Path: <eric@eukrea.com>
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	by mail.openembedded.org (Postfix) with ESMTP id 5F0B26CA74
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Oct 2013 23:33:07 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp1-g21.free.fr (Postfix) with ESMTP id 1EAA294009B;
	Tue,  8 Oct 2013 01:33:04 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2013 01:32:15 +0200
Message-Id: <1381188738-29468-15-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1381188738-29468-1-git-send-email-eric@eukrea.com>
References: <1381188738-29468-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [PATCH 15/18] qtlocation: don't depend on qtjsondb
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
X-List-Received-Date: Mon, 07 Oct 2013 23:33:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

jsondb is not listed a a dependencies on qtlocation in sync.profile
and was removed in more recent versions as qtjsondb is no more
maintained

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes-qt/qt5/qtlocation.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtlocation.inc b/recipes-qt/qt5/qtlocation.inc
index 348ca40..70a4375 100644
--- a/recipes-qt/qt5/qtlocation.inc
+++ b/recipes-qt/qt5/qtlocation.inc
@@ -1,4 +1,4 @@
 require qt5.inc
 
-DEPENDS += "qtbase qt3d qtjsondb"
+DEPENDS += "qtbase qt3d"
 # qtsystems qtmultimedia
-- 
1.8.4.rc3


