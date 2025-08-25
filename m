Return-Path: <psaavedra@igalia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 102FFCA0FE1
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 07:21:37 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by mx.groups.io with SMTP id smtpd.web11.33760.1756106489974654600
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Aug 2025 00:21:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@igalia.com header.s=20170329 header.b=h4MJifOR;
 spf=pass (domain: igalia.com, ip: 213.97.179.56, mailfrom: psaavedra@igalia.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=GmEZB4wYCNH5c0hY5j7yAzLSEpLIAqWmlaezd0UHOEY=; b=h4MJifORsrttqDICuLbWWBhunF
	Gqyq1ZC4HNGgYJLCbpp2GzcdXGxZ1S3s/4FyoVFXGM2oPqvm814cBiYEUiVkt0lx615++n7JM14U1
	G1CHkNhP/cSG0iMMdnAhqsSUoCqy4AOgYXFjECAfg5Z+ymc2wO5jBH1evffkp5zz9eD2DSmVzuaTN
	XVX0EX24qsO698V/b4xeaOGM9w2VLQ+De46gp8hEYLK1So+mjJ7Xv5jZbvKe7SksYzRdKEpwrv7Vt
	sqKfXmoVY5ytN0HQtMNreM3Nbdn1CK5rMqK9I7WglMYLn2vO0xGzL4qZJCBsOO1fe1r2Z4bNzosdJ
	gnGB/Khw==;
Received: from 89.141.239.195.dyn.user.ono.com ([89.141.239.195] helo=galo..)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uqRWA-001HMi-SW; Mon, 25 Aug 2025 09:21:26 +0200
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-devel@lists.openembedded.org
Cc: Pablo Saavedra <psaavedra@igalia.com>
Subject: [oe][meta-gnome][PATCH v2] sysprof: upgrade 47.2 -> 48.0
Date: Mon, 25 Aug 2025 09:21:11 +0200
Message-Id: <20250825072111.2587640-1-psaavedra@igalia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822115732.69642-1-psaavedra@igalia.com>
References: <20250822115732.69642-1-psaavedra@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Aug 2025 07:21:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119090

Changes:

* Ensure local dbus-monitor is reaped after capturing
* Modernization for various GTK deprecations
* Add new symbolizer for debuginfod which is enabled by default
* Many performance improvements for capture loading
* Support for unwinding without frame-pointers on distributions
  lacking -fno-omit-frame-pointer at the toolchain level. This
  uses a new "sysprof-live-unwinder" elevated helper process
  which takes data from perf and unwinds the stack as soon as
  it can without capturing the perf data to disk.
  Thank you to Red Hat and the tools team for enabling this
  work for RHEL.
* The greeter now persists your settings and restores them the
  next time you run Sysprof.
* Various graph drawing improvements.
* Fixes for time display in various formats.
* Translation updates.
* Fix drawing of Y-reversed data point markers
* Make greeter save environment variables to state file for reuse
* Use D-Bus power profiles bus name rather than legacy D-Bus bus name

Also:

* Add new patch to fix environ shadowing in sysprof greeter

Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
---
 ...libunwind-instead-of-libunwind-gener.patch |  6 +--
 ...oke-the-commands-to-update-the-icon-.patch |  6 +--
 ...-for-unw_set_caching_policy-before-u.patch |  2 +-
 ...f-greeter-fix-environ-with-shadowing.patch | 37 +++++++++++++++++++
 .../{sysprof_47.2.bb => sysprof_48.0.bb}      |  7 ++--
 5 files changed, 48 insertions(+), 10 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/sysprof/sysprof/0004-sysprof-greeter-fix-environ-with-shadowing.patch
 rename meta-gnome/recipes-gnome/sysprof/{sysprof_47.2.bb => sysprof_48.0.bb} (83%)

diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof/0001-meson-Check-for-libunwind-instead-of-libunwind-gener.patch b/meta-gnome/recipes-gnome/sysprof/sysprof/0001-meson-Check-for-libunwind-instead-of-libunwind-gener.patch
index 0dc7cb35a6..5bdc55b3a5 100644
--- a/meta-gnome/recipes-gnome/sysprof/sysprof/0001-meson-Check-for-libunwind-instead-of-libunwind-gener.patch
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof/0001-meson-Check-for-libunwind-instead-of-libunwind-gener.patch
@@ -1,4 +1,4 @@
-From 779bbfebcd414a2cb4ab73ff1c4eb987cfdab456 Mon Sep 17 00:00:00 2001
+From 36fbd12df9258972f8ff1fbb24506f12751178eb Mon Sep 17 00:00:00 2001
 From: Pablo Saavedra <psaavedra@igalia.com>
 Date: Mon, 11 Nov 2024 13:05:15 +0100
 Subject: [PATCH] meson: Check for libunwind instead of libunwind-generic
@@ -18,10 +18,10 @@ Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 96c1d09..86b9df4 100644
+index 23fcea8..3d3feca 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -107,7 +107,7 @@ polkit_dep = dependency('polkit-gobject-1', version: polkit_req_version, require
+@@ -110,7 +110,7 @@ polkit_dep = dependency('polkit-gobject-1', version: polkit_req_version, require
  config_h.set10('HAVE_POLKIT', polkit_dep.found())
  
  if need_libsysprof
diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof/0002-meson-Do-not-invoke-the-commands-to-update-the-icon-.patch b/meta-gnome/recipes-gnome/sysprof/sysprof/0002-meson-Do-not-invoke-the-commands-to-update-the-icon-.patch
index 77374ffc56..6ed04eefac 100644
--- a/meta-gnome/recipes-gnome/sysprof/sysprof/0002-meson-Do-not-invoke-the-commands-to-update-the-icon-.patch
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof/0002-meson-Do-not-invoke-the-commands-to-update-the-icon-.patch
@@ -1,4 +1,4 @@
-From cc0c0b518d46bf82ad34eeea8d40496c9ad971dd Mon Sep 17 00:00:00 2001
+From ef2cb850bc24d57ddf3641cb1ba202a657422c66 Mon Sep 17 00:00:00 2001
 From: Carlos Alberto Lopez Perez <clopez@igalia.com>
 Date: Wed, 24 Jul 2024 15:51:05 +0100
 Subject: [PATCH] meson: Do not invoke the commands to update the icon caches
@@ -15,10 +15,10 @@ Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 86b9df4..fe75ef9 100644
+index 3d3feca..8da9b5f 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -269,7 +269,7 @@ configure_file(
+@@ -272,7 +272,7 @@ configure_file(
    configuration: config_h
  )
  
diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof/0003-libsysprof-Check-for-unw_set_caching_policy-before-u.patch b/meta-gnome/recipes-gnome/sysprof/sysprof/0003-libsysprof-Check-for-unw_set_caching_policy-before-u.patch
index 303e78a866..60592bde4f 100644
--- a/meta-gnome/recipes-gnome/sysprof/sysprof/0003-libsysprof-Check-for-unw_set_caching_policy-before-u.patch
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof/0003-libsysprof-Check-for-unw_set_caching_policy-before-u.patch
@@ -1,4 +1,4 @@
-From 68425b541e88f9f03a418cfda052b46b2a185e4e Mon Sep 17 00:00:00 2001
+From 5a2b4cdbc7f0a329245066c849592fe310bdefd7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 25 Jul 2024 20:18:17 -0700
 Subject: [PATCH] libsysprof: Check for unw_set_caching_policy before using
diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof/0004-sysprof-greeter-fix-environ-with-shadowing.patch b/meta-gnome/recipes-gnome/sysprof/sysprof/0004-sysprof-greeter-fix-environ-with-shadowing.patch
new file mode 100644
index 0000000000..a2c925cbea
--- /dev/null
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof/0004-sysprof-greeter-fix-environ-with-shadowing.patch
@@ -0,0 +1,37 @@
+From f65c492e93db122ac9623c7b0ee590801f90e366 Mon Sep 17 00:00:00 2001
+From: Christian Hergert <chergert@redhat.com>
+Date: Mon, 11 Aug 2025 14:10:08 -0700
+Subject: [PATCH] sysprof/greeter: fix environ with shadowing
+
+Fixes: #150
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/sysprof/-/issues/150]
+Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
+---
+ src/sysprof/sysprof-greeter.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/sysprof/sysprof-greeter.c b/src/sysprof/sysprof-greeter.c
+index 5f44cb6..80e07ae 100644
+--- a/src/sysprof/sysprof-greeter.c
++++ b/src/sysprof/sysprof-greeter.c
+@@ -626,14 +626,14 @@ sysprof_greeter_init (SysprofGreeter *self)
+ 
+   if (self->recording_template)
+     {
+-      g_auto(GStrv) environ = NULL;
++      g_auto(GStrv) environ_ = NULL;
+       g_object_get (self->recording_template,
+-                    "environ", &environ,
++                    "environ", &environ_,
+                     NULL);
+-      if (environ)
++      if (environ_)
+         {
+-          for (guint i = 0; environ[i]; i++)
+-            gtk_string_list_append (self->envvars, environ[i]);            
++          for (guint i = 0; environ_[i]; i++)
++            gtk_string_list_append (self->envvars, environ_[i]);            
+         }
+     }
+ 
diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof_47.2.bb b/meta-gnome/recipes-gnome/sysprof/sysprof_48.0.bb
similarity index 83%
rename from meta-gnome/recipes-gnome/sysprof/sysprof_47.2.bb
rename to meta-gnome/recipes-gnome/sysprof/sysprof_48.0.bb
index b6f140404c..968b5d8e14 100644
--- a/meta-gnome/recipes-gnome/sysprof/sysprof_47.2.bb
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof_48.0.bb
@@ -18,10 +18,11 @@ DEPENDS += " \
 "
 
 SRC_URI += "file://0001-meson-Check-for-libunwind-instead-of-libunwind-gener.patch \
-            file://0002-meson-Do-not-invoke-the-commands-to-update-the-icon-.patch \
-            file://0003-libsysprof-Check-for-unw_set_caching_policy-before-u.patch \
+           file://0002-meson-Do-not-invoke-the-commands-to-update-the-icon-.patch \
+           file://0003-libsysprof-Check-for-unw_set_caching_policy-before-u.patch \
+           file://0004-sysprof-greeter-fix-environ-with-shadowing.patch \
            "
-SRC_URI[archive.sha256sum] = "e4b5ede9fd978ec3f0d5a0d44d0429a6d201c362bf6cb4527319031ae462c54f"
+SRC_URI[archive.sha256sum] = "1b0f0380f2f30708ba87829321a06fee1db36dfa87797bbf07f0a7acf4498d18"
 
 # reason: gtk4 requires opengl distro feature
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'gtk', 'opengl', '', d)}"
-- 
2.34.1


