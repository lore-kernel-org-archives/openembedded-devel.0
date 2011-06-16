Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1QXJyK-0006HY-ML
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Jun 2011 23:19:28 +0200
Received: by gyd5 with SMTP id 5so467983gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jun 2011 14:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=bugh1bU33TflWfCCRPhg2DJz1mcbwaeRJ2QIkTEnSMI=;
	b=DdW2LPxv7zDiv2mJWoFSXjxHZSFhaySaAH0UAYu9st+HAy82Hw2JK57qrLp6kvZZuP
	kW+f3yurmHf8ie6LfPzAOINEtqz81IIE2veTsOUat6SGVsm92A6GmefTbckRy2OVOla0
	3+Je/9+cMIJL7NVx08TUlosmYAYKEB7QGJDIc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Rb7Obj6k3q5/XjEiDwNzxD5PgK2ZVK9j8cI/xk+xCgD4uQBbjXRaGEe8lsf/YwcYiz
	xSCbe8VPt/WRdqa2NfpqKD4nYA9vvlybV3bnmOR/WAPJWBTLXbo46hLXVQV6IiiYXfPJ
	No9hZmZLVF8hT8PXelZfCZi1sZQ+Kugs3fSAI=
Received: by 10.150.48.16 with SMTP id v16mr1569984ybv.421.1308258960338;
	Thu, 16 Jun 2011 14:16:00 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id t4sm474336ybe.27.2011.06.16.14.15.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Jun 2011 14:15:59 -0700 (PDT)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Jun 2011 16:13:09 -0500
Message-Id: <1308258789-9959-2-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1308258789-9959-1-git-send-email-j-lance1@ti.com>
References: <1308258789-9959-1-git-send-email-j-lance1@ti.com>
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH 2/2] matrix_gui: Add beagleboard platform support
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

* Previously beagleboard was using the am3715 support files

Signed-off-by: Jeff Lance <j-lance1@ti.com>
---
 recipes/ti/matrix-gui-common.inc |    4 ++--
 recipes/ti/matrix-gui-e.inc      |    4 ++--
 recipes/ti/matrix-gui.inc        |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes/ti/matrix-gui-common.inc b/recipes/ti/matrix-gui-common.inc
index 0ed72b5..7a46549 100644
--- a/recipes/ti/matrix-gui-common.inc
+++ b/recipes/ti/matrix-gui-common.inc
@@ -4,7 +4,7 @@ LICENSE = "BSD"
 SECTION = "multimedia"
 PRIORITY = "optional"
 
-INC_PR = "r9"
+INC_PR = "r10"
 
 COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x|ti814x)"
 
@@ -14,7 +14,7 @@ PLATFORM_omapl138 = "omapl138"
 PLATFORM_omap3evm = "omap3530"
 PLATFORM_dm37x-evm = "dm3730"
 PLATFORM_am37x-evm = "am3715"
-PLATFORM_beagleboard = "am3715"
+PLATFORM_beagleboard = "beagleboard"
 PLATFORM_ti816x = "ti816x"
 PLATFORM_ti814x = "ti814x"
 PLATFORM_am180x-evm = "am180x"
diff --git a/recipes/ti/matrix-gui-e.inc b/recipes/ti/matrix-gui-e.inc
index 7158d90..b67b6fa 100644
--- a/recipes/ti/matrix-gui-e.inc
+++ b/recipes/ti/matrix-gui-e.inc
@@ -4,7 +4,7 @@ LICENSE = "BSD"
 SECTION = "multimedia"
 PRIORITY = "optional"
 
-INC_PR = "r23"
+INC_PR = "r24"
 
 COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x|ti814x)"
 
@@ -14,7 +14,7 @@ PLATFORM_omapl138 = "omapl138"
 PLATFORM_omap3evm = "omap3530"
 PLATFORM_dm37x-evm = "dm3730"
 PLATFORM_am37x-evm = "am3715"
-PLATFORM_beagleboard = "am3715"
+PLATFORM_beagleboard = "beagleboard"
 PLATFORM_ti816x = "ti816x"
 PLATFORM_ti814x = "ti814x"
 PLATFORM_am180x-evm = "am180x"
diff --git a/recipes/ti/matrix-gui.inc b/recipes/ti/matrix-gui.inc
index 3dd0e10..e231db2 100644
--- a/recipes/ti/matrix-gui.inc
+++ b/recipes/ti/matrix-gui.inc
@@ -4,7 +4,7 @@ LICENSE = "BSD"
 SECTION = "multimedia"
 PRIORITY = "optional"
 
-INC_PR = "r21"
+INC_PR = "r22"
 
 COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x|ti814x)"
 
@@ -14,7 +14,7 @@ PLATFORM_omapl138 = "omapl138"
 PLATFORM_omap3evm = "omap3530"
 PLATFORM_dm37x-evm = "dm3730"
 PLATFORM_am37x-evm = "am3715"
-PLATFORM_beagleboard = "am3715"
+PLATFORM_beagleboard = "beagleboard"
 PLATFORM_ti816x = "ti816x"
 PLATFORM_ti814x = "ti814x"
 PLATFORM_am180x-evm = "am180x"
-- 
1.7.0.4



