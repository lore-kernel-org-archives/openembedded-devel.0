Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1STxzC-0006he-6K
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 18:19:14 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4EG92O6028427
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:09:02 -0500
Received: from DFLE71.ent.ti.com (dfle71.ent.ti.com [128.247.5.62])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG926M009802
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:09:02 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 14 May 2012 11:09:02 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG6AIf028612;
	Mon, 14 May 2012 11:09:00 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 May 2012 11:10:28 -0500
Message-ID: <1337011834-24879-64-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
References: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 63/69] libmusicbrainz: Update LICENSE field version
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
X-List-Received-Date: Mon, 14 May 2012 16:19:21 -0000
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



