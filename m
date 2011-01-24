Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1PhUrY-0006Tr-7v
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 23:26:16 +0100
Received: by yie16 with SMTP id 16so1634260yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 14:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=y+QWfmB7oi5IEuQCky77l35bks+nBIwfXuHzy46Koro=;
	b=f+VGCehPAHcoHxLZTJ12h/kHtUG1KYxs+/QNS5CUr0oZGynaUelg45wZEn8BkTEedC
	XsvUzaFAPydoateZ5MUsZhQr6LRH1E4sKn1fNSF/RGlRNzpmgiZ/Ziyn6w0ZMwuyn5uz
	q6CH0RbQc1ukauwFODKaxJ4ioSh/OppEhoKT0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=drR0zpWGADlQ4CsNFrhgs7HSo07kHwl1l+r9Ow0vTtPZy9NmttRaG0mdk/f7Geflik
	t0ma1I5fBLAgahRDxATe9zyyxfDkzvVrdaUW0CoWP+DejT9lIupTNSUIyhka6RNW9Q7o
	yaJGb5A7Ci3tZvl9wgZWQdETGi7+IBQA/1n4Q=
Received: by 10.100.143.6 with SMTP id q6mr3368423and.3.1295907930205;
	Mon, 24 Jan 2011 14:25:30 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id x31sm16801686ana.29.2011.01.24.14.25.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 24 Jan 2011 14:25:29 -0800 (PST)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jan 2011 16:23:01 -0600
Message-Id: <1295907781-8193-1-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.6.3.3
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH 2/2] matrix-gui: Update to the latest SRCREV
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
X-List-Received-Date: Mon, 24 Jan 2011 22:26:16 -0000

  * update SRCREV to integrate in new platforms am35x, am180x and am181x.
    * Making support files identical across platforms
    * Adding new applications for PRU for am180x.
    * Adding application descriptions.
    * Adding support files updates for CCSv5.
    * Fixing a potential lockup problem when test descripion mode is turned off
    * Fixing a text display issue, where some application text output is not display promptly.

Signed-off-by: Jeff Lance  <j-lance1@ti.com>
---
 recipes/ti/matrix-gui-common_1.4.bb |    4 ++--
 recipes/ti/matrix-gui-e_1.3.bb      |    4 ++--
 recipes/ti/matrix-gui_1.3.bb        |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes/ti/matrix-gui-common_1.4.bb b/recipes/ti/matrix-gui-common_1.4.bb
index c578a47..609a16a 100644
--- a/recipes/ti/matrix-gui-common_1.4.bb
+++ b/recipes/ti/matrix-gui-common_1.4.bb
@@ -4,5 +4,5 @@ require matrix-gui-common.inc
 # prebuilt version in the repository.
 RRECOMMENDS_${PN} = "am-sysinfo"
 
-SRCREV = "192"
-PR = "${INC_PR}.0"
+SRCREV = "222"
+PR = "${INC_PR}.6"
diff --git a/recipes/ti/matrix-gui-e_1.3.bb b/recipes/ti/matrix-gui-e_1.3.bb
index dd1b16b..c75470b 100644
--- a/recipes/ti/matrix-gui-e_1.3.bb
+++ b/recipes/ti/matrix-gui-e_1.3.bb
@@ -1,5 +1,5 @@
 require matrix-gui-e.inc
 
-SRCREV = "192"
-PR = "${INC_PR}.0"
+SRCREV = "222"
+PR = "${INC_PR}.5"
 
diff --git a/recipes/ti/matrix-gui_1.3.bb b/recipes/ti/matrix-gui_1.3.bb
index 53db8af..98a03b4 100644
--- a/recipes/ti/matrix-gui_1.3.bb
+++ b/recipes/ti/matrix-gui_1.3.bb
@@ -1,4 +1,4 @@
 require matrix-gui.inc
 
-SRCREV = "192"
-PR = "${INC_PR}.0"
+SRCREV = "222"
+PR = "${INC_PR}.1"
-- 
1.6.3.3



