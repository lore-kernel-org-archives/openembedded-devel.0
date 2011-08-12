Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Qrl8z-0000ME-MQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Aug 2011 08:22:57 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LPS000EPUQ9RW47@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	12 Aug 2011 00:18:09 -0500 (CDT)
Received: from elrond.denix.org (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 08E9C14AF56; Fri,
	12 Aug 2011 01:18:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Aug 2011 01:17:52 -0400
Message-id: <1313126272-32091-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.7.6
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-oe][PATCH] gcc: append PR to S to match oe-core and fix do_headerfix
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
X-List-Received-Date: Fri, 12 Aug 2011 06:22:57 -0000

From: Denys Dmytriyenko <denys@ti.com>

This fixes the gcc-cross-inital failure, as reported here:
http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/6150

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-oe/recipes-devtools/gcc/gcc-4.5.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
index 662402c..aabc1cf 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
@@ -232,7 +232,7 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
 FORTRAN = ""
 JAVA = ""
 
-S = "${TMPDIR}/work-shared/gcc-${PV}/${BRANCH}"
+S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${BRANCH}"
 B = "${WORKDIR}/${BRANCH}/build.${HOST_SYS}.${TARGET_SYS}"
 
 #EXTRA_OECONF_BASE = "  --enable-cheaders=c_std \
-- 
1.7.0.4



