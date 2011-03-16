Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1Pzw0m-0001N0-4q
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 20:04:00 +0100
Received: by yxn22 with SMTP id 22so791563yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 12:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=Ts9y7wFzzQLpgnvRQ+At1asGz4PzcmE2eVqcFxuWP24=;
	b=RhCA4FdgCdJa/tWrrzyfJe464PmkZwXjX4oHEQnxQkbQ7XpW870taCAX6A37M0KF/C
	/v1CVTUAtz58EwRtThllcRx39Fi8ospGCdv8g41+nBAaFimv88mPFMlKTF51r5eLJNDG
	8TfPJCIVBmDxitq7IfmDOTU6NoUDjUn6TtGrw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=SxNacOLp0OhkbGl3Yalf6AvmNpvm8TXoHBrFZyB/5LtGjxg36HCOES4LIpK3kiTvCx
	xVBCURq+TWLtac5OMZI7YwAa5EY48Zzy7gRBLhmncSmHScbleGvkrqeDn9VbdLn57Hwp
	taKbh024fFYHKeyJafXoDVBegNLclF2A4srNk=
Received: by 10.236.19.199 with SMTP id n47mr228729yhn.376.1300302136219;
	Wed, 16 Mar 2011 12:02:16 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id k5sm766126yhm.21.2011.03.16.12.02.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2011 12:02:14 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Mar 2011 14:02:05 -0500
Message-Id: <1300302126-32560-3-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1300302126-32560-1-git-send-email-Chase.Maupin@ti.com>
References: <1300302126-32560-1-git-send-email-Chase.Maupin@ti.com>
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 3/4] matrix-gui: add support for dm386-evm machine
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
X-List-Received-Date: Wed, 16 Mar 2011 19:04:00 -0000

* Add support for the dm368-evm machine type
* Bump the PRs

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/ti/matrix-gui-common.inc |    5 +++--
 recipes/ti/matrix-gui-e.inc      |    5 +++--
 recipes/ti/matrix-gui.inc        |    5 +++--
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/recipes/ti/matrix-gui-common.inc b/recipes/ti/matrix-gui-common.inc
index c0edbfd..486cb8d 100644
--- a/recipes/ti/matrix-gui-common.inc
+++ b/recipes/ti/matrix-gui-common.inc
@@ -4,11 +4,12 @@ LICENSE = "BSD"
 SECTION = "multimedia"
 PRIORITY = "optional"
 
-INC_PR = "r7"
+INC_PR = "r8"
 
 COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x)"
 
-PLATFORM_dm365 = "dm365"
+PLATFORM_dm365-evm = "dm365"
+PLATFORM_dm368-evm = "dm368"
 PLATFORM_omapl138 = "omapl138"
 PLATFORM_omap3evm = "omap3530"
 PLATFORM_dm37x-evm = "dm3730"
diff --git a/recipes/ti/matrix-gui-e.inc b/recipes/ti/matrix-gui-e.inc
index ba8012c..e19b5b9 100644
--- a/recipes/ti/matrix-gui-e.inc
+++ b/recipes/ti/matrix-gui-e.inc
@@ -4,11 +4,12 @@ LICENSE = "BSD"
 SECTION = "multimedia"
 PRIORITY = "optional"
 
-INC_PR = "r21"
+INC_PR = "r22"
 
 COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x)"
 
-PLATFORM_dm365 = "dm365"
+PLATFORM_dm365-evm = "dm365"
+PLATFORM_dm368-evm = "dm368"
 PLATFORM_omapl138 = "omapl138"
 PLATFORM_omap3evm = "omap3530"
 PLATFORM_dm37x-evm = "dm3730"
diff --git a/recipes/ti/matrix-gui.inc b/recipes/ti/matrix-gui.inc
index 82ec6ab..240e695 100644
--- a/recipes/ti/matrix-gui.inc
+++ b/recipes/ti/matrix-gui.inc
@@ -4,11 +4,12 @@ LICENSE = "BSD"
 SECTION = "multimedia"
 PRIORITY = "optional"
 
-INC_PR = "r19"
+INC_PR = "r20"
 
 COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x)"
 
-PLATFORM_dm365 = "dm365"
+PLATFORM_dm365-evm = "dm365"
+PLATFORM_dm368-evm = "dm368"
 PLATFORM_omapl138 = "omapl138"
 PLATFORM_omap3evm = "omap3530"
 PLATFORM_dm37x-evm = "dm3730"
-- 
1.7.0.4



