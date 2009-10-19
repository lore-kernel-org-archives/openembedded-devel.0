Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MzuA2-00087G-FP
	for openembedded-devel@openembedded.org; Mon, 19 Oct 2009 17:28:41 +0200
Received: (qmail 29900 invoked by uid 813007); 19 Oct 2009 15:27:41 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 19 Oct 2009 15:27:41 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Oct 2009 17:29:05 +0200
Message-Id: <1255966150-1854-8-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1255966150-1854-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1255966150-1854-1-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 07/12] linux 2.6.25: update to latest stable patch
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
X-List-Received-Date: Mon, 19 Oct 2009 15:28:41 -0000


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/linux/linux_2.6.25.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/linux/linux_2.6.25.bb b/recipes/linux/linux_2.6.25.bb
index b6ed3d8..aff0fc7 100644
--- a/recipes/linux/linux_2.6.25.bb
+++ b/recipes/linux/linux_2.6.25.bb
@@ -1,6 +1,6 @@
 require linux.inc
 
-PR = "r6"
+PR = "r7"
 
 # Mark archs/machines that this kernel supports
 DEFAULT_PREFERENCE = "-1"
@@ -15,6 +15,7 @@ DEFAULT_PREFERENCE_at91-l9260 = "1"
 DEFAULT_PREFERENCE_m8050 = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.25.tar.bz2 \
+           ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.20.bz2;patch=1 \
            file://defconfig"
 
 SRC_URI_append_mpc8313e-rdb = "\
-- 
1.6.5





