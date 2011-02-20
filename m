Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PrAw8-0006lh-98
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 16:11:00 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PrAun-00064H-Nw from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 07:09:37 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sun, 20 Feb 2011 07:09:37 -0800
Received: from localhost.localdomain ([172.30.80.150]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 20 Feb 2011 08:09:36 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Feb 2011 08:09:19 -0700
Message-Id: <1298214559-9650-5-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1298214559-9650-1-git-send-email-tom_rini@mentor.com>
References: <1298214559-9650-1-git-send-email-tom_rini@mentor.com>
X-OriginalArrivalTime: 20 Feb 2011 15:09:36.0269 (UTC)
	FILETIME=[2FDA03D0:01CBD110]
Subject: [PATCH 4/4] gvfs 1.7.2: Drop DEFAULT_PREFERENCE
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
X-List-Received-Date: Sun, 20 Feb 2011 15:11:00 -0000

This is the version required for glib-2.28.0 which is default unless
pinned.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 recipes/gnome/gvfs_1.7.2.bb |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/recipes/gnome/gvfs_1.7.2.bb b/recipes/gnome/gvfs_1.7.2.bb
index 189f655..3c33537 100644
--- a/recipes/gnome/gvfs_1.7.2.bb
+++ b/recipes/gnome/gvfs_1.7.2.bb
@@ -2,8 +2,6 @@ DESCRIPTION = "gvfs is a userspace virtual filesystem"
 LICENSE = "LGPLv2"
 DEPENDS = "libcdio gawk-native libimobiledevice gnome-keyring glib-2.0 obexftp fuse avahi fuse hal gconf samba gphoto2"
 
-DEFAULT_PREFERENCE = "-1"
-
 inherit gnome
 
 SRC_URI[archive.md5sum] = "d8a57290a5d090b07cd2f23914f20f4e"
-- 
1.7.0.4



