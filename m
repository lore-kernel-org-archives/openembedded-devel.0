Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PKteP-0007Lh-JV
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 15:15:18 +0100
Received: (qmail 10283 invoked by uid 503); 23 Nov 2010 14:18:30 -0000
Received: from b9.ovh.net (HELO mail428.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 23 Nov 2010 14:18:29 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 23 Nov 2010 16:14:04 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 23 Nov 2010 16:14:02 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Nov 2010 15:11:30 +0100
Message-Id: <1290521490-1975-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 14711571133083462985
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.27.225
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] micro: update prefered binutils for arm
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
X-List-Received-Date: Tue, 23 Nov 2010 14:15:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

* without this builds for arm fail with :
http://tinderbox.openembedded.net/public/logs/task/10927261.txt
* with this, the build finish but image creation fails with :
http://tinderbox.openembedded.net/public/logs/task/10935754.txt

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 conf/distro/micro.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/conf/distro/micro.conf b/conf/distro/micro.conf
index 19b5e62..a065cbb 100644
--- a/conf/distro/micro.conf
+++ b/conf/distro/micro.conf
@@ -62,6 +62,7 @@ MACHINE_KERNEL_VERSION = "2.6"
 #############################################################################
 LIBC ?= "eglibc"
 PREFERRED_BINUTILS = "2.19.51"
+PREFERRED_BINUTILS_arm              ?= "2.20.1"
 PREFERRED_VERSION_glibc             ?= "2.10.1"
 PREFERRED_VERSION_glibc-initial     ?= "2.10.1"
 PREFERRED_ARM_INSTRUCTION_SET ?= "thumb"
-- 
1.6.3.3



