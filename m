Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eyalreizer@googlemail.com>) id 1Qdilw-0007dK-2X
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jul 2011 15:01:08 +0200
Received: by yxi19 with SMTP id 19so698576yxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jul 2011 05:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=tFNJBAGDSmotT38jADhOzIeXPR/Aej9WNNwrzpM3+FE=;
	b=Ehbe/V/QWK732BE56Suh8HO70MxnBDOOmRhZ02pLq+/+YOJSpUHkanoU1hE1yKuc6J
	I+yTPnll2RQ1Sl1V9HS6UNYPTMdyzG5R0JVtiCM2UQDU+WrfddUalb4pimO+jTteQ65R
	UWKgNQ5DHyRMiMoyHfji37Xc4O25BvDKcVDaY=
Received: by 10.236.184.225 with SMTP id s61mr7251425yhm.485.1309784239508;
	Mon, 04 Jul 2011 05:57:19 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id i61sm4037580yhe.19.2011.07.04.05.57.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Jul 2011 05:57:18 -0700 (PDT)
From: Eyal Reizer <eyalreizer@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Jul 2011 15:57:04 +0300
Message-Id: <1309784224-8174-1-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] ti-wifi-utils: fix unaligned data access
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
X-List-Received-Date: Mon, 04 Jul 2011 13:01:08 -0000

update the recipe to use a new commit from upstream which fixes unaligned
data access errors reported when using the calibrator tool on an am180x
(armv5) platform

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 recipes/ti/ti-wifi-utils_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/ti/ti-wifi-utils_git.bb b/recipes/ti/ti-wifi-utils_git.bb
index 9855775..87ca2c9 100644
--- a/recipes/ti/ti-wifi-utils_git.bb
+++ b/recipes/ti/ti-wifi-utils_git.bb
@@ -3,11 +3,11 @@ LICENSE = "TI-BSD"
 
 DEPENDS = "libnl"
 
-PR ="r3"
+PR ="r4"
 PV ="0.0"
 PR_append = "+gitr${SRCPV}"
 
-SRCREV = "268dbf03091b632c2697eb8028e90fe40513a9d8"
+SRCREV = "8737db9372e714e265d3f575573d14c3379ab9fc"
 SRC_URI = "git://github.com/gxk/ti-utils.git;protocol=git"
 
 S = "${WORKDIR}/git"
-- 
1.7.0.4



