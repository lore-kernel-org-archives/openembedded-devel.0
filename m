Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P61uF-0005Ek-BN
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 16:02:12 +0200
Received: by gya1 with SMTP id 1so992140gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 07:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=nkSW9hj6W3DF+pQ17z38IBFjuN+dcxbdx8uxgoW8Gyo=;
	b=L6MbR/lTVKJFg3c90qAp9iFZcWxN9LgEwF4wN2lnBp8Q3fnyMQ2EZ1qC3VczAcoDYR
	CqNjEViFSIBnbBPRs+wX1MtRH5GA2D9r8C6ha9/cg1VxnwgkNw6WS1Tgjs6DMM63BrhS
	cHeY0f+1TqnyP27gcP7FTy6bFDufW5s+lJnl4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=EM1LRBgioTuXI6kKLIDURJft987/x9PiFqWvvWTgabXlxtspyO5Fw+smzceu0v7QhE
	rrSqvZmcOnxRt4qjlqWXVrJ9roq2faQUS3OrOzX/Nuql9zpnIztgocPZOv3hciFOL1++
	QI2cUmvdyeiF8o4ccS4Z/QocaZLVVtnRZJHyY=
Received: by 10.150.143.21 with SMTP id q21mr1147696ybd.142.1286978501618;
	Wed, 13 Oct 2010 07:01:41 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p38sm5073769ybk.4.2010.10.13.07.01.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 Oct 2010 07:01:41 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Oct 2010 09:01:29 -0500
Message-Id: <1286978491-13427-3-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1286978491-13427-1-git-send-email-Chase.Maupin@ti.com>
References: <1286978491-13427-1-git-send-email-Chase.Maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 3/5] matrix-gui-e: use INC_PR in versioned recipes
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
X-List-Received-Date: Wed, 13 Oct 2010 14:02:12 -0000

* Added an INC_PR to the matrix-gui-e.inc file to be used
  by the individual version recipes.
* Modified the version recipes to use INC_PR in their PR setting.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/ti/matrix-gui-e.inc    |    2 ++
 recipes/ti/matrix-gui-e_1.1.bb |    2 +-
 recipes/ti/matrix-gui-e_1.2.bb |    2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes/ti/matrix-gui-e.inc b/recipes/ti/matrix-gui-e.inc
index 0d0b4bf..86f08b1 100644
--- a/recipes/ti/matrix-gui-e.inc
+++ b/recipes/ti/matrix-gui-e.inc
@@ -4,6 +4,8 @@ LICENSE = "BSD"
 SECTION = "multimedia"
 PRIORITY = "optional"
 
+INC_PR = "r20"
+
 COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x)"
 
 PLATFORM_dm365 = "dm365"
diff --git a/recipes/ti/matrix-gui-e_1.1.bb b/recipes/ti/matrix-gui-e_1.1.bb
index d6a674f..2b6bd76 100644
--- a/recipes/ti/matrix-gui-e_1.1.bb
+++ b/recipes/ti/matrix-gui-e_1.1.bb
@@ -4,5 +4,5 @@ COMPATIBLE_MACHINE = "(dm365|omapl138|omap3)"
 
 SRCREV = "136"
 PV = "1.1"
-PR = "r19"
+PR = "${INC_PR}.0"
 
diff --git a/recipes/ti/matrix-gui-e_1.2.bb b/recipes/ti/matrix-gui-e_1.2.bb
index 461fc7e..5ac2a56 100644
--- a/recipes/ti/matrix-gui-e_1.2.bb
+++ b/recipes/ti/matrix-gui-e_1.2.bb
@@ -2,5 +2,5 @@ require matrix-gui-e.inc
 
 SRCREV = "146"
 PV = "1.2"
-PR = "r0"
+PR = "${INC_PR}.0"
 
-- 
1.7.0.4



