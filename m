Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21948CAC5B9
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 12:29:08 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.11206.1758716942302802135
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 05:29:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ajiqhBXo;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-631df7b2dffso2066948a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 05:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758716941; x=1759321741; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8U8kO8AZYjeTvHHXYYUF0qHJ8J9uFq1rkuxnAp56zmQ=;
        b=ajiqhBXo4DqObplPdkHoUN+UFmqNlT8OUgMoNv7Ur/Oq9f1dUUuWvUkXOAqSfOxlER
         UrcRiIPLYwCbX7KVX2l+SLpni1vJid3fE8ttB66Kkyaz9KYgYZzOz6caDiW6NArhuSDY
         pNEOdhPzvlZkCxB/UmwearE85eglmo2qnuUEN5v5fT6XOl2ZSDTK0aaEw4Gd01enWzBC
         qJfzduHOsYpxj9Spr2mq3G7ePFb9EGgBjmWYpLPDg+HJdvQUEZ4mcK2i2DlzXXkCjrGW
         fphNwYw7m3CE7uIvV9iZWTBTErMXQXNNUNrSyaY0dnZQfk+x505ijboi+dLs4mSdud7i
         LOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758716941; x=1759321741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8U8kO8AZYjeTvHHXYYUF0qHJ8J9uFq1rkuxnAp56zmQ=;
        b=MWW4PQ3dL2dVMt8X9THhj8H8fTTrgoTE4elia4zN9OgO3HjD6VsfuvWZ32WWWrSNZq
         ndccEOCUWXDO5J23EgmAFmGTyM5SskiMAXPFjVQdCLj3x2qTI0c1V58JtyeAq7CH9wr0
         vxEoFPev43vmwu5n6wnbgjieWT42b1k6I4uM7u70KsX+Tkdw8empDjUkVtgiYWDUzgaM
         GNmU3Zemaja1Vk/E+Wix5DQm+iEetRgf/B1J6O0k4RAPRcBMGwJW86FZo2jgLxPVePfq
         d+B1ZvPB75iIdWY40KE+Qagb4YQJ9kcmDkC1+tcRl5fw2lpGN2vBcztszplQWpwJlV5x
         9O1A==
X-Gm-Message-State: AOJu0YyltYwew46rehyUJ5viY/O6C+C31DZ+kak7rGHgh2Re5javHX0+
	RuFigXCeasfPlHpKTRWF+dRv96evs1/IqZsjGJtra33hFWlDSYEWnqT0vJQQIw==
X-Gm-Gg: ASbGncvOpUzY3wtmKM8FjyVMVPawddU4tT/9QAQOokVuUpzDoUuglT40/jFbEfNtFaw
	EkoiEdvtB30xhHKg63JFNjqqzoBIeK0feDmhuKfNRz4iAmacqJkZSN5DoHxAXNlTCApDGWZ8vI5
	wSlDxTvrMZ+fh8dyLpFYudElY/FDO2ymSvg5XeN9txF3fgAjuNYbtSxqcZ4LQQqasyrwOHAI+VZ
	M94WyrB9CDoG/CEQnxw82zcbU2/ocGRdUa8WR6mE6vuFYtUlP5wO7OTXQIXRe0EOCg1GALU1SQy
	Tr6Mz08ap15yCmIO3rxs54rH29SjepL8znLfU2lv8RcEe7tMc50JQoeLjP39n//bHkyxD696t1I
	69tne2Bo5C6+9NUsEZAJh
X-Google-Smtp-Source: AGHT+IFJNtKfU9SRmZ8dNXDsePsCKmOGl+D96tKjGji4zkZOf1ho/DpOysRzWAr7NjMlQ80eB487HQ==
X-Received: by 2002:a05:6402:4343:b0:634:81c8:59d3 with SMTP id 4fb4d7f45d1cf-63483b4ac89mr2071171a12.12.1758716940528;
        Wed, 24 Sep 2025 05:29:00 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63469f30772sm3024835a12.22.2025.09.24.05.28.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:28:59 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 15/20] gvfs: upgrade 1.50.2 -> 1.50.3
Date: Wed, 24 Sep 2025 14:28:33 +0200
Message-ID: <20250924122839.4184719-16-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924122839.4184719-1-skandigraun@gmail.com>
References: <20250924122839.4184719-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 12:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119818

From: Wang Mingyu <wangmy@fujitsu.com>

0001-daemon-PATH-expand-the-sftp-backend-ssh-client.patch
included in 1.50.3

Changelog:
===========
* dav: Prevent usage of NULL when user is not specified
* ftp: Fix hangs when the connection is released
* fuse: Decrease file handle reference when open file fail
* sftp: PATH-expand the ssh client
* test: Several smaller enhancements
* backend: Add support for xx-large and x-large thumbnails
* goa: Prevent automounts when resuming from suspension
* Translation updates (GNOME Translation Project contributors)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d11db37985f0b28ed8a5e95cf22876a17646ca45)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...H-expand-the-sftp-backend-ssh-client.patch | 60 -------------------
 .../gvfs/{gvfs_1.50.2.bb => gvfs_1.50.3.bb}   |  7 +--
 2 files changed, 2 insertions(+), 65 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gvfs/gvfs/0001-daemon-PATH-expand-the-sftp-backend-ssh-client.patch
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.50.2.bb => gvfs_1.50.3.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs/0001-daemon-PATH-expand-the-sftp-backend-ssh-client.patch b/meta-gnome/recipes-gnome/gvfs/gvfs/0001-daemon-PATH-expand-the-sftp-backend-ssh-client.patch
deleted file mode 100644
index 011858e80c..0000000000
--- a/meta-gnome/recipes-gnome/gvfs/gvfs/0001-daemon-PATH-expand-the-sftp-backend-ssh-client.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 8327383e262e1e7f32750a8a2d3dd708195b0f53 Mon Sep 17 00:00:00 2001
-From: Alex Stewart <alex.stewart@ni.com>
-Date: Wed, 14 Dec 2022 03:05:45 -0600
-Subject: [PATCH] daemon: PATH-expand the sftp backend ssh client
-
-Meson is currently configured to search the gvfs builder's PATH for an
-ssh client, and hardcode its fullpath as the canonical ssh client for
-the gvfs sftp backend.
-
-This setup breaks in cases where the builder has a different ssh client
-from the final runtime root, or where the client's pathes differ.
-Builders using OpenEmbedded or buildroot workspaces are particularly
-affected.
-
-Instead, set SSH_PROGRAM to `ssh` so that it gets PATH-expanded at
-runtime.
-
-Closes: https://gitlab.gnome.org/GNOME/gvfs/-/issues/465
-Signed-off-by: Alex Stewart <alex.stewart@ni.com>
-
-Upstream-Status: Accepted
-* https://gitlab.gnome.org/GNOME/gvfs/-/merge_requests/157
-  * Expect upstream merge in GNOME 44
-
----
- daemon/meson.build | 2 +-
- meson.build        | 4 ----
- 2 files changed, 1 insertion(+), 5 deletions(-)
-
-diff --git a/daemon/meson.build b/daemon/meson.build
-index e20ada29..72a16890 100644
---- a/daemon/meson.build
-+++ b/daemon/meson.build
-@@ -256,7 +256,7 @@ if enable_sftp
-     '-DDEFAULT_BACKEND_TYPE=sftp',
-     '-DBACKEND_TYPES="sftp", G_VFS_TYPE_BACKEND_SFTP,',
-     '-DMAX_JOB_THREADS=1',
--    '-DSSH_PROGRAM="@0@"'.format(ssh.full_path()),
-+    '-DSSH_PROGRAM="ssh"',
-   ]
- 
-   programs += {'gvfsd-sftp': {'sources': sources, 'dependencies': deps, 'c_args': cflags}}
-diff --git a/meson.build b/meson.build
-index 7fd67427..a84c0104 100644
---- a/meson.build
-+++ b/meson.build
-@@ -457,10 +457,6 @@ endif
- 
- # *** SFTP backend ***
- enable_sftp = get_option('sftp')
--if enable_sftp
--  ssh = find_program('ssh', required: false)
--  assert(ssh.found(), 'SFTP backend requested but a ssh client is required')
--endif
- 
- # *** Enable development utils ***
- enable_devel_utils = get_option('devel_utils')
--- 
-2.38.1
-
diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.3.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.50.3.bb
index 1201d9bf21..e55e86f8e9 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.3.bb
@@ -18,12 +18,9 @@ DEPENDS += "\
 
 RDEPENDS:${PN} += "gsettings-desktop-schemas"
 
-SRC_URI = "\
-    https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive \
-    file://0001-daemon-PATH-expand-the-sftp-backend-ssh-client.patch \
-"
+SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
 
-SRC_URI[archive.sha256sum] = "03d72b8c15ef438110f0cf457b5655266c8b515d0412b30f4d55cfa0da06ac5e"
+SRC_URI[archive.sha256sum] = "6897119e97bb16029d2778e1a5a54a6a6592631f8b2f3a2a1dea4ef2b01803fd"
 
 # depends on gsettings-desktop-schemas->gcr->gtk+3-> x11
 REQUIRED_DISTRO_FEATURES = "x11"

