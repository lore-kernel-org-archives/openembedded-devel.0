Return-Path: <eric@eukrea.com>
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	by mail.openembedded.org (Postfix) with ESMTP id 4D97E60FCA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Oct 2013 23:32:12 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp1-g21.free.fr (Postfix) with ESMTP id 5E6C99400F7;
	Tue,  8 Oct 2013 01:32:09 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2013 01:32:01 +0200
Message-Id: <1381188738-29468-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.4.rc3
MIME-Version: 1.0
Subject: [PATCH 01/18] qtgraphicaleffects: allow empty package
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
X-List-Received-Date: Mon, 07 Oct 2013 23:32:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

else populatesdk will fail because qtgraphicaleffects-dev can't
find qtgraphicaleffects

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes-qt/qt5/qtgraphicaleffects.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-qt/qt5/qtgraphicaleffects.inc b/recipes-qt/qt5/qtgraphicaleffects.inc
index 63e884e..06b5350 100644
--- a/recipes-qt/qt5/qtgraphicaleffects.inc
+++ b/recipes-qt/qt5/qtgraphicaleffects.inc
@@ -1,3 +1,5 @@
 require qt5.inc
 
 DEPENDS += "qtdeclarative"
+
+ALLOW_EMPTY_${PN} = "1"
-- 
1.8.4.rc3


