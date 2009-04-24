Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LxOWQ-0006eD-OK
	for openembedded-devel@openembedded.org; Fri, 24 Apr 2009 18:45:11 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090424164020.JENM10385.fed1rmmtao107.cox.net@fed1rmimpo03.cox.net>;
	Fri, 24 Apr 2009 12:40:20 -0400
Received: from localhost.localdomain ([68.230.63.214])
	by fed1rmimpo03.cox.net with bizsmtp
	id jUgH1b00L4dMFYL04UgKuB; Fri, 24 Apr 2009 12:40:19 -0400
X-Authority-Analysis: v=1.0 c=1 a=UC6F8cYN4IoA:10 a=aVl9RmJJ25cA:10
	a=4HVRqb_MAAAA:8 a=n9KOeMaXuUxbNn3KC8QA:9
	a=erpz6tipSRn3BecvAxKfJwfOS4YA:4 a=k-kO48AawpMA:10
X-CM-Score: 0.00
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Date: Fri, 24 Apr 2009 09:11:55 -0700
Message-Id: <1240589520-1104-8-git-send-email-trini@kernel.crashing.org>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1240589520-1104-7-git-send-email-trini@kernel.crashing.org>
References: <1240589520-1104-1-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-2-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-3-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-4-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-5-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-6-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-7-git-send-email-trini@kernel.crashing.org>
Subject: [PATCH][STABLE] binutils-canadian-sdk: Use add SYSROOT, use SDK_REALPATH_MINGW, bump PR
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
X-List-Received-Date: Fri, 24 Apr 2009 16:46:05 -0000

From: Tom Rini <trini@embeddedalley.com>


Signed-off-by: Tom Rini <trini@embeddedalley.com>
---
 recipes/binutils/binutils-canadian-sdk_2.18.bb |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/recipes/binutils/binutils-canadian-sdk_2.18.bb b/recipes/binutils/binutils-canadian-sdk_2.18.bb
index cf27cd0..e44e7b7 100644
--- a/recipes/binutils/binutils-canadian-sdk_2.18.bb
+++ b/recipes/binutils/binutils-canadian-sdk_2.18.bb
@@ -9,9 +9,12 @@ DEPENDS="\
 "
 
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/binutils-${PV}"
-EXTRA_OECONF = "--with-sysroot=${prefix}/${TARGET_SYS} \
+# On MinGW hosts we want to prepend a drive letter, in ${SDK_REALPATH_MINGW}
+# to the sysroot path.
+SYSROOT = "${@['${SDK_REALPATH}/${TARGET_SYS}', '${SDK_REALPATH_MINGW}${SDK_REALPATH}/${TARGET_SYS}'][bb.data.getVar('SDK_OS', d, 1) in ['mingw32', 'mingw64']]}"
+EXTRA_OECONF = "--with-sysroot=${SYSROOT} \
 		--program-prefix=${TARGET_PREFIX}"
-PR = "r3"
+PR = "r4"
 
 FILES_${PN}-dbg += "${prefix}/${TARGET_SYS}/bin/.debug"
 
-- 
1.5.6.3



