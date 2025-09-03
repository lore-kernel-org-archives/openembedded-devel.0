Return-Path: <psaavedra@igalia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A6DCA0FF2
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 16:09:13 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by mx.groups.io with SMTP id smtpd.web11.16742.1756915745444138088
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 09:09:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@igalia.com header.s=20170329 header.b=QWobxrCB;
 spf=pass (domain: igalia.com, ip: 213.97.179.56, mailfrom: psaavedra@igalia.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=vAc+LA4D8J2Y08PFcYTKSqP6qcVy4qUL9V5SRG9a/As=; b=QWobxrCBwk0qH34c4vvOxzkcmW
	jyc5FXh0V9TsMmnrKQjp6/y4BQpjg99LGwM9cfKmOFBFzevQ8AQBuV0+C/NbV667XfwDLbLnROzm8
	26aaMYszVtjPXXcFRYTFoY0PmApgpRGnfGVfPclki7al8X2PPrWaxLbvMPwLUhbDZ4ALMcdSXCLIc
	NBI3wwdRFdJJ/KdXrgnVoe9FpIi9OinQN+q+dSLZB5NMtfhen8mjiw1UFKCQywCUhdY/tlGC1L/6u
	hlH8FLvFmaXLiHp9Heoa/6QMdYspIUzPt2NZllBZ107N536i3LLISeNZFS/rfJsyp1D6Uc+x6iaFu
	0jSS7D1Q==;
Received: from 89.141.239.195.dyn.user.ono.com ([89.141.239.195] helo=galo..)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1utq2g-006HsV-Jl; Wed, 03 Sep 2025 18:09:02 +0200
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-devel@lists.openembedded.org
Cc: Pablo Saavedra <psaavedra@igalia.com>
Subject: [oe][meta-gnome][PATCH] sysprof: upgrade 48.0 -> 48.1
Date: Wed,  3 Sep 2025 18:08:48 +0200
Message-Id: <20250903160848.3840533-1-psaavedra@igalia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 16:09:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119260

Changes:

* libsysprof-capture: Clean ring buffer memory for counters

Also:

* Make PolKit usage a build-time option
* sysprofd: Check that remote user is root when PolKit is
  disabled
* Make elf loader search for debug links in .debug dirs

Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
---
 ...libunwind-instead-of-libunwind-gener.patch |   8 +-
 ...oke-the-commands-to-update-the-icon-.patch |   6 +-
 ...-for-unw_set_caching_policy-before-u.patch |   2 +-
 ...ake-PolKit-usage-a-build-time-option.patch | 154 ++++++++++++++++++
 ...hat-remote-user-is-root-when-PolKit-.patch |  81 +++++++++
 ...search-for-debug-links-in-.debug-dir.patch |  47 ++++++
 .../{sysprof_48.0.bb => sysprof_48.1.bb}      |   5 +-
 7 files changed, 294 insertions(+), 9 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/sysprof/sysprof/0005-Make-PolKit-usage-a-build-time-option.patch
 create mode 100644 meta-gnome/recipes-gnome/sysprof/sysprof/0006-sysprofd-Check-that-remote-user-is-root-when-PolKit-.patch
 create mode 100644 meta-gnome/recipes-gnome/sysprof/sysprof/0007-Make-elf-loader-search-for-debug-links-in-.debug-dir.patch
 rename meta-gnome/recipes-gnome/sysprof/{sysprof_48.0.bb => sysprof_48.1.bb} (85%)

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
diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof/0005-Make-PolKit-usage-a-build-time-option.patch b/meta-gnome/recipes-gnome/sysprof/sysprof/0005-Make-PolKit-usage-a-build-time-option.patch
new file mode 100644
index 0000000000..8d04ab246d
--- /dev/null
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof/0005-Make-PolKit-usage-a-build-time-option.patch
@@ -0,0 +1,154 @@
+From de01665e4be1043b0b2df077afb479e17ea15573 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Wed, 28 Aug 2024 15:07:36 +0300
+Subject: [PATCH] Make PolKit usage a build-time option
+
+Allow compiling without PolKit to gain elevated privileges to start
+the RAPL profiler (by means of turbostat) and instruct sysprofd to
+start gathering profiling data. Using these features should be still
+possible by running e.g. sysprof-cli as root, or allowing other users
+in the bus configuration XML.
+
+Disabling PolKit is more likely to be used in embedded systems, in
+which case it seems reasonable to have less build dependencies, and
+assume that either integrators would be able to either customize the
+bus configuration, or use Sysprof only in development builds where
+running as root may be acceptable.
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/sysprof/-/merge_requests/103]
+---
+ meson.build                      | 12 ++++++++----
+ meson_options.txt                |  6 ++++++
+ src/sysprofd/ipc-rapl-profiler.c |  9 +++++++--
+ src/sysprofd/ipc-service-impl.c  |  6 ++++++
+ 4 files changed, 27 insertions(+), 6 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 8da9b5f..10f73bc 100644
+--- a/meson.build
++++ b/meson.build
+@@ -103,12 +103,16 @@ config_h.set_quoted('PACKAGE_LOCALE_DIR', join_paths(get_option('prefix'), get_o
+ config_h.set10('HAVE_LIBSYSTEMD', libsystemd_dep.found())
+ config_h.set10('HAVE_DEBUGINFOD', debuginfod_dep.found())
+ 
+-polkit_agent_dep = dependency('polkit-agent-1', required: get_option('polkit-agent'))
+-config_h.set10('HAVE_POLKIT_AGENT', polkit_agent_dep.found())
+-
+-polkit_dep = dependency('polkit-gobject-1', version: polkit_req_version, required: false)
++polkit_dep = dependency('polkit-gobject-1', version: polkit_req_version, required: get_option('polkit'))
+ config_h.set10('HAVE_POLKIT', polkit_dep.found())
+ 
++if polkit_dep.found()
++  polkit_agent_dep = dependency('polkit-agent-1', required: get_option('polkit-agent'))
++else
++  polkit_agent_dep = disabler()
++endif
++config_h.set10('HAVE_POLKIT_AGENT', polkit_agent_dep.found())
++
+ if cc.has_header('asm/perf_regs.h')
+   config_h.set10('HAVE_PERF_REGS_H', true)
+ endif
+diff --git a/meson_options.txt b/meson_options.txt
+index 02bb698..aecbee3 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -11,6 +11,12 @@ option('gtk', type: 'boolean')
+ # Allow disabling the installation of libsysprof-capture*.a
+ option('install-static', type: 'boolean')
+ 
++# Allow disabling of features that depend on polkit.
++option('polkit', type: 'feature',
++  value: 'auto',
++  description: 'Enable features which require polkit'
++)
++
+ # Allow disabling of features that depend on polkit-agent.
+ option('polkit-agent', type: 'feature',
+   value: 'auto',
+diff --git a/src/sysprofd/ipc-rapl-profiler.c b/src/sysprofd/ipc-rapl-profiler.c
+index 9b91847..93791d1 100644
+--- a/src/sysprofd/ipc-rapl-profiler.c
++++ b/src/sysprofd/ipc-rapl-profiler.c
+@@ -25,7 +25,9 @@
+ #include <errno.h>
+ #include <fcntl.h>
+ #include <gio/gunixfdlist.h>
++#if HAVE_POLKIT
+ #include <polkit/polkit.h>
++#endif
+ #include <sysprof-capture.h>
+ #include <unistd.h>
+ 
+@@ -177,6 +179,7 @@ get_counter_base (SysprofCaptureWriter *writer,
+   return add_counter_base (writer, counters, core, cpu);
+ }
+ 
++#if HAVE_POLKIT
+ static gboolean
+ ipc_rapl_profiler_g_authorize_method (GDBusInterfaceSkeleton *skeleton,
+                                       GDBusMethodInvocation  *invocation)
+@@ -218,6 +221,7 @@ ipc_rapl_profiler_g_authorize_method (GDBusInterfaceSkeleton *skeleton,
+ 
+   return ret;
+ }
++#endif
+ 
+ static void
+ ipc_rapl_profiler_finalize (GObject *object)
+@@ -234,11 +238,12 @@ static void
+ ipc_rapl_profiler_class_init (IpcRaplProfilerClass *klass)
+ {
+   GObjectClass *object_class = G_OBJECT_CLASS (klass);
+-  GDBusInterfaceSkeletonClass *skeleton_class = G_DBUS_INTERFACE_SKELETON_CLASS (klass);
+-
+   object_class->finalize = ipc_rapl_profiler_finalize;
+ 
++#if HAVE_POLKIT
++  GDBusInterfaceSkeletonClass *skeleton_class = G_DBUS_INTERFACE_SKELETON_CLASS (klass);
+   skeleton_class->g_authorize_method = ipc_rapl_profiler_g_authorize_method;
++#endif
+ 
+   /**
+    * IpcRaplProfiler::activity:
+diff --git a/src/sysprofd/ipc-service-impl.c b/src/sysprofd/ipc-service-impl.c
+index 50825cf..f1c1205 100644
+--- a/src/sysprofd/ipc-service-impl.c
++++ b/src/sysprofd/ipc-service-impl.c
+@@ -25,7 +25,9 @@
+ #include <errno.h>
+ #include <fcntl.h>
+ #include <gio/gunixfdlist.h>
++#if HAVE_POLKIT
+ #include <polkit/polkit.h>
++#endif
+ #include <string.h>
+ #include <sys/syscall.h>
+ #include <time.h>
+@@ -255,6 +257,7 @@ ipc_service_impl_handle_perf_event_open (IpcService            *service,
+   return TRUE;
+ }
+ 
++#if HAVE_POLKIT
+ static gboolean
+ ipc_service_impl_g_authorize_method (GDBusInterfaceSkeleton *skeleton,
+                                      GDBusMethodInvocation  *invocation)
+@@ -296,6 +299,7 @@ ipc_service_impl_g_authorize_method (GDBusInterfaceSkeleton *skeleton,
+ 
+   return ret;
+ }
++#endif
+ 
+ static gboolean
+ ipc_service_impl_handle_get_process_info (IpcService            *service,
+@@ -440,9 +444,11 @@ G_DEFINE_TYPE_WITH_CODE (IpcServiceImpl, ipc_service_impl, IPC_TYPE_SERVICE_SKEL
+ static void
+ ipc_service_impl_class_init (IpcServiceImplClass *klass)
+ {
++#if HAVE_POLKIT
+   GDBusInterfaceSkeletonClass *skeleton_class = G_DBUS_INTERFACE_SKELETON_CLASS (klass);
+ 
+   skeleton_class->g_authorize_method = ipc_service_impl_g_authorize_method;
++#endif
+ 
+   signals [ACTIVITY] =
+     g_signal_new ("activity",
diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof/0006-sysprofd-Check-that-remote-user-is-root-when-PolKit-.patch b/meta-gnome/recipes-gnome/sysprof/sysprof/0006-sysprofd-Check-that-remote-user-is-root-when-PolKit-.patch
new file mode 100644
index 0000000000..f5dd6cf0c3
--- /dev/null
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof/0006-sysprofd-Check-that-remote-user-is-root-when-PolKit-.patch
@@ -0,0 +1,81 @@
+From ab4a1538a13366820f0d370c356e0a626058cab2 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Mon, 30 Sep 2024 16:36:52 +0300
+Subject: [PATCH] sysprofd: Check that remote user is root when PolKit is
+ disabled
+
+When PolKit support is enabled at build time, check that the remote user
+is "root" (and thus privileged) instead of always allowing access to
+methods of the sysprofd D-Bus interface.
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/sysprof/-/merge_requests/103]
+---
+ src/sysprofd/ipc-service-impl.c | 45 +++++++++++++++++++++++++++++++--
+ 1 file changed, 43 insertions(+), 2 deletions(-)
+
+diff --git a/src/sysprofd/ipc-service-impl.c b/src/sysprofd/ipc-service-impl.c
+index f1c1205..182159a 100644
+--- a/src/sysprofd/ipc-service-impl.c
++++ b/src/sysprofd/ipc-service-impl.c
+@@ -299,6 +299,49 @@ ipc_service_impl_g_authorize_method (GDBusInterfaceSkeleton *skeleton,
+ 
+   return ret;
+ }
++#else
++static gboolean
++ipc_service_impl_g_authorize_method (GDBusInterfaceSkeleton *skeleton,
++                                     GDBusMethodInvocation  *invocation)
++{
++  GDBusConnection *connection;
++  GCredentials *credentials;
++
++  g_assert (IPC_IS_SERVICE_IMPL (skeleton));
++  g_assert (G_IS_DBUS_METHOD_INVOCATION (invocation));
++
++  connection = g_dbus_method_invocation_get_connection (invocation);
++  credentials = g_dbus_connection_get_peer_credentials (connection);
++
++  if (credentials)
++    {
++      g_autoptr(GError) error = NULL;
++      uid_t peer_uid = g_credentials_get_unix_user (credentials, &error);
++      if (error)
++        {
++          g_assert(peer_uid == -1);
++          g_dbus_method_invocation_return_error (g_steal_pointer (&invocation),
++                                                 G_DBUS_ERROR,
++                                                 G_DBUS_ERROR_ACCESS_DENIED,
++                                                 "Could not obtain remote user credentials: %s",
++                                                 error->message);
++        }
++      else if (peer_uid == 0)
++        return TRUE;
++      else
++        g_dbus_method_invocation_return_error_literal (g_steal_pointer (&invocation),
++                                                       G_DBUS_ERROR,
++                                                       G_DBUS_ERROR_ACCESS_DENIED,
++                                                       "Not authorized to make request");
++    }
++  else
++    g_dbus_method_invocation_return_error_literal (g_steal_pointer (&invocation),
++                                                   G_DBUS_ERROR,
++                                                   G_DBUS_ERROR_ACCESS_DENIED,
++                                                   "Could not obtain connection peer credentials");
++
++  return FALSE;
++}
+ #endif
+ 
+ static gboolean
+@@ -444,11 +487,9 @@ G_DEFINE_TYPE_WITH_CODE (IpcServiceImpl, ipc_service_impl, IPC_TYPE_SERVICE_SKEL
+ static void
+ ipc_service_impl_class_init (IpcServiceImplClass *klass)
+ {
+-#if HAVE_POLKIT
+   GDBusInterfaceSkeletonClass *skeleton_class = G_DBUS_INTERFACE_SKELETON_CLASS (klass);
+ 
+   skeleton_class->g_authorize_method = ipc_service_impl_g_authorize_method;
+-#endif
+ 
+   signals [ACTIVITY] =
+     g_signal_new ("activity",
diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof/0007-Make-elf-loader-search-for-debug-links-in-.debug-dir.patch b/meta-gnome/recipes-gnome/sysprof/sysprof/0007-Make-elf-loader-search-for-debug-links-in-.debug-dir.patch
new file mode 100644
index 0000000000..a62dbb2af1
--- /dev/null
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof/0007-Make-elf-loader-search-for-debug-links-in-.debug-dir.patch
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
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/sysprof/-/merge_requests/140]
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
similarity index 85%
rename from meta-gnome/recipes-gnome/sysprof/sysprof_48.0.bb
rename to meta-gnome/recipes-gnome/sysprof/sysprof_48.1.bb
index 968b5d8e14..756ff4b5e0 100644
--- a/meta-gnome/recipes-gnome/sysprof/sysprof_48.0.bb
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof_48.1.bb
@@ -21,8 +21,11 @@ SRC_URI += "file://0001-meson-Check-for-libunwind-instead-of-libunwind-gener.pat
            file://0002-meson-Do-not-invoke-the-commands-to-update-the-icon-.patch \
            file://0003-libsysprof-Check-for-unw_set_caching_policy-before-u.patch \
            file://0004-sysprof-greeter-fix-environ-with-shadowing.patch \
+           file://0005-Make-PolKit-usage-a-build-time-option.patch \
+           file://0006-sysprofd-Check-that-remote-user-is-root-when-PolKit-.patch \
+           file://0007-Make-elf-loader-search-for-debug-links-in-.debug-dir.patch \
            "
-SRC_URI[archive.sha256sum] = "1b0f0380f2f30708ba87829321a06fee1db36dfa87797bbf07f0a7acf4498d18"
+SRC_URI[archive.sha256sum] = "54f157fdfef1edf1e2f22e542c462d90e1c21fca8c30eba4127cee739039bbe2"
 
 # reason: gtk4 requires opengl distro feature
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'gtk', 'opengl', '', d)}"
-- 
2.34.1


