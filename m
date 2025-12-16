Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 260C3D5B161
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 07:13:43 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16481.1765869222336708694
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Dec 2025 23:13:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JWX9BCdJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7fbbb84f034so253531b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 23:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765869221; x=1766474021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kg0X2PezVT6Qaqt1UFThCdnhphTmVqKO5IXtZ/WvWno=;
        b=JWX9BCdJ1UAk3XoYA8U5nW2OBWrbSE26RaJvWaUAx/97bsoVXamKNZjK27P9o28YfN
         Si84EQRr0xGed5WuyMmq2t96507a7yxFrsQ5MFLxJbPTrKvgzI7xPadTlCvu8j4aS4vD
         MSPgOuziTD7AWflBZ2sOkfMSzl6Ntj/mKv2hiQVQ6MQ9fUnYeTDzK6KaVik+QtKglEZP
         g7hSLYNWNOSjNJBuQi+fPtgQfVKikQhu/ExIPXEXFwZbh/8Q87xeAPYZRBSX0HO2FFl1
         BWQ/tOse7QbsnARHYWnPVORNNrhh/Baep0i/Ad76HcfSruMsZDx23MEcutGa7gxjvB4V
         8xBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765869221; x=1766474021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kg0X2PezVT6Qaqt1UFThCdnhphTmVqKO5IXtZ/WvWno=;
        b=X3FSKd/Yxda6ro8tux/kICuvuEC7/XuW7JFGWkxg17mGWK0ZByQmccpofgTn72SEai
         L90lq7txmDvTqucKJqfgTv/5oIIB1sIuIHvCvt55nI22LPW7xsh3DLoSHFGzguhGin3E
         8/dEAlElM55XMLlvRtzsaRYbhWh4tqv2KAMGqBCCclpM4x0JeHtwCLG3ftsY0iGKCW7E
         Le3QdVclVGHdbXOUnFemMkOtIgFCyXvGY5dKBBarN0j/bjbuZluBkn0IW/zpADlypfZM
         5SQWnWwkQgy8K7R40JdFZy034gJU41LV1UrIFz121O52pNTXDs/shLbJAFtBkt9MpnFa
         YCWQ==
X-Gm-Message-State: AOJu0Ywa3Z3a+NprL9ahDdvfqRv3wlgfRME/ORxFg4j10svTyw1cFohQ
	InVsjhm//+tc3yhQVXBD3/JT/OgTmzfm6JJpKHx9e6o2jRjGRxQaY2qUZ/vlwg==
X-Gm-Gg: AY/fxX66hjlqgavTS4TIB8diXOWSuvXyJLwNnpFFmUX3G8YYFdirDtWStQWuxRyM36S
	dDlNhZBNNrzojlniY0yFMV72f9r2gUtwBmOdT8jXWbkX9VUkHskeEMCtPltOkJ3YF4075ERIj9P
	xPb9QVaWZH1HtebVaPhUcqDICJcU2y+ir3D0/ONArF7RjvCoXb6YzCQ0uQJMe6iykvT5Cd/9TTZ
	dwXnYEVnmT8+EUmGfEzjdJBCLmJYZF7bWjWEH039ewYxX8Ucv5WbEVSNn05SDKhg8WMROEerElz
	CJgECLSLc3YmLoX2MSiAep25RrF28JqgpC2SuGXokVYXayqngx7qtsDKPxswfJjZ2KGSIEpJxTF
	RQSWUSevWe5HqU3dhINtPcTbiuYwSTyvbIofXJRXOxb1h7b3prR7MJ4bj6y1tLfc/r8lWVgFgkD
	LZ1ZKqOT8V+gNO2pWs7wFi6Rhs
X-Google-Smtp-Source: AGHT+IGFBRr22zVd+CI21e42KzwWNYZIRwC5G9bOGryY1RjfF13VmxeqhN2s8WXH9tVW8YgintUuCA==
X-Received: by 2002:a05:6a00:a381:b0:7e8:4471:8c8 with SMTP id d2e1a72fcca58-7f6694aece0mr10267630b3a.41.1765869221327;
        Mon, 15 Dec 2025 23:13:41 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.223])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c5093d5csm14225372b3a.49.2025.12.15.23.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 23:13:40 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 3/4] flatpak: patch CVE-2024-42472
Date: Tue, 16 Dec 2025 12:43:28 +0530
Message-ID: <20251216071329.3172170-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216071329.3172170-1-ankur.tyagi85@gmail.com>
References: <20251216071329.3172170-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 07:13:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122678

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2024-42472

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../flatpak/flatpak/CVE-2024-42472_1.patch    | 169 ++++++++++++++++++
 .../flatpak/flatpak/CVE-2024-42472_2.patch    |  44 +++++
 .../flatpak/flatpak_1.15.8.bb                 |   2 +
 3 files changed, 215 insertions(+)
 create mode 100644 meta-oe/recipes-extended/flatpak/flatpak/CVE-2024-42472_1.patch
 create mode 100644 meta-oe/recipes-extended/flatpak/flatpak/CVE-2024-42472_2.patch

diff --git a/meta-oe/recipes-extended/flatpak/flatpak/CVE-2024-42472_1.patch b/meta-oe/recipes-extended/flatpak/flatpak/CVE-2024-42472_1.patch
new file mode 100644
index 0000000000..c29d9655f1
--- /dev/null
+++ b/meta-oe/recipes-extended/flatpak/flatpak/CVE-2024-42472_1.patch
@@ -0,0 +1,169 @@
+From 2055273613350df0e6a7fa30d38d4ce6bc8079ca Mon Sep 17 00:00:00 2001
+From: Alexander Larsson <alexl@redhat.com>
+Date: Mon, 3 Jun 2024 12:22:30 +0200
+Subject: [PATCH] Don't follow symlinks when mounting persisted directories
+
+These directories are in a location under application control, so we
+can't trust them to not be a symlink outside of the files accessibe to
+the application.
+
+Continue to treat --persist=/foo as --persist=foo for backwards compat,
+since this is how it (accidentally) worked before, but print a warning.
+
+Don't allow ".." elements in persist paths: these would not be useful
+anyway, and are unlikely to be in use, however they could potentially
+be used to confuse the persist path handling.
+
+This partially addresses CVE-2024-42472. If only one instance of the
+malicious or compromised app is run at a time, the vulnerability
+is avoided. If two instances can run concurrently, there is a
+time-of-check/time-of-use issue remaining, which can only be resolved
+with changes to bubblewrap; this will be resolved in a separate commit,
+because the bubblewrap dependency might be more difficult to provide in
+LTS distributions.
+
+Helps: CVE-2024-42472, GHSA-7hgv-f2j8-xw87
+[smcv: Make whitespace consistent]
+[smcv: Use g_warning() if unable to create --persist paths]
+[smcv: Use stat() to detect symlinks and warn about them]
+Co-authored-by: Simon McVittie <smcv@collabora.com>
+Signed-off-by: Simon McVittie <smcv@collabora.com>
+
+CVE: CVE-2024-42472
+Upstream-Status: Backport [https://github.com/flatpak/flatpak/commit/3caeb16c31a3ed62d744e2aaf01d684f7991051a]
+(cherry picked from commit 3caeb16c31a3ed62d744e2aaf01d684f7991051a)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ common/flatpak-context.c | 109 +++++++++++++++++++++++++++++++++++++--
+ 1 file changed, 105 insertions(+), 4 deletions(-)
+
+diff --git a/common/flatpak-context.c b/common/flatpak-context.c
+index 297a89ef..98dac5ee 100644
+--- a/common/flatpak-context.c
++++ b/common/flatpak-context.c
+@@ -2860,6 +2860,90 @@ flatpak_context_apply_env_appid (FlatpakBwrap *bwrap,
+     flatpak_bwrap_set_env (bwrap, "HOST_XDG_STATE_HOME", g_getenv ("XDG_STATE_HOME"), TRUE);
+ }
+ 
++/* This creates zero or more directories unders base_fd+basedir, each
++ * being guaranteed to either exist and be a directory (no symlinks)
++ * or be created as a directory. The last directory is opened
++ * and the fd is returned.
++ */
++static gboolean
++mkdir_p_open_nofollow_at (int          base_fd,
++                          const char  *basedir,
++                          int          mode,
++                          const char  *subdir,
++                          int         *out_fd,
++                          GError     **error)
++{
++  glnx_autofd int parent_fd = -1;
++
++  if (g_path_is_absolute (subdir))
++    {
++      const char *skipped_prefix = subdir;
++
++      while (*skipped_prefix == '/')
++        skipped_prefix++;
++
++      g_warning ("--persist=\"%s\" is deprecated, treating it as --persist=\"%s\"", subdir, skipped_prefix);
++      subdir = skipped_prefix;
++    }
++
++  g_autofree char *subdir_dirname = g_path_get_dirname (subdir);
++
++  if (strcmp (subdir_dirname, ".") == 0)
++    {
++      /* It is ok to open basedir with follow=true */
++      if (!glnx_opendirat (base_fd, basedir, TRUE, &parent_fd, error))
++        return FALSE;
++    }
++  else if (strcmp (subdir_dirname, "..") == 0)
++    {
++      return glnx_throw (error, "'..' not supported in --persist paths");
++    }
++  else
++    {
++      if (!mkdir_p_open_nofollow_at (base_fd, basedir, mode,
++                                     subdir_dirname, &parent_fd, error))
++        return FALSE;
++    }
++
++  g_autofree char *subdir_basename = g_path_get_basename (subdir);
++
++  if (strcmp (subdir_basename, ".") == 0)
++    {
++      *out_fd = glnx_steal_fd (&parent_fd);
++      return TRUE;
++    }
++  else if (strcmp (subdir_basename, "..") == 0)
++    {
++      return glnx_throw (error, "'..' not supported in --persist paths");
++    }
++
++  if (!glnx_shutil_mkdir_p_at (parent_fd, subdir_basename, mode, NULL, error))
++    return FALSE;
++
++  int fd = openat (parent_fd, subdir_basename, O_PATH | O_NONBLOCK | O_DIRECTORY | O_CLOEXEC | O_NOCTTY | O_NOFOLLOW);
++  if (fd == -1)
++    {
++      int saved_errno = errno;
++      struct stat stat_buf;
++
++      /* If it's a symbolic link, that could be a user trying to offload
++       * large data to another filesystem, but it could equally well be
++       * a malicious or compromised app trying to exploit GHSA-7hgv-f2j8-xw87.
++       * Produce a clearer error message in this case.
++       * Unfortunately the errno we get in this case is ENOTDIR, so we have
++       * to ask again to find out whether it's really a symlink. */
++      if (saved_errno == ENOTDIR &&
++          fstatat (parent_fd, subdir_basename, &stat_buf, AT_SYMLINK_NOFOLLOW) == 0 &&
++          S_ISLNK (stat_buf.st_mode))
++        return glnx_throw (error, "Symbolic link \"%s\" not allowed to avoid sandbox escape", subdir_basename);
++
++      return glnx_throw_errno_prefix (error, "openat(%s)", subdir_basename);
++    }
++
++  *out_fd = fd;
++  return TRUE;
++}
++
+ void
+ flatpak_context_append_bwrap_filesystem (FlatpakContext  *context,
+                                          FlatpakBwrap    *bwrap,
+@@ -2883,13 +2967,30 @@ flatpak_context_append_bwrap_filesystem (FlatpakContext  *context,
+       while (g_hash_table_iter_next (&iter, &key, NULL))
+         {
+           const char *persist = key;
+-          g_autofree char *src = g_build_filename (g_get_home_dir (), ".var/app", app_id, persist, NULL);
++          g_autofree char *appdir = g_build_filename (g_get_home_dir (), ".var/app", app_id, NULL);
+           g_autofree char *dest = g_build_filename (g_get_home_dir (), persist, NULL);
++          g_autoptr(GError) local_error = NULL;
++
++          if (g_mkdir_with_parents (appdir, 0755) != 0)
++            {
++              g_warning ("Unable to create directory %s", appdir);
++              continue;
++            }
++
++          /* Don't follow symlinks from the persist directory, as it is under user control */
++          glnx_autofd int src_fd = -1;
++          if (!mkdir_p_open_nofollow_at (AT_FDCWD, appdir, 0755,
++                                         persist, &src_fd,
++                                         &local_error))
++            {
++              g_warning ("Failed to create persist path %s: %s", persist, local_error->message);
++              continue;
++            }
+ 
+-          if (g_mkdir_with_parents (src, 0755) != 0)
+-            g_info ("Unable to create directory %s", src);
++          g_autofree char *src_via_proc = g_strdup_printf ("/proc/self/fd/%d", src_fd);
+ 
+-          flatpak_bwrap_add_bind_arg (bwrap, "--bind", src, dest);
++          flatpak_bwrap_add_fd (bwrap, g_steal_fd (&src_fd));
++          flatpak_bwrap_add_bind_arg (bwrap, "--bind", src_via_proc, dest);
+         }
+     }
+ 
diff --git a/meta-oe/recipes-extended/flatpak/flatpak/CVE-2024-42472_2.patch b/meta-oe/recipes-extended/flatpak/flatpak/CVE-2024-42472_2.patch
new file mode 100644
index 0000000000..ad06b9aa7e
--- /dev/null
+++ b/meta-oe/recipes-extended/flatpak/flatpak/CVE-2024-42472_2.patch
@@ -0,0 +1,44 @@
+From dd8a68c126b8f73a58a37353b34ec25179859d79 Mon Sep 17 00:00:00 2001
+From: Alexander Larsson <alexl@redhat.com>
+Date: Tue, 18 Jun 2024 11:31:05 +0200
+Subject: [PATCH] persist directories: Pass using new bwrap --bind-fd option
+
+Instead of passing a /proc/self/fd bind mount we use --bind-fd, which
+has two advantages:
+ * bwrap closes the fd when used, so it doesn't leak into the started app
+ * bwrap ensures that what was mounted was the passed in fd (same dev/ino),
+   as there is a small (required) gap between symlink resolve and mount
+   where the target path could be replaced.
+
+Please note that this change requires an updated version of bubblewrap.
+
+Resolves: CVE-2024-42472, GHSA-7hgv-f2j8-xw87
+[smcv: Make whitespace consistent]
+Co-authored-by: Simon McVittie <smcv@collabora.com>
+Signed-off-by: Simon McVittie <smcv@collabora.com>
+
+CVE: CVE-2024-42472
+Upstream-Status: Backport [https://github.com/flatpak/flatpak/commit/6bd603f6836e9b38b9b937d3b78f3fbf36e7ff75]
+(cherry picked from commit 6bd603f6836e9b38b9b937d3b78f3fbf36e7ff75)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ common/flatpak-context.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/common/flatpak-context.c b/common/flatpak-context.c
+index 98dac5ee..24150daa 100644
+--- a/common/flatpak-context.c
++++ b/common/flatpak-context.c
+@@ -2987,10 +2987,10 @@ flatpak_context_append_bwrap_filesystem (FlatpakContext  *context,
+               continue;
+             }
+ 
+-          g_autofree char *src_via_proc = g_strdup_printf ("/proc/self/fd/%d", src_fd);
++          g_autofree char *src_via_proc = g_strdup_printf ("%d", src_fd);
+ 
+           flatpak_bwrap_add_fd (bwrap, g_steal_fd (&src_fd));
+-          flatpak_bwrap_add_bind_arg (bwrap, "--bind", src_via_proc, dest);
++          flatpak_bwrap_add_bind_arg (bwrap, "--bind-fd", src_via_proc, dest);
+         }
+     }
+ 
diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb b/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
index fba7bc49a4..639027701b 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SRC_URI = " \
     gitsm://github.com/flatpak/flatpak;protocol=https;branch=main \
     file://0001-flatpak-pc-add-pc_sysrootdir.patch \
+    file://CVE-2024-42472_1.patch \
+    file://CVE-2024-42472_2.patch \
 "
 
 SRCREV = "925c80f913d69e7ca424428823e1431c4ffb0deb"

