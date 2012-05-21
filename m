Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1SWTij-00050Y-HU
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 16:36:27 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4LEQHDH005882
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:26:17 -0500
Received: from DFLE71.ent.ti.com (dfle71.ent.ti.com [128.247.5.62])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LEQHXw032462
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:26:17 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 21 May 2012 09:26:17 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENApf008382;
	Mon, 21 May 2012 09:26:15 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 May 2012 09:30:08 -0500
Message-ID: <1337610609-1173-70-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
References: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 69/70] python-pygtk: Update LICENSE field version to LGPLv2.1
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
X-List-Received-Date: Mon, 21 May 2012 14:36:29 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic LGPL to LGPLv2.1 to
  reflect the real license version.
* This change was based on setting in oe-core as well as code
  inspection.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/python/python-pygtk_2.16.0.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/python/python-pygtk_2.16.0.bb b/recipes/python/python-pygtk_2.16.0.bb
index 699bd5d..170383f 100644
--- a/recipes/python/python-pygtk_2.16.0.bb
+++ b/recipes/python/python-pygtk_2.16.0.bb
@@ -5,8 +5,8 @@ DEPENDS = "gtk+ libglade python-pycairo python-pygobject"
 RDEPENDS_${PN} = "python-shell python-pycairo python-pygobject"
 PROVIDES = "python-pygtk2"
 SRCNAME = "pygtk"
-LICENSE = "LGPL"
-PR = "r3"
+LICENSE = "LGPLv2.1"
+PR = "r4"
 
 MAJ_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
 SRC_URI = "ftp://ftp.gnome.org/pub/gnome/sources/pygtk/${MAJ_VER}/${SRCNAME}-${PV}.tar.bz2;name=pygtk \
-- 
1.7.0.4



