Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Szpgv-0001GZ-9Y
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:55:53 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1218754wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=wO/0SPnisIce+mMlqYmmcSoi5Hot0/7dnDUnG7/LtAM=;
	b=rRNG+4ma6at8pOUbtcDJi0fcaz71s+wAof3a0NuzjF9jPs1x+DMFIX5mGFKeCVZHC1
	zlL+GjLd47qy64YVbOfomjRl4lIT5flUUpFa9e2fkNXREMrLt6dYJ12e2wMJJZKySvWW
	9PcIydxil1Te8nTcU/tKM+JdjOfVVEPxoisiTEGaj4oSwhh2UwlYZkqzVvwiaucWZsmw
	90BcruiYk+fe59/JzxU7RHmeSkT0clEgAmb+oPWP00CxbpvbW0ZITnyM3z/t4TwD6PzT
	tiSRudNbzHTshs65L1ZFDCzI+zLBFd9zlDXWCdACn6S2IuHFru72gwNf7wTTLbLDPF9s
	eSBQ==
Received: by 10.216.131.135 with SMTP id m7mr1741018wei.72.1344606245900;
	Fri, 10 Aug 2012 06:44:05 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fb20sm11632603wid.1.2012.08.10.06.44.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:44:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:42:58 +0200
Message-Id: <1ca20b1501f64da3dbf6c54269d28503daddc8ce.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 03/46] ecore: update fix-ecore-fb-initialization.patch for svn recipe
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
X-List-Received-Date: Fri, 10 Aug 2012 13:55:53 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../ecore-1.2.1/fix-ecore-fb-initialization.patch  |   41 ++++++++++++++++++++
 .../efl/ecore/fix-ecore-fb-initialization.patch    |   24 ++++++------
 2 files changed, 53 insertions(+), 12 deletions(-)
 create mode 100644 meta-efl/recipes-efl/efl/ecore-1.2.1/fix-ecore-fb-initialization.patch

diff --git a/meta-efl/recipes-efl/efl/ecore-1.2.1/fix-ecore-fb-initialization.patch b/meta-efl/recipes-efl/efl/ecore-1.2.1/fix-ecore-fb-initialization.patch
new file mode 100644
index 0000000..a2ce285
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/ecore-1.2.1/fix-ecore-fb-initialization.patch
@@ -0,0 +1,41 @@
+From c36cd1201711560b914e567922903083c3b46ff1 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 29 Oct 2011 00:16:55 +0200
+Subject: [PATCH] ecore-fb: fix ts init
+
+Upstream-Status: Pending
+
+The whole ecore-fb init logic is somewhat flawed; with this patch we
+get at least a working touchscreen w/ tslib again.
+
+Signed-off-by: Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/lib/ecore_fb/ecore_fb.c |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/src/lib/ecore_fb/ecore_fb.c b/src/lib/ecore_fb/ecore_fb.c
+index ca7d73d..5b99989 100644
+--- a/src/lib/ecore_fb/ecore_fb.c
++++ b/src/lib/ecore_fb/ecore_fb.c
+@@ -39,6 +39,9 @@ ecore_fb_init(const char *name __UNUSED__)
+    if (!ecore_fb_vt_init())
+       return --_ecore_fb_init_count;
+ 
++   if (!ecore_fb_ts_init())
++      return --_ecore_fb_init_count;
++
+    _ecore_fb_size_get(&_ecore_fb_console_w, &_ecore_fb_console_h);
+ 
+    return _ecore_fb_init_count;
+@@ -59,6 +62,7 @@ ecore_fb_shutdown(void)
+    if (--_ecore_fb_init_count != 0)
+       return _ecore_fb_init_count;
+ 
++   ecore_fb_ts_shutdown();
+    ecore_fb_vt_shutdown();
+ 
+    return _ecore_fb_init_count;
+-- 
+1.7.7.1
+
diff --git a/meta-efl/recipes-efl/efl/ecore/fix-ecore-fb-initialization.patch b/meta-efl/recipes-efl/efl/ecore/fix-ecore-fb-initialization.patch
index a2ce285..55773a3 100644
--- a/meta-efl/recipes-efl/efl/ecore/fix-ecore-fb-initialization.patch
+++ b/meta-efl/recipes-efl/efl/ecore/fix-ecore-fb-initialization.patch
@@ -1,4 +1,4 @@
-From c36cd1201711560b914e567922903083c3b46ff1 Mon Sep 17 00:00:00 2001
+From 657571197c9d369e12ae31b6777a1929fe3680ef Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 29 Oct 2011 00:16:55 +0200
 Subject: [PATCH] ecore-fb: fix ts init
@@ -11,31 +11,31 @@ get at least a working touchscreen w/ tslib again.
 Signed-off-by: Michael 'Mickey' Lauer <mlauer@vanille-media.de>
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- src/lib/ecore_fb/ecore_fb.c |    4 ++++
+ ecore/src/lib/ecore_fb/ecore_fb.c |    4 ++++
  1 files changed, 4 insertions(+), 0 deletions(-)
 
 diff --git a/src/lib/ecore_fb/ecore_fb.c b/src/lib/ecore_fb/ecore_fb.c
-index ca7d73d..5b99989 100644
+index 5b2b84b..a1904b3 100644
 --- a/src/lib/ecore_fb/ecore_fb.c
 +++ b/src/lib/ecore_fb/ecore_fb.c
-@@ -39,6 +39,9 @@ ecore_fb_init(const char *name __UNUSED__)
+@@ -46,6 +46,9 @@ ecore_fb_init(const char *name __UNUSED__)
     if (!ecore_fb_vt_init())
        return --_ecore_fb_init_count;
  
 +   if (!ecore_fb_ts_init())
 +      return --_ecore_fb_init_count;
 +
-    _ecore_fb_size_get(&_ecore_fb_console_w, &_ecore_fb_console_h);
- 
-    return _ecore_fb_init_count;
-@@ -59,6 +62,7 @@ ecore_fb_shutdown(void)
-    if (--_ecore_fb_init_count != 0)
-       return _ecore_fb_init_count;
- 
+    if (!oldhand)
+      {
+         oldhand = signal(SIGINT, nosigint);
+@@ -77,6 +80,7 @@ ecore_fb_shutdown(void)
+         oldhand = NULL;
+      }
+    
 +   ecore_fb_ts_shutdown();
     ecore_fb_vt_shutdown();
  
     return _ecore_fb_init_count;
 -- 
-1.7.7.1
+1.7.8.6
 
-- 
1.7.8.6



