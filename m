Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id EADDF61105
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jan 2014 12:20:01 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id m10so5878224eaj.40
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jan 2014 04:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qFDB1z0EV8i8ep3UrmREZtEafbQ0y3w2qS0uJCZlVYI=;
	b=DxHq85uj9AIB0RW7ud+Y1dthaP8D/T1LSi3wAIdma51OG1mu0C11+cqo3SW6Tx0iJ3
	E5CZ/DdAgNUShGTDKc4IeNlBdQIwFwqNOJrYgn6sx3B05rijFuEEmkQiI3hZcS2pjQJ0
	Sy69Xgzb3/CzS4q0GtQgufYyMUHb64gbaOCZMgVumbebxM/vqFyVIh+bE/2u4eOFMNZ4
	BCG412kG3sex9KGbTJ37qNYRKSbYtsOVLJQxRAX9+D1ZPa1SEt/f0z4RXWEDylftMIHb
	Trcxe6Ivy9JZ4lajcU911WeoeGYTWGVrKDt6phrR53gHLTaVPOVEEWg1kDnJ1gBUqQDh
	m4wQ==
X-Received: by 10.15.64.4 with SMTP id n4mr10765389eex.99.1388578801650;
	Wed, 01 Jan 2014 04:20:01 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id v1sm126630574eef.9.2014.01.01.04.20.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jan 2014 04:20:00 -0800 (PST)
Date: Wed, 1 Jan 2014 13:20:02 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140101122002.GB11840@jama>
References: <1387232705-18081-1-git-send-email-eu@felipetonello.com>
MIME-Version: 1.0
In-Reply-To: <1387232705-18081-1-git-send-email-eu@felipetonello.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [PATCH v2] packagekit: Updated to 0.8.13
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
X-List-Received-Date: Wed, 01 Jan 2014 12:20:04 -0000
X-Groupsio-MsgNum: 47547
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1LKvkjL3sHcu1TtY"
Content-Disposition: inline

--1LKvkjL3sHcu1TtY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2013 at 02:25:05PM -0800, Felipe F. Tonello wrote:
> From: "Felipe F. Tonello" <eu@felipetonello.com>
>=20
> Packagekit will compile support for all backend supported by OE-core. Ima=
ges
> that want to install packagekit should specify its correct backend depend=
ency
> as well.
>=20
> Ex.: install the following packages to an image that uses rpm:
>  * packagekit
>  * packagekit-backend-smart

Hello,

Fails to build in world:
http://jenkins.nas-admin.org/job/oe_shr-image-all_tmpfs_qemuarm/173/console=
Full

| checking for python platform... linux2
| checking for python script directory... Traceback (most recent call last):
|   File "<string>", line 22, in <module>
|   File "/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x=
86_64-linux/usr/lib/python2.7/distutils/sysconfig.py", line 22, in <module>
|     PREFIX =3D os.path.normpath(sys.prefix).replace( os.getenv("BUILD_SYS=
"), os.getenv("HOST_SYS") )
| TypeError: expected a character buffer object
| ${libdir}/python2.7/site-packages
| checking for python extension module directory... Traceback (most recent =
call last):
|   File "<string>", line 22, in <module>
|   File "/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x=
86_64-linux/usr/lib/python2.7/distutils/sysconfig.py", line 22, in <module>
|     PREFIX =3D os.path.normpath(sys.prefix).replace( os.getenv("BUILD_SYS=
"), os.getenv("HOST_SYS") )
| TypeError: expected a character buffer object
| ${libdir}/python2.7/site-packages
| checking whether C compiler accepts -fPIE... yes

=2E..

| checking for python module apt_pkg... no
| configure: error: Apt backend needs python-apt
| Configure failed. The contents of all config.log files follows to aid deb=
ugging


>=20
> Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
> ---
>  ...deprecated-glib-functions-and-use-the-new.patch | 166 --------
>  .../packagekit/packagekit-0.5.6/configurefix.patch |  13 -
>  .../packagekit/packagekit-0.5.6/opkgfixes.patch    | 422 ---------------=
------
>  .../packagekit/packagekit_0.5.6.bb                 |  62 ---
>  .../packagekit/packagekit_0.8.13.bb                |  64 ++++
>  5 files changed, 64 insertions(+), 663 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/=
0001-Don-t-call-deprecated-glib-functions-and-use-the-new.patch
>  delete mode 100644 meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/=
configurefix.patch
>  delete mode 100644 meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/=
opkgfixes.patch
>  delete mode 100644 meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.=
bb
>  create mode 100644 meta-oe/recipes-devtools/packagekit/packagekit_0.8.13=
=2Ebb
>=20
> diff --git a/meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/0001-Do=
n-t-call-deprecated-glib-functions-and-use-the-new.patch b/meta-oe/recipes-=
devtools/packagekit/packagekit-0.5.6/0001-Don-t-call-deprecated-glib-functi=
ons-and-use-the-new.patch
> deleted file mode 100644
> index ecf8e74..0000000
> --- a/meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/0001-Don-t-cal=
l-deprecated-glib-functions-and-use-the-new.patch
> +++ /dev/null
> @@ -1,166 +0,0 @@
> -From 869e52a9055c72970fed036a1510f676e6ce0824 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 13 Jun 2013 01:24:19 -0700
> -Subject: [PATCH] Don't call deprecated glib functions and use the new gt=
hread
> - API.
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Inappropriate[version Unmaintained Upstream]
> ----
> - client/pk-console.c                              |    3 ++-
> - client/pk-generate-pack.c                        |    3 ++-
> - client/pk-monitor.c                              |    3 ++-
> - contrib/command-not-found/PackageKit.sh          |    2 +-
> - contrib/command-not-found/pk-command-not-found.c |    4 ++--
> - contrib/debuginfo-install/pk-debuginfo-install.c |    4 ++--
> - src/pk-backend.c                                 |    7 +++++++
> - src/pk-main.c                                    |    4 ++--
> - 10 files changed, 20 insertions(+), 10 deletions(-)
> -
> -diff --git a/client/pk-console.c b/client/pk-console.c
> -index de927e1..2435f27 100644
> ---- a/client/pk-console.c
> -+++ b/client/pk-console.c
> -@@ -1264,11 +1264,12 @@ main (int argc, char *argv[])
> - 	bindtextdomain (GETTEXT_PACKAGE, PACKAGE_LOCALE_DIR);
> - 	bind_textdomain_codeset (GETTEXT_PACKAGE, "UTF-8");
> - 	textdomain (GETTEXT_PACKAGE);
> --
> -+#if !GLIB_CHECK_VERSION(2,32,0)
> - 	if (! g_thread_supported ())
> - 		g_thread_init (NULL);
> - 	g_type_init ();
> - 	dbus_g_thread_init ();
> -+#endif
> -=20
> - 	/* do stuff on ctrl-c */
> - 	signal (SIGINT, pk_console_sigint_cb);
> -diff --git a/client/pk-generate-pack.c b/client/pk-generate-pack.c
> -index 0b2b40f..20d7e8d 100644
> ---- a/client/pk-generate-pack.c
> -+++ b/client/pk-generate-pack.c
> -@@ -251,12 +251,13 @@ main (int argc, char *argv[])
> - 	bindtextdomain (GETTEXT_PACKAGE, PACKAGE_LOCALE_DIR);
> - 	bind_textdomain_codeset (GETTEXT_PACKAGE, "UTF-8");
> - 	textdomain (GETTEXT_PACKAGE);
> --
> -+#if !GLIB_CHECK_VERSION(2,32,0)
> - 	if (! g_thread_supported ())
> - 		g_thread_init (NULL);
> -=20
> - 	g_type_init ();
> - 	dbus_g_thread_init ();
> -+#endif
> -=20
> - 	/* do stuff on ctrl-c */
> - 	signal (SIGINT, pk_generate_pack_sigint_cb);
> -diff --git a/client/pk-monitor.c b/client/pk-monitor.c
> -index f230f7a..d43007f 100644
> ---- a/client/pk-monitor.c
> -+++ b/client/pk-monitor.c
> -@@ -285,11 +285,12 @@ main (int argc, char *argv[])
> - 	bindtextdomain (GETTEXT_PACKAGE, PACKAGE_LOCALE_DIR);
> - 	bind_textdomain_codeset (GETTEXT_PACKAGE, "UTF-8");
> - 	textdomain (GETTEXT_PACKAGE);
> --
> -+#if !GLIB_CHECK_VERSION(2,32,0)
> - 	if (! g_thread_supported ())
> - 		g_thread_init (NULL);
> - 	g_type_init ();
> - 	dbus_g_thread_init ();
> -+#endif
> -=20
> - 	context =3D g_option_context_new (NULL);
> - 	/* TRANSLATORS: this is a program that monitors PackageKit */
> -diff --git a/contrib/command-not-found/PackageKit.sh b/contrib/command-n=
ot-found/PackageKit.sh
> -index d08989c..d708fff 100644
> ---- a/contrib/command-not-found/PackageKit.sh
> -+++ b/contrib/command-not-found/PackageKit.sh
> -@@ -18,7 +18,7 @@ command_not_found_handle () {
> -=20
> - 	# run the command, or just print a warning
> - 	if [ $runcnf -eq 1 ]; then
> --		/home/hughsie/.root/libexec/pk-command-not-found $1
> -+		/usr/lib/packagekit/pk-command-not-found $1
> - 		retval=3D$?
> - 	else
> - 		echo "bash: $1: command not found"
> -diff --git a/contrib/command-not-found/pk-command-not-found.c b/contrib/=
command-not-found/pk-command-not-found.c
> -index 70679c0..9f81ce4 100644
> ---- a/contrib/command-not-found/pk-command-not-found.c
> -+++ b/contrib/command-not-found/pk-command-not-found.c
> -@@ -659,12 +659,12 @@ main (int argc, char *argv[])
> - 	bindtextdomain (GETTEXT_PACKAGE, PACKAGE_LOCALE_DIR);
> - 	bind_textdomain_codeset (GETTEXT_PACKAGE, "UTF-8");
> - 	textdomain (GETTEXT_PACKAGE);
> --
> -+#if !GLIB_CHECK_VERSION(2,32,0)
> - 	if (! g_thread_supported ())
> - 		g_thread_init (NULL);
> - 	dbus_g_thread_init ();
> - 	g_type_init ();
> --
> -+#endif
> - 	context =3D g_option_context_new (NULL);
> - 	/* TRANSLATORS: tool that gets called when the command is not found */
> - 	g_option_context_set_summary (context, _("PackageKit Command Not Found=
"));
> -diff --git a/contrib/debuginfo-install/pk-debuginfo-install.c b/contrib/=
debuginfo-install/pk-debuginfo-install.c
> -index c12aca5..b0e1e7c 100644
> ---- a/contrib/debuginfo-install/pk-debuginfo-install.c
> -+++ b/contrib/debuginfo-install/pk-debuginfo-install.c
> -@@ -532,11 +532,11 @@ main (int argc, char *argv[])
> - 	bindtextdomain (GETTEXT_PACKAGE, PACKAGE_LOCALE_DIR);
> - 	bind_textdomain_codeset (GETTEXT_PACKAGE, "UTF-8");
> - 	textdomain (GETTEXT_PACKAGE);
> --
> -+#if !GLIB_CHECK_VERSION(2,32,0)
> - 	if (! g_thread_supported ())
> - 		g_thread_init (NULL);
> - 	g_type_init ();
> --
> -+#endif
> - 	context =3D g_option_context_new (NULL);
> - 	/* TRANSLATORS: tool that gets called when the command is not found */
> - 	g_option_context_set_summary (context, _("PackageKit Debuginfo Install=
er"));
> -diff --git a/src/pk-backend.c b/src/pk-backend.c
> -index 5216b63..5b83ae4 100644
> ---- a/src/pk-backend.c
> -+++ b/src/pk-backend.c
> -@@ -2103,7 +2103,14 @@ pk_backend_thread_create (PkBackend *backend, PkB=
ackendThreadFunc func)
> - 		egg_warning ("already has thread");
> - 		return FALSE;
> - 	}
> -+#if !GLIB_CHECK_VERSION(2,32,0)
> - 	backend->priv->thread =3D g_thread_create ((GThreadFunc) func, backend=
, FALSE, NULL);
> -+#else
> -+	backend->priv->thread =3D g_thread_try_new ("daemon thread", (GThreadF=
unc) func, backend, NULL);
> -+	if (backend->priv->thread !=3D NULL) {
> -+		g_thread_unref(backend->priv->thread);
> -+	}
> -+#endif
> - 	if (backend->priv->thread =3D=3D NULL) {
> - 		egg_warning ("failed to create thread");
> - 		return FALSE;
> -diff --git a/src/pk-main.c b/src/pk-main.c
> -index 4c758cd..8fa2482 100644
> ---- a/src/pk-main.c
> -+++ b/src/pk-main.c
> -@@ -219,12 +219,12 @@ main (int argc, char *argv[])
> - 	bindtextdomain (GETTEXT_PACKAGE, PACKAGE_LOCALE_DIR);
> - 	bind_textdomain_codeset (GETTEXT_PACKAGE, "UTF-8");
> - 	textdomain (GETTEXT_PACKAGE);
> --
> -+#if !GLIB_CHECK_VERSION(2,32,0)
> - 	if (! g_thread_supported ())
> - 		g_thread_init (NULL);
> - 	dbus_g_thread_init ();
> - 	g_type_init ();
> --
> -+#endif
> - 	/* TRANSLATORS: describing the service that is running */
> - 	context =3D g_option_context_new (_("PackageKit service"));
> - 	g_option_context_add_main_entries (context, options, NULL);
> ---=20
> -1.7.9.5
> -
> diff --git a/meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/configu=
refix.patch b/meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/configur=
efix.patch
> deleted file mode 100644
> index 48f9591..0000000
> --- a/meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/configurefix.p=
atch
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -Index: PackageKit-0.6.0/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- PackageKit-0.6.0.orig/configure.ac	2010-01-04 16:32:18.000000000 +00=
00
> -+++ PackageKit-0.6.0/configure.ac	2010-01-29 11:33:48.000000000 +0000
> -@@ -90,7 +90,7 @@
> - 							enable_strict=3D$default_strict)
> - if test x$enable_strict !=3D xno; then
> - 	if test "$GCC" =3D "yes"; then
> --		WARNINGFLAGS_CPP=3D"$WARNINGFLAGS_CPP -Werror"
> -+		:
> - 	fi
> - fi
> -=20
> diff --git a/meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/opkgfix=
es.patch b/meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/opkgfixes.p=
atch
> deleted file mode 100644
> index 5a73a19..0000000
> --- a/meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/opkgfixes.patch
> +++ /dev/null
> @@ -1,422 +0,0 @@
> -Index: PackageKit-0.6.0/backends/opkg/pk-backend-opkg.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- PackageKit-0.6.0.orig/backends/opkg/pk-backend-opkg.c	2010-01-29 09:=
39:33.000000000 +0000
> -+++ PackageKit-0.6.0/backends/opkg/pk-backend-opkg.c	2010-01-29 11:30:51=
=2E000000000 +0000
> -@@ -29,8 +29,7 @@
> -=20
> -+#include <stdio.h>
> - #include <libopkg/opkg.h>
> -=20
> --static opkg_t *opkg;
> --
> - enum {
> - 	SEARCH_NAME,
> - 	SEARCH_DESCRIPTION,
> -@@ -62,7 +60,7 @@
> -  * check an opkg package for known GUI dependancies
> -  */
> - static gboolean
> --opkg_is_gui_pkg (opkg_package_t *pkg)
> -+opkg_is_gui_pkg (pkg_t *pkg)
> - {
> -=20
> -   /* TODO: check appropriate tag */
> -@@ -84,7 +82,7 @@
> -  * check an opkg package to determine if it is a development package
> -  */
> - static gboolean
> --opkg_is_devel_pkg (opkg_package_t *pkg)
> -+opkg_is_devel_pkg (pkg_t *pkg)
> - {
> -   if (g_strrstr (pkg->name, "-dev"))
> -       return TRUE;
> -@@ -105,7 +103,7 @@
> -  * returns true if the tag is present
> -  */
> - static gboolean=20
> --opkg_check_tag (opkg_package_t *pkg, const gchar *tag)
> -+opkg_check_tag (pkg_t *pkg, const gchar *tag)
> - {
> - 	if (pkg->tags && tag)
> - 		return (g_strrstr (pkg->tags, tag) !=3D NULL);
> -@@ -118,7 +116,7 @@
> - {
> - 	switch (err)
> - 	{
> --	case OPKG_NO_ERROR:
> -+/*	case OPKG_NO_ERROR:
> - 		break;
> - 	case OPKG_PACKAGE_NOT_INSTALLED:
> - 		pk_backend_error_code (backend, PK_ERROR_ENUM_PACKAGE_NOT_INSTALLED, =
NULL);
> -@@ -140,7 +138,7 @@
> - 		break;
> - 	case OPKG_PACKAGE_NOT_AVAILABLE:
> - 		pk_backend_error_code (backend, PK_ERROR_ENUM_PACKAGE_NOT_FOUND, NULL=
);
> --		break;
> -+		break;*/
> - 	default:
> - 		opkg_unknown_error (backend, err, "Update package");
> - 	}
> -@@ -152,7 +150,7 @@
> - static void
> - backend_initialize (PkBackend *backend)
> - {
> --	opkg =3D opkg_new ();
> -+	int opkg =3D opkg_new ();
> -=20
> - 	if (!opkg) {
> - 		pk_backend_error_code (backend,
> -@@ -162,8 +160,8 @@
> - 	}
> -=20
> - #ifdef OPKG_OFFLINE_ROOT
> --	opkg_set_option (opkg, (char *) "offline_root", OPKG_OFFLINE_ROOT);
> --	opkg_re_read_config_files (opkg);
> -+	opkg_set_option ((char *) "offline_root", OPKG_OFFLINE_ROOT);
> -+	opkg_re_read_config_files ();
> - #endif
> -=20
> - }
> -@@ -174,22 +172,22 @@
> - static void
> - backend_destroy (PkBackend *backend)
> - {
> --	opkg_free (opkg);
> -+	opkg_free ();
> - }
> -=20
> -=20
> - static void
> --pk_opkg_progress_cb (opkg_t *_opkg, const opkg_progress_data_t *pdata, =
void *data)
> -+pk_opkg_progress_cb (const opkg_progress_data_t *pdata, void *data)
> - {
> --	PkBackend *backend =3D PK_BACKEND (data);
> -+	PkBackend *backend =3D (PkBackend*) data;
> - 	if (!backend)
> - 		return;
> -=20
> - 	pk_backend_set_percentage (backend, pdata->percentage);
> --	if (pdata->package)
> -+	if (pdata->pkg)
> - 	{
> - 		gchar *uid;
> --		opkg_package_t *pkg =3D pdata->package;
> -+		pkg_t *pkg =3D pdata->pkg;
> - 		gint status =3D PK_INFO_ENUM_UNKNOWN;
> -=20
> - 		uid =3D g_strdup_printf ("%s;%s;%s;",
> -@@ -225,12 +223,12 @@
> - {
> - 	int ret;
> -=20
> --	ret =3D opkg_update_package_lists (opkg, pk_opkg_progress_cb, backend);
> -+	ret =3D opkg_update_package_lists (pk_opkg_progress_cb, backend);
> -=20
> - 	if (ret) {
> --		if (ret =3D=3D OPKG_DOWNLOAD_FAILED)
> --			pk_backend_error_code (backend, PK_ERROR_ENUM_REPO_NOT_AVAILABLE, NU=
LL);
> --		else
> -+//		if (ret =3D=3D OPKG_DOWNLOAD_FAILED)
> -+//			pk_backend_error_code (backend, PK_ERROR_ENUM_REPO_NOT_AVAILABLE, =
NULL);
> -+//		else
> - 			opkg_unknown_error (backend, ret, "Refreshing cache");
> - 	}
> - 	pk_backend_finished (backend);
> -@@ -256,7 +254,7 @@
> -  */
> -=20
> - static void
> --pk_opkg_package_list_cb (opkg_t *_opkg, opkg_package_t *pkg, void *data)
> -+pk_opkg_package_list_cb (pkg_t *pkg, void *data)
> - {
> - 	SearchParams *params =3D (SearchParams*) data;
> - 	gchar *uid;
> -@@ -298,7 +296,7 @@
> - 	uid =3D g_strdup_printf ("%s;%s;%s;",
> - 		pkg->name, pkg->version, pkg->architecture);
> -=20
> --	if (pkg->installed)
> -+	if (pkg->state_status =3D=3D SS_INSTALLED)
> - 		status =3D PK_INFO_ENUM_INSTALLED;
> - 	else
> - 		status =3D PK_INFO_ENUM_AVAILABLE;
> -@@ -318,10 +316,10 @@
> -                 opkg_is_gui_pkg (pkg))
> - 		goto end_handle;
> - 	if (pk_bitfield_contain(filters, PK_FILTER_ENUM_INSTALLED) &&=20
> --                (!pkg->installed))
> -+                (pkg->state_status !=3D SS_INSTALLED))
> - 		goto end_handle;
> - 	if (pk_bitfield_contain(filters, PK_FILTER_ENUM_NOT_INSTALLED) &&=20
> --                (pkg->installed))
> -+                (pkg->state_status =3D=3D SS_INSTALLED))
> - 		goto end_handle;
> -=20
> - 	pk_backend_package (params->backend, status, uid, pkg->description);
> -@@ -338,7 +336,7 @@
> -=20
> - 	params =3D pk_backend_get_pointer (backend, "search-params");
> -=20
> --	opkg_list_packages (opkg, pk_opkg_package_list_cb, params);
> -+	opkg_list_packages (pk_opkg_package_list_cb, params);
> -=20
> - 	pk_backend_finished (params->backend);
> -=20
> -@@ -349,7 +347,7 @@
> - }
> -=20
> - static void
> --backend_search_name (PkBackend *backend, PkBitfield filters, const gcha=
r *search)
> -+backend_search_name (PkBackend *backend, PkBitfield filters, gchar **se=
arch)
> - {
> - 	SearchParams *params;
> -=20
> -@@ -360,7 +358,7 @@
> - 	params =3D g_new0 (SearchParams, 1);
> - 	params->filters =3D filters;
> - 	params->search_type =3D SEARCH_NAME;
> --	params->needle =3D g_utf8_strdown (search, -1);
> -+	params->needle =3D g_utf8_strdown (search[0], -1);
> - 	params->backend =3D backend;
> -=20
> - 	pk_backend_set_pointer (backend, "search-params", params);
> -@@ -371,7 +369,7 @@
> -  * backend_search_description:
> -  */
> - static void
> --backend_search_description (PkBackend *backend, PkBitfield filters, con=
st gchar *search)
> -+backend_search_description (PkBackend *backend, PkBitfield filters, gch=
ar **search)
> - {
> - 	SearchParams *params;
> -=20
> -@@ -382,7 +380,7 @@
> - 	params =3D g_new0 (SearchParams, 1);
> - 	params->filters =3D filters;
> - 	params->search_type =3D SEARCH_DESCRIPTION;
> --	params->needle =3D g_utf8_strdown (search, -1);
> -+	params->needle =3D g_utf8_strdown (search[0], -1);
> - 	params->backend =3D backend;
> -=20
> - 	pk_backend_set_pointer (backend, "search-params", params);
> -@@ -390,7 +388,7 @@
> - }
> -=20
> - static void
> --backend_search_group (PkBackend *backend, PkBitfield filters, const gch=
ar *search)
> -+backend_search_group (PkBackend *backend, PkBitfield filters, gchar **s=
earch)
> - {
> - 	SearchParams *params;
> -=20
> -@@ -401,7 +399,7 @@
> - 	params =3D g_new0 (SearchParams, 1);
> - 	params->filters =3D filters;
> - 	params->search_type =3D SEARCH_TAG;
> --	params->needle =3D g_strdup_printf ("group::%s", search);
> -+	params->needle =3D g_strdup_printf ("group::%s", search[0]);
> - 	params->backend =3D backend;
> -=20
> - 	pk_backend_set_pointer (backend, "search-params", params);
> -@@ -412,9 +410,9 @@
> - static gboolean
> - backend_install_packages_thread (PkBackend *backend)
> - {
> --	PkPackageId *pi;
> - 	gint err, i;
> - 	gchar **package_ids;
> -+	gchar **parts;
> -=20
> - 	package_ids =3D pk_backend_get_strv (backend, "pkids");
> -=20
> -@@ -424,13 +422,13 @@
> - 	{
> - 		pk_backend_package (backend, PK_INFO_ENUM_INSTALLING, package_ids[i],=
 NULL);
> -=20
> --		pi =3D pk_package_id_new_from_string (package_ids[i]);
> -+		parts =3D pk_package_id_split (package_ids[i]);
> -=20
> --		err =3D opkg_install_package (opkg, pi->name, pk_opkg_progress_cb, ba=
ckend);
> -+		err =3D opkg_install_package (parts[PK_PACKAGE_ID_NAME], pk_opkg_prog=
ress_cb, backend);
> - 		if (err)
> - 			handle_install_error (backend, err);
> -=20
> --		pk_package_id_free (pi);
> -+		g_strfreev (parts);
> - 		if (err !=3D 0)
> - 			break;
> - 	}
> -@@ -453,9 +451,9 @@
> - static gboolean
> - backend_remove_packages_thread (PkBackend *backend)
> - {
> --	PkPackageId *pi;
> - 	gint err, i;
> - 	gchar **package_ids;
> -+	gchar **parts;
> - 	gboolean allow_deps;
> - 	gboolean autoremove;
> - 	gpointer *data;
> -@@ -467,29 +465,30 @@
> - 	autoremove =3D GPOINTER_TO_INT (data[2]);
> - 	g_free (data);
> -=20
> --	opkg_set_option (opkg, (char *)"autoremove", &autoremove);
> --	opkg_set_option (opkg, (char *)"force_removal_of_dependent_packages", =
&allow_deps);
> -+	opkg_set_option ((char *)"autoremove", &autoremove);
> -+	opkg_set_option ((char *)"force_removal_of_dependent_packages", &allow=
_deps);
> -=20
> - 	err =3D 0;
> -=20
> - 	for (i =3D 0; package_ids[i]; i++)
> - 	{
> --		pi =3D pk_package_id_new_from_string (package_ids[i]);
> - 		pk_backend_package (backend, PK_INFO_ENUM_REMOVING, package_ids[i], N=
ULL);
> -=20
> --		err =3D opkg_remove_package (opkg, pi->name, pk_opkg_progress_cb, bac=
kend);
> -+		parts =3D pk_package_id_split (package_ids[i]);
> -+
> -+		err =3D opkg_remove_package (parts[PK_PACKAGE_ID_NAME], pk_opkg_progr=
ess_cb, backend);
> -=20
> - 		switch (err)
> - 		{
> --		case OPKG_NO_ERROR:
> --			break;
> --		case OPKG_PACKAGE_NOT_INSTALLED:
> --			pk_backend_error_code (backend, PK_ERROR_ENUM_PACKAGE_NOT_INSTALLED,=
 NULL);
> --			break;
> -+		//case OPKG_NO_ERROR:
> -+		//	break;
> -+		//case OPKG_PACKAGE_NOT_INSTALLED:
> -+		//	pk_backend_error_code (backend, PK_ERROR_ENUM_PACKAGE_NOT_INSTALLE=
D, NULL);
> -+		//	break;
> - 		default:
> - 			opkg_unknown_error (backend, err, "Remove");
> - 		}
> --		pk_package_id_free (pi);
> -+		g_strfreev (parts);
> -=20
> - 		if (err !=3D 0)
> - 			break;
> -@@ -540,7 +539,7 @@
> - 	gint err;
> -=20
> - 	/* FIXME: support only_trusted */
> --	err =3D opkg_upgrade_all (opkg, pk_opkg_progress_cb, backend);
> -+	err =3D opkg_upgrade_all (pk_opkg_progress_cb, backend);
> -=20
> - 	if (err)
> - 		opkg_unknown_error (backend, err, "Upgrading system");
> -@@ -564,29 +563,28 @@
> - static gboolean
> - backend_update_package_thread (PkBackend *backend)
> - {
> --	PkPackageId *pi;
> -+        gchar **parts;
> - 	gint err =3D 0;
> - 	const gchar *package_id;
> -=20
> - 	/* FIXME: support only_trusted */
> - 	package_id =3D pk_backend_get_string (backend, "pkgid");
> --	pi =3D pk_package_id_new_from_string (package_id);
> -+	parts =3D pk_package_id_split (package_id);
> -=20
> --	if (!pi->name || !pi->version)
> -+	if (!parts)
> - 	{
> - 		pk_backend_error_code (backend, PK_ERROR_ENUM_PACKAGE_NOT_FOUND,
> - 				"Package not found");
> --		pk_package_id_free (pi);
> - 		pk_backend_finished (backend);
> - 		return FALSE;
> - 	}
> -=20
> --	err =3D opkg_upgrade_package (opkg, pi->name, pk_opkg_progress_cb, bac=
kend);
> -+	err =3D opkg_upgrade_package (parts[PK_PACKAGE_ID_NAME], pk_opkg_progr=
ess_cb, backend);
> - 	if (err)
> - 		handle_install_error (backend, err);
> -=20
> -=20
> --	pk_package_id_free (pi);
> -+	g_strfreev (parts);
> - 	pk_backend_finished (backend);
> - 	return (err !=3D 0);
> - }
> -@@ -610,13 +608,13 @@
> -  */
> -=20
> - static void
> --pk_opkg_list_upgradable_cb (opkg_t *_opkg, opkg_package_t *pkg, void *d=
ata)
> -+pk_opkg_list_upgradable_cb (pkg_t *pkg, void *data)
> - {
> --	PkBackend *backend =3D PK_BACKEND (data);
> -+	PkBackend *backend =3D (PkBackend*) data;
> - 	gchar *uid;
> - 	gint status;
> -=20
> --	if (pkg->installed)
> -+	if (pkg->state_status =3D=3D SS_INSTALLED)
> - 		status =3D PK_INFO_ENUM_INSTALLED;
> - 	else
> - 		status =3D PK_INFO_ENUM_AVAILABLE;
> -@@ -631,7 +629,7 @@
> - static gboolean
> - backend_get_updates_thread (PkBackend *backend)
> - {
> --	opkg_list_upgradable_packages (opkg, pk_opkg_list_upgradable_cb, backe=
nd);
> -+	opkg_list_upgradable_packages (pk_opkg_list_upgradable_cb, backend);
> - 	pk_backend_finished (backend);
> - 	return TRUE;
> - }
> -@@ -668,16 +666,18 @@
> - static gboolean
> - backend_get_details_thread (PkBackend *backend)
> - {
> --	PkPackageId *pi;
> - 	gchar **package_ids;
> -+        gchar **parts;
> - 	int group_index;
> - 	PkGroupEnum group =3D 0;
> --	opkg_package_t *pkg;
> -+	pkg_t *pkg;
> - 	gchar *newid;
> -=20
> -         package_ids =3D pk_backend_get_strv(backend, "package_ids");
> --	pi =3D pk_package_id_new_from_string (package_ids[0]);
> --	if (pi =3D=3D NULL)
> -+	parts =3D pk_package_id_split (package_ids[0]);
> -+
> -+
> -+	if (!parts)
> - 	{
> - 		pk_backend_error_code (backend, PK_ERROR_ENUM_PACKAGE_ID_INVALID, "in=
valid package id");
> - 		pk_backend_finished (backend);
> -@@ -685,8 +685,8 @@
> - 	}
> -=20
> -=20
> --	pkg =3D opkg_find_package (opkg, pi->name, pi->version, pi->arch, pi->=
data);
> --	pk_package_id_free (pi);
> -+	pkg =3D opkg_find_package (parts[PK_PACKAGE_ID_NAME], parts[PK_PACKAGE=
_ID_VERSION], parts[PK_PACKAGE_ID_ARCH], parts[PK_PACKAGE_ID_DATA]);
> -+	g_strfreev (parts);
> -=20
> - 	if (!pkg)
> - 	{
> -@@ -695,7 +695,7 @@
> - 		return FALSE;
> - 	}
> -=20
> --	newid =3D g_strdup_printf ("%s;%s;%s;%s", pkg->name, pkg->version, pkg=
->architecture, pkg->repository);
> -+	newid =3D g_strdup_printf ("%s;%s;%s;%s", pkg->name, pkg->version, pkg=
->architecture, pkg->src->name);
> -=20
> - 	if (pkg->tags) {
> - 		for (group_index =3D 0; group < PK_GROUP_ENUM_LAST; group_index++) {
> -@@ -706,9 +706,8 @@
> - 		}
> - 	}
> -=20
> --	pk_backend_details (backend, newid, NULL, group, pkg->description, pkg=
->url, pkg->size);
> -+	pk_backend_details (backend, newid, NULL, group, pkg->description, NUL=
L, pkg->size);
> - 	g_free (newid);
> --	opkg_package_free(pkg);
> - 	pk_backend_finished (backend);
> - 	return TRUE;
> - }
> diff --git a/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb b/me=
ta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
> deleted file mode 100644
> index 7d9c2bf..0000000
> --- a/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -DESCRIPTION =3D "PackageKit package management abstraction"
> -SECTION =3D "libs"
> -LICENSE =3D "GPL-2.0+"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> -DEPENDS =3D "gtk+ python polkit dbus dbus-glib glib-2.0 sqlite3 opkg int=
ltool intltool-native"
> -RDEPENDS_${PN} =3D "opkg"
> -
> -inherit gnome pythonnative
> -
> -SRC_URI =3D "http://www.packagekit.org/releases/PackageKit-${PV}.tar.gz;=
name=3Darchive \
> -           file://configurefix.patch \
> -           file://opkgfixes.patch \
> -           file://0001-Don-t-call-deprecated-glib-functions-and-use-the-=
new.patch \
> -          "
> -
> -SRC_URI[archive.md5sum] =3D "6c8d9c48e21b82abeea15c3fd5066242"
> -SRC_URI[archive.sha256sum] =3D "0eafd1be5516a41ebc0f0c3acff0b0763da105a4=
178b5eee0ff16d66ccd04408"
> -
> -S =3D "${WORKDIR}/PackageKit-${PV}"
> -
> -PACKAGECONFIG ??=3D ""
> -PACKAGECONFIG[service-packs] =3D "--enable-service-packs,--disable-servi=
ce-packs,libarchive"
> -
> -EXTRA_OECONF =3D "--with-security-framework=3Ddummy \
> -                --with-default-backend=3Dopkg \
> -                --enable-opkg \
> -                --disable-tests \
> -                --disable-ruck \
> -                --disable-qt \
> -                --disable-gstreamer-plugin \
> -                --disable-local  \
> -                --disable-networkmanager \
> -                ac_cv_path_XMLTO=3Dno \
> -"
> -
> -#do_configure_prepend() {
> -#    mkdir -p m4
> -#    echo "EXTRA_DIST=3D" > gtk-doc.make
> -#}
> -
> -do_configure_append() {
> -    for i in $(find . -name Makefile) ; do
> -        sed -i -e s:${STAGING_DIR_NATIVE}::g \
> -               -e s:${bindir}/mkdir:${STAGING_BINDIR_NATIVE}/mkdir:g \
> -               -e s:/usr/bin/intltool-merge:${STAGING_BINDIR_NATIVE}/int=
ltool-merge:g \
> -               $i
> -    done
> -}
> -
> -PACKAGES =3D+ "${PN}-website"
> -FILES_${PN}-website =3D "${datadir}/PackageKit/website"
> -
> -PACKAGES =3D+ "${PN}-python"
> -FILES_${PN}-python =3D "${libdir}/python*"
> -
> -PACKAGES =3D+ "${PN}-gtkmodule"
> -FILES_${PN}-gtkmodule =3D "${libdir}/gtk-2.0/*/*.so"
> -
> -FILES_${PN} +=3D "${libdir}/packagekit-backend/*.so ${libdir}/pm-utils $=
{datadir}/dbus-1/system-services/ ${datadir}/PolicyKit ${datadir}/PackageKi=
t"
> -FILES_${PN}-dbg +=3D "${libdir}/packagekit-backend/.debug/*.so ${libdir}=
/gtk-2.0/*/.debug"
> -FILES_${PN}-dev +=3D "${libdir}/packagekit-backend/*.la ${libdir}/gtk-2.=
0/*/*.la"
> -FILES_${PN}-staticdev +=3D "${libdir}/packagekit-backend/*.a ${libdir}/g=
tk-2.0/*/*.a"
> diff --git a/meta-oe/recipes-devtools/packagekit/packagekit_0.8.13.bb b/m=
eta-oe/recipes-devtools/packagekit/packagekit_0.8.13.bb
> new file mode 100644
> index 0000000..d59b76a
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/packagekit/packagekit_0.8.13.bb
> @@ -0,0 +1,64 @@
> +DESCRIPTION =3D "PackageKit package management abstraction"
> +SECTION =3D "libs"
> +LICENSE =3D "GPL-2.0+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +
> +DEPENDS =3D "python polkit dbus dbus-glib glib-2.0 sqlite3 intltool intl=
tool-native apt python-smartpm opkg"
> +
> +inherit autotools gtk-doc pkgconfig pythonnative
> +
> +PACKAGES =3D+ "${PN}-python ${PN}-backend-smart ${PN}-backend-opkg ${PN}=
-backend-apt"
> +PACKAGES_DYNAMIC +=3D "^packagekit-plugin.* ^packagekit-backend.*"
> +
> +SRC_URI =3D "http://www.packagekit.org/releases/PackageKit-${PV}.tar.xz"
> +
> +SRC_URI[md5sum] =3D "c8f7207cca4fcdb3d62d012b67c2f319"
> +SRC_URI[sha256sum] =3D "110da1afcbfb9d56da18ece3161e8554f77bc3f907933324=
06ca54129ec43c76"
> +
> +S =3D "${WORKDIR}/PackageKit-${PV}"
> +
> +EXTRA_OECONF =3D " \
> +  --with-security-framework=3Ddummy \
> +  --enable-apt \
> +  --enable-opkg \
> +  --enable-smart \
> +  --disable-tests \
> +  --disable-cron \
> +  --disable-connman \
> +  --disable-strict \
> +  --disable-systemd \
> +  --disable-systemd-updates \
> +  --disable-bash-completion \
> +  --disable-gstreamer-plugin \
> +  --disable-local  \
> +  --disable-networkmanager \
> +  --disable-gtk-module \
> +  --disable-browser-plugin \
> +  --disable-python3 \
> +  ac_cv_path_XMLTO=3Dno \
> +"
> +
> +FILES_${PN}-python =3D "${libdir}/python*"
> +RDEPENDS_${PN}-python =3D "python"
> +
> +FILES_${PN} +=3D " \
> +  ${datadir}/dbus-1 \
> +  ${datadir}/PackageKit \
> +  ${datadir}/mime \
> +"
> +FILES_${PN}-dbg +=3D "${libdir}/packagekit-backend/.debug/*.so ${libdir}=
/packagekit-plugins/.debug/*.so"
> +FILES_${PN}-dev +=3D "${libdir}/packagekit-backend/*.la ${libdir}/packag=
ekit-plugins/*.la"
> +FILES_${PN}-staticdev +=3D "${libdir}/packagekit-backend/*.a ${libdir}/p=
ackagekit-plugins/*.a"
> +
> +FILES_${PN}-backend-smart +=3D "${datadir}/PackageKit/helpers/smart"
> +RDEPENDS_${PN}-backend-smart +=3D "${PN} ${PN}-python smartpm"
> +
> +RDEPENDS_${PN}-backend-apt +=3D "${PN} apt"
> +RDEPENDS_${PN}-backend-opkg +=3D "${PN} opkg"
> +
> +python populate_packages_prepend() {
> +    backenddir =3D d.expand('${libdir}/packagekit-backend/')
> +    do_split_packages(d, backenddir, '^libpk_backend_(.*)\.so$', 'packag=
ekit-backend-%s', 'PackageKit backend for %s', extra_depends=3D'', prepend=
=3DTrue)
> +    plugindir =3D d.expand('${libdir}/packagekit-plugins/')
> +    do_split_packages(d, plugindir, '^libpk_plugin[_\-](.*)\.so$', 'pack=
agekit-plugin-%s', 'PackageKit plugin for %s', extra_depends=3D'', prepend=
=3DTrue)
> +}
> --=20
> 1.8.3.1
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1LKvkjL3sHcu1TtY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEUEARECAAYFAlLEB/IACgkQN1Ujt2V2gBwL9ACguki+1/OWIEUNS9+eLyB52L1F
+9kAmLH5kZXEcKHrOFHgQQ7w0I5AXlg=
=dYVV
-----END PGP SIGNATURE-----

--1LKvkjL3sHcu1TtY--
