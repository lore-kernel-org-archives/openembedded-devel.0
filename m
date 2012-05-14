Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1STxz4-0005sh-4b
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 18:19:09 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4EG8sat028415
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:08:54 -0500
Received: from DFLE70.ent.ti.com (dfle70.ent.ti.com [128.247.5.40])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG8sT4009699
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:08:54 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 14 May 2012 11:08:55 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG6AIc028612;
	Mon, 14 May 2012 11:08:52 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 May 2012 11:10:25 -0500
Message-ID: <1337011834-24879-61-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
References: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 60/69] libdiscid: Update LICENSE field version
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



