Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1QTagT-0007Cn-Kb
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Jun 2011 16:23:48 +0200
Received: by gxk3 with SMTP id 3so708719gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jun 2011 07:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=QC40FvA3muhDzzdQO5wZsrDUBcvKqJMbabrP8P5udCc=;
	b=uD4o/1yk3A2EmYC6A3wOXmjf9SrRIPimCzeyEJw1niLeoofIrBtR1KJZV0FT/m6A/E
	yJ3symGdkLV7fEiR6f5u1y8qakSvBjsT0qRYCGOwLxdfnHliFxkZQNtmZt+UEQgq+S/B
	vLs7mp7/JG9HrLpt87ZgZqlUWQaNpc+pdm0WQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Y5XmL6LH0unvuE4YpQENPd8ogIOOGnW/E8caajttAb8oN7l0toxE0vVR5QSLReCfyg
	o5b/RWAZWrFSdMg76LFMxytgZBvv86jjvL9PkDtEjXiKvGFVGQ3+E/Kupmq7CvtbHIn0
	fTinSjsMEteEM0LV/+Sp9wcAkaJqjcRvyLehE=
Received: by 10.236.26.67 with SMTP id b43mr6455377yha.219.1307369752314;
	Mon, 06 Jun 2011 07:15:52 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id c63sm3238275yhe.74.2011.06.06.07.15.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Jun 2011 07:15:50 -0700 (PDT)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jun 2011 09:15:43 -0500
Message-Id: <1307369743-14738-1-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH 1/1] matrix_gui: Update SRCREV
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
X-List-Received-Date: Mon, 06 Jun 2011 14:23:48 -0000

	* Adding arm only multimedia apps to am37x
	* Wifi updates to am37x, am180x
	* Adding to am180x, am37x, am35x, beagle:
		* Oprofile example

Signed-off-by  Jeff Lance   <j-lance1@ti.com>
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



