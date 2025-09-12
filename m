Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB95CAC582
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 06:17:43 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.9576.1757657860148047848
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Sep 2025 23:17:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout03.t-online.de (Postfix) with SMTP id C4BA7F1BA
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Sep 2025 08:17:37 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.236.20]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uwx6H-1KjWJl0; Fri, 12 Sep 2025 08:17:37 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [oe-core][RFC][PATCH] glib-2.0: revert gir-gio-unix-split
Date: Fri, 12 Sep 2025 08:17:15 +0200
Message-ID: <20250912061728.5365-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1757657857-7A7FB9B4-FC30413B/0/0 CLEAN NORMAL
X-TOI-MSGID: be65e827-ad6b-48c4-b5dd-299fff2c3c85
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Sep 2025 06:17:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119374

This commit removes backward compatibility introspection from Gio-2.0
causing gnome-shell 48 to fail.

Undo the changes until switching to gnome 49

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-branch-gir-gio-unix-split-into-main.patch | 816 ++++++++++++++++++
 meta/recipes-core/glib-2.0/glib.inc           |   1 +
 2 files changed, 817 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/files/0001-Revert-Merge-br=
anch-gir-gio-unix-split-into-main.patch

diff --git a/meta/recipes-core/glib-2.0/files/0001-Revert-Merge-branch-gi=
r-gio-unix-split-into-main.patch b/meta/recipes-core/glib-2.0/files/0001-=
Revert-Merge-branch-gir-gio-unix-split-into-main.patch
new file mode 100644
index 0000000000..80680651a2
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/0001-Revert-Merge-branch-gir-gio-u=
nix-split-into-main.patch
@@ -0,0 +1,816 @@
+From fa119f74ebce3d44546c73584541be9ec1c6c2d0 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Thu, 11 Sep 2025 19:59:44 +0200
+Subject: [PATCH] Revert "Merge branch 'gir-gio-unix-split' into 'main'"
+
+This reverts commit cb074a65c79a3b4ae4f3ae0e36775af46bcc8009, reversing
+changes made to 0a017b39c2b085ddfede105584193b453a66909a.
+
+Upstream-Status: Inappropriate
+---
+ gio/gdesktopappinfo.c                  |  95 +++++++++++------------
+ gio/gunixmounts.c                      |  45 ++++++-----
+ girepository/girepository.c            | 101 ++++---------------------
+ girepository/introspection/meson.build |  21 +++++
+ girepository/tests/callable-info.c     |  30 --------
+ girepository/tests/repository.c        |   6 +-
+ girepository/tests/test-common.h       |   5 ++
+ 7 files changed, 112 insertions(+), 191 deletions(-)
+
+diff --git a/gio/gdesktopappinfo.c b/gio/gdesktopappinfo.c
+index 1e5a752ac..0c3038c17 100644
+--- a/gio/gdesktopappinfo.c
++++ b/gio/gdesktopappinfo.c
+@@ -1795,7 +1795,7 @@ g_desktop_app_info_class_init (GDesktopAppInfoClas=
s *klass)
+   /**
+    * GDesktopAppInfo:filename:
+    *
+-   * The origin filename of this [class@GioUnix.DesktopAppInfo]
++   * The origin filename of this [class@Gio.DesktopAppInfo]
+    */
+   g_object_class_install_property (gobject_class,
+                                    PROP_FILENAME,
+@@ -2084,9 +2084,9 @@ g_desktop_app_info_load_file (GDesktopAppInfo *sel=
f)
+  * g_desktop_app_info_new_from_keyfile:
+  * @key_file: an opened [type@GLib.KeyFile]
+  *
+- * Creates a new [class@GioUnix.DesktopAppInfo].
++ * Creates a new [class@Gio.DesktopAppInfo].
+  *
+- * Returns: (nullable): a new [class@GioUnix.DesktopAppInfo] or `NULL` =
on error.
++ * Returns: (nullable): a new [class@Gio.DesktopAppInfo] or `NULL` on e=
rror.
+  *
+  * Since: 2.18
+  **/
+@@ -2113,9 +2113,9 @@ g_desktop_app_info_new_from_keyfile (GKeyFile *key=
_file)
+  * @filename: (type filename): the path of a desktop file, in the GLib
+  *      filename encoding
+  *
+- * Creates a new [class@GioUnix.DesktopAppInfo].
++ * Creates a new [class@Gio.DesktopAppInfo].
+  *
+- * Returns: (nullable): a new [class@GioUnix.DesktopAppInfo] or `NULL` =
on error.
++ * Returns: (nullable): a new [class@Gio.DesktopAppInfo] or `NULL` on e=
rror.
+  **/
+ GDesktopAppInfo *
+ g_desktop_app_info_new_from_filename (const char *filename)
+@@ -2135,7 +2135,7 @@ g_desktop_app_info_new_from_filename (const char *=
filename)
+  * g_desktop_app_info_new:
+  * @desktop_id: the desktop file ID
+  *
+- * Creates a new [class@GioUnix.DesktopAppInfo] based on a desktop file=
 ID.
++ * Creates a new [class@Gio.DesktopAppInfo] based on a desktop file ID.
+  *
+  * A desktop file ID is the basename of the desktop file, including the
+  * `.desktop` extension. GIO is looking for a desktop file with this na=
me
+@@ -2147,7 +2147,7 @@ g_desktop_app_info_new_from_filename (const char *=
filename)
+  * (i.e. a desktop ID of `kde-foo.desktop` will match
+  * `/usr/share/applications/kde/foo.desktop`).
+  *
+- * Returns: (nullable): a new [class@GioUnix.DesktopAppInfo], or `NULL`=
 if no
++ * Returns: (nullable): a new [class@Gio.DesktopAppInfo], or `NULL` if =
no
+  *    desktop file with that ID exists.
+  */
+ GDesktopAppInfo *
+@@ -2266,7 +2266,7 @@ g_desktop_app_info_get_display_name (GAppInfo *app=
info)
+=20
+ /**
+  * g_desktop_app_info_get_is_hidden:
+- * @info: a [class@GioUnix.DesktopAppInfo].
++ * @info: a [class@Gio.DesktopAppInfo].
+  *
+  * A desktop file is hidden if the
+  * [`Hidden` key](https://specifications.freedesktop.org/desktop-entry-=
spec/latest/ar01s06.html#key-hidden)
+@@ -2282,13 +2282,11 @@ g_desktop_app_info_get_is_hidden (GDesktopAppInf=
o *info)
+=20
+ /**
+  * g_desktop_app_info_get_filename:
+- * @info: a [class@GioUnix.DesktopAppInfo]
++ * @info: a [class@Gio.DesktopAppInfo]
+  *
+- * When @info was created from a known filename, return it.
+- *
+- * In some situations such as a [class@GioUnix.DesktopAppInfo] returned
+- * from [ctor@GioUnix.DesktopAppInfo.new_from_keyfile], this function
+- * will return `NULL`.
++ * When @info was created from a known filename, return it.  In some
++ * situations such as a [class@Gio.DesktopAppInfo] returned from
++ * [ctor@Gio.DesktopAppInfo.new_from_keyfile], this function will retur=
n `NULL`.
+  *
+  * Returns: (nullable) (type filename): The full path to the file for @=
info,
+  *   or `NULL` if not known.
+@@ -2334,7 +2332,7 @@ g_desktop_app_info_get_icon (GAppInfo *appinfo)
+=20
+ /**
+  * g_desktop_app_info_get_categories:
+- * @info: a [class@GioUnix.DesktopAppInfo]
++ * @info: a [class@Gio.DesktopAppInfo]
+  *
+  * Gets the categories from the desktop file.
+  *
+@@ -2351,7 +2349,7 @@ g_desktop_app_info_get_categories (GDesktopAppInfo=
 *info)
+=20
+ /**
+  * g_desktop_app_info_get_keywords:
+- * @info: a [class@GioUnix.DesktopAppInfo]
++ * @info: a [class@Gio.DesktopAppInfo]
+  *
+  * Gets the keywords from the desktop file.
+  *
+@@ -2368,7 +2366,7 @@ g_desktop_app_info_get_keywords (GDesktopAppInfo *=
info)
+=20
+ /**
+  * g_desktop_app_info_get_generic_name:
+- * @info: a [class@GioUnix.DesktopAppInfo]
++ * @info: a [class@Gio.DesktopAppInfo]
+  *
+  * Gets the generic name from the desktop file.
+  *
+@@ -2383,7 +2381,7 @@ g_desktop_app_info_get_generic_name (GDesktopAppIn=
fo *info)
+=20
+ /**
+  * g_desktop_app_info_get_nodisplay:
+- * @info: a [class@GioUnix.DesktopAppInfo]
++ * @info: a [class@Gio.DesktopAppInfo]
+  *
+  * Gets the value of the
+  * [`NoDisplay` key](https://specifications.freedesktop.org/desktop-ent=
ry-spec/latest/ar01s06.html#key-nodisplay)
+@@ -2402,7 +2400,7 @@ g_desktop_app_info_get_nodisplay (GDesktopAppInfo =
*info)
+=20
+ /**
+  * g_desktop_app_info_get_show_in:
+- * @info: a [class@GioUnix.DesktopAppInfo]
++ * @info: a [class@Gio.DesktopAppInfo]
+  * @desktop_env: (nullable): a string specifying a desktop name
+  *
+  * Checks if the application info should be shown in menus that list av=
ailable
+@@ -3571,7 +3569,7 @@ g_desktop_app_info_launch (GAppInfo           *app=
info,
+=20
+ /**
+  * g_desktop_app_info_launch_uris_as_manager_with_fds:
+- * @appinfo: a [class@GioUnix.DesktopAppInfo]
++ * @appinfo: a [class@Gio.DesktopAppInfo]
+  * @uris: (element-type utf8): List of URIs
+  * @launch_context: (nullable): a [class@Gio.AppLaunchContext]
+  * @spawn_flags: [flags@GLib.SpawnFlags], used for each process
+@@ -3585,9 +3583,9 @@ g_desktop_app_info_launch (GAppInfo           *app=
info,
+  * @stderr_fd: file descriptor to use for child=E2=80=99s stderr, or `-=
1`
+  * @error: return location for a #GError, or `NULL`
+  *
+- * Equivalent to [method@GioUnix.DesktopAppInfo.launch_uris_as_manager]=
 but
+- * allows you to pass in file descriptors for the stdin, stdout and std=
err
+- * streams of the launched process.
++ * Equivalent to [method@Gio.DesktopAppInfo.launch_uris_as_manager] but=
 allows
++ * you to pass in file descriptors for the stdin, stdout and stderr str=
eams
++ * of the launched process.
+  *
+  * If application launching occurs via some non-spawn mechanism (e.g. D=
-Bus
+  * activation) then @stdin_fd, @stdout_fd and @stderr_fd are ignored.
+@@ -3626,7 +3624,7 @@ g_desktop_app_info_launch_uris_as_manager_with_fds=
 (GDesktopAppInfo            *
+=20
+ /**
+  * g_desktop_app_info_launch_uris_as_manager:
+- * @appinfo: a [class@GioUnix.DesktopAppInfo]
++ * @appinfo: a [class@Gio.DesktopAppInfo]
+  * @uris: (element-type utf8): List of URIs
+  * @launch_context: (nullable): a [class@Gio.AppLaunchContext]
+  * @spawn_flags: [flags@GLib.SpawnFlags], used for each process
+@@ -3688,7 +3686,7 @@ g_desktop_app_info_launch_uris_as_manager (GDeskto=
pAppInfo            *appinfo,
+  * Sets the name of the desktop that the application is running in.
+  *
+  * This is used by [method@Gio.AppInfo.should_show] and
+- * [method@GioUnix.DesktopAppInfo.get_show_in] to evaluate the
++ * [method@Gio.DesktopAppInfo.get_show_in] to evaluate the
+  * [`OnlyShowIn`](https://specifications.freedesktop.org/desktop-entry-=
spec/latest/ar01s06.html#key-onlyshowin)
+  * and [`NotShowIn`](https://specifications.freedesktop.org/desktop-ent=
ry-spec/latest/ar01s06.html#key-notshowin)
+  * keys.
+@@ -4701,7 +4699,7 @@ g_app_info_get_default_for_uri_scheme_impl (const =
char *uri_scheme)
+  * the `Implements` line of the desktop file of the application.
+  *
+  * Returns: (element-type GDesktopAppInfo) (transfer full): a list of
+- *   [class@GioUnix.DesktopAppInfo] objects.
++ *   [class@Gio.DesktopAppInfo] objects.
+  *
+  * Since: 2.42
+  **/
+@@ -4754,12 +4752,11 @@ g_desktop_app_info_get_implementations (const gc=
har *interface)
+  * any time.
+  *
+  * None of the search results are subjected to the normal validation
+- * checks performed by [ctor@GioUnix.DesktopAppInfo.new] (for example,
+- * checking that the executable referenced by a result exists), and so =
it is
+- * possible for [ctor@GioUnix.DesktopAppInfo.new] to return `NULL` when=
 passed
+- * an app ID returned by this function. It is expected that calling cod=
e will
+- * do this when subsequently creating a [class@GioUnix.DesktopAppInfo] =
for
+- * each result.
++ * checks performed by [ctor@Gio.DesktopAppInfo.new] (for example, chec=
king that
++ * the executable referenced by a result exists), and so it is possible=
 for
++ * [ctor@Gio.DesktopAppInfo.new] to return `NULL` when passed an app ID=
 returned
++ * by this function. It is expected that calling code will do this when
++ * subsequently creating a [class@Gio.DesktopAppInfo] for each result.
+  *
+  * Returns: (array zero-terminated=3D1) (element-type GStrv) (transfer =
full): a
+  *   list of strvs.  Free each item with [func@GLib.strfreev] and free =
the outer
+@@ -4885,7 +4882,7 @@ g_app_info_get_all_impl (void)
+  * #GDesktopAppInfoLookup is an opaque data structure and can only be a=
ccessed
+  * using the following functions.
+  *
+- * Deprecated: 2.28: The [iface@GioUnix.DesktopAppInfoLookup] interface=
 is
++ * Deprecated: 2.28: The [iface@Gio.DesktopAppInfoLookup] interface is
+  *   deprecated and unused by GIO.
+  **/
+=20
+@@ -4903,14 +4900,14 @@ g_desktop_app_info_lookup_default_init (GDesktop=
AppInfoLookupInterface *iface)
+=20
+ /**
+  * g_desktop_app_info_lookup_get_default_for_uri_scheme:
+- * @lookup: a [iface@GioUnix.DesktopAppInfoLookup]
++ * @lookup: a [iface@Gio.DesktopAppInfoLookup]
+  * @uri_scheme: a string containing a URI scheme.
+  *
+  * Gets the default application for launching applications
+- * using this URI scheme for a particular [iface@GioUnix.DesktopAppInfo=
Lookup]
++ * using this URI scheme for a particular [iface@Gio.DesktopAppInfoLook=
up]
+  * implementation.
+  *
+- * The [iface@GioUnix.DesktopAppInfoLookup] interface and this function=
 is used
++ * The [iface@Gio.DesktopAppInfoLookup] interface and this function is =
used
+  * to implement [func@Gio.AppInfo.get_default_for_uri_scheme] backends
+  * in a GIO module. There is no reason for applications to use it
+  * directly. Applications should use
+@@ -4919,7 +4916,7 @@ g_desktop_app_info_lookup_default_init (GDesktopAp=
pInfoLookupInterface *iface)
+  * Returns: (transfer full) (nullable): [iface@Gio.AppInfo] for given
+  *   @uri_scheme or `NULL` on error.
+  *
+- * Deprecated: 2.28: The [iface@GioUnix.DesktopAppInfoLookup] interface=
 is
++ * Deprecated: 2.28: The [iface@Gio.DesktopAppInfoLookup] interface is
+  *   deprecated and unused by GIO.
+  */
+ GAppInfo *
+@@ -4941,7 +4938,7 @@ G_GNUC_END_IGNORE_DEPRECATIONS
+=20
+ /**
+  * g_desktop_app_info_get_startup_wm_class:
+- * @info: a [class@GioUnix.DesktopAppInfo] that supports startup notify
++ * @info: a [class@Gio.DesktopAppInfo] that supports startup notify
+  *
+  * Retrieves the `StartupWMClass` field from @info. This represents the
+  * `WM_CLASS` property of the main window of the application, if launch=
ed
+@@ -4962,7 +4959,7 @@ g_desktop_app_info_get_startup_wm_class (GDesktopA=
ppInfo *info)
+=20
+ /**
+  * g_desktop_app_info_get_string:
+- * @info: a [class@GioUnix.DesktopAppInfo]
++ * @info: a [class@Gio.DesktopAppInfo]
+  * @key: the key to look up
+  *
+  * Looks up a string value in the keyfile backing @info.
+@@ -4986,7 +4983,7 @@ g_desktop_app_info_get_string (GDesktopAppInfo *in=
fo,
+=20
+ /**
+  * g_desktop_app_info_get_locale_string:
+- * @info: a [class@GioUnix.DesktopAppInfo]
++ * @info: a [class@Gio.DesktopAppInfo]
+  * @key: the key to look up
+  *
+  * Looks up a localized string value in the keyfile backing @info
+@@ -5013,7 +5010,7 @@ g_desktop_app_info_get_locale_string (GDesktopAppI=
nfo *info,
+=20
+ /**
+  * g_desktop_app_info_get_boolean:
+- * @info: a [class@GioUnix.DesktopAppInfo]
++ * @info: a [class@Gio.DesktopAppInfo]
+  * @key: the key to look up
+  *
+  * Looks up a boolean value in the keyfile backing @info.
+@@ -5036,7 +5033,7 @@ g_desktop_app_info_get_boolean (GDesktopAppInfo *i=
nfo,
+=20
+ /**
+  * g_desktop_app_info_get_string_list:
+- * @info: a [class@GioUnix.DesktopAppInfo]
++ * @info: a [class@Gio.DesktopAppInfo]
+  * @key: the key to look up
+  * @length: (out) (optional): return location for the number of returne=
d
+  *   strings, or `NULL`
+@@ -5064,7 +5061,7 @@ g_desktop_app_info_get_string_list (GDesktopAppInf=
o *info,
+=20
+ /**
+  * g_desktop_app_info_has_key:
+- * @info: a [class@GioUnix.DesktopAppInfo]
++ * @info: a [class@Gio.DesktopAppInfo]
+  * @key: the key to look up
+  *
+  * Returns whether @key exists in the `Desktop Entry` group
+@@ -5088,7 +5085,7 @@ g_desktop_app_info_has_key (GDesktopAppInfo *info,
+=20
+ /**
+  * g_desktop_app_info_list_actions:
+- * @info: a [class@GioUnix.DesktopAppInfo]
++ * @info: a [class@Gio.DesktopAppInfo]
+  *
+  * Returns the list of
+  * [=E2=80=98additional application actions=E2=80=99](https://specifica=
tions.freedesktop.org/desktop-entry-spec/latest/ar01s11.html)
+@@ -5125,9 +5122,9 @@ app_info_has_action (GDesktopAppInfo *info,
+=20
+ /**
+  * g_desktop_app_info_get_action_name:
+- * @info: a [class@GioUnix.DesktopAppInfo]
++ * @info: a [class@Gio.DesktopAppInfo]
+  * @action_name: the name of the action as from
+- *   [method@GioUnix.DesktopAppInfo.list_actions]
++ *   [method@Gio.DesktopAppInfo.list_actions]
+  *
+  * Gets the user-visible display name of the
+  * [=E2=80=98additional application actions=E2=80=99](https://specifica=
tions.freedesktop.org/desktop-entry-spec/latest/ar01s11.html)
+@@ -5168,15 +5165,15 @@ g_desktop_app_info_get_action_name (GDesktopAppI=
nfo *info,
+=20
+ /**
+  * g_desktop_app_info_launch_action:
+- * @info: a [class@GioUnix.DesktopAppInfo]
++ * @info: a [class@Gio.DesktopAppInfo]
+  * @action_name: the name of the action as from
+- *   [method@GioUnix.DesktopAppInfo.list_actions]
++ *   [method@Gio.DesktopAppInfo.list_actions]
+  * @launch_context: (nullable): a [class@Gio.AppLaunchContext]
+  *
+  * Activates the named application action.
+  *
+  * You may only call this function on action names that were
+- * returned from [method@GioUnix.DesktopAppInfo.list_actions].
++ * returned from [method@Gio.DesktopAppInfo.list_actions].
+  *
+  * Note that if the main entry of the desktop file indicates that the
+  * application supports startup notification, and @launch_context is
+diff --git a/gio/gunixmounts.c b/gio/gunixmounts.c
+index 54edc57ed..009d6855f 100644
+--- a/gio/gunixmounts.c
++++ b/gio/gunixmounts.c
+@@ -1867,7 +1867,7 @@ g_unix_mount_entries_get (guint64 *time_read)
+  * @n_entries_out: (optional) (out caller-allocates): return location f=
or the
+  *   number of mount entries returned
+  *
+- * Gets an array of [struct@GioUnix.MountEntry]s containing the Unix mo=
unts
++ * Gets an array of [struct@Gio.UnixMountEntry]s containing the Unix mo=
unts
+  * listed in @table_path.
+  *
+  * This is a generalized version of [func@GioUnix.mount_entries_get], m=
ainly
+@@ -1899,7 +1899,7 @@ g_unix_mounts_get_from_file (const char *table_pat=
h,
+  * @n_entries_out: (optional) (out caller-allocates): return location f=
or the
+  *   number of mount entries returned
+  *
+- * Gets an array of [struct@GioUnix.MountEntry]s containing the Unix mo=
unts
++ * Gets an array of [struct@Gio.UnixMountEntry]s containing the Unix mo=
unts
+  * listed in @table_path.
+  *
+  * This is a generalized version of [func@GioUnix.mount_entries_get], m=
ainly
+@@ -2126,7 +2126,7 @@ g_unix_mount_points_get (guint64 *time_read)
+  * @n_points_out: (optional) (out caller-allocates): return location fo=
r the
+  *   number of mount points returned
+  *
+- * Gets an array of [struct@GioUnix.MountPoint]s containing the Unix mo=
unt
++ * Gets an array of [struct@Gio.UnixMountPoint]s containing the Unix mo=
unt
+  * points listed in @table_path.
+  *
+  * This is a generalized version of [func@GioUnix.mount_points_get], ma=
inly
+@@ -2722,7 +2722,7 @@ g_unix_mount_monitor_new (void)
+  *=20
+  * Frees a Unix mount.
+  *
+- * Deprecated: 2.84: Use [method@GioUnix.MountEntry.free] instead.
++ * Deprecated: 2.84: Use [func@GioUnix.MountEntry.free] instead.
+  */
+ void
+ g_unix_mount_free (GUnixMountEntry *mount_entry)
+@@ -2759,7 +2759,7 @@ g_unix_mount_entry_free (GUnixMountEntry *mount_en=
try)
+  *
+  * Returns: (transfer full): a new [struct@GioUnix.MountEntry]
+  * Since: 2.54
+- * Deprecated: 2.84: Use [method@GioUnix.MountEntry.copy] instead.
++ * Deprecated: 2.84: Use [func@GioUnix.MountEntry.copy] instead.
+  */
+ GUnixMountEntry *
+ g_unix_mount_copy (GUnixMountEntry *mount_entry)
+@@ -2850,7 +2850,7 @@ g_unix_mount_point_copy (GUnixMountPoint *mount_po=
int)
+  *=20
+  * Returns: `1`, `0` or `-1` if @mount1 is greater than, equal to,
+  *    or less than @mount2, respectively
+- * Deprecated: 2.84: Use [method@GioUnix.MountEntry.compare] instead.
++ * Deprecated: 2.84: Use [func@GioUnix.MountEntry.compare] instead.
+  */
+ gint
+ g_unix_mount_compare (GUnixMountEntry *mount1,
+@@ -2912,7 +2912,7 @@ g_unix_mount_entry_compare (GUnixMountEntry *mount=
1,
+  * Gets the mount path for a Unix mount.
+  *=20
+  * Returns: (type filename): the mount path for @mount_entry
+- * Deprecated: 2.84: Use [method@GioUnix.MountEntry.get_mount_path] ins=
tead.
++ * Deprecated: 2.84: Use [func@GioUnix.MountEntry.get_mount_path] inste=
ad.
+  */
+ const gchar *
+ g_unix_mount_get_mount_path (GUnixMountEntry *mount_entry)
+@@ -2944,7 +2944,7 @@ g_unix_mount_entry_get_mount_path (GUnixMountEntry=
 *mount_entry)
+  * Gets the device path for a Unix mount.
+  *=20
+  * Returns: (type filename): a string containing the device path
+- * Deprecated: 2.84: Use [method@GioUnix.MountEntry.get_device_path] in=
stead.
++ * Deprecated: 2.84: Use [func@GioUnix.MountEntry.get_device_path] inst=
ead.
+  */
+ const gchar *
+ g_unix_mount_get_device_path (GUnixMountEntry *mount_entry)
+@@ -2973,9 +2973,8 @@ g_unix_mount_entry_get_device_path (GUnixMountEntr=
y *mount_entry)
+  * g_unix_mount_get_root_path:
+  * @mount_entry: a [struct@GioUnix.MountEntry]
+  *=20
+- * Gets the root of the mount within the filesystem.
+- *
+- * This is useful e.g. for mounts created by bind operation, or btrfs s=
ubvolumes.
++ * Gets the root of the mount within the filesystem. This is useful e.g=
. for
++ * mounts created by bind operation, or btrfs subvolumes.
+  *=20
+  * For example, the root path is equal to `/` for a mount created by
+  * `mount /dev/sda1 /mnt/foo` and `/bar` for
+@@ -2983,7 +2982,7 @@ g_unix_mount_entry_get_device_path (GUnixMountEntr=
y *mount_entry)
+  *
+  * Returns: (nullable): a string containing the root, or `NULL` if not =
supported
+  * Since: 2.60
+- * Deprecated: 2.84: Use [method@GioUnix.MountEntry.get_root_path] inst=
ead.
++ * Deprecated: 2.84: Use [func@GioUnix.MountEntry.get_root_path] instea=
d.
+  */
+ const gchar *
+ g_unix_mount_get_root_path (GUnixMountEntry *mount_entry)
+@@ -3020,7 +3019,7 @@ g_unix_mount_entry_get_root_path (GUnixMountEntry =
*mount_entry)
+  * Gets the filesystem type for the Unix mount.
+  *=20
+  * Returns: a string containing the file system type
+- * Deprecated: 2.84: Use [method@GioUnix.MountEntry.get_fs_type] instea=
d.
++ * Deprecated: 2.84: Use [func@GioUnix.MountEntry.get_fs_type] instead.
+  */
+ const gchar *
+ g_unix_mount_get_fs_type (GUnixMountEntry *mount_entry)
+@@ -3053,13 +3052,13 @@ g_unix_mount_entry_get_fs_type (GUnixMountEntry =
*mount_entry)
+  *=20
+  * For example: `rw,relatime,seclabel,data=3Dordered`.
+  *=20
+- * This is similar to [method@GioUnix.MountPoint.get_options], but it t=
akes
++ * This is similar to [func@GioUnix.MountPoint.get_options], but it tak=
es
+  * a [struct@GioUnix.MountEntry] as an argument.
+  *
+  * Returns: (nullable): a string containing the options, or `NULL` if n=
ot
+  *    available.
+  * Since: 2.58
+- * Deprecated: 2.84: Use [method@GioUnix.MountEntry.get_options] instea=
d.
++ * Deprecated: 2.84: Use [func@GioUnix.MountEntry.get_options] instead.
+  */
+ const gchar *
+ g_unix_mount_get_options (GUnixMountEntry *mount_entry)
+@@ -3075,7 +3074,7 @@ g_unix_mount_get_options (GUnixMountEntry *mount_e=
ntry)
+  *
+  * For example: `rw,relatime,seclabel,data=3Dordered`.
+  *
+- * This is similar to [method@GioUnix.MountPoint.get_options], but it t=
akes
++ * This is similar to [func@GioUnix.MountPoint.get_options], but it tak=
es
+  * a [struct@GioUnix.MountEntry] as an argument.
+  *
+  * Returns: (nullable): a string containing the options, or `NULL` if n=
ot
+@@ -3097,7 +3096,7 @@ g_unix_mount_entry_get_options (GUnixMountEntry *m=
ount_entry)
+  * Checks if a Unix mount is mounted read only.
+  *=20
+  * Returns: true if @mount_entry is read only; false otherwise
+- * Deprecated: 2.84: Use [method@GioUnix.MountEntry.is_readonly] instea=
d.
++ * Deprecated: 2.84: Use [func@GioUnix.MountEntry.is_readonly] instead.
+  */
+ gboolean
+ g_unix_mount_is_readonly (GUnixMountEntry *mount_entry)
+@@ -3136,7 +3135,7 @@ g_unix_mount_entry_is_readonly (GUnixMountEntry *m=
ount_entry)
+  * file system types and device paths are ignored.
+  *
+  * Returns: true if the Unix mount is for a system path; false otherwis=
e
+- * Deprecated: 2.84: Use [method@GioUnix.MountEntry.is_system_internal]=
 instead.
++ * Deprecated: 2.84: Use [func@GioUnix.MountEntry.is_system_internal] i=
nstead.
+  */
+ gboolean
+ g_unix_mount_is_system_internal (GUnixMountEntry *mount_entry)
+@@ -3528,7 +3527,7 @@ type_to_icon (GUnixMountType type, gboolean is_mou=
nt_point, gboolean use_symboli
+  * The result is a translated string.
+  *
+  * Returns: (transfer full): a newly allocated translated string
+- * Deprecated: 2.84: Use [method@GioUnix.MountEntry.guess_name] instead=
.
++ * Deprecated: 2.84: Use [func@GioUnix.MountEntry.guess_name] instead.
+  */
+ gchar *
+ g_unix_mount_guess_name (GUnixMountEntry *mount_entry)
+@@ -3567,7 +3566,7 @@ g_unix_mount_entry_guess_name (GUnixMountEntry *mo=
unt_entry)
+  * Guesses the icon of a Unix mount entry.
+  *
+  * Returns: (transfer full): a [iface@Gio.Icon]
+- * Deprecated: 2.84: Use [method@GioUnix.MountEntry.guess_icon] instead=
.
++ * Deprecated: 2.84: Use [func@GioUnix.MountEntry.guess_icon] instead.
+  */
+ GIcon *
+ g_unix_mount_guess_icon (GUnixMountEntry *mount_entry)
+@@ -3598,7 +3597,7 @@ g_unix_mount_entry_guess_icon (GUnixMountEntry *mo=
unt_entry)
+  *
+  * Returns: (transfer full): a [iface@Gio.Icon]
+  * Since: 2.34
+- * Deprecated: 2.84: Use [method@GioUnix.MountEntry.guess_symbolic_icon=
] instead.
++ * Deprecated: 2.84: Use [func@GioUnix.MountEntry.guess_symbolic_icon] =
instead.
+  */
+ GIcon *
+ g_unix_mount_guess_symbolic_icon (GUnixMountEntry *mount_entry)
+@@ -3680,7 +3679,7 @@ g_unix_mount_point_guess_symbolic_icon (GUnixMount=
Point *mount_point)
+  * Guesses whether a Unix mount entry can be ejected.
+  *
+  * Returns: true if @mount_entry is deemed to be ejectable; false other=
wise
+- * Deprecated: 2.84: Use [method@GioUnix.MountEntry.guess_can_eject] in=
stead.
++ * Deprecated: 2.84: Use [func@GioUnix.MountEntry.guess_can_eject] inst=
ead.
+  */
+ gboolean
+ g_unix_mount_guess_can_eject (GUnixMountEntry *mount_entry)
+@@ -3717,7 +3716,7 @@ g_unix_mount_entry_guess_can_eject (GUnixMountEntr=
y *mount_entry)
+  * Guesses whether a Unix mount entry should be displayed in the UI.
+  *
+  * Returns: true if @mount_entry is deemed to be displayable; false oth=
erwise
+- * Deprecated: 2.84: Use [method@GioUnix.MountEntry.guess_should_displa=
y] instead.
++ * Deprecated: 2.84: Use [func@GioUnix.MountEntry.guess_should_display]=
 instead.
+  */
+ gboolean
+ g_unix_mount_guess_should_display (GUnixMountEntry *mount_entry)
+diff --git a/girepository/girepository.c b/girepository/girepository.c
+index 1c816d1de..ebcd3d236 100644
+--- a/girepository/girepository.c
++++ b/girepository/girepository.c
+@@ -135,15 +135,6 @@ struct _GIRepository
+=20
+ G_DEFINE_TYPE (GIRepository, gi_repository, G_TYPE_OBJECT);
+=20
+-static GITypelib *
+-require_internal (GIRepository           *repository,
+-                  const char             *namespace,
+-                  const char             *version,
+-                  GIRepositoryLoadFlags   flags,
+-                  const char * const     *search_paths,
+-                  size_t                  n_search_paths,
+-                  GError                **error);
+-
+ #ifdef G_PLATFORM_WIN32
+ #include <windows.h>
+=20
+@@ -605,10 +596,6 @@ load_dependencies_recurse (GIRepository *repository=
,
+     {
+       int i;
+=20
+-      const char * const *search_path =3D
+-        (const char * const *) repository->typelib_search_path->pdata;
+-      gsize search_path_len =3D repository->typelib_search_path->len;
+-
+       for (i =3D 0; dependencies[i]; i++)
+         {
+           char *dependency =3D dependencies[i];
+@@ -621,9 +608,8 @@ load_dependencies_recurse (GIRepository *repository,
+           dependency_namespace =3D g_strndup (dependency, (size_t) (las=
t_dash - dependency));
+           dependency_version =3D last_dash+1;
+=20
+-          if (!require_internal (repository, dependency_namespace, depe=
ndency_version,
+-                                 0, search_path, search_path_len,
+-                                 error))
++          if (!gi_repository_require (repository, dependency_namespace,=
 dependency_version,
++                                      0, error))
+             {
+               g_free (dependency_namespace);
+               g_strfreev (dependencies);
+@@ -663,7 +649,7 @@ static const char *
+ register_internal (GIRepository *repository,
+                    const char   *source,
+                    gboolean      lazy,
+-                   GITypelib    *typelib,
++                   GITypelib     *typelib,
+                    GError      **error)
+ {
+   Header *header;
+@@ -2026,54 +2012,6 @@ require_internal (GIRepository           *reposit=
ory,
+   return ret;
+ }
+=20
+-static GITypelib *
+-require_internal_with_platform_data (GIRepository           *repository=
,
+-                                     const char             *namespace,
+-                                     const char             *version,
+-                                     GIRepositoryLoadFlags   flags,
+-                                     const char * const     *search_pat=
hs,
+-                                     size_t                  search_pat=
hs_len,
+-                                     GError                **error)
+-{
+-  GITypelib *typelib;
+-
+-  typelib =3D require_internal (repository, namespace, version, flags,
+-                              search_paths, search_paths_len,
+-                              error);
+-  if (!typelib)
+-    return NULL;
+-
+-#if defined (G_OS_UNIX) || defined (G_OS_WIN32)
+-  /* Backward compatibility hack: if we're loading Gio-2.0, we automati=
cally
+-   * load the platform specific introspection data that used to exist i=
nside
+-   * Gio-2.0
+-   */
+-  if (g_str_equal (namespace, "Gio") &&
+-      (!version || g_str_equal (version, "2.0")))
+-    {
+-      GError *local_error =3D NULL;
+-      const char *platform_namespace;
+-
+-#  if defined (G_OS_UNIX)
+-      platform_namespace =3D "GioUnix";
+-#  elif defined (G_OS_WIN32)
+-      platform_namespace =3D "GioWin32";
+-#  endif /* defined (G_OS_LINUX) */
+-
+-      if (!require_internal (repository, platform_namespace, version, f=
lags,
+-                             search_paths, search_paths_len,
+-                             &local_error))
+-        {
+-          g_critical ("Unable to load platform-specific GIO introspecti=
on data: %s",
+-                      local_error->message);
+-          g_error_free (local_error);
+-        }
+-    }
+-#endif /* defined(G_OS_UNIX) || defined(G_OS_WIN32) */
+-
+-  return typelib;
+-}
+-
+ /**
+  * gi_repository_require:
+  * @repository: A #GIRepository
+@@ -2094,24 +2032,19 @@ require_internal_with_platform_data (GIRepositor=
y           *repository,
+  * Since: 2.80
+  */
+ GITypelib *
+-gi_repository_require (GIRepository           *repository,
+-                       const char             *namespace,
+-                       const char             *version,
+-                       GIRepositoryLoadFlags   flags,
+-                       GError                **error)
++gi_repository_require (GIRepository  *repository,
++                       const char    *namespace,
++                       const char    *version,
++                       GIRepositoryLoadFlags flags,
++                       GError       **error)
+ {
+-  const char * const *search_paths;
+-  size_t search_paths_len;
+-
+-  g_return_val_if_fail (GI_IS_REPOSITORY (repository), NULL);
+-  g_return_val_if_fail (namespace !=3D NULL, NULL);
++  GITypelib *typelib;
+=20
+-  search_paths =3D (const char * const *) repository->typelib_search_pa=
th->pdata;
+-  search_paths_len =3D repository->typelib_search_path->len;
++  typelib =3D require_internal (repository, namespace, version, flags,
++                              (const char * const *) repository->typeli=
b_search_path->pdata,
++                              repository->typelib_search_path->len, err=
or);
+=20
+-  return require_internal_with_platform_data (repository, namespace, ve=
rsion, flags,
+-                                              search_paths, search_path=
s_len,
+-                                              error);
++  return typelib;
+ }
+=20
+ /**
+@@ -2145,12 +2078,8 @@ gi_repository_require_private (GIRepository      =
     *repository,
+ {
+   const char * const search_path[] =3D { typelib_dir, NULL };
+=20
+-  g_return_val_if_fail (GI_IS_REPOSITORY (repository), NULL);
+-  g_return_val_if_fail (namespace !=3D NULL, NULL);
+-
+-  return require_internal_with_platform_data (repository, namespace, ve=
rsion, flags,
+-                                              search_path, 1,
+-                                              error);
++  return require_internal (repository, namespace, version, flags,
++                           search_path, 1, error);
+ }
+=20
+ static gboolean
+diff --git a/girepository/introspection/meson.build b/girepository/intro=
spection/meson.build
+index 2c2a36c8f..a846a764c 100644
+--- a/girepository/introspection/meson.build
++++ b/girepository/introspection/meson.build
+@@ -234,6 +234,27 @@ gio_gir_args =3D [
+   '--symbol-prefix=3Dgio',
+ ]
+=20
++# For API compatibility reasons, Gio-2.0.gir needs to contain the platf=
orm
++# specific APIs which are also present in the (newer) GioUnix-2.0.gir a=
nd
++# GioWin32-2.0.gir repositories.
++# See https://gitlab.gnome.org/GNOME/glib/-/merge_requests/3892#note_20=
01361
++# These can be dropped when GIO next breaks API (i.e. with Gio-3.0.gir)=
.
++if host_system =3D=3D 'windows'
++  gio_gir_sources +=3D [ gio_win32_include_headers, win32_sources ]
++  foreach h: gio_win32_include_headers
++    gio_gir_args +=3D '--c-include=3Dgio/' + fs.name(h)
++  endforeach
++  gio_gir_packages +=3D 'gio-windows-2.0'
++  gio_gir_args +=3D '--pkg=3Dgio-windows-2.0'
++else
++  gio_gir_sources +=3D [ gio_unix_include_headers, unix_sources ]
++  foreach h: gio_unix_include_headers
++    gio_gir_args +=3D '--c-include=3Dgio/' + fs.name(h)
++  endforeach
++  gio_gir_packages +=3D 'gio-unix-2.0'
++  gio_gir_args +=3D '--pkg=3Dgio-unix-2.0'
++endif
++
+ gio_gir =3D gnome.generate_gir(libgio,
+   sources: gio_gir_sources,
+   namespace: 'Gio',
+diff --git a/girepository/tests/callable-info.c b/girepository/tests/cal=
lable-info.c
+index 973a54703..69fd5e940 100644
+--- a/girepository/tests/callable-info.c
++++ b/girepository/tests/callable-info.c
+@@ -210,32 +210,6 @@ test_callable_info_static_vfunc (RepositoryFixture =
*fx,
+   gi_base_info_unref ((GIBaseInfo *) vfunc_info);
+ }
+=20
+-#ifdef G_OS_UNIX
+-static void
+-test_callable_info_platform_unix_is_method (RepositoryFixture *fx,
+-                                            const void *unused)
+-{
+-  GIBaseInfo *info;
+-  GIFunctionInfo *func_info;
+-
+-  g_test_message ("Checking DesktopAppInfo in Gio");
+-  info =3D gi_repository_find_by_name (fx->repository, "Gio", "DesktopA=
ppInfo");
+-  g_assert_null (info);
+-
+-  g_test_message ("Checking DesktopAppInfo in GioUnix");
+-  info =3D gi_repository_find_by_name (fx->repository, "GioUnix", "Desk=
topAppInfo");
+-  g_assert_nonnull (info);
+-
+-  /* Must provide Gio.DesktopAppInfo methods */
+-  func_info =3D gi_object_info_find_method (GI_OBJECT_INFO (info), "has=
_key");
+-  g_assert_true (gi_callable_info_is_method (GI_CALLABLE_INFO (func_inf=
o)));
+-  g_assert_nonnull (func_info);
+-  g_clear_pointer (&func_info, gi_base_info_unref);
+-
+-  gi_base_info_unref (info);
+-}
+-#endif
+-
+ int
+ main (int argc, char **argv)
+ {
+@@ -247,9 +221,5 @@ main (int argc, char **argv)
+   ADD_REPOSITORY_TEST ("/callable-info/static-method", test_callable_in=
fo_static_method, &typelib_load_spec_gio);
+   ADD_REPOSITORY_TEST ("/callable-info/static-vfunc", test_callable_inf=
o_static_vfunc, &typelib_load_spec_gio);
+=20
+-#ifdef G_OS_UNIX
+-  ADD_REPOSITORY_TEST ("/callable-info/platform/unix/is-method", test_c=
allable_info_platform_unix_is_method, &typelib_load_spec_gio);
+-#endif
+-
+   return g_test_run ();
+ }
+diff --git a/girepository/tests/repository.c b/girepository/tests/reposi=
tory.c
+index ca33d9541..cbc21ed30 100644
+--- a/girepository/tests/repository.c
++++ b/girepository/tests/repository.c
+@@ -926,7 +926,7 @@ main (int   argc,
+   ADD_REPOSITORY_TEST ("/repository/constructor-return-type", test_repo=
sitory_constructor_return_type, &typelib_load_spec_gobject);
+   ADD_REPOSITORY_TEST ("/repository/enum-info-c-identifier", test_repos=
itory_enum_info_c_identifier, &typelib_load_spec_glib);
+   ADD_REPOSITORY_TEST ("/repository/enum-info-static-methods", test_rep=
ository_enum_info_static_methods, &typelib_load_spec_glib);
+-  ADD_REPOSITORY_TEST ("/repository/error-quark", test_repository_error=
_quark, &typelib_load_spec_gio);
++  ADD_REPOSITORY_TEST ("/repository/error-quark", test_repository_error=
_quark, &typelib_load_spec_gio_platform);
+   ADD_REPOSITORY_TEST ("/repository/flags-info-c-identifier", test_repo=
sitory_flags_info_c_identifier, &typelib_load_spec_gobject);
+   ADD_REPOSITORY_TEST ("/repository/fundamental-ref-func", test_reposit=
ory_fundamental_ref_func, &typelib_load_spec_gobject);
+   ADD_REPOSITORY_TEST ("/repository/instance-method-ownership-transfer"=
, test_repository_instance_method_ownership_transfer, &typelib_load_spec_=
gio);
+@@ -936,8 +936,8 @@ main (int   argc,
+   ADD_REPOSITORY_TEST ("/repository/vfunc-info-with-no-invoker", test_r=
epository_vfunc_info_with_no_invoker, &typelib_load_spec_gobject);
+   ADD_REPOSITORY_TEST ("/repository/vfunc-info-with-invoker-on-interfac=
e", test_repository_vfunc_info_with_invoker_on_interface, &typelib_load_s=
pec_gio);
+   ADD_REPOSITORY_TEST ("/repository/vfunc-info-with-invoker-on-object",=
 test_repository_vfunc_info_with_invoker_on_object, &typelib_load_spec_gi=
o);
+-  ADD_REPOSITORY_TEST ("/repository/find-by-gtype", test_repository_fin=
d_by_gtype, &typelib_load_spec_gio);
+-  ADD_REPOSITORY_TEST ("/repository/loaded-namespaces", test_repository=
_loaded_namespaces, &typelib_load_spec_gio);
++  ADD_REPOSITORY_TEST ("/repository/find-by-gtype", test_repository_fin=
d_by_gtype, &typelib_load_spec_gio_platform);
++  ADD_REPOSITORY_TEST ("/repository/loaded-namespaces", test_repository=
_loaded_namespaces, &typelib_load_spec_gio_platform);
+   g_test_add_func ("/repository/dup_default", test_repository_dup_defau=
lt);
+=20
+   return g_test_run ();
+diff --git a/girepository/tests/test-common.h b/girepository/tests/test-=
common.h
+index 9d31998d1..e7340c64b 100644
+--- a/girepository/tests/test-common.h
++++ b/girepository/tests/test-common.h
+@@ -36,6 +36,11 @@ typedef struct
+ static const TypelibLoadSpec typelib_load_spec_glib =3D { "GLib", "2.0"=
 };
+ static const TypelibLoadSpec typelib_load_spec_gobject =3D { "GObject",=
 "2.0" };
+ static const TypelibLoadSpec typelib_load_spec_gio =3D { "Gio", "2.0" }=
;
++#if defined(G_OS_UNIX)
++static const TypelibLoadSpec typelib_load_spec_gio_platform =3D { "GioU=
nix", "2.0" };
++#elif defined(G_OS_WIN32)
++static const TypelibLoadSpec typelib_load_spec_gio_platform =3D { "GioW=
in32", "2.0" };
++#endif
+=20
+ void repository_init (int *argc,
+                       char **argv[]);
+--=20
+2.50.1
+
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib=
-2.0/glib.inc
index f9cb3417ec..9344230525 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -231,6 +231,7 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${=
PV}.tar.xz \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-on=
ly-.patch \
            file://0010-Do-not-hardcode-python-path-into-various-tools.pa=
tch \
            file://skip-timeout.patch \
+           file://0001-Revert-Merge-branch-gir-gio-unix-split-into-main.=
patch \
            "
 SRC_URI:append:class-native =3D " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pi=
dfd-features-on-native-g.patch \
--=20
2.50.1


