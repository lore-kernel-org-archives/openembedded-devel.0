Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 645ACCC6B1A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 09:25:37 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9247.1791969929967879696
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 02:25:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UylwDiU3;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-89a756e5d20so2974608b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 02:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791969929; x=1792574729; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=elzW/IhIrW0uicn22cC85Dq/cwPxkRaI4vt9zsGwJwE=;
        b=UylwDiU3gJTCBj24+1igRlwojKSiHW43vVv/4EpgrsVqXsHH5kFPmlbtnIehpuR3rx
         TTAk7vBMnaL77KSfh5Yj2kmcAiddFGrtffIisvob/YlWsItjjzUZesOd4NZozCDdjgpL
         0tOuuqNyYwuncfBSxfojVSr3to/u0bJ8OsXH44n7vvUJeYeu3Mlqk0hlY1ldGH3K8kCP
         rFR2gM8bLyVSMyFAdNAdkASpYoEBM95BAJIPJEE+YAa62yxg8e/4cs0ZK/4Y5KrA7KmR
         AkFWilRgXbofPp9E511Eq+Oek2OQhJ+S7dkIPZqQm7PaabFGDH9m9OzYbYnxPgrI2K5w
         jFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969929; x=1792574729;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=elzW/IhIrW0uicn22cC85Dq/cwPxkRaI4vt9zsGwJwE=;
        b=Vyuu2qmUmRe6+cc1N1nbBhtpaJsD0CSLkOxytje9YaGmuPg1MU3u9Pc6sL+LspUBiK
         riuod2I6lv032JdvHur7/S4l6YV/pdtSnk4GUBAFj9LtKnzzmqLft3YCU3YHCV1iDfxf
         ocoAlGoehP+KT+twKUWFj2jsZGatI7Og1ZsJv1kaHNvmTVtC9DUCaH0LsyTIgYFVLgad
         hcnjNKwNQINrpe+0MuqC3662e84ndkeVdNTs2yuzavynz0v0APk1TAACUYTGWArtL9ws
         U8xu6PsAvDhAN6cHnEuqZl49JNJv1vvwiZF/E1CNNbJuxmEUht9WcBkxcC6aWzmOywdu
         dVig==
X-Gm-Message-State: AFq9FYKONCZ3EqCSif1VpwQXq+1Z5W0xOFKYM+1tGqKlO0K5DrTV4Cz+
	USaIbAgzoweX4cFq8OAL68LWdeieq4+t3k+DbIJT2FQ8v58wKzgUb+X9FTu8HQ==
X-Gm-Gg: AYBFou1OCf4gZPsVmIgwCd7E+LfzLBgVTshk26sxLojenugQe9etMQpnOcrf8QLZtpe
	GsXLxe09XO0KoLMkj6QjSjW7qZ0pA6YhHxkhyREKAWA3XQYB6WVMCRxrCcK3m4joGpeCKmx0MKN
	5ust2tLY+fHMtjfKtCaz4ux8G+SftMlBMEE68x3IrLoOod1/VbS+LEWuRioKE4WZedLyC/PiolR
	MCmUkicsQrvXb4UbILB8DOVEhPmoU0ieVWZg/JecvzmuNtX0JfeK7eGKwNPD17oCMsmu2rK2VBd
	PRQzpK1pcjGp5Jcuw2gPHjqnrD9TpYbEwGSMkkyUZFMWmVSAhfKklZMQSat61j7FJ6+dv+aKpVq
	GY8WGIlgEoTslchuC0+LE2yq3tBw1pFT6PKQ1MPjZXv47bt5FwMdwsgqZZ0N7waPxULtdRDQ8vX
	dx3nLVlfMsYwUoH+ERTEDVthkKNn6ySxfn8PwHl4JAcxduH+gtT2ivr/hqA10nIL2FSlKWdp8cv
	jkXZE9s6cRIj++ogFXbA/+SU0wSVETpQ/p+9m2/o8pTGgr8Jg==
X-Received: by 2002:a05:6a00:bb8d:b0:882:eec4:2108 with SMTP id d2e1a72fcca58-897c40f324emr13680123b3a.5.1791969928692;
        Wed, 14 Oct 2026 02:25:28 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d804ec645sm865426b3a.43.2026.10.14.02.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:25:28 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 2/17] udisks2: patch CVE-2026-7867
Date: Wed, 14 Oct 2026 22:24:58 +1300
Message-ID: <20261014092514.454505-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014092514.454505-1-ankur.tyagi85@gmail.com>
References: <20261014092514.454505-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 09:25:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130870

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commits from the PR[1].

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-7867

[1]https://github.com/storaged-project/udisks/pull/1530

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../udisks/udisks2/CVE-2026-7867-1.patch      | 249 +++++++++++++
 .../udisks/udisks2/CVE-2026-7867-2.patch      | 208 +++++++++++
 .../udisks/udisks2/CVE-2026-7867-3.patch      |  53 +++
 .../udisks/udisks2/CVE-2026-7867-4.patch      |  40 ++
 .../udisks/udisks2/CVE-2026-7867-5.patch      | 348 ++++++++++++++++++
 .../recipes-support/udisks/udisks2_2.10.2.bb  |   9 +-
 6 files changed, 905 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-1.patch
 create mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-2.patch
 create mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-3.patch
 create mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-4.patch
 create mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-5.patch

diff --git a/meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-1.patch b/meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-1.patch
new file mode 100644
index 0000000000..e7a5704f6c
--- /dev/null
+++ b/meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-1.patch
@@ -0,0 +1,249 @@
+From 1b417fd9a69e7141927a03bfb39d4d5a78b891b4 Mon Sep 17 00:00:00 2001
+From: Tomas Bzatek <tbzatek@redhat.com>
+Date: Tue, 28 Apr 2026 19:10:09 +0200
+Subject: [PATCH] udiskslinuxfilesystem: Separate real caller identity from
+ as-user target
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When the 'as-user' option is specified in Filesystem.Mount(), the code
+previously overwrote caller_uid/caller_gid with the target user's identity.
+This meant downstream functions received a uid they believed was the
+D-Bus caller's, but was actually the target's.
+
+Introduce effective_uid/effective_gid/effective_user_name to hold the
+as-user target identity (or the caller's identity when as-user is not
+set). The real D-Bus caller identity is now always resolved into
+caller_uid/caller_gid and used for authorization-related decisions
+(setup_by_user, on_user_seat checks), while effective_* is used for
+mount point calculation, run_as_uid/run_as_gid, and state tracking.
+
+Reported-by: Azizcan Daştan <azizcan.dastan5@gmail.com>
+Reported-by: Özlem Ozan <oozan1725@gmail.com>
+Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
+(cherry picked from commit 397eea88d58f77f6e02d537c4c961201b9245943)
+(cherry picked from commit 2d97818f41fbeb645fbb7b0373ed448bd26503f6)
+
+CVE: CVE-2026-7867
+Upstream-Status: Backport [https://github.com/storaged-project/udisks/commit/2d97818f41fbeb645fbb7b0373ed448bd26503f6]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/udiskslinuxfilesystem.c | 93 +++++++++++++++++++++----------------
+ 1 file changed, 53 insertions(+), 40 deletions(-)
+
+diff --git a/src/udiskslinuxfilesystem.c b/src/udiskslinuxfilesystem.c
+index 9f4880ad..ebdd2e05 100644
+--- a/src/udiskslinuxfilesystem.c
++++ b/src/udiskslinuxfilesystem.c
+@@ -905,7 +905,8 @@ handle_mount_fstab (UDisksDaemon          *daemon,
+                     UDisksObject          *object,
+                     uid_t                  caller_uid,
+                     gid_t                  caller_gid,
+-                    gboolean               mount_other_user,
++                    uid_t                  effective_uid,
++                    gid_t                  effective_gid,
+                     const gchar           *mount_point_to_use,
+                     const gchar           *fstab_mount_options,
+                     GDBusMethodInvocation *invocation,
+@@ -936,7 +937,7 @@ handle_mount_fstab (UDisksDaemon          *daemon,
+        * will be replaced by the name of the drive/device in question
+        */
+       message = N_("Authentication is required to mount $(drive)");
+-      if (mount_other_user)
++      if (caller_uid != effective_uid)
+         {
+           action_id = "org.freedesktop.udisks2.filesystem-mount-other-user";
+         }
+@@ -981,14 +982,14 @@ handle_mount_fstab (UDisksDaemon          *daemon,
+       job = udisks_daemon_launch_simple_job (daemon,
+                                              UDISKS_OBJECT (object),
+                                              "filesystem-mount",
+-                                             mount_fstab_as_root ? 0 : caller_uid,
++                                             mount_fstab_as_root ? 0 : effective_uid,
+                                              NULL /* cancellable */);
+ 
+       /* XXX: using run_as_uid for root doesn't work even if the caller is already root */
+-      if (!mount_fstab_as_root && caller_uid != 0)
++      if (!mount_fstab_as_root && effective_uid != 0)
+         {
+-          BDExtraArg uid_arg = { g_strdup ("run_as_uid"), g_strdup_printf ("%d", caller_uid) };
+-          BDExtraArg gid_arg = { g_strdup ("run_as_gid"), g_strdup_printf ("%d", caller_gid) };
++          BDExtraArg uid_arg = { g_strdup ("run_as_uid"), g_strdup_printf ("%d", effective_uid) };
++          BDExtraArg gid_arg = { g_strdup ("run_as_gid"), g_strdup_printf ("%d", effective_gid) };
+           const BDExtraArg *extra_args[3] = { &uid_arg, &gid_arg, NULL };
+ 
+           success = bd_fs_mount (NULL, mount_point_to_use, NULL, NULL, extra_args, &error);
+@@ -1066,8 +1067,9 @@ handle_mount_dynamic (UDisksDaemon          *daemon,
+                       UDisksObject          *object,
+                       uid_t                  caller_uid,
+                       gid_t                  caller_gid,
+-                      const gchar           *caller_user_name,
+-                      gboolean               mount_other_user,
++                      uid_t                  effective_uid,
++                      gid_t                  effective_gid,
++                      const gchar           *effective_user_name,
+                       gchar                **mount_point_to_use,
+                       gboolean              *mpoint_persistent,
+                       GDBusMethodInvocation *invocation,
+@@ -1127,7 +1129,7 @@ handle_mount_dynamic (UDisksDaemon          *daemon,
+    * will be replaced by the name of the drive/device in question
+    */
+   message = N_("Authentication is required to mount $(drive)");
+-  if (mount_other_user)
++  if (caller_uid != effective_uid)
+     {
+       action_id = "org.freedesktop.udisks2.filesystem-mount-other-user";
+     }
+@@ -1161,9 +1163,9 @@ handle_mount_dynamic (UDisksDaemon          *daemon,
+   /* Calculate mount point (guaranteed to be valid UTF-8) */
+   *mount_point_to_use = calculate_mount_point (daemon,
+                                                block,
+-                                               caller_uid,
+-                                               caller_gid,
+-                                               caller_user_name,
++                                               effective_uid,
++                                               effective_gid,
++                                               effective_user_name,
+                                                fs_type_to_use,
+                                                mpoint_persistent,
+                                                &error);
+@@ -1178,7 +1180,7 @@ handle_mount_dynamic (UDisksDaemon          *daemon,
+   /* Calculate mount options (guaranteed to be valid UTF-8) */
+   mount_options = udisks_linux_calculate_mount_options (daemon,
+                                                         block,
+-                                                        caller_uid,
++                                                        effective_uid,
+                                                         fs_signature,
+                                                         fs_type_to_use,
+                                                         options,
+@@ -1258,14 +1260,16 @@ handle_mount (UDisksFilesystem      *filesystem,
+   UDisksBlock *block;
+   UDisksDaemon *daemon;
+   UDisksState *state = NULL;
+-  gchar *opt_as_user = NULL;
++  const gchar *opt_as_user = NULL;
+   uid_t caller_uid;
+   gid_t caller_gid;
++  uid_t effective_uid = 0;
++  gid_t effective_gid = 0;
++  gchar *effective_user_name = NULL;
+   const gchar * const *existing_mount_points;
+   gchar *mount_point_to_use = NULL;
+   gboolean mpoint_persistent = TRUE;
+   gchar *fstab_mount_options = NULL;
+-  gchar *caller_user_name = NULL;
+   GError *error = NULL;
+   gboolean system_managed = FALSE;
+   gchar *device = NULL;
+@@ -1323,35 +1327,42 @@ handle_mount (UDisksFilesystem      *filesystem,
+       goto out;
+     }
+ 
++  /* Always resolve the real D-Bus caller identity */
++  if (!udisks_daemon_util_get_caller_uid_sync (daemon,
++                                               invocation,
++                                               NULL /* GCancellable */,
++                                               &caller_uid,
++                                               &error))
++    {
++      g_dbus_method_invocation_return_gerror (invocation, error);
++      g_clear_error (&error);
++      goto out;
++    }
++
++  if (!udisks_daemon_util_get_user_info (caller_uid,
++                                         &caller_gid,
++                                         opt_as_user ? NULL : &effective_user_name,
++                                         &error))
++    {
++      g_dbus_method_invocation_return_gerror (invocation, error);
++      g_clear_error (&error);
++      goto out;
++    }
++
+   if (opt_as_user)
+     {
+-      if (!udisks_daemon_util_get_user_info_by_name (opt_as_user, &caller_uid, &caller_gid, &error))
++      if (!udisks_daemon_util_get_user_info_by_name (opt_as_user, &effective_uid, &effective_gid, &error))
+         {
+           g_dbus_method_invocation_return_gerror (invocation, error);
+           g_clear_error (&error);
+           goto out;
+         }
+-      caller_user_name = g_strdup (opt_as_user);
++      effective_user_name = g_strdup (opt_as_user);
+     }
+   else
+     {
+-      if (!udisks_daemon_util_get_caller_uid_sync (daemon,
+-                                                   invocation,
+-                                                   NULL /* GCancellable */,
+-                                                   &caller_uid,
+-                                                   &error))
+-        {
+-          g_dbus_method_invocation_return_gerror (invocation, error);
+-          g_clear_error (&error);
+-          goto out;
+-        }
+-
+-      if (!udisks_daemon_util_get_user_info (caller_uid, &caller_gid, &caller_user_name, &error))
+-        {
+-          g_dbus_method_invocation_return_gerror (invocation, error);
+-          g_clear_error (&error);
+-          goto out;
+-        }
++      effective_uid = caller_uid;
++      effective_gid = caller_gid;
+     }
+ 
+   /* Mount it */
+@@ -1361,7 +1372,8 @@ handle_mount (UDisksFilesystem      *filesystem,
+                                object,
+                                caller_uid,
+                                caller_gid,
+-                               opt_as_user != NULL,
++                               effective_uid,
++                               effective_gid,
+                                mount_point_to_use,
+                                fstab_mount_options,
+                                invocation,
+@@ -1374,8 +1386,9 @@ handle_mount (UDisksFilesystem      *filesystem,
+                                  object,
+                                  caller_uid,
+                                  caller_gid,
+-                                 caller_user_name,
+-                                 opt_as_user != NULL,
++                                 effective_uid,
++                                 effective_gid,
++                                 effective_user_name,
+                                  &mount_point_to_use,
+                                  &mpoint_persistent,
+                                  invocation,
+@@ -1387,7 +1400,7 @@ handle_mount (UDisksFilesystem      *filesystem,
+   udisks_state_add_mounted_fs (state,
+                                mount_point_to_use,
+                                udisks_block_get_device_number (block),
+-                               caller_uid,
++                               effective_uid,
+                                system_managed,
+                                system_managed ? FALSE : mpoint_persistent);
+ 
+@@ -1395,7 +1408,7 @@ handle_mount (UDisksFilesystem      *filesystem,
+                  device,
+                  system_managed ? " (system)" : "",
+                  mount_point_to_use,
+-                 caller_uid);
++                 effective_uid);
+ 
+   udisks_linux_block_object_trigger_uevent_sync (UDISKS_LINUX_BLOCK_OBJECT (object),
+                                                  UDISKS_DEFAULT_WAIT_TIMEOUT);
+@@ -1409,7 +1422,7 @@ handle_mount (UDisksFilesystem      *filesystem,
+     udisks_state_check (state);
+   g_free (mount_point_to_use);
+   g_free (fstab_mount_options);
+-  g_free (caller_user_name);
++  g_free (effective_user_name);
+   g_free (device);
+   g_clear_object (&object);
+ 
diff --git a/meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-2.patch b/meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-2.patch
new file mode 100644
index 0000000000..dff53c87d8
--- /dev/null
+++ b/meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-2.patch
@@ -0,0 +1,208 @@
+From 53a3e81a90fa6d71cfb59d63ffffa22bbe071886 Mon Sep 17 00:00:00 2001
+From: Tomas Bzatek <tbzatek@redhat.com>
+Date: Tue, 28 Apr 2026 19:29:14 +0200
+Subject: [PATCH] udiskslinuxfilesystem: Rework fstab mount authorization for
+ as-user
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The polkit authorization logic in handle_mount_fstab() had two problems
+when 'as-user' was combined with fstab entries containing 'user',
+'users' or 'x-udisks-auth' mount options:
+
+1. The 'filesystem-mount-other-user' polkit check was inside the code
+   block that is skipped when 'user'/'users'/'x-udisks-auth' options
+   are present, allowing an unprivileged caller to mount on behalf of
+   another user without any authorization.
+
+2. When 'user' or 'users' fstab options were present and the initial
+   mount attempt failed with a permission error, the code would fall
+   back to mounting as root. This fallback should only be available
+   when 'x-udisks-auth' is explicitly specified.
+
+Restructure the authorization flow so that:
+ - The 'filesystem-mount-other-user' check is evaluated first,
+   independently of fstab mount options, and is always enforced
+   when caller_uid != effective_uid.
+ - The root fallback on BD_FS_ERROR_AUTH is gated on 'x-udisks-auth'
+   being present, not just any of the user-level mount options.
+ - When root uses 'as-user' without 'user'/'users' fstab options,
+   the root fallback is implicitly enabled.
+ - Regular polkit checks (filesystem-mount, mount-system,
+   mount-other-seat) only apply for same-user mounts without
+   'user'/'users'/'x-udisks-auth'.
+
+Update the D-Bus API documentation to reflect the new behavior.
+
+Reported-by: Azizcan Daştan <azizcan.dastan5@gmail.com>
+Reported-by: Özlem Ozan <oozan1725@gmail.com>
+Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
+(cherry picked from commit 68108081aa9049cf3bb2fb0044cb4de83f962390)
+(cherry picked from commit 0050f51d40e468f6a3197ccdc77b5bd59c923a37)
+
+CVE: CVE-2026-7867
+Upstream-Status: Backport [https://github.com/storaged-project/udisks/commit/0050f51d40e468f6a3197ccdc77b5bd59c923a37]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ data/org.freedesktop.UDisks2.xml | 24 ++++++-----
+ src/udiskslinuxfilesystem.c      | 73 ++++++++++++++++++++++++--------
+ 2 files changed, 70 insertions(+), 27 deletions(-)
+
+diff --git a/data/org.freedesktop.UDisks2.xml b/data/org.freedesktop.UDisks2.xml
+index 53194c70..f7201adc 100644
+--- a/data/org.freedesktop.UDisks2.xml
++++ b/data/org.freedesktop.UDisks2.xml
+@@ -2654,7 +2654,8 @@
+         filesystem is mounted on behalf of the specified user instead
+         of the calling one. This has usually an effect on the returned
+         @mount_path and it also allows that user to unmount the
+-        filesystem later. This option expects a user name, not a UID.
++        filesystem later. This option expects a user name, not a UID
++        and always performs an authorization check.
+ 
+         If the device in question is referenced in the
+         <filename>/etc/fstab</filename> file, the
+@@ -2662,15 +2663,18 @@
+         and the given options or filesystem type given in @options are
+         ignored.
+ 
+-        If <literal>x-udisks-auth</literal> is specified as an option
+-        for the device in the <filename>/etc/fstab</filename> file,
+-        then the <command>mount</command> command is run as the
+-        calling user, without performing any authorization check
+-        mentioned above. If this fails because of insufficient
+-        permissions, an authorization check is performed (which
+-        typically results in the user having to authenticate as an
+-        administrator). If authorized, the <command>mount</command>
+-        command is then run as root.
++        If <literal>x-udisks-auth</literal>, <literal>user</literal> or
++        <literal>users</literal> are specified as options for the
++        device in the <filename>/etc/fstab</filename> file, then the
++        <command>mount</command> command is run as the calling user
++        (or the effective user of the <parameter>as-user</parameter>
++        option respectively), without performing any authorization check
++        mentioned above. If this fails because of insufficient permissions
++        and <literal>x-udisks-auth</literal> is specified, an
++        authorization check is performed (which typically results in
++        the user having to authenticate as an administrator). If
++        authorized, the <command>mount</command> command is then run
++        as root.
+ 
+         The filesystem should be unmounted using the
+         org.freedesktop.UDisks2.Filesystem.Unmount() method.
+diff --git a/src/udiskslinuxfilesystem.c b/src/udiskslinuxfilesystem.c
+index ebdd2e05..eb2a3f21 100644
+--- a/src/udiskslinuxfilesystem.c
++++ b/src/udiskslinuxfilesystem.c
+@@ -918,30 +918,60 @@ handle_mount_fstab (UDisksDaemon          *daemon,
+   const gchar *message = NULL;
+   gboolean success = FALSE;
+   gboolean mount_fstab_as_root = FALSE;
++  gboolean x_udisks_auth = FALSE;
++  gboolean user_mount = FALSE;
+   UDisksBaseJob *job = NULL;
+   GError *error = NULL;
+ 
+   block = udisks_object_peek_block (object);
+   device = udisks_block_get_device (block);
+ 
+-  if (!has_option (fstab_mount_options, "x-udisks-auth") &&
+-      !has_option (fstab_mount_options, "user") &&
+-      !has_option (fstab_mount_options, "users"))
++  x_udisks_auth = has_option (fstab_mount_options, "x-udisks-auth");
++  user_mount = x_udisks_auth ||
++               has_option (fstab_mount_options, "user") ||
++               has_option (fstab_mount_options, "users");
++
++  /* 'as-user' rules:
++   *  - when caller is root:
++   *    - if 'user'/'users' present, do not fall back to mounting as root, unless 'x-udisks-auth' is specified
++   *    - if 'user'/'users' not present, try as effective user first and allow fallback to mounting as root (implies 'x-udisks-auth')
++   *  - when caller is unprivileged:
++   *    - always require polkit auth to prevent identity spoofing
++   *    - do not fall back to mounting as root, unless 'x-udisks-auth' is specified
++   *    - if neither 'user'/'users'/'x-udisks-auth' present, failure is expected by nature (unless 'as-user=root')
++   *
++   * general fstab mounting rules:
++   *  - when caller is root, mount as root, allow anything
++   *  - when caller is unprivileged:
++   *    - if 'user'/'users' present, do not fall back to mounting as root, unless 'x-udisks-auth' is specified
++   *    - if only 'x-udisks-auth' present, mount as user and fall back to mounting as root if not successful
++   *    - if neither 'user'/'users'/'x-udisks-auth' present, require polkit auth and mount as root
++   *
++   * Further assumptions:
++   *  - when 'user'/'users' not present and mounting as unprivileged, this typically fails but it is still beneficial to try that e.g. for FUSE mounts
++   *  - assuming libblockdev mount error code mapping works reliably (for the BD_FS_ERROR_AUTH check)
++   */
++
++  if (caller_uid != effective_uid)
++    {
++      /* Always require authorization when mounting on behalf of another user,
++       * regardless of fstab mount options.
++       */
++      action_id = "org.freedesktop.udisks2.filesystem-mount-other-user";
++
++      /* When 'user'/'users' not present and the caller is root, allow
++       * fallback mounting as root.
++       */
++      if (caller_uid == 0 && !user_mount)
++        x_udisks_auth = TRUE;
++    }
++  else
++  if (!user_mount)
+     {
+       mount_fstab_as_root = TRUE;
++
+       action_id = "org.freedesktop.udisks2.filesystem-mount";
+-      /* Translators: Shown in authentication dialog when the user
+-       * requests mounting a filesystem.
+-       *
+-       * Do not translate $(drive), it's a placeholder and
+-       * will be replaced by the name of the drive/device in question
+-       */
+-      message = N_("Authentication is required to mount $(drive)");
+-      if (caller_uid != effective_uid)
+-        {
+-          action_id = "org.freedesktop.udisks2.filesystem-mount-other-user";
+-        }
+-      else if (!udisks_daemon_util_setup_by_user (daemon, object, caller_uid))
++      if (!udisks_daemon_util_setup_by_user (daemon, object, caller_uid))
+         {
+           if (udisks_block_get_hint_system (block))
+             {
+@@ -952,7 +982,17 @@ handle_mount_fstab (UDisksDaemon          *daemon,
+               action_id = "org.freedesktop.udisks2.filesystem-mount-other-seat";
+             }
+         }
++    }
+ 
++  if (action_id)
++    {
++      /* Translators: Shown in authentication dialog when the user
++       * requests mounting a filesystem.
++       *
++       * Do not translate $(drive), it's a placeholder and
++       * will be replaced by the name of the drive/device in question
++       */
++      message = N_("Authentication is required to mount $(drive)");
+       if (!udisks_daemon_util_check_authorization_sync (daemon,
+                                                         object,
+                                                         action_id,
+@@ -962,7 +1002,6 @@ handle_mount_fstab (UDisksDaemon          *daemon,
+         return FALSE;
+     }
+ 
+-
+   if (!g_file_test (mount_point_to_use, G_FILE_TEST_IS_DIR))
+     {
+       if (g_mkdir_with_parents (mount_point_to_use, 0755) != 0)
+@@ -1011,7 +1050,7 @@ handle_mount_fstab (UDisksDaemon          *daemon,
+ 
+       if (!success)
+         {
+-          if (!mount_fstab_as_root && g_error_matches (error, BD_FS_ERROR, BD_FS_ERROR_AUTH))
++          if (!mount_fstab_as_root && g_error_matches (error, BD_FS_ERROR, BD_FS_ERROR_AUTH) && x_udisks_auth)
+             {
+               g_clear_error (&error);
+               action_id = "org.freedesktop.udisks2.filesystem-fstab";
diff --git a/meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-3.patch b/meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-3.patch
new file mode 100644
index 0000000000..245e46ac00
--- /dev/null
+++ b/meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-3.patch
@@ -0,0 +1,53 @@
+From 68a82f2afb3a5ca0da207cdd5bbd55e777940e12 Mon Sep 17 00:00:00 2001
+From: Tomas Bzatek <tbzatek@redhat.com>
+Date: Sun, 3 May 2026 14:00:01 +0200
+Subject: [PATCH] udiskslinuxfilesystem: Log real caller uid for as-user mounts
+
+When a mount is performed with the as-user option targeting a different
+user, log both the effective (target) uid and the real caller uid to
+provide an audit trail of who authorized the operation.
+
+Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
+(cherry picked from commit 98e5a76c155640d155280cdb642791f00def736a)
+(cherry picked from commit 132ebab4a196f7fbd01fa28283627b2227eb399b)
+
+CVE: CVE-2026-7867
+Upstream-Status: Backport [https://github.com/storaged-project/udisks/commit/132ebab4a196f7fbd01fa28283627b2227eb399b]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/udiskslinuxfilesystem.c | 22 +++++++++++++++++-----
+ 1 file changed, 17 insertions(+), 5 deletions(-)
+
+diff --git a/src/udiskslinuxfilesystem.c b/src/udiskslinuxfilesystem.c
+index eb2a3f21..5e2508cc 100644
+--- a/src/udiskslinuxfilesystem.c
++++ b/src/udiskslinuxfilesystem.c
+@@ -1443,11 +1443,23 @@ handle_mount (UDisksFilesystem      *filesystem,
+                                system_managed,
+                                system_managed ? FALSE : mpoint_persistent);
+ 
+-  udisks_notice ("Mounted %s%s at %s on behalf of uid %u",
+-                 device,
+-                 system_managed ? " (system)" : "",
+-                 mount_point_to_use,
+-                 effective_uid);
++  if (effective_uid != caller_uid)
++    {
++      udisks_notice ("Mounted %s%s at %s on behalf of uid %u (requested by uid %u)",
++                     device,
++                     system_managed ? " (system)" : "",
++                     mount_point_to_use,
++                     effective_uid,
++                     caller_uid);
++    }
++  else
++    {
++      udisks_notice ("Mounted %s%s at %s on behalf of uid %u",
++                     device,
++                     system_managed ? " (system)" : "",
++                     mount_point_to_use,
++                     effective_uid);
++    }
+ 
+   udisks_linux_block_object_trigger_uevent_sync (UDISKS_LINUX_BLOCK_OBJECT (object),
+                                                  UDISKS_DEFAULT_WAIT_TIMEOUT);
diff --git a/meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-4.patch b/meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-4.patch
new file mode 100644
index 0000000000..726f3271dc
--- /dev/null
+++ b/meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-4.patch
@@ -0,0 +1,40 @@
+From a17202ed591f07109ce978e5abb999c67de9b3f1 Mon Sep 17 00:00:00 2001
+From: Tomas Bzatek <tbzatek@redhat.com>
+Date: Tue, 28 Apr 2026 19:10:38 +0200
+Subject: [PATCH] udisksdaemonutil: Pass as-user target to polkit details
+
+When the 'as-user' D-Bus method option is present, propagate the
+target username to polkit details as 'mount.as-user'. This allows
+polkit rules to make fine-grained authorization decisions based on
+who the mount is being performed for.
+
+Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
+(cherry picked from commit 681d58a76f6aaa5045eb43e665c65f497d35b810)
+(cherry picked from commit 3b016cc881b1d3c3d843ec13e35102beaaac7023)
+
+CVE: CVE-2026-7867
+Upstream-Status: Backport [https://github.com/storaged-project/udisks/commit/3b016cc881b1d3c3d843ec13e35102beaaac7023]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/udisksdaemonutil.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/udisksdaemonutil.c b/src/udisksdaemonutil.c
+index 3db92f58..36e3184b 100644
+--- a/src/udisksdaemonutil.c
++++ b/src/udisksdaemonutil.c
+@@ -797,6 +797,14 @@ udisks_daemon_util_check_authorization_sync_with_error (UDisksDaemon           *
+   polkit_details_insert (details, "polkit.message", message);
+   polkit_details_insert (details, "polkit.gettext_domain", "udisks2");
+ 
++  if (options != NULL &&
++      g_strcmp0 (action_id, "org.freedesktop.udisks2.filesystem-mount-other-user") == 0)
++    {
++      const gchar *as_user = NULL;
++      g_variant_lookup (options, "as-user", "&s", &as_user);
++      _safe_polkit_details_insert (details, "mount.as-user", as_user);
++    }
++
+   /* Find drive associated with the block device, if any */
+   if (object != NULL)
+     {
diff --git a/meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-5.patch b/meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-5.patch
new file mode 100644
index 0000000000..6901e71d37
--- /dev/null
+++ b/meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-5.patch
@@ -0,0 +1,348 @@
+From 7e77f3cb5c6658f5522d8d56e882e8df02978d76 Mon Sep 17 00:00:00 2001
+From: Tomas Bzatek <tbzatek@redhat.com>
+Date: Wed, 29 Apr 2026 16:36:45 +0200
+Subject: [PATCH] tests: Add security tests for as-user mount authorization
+
+Add tests verifying that an unprivileged D-Bus caller cannot exploit
+the 'as-user' option in Filesystem.Mount() to mount on behalf of
+another user without polkit authorization. Use a dedicated
+'udisks_test_target' user instead of 'nobody' to avoid OS-level
+special treatment of system users that could mask real behavior.
+
+Dynamic mount tests (in UdisksFSTestCase, inherited by all FS types):
+- test_mount_as_user_denied: as-user=<another_user> is denied
+- test_mount_as_user_root_denied: as-user=root is denied
+- test_mount_as_user_self: as-user=<self> behaves like plain mount
+
+Fstab mount tests (in NonPOSIXTestCase, inherited by VFAT/EXFAT):
+- test_mount_fstab_{users,user,x-udisks-auth}_as_user_denied:
+  fstab entries that normally allow unprivileged mounting must still
+  require authorization when as-user is specified
+- test_mount_fstab_{users,user,x-udisks-auth}_as_root_denied:
+  same but with as-user=root
+- test_mount_fstab_defaults_as_user_from_root: root can mount
+  fstab 'defaults' device with as-user targeting a non-root user
+- test_mount_fstab_defaults_as_user_denied: unprivileged user
+  cannot mount fstab 'defaults' device with as-user
+
+Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
+(cherry picked from commit 5ec20c9d5719ead510d800bc3eb5a731e5712f39)
+(cherry picked from commit 36231768dde088c8b4d4796ff2d311d089d84052)
+
+CVE: CVE-2026-7867
+Upstream-Status: Backport [https://github.com/storaged-project/udisks/commit/36231768dde088c8b4d4796ff2d311d089d84052]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/tests/dbus-tests/test_80_filesystem.py | 278 +++++++++++++++++++++
+ 1 file changed, 278 insertions(+)
+
+diff --git a/src/tests/dbus-tests/test_80_filesystem.py b/src/tests/dbus-tests/test_80_filesystem.py
+index 1f375ac6..03336512 100644
+--- a/src/tests/dbus-tests/test_80_filesystem.py
++++ b/src/tests/dbus-tests/test_80_filesystem.py
+@@ -30,6 +30,8 @@ class UdisksFSTestCase(udiskstestcase.UdisksTestCase):
+     _can_query_size = False
+ 
+     username = 'udisks_test_user'
++    # a separate target user used for 'as-user' mount tests
++    target_username = 'udisks_test_target'
+ 
+     requested_plugins = BlockDev.plugin_specs_from_names(("fs",))
+ 
+@@ -1037,6 +1039,174 @@ class UdisksFSTestCase(udiskstestcase.UdisksTestCase):
+         pipe.send([True, ''])
+         pipe.close()
+ 
++    def _mount_with_as_user_fail(self, pipe, uid, gid, device, target_user):
++        """ Try to mount @device as user with given @uid and @gid using the
++            'as-user' option set to @target_user. This is expected to fail
++            with a NotAuthorized error.
++        """
++        os.setresgid(gid, gid, gid)
++        os.setresuid(uid, uid, uid)
++
++        try:
++            safe_dbus.call_sync(self.iface_prefix,
++                                self.path_prefix + '/block_devices/' + os.path.basename(device),
++                                self.iface_prefix + '.Filesystem',
++                                'Mount',
++                                GLib.Variant('(a{sv})', ({'as-user': GLib.Variant('s', target_user)},)))
++        except Exception as e:
++            msg = str(e)
++            if 'org.freedesktop.UDisks2.Error.NotAuthorized' in msg and \
++               'Not authorized to perform operation' in msg:
++                pipe.send([True, ''])
++                pipe.close()
++                return
++            else:
++                pipe.send([False, 'Mount DBus call failed with unexpected exception: %s' % msg])
++                pipe.close()
++                return
++
++        pipe.send([False, 'Mount with as-user=%s unexpectedly succeeded for uid %d' % (target_user, uid)])
++        pipe.close()
++
++    def _test_mount_as_user_denied(self, target_user):
++        """ Test that an unprivileged user cannot use as-user to mount on
++            behalf of @target_user without polkit authorization.
++        """
++        self._check_can_create()
++
++        if not self._can_mount:
++            self.skipTest('Cannot mount %s filesystem' % self._fs_signature)
++
++        disk = self.get_object('/block_devices/' + os.path.basename(self.vdevs[0]))
++        self.assertIsNotNone(disk)
++
++        disk.Format(self._fs_signature, self.no_options, dbus_interface=self.iface_prefix + '.Block')
++        self.addCleanup(self.wipe_fs, self.vdevs[0])
++        self.addCleanup(self.try_unmount, self.vdevs[0])
++
++        self.addCleanup(self._remove_user, self.username)
++        uid, gid = self._add_user(self.username)
++
++        if target_user != 'root':
++            self.addCleanup(self._remove_user, target_user)
++            self._add_user(target_user)
++
++        parent_conn, child_conn = Pipe()
++        proc = Process(target=self._mount_with_as_user_fail,
++                       args=(child_conn, int(uid), int(gid), self.vdevs[0], target_user))
++        proc.start()
++        res = parent_conn.recv()
++        parent_conn.close()
++        proc.join()
++
++        if not res[0]:
++            self.fail(res[1])
++
++    @udiskstestcase.tag_test(udiskstestcase.TestTags.UNSAFE)
++    def test_mount_as_user_denied(self):
++        """ Test that an unprivileged user cannot use as-user to mount on
++            behalf of another user without authorization.
++        """
++        self._test_mount_as_user_denied(self.target_username)
++
++    @udiskstestcase.tag_test(udiskstestcase.TestTags.UNSAFE)
++    def test_mount_as_user_root_denied(self):
++        """ Test that an unprivileged user cannot use as-user=root to mount
++            without authorization.
++        """
++        self._test_mount_as_user_denied('root')
++
++    def _mount_as_user_result(self, pipe, uid, gid, device, options):
++        """ Try to mount @device as user with given @uid and @gid using
++            the given @options dict. Returns [True, error_string] on D-Bus
++            error or [True, ''] on success.
++        """
++        os.setresgid(gid, gid, gid)
++        os.setresuid(uid, uid, uid)
++
++        try:
++            safe_dbus.call_sync(self.iface_prefix,
++                                self.path_prefix + '/block_devices/' + os.path.basename(device),
++                                self.iface_prefix + '.Filesystem',
++                                'Mount',
++                                GLib.Variant('(a{sv})', (options,)))
++        except Exception as e:
++            pipe.send([True, str(e)])
++            pipe.close()
++            return
++
++        pipe.send([True, ''])
++        pipe.close()
++
++    @udiskstestcase.tag_test(udiskstestcase.TestTags.UNSAFE)
++    def test_mount_as_user_self(self):
++        """ Test that as-user targeting the caller's own username behaves
++            identically to mounting without as-user (no extra mount-other-user
++            authorization required).
++        """
++        self._check_can_create()
++
++        if not self._can_mount:
++            self.skipTest('Cannot mount %s filesystem' % self._fs_signature)
++
++        disk = self.get_object('/block_devices/' + os.path.basename(self.vdevs[0]))
++        self.assertIsNotNone(disk)
++
++        disk.Format(self._fs_signature, self.no_options, dbus_interface=self.iface_prefix + '.Block')
++        self.addCleanup(self.wipe_fs, self.vdevs[0])
++        self.addCleanup(self.try_unmount, self.vdevs[0])
++
++        self.addCleanup(self._remove_user, self.username)
++        uid, gid = self._add_user(self.username)
++
++        # first try a plain mount without as-user
++        parent_conn, child_conn = Pipe()
++        proc = Process(target=self._mount_as_user_result,
++                       args=(child_conn, int(uid), int(gid), self.vdevs[0], {}))
++        proc.start()
++        res_plain = parent_conn.recv()
++        parent_conn.close()
++        proc.join()
++
++        self.assertTrue(res_plain[0])
++        plain_error = res_plain[1]
++
++        # unmount if the plain mount succeeded
++        if not plain_error:
++            self.try_unmount(self.vdevs[0])
++
++        # now try with as-user=<self>
++        parent_conn, child_conn = Pipe()
++        proc = Process(target=self._mount_as_user_result,
++                       args=(child_conn, int(uid), int(gid), self.vdevs[0],
++                             {'as-user': GLib.Variant('s', self.username)}))
++        proc.start()
++        res_as_user = parent_conn.recv()
++        parent_conn.close()
++        proc.join()
++
++        self.assertTrue(res_as_user[0])
++        as_user_error = res_as_user[1]
++
++        if not plain_error and not as_user_error:
++            return
++        if plain_error and as_user_error:
++            # extract the GDBus error name (e.g. 'org.freedesktop.UDisks2.Error.NotAuthorizedCanObtain')
++            dbus_err_re = re.compile(r'GDBus\.Error:([\w.]+):')
++            plain_match = dbus_err_re.search(plain_error)
++            as_user_match = dbus_err_re.search(as_user_error)
++            plain_err_name = plain_match.group(1) if plain_match else plain_error
++            as_user_err_name = as_user_match.group(1) if as_user_match else as_user_error
++            self.assertEqual(plain_err_name, as_user_err_name,
++                             'as-user=<self> produced a different error than plain mount: '
++                             'plain=%s, as-user=%s' % (plain_error, as_user_error))
++            return
++
++        if plain_error:
++            self.fail('Plain mount failed (%s) but as-user=<self> succeeded' % plain_error)
++        else:
++            self.fail('Plain mount succeeded but as-user=<self> failed: %s' % as_user_error)
++
+     @udiskstestcase.tag_test(udiskstestcase.TestTags.UNSAFE)
+     def test_mount_as_user(self):
+         """ Test mounting a filesystem on behalf of a different user."""
+@@ -1550,6 +1720,108 @@ class NonPOSIXTestCase(UdisksFSTestCase):
+             self.fail(res[1])
+ 
+ 
++    def _test_mount_fstab_as_user_denied(self, fstab_options, target_user):
++        """ Test that an unprivileged user cannot use 'as-user' option to mount
++            a device listed in /etc/fstab with @fstab_options on behalf of
++            @target_user without polkit authorization.
++        """
++        disk = self.get_object('/block_devices/' + os.path.basename(self.vdevs[0]))
++        self.assertIsNotNone(disk)
++
++        self.addCleanup(self._remove_user, self.username)
++        uid, gid = self._add_user(self.username)
++
++        if target_user != 'root':
++            self.addCleanup(self._remove_user, target_user)
++            self._add_user(target_user)
++
++        self.addCleanup(self.try_unmount, self.vdevs[0])
++        self._prepare_mount_test(disk, True, fstab_options)
++
++        parent_conn, child_conn = Pipe()
++        proc = Process(target=self._mount_with_as_user_fail,
++                       args=(child_conn, int(uid), int(gid), self.vdevs[0], target_user))
++        proc.start()
++        res = parent_conn.recv()
++        parent_conn.close()
++        proc.join()
++
++        if not res[0]:
++            self.fail(res[1])
++
++    @udiskstestcase.tag_test(udiskstestcase.TestTags.UNSAFE)
++    def test_mount_fstab_as_user_denied(self):
++        """ Test that user cannot use as-user to mount fstab 'users' device
++            on behalf of another user without authorization.
++        """
++        self._test_mount_fstab_as_user_denied('users', self.target_username)
++
++    @udiskstestcase.tag_test(udiskstestcase.TestTags.UNSAFE)
++    def test_mount_fstab_user_as_user_denied(self):
++        """ Test that user cannot use as-user to mount fstab 'user' device
++            on behalf of another user without authorization.
++        """
++        self._test_mount_fstab_as_user_denied('user', self.target_username)
++
++    @udiskstestcase.tag_test(udiskstestcase.TestTags.UNSAFE)
++    def test_mount_fstab_x_udisks_auth_as_user_denied(self):
++        """ Test that user cannot use as-user to mount fstab 'x-udisks-auth'
++            device on behalf of another user without authorization.
++        """
++        self._test_mount_fstab_as_user_denied('x-udisks-auth', self.target_username)
++
++    @udiskstestcase.tag_test(udiskstestcase.TestTags.UNSAFE)
++    def test_mount_fstab_as_root_denied(self):
++        """ Test that user cannot use as-user=root to mount fstab 'users'
++            device without authorization.
++        """
++        self._test_mount_fstab_as_user_denied('users', 'root')
++
++    @udiskstestcase.tag_test(udiskstestcase.TestTags.UNSAFE)
++    def test_mount_fstab_user_as_root_denied(self):
++        """ Test that user cannot use as-user=root to mount fstab 'user'
++            device without authorization.
++        """
++        self._test_mount_fstab_as_user_denied('user', 'root')
++
++    @udiskstestcase.tag_test(udiskstestcase.TestTags.UNSAFE)
++    def test_mount_fstab_x_udisks_auth_as_root_denied(self):
++        """ Test that user cannot use as-user=root to mount fstab
++            'x-udisks-auth' device without authorization.
++        """
++        self._test_mount_fstab_as_user_denied('x-udisks-auth', 'root')
++
++    @udiskstestcase.tag_test(udiskstestcase.TestTags.UNSAFE)
++    def test_mount_fstab_defaults_as_user_from_root(self):
++        """ Test that root can mount a device listed in /etc/fstab with
++            'defaults' (no 'user', 'users' or 'x-udisks-auth' options)
++            using the 'as-user' option targeting a non-root user.
++        """
++        disk = self.get_object('/block_devices/' + os.path.basename(self.vdevs[0]))
++        self.assertIsNotNone(disk)
++
++        self.addCleanup(self._remove_user, self.target_username)
++        self._add_user(self.target_username)
++
++        self.addCleanup(self.try_unmount, self.vdevs[0])
++        self._prepare_mount_test(disk, True, 'defaults')
++
++        d = dbus.Dictionary(signature='sv')
++        d['as-user'] = self.target_username
++        mnt_path = disk.Mount(d, dbus_interface=self.iface_prefix + '.Filesystem')
++        self.assertIsNotNone(mnt_path)
++        self.assertTrue(os.path.ismount(mnt_path))
++
++    @udiskstestcase.tag_test(udiskstestcase.TestTags.UNSAFE)
++    def test_mount_fstab_defaults_as_user_denied(self):
++        """ Test that an unprivileged user cannot use 'as-user' option to
++            mount a device listed in /etc/fstab with 'defaults' (no 'user',
++            'users' or 'x-udisks-auth') on behalf of another user without
++            polkit authorization.
++        """
++        self._test_mount_fstab_as_user_denied('defaults', self.target_username)
++
++
+ class VFATTestCase(NonPOSIXTestCase):
+     _fs_signature = 'vfat'
+     _can_mount = True
+@@ -1691,6 +1963,12 @@ class UDFTestCase(UdisksFSTestCase):
+     def test_mount_fstab_complex_label_bad(self):
+         super(UDFTestCase, self).test_mount_fstab_complex_label_bad()
+ 
++    def test_mount_as_user_denied(self):
++        self.skipTest('Skipping as-user authorization test for UDF')
++
++    def test_mount_as_user_root_denied(self):
++        self.skipTest('Skipping as-user authorization test for UDF')
++
+ 
+ class FailsystemTestCase(UdisksFSTestCase):
+     # test that not supported operations fail 'nicely'
diff --git a/meta-oe/recipes-support/udisks/udisks2_2.10.2.bb b/meta-oe/recipes-support/udisks/udisks2_2.10.2.bb
index d4c5385ae0..776b5c5043 100644
--- a/meta-oe/recipes-support/udisks/udisks2_2.10.2.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_2.10.2.bb
@@ -18,8 +18,13 @@ DEPENDS += "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 RDEPENDS:${PN} = "acl"
 
 SRC_URI = " \
-	git://github.com/storaged-project/udisks.git;branch=2.10.x-branch;protocol=https \
-	file://0001-Makefile.am-Dont-include-buildpath.patch \
+    git://github.com/storaged-project/udisks.git;branch=2.10.x-branch;protocol=https \
+    file://0001-Makefile.am-Dont-include-buildpath.patch \
+    file://CVE-2026-7867-1.patch \
+    file://CVE-2026-7867-2.patch \
+    file://CVE-2026-7867-3.patch \
+    file://CVE-2026-7867-4.patch \
+    file://CVE-2026-7867-5.patch \
 "
 SRCREV = "bc623acf9e7488dc105e4b00069d57e303e2616b"
 

