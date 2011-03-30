Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1Q4zqk-0004xn-4B
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Mar 2011 20:10:34 +0200
Received: by yia13 with SMTP id 13so647355yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2011 11:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=YImqp4pELIPGlA8RGZLIWS7tnMEsuQycoyujwAgQs0w=;
	b=qfplysMgRAbtV7VB0iyKBoGMQKHJB7Kwq3bOTtav78Rs+tTWpI2Y+1KYMvSeTUYk0I
	xkS+zA/Ih1NhdWdSXM1vxX7COHfY5lzgLHBiWkDOu2sf7pVyz6MGJff6GshIW55k7UzP
	23J+2dDzm2wip6k++/J7H0VyybNeRYRpvChVU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=v6u5ek+XqEdMCJRpA0f1EtGfzj+8dSGIazt/gnoT6YtWFQel8RidqKvht9C5+let5E
	ebslVFB48NPfNsFLlocUKB1NlvO2uLy7u8/iSxq9Rhjg5ysi2WpyiDiyJDMeSPVbej+Q
	0gyaE3ZRglMUrtgjsbGtxdj2YoSF8mbMWUeuw=
Received: by 10.91.84.7 with SMTP id m7mr1880568agl.125.1301508514146;
	Wed, 30 Mar 2011 11:08:34 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id x32sm301049ana.38.2011.03.30.11.08.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Mar 2011 11:08:33 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Mar 2011 13:08:11 -0500
Message-Id: <1301508491-3062-6-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1301508491-3062-1-git-send-email-Chase.Maupin@ti.com>
References: <1301508491-3062-1-git-send-email-Chase.Maupin@ti.com>
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 6/6] matrix-gui: Add support for am387x-evm machine
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
X-List-Received-Date: Wed, 30 Mar 2011 18:10:34 -0000

* Add support for the am387x-evm machine type which uses
  SOC_FAMILY ti814x.
* Bump the recipe PRs

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/ti/matrix-gui-common.inc |    5 +++--
 recipes/ti/matrix-gui-e.inc      |    5 +++--
 recipes/ti/matrix-gui.inc        |    5 +++--
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/recipes/ti/matrix-gui-common.inc b/recipes/ti/matrix-gui-common.inc
index 486cb8d..0ed72b5 100644
--- a/recipes/ti/matrix-gui-common.inc
+++ b/recipes/ti/matrix-gui-common.inc
@@ -4,9 +4,9 @@ LICENSE = "BSD"
 SECTION = "multimedia"
 PRIORITY = "optional"
 
-INC_PR = "r8"
+INC_PR = "r9"
 
-COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x)"
+COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x|ti814x)"
 
 PLATFORM_dm365-evm = "dm365"
 PLATFORM_dm368-evm = "dm368"
@@ -16,6 +16,7 @@ PLATFORM_dm37x-evm = "dm3730"
 PLATFORM_am37x-evm = "am3715"
 PLATFORM_beagleboard = "am3715"
 PLATFORM_ti816x = "ti816x"
+PLATFORM_ti814x = "ti814x"
 PLATFORM_am180x-evm = "am180x"
 PLATFORM_am181x-evm = "am181x"
 PLATFORM_am3517-evm = "am3517"
diff --git a/recipes/ti/matrix-gui-e.inc b/recipes/ti/matrix-gui-e.inc
index e19b5b9..7158d90 100644
--- a/recipes/ti/matrix-gui-e.inc
+++ b/recipes/ti/matrix-gui-e.inc
@@ -4,9 +4,9 @@ LICENSE = "BSD"
 SECTION = "multimedia"
 PRIORITY = "optional"
 
-INC_PR = "r22"
+INC_PR = "r23"
 
-COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x)"
+COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x|ti814x)"
 
 PLATFORM_dm365-evm = "dm365"
 PLATFORM_dm368-evm = "dm368"
@@ -16,6 +16,7 @@ PLATFORM_dm37x-evm = "dm3730"
 PLATFORM_am37x-evm = "am3715"
 PLATFORM_beagleboard = "am3715"
 PLATFORM_ti816x = "ti816x"
+PLATFORM_ti814x = "ti814x"
 PLATFORM_am180x-evm = "am180x"
 PLATFORM_am181x-evm = "am181x"
 PLATFORM_am3517-evm = "am3517"
diff --git a/recipes/ti/matrix-gui.inc b/recipes/ti/matrix-gui.inc
index 240e695..3dd0e10 100644
--- a/recipes/ti/matrix-gui.inc
+++ b/recipes/ti/matrix-gui.inc
@@ -4,9 +4,9 @@ LICENSE = "BSD"
 SECTION = "multimedia"
 PRIORITY = "optional"
 
-INC_PR = "r20"
+INC_PR = "r21"
 
-COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x)"
+COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x|ti814x)"
 
 PLATFORM_dm365-evm = "dm365"
 PLATFORM_dm368-evm = "dm368"
@@ -16,6 +16,7 @@ PLATFORM_dm37x-evm = "dm3730"
 PLATFORM_am37x-evm = "am3715"
 PLATFORM_beagleboard = "am3715"
 PLATFORM_ti816x = "ti816x"
+PLATFORM_ti814x = "ti814x"
 PLATFORM_am180x-evm = "am180x"
 PLATFORM_am181x-evm = "am181x"
 PLATFORM_am3517-evm = "am3517"
-- 
1.7.0.4



