Received: from cicero-fbr1.cybercity.dk ([212.242.40.5])
	by linuxtogo.org with esmtp (Exim 4.69) (envelope-from <sgh@sgh.dk>)
	id 1NHl2U-0003qh-Nb for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 22:22:41 +0100
Received: from smtp1.cybercity.dk (smtp1.cybercity.dk [212.242.43.251])
	by cicero-fbr1.cybercity.dk (Postfix) with ESMTP id CD8AA3D279C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Dec 2009 21:43:16 +0100 (CET)
Received: from natla.sgh.dk (0x4dd5bf76.adsl.cybercity.dk [77.213.191.118])
	by smtp1.cybercity.dk (Postfix) with ESMTP id CAA62586855
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Dec 2009 21:46:15 +0100 (CET)
Received: from localhost.localdomain (phoenix.local [192.168.0.226])
	by natla.sgh.dk (Postfix) with ESMTP id 38C9B1248E5;
	Mon,  7 Dec 2009 22:25:49 +0100 (CET)
From: =?utf-8?q?S=C3=B8ren=20Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Dec 2009 21:43:11 +0100
Message-Id: <1260218591-4210-1-git-send-email-sgh@sgh.dk>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 212.242.40.5
X-SA-Exim-Mail-From: sgh@sgh.dk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Unset DEFAUL_PREFERENCE for mesa-dri-7.2 and mesa-dri-7.4
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
X-List-Received-Date: Mon, 07 Dec 2009 21:22:41 -0000

---
 recipes/mesa/mesa-dri_7.2.bb |    2 +-
 recipes/mesa/mesa-dri_7.4.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/mesa/mesa-dri_7.2.bb b/recipes/mesa/mesa-dri_7.2.bb
index 9356843..3030395 100644
--- a/recipes/mesa/mesa-dri_7.2.bb
+++ b/recipes/mesa/mesa-dri_7.2.bb
@@ -9,7 +9,7 @@ PE = "1"
 PR = "${INC_PR}.0"
 
 # most of our targets do not have DRI so will use mesa-xlib
-DEFAULT_PREFERENCE = "-1"
+#DEFAULT_PREFERENCE = "-1"
 
 # ASUS EeePC 901 has DRI support so use mesa-dri by default
 DEFAULT_PREFERENCE_eee901 = "1"
diff --git a/recipes/mesa/mesa-dri_7.4.bb b/recipes/mesa/mesa-dri_7.4.bb
index 9356843..3030395 100644
--- a/recipes/mesa/mesa-dri_7.4.bb
+++ b/recipes/mesa/mesa-dri_7.4.bb
@@ -9,7 +9,7 @@ PE = "1"
 PR = "${INC_PR}.0"
 
 # most of our targets do not have DRI so will use mesa-xlib
-DEFAULT_PREFERENCE = "-1"
+#DEFAULT_PREFERENCE = "-1"
 
 # ASUS EeePC 901 has DRI support so use mesa-dri by default
 DEFAULT_PREFERENCE_eee901 = "1"
-- 
1.6.3.3



