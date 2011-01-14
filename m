Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pdlfr-0006ar-2m
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 16:34:47 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PdlfI-0000OJ-K9 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 07:34:12 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 14 Jan 2011 07:34:12 -0800
Received: from localhost.localdomain ([172.30.80.234]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 14 Jan 2011 08:34:11 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Jan 2011 08:34:01 -0700
Message-Id: <1295019241-5145-1-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 14 Jan 2011 15:34:11.0196 (UTC)
	FILETIME=[7DB143C0:01CBB400]
Subject: [PATCH] busybox-static: Look in ${P}:${BPN} before the main busybox
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
X-List-Received-Date: Fri, 14 Jan 2011 15:34:47 -0000

Update FILESPATHPKG so that busybox-static could have its own
starting defconfig.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 recipes/busybox/busybox-static_1.18.1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/busybox/busybox-static_1.18.1.bb b/recipes/busybox/busybox-static_1.18.1.bb
index 58aca93..27d4121 100644
--- a/recipes/busybox/busybox-static_1.18.1.bb
+++ b/recipes/busybox/busybox-static_1.18.1.bb
@@ -1,6 +1,6 @@
 require busybox_${PV}.bb
 
-FILESPATHPKG =. "busybox-${PV}:"
+FILESPATHPKG =. "${P}:${BPN}:busybox-${PV}:"
 S = "${WORKDIR}/busybox-${PV}"
 
 do_configure_append() {
-- 
1.7.0.4



