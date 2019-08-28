Return-Path: <Daniel.Klauer@gin.de>
X-Greylist: delayed 1790 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 28 Aug 2019 13:13:51 UTC
Received: from good-out-33.clustermail.de (good-out-33.clustermail.de
	[212.223.166.11])
	by mail.openembedded.org (Postfix) with ESMTP id E185F7D718
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 13:13:51 +0000 (UTC)
Received: from [10.0.0.7] (helo=frontend.clustermail.de)
	by smtpout-03.clustermail.de with esmtp (Exim 4.92)
	(envelope-from <Daniel.Klauer@gin.de>) id 1i2xIq-0003aM-Rc
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Aug 2019 14:44:02 +0200
Received: from [217.6.33.237] (helo=Win2012-02.gin-domain.local)
	by frontend.clustermail.de with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-SHA:256) (Exim 4.92)
	(envelope-from <Daniel.Klauer@gin.de>) id 1i2xIq-0007Ol-Op
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Aug 2019 14:43:56 +0200
Received: from daniel-desktop.gin-domain.local (10.160.138.39) by
	Win2012-02.gin-domain.local (192.168.1.12) with Microsoft SMTP Server
	(TLS) id 15.0.1395.4; Wed, 28 Aug 2019 14:43:56 +0200
From: Daniel Klauer <daniel.klauer@gin.de>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Aug 2019 14:43:35 +0200
Message-ID: <20190828124335.1240-1-daniel.klauer@gin.de>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.160.138.39]
X-ClientProxiedBy: Win2012-02.gin-domain.local (192.168.1.12) To
	Win2012-02.gin-domain.local (192.168.1.12)
Subject: [meta-oe][PATCH] sjf2410-linux-native: Fix do_deploy sstate caching
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Aug 2019 13:13:53 -0000
Content-Type: text/plain

deploy.bbclass requires do_deploy to copy files to DEPLOYDIR (sstate
input dir) instead of DEPLOY_DIR_TOOLS (sstate output dir), otherwise
the sstate caching does not work.

Signed-off-by: Daniel Klauer <daniel.klauer@gin.de>
---
 .../samsung-soc-utils/sjf2410-linux-native_svn.bb              | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb b/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb
index c56c8b9dd..9e609c4dd 100644
--- a/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb
+++ b/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb
@@ -27,8 +27,7 @@ do_install() {
 }
 
 do_deploy() {
-    install -d ${DEPLOY_DIR_TOOLS}
-    install -m 0755 sjf2410 ${DEPLOY_DIR_TOOLS}/sjf2410-${PV}
+    install -m 0755 sjf2410 ${DEPLOYDIR}/sjf2410-${PV}
 }
 
 addtask deploy before do_build after do_install
-- 
2.17.1


