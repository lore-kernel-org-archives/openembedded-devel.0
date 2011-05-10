Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QJlGG-0005Za-Bw
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 13:37:56 +0200
Received: by fxm19 with SMTP id 19so4756069fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 04:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=NaKQch2Qpoyc8g72HAFWHFvQv82r7T4jZoL3IBwwjVE=;
	b=NjEUv3sq3/Ci1Y2neaXH0CG9jq7JMEtjs9P5dF7w4dzAzsEk6kYETGmqHFnU3VktjS
	UAw3XFeRIs5NbCq4fi94l6/qj3x8hCiuSsMbHHUIYLbWP0I/Tfkpt5Ulrf6qjfIXbl4Y
	MBhUqke9S6KETo97CIL/OJ7f3cJ5cf387LFBM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=HXzcwVgsLx/Xdy1KkEqZRxpKBIoUQo3fgc8pzUEme+hzR/qhUuNK2kRIS5GcDvExcv
	bnoXDQXIXizGhNf5P9POHc+Oq+DEhRrAKkvhjplN+9zzWR7+Szrb/W0pn2osnaitWaQK
	muysfWG+7GuBe4k9kulq5izshTyVaxz1BPZPs=
Received: by 10.223.83.141 with SMTP id f13mr718302fal.22.1305027310527;
	Tue, 10 May 2011 04:35:10 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id d18sm2342925fak.46.2011.05.10.04.35.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 04:35:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 May 2011 13:35:03 +0200
Message-Id: <601886e3f6be733b325d3e346e050aeddb8e0641.1305027207.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <cover.1305027207.git.Martin.Jansa@gmail.com>
References: <cover.1305027207.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 1/2] e-base: bump SRCREV and update fix-ecore-fb-initialization.patch patch for ecore_svn
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
X-List-Received-Date: Tue, 10 May 2011 11:37:56 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass                    |    2 +-
 .../ecore-1.0.0/fix-ecore-fb-initialization.patch  |   28 ++++++++++++++++++++
 .../efl/ecore/fix-ecore-fb-initialization.patch    |   17 ++++++-----
 3 files changed, 38 insertions(+), 9 deletions(-)
 create mode 100644 meta-efl/recipes-efl/efl/ecore-1.0.0/fix-ecore-fb-initialization.patch

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index b25ddf2..936a20d 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
 # usually tracks svn trunk HEAD
-EFL_SRCREV ?= "58429"
+EFL_SRCREV ?= "59242"
 # revision when 1.0.0 was released, for recipes which don't need rebuild so often
 EFL_SRCREV_1.0.0 ?= "56356"
 
diff --git a/meta-efl/recipes-efl/efl/ecore-1.0.0/fix-ecore-fb-initialization.patch b/meta-efl/recipes-efl/efl/ecore-1.0.0/fix-ecore-fb-initialization.patch
new file mode 100644
index 0000000..cd74c7e
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/ecore-1.0.0/fix-ecore-fb-initialization.patch
@@ -0,0 +1,28 @@
+#
+# The whole ecore-fb init logic is somewhat flawed; with this patch we
+# get at least a working touchscreen w/ tslib again.
+#
+# Signed-off-by: Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+#
+
+diff -uNr ecore.orig//src/lib/ecore_fb/ecore_fb.c ecore/src/lib/ecore_fb/ecore_fb.c
+--- ecore.orig//src/lib/ecore_fb/ecore_fb.c	2010-09-21 12:40:06.000000000 +0200
++++ ecore/src/lib/ecore_fb/ecore_fb.c	2010-09-24 18:42:02.000000000 +0200
+@@ -39,6 +39,9 @@
+    
+    if (!ecore_fb_vt_init())
+       return --_ecore_fb_init_count;
++
++   if (!ecore_fb_ts_init())
++     return --_ecore_fb_init_count;
+    
+    ECORE_FB_EVENT_KEY_DOWN          = ecore_event_type_new();
+    ECORE_FB_EVENT_KEY_UP            = ecore_event_type_new();
+@@ -63,6 +66,7 @@
+    if (--_ecore_fb_init_count != 0)
+       return _ecore_fb_init_count;
+ 
++   ecore_fb_ts_shutdown();
+    ecore_fb_vt_shutdown();
+ 
+    return _ecore_fb_init_count;
diff --git a/meta-efl/recipes-efl/efl/ecore/fix-ecore-fb-initialization.patch b/meta-efl/recipes-efl/efl/ecore/fix-ecore-fb-initialization.patch
index cd74c7e..216b5a5 100644
--- a/meta-efl/recipes-efl/efl/ecore/fix-ecore-fb-initialization.patch
+++ b/meta-efl/recipes-efl/efl/ecore/fix-ecore-fb-initialization.patch
@@ -5,20 +5,21 @@
 # Signed-off-by: Michael 'Mickey' Lauer <mlauer@vanille-media.de>
 #
 
-diff -uNr ecore.orig//src/lib/ecore_fb/ecore_fb.c ecore/src/lib/ecore_fb/ecore_fb.c
---- ecore.orig//src/lib/ecore_fb/ecore_fb.c	2010-09-21 12:40:06.000000000 +0200
-+++ ecore/src/lib/ecore_fb/ecore_fb.c	2010-09-24 18:42:02.000000000 +0200
-@@ -39,6 +39,9 @@
-    
+diff --git ecore.old/src/lib/ecore_fb/ecore_fb.c ecore/src/lib/ecore_fb/ecore_fb.c
+index 77071e3..a4e1c5d 100644
+--- ecore.old/src/lib/ecore_fb/ecore_fb.c
++++ ecore/src/lib/ecore_fb/ecore_fb.c
+@@ -46,6 +46,9 @@ ecore_fb_init(const char *name __UNUSED__)
     if (!ecore_fb_vt_init())
        return --_ecore_fb_init_count;
-+
+ 
 +   if (!ecore_fb_ts_init())
 +     return --_ecore_fb_init_count;
-    
++
     ECORE_FB_EVENT_KEY_DOWN          = ecore_event_type_new();
     ECORE_FB_EVENT_KEY_UP            = ecore_event_type_new();
-@@ -63,6 +66,7 @@
+    ECORE_FB_EVENT_MOUSE_BUTTON_DOWN = ecore_event_type_new();
+@@ -72,6 +75,7 @@ ecore_fb_shutdown(void)
     if (--_ecore_fb_init_count != 0)
        return _ecore_fb_init_count;
  
-- 
1.7.5.rc3



