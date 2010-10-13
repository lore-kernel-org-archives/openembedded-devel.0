Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P61uG-0005En-IJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 16:02:14 +0200
Received: by yxj4 with SMTP id 4so1840617yxj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 07:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=wHPU3D3pnnDTeNMaqW6lpq88ioxbpBjULyo58URiXRM=;
	b=IxuOf+RZ3jcjR4GMZDWZJSZB9U0EJdXX8xjnyeEheFO5igcbdAHzPKM8VxeuI/s+d7
	spQbedcpRHpnpx9TV4Jmf20LteyMaGHvrfYhLwCJr+p+Au1urQhuPR3n8VCpC4A1q8Jn
	6GQpyTtj6KF0sAqO4fHs7sAL2xXsdhucGXWY0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=RD8rrDk9QCbOwuld32dLO89c49dNM8HlWP+pNbVm8EOic5UtavzMWBF2xN6zUbInp3
	wcDLoJfP31XuQiEY8Vauz92kVUZTvPpGIq7HTplHzLkHSYq3DNkPbEJVnbOttefRHLwe
	Zhb6L1Exs8yepcbZl6tsm0hFJAmp/r8yTTwq0=
Received: by 10.150.95.2 with SMTP id s2mr1070331ybb.146.1286978503687;
	Wed, 13 Oct 2010 07:01:43 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p38sm5073769ybk.4.2010.10.13.07.01.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 Oct 2010 07:01:42 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Oct 2010 09:01:30 -0500
Message-Id: <1286978491-13427-4-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1286978491-13427-1-git-send-email-Chase.Maupin@ti.com>
References: <1286978491-13427-1-git-send-email-Chase.Maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 4/5] matrix-gui: use INC_PR in versioned recipes
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
X-List-Received-Date: Wed, 13 Oct 2010 14:02:15 -0000

* Added an INC_PR to the matrix-gui.inc file to be used
  by the individual version recipes.
* Modified the version recipes to use INC_PR in their PR setting.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/ti/matrix-gui.inc    |    2 ++
 recipes/ti/matrix-gui_1.1.bb |    2 +-
 recipes/ti/matrix-gui_1.2.bb |    2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes/ti/matrix-gui.inc b/recipes/ti/matrix-gui.inc
index 871240f..a2a2721 100644
--- a/recipes/ti/matrix-gui.inc
+++ b/recipes/ti/matrix-gui.inc
@@ -4,6 +4,8 @@ LICENSE = "BSD"
 SECTION = "multimedia"
 PRIORITY = "optional"
 
+INC_PR = "r18"
+
 COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x)"
 
 PLATFORM_dm365 = "dm365"
diff --git a/recipes/ti/matrix-gui_1.1.bb b/recipes/ti/matrix-gui_1.1.bb
index 22a8b86..f14e207 100644
--- a/recipes/ti/matrix-gui_1.1.bb
+++ b/recipes/ti/matrix-gui_1.1.bb
@@ -4,4 +4,4 @@ COMPATIBLE_MACHINE = "(dm365|omapl138|omap3)"
 
 SRCREV = "136"
 PV = "1.1"
-PR = "r17"
+PR = "${INC_PR}.0"
diff --git a/recipes/ti/matrix-gui_1.2.bb b/recipes/ti/matrix-gui_1.2.bb
index 486fd2d..6837605 100644
--- a/recipes/ti/matrix-gui_1.2.bb
+++ b/recipes/ti/matrix-gui_1.2.bb
@@ -2,4 +2,4 @@ require matrix-gui.inc
 
 SRCREV = "146"
 PV = "1.2"
-PR = "r0"
+PR = "${INC_PR}.0"
-- 
1.7.0.4



