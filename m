Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1QeV4T-0006NB-1N
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jul 2011 18:35:29 +0200
Received: by yib18 with SMTP id 18so62498yib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jul 2011 09:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=WgYoK+zqj5+/WF6AcEOQzhokFndjLxPwbSykDlKyxeY=;
	b=tqFkUbAno0C4GmcF58QXO/R15U8NIqBP9IDBju51lVykN8foVy9hQ9mQLHBESbnSKb
	PKAjxaTz+7jReMwvgGOzVXhcVR5XV89I36otGPvm5QY0ckvLMCh6RLKkS9WBsDyv2cJR
	xoRekrxnACDRGoevUnyEdCe8S2mLeIPkzivnc=
Received: by 10.151.87.5 with SMTP id p5mr29524ybl.80.1309969897072;
	Wed, 06 Jul 2011 09:31:37 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id v4sm3311088yhm.62.2011.07.06.09.31.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Jul 2011 09:31:36 -0700 (PDT)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Jul 2011 11:29:29 -0500
Message-Id: <1309969769-16793-1-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH 1/1] matrix-gui: Update SRCREV to revision 295
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
X-List-Received-Date: Wed, 06 Jul 2011 16:35:29 -0000

* beagleboard - Broswer was accidentally removed
* beagleboard - Remove Wifi app and add back browser
* am37x - Add NOTE to connecte imaging daughter card at boot-up

Signed-off-by: Jeff Lance <j-lance1@ti.com>
---
 recipes/ti/matrix-gui-common_1.4.bb |    4 ++--
 recipes/ti/matrix-gui-e_1.3.bb      |    4 ++--
 recipes/ti/matrix-gui_1.3.bb        |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes/ti/matrix-gui-common_1.4.bb b/recipes/ti/matrix-gui-common_1.4.bb
index ee36492..e650e41 100644
--- a/recipes/ti/matrix-gui-common_1.4.bb
+++ b/recipes/ti/matrix-gui-common_1.4.bb
@@ -4,5 +4,5 @@ require matrix-gui-common.inc
 # prebuilt version in the repository.
 RRECOMMENDS_${PN} = "am-sysinfo"
 
-SRCREV = "293"
-PR = "${INC_PR}.15"
+SRCREV = "295"
+PR = "${INC_PR}.16"
diff --git a/recipes/ti/matrix-gui-e_1.3.bb b/recipes/ti/matrix-gui-e_1.3.bb
index 5dfcf47..276793b 100644
--- a/recipes/ti/matrix-gui-e_1.3.bb
+++ b/recipes/ti/matrix-gui-e_1.3.bb
@@ -1,5 +1,5 @@
 require matrix-gui-e.inc
 
-SRCREV = "293"
-PR = "${INC_PR}.14"
+SRCREV = "295"
+PR = "${INC_PR}.15"
 
diff --git a/recipes/ti/matrix-gui_1.3.bb b/recipes/ti/matrix-gui_1.3.bb
index 8713ffa..e020fde 100644
--- a/recipes/ti/matrix-gui_1.3.bb
+++ b/recipes/ti/matrix-gui_1.3.bb
@@ -1,4 +1,4 @@
 require matrix-gui.inc
 
-SRCREV = "293"
-PR = "${INC_PR}.10"
+SRCREV = "295"
+PR = "${INC_PR}.11"
-- 
1.7.0.4



