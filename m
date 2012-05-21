Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1SWTiO-0004Rs-7o
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 16:36:04 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4LEPu1H009457
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:25:56 -0500
Received: from DFLE71.ent.ti.com (dfle71.ent.ti.com [128.247.5.62])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LEPupZ032072
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:25:56 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 21 May 2012 09:25:56 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENApX008382;
	Mon, 21 May 2012 09:25:54 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 May 2012 09:30:00 -0500
Message-ID: <1337610609-1173-62-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
References: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 61/70] libdiscid: Update LICENSE field version to LGPLv2.1
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
X-List-Received-Date: Mon, 21 May 2012 14:36:05 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic LGPL to LGPLv2.1+ to
  reflect the real license version.
* This change was based on code inspection.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/libdiscid/libdiscid.inc      |    2 +-
 recipes/libdiscid/libdiscid_0.2.2.bb |    2 ++
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/libdiscid/libdiscid.inc b/recipes/libdiscid/libdiscid.inc
index 8dc7b54..3baf071 100644
--- a/recipes/libdiscid/libdiscid.inc
+++ b/recipes/libdiscid/libdiscid.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "The MusicBrainz client is a library which can be built into other
 It allows you to access the data held on the MusicBrainz server."
 
 HOMEPAGE = "http://musicbrainz.org"
-LICENSE = "LGPL"
+LICENSE = "LGPLv2.1+"
 
 SRC_URI = "http://users.musicbrainz.org/~matt/libdiscid-${PV}.tar.gz"
 
diff --git a/recipes/libdiscid/libdiscid_0.2.2.bb b/recipes/libdiscid/libdiscid_0.2.2.bb
index d69e710..08d4201 100644
--- a/recipes/libdiscid/libdiscid_0.2.2.bb
+++ b/recipes/libdiscid/libdiscid_0.2.2.bb
@@ -1,4 +1,6 @@
 require ${PN}.inc
 
+PR = "r1"
+
 SRC_URI[md5sum] = "ee21ddbe696a3c60e14827a75f3bcf5b"
 SRC_URI[sha256sum] = "974b5d5ab23fb45910a4fe171045a22a749cd8cb9833168f7178839993a58402"
-- 
1.7.0.4



