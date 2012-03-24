Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SBSG2-0001j8-9Q
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Mar 2012 15:47:55 +0100
Received: by pbcum15 with SMTP id um15so3223320pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2012 07:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=03cXg8QuL2HTc7+BtNzIdRG20RFrD4BrSpwcxKmrync=;
	b=hy9YcAJ+boVGeXc8gWpmBtSYzvrsqHX69zkqpfcbcwwX4vy3GoXwq7uLnzg6pfwUpL
	d4Kt+2xBjTSV77R1vrHga0guIYhNFCfx5bLe3PKw54f9WiOd+tkwIExtKJS0z/QHz0Mj
	7hwMQNzuR2nTTJ7FGDEMkhWvxP+LWp98oKx1823HFB7zSRN0HsxyOm2chhKOYl4JrE8I
	zE9eaQ9ecLBayxeIM24CyxmVkgrgWZhrOcKnQ09xJAsNcutIt0jbDnykBLeIpDEnIIw+
	Lb3lYMLZ8UaOZdswgVUBTLH5m1Tki3vclvGYdP56OVeFuVIPtJjY51OtUfdlRI4NwCbE
	Eznw==
Received: by 10.68.240.164 with SMTP id wb4mr37954294pbc.57.1332599935947;
	Sat, 24 Mar 2012 07:38:55 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id i5sm3780059pbf.19.2012.03.24.07.38.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 24 Mar 2012 07:38:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 Mar 2012 07:38:03 -0700
Message-Id: <1332599883-358-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH] nautilus: Add gdk-pixbuf gtk+ to DEPENDS
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
X-List-Received-Date: Sat, 24 Mar 2012 14:47:55 -0000

Fixes

| eel-accessibility.c:26:21: fatal error: gtk/gtk.h: No such file or directory
| compilation terminated.
| make[2]: *** [eel-accessibility.lo] Error 1
| make[2]: *** Waiting for unfinished jobs....
| In file included from eel-background.c:26:0:
| eel-background.h:43:21: fatal error: gdk/gdk.h: No such file or directory
| compilation terminated.
| make[2]: *** [eel-background.lo] Error 1
| eel-canvas.c:69:28: fatal error: gdk/gdkprivate.h: No such file or directory

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-gnome/nautilus/nautilus_2.32.2.bb      |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
index fa136e1..bc45342 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
@@ -6,9 +6,9 @@ LICENSE="GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7c0048536e43642a1f3a724c2909872b \
                     file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
 
-PR = "r5"
+PR = "r6"
 
-DEPENDS = "libunique gvfs librsvg libexif esound gnome-desktop orbit2-native"
+DEPENDS = "gdk-pixbuf gtk+ libunique gvfs librsvg libexif esound gnome-desktop orbit2-native"
 # optional: tracker
 
 inherit gnome
-- 
1.7.5.4



