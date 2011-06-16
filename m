Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1QXJyL-0006HZ-09
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Jun 2011 23:19:31 +0200
Received: by ywa12 with SMTP id 12so517597ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jun 2011 14:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=g0VbcD5jVwv+GBuqCVU+/SnpGsoDxRp1o3kqmce3NOA=;
	b=Q9kpujVUAMd2xVaUIA862fBxNl+4ZxX98DylLXgrf/rGSW6zuQrQVsq+p3qCdy3xb1
	mQt0fc3qu21WbRn5lktbo5SU6UC1FrfEswrAQsb1C6GRYwnil2SzfRO7wNECZO7tQCH0
	goj7yY3y+CfhozOP2R0RKZCkX/860uEFheC1E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=yAkxXYWB6n84b9VH05IPH0/kxEG63iky3D+EN7HBoacB1zeU0rzvda9BhTAjEJdI9A
	AkfRuZtEfQqMcA5TZ9DiNtCIpYTf3BhR10CHnf+O1oeUpoEf+2IzEte40r00O/vF2evw
	ZQk0900lgost8RIhAVMI4leLHqtN7B08TDTjc=
Received: by 10.151.68.20 with SMTP id v20mr1681351ybk.65.1308258958363;
	Thu, 16 Jun 2011 14:15:58 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id t4sm474336ybe.27.2011.06.16.14.15.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Jun 2011 14:15:57 -0700 (PDT)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Jun 2011 16:13:08 -0500
Message-Id: <1308258789-9959-1-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH 1/2] matrix_gui: Update SRCREV to revision 265
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
X-List-Received-Date: Thu, 16 Jun 2011 21:19:31 -0000

* ti816x - Rework runOMTB script
* am3517 - Remove Can and WIFI apps
* am3715 - Add four new power apps
* Add Oprofile apps to all am platforms
* Remove LMBench app "write throughput" from all am platforms
* Add beagle board platform support

Signed-off-by: Jeff Lance <j-lance1@ti.com>
---
 recipes/ti/matrix-gui-common_1.4.bb |    4 ++--
 recipes/ti/matrix-gui-e_1.3.bb      |    4 ++--
 recipes/ti/matrix-gui_1.3.bb        |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes/ti/matrix-gui-common_1.4.bb b/recipes/ti/matrix-gui-common_1.4.bb
index 0b4b25b..c241e85 100644
--- a/recipes/ti/matrix-gui-common_1.4.bb
+++ b/recipes/ti/matrix-gui-common_1.4.bb
@@ -4,5 +4,5 @@ require matrix-gui-common.inc
 # prebuilt version in the repository.
 RRECOMMENDS_${PN} = "am-sysinfo"
 
-SRCREV = "257"
-PR = "${INC_PR}.11"
+SRCREV = "265"
+PR = "${INC_PR}.12"
diff --git a/recipes/ti/matrix-gui-e_1.3.bb b/recipes/ti/matrix-gui-e_1.3.bb
index a6eb17f..87a79fb 100644
--- a/recipes/ti/matrix-gui-e_1.3.bb
+++ b/recipes/ti/matrix-gui-e_1.3.bb
@@ -1,5 +1,5 @@
 require matrix-gui-e.inc
 
-SRCREV = "257"
-PR = "${INC_PR}.10"
+SRCREV = "265"
+PR = "${INC_PR}.11"
 
diff --git a/recipes/ti/matrix-gui_1.3.bb b/recipes/ti/matrix-gui_1.3.bb
index 51678df..4dc4021 100644
--- a/recipes/ti/matrix-gui_1.3.bb
+++ b/recipes/ti/matrix-gui_1.3.bb
@@ -1,4 +1,4 @@
 require matrix-gui.inc
 
-SRCREV = "257"
-PR = "${INC_PR}.6"
+SRCREV = "265"
+PR = "${INC_PR}.7"
-- 
1.7.0.4



