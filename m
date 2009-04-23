Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Lx1tF-0001Ik-MV
	for openembedded-devel@openembedded.org; Thu, 23 Apr 2009 18:35:11 +0200
Received: (qmail 21873 invoked by uid 813007); 23 Apr 2009 16:30:30 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 23 Apr 2009 16:30:30 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Apr 2009 18:30:30 +0200
Message-Id: <1240504230-9936-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.rc0
Cc: Marcin Juszkiewicz <hrw@openembedded.org>
Subject: [STABLE][PATCH 1/1] task-base: added btusb driver to list of recommended BT drivers
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
X-List-Received-Date: Thu, 23 Apr 2009 16:35:15 -0000

From: Marcin Juszkiewicz <hrw@openembedded.org>

'btusb' driver replaced 'hci-usb' one few kernel releases ago. We recommend
both as some devices use older kernels.

Signed-off-by: Marcin Juszkiewicz <hrw@openembedded.org>
---
 recipes/tasks/task-base.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/tasks/task-base.bb b/recipes/tasks/task-base.bb
index 4003359..66c26af 100644
--- a/recipes/tasks/task-base.bb
+++ b/recipes/tasks/task-base.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Merge machine and distro options to create a basic machine task/package"
-PR = "r80"
+PR = "r83"
 
 inherit task
 
@@ -256,7 +256,7 @@ RRECOMMENDS_task-base-bluetooth = "\
     kernel-module-hidp \
     kernel-module-hci-uart \
     kernel-module-sco \
-    ${@base_contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-hci-usb', '',d)} \
+    ${@base_contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-btusb kernel-module-hci-usb', '',d)} \
     ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-bluetooth3c-cs', '',d)} \
     ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-bluecard-cs', '',d)} \
     ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-bluetoothuart-cs', '',d)} \
-- 
1.6.3.rc0





