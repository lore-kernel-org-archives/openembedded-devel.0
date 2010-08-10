Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1OiuW8-0001G3-Bg
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 21:29:47 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id AEFB080C527; Tue, 10 Aug 2010 21:29:32 +0200 (CEST)
Received: from localhost (p5489A930.dip.t-dialin.net [84.137.169.48])
	by gravedo.de (Postfix) with ESMTPSA id 8AF6B80C4FF;
	Tue, 10 Aug 2010 21:29:31 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Aug 2010 21:29:28 +0200
Message-Id: <1281468568-8990-1-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] ecore: remove fix-ecore-fb-initialization.patch
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
X-List-Received-Date: Tue, 10 Aug 2010 19:29:47 -0000

Removing the fix-ecore-fb-initialization patch as it let ecore open the supplied
touchscreen device twice which results in an error on platforms where the touchscreen
device node can be opened only once. Furthermore I doubt that it is necessary to open the
touchscreen device node more than one time.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/efl1/ecore.inc                             |    2 -
 .../efl1/ecore/fix-ecore-fb-initialization.patch   |   29 --------------------
 2 files changed, 0 insertions(+), 31 deletions(-)
 delete mode 100644 recipes/efl1/ecore/fix-ecore-fb-initialization.patch

diff --git a/recipes/efl1/ecore.inc b/recipes/efl1/ecore.inc
index bb7eea5..081572d 100644
--- a/recipes/efl1/ecore.inc
+++ b/recipes/efl1/ecore.inc
@@ -12,8 +12,6 @@ inherit efl
 
 BBCLASSEXTEND = "native"
 
-SRC_URI += "file://fix-ecore-fb-initialization.patch"
-
 do_configure_prepend() {
 	touch ${S}/po/Makefile.in.in || true
 	sed -i -e 's: po::g' ${S}/Makefile.am
diff --git a/recipes/efl1/ecore/fix-ecore-fb-initialization.patch b/recipes/efl1/ecore/fix-ecore-fb-initialization.patch
deleted file mode 100644
index 2ac61ca..0000000
--- a/recipes/efl1/ecore/fix-ecore-fb-initialization.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-#
-# The whole ecore-fb init logic is somewhat flawed; with this patch we
-# get at least a working touchscreen w/ tslib again.
-#
-# Signed-off-by: Michael 'Mickey' Lauer <mlauer@vanille-media.de>
-#
-
-Index: ecore/src/lib/ecore_fb/ecore_fb.c
-===================================================================
---- ecore.orig/src/lib/ecore_fb/ecore_fb.c
-+++ ecore/src/lib/ecore_fb/ecore_fb.c
-@@ -46,6 +46,9 @@
- 
-    if (!ecore_fb_vt_init())
-      return --_ecore_fb_init_count;
-+     
-+   if (!ecore_fb_ts_init())
-+     return --_ecore_fb_init_count;
- 
-    ECORE_FB_EVENT_KEY_DOWN          = ecore_event_type_new();
-    ECORE_FB_EVENT_KEY_UP            = ecore_event_type_new();
-@@ -70,6 +73,7 @@
-    if (--_ecore_fb_init_count != 0)
-      return _ecore_fb_init_count;
- 
-+   ecore_fb_ts_shutdown();
-    ecore_fb_vt_shutdown();
- 
-    return _ecore_fb_init_count;
-- 
1.7.0.4



