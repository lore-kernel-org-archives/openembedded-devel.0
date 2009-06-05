Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MCZXU-0002FZ-PQ
	for openembedded-devel@openembedded.org; Fri, 05 Jun 2009 15:32:57 +0200
Received: (qmail 29840 invoked by uid 813007); 5 Jun 2009 13:23:47 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 5 Jun 2009 13:23:47 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri,  5 Jun 2009 15:24:33 +0200
Message-Id: <1244208273-14048-5-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <1243867762-16540-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1243867762-16540-1-git-send-email-marcin@juszkiewicz.com.pl>
Subject: [PATCH 4/4] angstrom: use -O not -O2 for ep9312 tuning
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
X-List-Received-Date: Fri, 05 Jun 2009 13:32:57 -0000


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 conf/distro/include/angstrom-glibc.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/conf/distro/include/angstrom-glibc.inc b/conf/distro/include/angstrom-glibc.inc
index 5df77d8..3d189b9 100644
--- a/conf/distro/include/angstrom-glibc.inc
+++ b/conf/distro/include/angstrom-glibc.inc
@@ -15,11 +15,13 @@ FULL_OPTIMIZATION = "-fexpensive-optimizations -frename-registers -fomit-frame-p
 FULL_OPTIMIZATION_pn-perl = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1"
 FULL_OPTIMIZATION_pn-glibc = "-fexpensive-optimizations -fomit-frame-pointer -O2"
 FULL_OPTIMIZATION_sparc = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
+FULL_OPTIMIZATION_ep9312 = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O -fno-signed-zeros"
 
 BUILD_OPTIMIZATION = "-O2"
 BUILD_OPTIMIZATION_pn-perl = "-O1"
 BUILD_OPTIMIZATION_pn-glibc = "-O2"
 BUILD_OPTIMIZATION_sparc = "-O2"
+BUILD_OPTIMIZATION_ep9312 = "-O"
 
 TARGET_LINK_HASH_STYLE = "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH',d,1) in ['mips', 'mipsel']]}"
 
-- 
1.6.3.1





