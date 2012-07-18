Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Srbph-0000f1-Hm
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jul 2012 23:30:57 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so1222814wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2012 14:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=wO/0SPnisIce+mMlqYmmcSoi5Hot0/7dnDUnG7/LtAM=;
	b=TnGNU3s+95xyht68iucDJ+y2oPAIPozbJ2AanmPVDXrm7fr0mwO2wahOj0yM6V78gW
	HdDTYWymEw0sQ7lwDK1aAQN/7q5EMc6E8DOzE+bRUOSMQBMD/RQXJRR1VE51nwWFn7cg
	aZTRaU4lD0UTCU8AGaSh0K3FsNIeAJUPsRO11H77W+VK701pQ2bwZJpwgFQqtk7kbaRG
	BPPmmJN7QJRqTQLRpZtiksFgnkxuRKjdCthDK96vME61d9IJyXN/Vw0+AbiV9PPrjACJ
	wrGYLRnEZ4Da6i8C6BZG8Fgr43U8rkbVSL+22yBB1sbzxqsXzyc7AoymFk92/GFYB8Nu
	GngA==
Received: by 10.180.79.229 with SMTP id m5mr9897717wix.13.1342646378757;
	Wed, 18 Jul 2012 14:19:38 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t8sm34626445wiy.3.2012.07.18.14.19.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jul 2012 14:19:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Jul 2012 23:19:13 +0200
Message-Id: <92856260883f66d4562004db870f57454dc8fe08.1342645937.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1342645937.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1342645937.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][RFC 03/14] ecore: update fix-ecore-fb-initialization.patch for svn recipe
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
X-List-Received-Date: Wed, 18 Jul 2012 21:30:57 -0000

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



