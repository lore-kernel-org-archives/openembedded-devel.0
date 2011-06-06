Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1QTcLu-00030Y-QX
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Jun 2011 18:08:30 +0200
Received: by ywg8 with SMTP id 8so1672061ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jun 2011 09:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=doST86XeqWBXhGtIsUyL2HVxZEPerXH+XvoNzdYfRXU=;
	b=ISdmGfOj943Fg1ooBgrMudQEZV4Rd8wuBcLP3mpWxSDNQqf6d+Dhuhf+YK9B8sMYzw
	Txs8cAqAcFYm7aB/emJXNS7v5jCjFOGbJEZymwVN2GAw1i36EGCiXnf6N5L397T+gx7/
	fhzg7+kypbZ4Md/bWWJecD/A9w9fc3J292fnA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=m8vQUAybAVqfm4vPcTD2H07SXD3N6tOvyZ0zBg3H9iC/itIYYdAKSty+SfZQsCv2Hl
	cPjjWkPXkANlgKU1n8fLsFkr9q7sL8bBums83u/8g0NIzzGM9sFsaLV6hE8S0tyyN+t5
	PEMo4VUc90BJPi/y/Q/yeuyVizjBmSMTt9Jsg=
Received: by 10.236.91.116 with SMTP id g80mr6645768yhf.165.1307376313234;
	Mon, 06 Jun 2011 09:05:13 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id 26sm632044yhs.49.2011.06.06.09.05.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Jun 2011 09:05:12 -0700 (PDT)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jun 2011 11:05:04 -0500
Message-Id: <1307376304-16298-1-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH v2 1/1] matrix_gui: Update SRCREV to revision 257
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
X-List-Received-Date: Mon, 06 Jun 2011 16:08:31 -0000

* Adding arm only multimedia apps to am37x
* Wifi updates to am37x, am180x
* Adding to am180x, am37x, am35x, beagle:
  * Oprofile example

Signed-off-by: Jeff Lance <j-lance1@ti.com>
---
Updated in version 2:
  Using -s to add Signed-off-by: line
  removed tabs inside commit message
  made Subject line more descriptive
---
 recipes/ti/matrix-gui-common_1.4.bb |    4 ++--
 recipes/ti/matrix-gui-e_1.3.bb      |    4 ++--
 recipes/ti/matrix-gui_1.3.bb        |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes/ti/matrix-gui-common_1.4.bb b/recipes/ti/matrix-gui-common_1.4.bb
index 6f7376d..0b4b25b 100644
--- a/recipes/ti/matrix-gui-common_1.4.bb
+++ b/recipes/ti/matrix-gui-common_1.4.bb
@@ -4,5 +4,5 @@ require matrix-gui-common.inc
 # prebuilt version in the repository.
 RRECOMMENDS_${PN} = "am-sysinfo"
 
-SRCREV = "249"
-PR = "${INC_PR}.10"
+SRCREV = "257"
+PR = "${INC_PR}.11"
diff --git a/recipes/ti/matrix-gui-e_1.3.bb b/recipes/ti/matrix-gui-e_1.3.bb
index 8f2df1c..a6eb17f 100644
--- a/recipes/ti/matrix-gui-e_1.3.bb
+++ b/recipes/ti/matrix-gui-e_1.3.bb
@@ -1,5 +1,5 @@
 require matrix-gui-e.inc
 
-SRCREV = "249"
-PR = "${INC_PR}.9"
+SRCREV = "257"
+PR = "${INC_PR}.10"
 
diff --git a/recipes/ti/matrix-gui_1.3.bb b/recipes/ti/matrix-gui_1.3.bb
index f7e56a3..51678df 100644
--- a/recipes/ti/matrix-gui_1.3.bb
+++ b/recipes/ti/matrix-gui_1.3.bb
@@ -1,4 +1,4 @@
 require matrix-gui.inc
 
-SRCREV = "249"
-PR = "${INC_PR}.5"
+SRCREV = "257"
+PR = "${INC_PR}.6"
-- 
1.7.0.4



