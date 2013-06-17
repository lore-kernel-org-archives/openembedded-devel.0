Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id 57CE46098F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 05:30:24 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id rp16so2392995pbb.14
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Jun 2013 22:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=DDW7yMajeaiZRrPqaJt/2Ws7eSuMGLr6LOTWjzGWcsE=;
	b=s5f0iED81wrIgp6uOkRGad1EuorVHJS3g+77Qea5KouD4erVWuQdamS1Tmmdicw4KV
	bmoewnuFhcn/TUiFcFjB+mthPwvt4S6t3WyZ+GxoxcHKa+u1+6CWHUXroQq4IJ8l+wQG
	Wl2SKFDvid7Tt6sQr9EHUXMHf0BIgO0xxz0CF2wttsCuuA3w0GgDubEyiIaO0nbbCCGI
	9lLFASZA4U4JUHLDYHdD1WGlvsOPuvmmw4TTEQHeGOyePVfkhLZtfUNcjo8FZfq/xPs7
	GyFJisTGn1MH+1/+LWsCXxlVqbbw+/yLurBwbisncHx4P32iM9RV88V2RTHT+h6MxaBJ
	KtKQ==
X-Received: by 10.67.5.168 with SMTP id cn8mr11680840pad.119.1371447025198;
	Sun, 16 Jun 2013 22:30:25 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id jb2sm12412068pbc.8.2013.06.16.22.30.24
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 16 Jun 2013 22:30:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Jun 2013 22:30:16 -0700
Message-Id: <1371447016-9073-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH V2] packagekit: Fix build with new glib-2.0
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
X-List-Received-Date: Mon, 17 Jun 2013 05:30:24 -0000

Fixes errors like

| pk-main.c:223: error: undefined reference to 'g_thread_supported'
| collect2: error: ld returned 1 exit status
| make[3]: *** [packagekitd] Error 1

This version is dead upstream so this patch is local

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...deprecated-glib-functions-and-use-the-new.patch |  166 ++++++++++++++++++++
 .../packagekit/packagekit_0.5.6.bb                 |    4 +-
 2 files changed, 169 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/0001-Don-t-call-deprecated-glib-functions-and-use-the-new.patch

diff --git a/meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/0001-Don-t-call-deprecated-glib-functions-and-use-the-new.patch b/meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/0001-Don-t-call-deprecated-glib-functions-and-use-the-new.patch
new file mode 100644
index 0000000..ecf8e74
--- /dev/null
+++ b/meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/0001-Don-t-call-deprecated-glib-functions-and-use-the-new.patch
@@ -0,0 +1,166 @@
+From 869e52a9055c72970fed036a1510f676e6ce0824 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Jun 2013 01:24:19 -0700
+Subject: [PATCH] Don't call deprecated glib functions and use the new gthread
+ API.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Inappropriate[version Unmaintained Upstream]
+---
+ client/pk-console.c                              |    3 ++-
+ client/pk-generate-pack.c                        |    3 ++-
+ client/pk-monitor.c                              |    3 ++-
+ contrib/command-not-found/PackageKit.sh          |    2 +-
+ contrib/command-not-found/pk-command-not-found.c |    4 ++--
+ contrib/debuginfo-install/pk-debuginfo-install.c |    4 ++--
+ src/pk-backend.c                                 |    7 +++++++
+ src/pk-main.c                                    |    4 ++--
+ 10 files changed, 20 insertions(+), 10 deletions(-)
+
+diff --git a/client/pk-console.c b/client/pk-console.c
+index de927e1..2435f27 100644
+--- a/client/pk-console.c
++++ b/client/pk-console.c
+@@ -1264,11 +1264,12 @@ main (int argc, char *argv[])
+ 	bindtextdomain (GETTEXT_PACKAGE, PACKAGE_LOCALE_DIR);
+ 	bind_textdomain_codeset (GETTEXT_PACKAGE, "UTF-8");
+ 	textdomain (GETTEXT_PACKAGE);
+-
++#if !GLIB_CHECK_VERSION(2,32,0)
+ 	if (! g_thread_supported ())
+ 		g_thread_init (NULL);
+ 	g_type_init ();
+ 	dbus_g_thread_init ();
++#endif
+ 
+ 	/* do stuff on ctrl-c */
+ 	signal (SIGINT, pk_console_sigint_cb);
+diff --git a/client/pk-generate-pack.c b/client/pk-generate-pack.c
+index 0b2b40f..20d7e8d 100644
+--- a/client/pk-generate-pack.c
++++ b/client/pk-generate-pack.c
+@@ -251,12 +251,13 @@ main (int argc, char *argv[])
+ 	bindtextdomain (GETTEXT_PACKAGE, PACKAGE_LOCALE_DIR);
+ 	bind_textdomain_codeset (GETTEXT_PACKAGE, "UTF-8");
+ 	textdomain (GETTEXT_PACKAGE);
+-
++#if !GLIB_CHECK_VERSION(2,32,0)
+ 	if (! g_thread_supported ())
+ 		g_thread_init (NULL);
+ 
+ 	g_type_init ();
+ 	dbus_g_thread_init ();
++#endif
+ 
+ 	/* do stuff on ctrl-c */
+ 	signal (SIGINT, pk_generate_pack_sigint_cb);
+diff --git a/client/pk-monitor.c b/client/pk-monitor.c
+index f230f7a..d43007f 100644
+--- a/client/pk-monitor.c
++++ b/client/pk-monitor.c
+@@ -285,11 +285,12 @@ main (int argc, char *argv[])
+ 	bindtextdomain (GETTEXT_PACKAGE, PACKAGE_LOCALE_DIR);
+ 	bind_textdomain_codeset (GETTEXT_PACKAGE, "UTF-8");
+ 	textdomain (GETTEXT_PACKAGE);
+-
++#if !GLIB_CHECK_VERSION(2,32,0)
+ 	if (! g_thread_supported ())
+ 		g_thread_init (NULL);
+ 	g_type_init ();
+ 	dbus_g_thread_init ();
++#endif
+ 
+ 	context = g_option_context_new (NULL);
+ 	/* TRANSLATORS: this is a program that monitors PackageKit */
+diff --git a/contrib/command-not-found/PackageKit.sh b/contrib/command-not-found/PackageKit.sh
+index d08989c..d708fff 100644
+--- a/contrib/command-not-found/PackageKit.sh
++++ b/contrib/command-not-found/PackageKit.sh
+@@ -18,7 +18,7 @@ command_not_found_handle () {
+ 
+ 	# run the command, or just print a warning
+ 	if [ $runcnf -eq 1 ]; then
+-		/home/hughsie/.root/libexec/pk-command-not-found $1
++		/usr/lib/packagekit/pk-command-not-found $1
+ 		retval=$?
+ 	else
+ 		echo "bash: $1: command not found"
+diff --git a/contrib/command-not-found/pk-command-not-found.c b/contrib/command-not-found/pk-command-not-found.c
+index 70679c0..9f81ce4 100644
+--- a/contrib/command-not-found/pk-command-not-found.c
++++ b/contrib/command-not-found/pk-command-not-found.c
+@@ -659,12 +659,12 @@ main (int argc, char *argv[])
+ 	bindtextdomain (GETTEXT_PACKAGE, PACKAGE_LOCALE_DIR);
+ 	bind_textdomain_codeset (GETTEXT_PACKAGE, "UTF-8");
+ 	textdomain (GETTEXT_PACKAGE);
+-
++#if !GLIB_CHECK_VERSION(2,32,0)
+ 	if (! g_thread_supported ())
+ 		g_thread_init (NULL);
+ 	dbus_g_thread_init ();
+ 	g_type_init ();
+-
++#endif
+ 	context = g_option_context_new (NULL);
+ 	/* TRANSLATORS: tool that gets called when the command is not found */
+ 	g_option_context_set_summary (context, _("PackageKit Command Not Found"));
+diff --git a/contrib/debuginfo-install/pk-debuginfo-install.c b/contrib/debuginfo-install/pk-debuginfo-install.c
+index c12aca5..b0e1e7c 100644
+--- a/contrib/debuginfo-install/pk-debuginfo-install.c
++++ b/contrib/debuginfo-install/pk-debuginfo-install.c
+@@ -532,11 +532,11 @@ main (int argc, char *argv[])
+ 	bindtextdomain (GETTEXT_PACKAGE, PACKAGE_LOCALE_DIR);
+ 	bind_textdomain_codeset (GETTEXT_PACKAGE, "UTF-8");
+ 	textdomain (GETTEXT_PACKAGE);
+-
++#if !GLIB_CHECK_VERSION(2,32,0)
+ 	if (! g_thread_supported ())
+ 		g_thread_init (NULL);
+ 	g_type_init ();
+-
++#endif
+ 	context = g_option_context_new (NULL);
+ 	/* TRANSLATORS: tool that gets called when the command is not found */
+ 	g_option_context_set_summary (context, _("PackageKit Debuginfo Installer"));
+diff --git a/src/pk-backend.c b/src/pk-backend.c
+index 5216b63..5b83ae4 100644
+--- a/src/pk-backend.c
++++ b/src/pk-backend.c
+@@ -2103,7 +2103,14 @@ pk_backend_thread_create (PkBackend *backend, PkBackendThreadFunc func)
+ 		egg_warning ("already has thread");
+ 		return FALSE;
+ 	}
++#if !GLIB_CHECK_VERSION(2,32,0)
+ 	backend->priv->thread = g_thread_create ((GThreadFunc) func, backend, FALSE, NULL);
++#else
++	backend->priv->thread = g_thread_try_new ("daemon thread", (GThreadFunc) func, backend, NULL);
++	if (backend->priv->thread != NULL) {
++		g_thread_unref(backend->priv->thread);
++	}
++#endif
+ 	if (backend->priv->thread == NULL) {
+ 		egg_warning ("failed to create thread");
+ 		return FALSE;
+diff --git a/src/pk-main.c b/src/pk-main.c
+index 4c758cd..8fa2482 100644
+--- a/src/pk-main.c
++++ b/src/pk-main.c
+@@ -219,12 +219,12 @@ main (int argc, char *argv[])
+ 	bindtextdomain (GETTEXT_PACKAGE, PACKAGE_LOCALE_DIR);
+ 	bind_textdomain_codeset (GETTEXT_PACKAGE, "UTF-8");
+ 	textdomain (GETTEXT_PACKAGE);
+-
++#if !GLIB_CHECK_VERSION(2,32,0)
+ 	if (! g_thread_supported ())
+ 		g_thread_init (NULL);
+ 	dbus_g_thread_init ();
+ 	g_type_init ();
+-
++#endif
+ 	/* TRANSLATORS: describing the service that is running */
+ 	context = g_option_context_new (_("PackageKit service"));
+ 	g_option_context_add_main_entries (context, options, NULL);
+-- 
+1.7.9.5
+
diff --git a/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb b/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
index 28627c1..c8de9d8 100644
--- a/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
+++ b/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
@@ -9,7 +9,9 @@ inherit gnome pythonnative
 
 SRC_URI = "http://www.packagekit.org/releases/PackageKit-${PV}.tar.gz;name=archive \
            file://configurefix.patch \
-           file://opkgfixes.patch"
+           file://opkgfixes.patch \
+           file://0001-Don-t-call-deprecated-glib-functions-and-use-the-new.patch \
+          "
 
 SRC_URI[archive.md5sum] = "6c8d9c48e21b82abeea15c3fd5066242"
 SRC_URI[archive.sha256sum] = "0eafd1be5516a41ebc0f0c3acff0b0763da105a4178b5eee0ff16d66ccd04408"
-- 
1.7.9.5


