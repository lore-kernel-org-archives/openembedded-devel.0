Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PIioY-0006T2-Mv
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 15:16:56 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PIinT-0005fR-8k from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 06:15:39 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 17 Nov 2010 06:15:38 -0800
Received: from localhost.localdomain ([172.30.7.13]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 17 Nov 2010 07:15:38 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Nov 2010 07:15:34 -0700
Message-Id: <1290003334-11092-1-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 17 Nov 2010 14:15:38.0298 (UTC)
	FILETIME=[E8A099A0:01CB8661]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] sane-toolchain-*glibc.inc: Use -O2 on PowerPC
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
X-List-Received-Date: Wed, 17 Nov 2010 14:17:01 -0000

In FULL_OPTIMIZATION use -O2 on powerpc due to some problems
with libgcc.a and -Os when using gcc 4.5.x.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 conf/distro/include/sane-toolchain-eglibc.inc |    3 +++
 conf/distro/include/sane-toolchain-glibc.inc  |    3 +++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/conf/distro/include/sane-toolchain-eglibc.inc b/conf/distro/include/sane-toolchain-eglibc.inc
index c077ed1..77f2e3b 100644
--- a/conf/distro/include/sane-toolchain-eglibc.inc
+++ b/conf/distro/include/sane-toolchain-eglibc.inc
@@ -9,6 +9,9 @@ FULL_OPTIMIZATION_pn-eglibc_arm = "-fexpensive-optimizations -fomit-frame-pointe
 FULL_OPTIMIZATION_pn-perl = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1"
 FULL_OPTIMIZATION_sparc = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
 
+# gcc 4.5 has a problem with 'leakage' into libgcc.a with -Os
+FULL_OPTIMIZATION_powerpc = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
+
 # JaMa: I promise to report bug upstream, but as it can take a while to fix it, I'll switch to -O2 here
 # Tested with gcc-4.4.2 and gcc-4.4.3 on armv4t and armv5te and it fails with -Os, with gcc-4.3.3 it works OK with -Os
 # Here is testcase, but you have to rebuild whole libqtxml to test it
diff --git a/conf/distro/include/sane-toolchain-glibc.inc b/conf/distro/include/sane-toolchain-glibc.inc
index e806de6..5802ef1 100644
--- a/conf/distro/include/sane-toolchain-glibc.inc
+++ b/conf/distro/include/sane-toolchain-glibc.inc
@@ -13,6 +13,9 @@ FULL_OPTIMIZATION_pn-perl = "-fexpensive-optimizations -fomit-frame-pointer -fre
 FULL_OPTIMIZATION_pn-glibc = "-fexpensive-optimizations -fomit-frame-pointer -O2"
 FULL_OPTIMIZATION_sparc = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
 
+# gcc 4.5 has a problem with 'leakage' into libgcc.a with -Os
+FULL_OPTIMIZATION_powerpc = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
+
 BUILD_OPTIMIZATION_pn-perl = "-O1"
 BUILD_OPTIMIZATION_pn-glibc = "-O2"
 BUILD_OPTIMIZATION_sparc = "-O2"
-- 
1.7.0.4



