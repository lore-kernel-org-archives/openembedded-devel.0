Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RRBSa-0002pB-7Y
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Nov 2011 00:33:36 +0100
Received: from mizar.localdomain (87.5.50.68) by smtp209.alice.it (8.5.124.08)
	id 4E850A860565B065; Fri, 18 Nov 2011 00:21:31 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Nov 2011 00:21:20 +0100
Message-Id: <1321572080-7382-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-handheld][PATCH] zaurus.inc: use xserver-xorg-lite
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
X-List-Received-Date: Thu, 17 Nov 2011 23:33:36 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

* we don't have DRI modules for zaurus AFAIK

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Tested-by Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/include/zaurus.inc |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index 416978f..b488f37 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -33,9 +33,10 @@ IMAGE_DEVICE_TABLES = "files/device_table-minimal.txt \
 # xserver
 #########
 
-PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
-XSERVER = "xserver-xorg xf86-video-fbdev xf86-input-keyboard xf86-input-mouse xf86-input-evdev"
-PREFERRED_PROVIDER_virtual/libgl = "mesa-dri"
+PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg-lite"
+PREFERRED_PROVIDER_virtual/xserver-xf86 = "xserver-xorg-lite"
+XSERVER = "xserver-xorg-lite xf86-video-fbdev xf86-input-keyboard xf86-input-mouse xf86-input-evdev"
+PREFERRED_PROVIDER_virtual/libgl = "mesa-xlib"
 
 ########
 # kernel
-- 
1.7.3.4



