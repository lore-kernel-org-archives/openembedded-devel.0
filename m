Received: from smtp-out01.alice.it ([85.33.2.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1O9Jxb-00035A-ED
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 May 2010 17:23:04 +0200
Received: from FBCMMO05.fbc.local ([192.168.184.136]) by smtp-out01.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 4 May 2010 17:19:09 +0200
Received: from FBCMCL01B07.fbc.local ([192.168.171.45]) by FBCMMO05.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 4 May 2010 17:19:09 +0200
Received: from localhost.localdomain ([87.2.136.88]) by FBCMCL01B07.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 4 May 2010 17:19:07 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 May 2010 17:19:01 +0200
Message-Id: <1272986341-17094-2-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.6.4.4
In-Reply-To: <1272986341-17094-1-git-send-email-GNUtoo@no-log.org>
References: <1272921755-7414-1-git-send-email-eric@eukrea.com>
	<1272986341-17094-1-git-send-email-GNUtoo@no-log.org>
X-OriginalArrivalTime: 04 May 2010 15:19:08.0073 (UTC)
	FILETIME=[240D6190:01CAEB9D]
X-SA-Exim-Connect-IP: 85.33.2.12
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] compat-wireless.inc : fix installation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 May 2010 15:23:06 -0000

using oe_runmake export LDFLAGS which makes the installation fail,
  so we use LDFLAGS="" for the installation

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 recipes/compat-wireless/compat-wireless.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/compat-wireless/compat-wireless.inc b/recipes/compat-wireless/compat-wireless.inc
index 73daeb4..1a3daf7 100644
--- a/recipes/compat-wireless/compat-wireless.inc
+++ b/recipes/compat-wireless/compat-wireless.inc
@@ -24,7 +24,7 @@ do_configure_append() {
 }
 
 do_install() {
-	oe_runmake DEPMOD=echo DESTDIR="${D}" INSTALL_MOD_PATH="${D}" install-modules
+	oe_runmake DEPMOD=echo DESTDIR="${D}" INSTALL_MOD_PATH="${D}" LDFLAGS="" install-modules
 }
 
 SRC_URI[md5sum] = "371e6fe12a0a8435e33061158c329a2e"
-- 
1.6.4.4



