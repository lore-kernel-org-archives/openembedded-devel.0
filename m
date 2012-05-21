Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1SWTi4-00041R-Qz
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 16:35:45 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4LEPa9k005787
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:25:36 -0500
Received: from DFLE71.ent.ti.com (dfle71.ent.ti.com [128.247.5.62])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LEPaUY031825
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:25:36 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 21 May 2012 09:25:36 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENApQ008382;
	Mon, 21 May 2012 09:25:35 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 May 2012 09:29:53 -0500
Message-ID: <1337610609-1173-55-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
References: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 54/70] gnome-common: Update LICENSE field version to GPLv3
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
X-List-Received-Date: Mon, 21 May 2012 14:35:45 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic GPL to GPLv3 to
  reflect the real license version.
* This change was based on setting in oe-core as well as code
  inspection.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/gnome/gnome-common.inc       |    2 +-
 recipes/gnome/gnome-common_2.28.0.bb |    2 ++
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/gnome/gnome-common.inc b/recipes/gnome/gnome-common.inc
index 826052f..3e4cbae 100644
--- a/recipes/gnome/gnome-common.inc
+++ b/recipes/gnome/gnome-common.inc
@@ -1,4 +1,4 @@
-LICENSE = "GPL"
+LICENSE = "GPLv3"
 SECTION = "x11/gnome"
 DESCRIPTION = "Common macros for building GNOME applications"
 
diff --git a/recipes/gnome/gnome-common_2.28.0.bb b/recipes/gnome/gnome-common_2.28.0.bb
index 9fa6c21..cca1dee 100644
--- a/recipes/gnome/gnome-common_2.28.0.bb
+++ b/recipes/gnome/gnome-common_2.28.0.bb
@@ -1,4 +1,6 @@
 require gnome-common.inc
 
+PR = "r1"
+
 SRC_URI[archive.md5sum] = "30daabb0ca4898fea2647999e7813e8f"
 SRC_URI[archive.sha256sum] = "dd4817103d23745d00c735dd137951552ba7b576cb8f68e6a529d06661e9b6a1"
-- 
1.7.0.4



