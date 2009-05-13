Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1M4Fqi-0006jm-IS
	for openembedded-devel@openembedded.org; Wed, 13 May 2009 16:54:24 +0200
Received: (qmail 25693 invoked by uid 813007); 13 May 2009 14:47:39 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 13 May 2009 14:47:39 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 16:46:55 +0200
Message-Id: <1242226019-10881-3-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3
In-Reply-To: <1242226019-10881-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1242226019-10881-1-git-send-email-marcin@juszkiewicz.com.pl>
Cc: Marcin Juszkiewicz <hrw@openembedded.org>
Subject: [PATCH 2/6] kaeilos/sane-feed: remove alix, mark geodelx as i586
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
X-List-Received-Date: Wed, 13 May 2009 14:54:24 -0000

From: Marcin Juszkiewicz <hrw@openembedded.org>

hrw@alix:~$ uname -a
Linux alix 2.6.29-1-686 #1 SMP Sat Apr 4 17:36:29 UTC 2009 i586 GNU/Linux
hrw@alix:~$ cat /proc/cpuinfo
processor       : 0
vendor_id       : AuthenticAMD
cpu family      : 5
model           : 10
model name      : Geode(TM) Integrated Processor by AMD PCS
stepping        : 2
cpu MHz         : 498.034
cache size      : 128 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu de pse tsc msr cx8 sep pge cmov clflush mmx mmxext 3dnowext 3dnow up
bogomips        : 996.06
clflush size    : 32
power management:

Signed-off-by: Marcin Juszkiewicz <hrw@openembedded.org>
---
 conf/distro/include/kaeilos.inc   |    3 +--
 conf/distro/include/sane-feed.inc |    3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/conf/distro/include/kaeilos.inc b/conf/distro/include/kaeilos.inc
index de7dca7..e7e63d2 100644
--- a/conf/distro/include/kaeilos.inc
+++ b/conf/distro/include/kaeilos.inc
@@ -226,19 +226,18 @@ FEED_ARCH_omap2430sdp   = "armv6"
 
 #i486 machines
 FEED_ARCH_geodegx 	= "i486"
-FEED_ARCH_geodelx 	= "i486"
 FEED_ARCH_netvista 	= "i486"
 FEED_ARCH_wrap 		= "i486"
 FEED_ARCH_x86 		= "i486"
 
 #i586 machines
 FEED_ARCH_epia 		= "i586"
+FEED_ARCH_geodelx 	= "i586"
 FEED_ARCH_i586-generic 	= "i586"
 FEED_ARCH_qemux86 	= "i586"
 
 #i686 machines
 
-FEED_ARCH_alix 		= "i686"
 FEED_ARCH_colinux	= "i686"
 FEED_ARCH_guinness 	= "i686"
 FEED_ARCH_i686-generic 	= "i686"
diff --git a/conf/distro/include/sane-feed.inc b/conf/distro/include/sane-feed.inc
index 5bc19a1..2673f9d 100644
--- a/conf/distro/include/sane-feed.inc
+++ b/conf/distro/include/sane-feed.inc
@@ -116,19 +116,18 @@ FEED_ARCH_omap2430sdp   = "armv6"
 
 # i486 machines
 FEED_ARCH_geodegx 	= "i486"
-FEED_ARCH_geodelx 	= "i486"
 FEED_ARCH_netvista 	= "i486"
 FEED_ARCH_wrap 		= "i486"
 FEED_ARCH_x86 		= "i486"
 
 # i586 machines
 FEED_ARCH_epia 		= "i586"
+FEED_ARCH_geodelx 	= "i586"
 FEED_ARCH_i586-generic 	= "i586"
 FEED_ARCH_qemux86 	= "i586"
 
 # i686 machines
 
-FEED_ARCH_alix 		= "i686"
 FEED_ARCH_colinux	= "i686"
 FEED_ARCH_guinness 	= "i686"
 FEED_ARCH_i686-generic 	= "i686"
-- 
1.6.3





