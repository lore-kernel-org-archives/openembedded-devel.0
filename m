Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 553F1C79F8C
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 17:39:44 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18382.1788716381734658363
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Sep 2026 10:39:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=uyoUbael;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout03.t-online.de (Postfix) with SMTP id 860CFE54A
	for <openembedded-devel@lists.openembedded.org>; Sun,  6 Sep 2026 19:39:38 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.20]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x3Gq8-3o5rRA0; Sun, 6 Sep 2026 19:39:36 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] gnome-online-accounts-gtk: add recipe
Date: Sun,  6 Sep 2026 19:39:27 +0200
Message-ID: <20260906173928.130930-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1788716376-25FF89C8-337A68A6/0/0 CLEAN NORMAL
X-TOI-MSGID: 4c757274-e5f8-491c-b81b-7c7f8c87abae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788716378; i=f_l_k@t-online.de;
	bh=kLxUJQCKl6zdutdrDVRvk47tx8HtuEbd1ttxggs0Ph0=;
	h=From:To:Subject:Date;
	b=uyoUbaelIrxfESMr7R6/4rw8j82Ws/BYklN62uZ/0ZX74xDCTqW8kQoZXweTF6HFB
	 M676Ehu1V+tNBX2CIAPzfW9m7gKAgUMFzcmd046ktu0NhLLmMmOG4vdKuResG/4Q5+
	 j4Oe5eiStf4LdqPTzCyePKl2mNjKfDfSiOU1hKUwed8XNGIUr0hQ7Cj+Auo1UALrja
	 Gl3lWMHLMiojNyQaZcyKrwkgRh8YXGFX1vRGi8Tda8qWhvhDoQEMUZwuST6u5DjVja
	 3UkLaJnOn7NwpVMmxE1HKszRHsdrUQldfgsslVmPYPSicjsLFiZkD4opTb4T3Aua7s
	 UvC3mpBLS7XIA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Sep 2026 17:39:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129795

GNOME Online Accounts only provides the daemon and library that
applications such as gnome-calendar, gnome-contacts and evolution use
for their calendar, mail and contact accounts. The only user interface
for adding accounts is the online-accounts panel of gnome-control-center,
which pulls in gnome-shell and its settings daemon. Desktops built on
wlroots compositors or other GTK environments have no way to configure
these accounts at all.

gnome-online-accounts-gtk from the xapp project is a standalone GTK4 and
libadwaita application for exactly that job and works without GNOME
Shell.

GNOME applications open the accounts settings by activating the
"launch-panel" action of org.gnome.Settings on the session bus. The
included patch provides that name and action from
gnome-online-accounts-gtk together with a D-Bus service file, so these
buttons work here too. Since only one package can own the bus name, the
package conflicts with gnome-control-center.

Build tested on corei7-64.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
---
 ...nome.Settings-launch-panel-interface.patch | 261 ++++++++++++++++++
 .../gnome-online-accounts-gtk_3.50.10.bb      |  29 ++
 2 files changed, 290 insertions(+)
 create mode 100644 meta-gnome/recipes-extended/gnome-online-accounts-gtk=
/files/0001-Provide-the-org.gnome.Settings-launch-panel-interface.patch
 create mode 100644 meta-gnome/recipes-extended/gnome-online-accounts-gtk=
/gnome-online-accounts-gtk_3.50.10.bb

diff --git a/meta-gnome/recipes-extended/gnome-online-accounts-gtk/files/=
0001-Provide-the-org.gnome.Settings-launch-panel-interface.patch b/meta-g=
nome/recipes-extended/gnome-online-accounts-gtk/files/0001-Provide-the-or=
g.gnome.Settings-launch-panel-interface.patch
new file mode 100644
index 0000000000..c352138985
--- /dev/null
+++ b/meta-gnome/recipes-extended/gnome-online-accounts-gtk/files/0001-Pr=
ovide-the-org.gnome.Settings-launch-panel-interface.patch
@@ -0,0 +1,261 @@
+From 08e3b37df99f89c8e36cea80304e2bc1f2986659 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Sun, 6 Sep 2026 18:36:48 +0200
+Subject: [PATCH] Provide the org.gnome.Settings launch-panel interface
+
+GNOME applications such as gnome-calendar, gnome-contacts or evolution
+open the online accounts settings by activating the "launch-panel"
+action of org.gnome.Settings on the session bus, which is only provided
+by gnome-control-center. On desktops that ship gnome-online-accounts-gtk
+instead, these buttons silently do nothing.
+
+Export the application actions on /org/gnome/Settings as well, own the
+org.gnome.Settings name once the application has started and install a
+D-Bus service file so the application gets activated on demand. The
+"online-accounts" panel presents the main window; when an account id is
+passed as the first argument, the matching account is opened, mirroring
+the behaviour of the gnome-control-center panel. Other panel ids are
+ignored with a warning.
+
+Upstream-Status: Pending
+AI-Generated: Uses Claude Code (Claude Fable 5.1)
+---
+ data/meson.build                   |   8 ++
+ data/org.gnome.Settings.service.in |   3 +
+ src/gnome-online-accounts-gtk.c    | 152 ++++++++++++++++++++++++++++-
+ 3 files changed, 159 insertions(+), 4 deletions(-)
+ create mode 100644 data/org.gnome.Settings.service.in
+
+diff --git a/data/meson.build b/data/meson.build
+index deadf44..71e27aa 100644
+--- a/data/meson.build
++++ b/data/meson.build
+@@ -24,4 +24,12 @@ i18n.merge_file(
+    install_dir: datadir / 'applications'
+ )
+=20
++configure_file(
++  input: 'org.gnome.Settings.service.in',
++  output: 'org.gnome.Settings.service',
++  configuration: bin_conf,
++  install: true,
++  install_dir: datadir / 'dbus-1' / 'services',
++)
++
+ subdir('icons')
+\ No newline at end of file
+diff --git a/data/org.gnome.Settings.service.in b/data/org.gnome.Setting=
s.service.in
+new file mode 100644
+index 0000000..ab4b5a1
+--- /dev/null
++++ b/data/org.gnome.Settings.service.in
+@@ -0,0 +1,3 @@
++[D-BUS Service]
++Name=3Dorg.gnome.Settings
++Exec=3D@bindir@/gnome-online-accounts-gtk --gapplication-service
+diff --git a/src/gnome-online-accounts-gtk.c b/src/gnome-online-accounts=
-gtk.c
+index 25bd116..60d3472 100644
+--- a/src/gnome-online-accounts-gtk.c
++++ b/src/gnome-online-accounts-gtk.c
+@@ -32,6 +32,8 @@ struct _OaWindow
+     GtkWidget *accounts_label;
+=20
+     GtkWidget *offline_revealer;
++
++    gchar *pending_account_id;
+ };
+=20
+ G_DEFINE_TYPE (OaWindow, oa_window, GTK_TYPE_APPLICATION_WINDOW)
+@@ -102,6 +104,43 @@ show_account (OaWindow   *window,
+     }
+ }
+=20
++static void
++show_account_by_id (OaWindow    *window,
++                    const gchar *account_id)
++{
++    guint n_items;
++    guint i;
++
++    if (window->client =3D=3D NULL)
++    {
++        g_free (window->pending_account_id);
++        window->pending_account_id =3D g_strdup (account_id);
++        return;
++    }
++
++    n_items =3D g_list_model_get_n_items (window->accounts_model);
++
++    for (i =3D 0; i < n_items; i++)
++    {
++        GoaObject *object;
++        GoaAccount *account;
++
++        object =3D g_list_model_get_item (window->accounts_model, i);
++        account =3D goa_object_peek_account (object);
++
++        if (g_strcmp0 (goa_account_get_id (account), account_id) =3D=3D=
 0)
++        {
++            show_account (window, object);
++            g_object_unref (object);
++            return;
++        }
++
++        g_object_unref (object);
++    }
++
++    g_warning ("No account with id '%s'", account_id);
++}
++
+ static void
+ add_account_cb (GoaProvider *provider,
+                 GAsyncResult *res,
+@@ -418,6 +457,15 @@ new_client_cb (GObject *source_object, GAsyncResult=
 *res, gpointer user_data)
+=20
+     populate_accounts (window);
+     goa_provider_get_all (get_all_providers_cb, window);
++
++    if (window->pending_account_id !=3D NULL)
++    {
++        gchar *account_id;
++
++        account_id =3D g_steal_pointer (&window->pending_account_id);
++        show_account_by_id (window, account_id);
++        g_free (account_id);
++    }
+ }
+=20
+ static void
+@@ -440,6 +488,7 @@ oa_window_dispose (GObject *object)
+     }
+=20
+     g_clear_object (&window->client);
++    g_clear_pointer (&window->pending_account_id, g_free);
+=20
+     G_OBJECT_CLASS (oa_window_parent_class)->dispose (object);
+ }
+@@ -507,18 +556,112 @@ oa_window_new (void)
+     return g_object_new (oa_window_get_type (), NULL);
+ }
+=20
++static OaWindow *
++get_window (GtkApplication *app)
++{
++    OaWindow *window;
++    GList *l;
++
++    for (l =3D gtk_application_get_windows (app); l !=3D NULL; l =3D l-=
>next)
++    {
++        if (OA_IS_WINDOW (l->data))
++        {
++            return OA_WINDOW (l->data);
++        }
++    }
++
++    window =3D oa_window_new ();
++    gtk_window_set_application (GTK_WINDOW (window), app);
++
++    return window;
++}
++
+ static void
+ on_app_activate (GtkApplication *app, gpointer user_data)
+ {
+-    static OaWindow *window =3D NULL;
++    gtk_window_present (GTK_WINDOW (get_window (app)));
++}
++
++static void
++launch_panel_activated (GSimpleAction *action,
++                        GVariant      *parameter,
++                        gpointer       user_data)
++{
++    GtkApplication *app =3D GTK_APPLICATION (user_data);
++    OaWindow *window;
++    const gchar *panel_id;
++    GVariant *parameters;
++
++    g_variant_get (parameter, "(&s@av)", &panel_id, &parameters);
+=20
+-    if (window =3D=3D NULL)
++    if (g_strcmp0 (panel_id, "online-accounts") !=3D 0)
+     {
+-        window =3D oa_window_new ();
+-        gtk_window_set_application (GTK_WINDOW (window), app);
++        g_warning ("Panel '%s' is not provided by gnome-online-accounts=
-gtk", panel_id);
++        g_variant_unref (parameters);
++        return;
+     }
+=20
++    window =3D get_window (app);
+     gtk_window_present (GTK_WINDOW (window));
++
++    if (g_variant_n_children (parameters) > 0)
++    {
++        GVariant *value;
++
++        g_variant_get_child (parameters, 0, "v", &value);
++
++        if (g_variant_is_of_type (value, G_VARIANT_TYPE_STRING) &&
++            g_variant_get_string (value, NULL)[0] !=3D '\0')
++        {
++            show_account_by_id (window, g_variant_get_string (value, NU=
LL));
++        }
++
++        g_variant_unref (value);
++    }
++
++    g_variant_unref (parameters);
++}
++
++static const GActionEntry app_actions[] =3D {
++    { "launch-panel", launch_panel_activated, "(sav)", NULL, NULL, { 0 =
} },
++    { "launch-single-panel-mode", launch_panel_activated, "(sav)", NULL=
, NULL, { 0 } },
++};
++
++static void
++on_app_startup (GApplication *app, gpointer user_data)
++{
++    GDBusConnection *connection;
++    GError *error =3D NULL;
++
++    g_action_map_add_action_entries (G_ACTION_MAP (app),
++                                     app_actions,
++                                     G_N_ELEMENTS (app_actions),
++                                     app);
++
++    connection =3D g_application_get_dbus_connection (app);
++
++    if (connection =3D=3D NULL)
++    {
++        return;
++    }
++
++    if (g_dbus_connection_export_action_group (connection,
++                                               "/org/gnome/Settings",
++                                               G_ACTION_GROUP (app),
++                                               &error) =3D=3D 0)
++    {
++        g_warning ("Failed to export actions on /org/gnome/Settings: %s=
", error->message);
++        g_error_free (error);
++        return;
++    }
++
++    g_bus_own_name_on_connection (connection,
++                                  "org.gnome.Settings",
++                                  G_BUS_NAME_OWNER_FLAGS_NONE,
++                                  NULL,
++                                  NULL,
++                                  NULL,
++                                  NULL);
+ }
+=20
+ int main(int argc, char *argv[]) {
+@@ -541,6 +684,7 @@ int main(int argc, char *argv[]) {
+=20
+     g_application_set_option_context_summary (G_APPLICATION (app), "gno=
me-online-accounts-gtk: A GTK Frontend for GNOME Online Accounts");
+=20
++    g_signal_connect (app, "startup", G_CALLBACK (on_app_startup), NULL=
);
+     g_signal_connect (app, "activate", G_CALLBACK (on_app_activate), NU=
LL);
+=20
+     ret =3D g_application_run (G_APPLICATION (app), argc, argv);
diff --git a/meta-gnome/recipes-extended/gnome-online-accounts-gtk/gnome-=
online-accounts-gtk_3.50.10.bb b/meta-gnome/recipes-extended/gnome-online=
-accounts-gtk/gnome-online-accounts-gtk_3.50.10.bb
new file mode 100644
index 0000000000..f69d99a7d3
--- /dev/null
+++ b/meta-gnome/recipes-extended/gnome-online-accounts-gtk/gnome-online-=
accounts-gtk_3.50.10.bb
@@ -0,0 +1,29 @@
+# AI-Generated: Uses Claude Code (Claude Fable 5.1)
+SUMMARY =3D "GTK frontend for configuring GNOME Online Accounts"
+DESCRIPTION =3D "Standalone GTK4/libadwaita application to add and manag=
e \
+GNOME Online Accounts on desktops that do not ship gnome-control-center.=
"
+HOMEPAGE =3D "https://github.com/xapp-project/gnome-online-accounts-gtk"
+SECTION =3D "x11/gnome"
+LICENSE =3D "GPL-3.0-or-later"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
+
+DEPENDS =3D " \
+    glib-2.0 \
+    glib-2.0-native \
+    gnome-online-accounts \
+    gtk4 \
+    libadwaita \
+    libxml2-native \
+"
+
+SRC_URI =3D " \
+    git://github.com/xapp-project/gnome-online-accounts-gtk.git;protocol=
=3Dhttps;branch=3Dmaster \
+    file://0001-Provide-the-org.gnome.Settings-launch-panel-interface.pa=
tch \
+"
+SRCREV =3D "b42482522bc9089c139ceda9b8a7d81a7a149cf9"
+
+inherit meson pkgconfig gettext gtk-icon-cache
+
+FILES:${PN} +=3D "${datadir}/dbus-1/services"
+
+RCONFLICTS:${PN} +=3D "gnome-control-center"
--=20
2.55.0


