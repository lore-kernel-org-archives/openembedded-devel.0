Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5625C3DA78
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:14:12 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web10.190992.1673939650331413230
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:14:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=OYAO5uJu;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673939648; i=@fujitsu.com;
	bh=IUTP9p5zwVH8xws4o/xgZUxn9zhYtytVbG6G+a82Dis=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=OYAO5uJupVWY6zMZq7uLvqv/kwaT2ELJA7Q041gLiAAzh10mPd4nEo62qpHE99R0b
	 yfnAImV3lDwmrcu+THbeHWE6c1XTMOD9e28qQ+PToDDcQK5r9IIffzR9wlovkdXY4h
	 gi31wEj+8vBxFPf4hiufgHX2hIIUBacbrG62kqt7KxRl8GxvyQW06NBVxtxDT0mpQu
	 IrPIwdnF1Nms8AXkl/Mhm73crjA5t13+dWmUTv8NLMtms/5LaKbxkQ7HjKfgRoq+/3
	 i4fQR+xJ3+Ryc+fprglx5KIbpyg38ty3bNySkgd5qBobetFfCb5Ojvm0TjkhZ/PS8l
	 +byMFhYSw/5RA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpLvf61i
  ywfceE4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePz3XlsBXOVKj6v6mVuYNwg18XIxSEk8JBR
  4vi3nWwQzlUmic7eqVDOXkaJU8++M3YxcnKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPe
  xcjB4ewgKPE1fsaIGEWAVWJTV1XWEBsXgEnibdrrrCD2BICChJTHr4Ha+UUcJb4cWgdWI0QUM
  3J0zNYIeoFJU7OfMICMV5C4uCLF8wQvYoSsy83s0DYlRKtH35B2WoSV89tYp7AKDgLSfssJO0
  LGJlWMZoVpxaVpRbpGprqJRVlpmeU5CZm5uglVukm6qWW6panFpfoGuollhfrpRYX6xVX5ibn
  pOjlpZZsYgQGb0oxe/EOxgfL/ugdYpTkYFIS5T1peixZiC8pP6UyI7E4I76oNCe1+BCjDAeHk
  gSvlztQTrAoNT21Ii0zBxhJMGkJDh4lEd5wS6A0b3FBYm5xZjpE6hSjopQ472pPoIQASCKjNA
  +uDRa9lxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8z7xAJrCk5lXAjf9FdBiJqDFHiVHQRa
  XJCKkpBqYSsvi2XfbX1zpWVbivDCTR/Zc8/FnCyfLdfiwBCi9Lg4obtzFdEO+1c2uQO1OTYHD
  +st+b/9O1Ht6ambE1RRjJ6H90kFPK+f7XakNe7W65ONRh2drJ5Syfnoqv/jMvNBl4beedbtZ/
  ms36zr+rOC8X0KZoX/mlICnukJ1V9RUnDqzppqmvHD4kBfP1iBwrGKWXOelmy0bl/+6Xuqxzf
  Tqh+QPB/zeH9RtNVXdcn8C35Xj0zZFnX1xOFbTnOXNDr2/Fza3Vk9hLJmeo3ns0tXMa9eS989
  7snjOTD7Tk/nFMznP/ulU+LxX+nfy4YUXV4WmJdf+X/RGmumF5EyPbUE87DKfer/a2fJxXmOO
  nMCircRSnJFoqMVcVJwIAMyyAE5ZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-585.messagelabs.com!1673939647!388221!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10463 invoked from network); 17 Jan 2023 07:14:07 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:14:07 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 6DA2F1AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:14:07 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 623101AC
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:14:07 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:14:05 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gvfs: upgrade 1.50.2 -> 1.50.3
Date: Tue, 17 Jan 2023 15:13:37 +0800
Message-ID: <1673939617-20032-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673939617-20032-1-git-send-email-wangmy@fujitsu.com>
References: <1673939617-20032-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:14:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100598

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
---
 ...H-expand-the-sftp-backend-ssh-client.patch | 60 -------------------
 .../gvfs/{gvfs_1.50.2.bb => gvfs_1.50.3.bb}   |  7 +--
 2 files changed, 2 insertions(+), 65 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gvfs/gvfs/0001-daemon-PATH-expand-the-sftp-backend-ssh-client.patch
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.50.2.bb => gvfs_1.50.3.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs/0001-daemon-PATH-expand-the-sftp-backend-ssh-client.patch b/meta-gnome/recipes-gnome/gvfs/gvfs/0001-daemon-PATH-expand-the-sftp-backend-ssh-client.patch
deleted file mode 100644
index 011858e80..000000000
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
index 6ea872753..073c05af2 100644
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
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.25.1


