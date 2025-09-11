Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C05BCAC587
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 08:16:38 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.40885.1757578593360059977
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Sep 2025 01:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F+vRdlOa;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b046fc9f359so72456366b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 01:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757578591; x=1758183391; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ok/s8kWugUX/pWGdP/4kye8bVlQwu1ncfEq5UX9e8lU=;
        b=F+vRdlOadkAwyYlmi5PNi9TcrFiHko5xGMJPS+NcJpCg5sBevne1rKJK0CGwcSA8hS
         BjEwaDivVTwdxH0AtwRJ3eFkyunfWg00IebSqvb2jddCUXCzee4ZMqY3ARsGh9sWcVGa
         N9rq8iiQPXlCraDKU8eeoo35is/XxrrpqsVYHsHrS8VGJ9+aeB6XiI9Bqqrks4q4KpKS
         gTEvrXX1gpwUOUmWB37R8M+O3MYF0A0bM5NDPZjXNRrX50EFUiuvpCrnNrU6aCpC6vpp
         2alj9400VNbAPaoyz/ELo18xp0CtzwQghk9XRzzqfY05C7/+7Mg6/oFeEeR10+ZOnSuj
         Dnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757578591; x=1758183391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ok/s8kWugUX/pWGdP/4kye8bVlQwu1ncfEq5UX9e8lU=;
        b=b2AFV0Zosih+6hhBiE9Wg/8RrNGNQd7/7/EowZgngJc9qI0j3XPJEulwVw1GhMRkMy
         N15CW/32vqBWfIcdAHGkHTHpZEfxPfwwGMBaIIT7gLB1bqbuIi/G0Hk54nBbQysMTeaA
         nFzLSNhwPS/d9ScEAIYYlZlw5VWfTSiiiabiGWDQOd4f96m7lH96ZI5dL9slRnFdW0J7
         AVU1/SX6pcxesspIVx0oOs8Ah6IWMpXmoPX6nGjCVwaQAWVNeNE8nYvz3j4FJuPtlkn2
         PIeCkKIIp42TRkBi1medhEhZ+3ta1FKos2AI5YEc1ANrcTj+kEj8XtHbNUp+Xq5bM32q
         N3DQ==
X-Gm-Message-State: AOJu0YzEWbunmz5IwIuh1PrVKAVgfvZ+Iqkwp0sKVTL0RzET9NNNAH++
	kuuuc/eArNNF8NVJjzR5A+01eswB/xa2jXjrfWXF5z3/FHVWeZHhOL1vBMAvPA==
X-Gm-Gg: ASbGncsA5kmOj3p2SHAvJVGYVdDlEDNXSU5ZHwMwDsOsaAT3z0bSW+xtPUywd/hZfAm
	sh7y1tMQDMS6Z4+NckJP2ccp/R7CYzgL01YAfATsxD+49OUIPLXxWVWmVPMDLAqjuGaTbP7frYt
	Om0ykAztmKzTn1pQGQcZKnFWMNwFWrzmYd/lehW4rdN+I6TmmPDo9PlGpIwWCe6RBemEwXHQJnf
	pBfyoTQx0BbRFA/y1/IVWWFvIDXXfQGMIqAL/TWIXEOYAq9d+sn4vJtcUBvG/OMlHfQEmBCLJYY
	1VimGsnxVURN2SWgs6eMwm8JTxcF3hlarKWTS9AQsQq8uauilqZdj8SwbOkc7Gjs+BP3MhsHi7d
	+KS1za07SzTg9/QiaBTQ6ilmF7qjrrOH0he91LRZd/w==
X-Google-Smtp-Source: AGHT+IEPjCU7psOTCw4VUM1Lk9BMXcNtCLLI/xqdggukiROYdy07z4Gi6mUlW6CRgmZZumxfGjNG1g==
X-Received: by 2002:a17:907:7f8d:b0:aeb:3df1:2e75 with SMTP id a640c23a62f3a-b04b167d032mr1788019466b.46.1757578591316;
        Thu, 11 Sep 2025 01:16:31 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b30da302sm79144366b.16.2025.09.11.01.16.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 01:16:30 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][walnascar][PATCH] metacity: fix compilation on 32-bit systems
Date: Thu, 11 Sep 2025 10:16:29 +0200
Message-ID: <20250911081629.1775068-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 08:16:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119357

On 32-bit targets the compilation fails with the following error:

| ../../metacity-3.52.0/src/core/screen.c:2431:55: error: passing argument 2 of 'sn_startup_sequence_get_last_active_time' from incompatible pointer type [-Wincompatible-pointer-types]
|  2431 |   sn_startup_sequence_get_last_active_time (sequence, &tv_sec, &tv_usec);
|       |                                                       ^~~~~~~
|       |                                                       |
|       |                                                       long int *

Backport patch from upstream to address this problem.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...tartup_sequence_get_last_active_time.patch | 188 ++++++++++++++++++
 .../recipes-gnome/metacity/metacity_3.52.0.bb |   3 +-
 2 files changed, 190 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/metacity/metacity/screen_avoid_sn_startup_sequence_get_last_active_time.patch

diff --git a/meta-gnome/recipes-gnome/metacity/metacity/screen_avoid_sn_startup_sequence_get_last_active_time.patch b/meta-gnome/recipes-gnome/metacity/metacity/screen_avoid_sn_startup_sequence_get_last_active_time.patch
new file mode 100644
index 0000000000..d641a9139d
--- /dev/null
+++ b/meta-gnome/recipes-gnome/metacity/metacity/screen_avoid_sn_startup_sequence_get_last_active_time.patch
@@ -0,0 +1,188 @@
+From 89eecad37d4c5faa7a7cc5c6e23cd11e76157a92 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Alberts=20Muktup=C4=81vels?= <alberts.muktupavels@gmail.com>
+Date: Sun, 27 Oct 2024 18:20:32 +0200
+Subject: [PATCH] screen: avoid sn_startup_sequence_get_last_active_time
+
+startup-notification has change that changes `tv_sec` parameter
+type from `long` to `time_t` for over 10 years but there has not
+been new release.
+
+`get_last_active_time` returns same time as `get_initiated_time`
+which is simply time when startup was initiated. To avoid potential
+problems using wrong type we can just stop using related function
+and record initiation time ourselves.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/metacity/-/commit/89eecad37d4c5faa7a7cc5c6e23cd11e76157a92]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/core/screen.c | 84 ++++++++++++++++++++++++++++++++++++++---------
+ 1 file changed, 69 insertions(+), 15 deletions(-)
+
+diff --git a/src/core/screen.c b/src/core/screen.c
+index 495222f5..e79b54fb 100644
+--- a/src/core/screen.c
++++ b/src/core/screen.c
+@@ -143,6 +143,34 @@ set_wm_icon_size_hint (MetaScreen *screen)
+ #undef N_VALS
+ }
+ 
++typedef struct
++{
++  SnStartupSequence *sequence;
++  int64_t            time;
++} MetaStartupSequence;
++
++static MetaStartupSequence *
++meta_startup_sequence_new (SnStartupSequence *sequence)
++{
++  MetaStartupSequence *self;
++
++  self = g_new0 (MetaStartupSequence, 1);
++
++  self->sequence = sequence;
++  self->time = g_get_real_time ();
++
++  sn_startup_sequence_ref (sequence);
++
++  return self;
++}
++
++static void
++meta_startup_sequence_free (MetaStartupSequence *self)
++{
++  g_clear_pointer (&self->sequence, sn_startup_sequence_unref);
++  g_free (self);
++}
++
+ static void
+ reload_monitor_infos (MetaScreen *screen)
+ {
+@@ -543,7 +543,7 @@
+   meta_screen_ungrab_keys (screen);
+ 
+ #ifdef HAVE_STARTUP_NOTIFICATION
+-  g_slist_free_full (screen->startup_sequences, (GDestroyNotify) sn_startup_sequence_unref);
++  g_slist_free_full (screen->startup_sequences, (GDestroyNotify) meta_startup_sequence_free);
+   screen->startup_sequences = NULL;
+ 
+   if (screen->startup_sequence_timeout != 0)
+@@ -2366,12 +2394,15 @@ static void
+ add_sequence (MetaScreen        *screen,
+               SnStartupSequence *sequence)
+ {
++  MetaStartupSequence *meta_sequence;
++
+   meta_topic (META_DEBUG_STARTUP,
+               "Adding sequence %s\n",
+               sn_startup_sequence_get_id (sequence));
+-  sn_startup_sequence_ref (sequence);
++
++  meta_sequence = meta_startup_sequence_new (sequence);
+   screen->startup_sequences = g_slist_prepend (screen->startup_sequences,
+-                                               sequence);
++                                               meta_sequence);
+ 
+   /* our timeout just polls every second, instead of bothering
+    * to compute exactly when we may next time out
+@@ -2384,17 +2415,38 @@ add_sequence (MetaScreen        *screen,
+   update_startup_feedback (screen);
+ }
+ 
++static int
++find_sequence_func (gconstpointer a,
++                    gconstpointer b)
++{
++  MetaStartupSequence *meta_sequence;
++  SnStartupSequence *sequence;
++
++  meta_sequence = (MetaStartupSequence *) a;
++  sequence = (SnStartupSequence *) b;
++
++  if (meta_sequence->sequence == sequence)
++    return 0;
++
++  return -1;
++}
++
+ static void
+ remove_sequence (MetaScreen        *screen,
+                  SnStartupSequence *sequence)
+ {
++  GSList *l;
++
+   meta_topic (META_DEBUG_STARTUP,
+               "Removing sequence %s\n",
+               sn_startup_sequence_get_id (sequence));
+ 
+-  screen->startup_sequences = g_slist_remove (screen->startup_sequences,
+-                                              sequence);
+-  sn_startup_sequence_unref (sequence);
++  l = g_slist_find_custom (screen->startup_sequences,
++                           sequence,
++                           find_sequence_func);
++
++  screen->startup_sequences = g_slist_remove_link (screen->startup_sequences, l);
++  g_slist_free_full (l, (GDestroyNotify) meta_startup_sequence_free);
+ 
+   if (screen->startup_sequences == NULL &&
+       screen->startup_sequence_timeout != 0)
+@@ -2424,13 +2476,11 @@ collect_timed_out_foreach (void *element,
+                            void *data)
+ {
+   CollectTimedOutData *ctod = data;
+-  SnStartupSequence *sequence = element;
+-  long tv_sec, tv_usec;
++  MetaStartupSequence *meta_sequence = element;
++  SnStartupSequence *sequence = meta_sequence->sequence;
+   double elapsed;
+ 
+-  sn_startup_sequence_get_last_active_time (sequence, &tv_sec, &tv_usec);
+-
+-  elapsed = (ctod->now - (tv_sec * G_USEC_PER_SEC + tv_usec)) / 1000.0;
++  elapsed = (ctod->now - meta_sequence->time) / 1000.0;
+ 
+   meta_topic (META_DEBUG_STARTUP,
+               "Sequence used %g seconds vs. %g max: %s\n",
+@@ -2572,9 +2622,11 @@ meta_screen_apply_startup_properties (MetaScreen *screen,
+       tmp = screen->startup_sequences;
+       while (tmp != NULL)
+         {
++          MetaStartupSequence *meta_sequence;
+           const char *wmclass;
+ 
+-          wmclass = sn_startup_sequence_get_wmclass (tmp->data);
++          meta_sequence = tmp->data;
++          wmclass = sn_startup_sequence_get_wmclass (meta_sequence->sequence);
+ 
+           if (wmclass != NULL &&
+               ((window->res_class &&
+@@ -2582,7 +2634,7 @@ meta_screen_apply_startup_properties (MetaScreen *screen,
+                (window->res_name &&
+                 strcmp (wmclass, window->res_name) == 0)))
+             {
+-              sequence = tmp->data;
++              sequence = meta_sequence->sequence;
+ 
+               g_assert (window->startup_id == NULL);
+               window->startup_id = g_strdup (sn_startup_sequence_get_id (sequence));
+@@ -2614,13 +2666,15 @@ meta_screen_apply_startup_properties (MetaScreen *screen,
+       tmp = screen->startup_sequences;
+       while (tmp != NULL)
+         {
++          MetaStartupSequence *meta_sequence;
+           const char *id;
+ 
+-          id = sn_startup_sequence_get_id (tmp->data);
++          meta_sequence = tmp->data;
++          id = sn_startup_sequence_get_id (meta_sequence->sequence);
+ 
+           if (strcmp (id, startup_id) == 0)
+             {
+-              sequence = tmp->data;
++              sequence = meta_sequence->sequence;
+               break;
+             }
+ 
+-- 
+GitLab
+
diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.52.0.bb b/meta-gnome/recipes-gnome/metacity/metacity_3.52.0.bb
index 32f0801706..7f202bb772 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_3.52.0.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_3.52.0.bb
@@ -25,7 +25,8 @@ GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase gsettings gettext upstream-version-is-even features_check
 
 SRC_URI[archive.sha256sum] = "a72438ace6d5903ae79338c6098b1b35ab91c8a97c4323701d3bef1f3eeb191c"
-SRC_URI += "file://0001-drop-zenity-detection.patch"
+SRC_URI += "file://0001-drop-zenity-detection.patch \
+            file://screen_avoid_sn_startup_sequence_get_last_active_time.patch"
 
 PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama"
 # enable as neccessary until new warnings are dealt with

