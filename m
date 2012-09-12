Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1TBtfX-00082c-6p
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Sep 2012 22:36:19 +0200
Received: by bkcik5 with SMTP id ik5so126449bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2012 13:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=4iw/ekl82gTqGQ2cB5ct0SPK66miZ+VWv8Sp1Mxhpds=;
	b=Mm071Bra8iGXqrn2lbc+y74pJFIoAKs4jLUEl16jxjeSva53yG9hhYRPEucrkgKtz/
	38QPHhiQrq2tALQXUbfd9hY6sZ9TZLwE691Bgewtupcnlj4gJuXVy8U+6idHi6ikh8FY
	aLr9oZDTvG+Ia4PTyT1cPteYYOoZ32nfRKtFfpQNvUH7l2aPcpRvLLkJ5oAsIiAoifpi
	uRFbd88M5wkjbDFb3bDoemg/uystQ/VC/gHL/B7vQQDqOoHjGZDYNb72Xfv71ha+SsiB
	zHBZM6iLTIZwEROjWGjVjjKBQPkfwQXnBEj1d1/9qUBjzr25RDFzh+ruepKWLi0VsifG
	t6bQ==
Received: by 10.204.154.66 with SMTP id n2mr6551561bkw.138.1347481426779;
	Wed, 12 Sep 2012 13:23:46 -0700 (PDT)
Received: from mizar.localdomain
	(host43-254-dynamic.30-79-r.retail.telecomitalia.it. [79.30.254.43])
	by mx.google.com with ESMTPS id y20sm12948045bkv.11.2012.09.12.13.23.44
	(version=SSLv3 cipher=OTHER); Wed, 12 Sep 2012 13:23:45 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Sep 2012 22:23:35 +0200
Message-Id: <1347481415-4249-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-handheld][PATCH] zaurus.inc: fix virtual providers after xserver and mesa rework * * xserver-xorg-lite has been removed with commit 5868358 * mesa-xlib has been removed with commit 7a815ca * * default-providers.inc gives following settings: * PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg" * PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg" * PREFERRED_PROVIDER_virtual/libgl ?= "mesa-dri" * PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa-dri" * PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa-dri" * PREFERRED_PROVIDER_virtual/libx11 ?= "libx11"
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
X-List-Received-Date: Wed, 12 Sep 2012 20:36:19 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/include/zaurus.inc |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index 3f5c642..99fd7bd 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -60,10 +60,9 @@ EXTRA_IMAGECMD_sum.jffs2_collie = "--pad -l --eraseblock=0x20000 -n"
 # xserver
 #########
 
-PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg-lite"
-PREFERRED_PROVIDER_virtual/xserver-xf86 = "xserver-xorg-lite"
-XSERVER = "xserver-xorg-lite xf86-video-fbdev xf86-input-keyboard xf86-input-mouse xf86-input-evdev"
-PREFERRED_PROVIDER_virtual/libgl = "mesa-xlib"
+# Zaurus gets preferred providers settings
+# from distro/include/default-providers.inc
+XSERVER = "xserver-xorg xf86-video-fbdev xf86-input-keyboard xf86-input-mouse xf86-input-evdev"
 
 ########
 # kernel
-- 
1.7.8.6



