Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1QZqMN-0006km-Qv
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jun 2011 22:18:44 +0200
Received: by yxe1 with SMTP id 1so927911yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2011 13:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=nnVqKcWSxxkveDbPrtdfC/fTUe+uEj4FTFDDdAXFllo=;
	b=Yeb3PSvKu2BBBfMZHcTTHlgMk1Bt+C3JsagnG8Np8iVQkifa4xfP6Um3jav6vnXnKG
	DLji4f0sEC4NxUEtC0I1+Xyhjv/a2RIxfqiH9KTiMXb+u1dcMBvZdSHcw8CUDXdM47zw
	q7MrOILymL10/PpyaSSzeNBbzA1/JqmtWJXRQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=FGU8WObFt2NJETR2WKvWf7ACUUQSlBAfK37ZV9zb8NcWydR4QZY/CpLBCw5XZA+8xO
	3N+oecEeTEZxJq+q0MGYnaTDpoA2o7T80ptcqEfoCylNqfXokfaIphA9gC1NJDKAwTYX
	YshzKq4xntHsCV6zth+mx3Yz9N5d4maidOAf4=
Received: by 10.151.13.4 with SMTP id q4mr2942568ybi.102.1308860103818;
	Thu, 23 Jun 2011 13:15:03 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id s4sm612898ybm.4.2011.06.23.13.15.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Jun 2011 13:15:03 -0700 (PDT)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jun 2011 15:12:29 -0500
Message-Id: <1308859949-6219-1-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH 1/1] matrix-gui: update SRCREV to revision 175
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
X-List-Received-Date: Thu, 23 Jun 2011 20:18:44 -0000

* Updated crypto scripts for am3715
* New Camera and multimedia applications for ARM only parts
* Modified power scripts to demonstrate standby
* Soft Ap application
* fix 3D Chameleon man script
* Add USB host side mass storage device benchmarks

Signed-off-by: Jeff Lance <j-lance1@ti.com>
---
 recipes/ti/matrix-gui-common_1.4.bb |    4 ++--
 recipes/ti/matrix-gui-e_1.3.bb      |    4 ++--
 recipes/ti/matrix-gui_1.3.bb        |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes/ti/matrix-gui-common_1.4.bb b/recipes/ti/matrix-gui-common_1.4.bb
index c241e85..868f276 100644
--- a/recipes/ti/matrix-gui-common_1.4.bb
+++ b/recipes/ti/matrix-gui-common_1.4.bb
@@ -4,5 +4,5 @@ require matrix-gui-common.inc
 # prebuilt version in the repository.
 RRECOMMENDS_${PN} = "am-sysinfo"
 
-SRCREV = "265"
-PR = "${INC_PR}.12"
+SRCREV = "275"
+PR = "${INC_PR}.13"
diff --git a/recipes/ti/matrix-gui-e_1.3.bb b/recipes/ti/matrix-gui-e_1.3.bb
index 87a79fb..a86d3ff 100644
--- a/recipes/ti/matrix-gui-e_1.3.bb
+++ b/recipes/ti/matrix-gui-e_1.3.bb
@@ -1,5 +1,5 @@
 require matrix-gui-e.inc
 
-SRCREV = "265"
-PR = "${INC_PR}.11"
+SRCREV = "275"
+PR = "${INC_PR}.12"
 
diff --git a/recipes/ti/matrix-gui_1.3.bb b/recipes/ti/matrix-gui_1.3.bb
index 4dc4021..c82a32e 100644
--- a/recipes/ti/matrix-gui_1.3.bb
+++ b/recipes/ti/matrix-gui_1.3.bb
@@ -1,4 +1,4 @@
 require matrix-gui.inc
 
-SRCREV = "265"
-PR = "${INC_PR}.7"
+SRCREV = "275"
+PR = "${INC_PR}.8"
-- 
1.7.0.4



