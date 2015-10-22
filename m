Return-Path: <mail@webthatworks.it>
Received: from smtp205.alice.it (smtp205.alice.it [82.57.200.101])
	by mail.openembedded.org (Postfix) with ESMTP id 3988060657
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 17:57:18 +0000 (UTC)
Received: from caronte.home.webthatworks.it (87.9.24.216) by smtp205.alice.it
	(8.6.060.28) id 55F97357084836EA; Thu, 22 Oct 2015 19:57:17 +0200
Received: from gloom.home.webthatworks.it (gloom.home.webthatworks.it
	[192.168.1.14])
	by caronte.home.webthatworks.it (Postfix) with ESMTP id 36AD46FE0059;
	Thu, 22 Oct 2015 19:57:17 +0200 (CEST)
Received: by gloom.home.webthatworks.it (Postfix, from userid 1000)
	id C96245E0CC6; Thu, 22 Oct 2015 19:56:15 +0200 (CEST)
From: Ivan Sergio Borgonovo <mail@webthatworks.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Oct 2015 19:56:08 +0200
Message-Id: <1445536568-13948-2-git-send-email-mail@webthatworks.it>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <1445536568-13948-1-git-send-email-mail@webthatworks.it>
References: <1445536568-13948-1-git-send-email-mail@webthatworks.it>
Subject: [meta-qt5][PATCH 2/2] move qttools-plugins to RRECOMENDS since it's built just with examples
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
X-List-Received-Date: Thu, 22 Oct 2015 17:57:19 -0000

qttools-plugins contains just example plugins for qtcreator and get
built just with examples. A working qt5 toolchain doesn't really
require it
---
 recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
index 37e9649..30d0622 100644
--- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
+++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
@@ -92,7 +92,6 @@ RDEPENDS_${PN} += " \
     ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtsystems-qmlplugins', '', d)} \
     qttools-dev \
     qttools-mkspecs \
-    qttools-plugins \
     qttools-staticdev \
     qttools-tools \
     ${@base_contains('DISTRO_FEATURES', 'wayland', '${USE_WAYLAND}', '', d)} \
@@ -112,4 +111,5 @@ RDEPENDS_${PN} += " \
 
 RRECOMMENDS_${PN} += " \
     qtquickcontrols-qmlplugins \
+    qttools-plugins \
 "
-- 
2.6.1


