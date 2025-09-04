Return-Path: <psaavedra@igalia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F20CA1015
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 11:43:00 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by mx.groups.io with SMTP id smtpd.web11.36796.1756986174501890994
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 04:42:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@igalia.com header.s=20170329 header.b=Kwn+K8NX;
 spf=pass (domain: igalia.com, ip: 213.97.179.56, mailfrom: psaavedra@igalia.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=/hxt85e/TpjGHz45EBxrZJ8GZTMoyg3uPRZuuwLfU9E=; b=Kwn+K8NXlFDImrZ17ZcIjhUXj9
	xHGKpkbeiKc0ZxSiMrehgh/16Bv0eoj8KR7hn7c+UGLsYU2VxXNsRp8Jrt7PecH547jWH3jZeqcjL
	GhBBbe2Gd3Iz0B99qvBRFp6KBo+2rQbus7v1L3YVvjZsc5ZXYAeA21uLcv5rGir9oVEPATTMAFrXZ
	WSzdIlgcc9cpSbW+puieuZJpy66W5OTg+Hw6TQAWIGXHjuQXCbThxwFyBExPYJVzbzEMJJrMPfHyb
	veP/NnXmR8Em39ae0NxW94cuLTvdPwAIhzzHOUaUlb4B/QN1gw8EuhmWfuUV8rm/kmgBM8evdsJMB
	5ENNrrZw==;
Received: from 89.141.239.195.dyn.user.ono.com ([89.141.239.195] helo=galo..)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uu8Md-006kq2-44; Thu, 04 Sep 2025 13:42:51 +0200
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-devel@lists.openembedded.org
Cc: Pablo Saavedra <psaavedra@igalia.com>
Subject: [oe][meta-gnome][PATCH v2] sysprof: upgrade 48.0 -> 48.1
Date: Thu,  4 Sep 2025 13:42:33 +0200
Message-Id: <20250904114233.2451466-1-psaavedra@igalia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <18620AE64DAF0C95.8194@lists.openembedded.org>
References: <18620AE64DAF0C95.8194@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 11:43:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119284

Changes:

* libsysprof-capture: Clean ring buffer memory for counters

Also:

* Make elf loader search for debug links in .debug dirs

Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
---
 ...libunwind-instead-of-libunwind-gener.patch |  8 ++--
 ...oke-the-commands-to-update-the-icon-.patch |  6 +--
 ...-for-unw_set_caching_policy-before-u.patch |  2 +-
 ...search-for-debug-links-in-.debug-dir.patch | 47 +++++++++++++++++++
 .../{sysprof_48.0.bb => sysprof_48.1.bb}      |  3 +-
 5 files changed, 57 insertions(+), 9 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/sysprof/sysprof/0005-Make-elf-loader-search-for-debug-links-in-.debug-dir.patch
 rename meta-gnome/recipes-gnome/sysprof/{sysprof_48.0.bb => sysprof_48.1.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof/0001-meson-Check-for-libunwind-instead-of-libunwind-gener.patch b/meta-gnome/recipes-gnome/sysprof/sysprof/0001-meson-Check-for-libunwind-instead-of-libunwind-gener.patch
index 5bdc55b3a5..3d78e188b5 100644
--- a/meta-gnome/recipes-gnome/sysprof/sysprof/0001-meson-Check-for-libunwind-instead-of-libunwind-gener.patch
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof/0001-meson-Check-for-libunwind-instead-of-libunwind-gener.patch
@@ -1,4 +1,4 @@
-From 36fbd12df9258972f8ff1fbb24506f12751178eb Mon Sep 17 00:00:00 2001
+From 3d547c043f772fe1352c7beb0e3331e35c77e63e Mon Sep 17 00:00:00 2001
 From: Pablo Saavedra <psaavedra@igalia.com>
 Date: Mon, 11 Nov 2024 13:05:15 +0100
 Subject: [PATCH] meson: Check for libunwind instead of libunwind-generic
@@ -18,11 +18,11 @@ Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 23fcea8..3d3feca 100644
+index 3907354..783f558 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -110,7 +110,7 @@ polkit_dep = dependency('polkit-gobject-1', version: polkit_req_version, require
- config_h.set10('HAVE_POLKIT', polkit_dep.found())
+@@ -114,7 +114,7 @@ if cc.has_header('asm/perf_regs.h')
+ endif
  
  if need_libsysprof
 -  libunwind_dep = dependency('libunwind-generic', required: true)
diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof/0002-meson-Do-not-invoke-the-commands-to-update-the-icon-.patch b/meta-gnome/recipes-gnome/sysprof/sysprof/0002-meson-Do-not-invoke-the-commands-to-update-the-icon-.patch
index 6ed04eefac..61c75f08b4 100644
--- a/meta-gnome/recipes-gnome/sysprof/sysprof/0002-meson-Do-not-invoke-the-commands-to-update-the-icon-.patch
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof/0002-meson-Do-not-invoke-the-commands-to-update-the-icon-.patch
@@ -1,4 +1,4 @@
-From ef2cb850bc24d57ddf3641cb1ba202a657422c66 Mon Sep 17 00:00:00 2001
+From 58619c59e72c796aa2686bc6ffbfa07a23dbc14d Mon Sep 17 00:00:00 2001
 From: Carlos Alberto Lopez Perez <clopez@igalia.com>
 Date: Wed, 24 Jul 2024 15:51:05 +0100
 Subject: [PATCH] meson: Do not invoke the commands to update the icon caches
@@ -15,10 +15,10 @@ Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 3d3feca..8da9b5f 100644
+index 783f558..8775fe6 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -272,7 +272,7 @@ configure_file(
+@@ -276,7 +276,7 @@ configure_file(
    configuration: config_h
  )
  
diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof/0003-libsysprof-Check-for-unw_set_caching_policy-before-u.patch b/meta-gnome/recipes-gnome/sysprof/sysprof/0003-libsysprof-Check-for-unw_set_caching_policy-before-u.patch
index 60592bde4f..0f3703457d 100644
--- a/meta-gnome/recipes-gnome/sysprof/sysprof/0003-libsysprof-Check-for-unw_set_caching_policy-before-u.patch
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof/0003-libsysprof-Check-for-unw_set_caching_policy-before-u.patch
@@ -1,4 +1,4 @@
-From 5a2b4cdbc7f0a329245066c849592fe310bdefd7 Mon Sep 17 00:00:00 2001
+From 219920476d7b23370bfb456ee4ac1cf9b21479c6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 25 Jul 2024 20:18:17 -0700
 Subject: [PATCH] libsysprof: Check for unw_set_caching_policy before using
diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof/0005-Make-elf-loader-search-for-debug-links-in-.debug-dir.patch b/meta-gnome/recipes-gnome/sysprof/sysprof/0005-Make-elf-loader-search-for-debug-links-in-.debug-dir.patch
new file mode 100644
index 0000000000..bd7305d77d
--- /dev/null
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof/0005-Make-elf-loader-search-for-debug-links-in-.debug-dir.patch
@@ -0,0 +1,47 @@
+From 9c35912dba0597a241e9af4fe5c87bfc0931c46c Mon Sep 17 00:00:00 2001
+From: Pawel Lampe <plampe@igalia.com>
+Date: Fri, 16 May 2025 14:31:29 +0200
+Subject: [PATCH] Make elf loader search for debug links in .debug dirs
+
+When the distribution is built using yocto project, it's possible
+to specify 'dbg-pkgs' image feature, see:
+https://docs.yoctoproject.org/dev/ref-manual/features.html
+This image feature makes files with package debug symbols being
+placed under .debug directories accompanying the original binary
+directories and mentioned in the .gnu_debuglink of the original binary.
+Effectively the symbols of e.g. /x/y/libz.so will be placed in
+/x/y/.debug/libz.so.
+
+This change makes sysprof's elf loader to search for debug links
+in such a .debug directories.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/sysprof/-/merge_requests/140]
+---
+ src/libsysprof/sysprof-elf-loader.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/libsysprof/sysprof-elf-loader.c b/src/libsysprof/sysprof-elf-loader.c
+index 2e52e26..e0b4089 100644
+--- a/src/libsysprof/sysprof-elf-loader.c
++++ b/src/libsysprof/sysprof-elf-loader.c
+@@ -336,6 +336,7 @@ sysprof_elf_loader_annotate (SysprofElfLoader      *self,
+           g_autofree char *directory_name = NULL;
+           g_autofree char *debug_path = NULL;
+           g_autofree char *short_debug_path = NULL;
++          g_autofree char *shorter_debug_path = NULL;
+           const char *short_directory_name;
+           const char *debug_dir = self->debug_dirs[i];
+           const char *build_id;
+@@ -360,6 +361,12 @@ sysprof_elf_loader_annotate (SysprofElfLoader      *self,
+               sysprof_elf_set_debug_link_elf (elf, get_deepest_debuglink (debug_link_elf));
+               return;
+             }
++          shorter_debug_path = g_build_filename (directory_name, ".debug", debug_link, NULL);
++          if ((debug_link_elf = sysprof_elf_loader_load (self, mount_namespace, shorter_debug_path, build_id, 0, NULL)))
++            {
++              sysprof_elf_set_debug_link_elf (elf, get_deepest_debuglink (debug_link_elf));
++              return;
++            }
+         }
+     }
+ 
diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof_48.0.bb b/meta-gnome/recipes-gnome/sysprof/sysprof_48.1.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/sysprof/sysprof_48.0.bb
rename to meta-gnome/recipes-gnome/sysprof/sysprof_48.1.bb
index 968b5d8e14..145c0bfe38 100644
--- a/meta-gnome/recipes-gnome/sysprof/sysprof_48.0.bb
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof_48.1.bb
@@ -21,8 +21,9 @@ SRC_URI += "file://0001-meson-Check-for-libunwind-instead-of-libunwind-gener.pat
            file://0002-meson-Do-not-invoke-the-commands-to-update-the-icon-.patch \
            file://0003-libsysprof-Check-for-unw_set_caching_policy-before-u.patch \
            file://0004-sysprof-greeter-fix-environ-with-shadowing.patch \
+           file://0005-Make-elf-loader-search-for-debug-links-in-.debug-dir.patch \
            "
-SRC_URI[archive.sha256sum] = "1b0f0380f2f30708ba87829321a06fee1db36dfa87797bbf07f0a7acf4498d18"
+SRC_URI[archive.sha256sum] = "54f157fdfef1edf1e2f22e542c462d90e1c21fca8c30eba4127cee739039bbe2"
 
 # reason: gtk4 requires opengl distro feature
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'gtk', 'opengl', '', d)}"
-- 
2.34.1


