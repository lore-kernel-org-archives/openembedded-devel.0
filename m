Return-Path: <eu@felipetonello.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6D7446AE3B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2013 22:25:12 +0000 (UTC)
Received: by mail-ob0-f178.google.com with SMTP id uz6so5489625obc.23
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2013 14:25:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=w+AYalMy01dNMBAD2WnsEDtBHSDRofzmXYo/svqa0xI=;
	b=hLPq9C9Yte2aZqv0ujlP3mDBaMnTyYK4h1QjQ0L9/MUg33LgQWQWjyBzPX9nwYJCzC
	GK9QZlApWtdQVLtS3hMTMl3MzGM0X4ElpFRu2uxvHwN+yjoy6R3I5O5P9m/8U7HoycMD
	qxORd6NoQqJ+u3M6ixHKUtTj/UkCHcOKFyJmwk5O/dDy6VqUflwJrO5PDq5Ij5j2fZNE
	r6wljdFxV4y/jYdwmqEXcEnwy4giEJtmZYde6cyUNkRaf0rTF+nZ/kZP9/N3uPSa3Msy
	8UXFRcvCZK7crroUwmNUwCmhO2aGnn3HGXKkhqJb15izq/U64FF7w3S1CQ0S2Hhc6xaE
	U2BA==
X-Gm-Message-State: ALoCoQlwo7ZUd4bJeIic4VwGxChwMMnQo6R86mWQYMHwivydvMemJTHVSflR8AcquIEGFVFohDER
X-Received: by 10.60.117.198 with SMTP id kg6mr2599213oeb.80.1387232711446;
	Mon, 16 Dec 2013 14:25:11 -0800 (PST)
Received: from localhost.localdomain.com (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPSA id m4sm30108811oen.7.2013.12.16.14.25.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Dec 2013 14:25:09 -0800 (PST)
From: "Felipe F. Tonello" <eu@felipetonello.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Dec 2013 14:25:05 -0800
Message-Id: <1387232705-18081-1-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH v2] packagekit: Updated to 0.8.13
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Dec 2013 22:25:15 -0000

From: "Felipe F. Tonello" <eu@felipetonello.com>

Packagekit will compile support for all backend supported by OE-core. Images
that want to install packagekit should specify its correct backend dependency
as well.

Ex.: install the following packages to an image that uses rpm:
 * packagekit
 * packagekit-backend-smart

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 ...deprecated-glib-functions-and-use-the-new.patch | 166 --------
 .../packagekit/packagekit-0.5.6/configurefix.patch |  13 -
 .../packagekit/packagekit-0.5.6/opkgfixes.patch    | 422 ---------------------
 .../packagekit/packagekit_0.5.6.bb                 |  62 ---
 .../packagekit/packagekit_0.8.13.bb                |  64 ++++
 5 files changed, 64 insertions(+), 663 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/0001-Don-t-call-deprecated-glib-functions-and-use-the-new.patch
 delete mode 100644 meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/configurefix.patch
 delete mode 100644 meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/opkgfixes.patch
 delete mode 100644 meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
 create mode 100644 meta-oe/recipes-devtools/packagekit/packagekit_0.8.13.bb

diff --git a/meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/0001-Don-t-call-deprecated-glib-functions-and-use-the-new.patch b/meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/0001-Don-t-call-deprecated-glib-functions-and-use-the-new.patch
deleted file mode 100644
index ecf8e74..0000000
--- a/meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/0001-Don-t-call-deprecated-glib-functions-and-use-the-new.patch
+++ /dev/null
@@ -1,166 +0,0 @@
-From 869e52a9055c72970fed036a1510f676e6ce0824 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 13 Jun 2013 01:24:19 -0700
-Subject: [PATCH] Don't call deprecated glib functions and use the new gthread
- API.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Inappropriate[version Unmaintained Upstream]
----
- client/pk-console.c                              |    3 ++-
- client/pk-generate-pack.c                        |    3 ++-
- client/pk-monitor.c                              |    3 ++-
- contrib/command-not-found/PackageKit.sh          |    2 +-
- contrib/command-not-found/pk-command-not-found.c |    4 ++--
- contrib/debuginfo-install/pk-debuginfo-install.c |    4 ++--
- src/pk-backend.c                                 |    7 +++++++
- src/pk-main.c                                    |    4 ++--
- 10 files changed, 20 insertions(+), 10 deletions(-)
-
-diff --git a/client/pk-console.c b/client/pk-console.c
-index de927e1..2435f27 100644
---- a/client/pk-console.c
-+++ b/client/pk-console.c
-@@ -1264,11 +1264,12 @@ main (int argc, char *argv[])
- 	bindtextdomain (GETTEXT_PACKAGE, PACKAGE_LOCALE_DIR);
- 	bind_textdomain_codeset (GETTEXT_PACKAGE, "UTF-8");
- 	textdomain (GETTEXT_PACKAGE);
--
-+#if !GLIB_CHECK_VERSION(2,32,0)
- 	if (! g_thread_supported ())
- 		g_thread_init (NULL);
- 	g_type_init ();
- 	dbus_g_thread_init ();
-+#endif
- 
- 	/* do stuff on ctrl-c */
- 	signal (SIGINT, pk_console_sigint_cb);
-diff --git a/client/pk-generate-pack.c b/client/pk-generate-pack.c
-index 0b2b40f..20d7e8d 100644
---- a/client/pk-generate-pack.c
-+++ b/client/pk-generate-pack.c
-@@ -251,12 +251,13 @@ main (int argc, char *argv[])
- 	bindtextdomain (GETTEXT_PACKAGE, PACKAGE_LOCALE_DIR);
- 	bind_textdomain_codeset (GETTEXT_PACKAGE, "UTF-8");
- 	textdomain (GETTEXT_PACKAGE);
--
-+#if !GLIB_CHECK_VERSION(2,32,0)
- 	if (! g_thread_supported ())
- 		g_thread_init (NULL);
- 
- 	g_type_init ();
- 	dbus_g_thread_init ();
-+#endif
- 
- 	/* do stuff on ctrl-c */
- 	signal (SIGINT, pk_generate_pack_sigint_cb);
-diff --git a/client/pk-monitor.c b/client/pk-monitor.c
-index f230f7a..d43007f 100644
---- a/client/pk-monitor.c
-+++ b/client/pk-monitor.c
-@@ -285,11 +285,12 @@ main (int argc, char *argv[])
- 	bindtextdomain (GETTEXT_PACKAGE, PACKAGE_LOCALE_DIR);
- 	bind_textdomain_codeset (GETTEXT_PACKAGE, "UTF-8");
- 	textdomain (GETTEXT_PACKAGE);
--
-+#if !GLIB_CHECK_VERSION(2,32,0)
- 	if (! g_thread_supported ())
- 		g_thread_init (NULL);
- 	g_type_init ();
- 	dbus_g_thread_init ();
-+#endif
- 
- 	context = g_option_context_new (NULL);
- 	/* TRANSLATORS: this is a program that monitors PackageKit */
-diff --git a/contrib/command-not-found/PackageKit.sh b/contrib/command-not-found/PackageKit.sh
-index d08989c..d708fff 100644
---- a/contrib/command-not-found/PackageKit.sh
-+++ b/contrib/command-not-found/PackageKit.sh
-@@ -18,7 +18,7 @@ command_not_found_handle () {
- 
- 	# run the command, or just print a warning
- 	if [ $runcnf -eq 1 ]; then
--		/home/hughsie/.root/libexec/pk-command-not-found $1
-+		/usr/lib/packagekit/pk-command-not-found $1
- 		retval=$?
- 	else
- 		echo "bash: $1: command not found"
-diff --git a/contrib/command-not-found/pk-command-not-found.c b/contrib/command-not-found/pk-command-not-found.c
-index 70679c0..9f81ce4 100644
---- a/contrib/command-not-found/pk-command-not-found.c
-+++ b/contrib/command-not-found/pk-command-not-found.c
-@@ -659,12 +659,12 @@ main (int argc, char *argv[])
- 	bindtextdomain (GETTEXT_PACKAGE, PACKAGE_LOCALE_DIR);
- 	bind_textdomain_codeset (GETTEXT_PACKAGE, "UTF-8");
- 	textdomain (GETTEXT_PACKAGE);
--
-+#if !GLIB_CHECK_VERSION(2,32,0)
- 	if (! g_thread_supported ())
- 		g_thread_init (NULL);
- 	dbus_g_thread_init ();
- 	g_type_init ();
--
-+#endif
- 	context = g_option_context_new (NULL);
- 	/* TRANSLATORS: tool that gets called when the command is not found */
- 	g_option_context_set_summary (context, _("PackageKit Command Not Found"));
-diff --git a/contrib/debuginfo-install/pk-debuginfo-install.c b/contrib/debuginfo-install/pk-debuginfo-install.c
-index c12aca5..b0e1e7c 100644
---- a/contrib/debuginfo-install/pk-debuginfo-install.c
-+++ b/contrib/debuginfo-install/pk-debuginfo-install.c
-@@ -532,11 +532,11 @@ main (int argc, char *argv[])
- 	bindtextdomain (GETTEXT_PACKAGE, PACKAGE_LOCALE_DIR);
- 	bind_textdomain_codeset (GETTEXT_PACKAGE, "UTF-8");
- 	textdomain (GETTEXT_PACKAGE);
--
-+#if !GLIB_CHECK_VERSION(2,32,0)
- 	if (! g_thread_supported ())
- 		g_thread_init (NULL);
- 	g_type_init ();
--
-+#endif
- 	context = g_option_context_new (NULL);
- 	/* TRANSLATORS: tool that gets called when the command is not found */
- 	g_option_context_set_summary (context, _("PackageKit Debuginfo Installer"));
-diff --git a/src/pk-backend.c b/src/pk-backend.c
-index 5216b63..5b83ae4 100644
---- a/src/pk-backend.c
-+++ b/src/pk-backend.c
-@@ -2103,7 +2103,14 @@ pk_backend_thread_create (PkBackend *backend, PkBackendThreadFunc func)
- 		egg_warning ("already has thread");
- 		return FALSE;
- 	}
-+#if !GLIB_CHECK_VERSION(2,32,0)
- 	backend->priv->thread = g_thread_create ((GThreadFunc) func, backend, FALSE, NULL);
-+#else
-+	backend->priv->thread = g_thread_try_new ("daemon thread", (GThreadFunc) func, backend, NULL);
-+	if (backend->priv->thread != NULL) {
-+		g_thread_unref(backend->priv->thread);
-+	}
-+#endif
- 	if (backend->priv->thread == NULL) {
- 		egg_warning ("failed to create thread");
- 		return FALSE;
-diff --git a/src/pk-main.c b/src/pk-main.c
-index 4c758cd..8fa2482 100644
---- a/src/pk-main.c
-+++ b/src/pk-main.c
-@@ -219,12 +219,12 @@ main (int argc, char *argv[])
- 	bindtextdomain (GETTEXT_PACKAGE, PACKAGE_LOCALE_DIR);
- 	bind_textdomain_codeset (GETTEXT_PACKAGE, "UTF-8");
- 	textdomain (GETTEXT_PACKAGE);
--
-+#if !GLIB_CHECK_VERSION(2,32,0)
- 	if (! g_thread_supported ())
- 		g_thread_init (NULL);
- 	dbus_g_thread_init ();
- 	g_type_init ();
--
-+#endif
- 	/* TRANSLATORS: describing the service that is running */
- 	context = g_option_context_new (_("PackageKit service"));
- 	g_option_context_add_main_entries (context, options, NULL);
--- 
-1.7.9.5
-
diff --git a/meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/configurefix.patch b/meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/configurefix.patch
deleted file mode 100644
index 48f9591..0000000
--- a/meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/configurefix.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: PackageKit-0.6.0/configure.ac
-===================================================================
---- PackageKit-0.6.0.orig/configure.ac	2010-01-04 16:32:18.000000000 +0000
-+++ PackageKit-0.6.0/configure.ac	2010-01-29 11:33:48.000000000 +0000
-@@ -90,7 +90,7 @@
- 							enable_strict=$default_strict)
- if test x$enable_strict != xno; then
- 	if test "$GCC" = "yes"; then
--		WARNINGFLAGS_CPP="$WARNINGFLAGS_CPP -Werror"
-+		:
- 	fi
- fi
- 
diff --git a/meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/opkgfixes.patch b/meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/opkgfixes.patch
deleted file mode 100644
index 5a73a19..0000000
--- a/meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/opkgfixes.patch
+++ /dev/null
@@ -1,422 +0,0 @@
-Index: PackageKit-0.6.0/backends/opkg/pk-backend-opkg.c
-===================================================================
---- PackageKit-0.6.0.orig/backends/opkg/pk-backend-opkg.c	2010-01-29 09:39:33.000000000 +0000
-+++ PackageKit-0.6.0/backends/opkg/pk-backend-opkg.c	2010-01-29 11:30:51.000000000 +0000
-@@ -29,8 +29,7 @@
- 
-+#include <stdio.h>
- #include <libopkg/opkg.h>
- 
--static opkg_t *opkg;
--
- enum {
- 	SEARCH_NAME,
- 	SEARCH_DESCRIPTION,
-@@ -62,7 +60,7 @@
-  * check an opkg package for known GUI dependancies
-  */
- static gboolean
--opkg_is_gui_pkg (opkg_package_t *pkg)
-+opkg_is_gui_pkg (pkg_t *pkg)
- {
- 
-   /* TODO: check appropriate tag */
-@@ -84,7 +82,7 @@
-  * check an opkg package to determine if it is a development package
-  */
- static gboolean
--opkg_is_devel_pkg (opkg_package_t *pkg)
-+opkg_is_devel_pkg (pkg_t *pkg)
- {
-   if (g_strrstr (pkg->name, "-dev"))
-       return TRUE;
-@@ -105,7 +103,7 @@
-  * returns true if the tag is present
-  */
- static gboolean 
--opkg_check_tag (opkg_package_t *pkg, const gchar *tag)
-+opkg_check_tag (pkg_t *pkg, const gchar *tag)
- {
- 	if (pkg->tags && tag)
- 		return (g_strrstr (pkg->tags, tag) != NULL);
-@@ -118,7 +116,7 @@
- {
- 	switch (err)
- 	{
--	case OPKG_NO_ERROR:
-+/*	case OPKG_NO_ERROR:
- 		break;
- 	case OPKG_PACKAGE_NOT_INSTALLED:
- 		pk_backend_error_code (backend, PK_ERROR_ENUM_PACKAGE_NOT_INSTALLED, NULL);
-@@ -140,7 +138,7 @@
- 		break;
- 	case OPKG_PACKAGE_NOT_AVAILABLE:
- 		pk_backend_error_code (backend, PK_ERROR_ENUM_PACKAGE_NOT_FOUND, NULL);
--		break;
-+		break;*/
- 	default:
- 		opkg_unknown_error (backend, err, "Update package");
- 	}
-@@ -152,7 +150,7 @@
- static void
- backend_initialize (PkBackend *backend)
- {
--	opkg = opkg_new ();
-+	int opkg = opkg_new ();
- 
- 	if (!opkg) {
- 		pk_backend_error_code (backend,
-@@ -162,8 +160,8 @@
- 	}
- 
- #ifdef OPKG_OFFLINE_ROOT
--	opkg_set_option (opkg, (char *) "offline_root", OPKG_OFFLINE_ROOT);
--	opkg_re_read_config_files (opkg);
-+	opkg_set_option ((char *) "offline_root", OPKG_OFFLINE_ROOT);
-+	opkg_re_read_config_files ();
- #endif
- 
- }
-@@ -174,22 +172,22 @@
- static void
- backend_destroy (PkBackend *backend)
- {
--	opkg_free (opkg);
-+	opkg_free ();
- }
- 
- 
- static void
--pk_opkg_progress_cb (opkg_t *_opkg, const opkg_progress_data_t *pdata, void *data)
-+pk_opkg_progress_cb (const opkg_progress_data_t *pdata, void *data)
- {
--	PkBackend *backend = PK_BACKEND (data);
-+	PkBackend *backend = (PkBackend*) data;
- 	if (!backend)
- 		return;
- 
- 	pk_backend_set_percentage (backend, pdata->percentage);
--	if (pdata->package)
-+	if (pdata->pkg)
- 	{
- 		gchar *uid;
--		opkg_package_t *pkg = pdata->package;
-+		pkg_t *pkg = pdata->pkg;
- 		gint status = PK_INFO_ENUM_UNKNOWN;
- 
- 		uid = g_strdup_printf ("%s;%s;%s;",
-@@ -225,12 +223,12 @@
- {
- 	int ret;
- 
--	ret = opkg_update_package_lists (opkg, pk_opkg_progress_cb, backend);
-+	ret = opkg_update_package_lists (pk_opkg_progress_cb, backend);
- 
- 	if (ret) {
--		if (ret == OPKG_DOWNLOAD_FAILED)
--			pk_backend_error_code (backend, PK_ERROR_ENUM_REPO_NOT_AVAILABLE, NULL);
--		else
-+//		if (ret == OPKG_DOWNLOAD_FAILED)
-+//			pk_backend_error_code (backend, PK_ERROR_ENUM_REPO_NOT_AVAILABLE, NULL);
-+//		else
- 			opkg_unknown_error (backend, ret, "Refreshing cache");
- 	}
- 	pk_backend_finished (backend);
-@@ -256,7 +254,7 @@
-  */
- 
- static void
--pk_opkg_package_list_cb (opkg_t *_opkg, opkg_package_t *pkg, void *data)
-+pk_opkg_package_list_cb (pkg_t *pkg, void *data)
- {
- 	SearchParams *params = (SearchParams*) data;
- 	gchar *uid;
-@@ -298,7 +296,7 @@
- 	uid = g_strdup_printf ("%s;%s;%s;",
- 		pkg->name, pkg->version, pkg->architecture);
- 
--	if (pkg->installed)
-+	if (pkg->state_status == SS_INSTALLED)
- 		status = PK_INFO_ENUM_INSTALLED;
- 	else
- 		status = PK_INFO_ENUM_AVAILABLE;
-@@ -318,10 +316,10 @@
-                 opkg_is_gui_pkg (pkg))
- 		goto end_handle;
- 	if (pk_bitfield_contain(filters, PK_FILTER_ENUM_INSTALLED) && 
--                (!pkg->installed))
-+                (pkg->state_status != SS_INSTALLED))
- 		goto end_handle;
- 	if (pk_bitfield_contain(filters, PK_FILTER_ENUM_NOT_INSTALLED) && 
--                (pkg->installed))
-+                (pkg->state_status == SS_INSTALLED))
- 		goto end_handle;
- 
- 	pk_backend_package (params->backend, status, uid, pkg->description);
-@@ -338,7 +336,7 @@
- 
- 	params = pk_backend_get_pointer (backend, "search-params");
- 
--	opkg_list_packages (opkg, pk_opkg_package_list_cb, params);
-+	opkg_list_packages (pk_opkg_package_list_cb, params);
- 
- 	pk_backend_finished (params->backend);
- 
-@@ -349,7 +347,7 @@
- }
- 
- static void
--backend_search_name (PkBackend *backend, PkBitfield filters, const gchar *search)
-+backend_search_name (PkBackend *backend, PkBitfield filters, gchar **search)
- {
- 	SearchParams *params;
- 
-@@ -360,7 +358,7 @@
- 	params = g_new0 (SearchParams, 1);
- 	params->filters = filters;
- 	params->search_type = SEARCH_NAME;
--	params->needle = g_utf8_strdown (search, -1);
-+	params->needle = g_utf8_strdown (search[0], -1);
- 	params->backend = backend;
- 
- 	pk_backend_set_pointer (backend, "search-params", params);
-@@ -371,7 +369,7 @@
-  * backend_search_description:
-  */
- static void
--backend_search_description (PkBackend *backend, PkBitfield filters, const gchar *search)
-+backend_search_description (PkBackend *backend, PkBitfield filters, gchar **search)
- {
- 	SearchParams *params;
- 
-@@ -382,7 +380,7 @@
- 	params = g_new0 (SearchParams, 1);
- 	params->filters = filters;
- 	params->search_type = SEARCH_DESCRIPTION;
--	params->needle = g_utf8_strdown (search, -1);
-+	params->needle = g_utf8_strdown (search[0], -1);
- 	params->backend = backend;
- 
- 	pk_backend_set_pointer (backend, "search-params", params);
-@@ -390,7 +388,7 @@
- }
- 
- static void
--backend_search_group (PkBackend *backend, PkBitfield filters, const gchar *search)
-+backend_search_group (PkBackend *backend, PkBitfield filters, gchar **search)
- {
- 	SearchParams *params;
- 
-@@ -401,7 +399,7 @@
- 	params = g_new0 (SearchParams, 1);
- 	params->filters = filters;
- 	params->search_type = SEARCH_TAG;
--	params->needle = g_strdup_printf ("group::%s", search);
-+	params->needle = g_strdup_printf ("group::%s", search[0]);
- 	params->backend = backend;
- 
- 	pk_backend_set_pointer (backend, "search-params", params);
-@@ -412,9 +410,9 @@
- static gboolean
- backend_install_packages_thread (PkBackend *backend)
- {
--	PkPackageId *pi;
- 	gint err, i;
- 	gchar **package_ids;
-+	gchar **parts;
- 
- 	package_ids = pk_backend_get_strv (backend, "pkids");
- 
-@@ -424,13 +422,13 @@
- 	{
- 		pk_backend_package (backend, PK_INFO_ENUM_INSTALLING, package_ids[i], NULL);
- 
--		pi = pk_package_id_new_from_string (package_ids[i]);
-+		parts = pk_package_id_split (package_ids[i]);
- 
--		err = opkg_install_package (opkg, pi->name, pk_opkg_progress_cb, backend);
-+		err = opkg_install_package (parts[PK_PACKAGE_ID_NAME], pk_opkg_progress_cb, backend);
- 		if (err)
- 			handle_install_error (backend, err);
- 
--		pk_package_id_free (pi);
-+		g_strfreev (parts);
- 		if (err != 0)
- 			break;
- 	}
-@@ -453,9 +451,9 @@
- static gboolean
- backend_remove_packages_thread (PkBackend *backend)
- {
--	PkPackageId *pi;
- 	gint err, i;
- 	gchar **package_ids;
-+	gchar **parts;
- 	gboolean allow_deps;
- 	gboolean autoremove;
- 	gpointer *data;
-@@ -467,29 +465,30 @@
- 	autoremove = GPOINTER_TO_INT (data[2]);
- 	g_free (data);
- 
--	opkg_set_option (opkg, (char *)"autoremove", &autoremove);
--	opkg_set_option (opkg, (char *)"force_removal_of_dependent_packages", &allow_deps);
-+	opkg_set_option ((char *)"autoremove", &autoremove);
-+	opkg_set_option ((char *)"force_removal_of_dependent_packages", &allow_deps);
- 
- 	err = 0;
- 
- 	for (i = 0; package_ids[i]; i++)
- 	{
--		pi = pk_package_id_new_from_string (package_ids[i]);
- 		pk_backend_package (backend, PK_INFO_ENUM_REMOVING, package_ids[i], NULL);
- 
--		err = opkg_remove_package (opkg, pi->name, pk_opkg_progress_cb, backend);
-+		parts = pk_package_id_split (package_ids[i]);
-+
-+		err = opkg_remove_package (parts[PK_PACKAGE_ID_NAME], pk_opkg_progress_cb, backend);
- 
- 		switch (err)
- 		{
--		case OPKG_NO_ERROR:
--			break;
--		case OPKG_PACKAGE_NOT_INSTALLED:
--			pk_backend_error_code (backend, PK_ERROR_ENUM_PACKAGE_NOT_INSTALLED, NULL);
--			break;
-+		//case OPKG_NO_ERROR:
-+		//	break;
-+		//case OPKG_PACKAGE_NOT_INSTALLED:
-+		//	pk_backend_error_code (backend, PK_ERROR_ENUM_PACKAGE_NOT_INSTALLED, NULL);
-+		//	break;
- 		default:
- 			opkg_unknown_error (backend, err, "Remove");
- 		}
--		pk_package_id_free (pi);
-+		g_strfreev (parts);
- 
- 		if (err != 0)
- 			break;
-@@ -540,7 +539,7 @@
- 	gint err;
- 
- 	/* FIXME: support only_trusted */
--	err = opkg_upgrade_all (opkg, pk_opkg_progress_cb, backend);
-+	err = opkg_upgrade_all (pk_opkg_progress_cb, backend);
- 
- 	if (err)
- 		opkg_unknown_error (backend, err, "Upgrading system");
-@@ -564,29 +563,28 @@
- static gboolean
- backend_update_package_thread (PkBackend *backend)
- {
--	PkPackageId *pi;
-+        gchar **parts;
- 	gint err = 0;
- 	const gchar *package_id;
- 
- 	/* FIXME: support only_trusted */
- 	package_id = pk_backend_get_string (backend, "pkgid");
--	pi = pk_package_id_new_from_string (package_id);
-+	parts = pk_package_id_split (package_id);
- 
--	if (!pi->name || !pi->version)
-+	if (!parts)
- 	{
- 		pk_backend_error_code (backend, PK_ERROR_ENUM_PACKAGE_NOT_FOUND,
- 				"Package not found");
--		pk_package_id_free (pi);
- 		pk_backend_finished (backend);
- 		return FALSE;
- 	}
- 
--	err = opkg_upgrade_package (opkg, pi->name, pk_opkg_progress_cb, backend);
-+	err = opkg_upgrade_package (parts[PK_PACKAGE_ID_NAME], pk_opkg_progress_cb, backend);
- 	if (err)
- 		handle_install_error (backend, err);
- 
- 
--	pk_package_id_free (pi);
-+	g_strfreev (parts);
- 	pk_backend_finished (backend);
- 	return (err != 0);
- }
-@@ -610,13 +608,13 @@
-  */
- 
- static void
--pk_opkg_list_upgradable_cb (opkg_t *_opkg, opkg_package_t *pkg, void *data)
-+pk_opkg_list_upgradable_cb (pkg_t *pkg, void *data)
- {
--	PkBackend *backend = PK_BACKEND (data);
-+	PkBackend *backend = (PkBackend*) data;
- 	gchar *uid;
- 	gint status;
- 
--	if (pkg->installed)
-+	if (pkg->state_status == SS_INSTALLED)
- 		status = PK_INFO_ENUM_INSTALLED;
- 	else
- 		status = PK_INFO_ENUM_AVAILABLE;
-@@ -631,7 +629,7 @@
- static gboolean
- backend_get_updates_thread (PkBackend *backend)
- {
--	opkg_list_upgradable_packages (opkg, pk_opkg_list_upgradable_cb, backend);
-+	opkg_list_upgradable_packages (pk_opkg_list_upgradable_cb, backend);
- 	pk_backend_finished (backend);
- 	return TRUE;
- }
-@@ -668,16 +666,18 @@
- static gboolean
- backend_get_details_thread (PkBackend *backend)
- {
--	PkPackageId *pi;
- 	gchar **package_ids;
-+        gchar **parts;
- 	int group_index;
- 	PkGroupEnum group = 0;
--	opkg_package_t *pkg;
-+	pkg_t *pkg;
- 	gchar *newid;
- 
-         package_ids = pk_backend_get_strv(backend, "package_ids");
--	pi = pk_package_id_new_from_string (package_ids[0]);
--	if (pi == NULL)
-+	parts = pk_package_id_split (package_ids[0]);
-+
-+
-+	if (!parts)
- 	{
- 		pk_backend_error_code (backend, PK_ERROR_ENUM_PACKAGE_ID_INVALID, "invalid package id");
- 		pk_backend_finished (backend);
-@@ -685,8 +685,8 @@
- 	}
- 
- 
--	pkg = opkg_find_package (opkg, pi->name, pi->version, pi->arch, pi->data);
--	pk_package_id_free (pi);
-+	pkg = opkg_find_package (parts[PK_PACKAGE_ID_NAME], parts[PK_PACKAGE_ID_VERSION], parts[PK_PACKAGE_ID_ARCH], parts[PK_PACKAGE_ID_DATA]);
-+	g_strfreev (parts);
- 
- 	if (!pkg)
- 	{
-@@ -695,7 +695,7 @@
- 		return FALSE;
- 	}
- 
--	newid = g_strdup_printf ("%s;%s;%s;%s", pkg->name, pkg->version, pkg->architecture, pkg->repository);
-+	newid = g_strdup_printf ("%s;%s;%s;%s", pkg->name, pkg->version, pkg->architecture, pkg->src->name);
- 
- 	if (pkg->tags) {
- 		for (group_index = 0; group < PK_GROUP_ENUM_LAST; group_index++) {
-@@ -706,9 +706,8 @@
- 		}
- 	}
- 
--	pk_backend_details (backend, newid, NULL, group, pkg->description, pkg->url, pkg->size);
-+	pk_backend_details (backend, newid, NULL, group, pkg->description, NULL, pkg->size);
- 	g_free (newid);
--	opkg_package_free(pkg);
- 	pk_backend_finished (backend);
- 	return TRUE;
- }
diff --git a/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb b/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
deleted file mode 100644
index 7d9c2bf..0000000
--- a/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
+++ /dev/null
@@ -1,62 +0,0 @@
-DESCRIPTION = "PackageKit package management abstraction"
-SECTION = "libs"
-LICENSE = "GPL-2.0+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "gtk+ python polkit dbus dbus-glib glib-2.0 sqlite3 opkg intltool intltool-native"
-RDEPENDS_${PN} = "opkg"
-
-inherit gnome pythonnative
-
-SRC_URI = "http://www.packagekit.org/releases/PackageKit-${PV}.tar.gz;name=archive \
-           file://configurefix.patch \
-           file://opkgfixes.patch \
-           file://0001-Don-t-call-deprecated-glib-functions-and-use-the-new.patch \
-          "
-
-SRC_URI[archive.md5sum] = "6c8d9c48e21b82abeea15c3fd5066242"
-SRC_URI[archive.sha256sum] = "0eafd1be5516a41ebc0f0c3acff0b0763da105a4178b5eee0ff16d66ccd04408"
-
-S = "${WORKDIR}/PackageKit-${PV}"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[service-packs] = "--enable-service-packs,--disable-service-packs,libarchive"
-
-EXTRA_OECONF = "--with-security-framework=dummy \
-                --with-default-backend=opkg \
-                --enable-opkg \
-                --disable-tests \
-                --disable-ruck \
-                --disable-qt \
-                --disable-gstreamer-plugin \
-                --disable-local  \
-                --disable-networkmanager \
-                ac_cv_path_XMLTO=no \
-"
-
-#do_configure_prepend() {
-#    mkdir -p m4
-#    echo "EXTRA_DIST=" > gtk-doc.make
-#}
-
-do_configure_append() {
-    for i in $(find . -name Makefile) ; do
-        sed -i -e s:${STAGING_DIR_NATIVE}::g \
-               -e s:${bindir}/mkdir:${STAGING_BINDIR_NATIVE}/mkdir:g \
-               -e s:/usr/bin/intltool-merge:${STAGING_BINDIR_NATIVE}/intltool-merge:g \
-               $i
-    done
-}
-
-PACKAGES =+ "${PN}-website"
-FILES_${PN}-website = "${datadir}/PackageKit/website"
-
-PACKAGES =+ "${PN}-python"
-FILES_${PN}-python = "${libdir}/python*"
-
-PACKAGES =+ "${PN}-gtkmodule"
-FILES_${PN}-gtkmodule = "${libdir}/gtk-2.0/*/*.so"
-
-FILES_${PN} += "${libdir}/packagekit-backend/*.so ${libdir}/pm-utils ${datadir}/dbus-1/system-services/ ${datadir}/PolicyKit ${datadir}/PackageKit"
-FILES_${PN}-dbg += "${libdir}/packagekit-backend/.debug/*.so ${libdir}/gtk-2.0/*/.debug"
-FILES_${PN}-dev += "${libdir}/packagekit-backend/*.la ${libdir}/gtk-2.0/*/*.la"
-FILES_${PN}-staticdev += "${libdir}/packagekit-backend/*.a ${libdir}/gtk-2.0/*/*.a"
diff --git a/meta-oe/recipes-devtools/packagekit/packagekit_0.8.13.bb b/meta-oe/recipes-devtools/packagekit/packagekit_0.8.13.bb
new file mode 100644
index 0000000..d59b76a
--- /dev/null
+++ b/meta-oe/recipes-devtools/packagekit/packagekit_0.8.13.bb
@@ -0,0 +1,64 @@
+DESCRIPTION = "PackageKit package management abstraction"
+SECTION = "libs"
+LICENSE = "GPL-2.0+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+DEPENDS = "python polkit dbus dbus-glib glib-2.0 sqlite3 intltool intltool-native apt python-smartpm opkg"
+
+inherit autotools gtk-doc pkgconfig pythonnative
+
+PACKAGES =+ "${PN}-python ${PN}-backend-smart ${PN}-backend-opkg ${PN}-backend-apt"
+PACKAGES_DYNAMIC += "^packagekit-plugin.* ^packagekit-backend.*"
+
+SRC_URI = "http://www.packagekit.org/releases/PackageKit-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "c8f7207cca4fcdb3d62d012b67c2f319"
+SRC_URI[sha256sum] = "110da1afcbfb9d56da18ece3161e8554f77bc3f90793332406ca54129ec43c76"
+
+S = "${WORKDIR}/PackageKit-${PV}"
+
+EXTRA_OECONF = " \
+  --with-security-framework=dummy \
+  --enable-apt \
+  --enable-opkg \
+  --enable-smart \
+  --disable-tests \
+  --disable-cron \
+  --disable-connman \
+  --disable-strict \
+  --disable-systemd \
+  --disable-systemd-updates \
+  --disable-bash-completion \
+  --disable-gstreamer-plugin \
+  --disable-local  \
+  --disable-networkmanager \
+  --disable-gtk-module \
+  --disable-browser-plugin \
+  --disable-python3 \
+  ac_cv_path_XMLTO=no \
+"
+
+FILES_${PN}-python = "${libdir}/python*"
+RDEPENDS_${PN}-python = "python"
+
+FILES_${PN} += " \
+  ${datadir}/dbus-1 \
+  ${datadir}/PackageKit \
+  ${datadir}/mime \
+"
+FILES_${PN}-dbg += "${libdir}/packagekit-backend/.debug/*.so ${libdir}/packagekit-plugins/.debug/*.so"
+FILES_${PN}-dev += "${libdir}/packagekit-backend/*.la ${libdir}/packagekit-plugins/*.la"
+FILES_${PN}-staticdev += "${libdir}/packagekit-backend/*.a ${libdir}/packagekit-plugins/*.a"
+
+FILES_${PN}-backend-smart += "${datadir}/PackageKit/helpers/smart"
+RDEPENDS_${PN}-backend-smart += "${PN} ${PN}-python smartpm"
+
+RDEPENDS_${PN}-backend-apt += "${PN} apt"
+RDEPENDS_${PN}-backend-opkg += "${PN} opkg"
+
+python populate_packages_prepend() {
+    backenddir = d.expand('${libdir}/packagekit-backend/')
+    do_split_packages(d, backenddir, '^libpk_backend_(.*)\.so$', 'packagekit-backend-%s', 'PackageKit backend for %s', extra_depends='', prepend=True)
+    plugindir = d.expand('${libdir}/packagekit-plugins/')
+    do_split_packages(d, plugindir, '^libpk_plugin[_\-](.*)\.so$', 'packagekit-plugin-%s', 'PackageKit plugin for %s', extra_depends='', prepend=True)
+}
-- 
1.8.3.1


