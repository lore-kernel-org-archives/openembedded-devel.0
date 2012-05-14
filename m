Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1STy53-0001xL-Eo
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 18:25:05 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4EG6Ydp026897
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:06:34 -0500
Received: from DFLE71.ent.ti.com (dfle71.ent.ti.com [128.247.5.62])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG6Yfs007511
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:06:34 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 14 May 2012 11:06:35 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG6AHk028612;
	Mon, 14 May 2012 11:06:33 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 May 2012 11:09:33 -0500
Message-ID: <1337011834-24879-9-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
References: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 08/69] gnome-vfs: Update LICENSE field version
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
X-List-Received-Date: Mon, 14 May 2012 16:25:05 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic GPL to GPLv2+ and
  LGPLv2+ to reflect the real license version.
* This change was based on setting in oe-core as well as code
  inspection

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/gnome/gnome-vfs_2.24.1.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/gnome/gnome-vfs_2.24.1.bb b/recipes/gnome/gnome-vfs_2.24.1.bb
index 268a219..7d797cf 100644
--- a/recipes/gnome/gnome-vfs_2.24.1.bb
+++ b/recipes/gnome/gnome-vfs_2.24.1.bb
@@ -1,9 +1,9 @@
-LICENSE = "GPL"
+LICENSE = "GPLv2+ LGPLv2+"
 DEPENDS = "libxml2 gconf gnutls avahi dbus dbus-glib bzip2 gnome-mime-data zlib gtk-doc-native"
 RRECOMMENDS_${PN} = "gnome-vfs-plugin-file shared-mime-info"
 # Some legacy packages will require gnome-mime-data to be installed, but use of
 # it is deprecated.
-PR = "r3"
+PR = "r4"
 
 inherit gnome
 
-- 
1.7.0.4



