Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MIgPA-0000BY-EM
	for openembedded-devel@openembedded.org; Mon, 22 Jun 2009 12:05:36 +0200
Received: (qmail 27900 invoked by uid 813007); 22 Jun 2009 09:54:40 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Jun 2009 09:54:39 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Jun 2009 11:53:52 +0200
Message-Id: <1245664435-30183-9-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <200906041838.05838.marcin@juszkiewicz.com.pl>
References: <200906041838.05838.marcin@juszkiewicz.com.pl>
Subject: [STABLE][PATCH 032/125] samba: 3.2.8 and newer is GPLv3
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
X-List-Received-Date: Mon, 22 Jun 2009 10:05:37 -0000

From: Tom Rini <trini@embeddedalley.com>


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/samba/samba-ads_3.2.8.bb |    1 +
 recipes/samba/samba-ads_3.3.0.bb |    1 +
 recipes/samba/samba_3.2.8.bb     |    1 +
 recipes/samba/samba_3.3.0.bb     |    1 +
 4 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/recipes/samba/samba-ads_3.2.8.bb b/recipes/samba/samba-ads_3.2.8.bb
index 95f09c1..e643292 100644
--- a/recipes/samba/samba-ads_3.2.8.bb
+++ b/recipes/samba/samba-ads_3.2.8.bb
@@ -1,5 +1,6 @@
 require samba.inc
 require samba-ads.inc
+LICENSE = "GPLv3"
 
 PR = "r2"
 SRC_URI += "file://config-lfs.patch;patch=1 \
diff --git a/recipes/samba/samba-ads_3.3.0.bb b/recipes/samba/samba-ads_3.3.0.bb
index 9fd4303..e5184cf 100644
--- a/recipes/samba/samba-ads_3.3.0.bb
+++ b/recipes/samba/samba-ads_3.3.0.bb
@@ -1,5 +1,6 @@
 require samba.inc
 require samba-ads.inc
+LICENSE = "GPLv3"
 
 PR = "r3"
 SRC_URI += "file://config-lfs.patch;patch=1 \
diff --git a/recipes/samba/samba_3.2.8.bb b/recipes/samba/samba_3.2.8.bb
index 2e2cb95..16dcd31 100644
--- a/recipes/samba/samba_3.2.8.bb
+++ b/recipes/samba/samba_3.2.8.bb
@@ -1,5 +1,6 @@
 require samba.inc
 require samba-basic.inc
+LICENSE = "GPLv3"
 
 SRC_URI += "file://configure-3.2.8.patch;patch=1 \
             file://config-h.patch;patch=1 \
diff --git a/recipes/samba/samba_3.3.0.bb b/recipes/samba/samba_3.3.0.bb
index 6270c8c..c561d95 100644
--- a/recipes/samba/samba_3.3.0.bb
+++ b/recipes/samba/samba_3.3.0.bb
@@ -1,5 +1,6 @@
 require samba.inc
 require samba-basic.inc
+LICENSE = "GPLv3"
 
 # 3.3.0 and newer will upgrade your tdb database to a
 # new version that you can not downgrade to use with older
-- 
1.6.3.1





