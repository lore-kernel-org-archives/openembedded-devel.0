Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AE649772C4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jun 2016 09:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u529YCMS027541; Thu, 2 Jun 2016 10:34:15 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4LVFBskZGosz; Thu,  2 Jun 2016 10:34:14 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u529YDQn027547
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 2 Jun 2016 10:34:14 +0100
Received: from richard by hex with local (Exim 4.86)
	(envelope-from <richard@rpsys.net>)
	id 1b8P13-0003wm-GB; Thu, 02 Jun 2016 10:34:13 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jun 2016 10:34:06 +0100
Message-Id: <1464860046-15121-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1464860046-15121-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1464860046-15121-1-git-send-email-richard.purdie@linuxfoundation.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/3] abiword/gnone-vfs: Use print as a function
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Jun 2016 09:34:17 -0000

In python 3, print is a function. Disable some pointless debug output
whilst here.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb      | 2 +-
 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb b/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
index 962a56c..e0888c1 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
@@ -113,7 +113,7 @@ python populate_packages_prepend () {
     packages = d.getVar('PACKAGES', 1).split()
     for pkg in packages[1:]:
         if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.count("-dev") and not pkg.count("-dbg") and not pkg.count("static") and not pkg.count("locale") and not pkg.count("abiword-doc"):
-            print "Modifying ", pkg
+            print("Modifying %s" % pkg)
             metapkg_rdepends.append(pkg)
     d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
     d.setVar('DESCRIPTION_' + metapkg, 'abiword-plugin meta package')
diff --git a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
index f9b02b1..d311338 100644
--- a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
@@ -53,7 +53,7 @@ FILES_${PN}-doc += "${datadir}/gtk-doc"
 PACKAGES_DYNAMIC += "^gnome-vfs-plugin-.*"
 
 python populate_packages_prepend () {
-    print d.getVar('FILES_gnome-vfs', 1)
+    #print(d.getVar('FILES_gnome-vfs', True))
 
     plugindir = d.expand('${libdir}/gnome-vfs-2.0/modules/')
     do_split_packages(d, plugindir, '^lib(.*)\.so$', 'gnome-vfs-plugin-%s', 'GNOME VFS plugin for %s')
-- 
2.7.4


