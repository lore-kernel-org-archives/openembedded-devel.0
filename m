Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1QMhyz-0002g7-I8
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 May 2011 16:44:17 +0200
Received: by gxk3 with SMTP id 3so602810gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 May 2011 07:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=4hdoJ8qKWtOqku9GWktXGYHaphWljQqUldq9fdE8QHc=;
	b=bb93TnaLBizwRvJhHeQxPplerFUFvNfVJwNRKJpz36jKUqQQnlAdYmKs7rzDZpcuR3
	RN0RCE0qTGh56GHMYnzxKf6fpFulb8hREgVLVeGjgk4XX30HIW6D3Ol+fXvCT74kDwts
	xckzFc0uh+yJeS6XeTqdv/TQZUdmj3hSgWAsE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=RhSE7ByIn800BMaNOSGwf8qG5ARbdGuNuzImeqxMbt7cfcZXehIA/KY1G/0En6VwtR
	7h8M0EXCEn6BYT9KX4DlOHQZ9uhPThc79OyHp4jiBY5RZUXw2JYNMRkNgkD3ibP2xQsX
	ztnjSAPLn0czJGEx45SS2zxBidzostFjOwXoA=
Received: by 10.151.130.7 with SMTP id h7mr1484667ybn.366.1305729681789;
	Wed, 18 May 2011 07:41:21 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id x37sm1143431ana.8.2011.05.18.07.41.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 07:41:20 -0700 (PDT)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 May 2011 10:35:09 -0500
Message-Id: <1305819309-11808-1-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH] matrix_gui: Pull in lmbench,multimedia,EZSDK mods
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
X-List-Received-Date: Wed, 18 May 2011 14:44:17 -0000

* Update SRCREV to pull in:
	* Multimedia apps
        * LMBench apps
        * EZSDK updates
        * remove Blitrix

Signed-off-by: Jeff Lance  <j-lance1@ti.com>
---
 recipes/ti/matrix-gui-common_1.4.bb |    4 ++--
 recipes/ti/matrix-gui-e_1.3.bb      |    4 ++--
 recipes/ti/matrix-gui_1.3.bb        |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes/ti/matrix-gui-common_1.4.bb b/recipes/ti/matrix-gui-common_1.4.bb
index d436044..6f7376d 100644
--- a/recipes/ti/matrix-gui-common_1.4.bb
+++ b/recipes/ti/matrix-gui-common_1.4.bb
@@ -4,5 +4,5 @@ require matrix-gui-common.inc
 # prebuilt version in the repository.
 RRECOMMENDS_${PN} = "am-sysinfo"
 
-SRCREV = "245"
-PR = "${INC_PR}.9"
+SRCREV = "249"
+PR = "${INC_PR}.10"
diff --git a/recipes/ti/matrix-gui-e_1.3.bb b/recipes/ti/matrix-gui-e_1.3.bb
index fb7e4b3..8f2df1c 100644
--- a/recipes/ti/matrix-gui-e_1.3.bb
+++ b/recipes/ti/matrix-gui-e_1.3.bb
@@ -1,5 +1,5 @@
 require matrix-gui-e.inc
 
-SRCREV = "245"
-PR = "${INC_PR}.8"
+SRCREV = "249"
+PR = "${INC_PR}.9"
 
diff --git a/recipes/ti/matrix-gui_1.3.bb b/recipes/ti/matrix-gui_1.3.bb
index 2c38fc3..f7e56a3 100644
--- a/recipes/ti/matrix-gui_1.3.bb
+++ b/recipes/ti/matrix-gui_1.3.bb
@@ -1,4 +1,4 @@
 require matrix-gui.inc
 
-SRCREV = "245"
-PR = "${INC_PR}.4"
+SRCREV = "249"
+PR = "${INC_PR}.5"
-- 
1.7.0.4



