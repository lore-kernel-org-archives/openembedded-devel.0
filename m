Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1QclSg-0006xE-3Z
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jul 2011 23:41:18 +0200
Received: by gxk3 with SMTP id 3so1558526gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jul 2011 14:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Mn+CAZCtQfKlAbiW4WHen5ITaFnkcc+o+CuTslCqaS0=;
	b=bxdVH30n+KQBIordMAqQ0XdTiULVxPwRFDUwGibUtPuvJt+qY9hXPRQjJLJmyzIF1/
	yRZh8EaSm+/t/bjqGrLEiINwLNuy1ntWuN9d9sNmJS/+OCpEvcIRJ1HC3c1sGl7oxNmy
	dXm5S2qcyGa+aamJl01dI6gmeACt4O2gFH6ok=
Received: by 10.236.26.103 with SMTP id b67mr189815yha.331.1309555817039;
	Fri, 01 Jul 2011 14:30:17 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id e24sm2693854yhk.37.2011.07.01.14.30.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jul 2011 14:30:16 -0700 (PDT)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Jul 2011 16:27:59 -0500
Message-Id: <1309555679-501-1-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH v2 1/1] matrix-gui: Update SRCREV to revision 293
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
X-List-Received-Date: Fri, 01 Jul 2011 21:41:18 -0000

* Fix SoftAP scripts
* Fix description pages for multimedia
* remove Wifi from beagleboard

Signed-off-by: Jeff Lance <j-lance1@ti.com>
---
Updated in version 2:
* removed Wifi from beagleboard
* update SRCREV to revsion 293
---
 recipes/ti/matrix-gui-common_1.4.bb |    4 ++--
 recipes/ti/matrix-gui-e_1.3.bb      |    4 ++--
 recipes/ti/matrix-gui_1.3.bb        |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes/ti/matrix-gui-common_1.4.bb b/recipes/ti/matrix-gui-common_1.4.bb
index 8376e17..ee36492 100644
--- a/recipes/ti/matrix-gui-common_1.4.bb
+++ b/recipes/ti/matrix-gui-common_1.4.bb
@@ -4,5 +4,5 @@ require matrix-gui-common.inc
 # prebuilt version in the repository.
 RRECOMMENDS_${PN} = "am-sysinfo"
 
-SRCREV = "290"
-PR = "${INC_PR}.14"
+SRCREV = "293"
+PR = "${INC_PR}.15"
diff --git a/recipes/ti/matrix-gui-e_1.3.bb b/recipes/ti/matrix-gui-e_1.3.bb
index dcad1a6..5dfcf47 100644
--- a/recipes/ti/matrix-gui-e_1.3.bb
+++ b/recipes/ti/matrix-gui-e_1.3.bb
@@ -1,5 +1,5 @@
 require matrix-gui-e.inc
 
-SRCREV = "290"
-PR = "${INC_PR}.13"
+SRCREV = "293"
+PR = "${INC_PR}.14"
 
diff --git a/recipes/ti/matrix-gui_1.3.bb b/recipes/ti/matrix-gui_1.3.bb
index e67115c..8713ffa 100644
--- a/recipes/ti/matrix-gui_1.3.bb
+++ b/recipes/ti/matrix-gui_1.3.bb
@@ -1,4 +1,4 @@
 require matrix-gui.inc
 
-SRCREV = "290"
-PR = "${INC_PR}.9"
+SRCREV = "293"
+PR = "${INC_PR}.10"
-- 
1.7.0.4



