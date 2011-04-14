Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1QALDS-0008FX-A8
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Apr 2011 14:00:06 +0200
Received: by gyf1 with SMTP id 1so423670gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Apr 2011 04:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=4rQu0p7524JHDsmxc8yPSeCmD2YacWvlbkhcDp8MWzA=;
	b=YuR1+w2qLbVC0l6rSMhXO0BeaneuYjr8TabRtUF+Vg90iH7WT6A+zTVrYOwzfQHn8P
	Te5o6vbRTKjoR0oMoc3bqP27esIhwmqFi/w+ZPU7TwSZlgbkztZmsMS2p/0Pj7f1i0j4
	c6UHHwrFA6fA1ZhKKQeWwMjUq1cqlBeRyqv1w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Sc0OZlpJibVjlK+2BZCkH1DKOhaY0LZoLLg+iI7bzT5b7jSE+HpM8hT+/DAZk/oihn
	HNrnp9pFCXR48MCSewoHLa/Fm60SPNBc6kZm/F4u9MNGPC+cFbVh9sMQGHOnUOXCAF+H
	WRwwqB27k/rCHyGJG+EfdwKTKywY5vohMNVUQ=
Received: by 10.151.92.15 with SMTP id u15mr1446081ybl.220.1302782268354;
	Thu, 14 Apr 2011 04:57:48 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id b3sm1584766ana.50.2011.04.14.04.57.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 14 Apr 2011 04:57:46 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Apr 2011 06:57:42 -0500
Message-Id: <1302782262-22894-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH 1/1] matrix-gui: Bump up SRCREV
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
X-List-Received-Date: Thu, 14 Apr 2011 12:00:06 -0000

From: Jeff Lance <j-lance1@ti.com>

* Bump up SRCREV
  * add am389x platform support
  * am1808 add correct instructions for running profibus demo

Signed-off-by: Jeff Lance   <j-lance1@ti.com>
---
 recipes/ti/matrix-gui-common_1.4.bb |    4 ++--
 recipes/ti/matrix-gui-e_1.3.bb      |    4 ++--
 recipes/ti/matrix-gui_1.3.bb        |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes/ti/matrix-gui-common_1.4.bb b/recipes/ti/matrix-gui-common_1.4.bb
index 04cdb2f..d436044 100644
--- a/recipes/ti/matrix-gui-common_1.4.bb
+++ b/recipes/ti/matrix-gui-common_1.4.bb
@@ -4,5 +4,5 @@ require matrix-gui-common.inc
 # prebuilt version in the repository.
 RRECOMMENDS_${PN} = "am-sysinfo"
 
-SRCREV = "243"
-PR = "${INC_PR}.8"
+SRCREV = "245"
+PR = "${INC_PR}.9"
diff --git a/recipes/ti/matrix-gui-e_1.3.bb b/recipes/ti/matrix-gui-e_1.3.bb
index 4519437..fb7e4b3 100644
--- a/recipes/ti/matrix-gui-e_1.3.bb
+++ b/recipes/ti/matrix-gui-e_1.3.bb
@@ -1,5 +1,5 @@
 require matrix-gui-e.inc
 
-SRCREV = "243"
-PR = "${INC_PR}.7"
+SRCREV = "245"
+PR = "${INC_PR}.8"
 
diff --git a/recipes/ti/matrix-gui_1.3.bb b/recipes/ti/matrix-gui_1.3.bb
index 727aca1..2c38fc3 100644
--- a/recipes/ti/matrix-gui_1.3.bb
+++ b/recipes/ti/matrix-gui_1.3.bb
@@ -1,4 +1,4 @@
 require matrix-gui.inc
 
-SRCREV = "243"
-PR = "${INC_PR}.3"
+SRCREV = "245"
+PR = "${INC_PR}.4"
-- 
1.7.0.4



