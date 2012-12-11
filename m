Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TiER3-0007Rk-HM
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Dec 2012 02:15:14 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1323094eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Dec 2012 17:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=r70bG9W43ADU72GFV3MOqCWFt2hkj7Iyn7eyxr/+Flg=;
	b=DbDvMfFmE6L43Ni+rHc871hhBTITHYa30JJIQAJE+NY/ui0d3QraQt6If4iesIgy4l
	kMK32tgJ0f9fVJDPZKb4E4HP5PNcZeX94yhUyytp26gmp4NfuunXBOQXP8vsyv+Nu5hD
	r1dNJxsLe+DFCnZy5hvGTqTomPcRoGJeoctDnYkUKZLqLOJY99uAT1emk2D15z1gBvjH
	xYdl89RBqGF81ZdKV/uVnJ6LP03GKq8j+c6ZyvO60O8IZSXoFiU11h0ogCDdJUPzXpFu
	+nK6qlk2TsB8JLp/9fKve8a0D3butG1hjchey9y5mjrWUblm9Z3FXQMuQcwWLkZ9WtCg
	OHiw==
Received: by 10.14.216.70 with SMTP id f46mr55357233eep.12.1355187630203;
	Mon, 10 Dec 2012 17:00:30 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id z8sm46631840eeo.11.2012.12.10.17.00.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Dec 2012 17:00:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Dec 2012 01:59:56 +0100
Message-Id: <fb4647c716848b803f2fe32036cce38855c93159.1355187290.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355187290.git.Martin.Jansa@gmail.com>
References: <cover.1355187290.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 05/90] packagekit: import from OE-Classic
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Dec 2012 01:15:14 -0000

* add LIC_FILES_CHKSUM
* drop versions from DEPENDS
* use opkg as the only IPKG_VARIANT
* depend on polkit (renamed from policykit)
* disable unpackaged ruck
* fix packaging of PN-staticdev

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../packagekit/packagekit-0.5.6/configurefix.patch |  13 +
 .../packagekit/packagekit-0.5.6/opkgfixes.patch    | 422 +++++++++++++++++++++
 .../packagekit/packagekit_0.5.6.bb                 |  57 +++
 3 files changed, 492 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/configurefix.patch
 create mode 100644 meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/opkgfixes.patch
 create mode 100644 meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb

diff --git a/meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/configurefix.patch b/meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/configurefix.patch
new file mode 100644
index 0000000..48f9591
--- /dev/null
+++ b/meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/configurefix.patch
@@ -0,0 +1,13 @@
+Index: PackageKit-0.6.0/configure.ac
+===================================================================
+--- PackageKit-0.6.0.orig/configure.ac	2010-01-04 16:32:18.000000000 +0000
++++ PackageKit-0.6.0/configure.ac	2010-01-29 11:33:48.000000000 +0000
+@@ -90,7 +90,7 @@
+ 							enable_strict=$default_strict)
+ if test x$enable_strict != xno; then
+ 	if test "$GCC" = "yes"; then
+-		WARNINGFLAGS_CPP="$WARNINGFLAGS_CPP -Werror"
++		:
+ 	fi
+ fi
+ 
diff --git a/meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/opkgfixes.patch b/meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/opkgfixes.patch
new file mode 100644
index 0000000..5a73a19
--- /dev/null
+++ b/meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/opkgfixes.patch
@@ -0,0 +1,422 @@
+Index: PackageKit-0.6.0/backends/opkg/pk-backend-opkg.c
+===================================================================
+--- PackageKit-0.6.0.orig/backends/opkg/pk-backend-opkg.c	2010-01-29 09:39:33.000000000 +0000
++++ PackageKit-0.6.0/backends/opkg/pk-backend-opkg.c	2010-01-29 11:30:51.000000000 +0000
+@@ -29,8 +29,7 @@
+ 
++#include <stdio.h>
+ #include <libopkg/opkg.h>
+ 
+-static opkg_t *opkg;
+-
+ enum {
+ 	SEARCH_NAME,
+ 	SEARCH_DESCRIPTION,
+@@ -62,7 +60,7 @@
+  * check an opkg package for known GUI dependancies
+  */
+ static gboolean
+-opkg_is_gui_pkg (opkg_package_t *pkg)
++opkg_is_gui_pkg (pkg_t *pkg)
+ {
+ 
+   /* TODO: check appropriate tag */
+@@ -84,7 +82,7 @@
+  * check an opkg package to determine if it is a development package
+  */
+ static gboolean
+-opkg_is_devel_pkg (opkg_package_t *pkg)
++opkg_is_devel_pkg (pkg_t *pkg)
+ {
+   if (g_strrstr (pkg->name, "-dev"))
+       return TRUE;
+@@ -105,7 +103,7 @@
+  * returns true if the tag is present
+  */
+ static gboolean 
+-opkg_check_tag (opkg_package_t *pkg, const gchar *tag)
++opkg_check_tag (pkg_t *pkg, const gchar *tag)
+ {
+ 	if (pkg->tags && tag)
+ 		return (g_strrstr (pkg->tags, tag) != NULL);
+@@ -118,7 +116,7 @@
+ {
+ 	switch (err)
+ 	{
+-	case OPKG_NO_ERROR:
++/*	case OPKG_NO_ERROR:
+ 		break;
+ 	case OPKG_PACKAGE_NOT_INSTALLED:
+ 		pk_backend_error_code (backend, PK_ERROR_ENUM_PACKAGE_NOT_INSTALLED, NULL);
+@@ -140,7 +138,7 @@
+ 		break;
+ 	case OPKG_PACKAGE_NOT_AVAILABLE:
+ 		pk_backend_error_code (backend, PK_ERROR_ENUM_PACKAGE_NOT_FOUND, NULL);
+-		break;
++		break;*/
+ 	default:
+ 		opkg_unknown_error (backend, err, "Update package");
+ 	}
+@@ -152,7 +150,7 @@
+ static void
+ backend_initialize (PkBackend *backend)
+ {
+-	opkg = opkg_new ();
++	int opkg = opkg_new ();
+ 
+ 	if (!opkg) {
+ 		pk_backend_error_code (backend,
+@@ -162,8 +160,8 @@
+ 	}
+ 
+ #ifdef OPKG_OFFLINE_ROOT
+-	opkg_set_option (opkg, (char *) "offline_root", OPKG_OFFLINE_ROOT);
+-	opkg_re_read_config_files (opkg);
++	opkg_set_option ((char *) "offline_root", OPKG_OFFLINE_ROOT);
++	opkg_re_read_config_files ();
+ #endif
+ 
+ }
+@@ -174,22 +172,22 @@
+ static void
+ backend_destroy (PkBackend *backend)
+ {
+-	opkg_free (opkg);
++	opkg_free ();
+ }
+ 
+ 
+ static void
+-pk_opkg_progress_cb (opkg_t *_opkg, const opkg_progress_data_t *pdata, void *data)
++pk_opkg_progress_cb (const opkg_progress_data_t *pdata, void *data)
+ {
+-	PkBackend *backend = PK_BACKEND (data);
++	PkBackend *backend = (PkBackend*) data;
+ 	if (!backend)
+ 		return;
+ 
+ 	pk_backend_set_percentage (backend, pdata->percentage);
+-	if (pdata->package)
++	if (pdata->pkg)
+ 	{
+ 		gchar *uid;
+-		opkg_package_t *pkg = pdata->package;
++		pkg_t *pkg = pdata->pkg;
+ 		gint status = PK_INFO_ENUM_UNKNOWN;
+ 
+ 		uid = g_strdup_printf ("%s;%s;%s;",
+@@ -225,12 +223,12 @@
+ {
+ 	int ret;
+ 
+-	ret = opkg_update_package_lists (opkg, pk_opkg_progress_cb, backend);
++	ret = opkg_update_package_lists (pk_opkg_progress_cb, backend);
+ 
+ 	if (ret) {
+-		if (ret == OPKG_DOWNLOAD_FAILED)
+-			pk_backend_error_code (backend, PK_ERROR_ENUM_REPO_NOT_AVAILABLE, NULL);
+-		else
++//		if (ret == OPKG_DOWNLOAD_FAILED)
++//			pk_backend_error_code (backend, PK_ERROR_ENUM_REPO_NOT_AVAILABLE, NULL);
++//		else
+ 			opkg_unknown_error (backend, ret, "Refreshing cache");
+ 	}
+ 	pk_backend_finished (backend);
+@@ -256,7 +254,7 @@
+  */
+ 
+ static void
+-pk_opkg_package_list_cb (opkg_t *_opkg, opkg_package_t *pkg, void *data)
++pk_opkg_package_list_cb (pkg_t *pkg, void *data)
+ {
+ 	SearchParams *params = (SearchParams*) data;
+ 	gchar *uid;
+@@ -298,7 +296,7 @@
+ 	uid = g_strdup_printf ("%s;%s;%s;",
+ 		pkg->name, pkg->version, pkg->architecture);
+ 
+-	if (pkg->installed)
++	if (pkg->state_status == SS_INSTALLED)
+ 		status = PK_INFO_ENUM_INSTALLED;
+ 	else
+ 		status = PK_INFO_ENUM_AVAILABLE;
+@@ -318,10 +316,10 @@
+                 opkg_is_gui_pkg (pkg))
+ 		goto end_handle;
+ 	if (pk_bitfield_contain(filters, PK_FILTER_ENUM_INSTALLED) && 
+-                (!pkg->installed))
++                (pkg->state_status != SS_INSTALLED))
+ 		goto end_handle;
+ 	if (pk_bitfield_contain(filters, PK_FILTER_ENUM_NOT_INSTALLED) && 
+-                (pkg->installed))
++                (pkg->state_status == SS_INSTALLED))
+ 		goto end_handle;
+ 
+ 	pk_backend_package (params->backend, status, uid, pkg->description);
+@@ -338,7 +336,7 @@
+ 
+ 	params = pk_backend_get_pointer (backend, "search-params");
+ 
+-	opkg_list_packages (opkg, pk_opkg_package_list_cb, params);
++	opkg_list_packages (pk_opkg_package_list_cb, params);
+ 
+ 	pk_backend_finished (params->backend);
+ 
+@@ -349,7 +347,7 @@
+ }
+ 
+ static void
+-backend_search_name (PkBackend *backend, PkBitfield filters, const gchar *search)
++backend_search_name (PkBackend *backend, PkBitfield filters, gchar **search)
+ {
+ 	SearchParams *params;
+ 
+@@ -360,7 +358,7 @@
+ 	params = g_new0 (SearchParams, 1);
+ 	params->filters = filters;
+ 	params->search_type = SEARCH_NAME;
+-	params->needle = g_utf8_strdown (search, -1);
++	params->needle = g_utf8_strdown (search[0], -1);
+ 	params->backend = backend;
+ 
+ 	pk_backend_set_pointer (backend, "search-params", params);
+@@ -371,7 +369,7 @@
+  * backend_search_description:
+  */
+ static void
+-backend_search_description (PkBackend *backend, PkBitfield filters, const gchar *search)
++backend_search_description (PkBackend *backend, PkBitfield filters, gchar **search)
+ {
+ 	SearchParams *params;
+ 
+@@ -382,7 +380,7 @@
+ 	params = g_new0 (SearchParams, 1);
+ 	params->filters = filters;
+ 	params->search_type = SEARCH_DESCRIPTION;
+-	params->needle = g_utf8_strdown (search, -1);
++	params->needle = g_utf8_strdown (search[0], -1);
+ 	params->backend = backend;
+ 
+ 	pk_backend_set_pointer (backend, "search-params", params);
+@@ -390,7 +388,7 @@
+ }
+ 
+ static void
+-backend_search_group (PkBackend *backend, PkBitfield filters, const gchar *search)
++backend_search_group (PkBackend *backend, PkBitfield filters, gchar **search)
+ {
+ 	SearchParams *params;
+ 
+@@ -401,7 +399,7 @@
+ 	params = g_new0 (SearchParams, 1);
+ 	params->filters = filters;
+ 	params->search_type = SEARCH_TAG;
+-	params->needle = g_strdup_printf ("group::%s", search);
++	params->needle = g_strdup_printf ("group::%s", search[0]);
+ 	params->backend = backend;
+ 
+ 	pk_backend_set_pointer (backend, "search-params", params);
+@@ -412,9 +410,9 @@
+ static gboolean
+ backend_install_packages_thread (PkBackend *backend)
+ {
+-	PkPackageId *pi;
+ 	gint err, i;
+ 	gchar **package_ids;
++	gchar **parts;
+ 
+ 	package_ids = pk_backend_get_strv (backend, "pkids");
+ 
+@@ -424,13 +422,13 @@
+ 	{
+ 		pk_backend_package (backend, PK_INFO_ENUM_INSTALLING, package_ids[i], NULL);
+ 
+-		pi = pk_package_id_new_from_string (package_ids[i]);
++		parts = pk_package_id_split (package_ids[i]);
+ 
+-		err = opkg_install_package (opkg, pi->name, pk_opkg_progress_cb, backend);
++		err = opkg_install_package (parts[PK_PACKAGE_ID_NAME], pk_opkg_progress_cb, backend);
+ 		if (err)
+ 			handle_install_error (backend, err);
+ 
+-		pk_package_id_free (pi);
++		g_strfreev (parts);
+ 		if (err != 0)
+ 			break;
+ 	}
+@@ -453,9 +451,9 @@
+ static gboolean
+ backend_remove_packages_thread (PkBackend *backend)
+ {
+-	PkPackageId *pi;
+ 	gint err, i;
+ 	gchar **package_ids;
++	gchar **parts;
+ 	gboolean allow_deps;
+ 	gboolean autoremove;
+ 	gpointer *data;
+@@ -467,29 +465,30 @@
+ 	autoremove = GPOINTER_TO_INT (data[2]);
+ 	g_free (data);
+ 
+-	opkg_set_option (opkg, (char *)"autoremove", &autoremove);
+-	opkg_set_option (opkg, (char *)"force_removal_of_dependent_packages", &allow_deps);
++	opkg_set_option ((char *)"autoremove", &autoremove);
++	opkg_set_option ((char *)"force_removal_of_dependent_packages", &allow_deps);
+ 
+ 	err = 0;
+ 
+ 	for (i = 0; package_ids[i]; i++)
+ 	{
+-		pi = pk_package_id_new_from_string (package_ids[i]);
+ 		pk_backend_package (backend, PK_INFO_ENUM_REMOVING, package_ids[i], NULL);
+ 
+-		err = opkg_remove_package (opkg, pi->name, pk_opkg_progress_cb, backend);
++		parts = pk_package_id_split (package_ids[i]);
++
++		err = opkg_remove_package (parts[PK_PACKAGE_ID_NAME], pk_opkg_progress_cb, backend);
+ 
+ 		switch (err)
+ 		{
+-		case OPKG_NO_ERROR:
+-			break;
+-		case OPKG_PACKAGE_NOT_INSTALLED:
+-			pk_backend_error_code (backend, PK_ERROR_ENUM_PACKAGE_NOT_INSTALLED, NULL);
+-			break;
++		//case OPKG_NO_ERROR:
++		//	break;
++		//case OPKG_PACKAGE_NOT_INSTALLED:
++		//	pk_backend_error_code (backend, PK_ERROR_ENUM_PACKAGE_NOT_INSTALLED, NULL);
++		//	break;
+ 		default:
+ 			opkg_unknown_error (backend, err, "Remove");
+ 		}
+-		pk_package_id_free (pi);
++		g_strfreev (parts);
+ 
+ 		if (err != 0)
+ 			break;
+@@ -540,7 +539,7 @@
+ 	gint err;
+ 
+ 	/* FIXME: support only_trusted */
+-	err = opkg_upgrade_all (opkg, pk_opkg_progress_cb, backend);
++	err = opkg_upgrade_all (pk_opkg_progress_cb, backend);
+ 
+ 	if (err)
+ 		opkg_unknown_error (backend, err, "Upgrading system");
+@@ -564,29 +563,28 @@
+ static gboolean
+ backend_update_package_thread (PkBackend *backend)
+ {
+-	PkPackageId *pi;
++        gchar **parts;
+ 	gint err = 0;
+ 	const gchar *package_id;
+ 
+ 	/* FIXME: support only_trusted */
+ 	package_id = pk_backend_get_string (backend, "pkgid");
+-	pi = pk_package_id_new_from_string (package_id);
++	parts = pk_package_id_split (package_id);
+ 
+-	if (!pi->name || !pi->version)
++	if (!parts)
+ 	{
+ 		pk_backend_error_code (backend, PK_ERROR_ENUM_PACKAGE_NOT_FOUND,
+ 				"Package not found");
+-		pk_package_id_free (pi);
+ 		pk_backend_finished (backend);
+ 		return FALSE;
+ 	}
+ 
+-	err = opkg_upgrade_package (opkg, pi->name, pk_opkg_progress_cb, backend);
++	err = opkg_upgrade_package (parts[PK_PACKAGE_ID_NAME], pk_opkg_progress_cb, backend);
+ 	if (err)
+ 		handle_install_error (backend, err);
+ 
+ 
+-	pk_package_id_free (pi);
++	g_strfreev (parts);
+ 	pk_backend_finished (backend);
+ 	return (err != 0);
+ }
+@@ -610,13 +608,13 @@
+  */
+ 
+ static void
+-pk_opkg_list_upgradable_cb (opkg_t *_opkg, opkg_package_t *pkg, void *data)
++pk_opkg_list_upgradable_cb (pkg_t *pkg, void *data)
+ {
+-	PkBackend *backend = PK_BACKEND (data);
++	PkBackend *backend = (PkBackend*) data;
+ 	gchar *uid;
+ 	gint status;
+ 
+-	if (pkg->installed)
++	if (pkg->state_status == SS_INSTALLED)
+ 		status = PK_INFO_ENUM_INSTALLED;
+ 	else
+ 		status = PK_INFO_ENUM_AVAILABLE;
+@@ -631,7 +629,7 @@
+ static gboolean
+ backend_get_updates_thread (PkBackend *backend)
+ {
+-	opkg_list_upgradable_packages (opkg, pk_opkg_list_upgradable_cb, backend);
++	opkg_list_upgradable_packages (pk_opkg_list_upgradable_cb, backend);
+ 	pk_backend_finished (backend);
+ 	return TRUE;
+ }
+@@ -668,16 +666,18 @@
+ static gboolean
+ backend_get_details_thread (PkBackend *backend)
+ {
+-	PkPackageId *pi;
+ 	gchar **package_ids;
++        gchar **parts;
+ 	int group_index;
+ 	PkGroupEnum group = 0;
+-	opkg_package_t *pkg;
++	pkg_t *pkg;
+ 	gchar *newid;
+ 
+         package_ids = pk_backend_get_strv(backend, "package_ids");
+-	pi = pk_package_id_new_from_string (package_ids[0]);
+-	if (pi == NULL)
++	parts = pk_package_id_split (package_ids[0]);
++
++
++	if (!parts)
+ 	{
+ 		pk_backend_error_code (backend, PK_ERROR_ENUM_PACKAGE_ID_INVALID, "invalid package id");
+ 		pk_backend_finished (backend);
+@@ -685,8 +685,8 @@
+ 	}
+ 
+ 
+-	pkg = opkg_find_package (opkg, pi->name, pi->version, pi->arch, pi->data);
+-	pk_package_id_free (pi);
++	pkg = opkg_find_package (parts[PK_PACKAGE_ID_NAME], parts[PK_PACKAGE_ID_VERSION], parts[PK_PACKAGE_ID_ARCH], parts[PK_PACKAGE_ID_DATA]);
++	g_strfreev (parts);
+ 
+ 	if (!pkg)
+ 	{
+@@ -695,7 +695,7 @@
+ 		return FALSE;
+ 	}
+ 
+-	newid = g_strdup_printf ("%s;%s;%s;%s", pkg->name, pkg->version, pkg->architecture, pkg->repository);
++	newid = g_strdup_printf ("%s;%s;%s;%s", pkg->name, pkg->version, pkg->architecture, pkg->src->name);
+ 
+ 	if (pkg->tags) {
+ 		for (group_index = 0; group < PK_GROUP_ENUM_LAST; group_index++) {
+@@ -706,9 +706,8 @@
+ 		}
+ 	}
+ 
+-	pk_backend_details (backend, newid, NULL, group, pkg->description, pkg->url, pkg->size);
++	pk_backend_details (backend, newid, NULL, group, pkg->description, NULL, pkg->size);
+ 	g_free (newid);
+-	opkg_package_free(pkg);
+ 	pk_backend_finished (backend);
+ 	return TRUE;
+ }
diff --git a/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb b/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
new file mode 100644
index 0000000..f7c8063
--- /dev/null
+++ b/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
@@ -0,0 +1,57 @@
+DESCRIPTION = "PackageKit package management abstraction"
+SECTION = "libs"
+LICENSE = "GPL-2.0+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+DEPENDS = "gtk+ python polkit dbus dbus-glib glib-2.0 sqlite3 opkg intltool intltool-native"
+RDEPENDS_${PN} = "opkg"
+
+inherit gnome pythonnative
+
+SRC_URI = "http://www.packagekit.org/releases/PackageKit-${PV}.tar.gz;name=archive \
+           file://configurefix.patch \
+           file://opkgfixes.patch"
+
+SRC_URI[archive.md5sum] = "6c8d9c48e21b82abeea15c3fd5066242"
+SRC_URI[archive.sha256sum] = "0eafd1be5516a41ebc0f0c3acff0b0763da105a4178b5eee0ff16d66ccd04408"
+
+S = "${WORKDIR}/PackageKit-${PV}"
+
+EXTRA_OECONF = "--with-security-framework=dummy \
+                --with-default-backend=opkg \
+                --enable-opkg \
+                --disable-tests \
+                --disable-ruck \
+                --disable-qt \
+                --disable-gstreamer-plugin \
+                --disable-local  \
+                --disable-networkmanager \
+                ac_cv_path_XMLTO=no \
+                "
+
+#do_configure_prepend() {
+#	mkdir -p m4
+#	echo "EXTRA_DIST=" > gtk-doc.make
+#}
+
+do_configure_append() {
+	for i in $(find . -name Makefile) ; do
+	        sed -i -e s:${STAGING_DIR_NATIVE}::g \
+               -e s:${bindir}/mkdir:${STAGING_BINDIR_NATIVE}/mkdir:g \
+               -e s:/usr/bin/intltool-merge:${STAGING_BINDIR_NATIVE}/intltool-merge:g \
+	$i
+	done
+}
+
+PACKAGES =+ "${PN}-website"
+FILES_${PN}-website = "${datadir}/PackageKit/website"
+
+PACKAGES =+ "${PN}-python"
+FILES_${PN}-python = "${libdir}/python*"
+
+PACKAGES =+ "${PN}-gtkmodule"
+FILES_${PN}-gtkmodule = "${libdir}/gtk-2.0/*/*.so"
+
+FILES_${PN} += "${libdir}/packagekit-backend/*.so ${libdir}/pm-utils ${datadir}/dbus-1/system-services/ ${datadir}/PolicyKit ${datadir}/PackageKit"
+FILES_${PN}-dbg += "${libdir}/packagekit-backend/.debug/*.so ${libdir}/gtk-2.0/*/.debug"
+FILES_${PN}-dev += "${libdir}/packagekit-backend/*.la ${libdir}/gtk-2.0/*/*.la"
+FILES_${PN}-staticdev += "${libdir}/packagekit-backend/*.a ${libdir}/gtk-2.0/*/*.a"
-- 
1.8.0



