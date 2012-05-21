Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1SWTiW-0004lM-6X
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 16:36:12 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4LEQ4jM010028
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:26:04 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LEQ4sH032279
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:26:04 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 21 May 2012 09:26:04 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENApa008382;
	Mon, 21 May 2012 09:26:02 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 May 2012 09:30:03 -0500
Message-ID: <1337610609-1173-65-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
References: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 64/70] libmusicbrainz: Update LICENSE field version to LGPLv2.1
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
X-List-Received-Date: Mon, 21 May 2012 14:36:13 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic LGPL to LGPLv2.1+ to
  reflect the real license version.
* This change was based on setting in oe-core as well as code
  inspection.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/musicbrainz/libmusicbrainz.inc      |    2 +-
 recipes/musicbrainz/libmusicbrainz_3.0.2.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/musicbrainz/libmusicbrainz.inc b/recipes/musicbrainz/libmusicbrainz.inc
index ce9b6fa..87099df 100644
--- a/recipes/musicbrainz/libmusicbrainz.inc
+++ b/recipes/musicbrainz/libmusicbrainz.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "The MusicBrainz client is a library which can be built into other programs. \
 It allows you to access the data held on the MusicBrainz server."
 HOMEPAGE = "http://musicbrainz.org"
-LICENSE = "LGPL"
+LICENSE = "LGPLv2.1+"
 
 DEPENDS = "expat neon libdiscid"
 
diff --git a/recipes/musicbrainz/libmusicbrainz_3.0.2.bb b/recipes/musicbrainz/libmusicbrainz_3.0.2.bb
index 52ffe53..e666bec 100644
--- a/recipes/musicbrainz/libmusicbrainz_3.0.2.bb
+++ b/recipes/musicbrainz/libmusicbrainz_3.0.2.bb
@@ -1,6 +1,6 @@
 require ${PN}.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI_append = " file://libmusicbrainz-3.0.2-gcc-4.4-fix.patch \
 	file://libmusicbrainz-3.0.2-cmake-neon.patch"
-- 
1.7.0.4



