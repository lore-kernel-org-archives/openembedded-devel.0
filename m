Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1STxyg-0005Br-4U
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 18:18:30 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4EG8URM024739
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:08:30 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG8UWf009378
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:08:30 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 14 May 2012 11:08:30 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG6AIT028612;
	Mon, 14 May 2012 11:08:29 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 May 2012 11:10:16 -0500
Message-ID: <1337011834-24879-52-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
References: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 51/69] shared-mime-info: Update LICENSE field version
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
X-List-Received-Date: Mon, 14 May 2012 16:18:30 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic GPL to GPLv2 to
  reflect the real license version.
* This change was based on source inspection.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/shared-mime-info/shared-mime-info_0.51.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/shared-mime-info/shared-mime-info_0.51.bb b/recipes/shared-mime-info/shared-mime-info_0.51.bb
index 1f0a3d2..b9c8671 100644
--- a/recipes/shared-mime-info/shared-mime-info_0.51.bb
+++ b/recipes/shared-mime-info/shared-mime-info_0.51.bb
@@ -1,7 +1,9 @@
 require shared-mime-info.inc
 
+LICENSE = "GPLv2"
+
 DEPENDS = "libxml2 intltool-native glib-2.0 shared-mime-info-native"
-PR = "r2"
+PR = "r3"
 
 do_install_append() {
     update-mime-database ${D}${datadir}/mime
-- 
1.7.0.4



