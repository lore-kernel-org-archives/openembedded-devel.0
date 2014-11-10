Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-03.prod.phx3.secureserver.net
	(p3plsmtpa07-03.prod.phx3.secureserver.net [173.201.192.232])
	by mail.openembedded.org (Postfix) with ESMTP id D08EC720B8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Nov 2014 21:16:36 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa07-03.prod.phx3.secureserver.net with 
	id DxGa1p00B0BVjqb01xGdgA; Mon, 10 Nov 2014 14:16:37 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Nov 2014 15:16:24 -0600
Message-Id: <2e0c03207c52508da73111c1890d3c59bd2feb3a.1415650249.git.pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <cover.1415650249.git.pab@pabigot.com>
References: <cover.1415650249.git.pab@pabigot.com>
In-Reply-To: <cover.1415650249.git.pab@pabigot.com>
References: <cover.1415650249.git.pab@pabigot.com>
Subject: [meta-gnome][RFC 05/10] gvfs: switch to virtual/bluez
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Nov 2014 21:16:37 -0000

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb
index 131c849..4e1dd23 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb
@@ -29,5 +29,5 @@ PACKAGECONFIG[samba] = "--enable-samba --with-samba-includes=${STAGING_INCDIR} \
 # needs meta-filesystems
 PACKAGECONFIG[fuse] = "--enable-fuse, --disable-fuse, fuse"
 PACKAGECONFIG[archive] = "--enable-archive, --disable-archive, libarchive"
-PACKAGECONFIG[obexftp] = "--enable-obexftp, --disable-obexftp, bluez4 expat"
+PACKAGECONFIG[obexftp] = "--enable-obexftp, --disable-obexftp, virtual/bluez expat"
 PACKAGECONFIG[cdda] = "--enable-cdda, --disable-cdda, libcdio"
-- 
1.8.5.5


