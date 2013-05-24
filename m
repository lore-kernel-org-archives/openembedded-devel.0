Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id BC8CC61A4A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2013 09:44:08 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id A94954B0185;
	Fri, 24 May 2013 11:44:04 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 May 2013 11:44:37 +0200
Message-Id: <1369388677-15423-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1369388677-15423-1-git-send-email-eric@eukrea.com>
References: <1369388677-15423-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 2/2] qtbase: add 0004-Disable-mkv8snapshot.patch to 5.0.1
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
X-List-Received-Date: Fri, 24 May 2013 09:44:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

else qml application segfault.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes-qt/qt5/qtbase_5.0.1.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-qt/qt5/qtbase_5.0.1.bb b/recipes-qt/qt5/qtbase_5.0.1.bb
index 2dce2c1..dfcb742 100644
--- a/recipes-qt/qt5/qtbase_5.0.1.bb
+++ b/recipes-qt/qt5/qtbase_5.0.1.bb
@@ -3,5 +3,7 @@ require ${PN}.inc
 
 PR = "${INC_PR}.0"
 
+SRC_URI += "file://0004-Disable-mkv8snapshot.patch"
+
 SRC_URI[md5sum] = "720e5061d75913dfa97bf8bef4a443df"
 SRC_URI[sha256sum] = "6f8a0489eb057f6cba5e77cabaec13dcd010da562b3b88f91fe960022d7c37c8"
-- 
1.7.10.4


