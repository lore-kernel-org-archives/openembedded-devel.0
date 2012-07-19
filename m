Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)
	id 1SryA0-00054B-BW for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 23:21:24 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q6JL56nj004192
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 16:05:06 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q6JL56Lh007076
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 16:05:06 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 19 Jul 2012 16:05:06 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q6JL56Zt027331;	Thu, 19 Jul 2012 16:05:06 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1Srxtn-00065p-Ix; Thu, 19 Jul 2012 16:04:39 -0500
From: <fcooper@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Jul 2012 16:04:33 -0500
Message-ID: <1342731873-23394-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH] edje-fpu: Convert tabs to spaces
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
X-List-Received-Date: Thu, 19 Jul 2012 21:21:25 -0000
Content-Type: text/plain

From: Franklin S Cooper Jr <fcooper@ti.com>

* Converting tabs to spaces to fix the below WARNINGS:
  WARNING: Variable get_edje_fpu_setting contains tabs, please remove these

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 meta-efl/recipes-efl/efl/edje-fpu.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/edje-fpu.inc b/meta-efl/recipes-efl/efl/edje-fpu.inc
index 1af86e3..dc39fa9 100644
--- a/meta-efl/recipes-efl/efl/edje-fpu.inc
+++ b/meta-efl/recipes-efl/efl/edje-fpu.inc
@@ -1,6 +1,6 @@
 
 def get_edje_fpu_setting(bb, d):
-	if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
-		return "--enable-fixed-point"
-	return ""
+    if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
+        return "--enable-fixed-point"
+    return ""
 
-- 
1.7.0.4



