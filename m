Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id 5F1516A537
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 13:24:02 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 188DB4B006B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 15:23:59 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 May 2013 15:24:41 +0200
Message-Id: <1369747482-29077-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 1/2] qt5: make 5.0.2 the default
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
X-List-Received-Date: Tue, 28 May 2013 13:24:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes-qt/qt5/qt5-5.0.2.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qt5-5.0.2.inc b/recipes-qt/qt5/qt5-5.0.2.inc
index f99809e..303e066 100644
--- a/recipes-qt/qt5/qt5-5.0.2.inc
+++ b/recipes-qt/qt5/qt5-5.0.2.inc
@@ -6,7 +6,7 @@ QT_VERSION ?= "${PV}"
 # it's different for RC versions
 QT_VERSION_DIR ?= "${QT_VERSION}"
 
-DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE = "1"
 
 SRC_URI += " \
     http://releases.qt-project.org/qt5/${QT_VERSION_DIR}/submodules/${QT_MODULE}-opensource-src-${QT_VERSION}.tar.xz \
-- 
1.7.10.4


