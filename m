Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1N0uTJ-0001pv-Um
	for openembedded-devel@openembedded.org; Thu, 22 Oct 2009 12:00:45 +0200
Received: (qmail 26868 invoked by uid 813007); 22 Oct 2009 09:59:40 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Oct 2009 09:59:40 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Oct 2009 12:01:34 +0200
Message-Id: <1256205694-14095-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1255966150-1854-10-git-send-email-marcin@juszkiewicz.com.pl>
References: <1255966150-1854-10-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] linux: updated 2.6.27 to 2.6.27.38
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
X-List-Received-Date: Thu, 22 Oct 2009 10:00:45 -0000


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/linux/linux_2.6.27.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/linux/linux_2.6.27.bb b/recipes/linux/linux_2.6.27.bb
index 70b9028..4562a05 100644
--- a/recipes/linux/linux_2.6.27.bb
+++ b/recipes/linux/linux_2.6.27.bb
@@ -1,6 +1,6 @@
 require linux.inc
 
-PR = "r9"
+PR = "r10"
 
 # Mark archs/machines that this kernel supports
 DEFAULT_PREFERENCE = "-1"
@@ -9,7 +9,7 @@ DEFAULT_PREFERENCE_progear = "1"
 DEFAULT_PREFERENCE_simpad = "-1"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
-           ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.37.bz2;patch=1 \
+           ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.38.bz2;patch=1 \
            file://defconfig "
 
 SRC_URI_append_boc01 = "\
-- 
1.6.5





