Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MM59L-0003Ck-60
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 21:07:19 +0200
Received: (qmail 32586 invoked by uid 813007); 1 Jul 2009 18:55:23 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Jul 2009 18:55:23 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jul 2009 20:55:13 +0200
Message-Id: <1246474518-16737-15-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <200907011819.54127.marcin@juszkiewicz.com.pl>
References: <200907011819.54127.marcin@juszkiewicz.com.pl>
Cc: Marcin Juszkiewicz <hrw@openembedded.org>
Subject: [STABLE][PATCH 120/125] linux: fixed defconfigs for at91sam* devboards
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
X-List-Received-Date: Wed, 01 Jul 2009 19:07:19 -0000

From: Marcin Juszkiewicz <hrw@openembedded.org>


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 .../{at91sam9260dfc_defconfig => defconfig}        |    0
 .../{at91sam9261ek_defconfig => defconfig}         |    0
 .../{at91sam9g20dfc_defconfig => defconfig}        |    0
 recipes/linux/linux_2.6.28.bb                      |    2 +-
 4 files changed, 1 insertions(+), 1 deletions(-)
 rename recipes/linux/linux-2.6.28/at91sam9260dfc/{at91sam9260dfc_defconfig => defconfig} (100%)
 rename recipes/linux/linux-2.6.28/at91sam9261ek/{at91sam9261ek_defconfig => defconfig} (100%)
 rename recipes/linux/linux-2.6.28/at91sam9g20dfc/{at91sam9g20dfc_defconfig => defconfig} (100%)

diff --git a/recipes/linux/linux-2.6.28/at91sam9260dfc/at91sam9260dfc_defconfig b/recipes/linux/linux-2.6.28/at91sam9260dfc/defconfig
similarity index 100%
rename from recipes/linux/linux-2.6.28/at91sam9260dfc/at91sam9260dfc_defconfig
rename to recipes/linux/linux-2.6.28/at91sam9260dfc/defconfig
diff --git a/recipes/linux/linux-2.6.28/at91sam9261ek/at91sam9261ek_defconfig b/recipes/linux/linux-2.6.28/at91sam9261ek/defconfig
similarity index 100%
rename from recipes/linux/linux-2.6.28/at91sam9261ek/at91sam9261ek_defconfig
rename to recipes/linux/linux-2.6.28/at91sam9261ek/defconfig
diff --git a/recipes/linux/linux-2.6.28/at91sam9g20dfc/at91sam9g20dfc_defconfig b/recipes/linux/linux-2.6.28/at91sam9g20dfc/defconfig
similarity index 100%
rename from recipes/linux/linux-2.6.28/at91sam9g20dfc/at91sam9g20dfc_defconfig
rename to recipes/linux/linux-2.6.28/at91sam9g20dfc/defconfig
diff --git a/recipes/linux/linux_2.6.28.bb b/recipes/linux/linux_2.6.28.bb
index 6f5b150..b11bf16 100644
--- a/recipes/linux/linux_2.6.28.bb
+++ b/recipes/linux/linux_2.6.28.bb
@@ -1,6 +1,6 @@
 require linux.inc
 
-PR = "r7"
+PR = "r8"
 
 # Mark archs/machines that this kernel supports
 DEFAULT_PREFERENCE = "-1"
-- 
1.6.3.1





