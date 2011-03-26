Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1Q3Dqm-0004fY-C1
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Mar 2011 21:43:16 +0100
Received: by gwb11 with SMTP id 11so678876gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Mar 2011 13:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=K/hq0FOUeXjqTqTFSwUPm/EaTr5o8DRyX4aaJl/sZV8=;
	b=uX6Uns7wAui6ylr4FUj0G7p+JdIEfZY/V8qfjScC8LXq3R2YVhjBKX6RFgXfKYaQwM
	DW4viFxFfSgaPU6kPwNdqAOPhiN1vtLMuixnOij2s/1is29tk2WzerPkUh1v5sdeQVod
	GCthcWZYSFdf2oEo2b6B6hlN28sNo1FlgZZ24=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=dwm2mH3pPdqShYUEY5qtui3Yq5be/OQ1GEjJBpGTx2fClgF+HVsY/N7z21enWRt1L7
	PYmZi8MKfTqagKP6bxmGxuNX7rpuDYW0zFmH5GvqVTD/GiutRINmAvxrN2WEgAIkDNVu
	n4goKyZUdWTaaPmZUQQ6NiPEuSUkr9z4MZVh4=
Received: by 10.236.195.38 with SMTP id o26mr1751631yhn.320.1301085676799;
	Fri, 25 Mar 2011 13:41:16 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id l30sm664621yhn.96.2011.03.25.13.41.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 Mar 2011 13:41:16 -0700 (PDT)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2011 15:38:48 -0500
Message-Id: <1301171928-21588-1-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.6.3.3
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
X-List-Received-Date: Fri, 25 Mar 2011 20:43:16 -0000

* Bump up SRCREV to bring in mods on am180x and other platforms
	* am180x: Automated Wifi
	* am181x, am180x, omap-l138, dm368: Removing TI SVG icons as they were found to slow down update performance
	* am180x: Fixing PRU EDMA example
        * pulling in addtional mods from other platforms
		* omap-l138
                * dm368
                * dm3730
                * ti814x
                * ti816x

Signed-off-by: Jeff Lance  <j-lance1@ti.com>
---
 recipes/ti/matrix-gui-common_1.4.bb |    4 ++--
 recipes/ti/matrix-gui-e_1.3.bb      |    4 ++--
 recipes/ti/matrix-gui_1.3.bb        |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes/ti/matrix-gui-common_1.4.bb b/recipes/ti/matrix-gui-common_1.4.bb
index 609a16a..29d6b3e 100644
--- a/recipes/ti/matrix-gui-common_1.4.bb
+++ b/recipes/ti/matrix-gui-common_1.4.bb
@@ -4,5 +4,5 @@ require matrix-gui-common.inc
 # prebuilt version in the repository.
 RRECOMMENDS_${PN} = "am-sysinfo"
 
-SRCREV = "222"
-PR = "${INC_PR}.6"
+SRCREV = "242"
+PR = "${INC_PR}.7"
diff --git a/recipes/ti/matrix-gui-e_1.3.bb b/recipes/ti/matrix-gui-e_1.3.bb
index c75470b..00aeb42 100644
--- a/recipes/ti/matrix-gui-e_1.3.bb
+++ b/recipes/ti/matrix-gui-e_1.3.bb
@@ -1,5 +1,5 @@
 require matrix-gui-e.inc
 
-SRCREV = "222"
-PR = "${INC_PR}.5"
+SRCREV = "242"
+PR = "${INC_PR}.6"
 
diff --git a/recipes/ti/matrix-gui_1.3.bb b/recipes/ti/matrix-gui_1.3.bb
index 98a03b4..ddcb15a 100644
--- a/recipes/ti/matrix-gui_1.3.bb
+++ b/recipes/ti/matrix-gui_1.3.bb
@@ -1,4 +1,4 @@
 require matrix-gui.inc
 
-SRCREV = "222"
-PR = "${INC_PR}.1"
+SRCREV = "242"
+PR = "${INC_PR}.2"
-- 
1.6.3.3



