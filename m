Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1STxwi-0002x8-T5
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 18:16:29 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4EG6TCC024492
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:06:29 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG6Tgj007428
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:06:29 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 14 May 2012 11:06:29 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG6AHi028612;
	Mon, 14 May 2012 11:06:27 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 May 2012 11:09:31 -0500
Message-ID: <1337011834-24879-7-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
References: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 06/69] gtk+: Update LICENSE field version for 2.20.1
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
X-List-Received-Date: Mon, 14 May 2012 16:16:29 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic LGPL to LGPLv2,
  LGPLv2+, and LGPLv2.1 to reflect the real license version.
* This change was based on setting in oe-core as well as code
  inspection
* Verified for version 2.20.1 of gtk+

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/gtk+/gtk+_2.20.1.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/gtk+/gtk+_2.20.1.bb b/recipes/gtk+/gtk+_2.20.1.bb
index 9cffee1..cd3a6d2 100644
--- a/recipes/gtk+/gtk+_2.20.1.bb
+++ b/recipes/gtk+/gtk+_2.20.1.bb
@@ -1,5 +1,7 @@
 require gtk+.inc
 
+LICENSE = "LGPLv2 LGPLv2+ LGPLv2.1+"
+
 SRC_URI_append_virtclass-native = " file://no-demos.patch \
 "
 SRC_URI_append = "file://gtk-dnd-grab-deadlock-fix.patch \
@@ -10,7 +12,7 @@ SRC_URI_append = "file://gtk-dnd-grab-deadlock-fix.patch \
 SRC_URI[gtk.md5sum] = "53e6f3a93bd22934878fc4a4a34c68aa"
 SRC_URI[gtk.sha256sum] = "0e081731d21e34ff45c82199490c2889504fa8b3c7e117c043e82ababaec0f65"
 
-PR = "${INC_PR}.4"
+PR = "${INC_PR}.5"
 
 BBCLASSEXTEND = "native"
 
-- 
1.7.0.4



