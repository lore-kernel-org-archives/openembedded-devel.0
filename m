Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 326B0CAC5BA
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 12:29:08 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.11205.1758716941058980037
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 05:29:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=auUL4MMI;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b2b4096539fso149742666b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 05:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758716939; x=1759321739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dk4s4mInWg6G0CrxsDG6AnShUJb7TshklzbhUfr2dAQ=;
        b=auUL4MMIxdOkT+Lz6ub8munv07Yfp0U/p7zsKI/fVVyZyj8rP4UqK7iSDgEa6PKcp6
         dX18m71eq2KCUlzDIOEgSQ/OidyR8Y29o7cLF1kqZBTfSXd01lo7qtAocyis3rrtZAlu
         97XbJGwJ0OF3YbFl/CsFiEqnLCr004mfxyq6W4cFFpMDDrVtgNbI2fZDESyX6XGxCDqD
         yVy/O7grshabZ7v4FQ1igulEequxWG4LQF5QCxSQSLJTxP/ohXU/8lpD6jZDCEQdXXAL
         AVIdI6gMM/MxJCMKU4TiVlNlC5164v+3psZgkJ4cHnfa7mndtGtZD7UtWp+MR5EkkR0c
         By2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758716939; x=1759321739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dk4s4mInWg6G0CrxsDG6AnShUJb7TshklzbhUfr2dAQ=;
        b=GK5K7BYgyx2CqmdBUfwkSkznRmhhrQMwKhYet8123r8+mDoTRPy5TkBVy9CuWHLJTi
         kztIN4YjO9ZzBa+H6r/gZC5zii7JfbCX1H+7YUfBQtQfLf64ZgZYGqSUyvfIhkSxPof/
         DIlX0HLDFO1JjupaULSQX74gG+Pq3NWxgNnVzC+RNeOHAkc31D7Fi3a+dKTJ6UFRf9Mc
         Urr64Jwoivlpef/adMu8wHMenGjk5ZY/Axzke5EdCemUNy3T4vO5B5/PG+ZmeY88h0fH
         q0W+njFSGwZKGZejJL6fUFLRciA0J27Tpjc7yehEUERD9/mgVjCTzo0TaiJuMa9v/F0T
         okyg==
X-Gm-Message-State: AOJu0YwK4pwoHUmJ5WriT6UE2QpJv2nMfFcY8JDfJpbr19lZF64JRub4
	GZG3mPzj2cs1Egl98pVXeOHCp+LEhpY5x3E1jl0vrKLEfUhPkH258Yj4EtBTjA==
X-Gm-Gg: ASbGncuLDE3lpDb7YZY+wa4RxC0ZrhSAXznD5rkr2bAKpGvfS72qDFgmQAtJ3wfOOU9
	ICH+hcD1o3BTSK9WQRYJWFeGoY/TFVh5FXKtb8VJlODYcC9SKgNEAERb/XosEioaUbR0msxu8nD
	/pWfHoTgAFpyrBKFix9zgbfFWvpfvJ42Er94G/mXUStWtWL4hDtGgWoAZug3yLfCQPWQ60JrqGf
	tiYUgdKTopPT5hG7YjK40GAMQrR99Gt2W+IgDBWfEUXmlSUydtq4kucLlhzCiCRM2OZtStjrwED
	beGDeHQMBsCP/kJPCQQcZsRraLEp/dEhUrDDgbanUAXKpfzSchge9AE9aa4POiQ3L+OVgbYJE8b
	jMvp4z4BwYG+iF/wBK89S
X-Google-Smtp-Source: AGHT+IHHSnabPDxX99P6ExJyFF7hhEb5u6pwT/N/WVrR3txIGK0J0lkahbN9eeqsV+jfxW5th9KKWQ==
X-Received: by 2002:a17:907:1c12:b0:b0d:786d:b001 with SMTP id a640c23a62f3a-b32c87cb963mr205956566b.1.1758716939304;
        Wed, 24 Sep 2025 05:28:59 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63469f30772sm3024835a12.22.2025.09.24.05.28.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:28:58 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 14/20] gvfs: obviate the ssh-client requirement for gvfs
Date: Wed, 24 Sep 2025 14:28:32 +0200
Message-ID: <20250924122839.4184719-15-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924122839.4184719-1-skandigraun@gmail.com>
References: <20250924122839.4184719-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 12:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119817

From: Alex Stewart <alex.stewart@ni.com>

The gvfs project meson configuration attempts to locate and resolve the
path to an ssh-client on the build host, then pass that full-path to the
gvfs sftp-backend as a constant string, to be used at runtime to fork
ssh subprocesses.

As a consequence, if the build machine's ssh client path differs from
the gvfs target's path - as is common for OE/buildroot builds - gvfs can
fail at runtime. Further, build machines cannot configure gvfs without
an ssh client, even though nothing *uses* the client during the build.

The .patch in this commit has been upstreamed with gvfs, and modifies
the configuration to instead pass the string-literal `ssh` to the sftp
backend. With this change, gvfs will instead rely on PATH-expansion to
locate the user's ssh-client at runtime.

This obviates the requirement that the build machine have an ssh-client.

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b3ace96246ed13320e8fc21b59ce92512aa8c843)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...H-expand-the-sftp-backend-ssh-client.patch | 60 +++++++++++++++++++
 meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb  |  5 +-
 2 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/gvfs/gvfs/0001-daemon-PATH-expand-the-sftp-backend-ssh-client.patch

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs/0001-daemon-PATH-expand-the-sftp-backend-ssh-client.patch b/meta-gnome/recipes-gnome/gvfs/gvfs/0001-daemon-PATH-expand-the-sftp-backend-ssh-client.patch
new file mode 100644
index 0000000000..011858e80c
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs/0001-daemon-PATH-expand-the-sftp-backend-ssh-client.patch
@@ -0,0 +1,60 @@
+From 8327383e262e1e7f32750a8a2d3dd708195b0f53 Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Wed, 14 Dec 2022 03:05:45 -0600
+Subject: [PATCH] daemon: PATH-expand the sftp backend ssh client
+
+Meson is currently configured to search the gvfs builder's PATH for an
+ssh client, and hardcode its fullpath as the canonical ssh client for
+the gvfs sftp backend.
+
+This setup breaks in cases where the builder has a different ssh client
+from the final runtime root, or where the client's pathes differ.
+Builders using OpenEmbedded or buildroot workspaces are particularly
+affected.
+
+Instead, set SSH_PROGRAM to `ssh` so that it gets PATH-expanded at
+runtime.
+
+Closes: https://gitlab.gnome.org/GNOME/gvfs/-/issues/465
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+
+Upstream-Status: Accepted
+* https://gitlab.gnome.org/GNOME/gvfs/-/merge_requests/157
+  * Expect upstream merge in GNOME 44
+
+---
+ daemon/meson.build | 2 +-
+ meson.build        | 4 ----
+ 2 files changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/daemon/meson.build b/daemon/meson.build
+index e20ada29..72a16890 100644
+--- a/daemon/meson.build
++++ b/daemon/meson.build
+@@ -256,7 +256,7 @@ if enable_sftp
+     '-DDEFAULT_BACKEND_TYPE=sftp',
+     '-DBACKEND_TYPES="sftp", G_VFS_TYPE_BACKEND_SFTP,',
+     '-DMAX_JOB_THREADS=1',
+-    '-DSSH_PROGRAM="@0@"'.format(ssh.full_path()),
++    '-DSSH_PROGRAM="ssh"',
+   ]
+ 
+   programs += {'gvfsd-sftp': {'sources': sources, 'dependencies': deps, 'c_args': cflags}}
+diff --git a/meson.build b/meson.build
+index 7fd67427..a84c0104 100644
+--- a/meson.build
++++ b/meson.build
+@@ -457,10 +457,6 @@ endif
+ 
+ # *** SFTP backend ***
+ enable_sftp = get_option('sftp')
+-if enable_sftp
+-  ssh = find_program('ssh', required: false)
+-  assert(ssh.found(), 'SFTP backend requested but a ssh client is required')
+-endif
+ 
+ # *** Enable development utils ***
+ enable_devel_utils = get_option('devel_utils')
+-- 
+2.38.1
+
diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
index 686e0ab4e0..1201d9bf21 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
@@ -18,7 +18,10 @@ DEPENDS += "\
 
 RDEPENDS:${PN} += "gsettings-desktop-schemas"
 
-SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
+SRC_URI = "\
+    https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive \
+    file://0001-daemon-PATH-expand-the-sftp-backend-ssh-client.patch \
+"
 
 SRC_URI[archive.sha256sum] = "03d72b8c15ef438110f0cf457b5655266c8b515d0412b30f4d55cfa0da06ac5e"
 

