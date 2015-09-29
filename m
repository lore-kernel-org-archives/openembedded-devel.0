Return-Path: <maciej.borzecki@open-rnd.pl>
X-Greylist: delayed 599 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 29 Sep 2015 16:25:18 UTC
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 2544F76AC4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Sep 2015 16:25:18 +0000 (UTC)
Received: from localhost.localdomain (unknown [31.182.60.238])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 5340642652C;
	Tue, 29 Sep 2015 18:15:18 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-devel@lists.openembedded.org,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 29 Sep 2015 18:15:10 +0200
Message-Id: <1443543310-6137-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.3
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [meta-oe][PATCH] networkmanager: fix installed-vs-shipped warning
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
X-List-Received-Date: Tue, 29 Sep 2015 16:25:19 -0000

Package QA complains about these files being installed but not shipped:
  /run
  /run/NetworkManager

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
---
 meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb
index 62debe952fc4728349960c8e4885c2e5df3154b0..67639fc02103656279928ef84ca5bf6668f7e6c9 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb
@@ -84,3 +84,7 @@ FILES_${PN}-tests = " \
 FILES_${PN}-bash-completion = "${datadir}/bash-completion"
 
 SYSTEMD_SERVICE_${PN} = "NetworkManager.service"
+
+do_install_append() {
+    rm -rf ${D}/run ${D}${localstatedir}/run
+}
-- 
1.9.3


