Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1SWThu-0003hO-8u
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 16:35:35 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4LEPQFx005746
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:25:26 -0500
Received: from DFLE71.ent.ti.com (dfle71.ent.ti.com [128.247.5.62])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LEPQf5031634
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:25:26 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 21 May 2012 09:25:26 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENApM008382;
	Mon, 21 May 2012 09:25:24 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 May 2012 09:29:49 -0500
Message-ID: <1337610609-1173-51-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
References: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 50/70] orbit2: Update LICENSE field version to GPLv2
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
X-List-Received-Date: Mon, 21 May 2012 14:35:36 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic GPL to GPLv2+ to
  reflect the real license version.
* This change was based on setting in oe-core as well as code
  inspection.
* Update submitted to oe-core as well.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/gnome/orbit2_2.14.17.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/recipes/gnome/orbit2_2.14.17.bb b/recipes/gnome/orbit2_2.14.17.bb
index f893997..c83ddd3 100644
--- a/recipes/gnome/orbit2_2.14.17.bb
+++ b/recipes/gnome/orbit2_2.14.17.bb
@@ -1,5 +1,9 @@
 require orbit2.inc
 
+LICENSE = "GPLv2+"
+
+PR = "r1"
+
 SRC_URI += "file://disable-ipv6.patch"
 noipv6 = "${@base_contains('DISTRO_FEATURES', 'ipv6', '', '-DDISABLE_IPV6', d)}"
 EXTRA_OEMAKE_append = " 'CFLAGS=${CFLAGS} ${noipv6}'"
-- 
1.7.0.4



