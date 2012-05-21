Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1SWTib-0004rm-Ic
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 16:36:18 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4LEQ92b005869
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:26:09 -0500
Received: from DFLE71.ent.ti.com (dfle71.ent.ti.com [128.247.5.62])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LEQ9Mv032372
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:26:09 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 21 May 2012 09:26:09 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENApc008382;
	Mon, 21 May 2012 09:26:07 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 May 2012 09:30:05 -0500
Message-ID: <1337610609-1173-67-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
References: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 66/70] libnfnetlink: Update LICENSE field version to GPLv2
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
X-List-Received-Date: Mon, 21 May 2012 14:36:19 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic LGPL to GPLv2+ to
  reflect the real license version.
* This change was back-ported from oe-core.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/libnfnetlink/libnfnetlink_1.0.0.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/libnfnetlink/libnfnetlink_1.0.0.bb b/recipes/libnfnetlink/libnfnetlink_1.0.0.bb
index ef6551e..40ed9c4 100644
--- a/recipes/libnfnetlink/libnfnetlink_1.0.0.bb
+++ b/recipes/libnfnetlink/libnfnetlink_1.0.0.bb
@@ -1,6 +1,8 @@
 include libnfnetlink.inc
 
-PR = "${INC_PR}.0"
+LICENSE = "GPLv2+"
+
+PR = "${INC_PR}.1"
 
 SRC_URI[libnfnetlink-1.0.0.md5sum] = "016fdec8389242615024c529acc1adb8"
 SRC_URI[libnfnetlink-1.0.0.sha256sum] = "3752b03a4c09821ee9a2528d69289423a01e7171f1a22dfdd11d5459e03972fb"
-- 
1.7.0.4



