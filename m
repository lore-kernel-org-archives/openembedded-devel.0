Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F45C79F9E
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 17:49:54 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18537.1788716970685894896
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Sep 2026 10:49:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=GSh++Lko;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout01.t-online.de (Postfix) with SMTP id 7B38F1BC8B
	for <openembedded-devel@lists.openembedded.org>; Sun,  6 Sep 2026 19:49:28 +0200 (CEST)
Received: from [192.168.178.36] ([84.163.35.20]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x3Gzg-1JKcrY0; Sun, 6 Sep 2026 19:49:28 +0200
Date: Sun, 06 Sep 2026 19:49:22 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCHv2 1/2] gnome-online-accounts-gtk: add
 recipe
To: openembedded-devel@lists.openembedded.org
Message-Id: <AUEYKT.V1T675ULL6JK1@t-online.de>
In-Reply-To: <18D2CC82D820CCCA.4159725@lists.openembedded.org>
References: <18D2CC82D820CCCA.4159725@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-XzMfkuDgXGQeC7trA+9V"
X-TOI-EXPURGATEID: 150726::1788716968-F37FD9D1-FDCA53D9/0/0 CLEAN NORMAL
X-TOI-MSGID: 892285ab-996a-479a-a035-42b7be75e6ed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788716968; i=f_l_k@t-online.de;
	bh=bmUr+joEBUonYylGt40ZEZ6j3DJsyN+BAV6SxRTjLY4=;
	h=Date:From:Subject:To:In-Reply-To:References;
	b=GSh++LkoFXOvEMgjPkWbo/25vHnKyG7npEBm/oYCHQCQcTl0pF9/F4jPrgO4xjsOD
	 rbEFGBV9FtS8ZQ7TeY04qQuNcO+QB1IbVXxbhXNPha6OYMl8ujJ8jVJjvySmC7V/n1
	 cbhu7WVuusyvVKWP9qhHqXauGFcpJ4h/1OLNU+MAZKPDldDn7nmnCACq+oHfMpguMu
	 X8capMT+hfTi7Dz3uQEP1arfs2eU51aAKIMLFsU0pHEoi+HksqHxovq8rC0IUaAaWe
	 WTk62lQUrYqPvo7AgBd+acTsUbLeOTCMwKtyMUJ/zB6sLIrkhq0byQ7p1DwBqT1fno
	 P738P9y66ga4w==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Sep 2026 17:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129798

--=-XzMfkuDgXGQeC7trA+9V
Content-Type: text/plain; charset=us-ascii; format=flowed

v2: add missing signed-off:

On Sun, Sep 6 2026 at 19:47:28 +02:00:00, Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
> GNOME Online Accounts only provides the daemon and library that
> applications such as gnome-calendar, gnome-contacts and evolution use
> for their calendar, mail and contact accounts. The only user interface
> for adding accounts is the online-accounts panel of 
> gnome-control-center,
> which pulls in gnome-shell and its settings daemon. Desktops built on
> wlroots compositors or other GTK environments have no way to configure
> these accounts at all.
> 
> gnome-online-accounts-gtk from the xapp project is a standalone GTK4 
> and
> libadwaita application for exactly that job and works without GNOME
> Shell.
> 
> GNOME applications open the accounts settings by activating the
> "launch-panel" action of org.gnome.Settings on the session bus. The
> included patch provides that name and action from
> gnome-online-accounts-gtk together with a D-Bus service file, so these
> buttons work here too. Since only one package can own the bus name, 
> the
> package conflicts with gnome-control-center.
> 
> Build tested on corei7-64.
> 
> AI-Generated: Uses Claude Code (Claude Fable 5.1)
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  ...nome.Settings-launch-panel-interface.patch | 261 
> ++++++++++++++++++
>  .../gnome-online-accounts-gtk_3.50.10.bb      |  29 ++
>  2 files changed, 290 insertions(+)
>  create mode 100644 
> meta-gnome/recipes-extended/gnome-online-accounts-gtk/files/0001-Provide-the-org.gnome.Settings-launch-panel-interface.patch
>  create mode 100644 
> meta-gnome/recipes-extended/gnome-online-accounts-gtk/gnome-online-accounts-gtk_3.50.10.bb
> 
> diff --git 
> a/meta-gnome/recipes-extended/gnome-online-accounts-gtk/files/0001-Provide-the-org.gnome.Settings-launch-panel-interface.patch 
> b/meta-gnome/recipes-extended/gnome-online-accounts-gtk/files/0001-Provide-the-org.gnome.Settings-launch-panel-interface.patch
> new file mode 100644
> index 0000000000..c352138985
> --- /dev/null
> +++ 
> b/meta-gnome/recipes-extended/gnome-online-accounts-gtk/files/0001-Provide-the-org.gnome.Settings-launch-panel-interface.patch
> @@ -0,0 +1,261 @@
> +From 08e3b37df99f89c8e36cea80304e2bc1f2986659 Mon Sep 17 00:00:00 
> 2001
> +From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> +Date: Sun, 6 Sep 2026 18:36:48 +0200
> +Subject: [PATCH] Provide the org.gnome.Settings launch-panel 
> interface
> +
> +GNOME applications such as gnome-calendar, gnome-contacts or 
> evolution
> +open the online accounts settings by activating the "launch-panel"
> +action of org.gnome.Settings on the session bus, which is only 
> provided
> +by gnome-control-center. On desktops that ship 
> gnome-online-accounts-gtk
> +instead, these buttons silently do nothing.
> +
> +Export the application actions on /org/gnome/Settings as well, own 
> the
> +org.gnome.Settings name once the application has started and install 
> a
> +D-Bus service file so the application gets activated on demand. The
> +"online-accounts" panel presents the main window; when an account id 
> is
> +passed as the first argument, the matching account is opened, 
> mirroring
> +the behaviour of the gnome-control-center panel. Other panel ids are
> +ignored with a warning.
> +
> +Upstream-Status: Pending
> +AI-Generated: Uses Claude Code (Claude Fable 5.1)
> +---
> + data/meson.build                   |   8 ++
> + data/org.gnome.Settings.service.in |   3 +
> + src/gnome-online-accounts-gtk.c    | 152 
> ++++++++++++++++++++++++++++-
> + 3 files changed, 159 insertions(+), 4 deletions(-)
> + create mode 100644 data/org.gnome.Settings.service.in
> +
> +diff --git a/data/meson.build b/data/meson.build
> +index deadf44..71e27aa 100644
> +--- a/data/meson.build
> ++++ b/data/meson.build
> +@@ -24,4 +24,12 @@ i18n.merge_file(
> +    install_dir: datadir / 'applications'
> + )
> +
> ++configure_file(
> ++  input: 'org.gnome.Settings.service.in',
> ++  output: 'org.gnome.Settings.service',
> ++  configuration: bin_conf,
> ++  install: true,
> ++  install_dir: datadir / 'dbus-1' / 'services',
> ++)
> ++
> + subdir('icons')
> +\ No newline at end of file
> +diff --git a/data/org.gnome.Settings.service.in 
> b/data/org.gnome.Settings.service.in
> +new file mode 100644
> +index 0000000..ab4b5a1
> +--- /dev/null
> ++++ b/data/org.gnome.Settings.service.in
> +@@ -0,0 +1,3 @@
> ++[D-BUS Service]
> ++Name=org.gnome.Settings
> ++Exec=@bindir@/gnome-online-accounts-gtk --gapplication-service
> +diff --git a/src/gnome-online-accounts-gtk.c 
> b/src/gnome-online-accounts-gtk.c
> +index 25bd116..60d3472 100644
> +--- a/src/gnome-online-accounts-gtk.c
> ++++ b/src/gnome-online-accounts-gtk.c
> +@@ -32,6 +32,8 @@ struct _OaWindow
> +     GtkWidget *accounts_label;
> +
> +     GtkWidget *offline_revealer;
> ++
> ++    gchar *pending_account_id;
> + };
> +
> + G_DEFINE_TYPE (OaWindow, oa_window, GTK_TYPE_APPLICATION_WINDOW)
> +@@ -102,6 +104,43 @@ show_account (OaWindow   *window,
> +     }
> + }
> +
> ++static void
> ++show_account_by_id (OaWindow    *window,
> ++                    const gchar *account_id)
> ++{
> ++    guint n_items;
> ++    guint i;
> ++
> ++    if (window->client == NULL)
> ++    {
> ++        g_free (window->pending_account_id);
> ++        window->pending_account_id = g_strdup (account_id);
> ++        return;
> ++    }
> ++
> ++    n_items = g_list_model_get_n_items (window->accounts_model);
> ++
> ++    for (i = 0; i < n_items; i++)
> ++    {
> ++        GoaObject *object;
> ++        GoaAccount *account;
> ++
> ++        object = g_list_model_get_item (window->accounts_model, i);
> ++        account = goa_object_peek_account (object);
> ++
> ++        if (g_strcmp0 (goa_account_get_id (account), account_id) == 
> 0)
> ++        {
> ++            show_account (window, object);
> ++            g_object_unref (object);
> ++            return;
> ++        }
> ++
> ++        g_object_unref (object);
> ++    }
> ++
> ++    g_warning ("No account with id '%s'", account_id);
> ++}
> ++
> + static void
> + add_account_cb (GoaProvider *provider,
> +                 GAsyncResult *res,
> +@@ -418,6 +457,15 @@ new_client_cb (GObject *source_object, 
> GAsyncResult *res, gpointer user_data)
> +
> +     populate_accounts (window);
> +     goa_provider_get_all (get_all_providers_cb, window);
> ++
> ++    if (window->pending_account_id != NULL)
> ++    {
> ++        gchar *account_id;
> ++
> ++        account_id = g_steal_pointer (&window->pending_account_id);
> ++        show_account_by_id (window, account_id);
> ++        g_free (account_id);
> ++    }
> + }
> +
> + static void
> +@@ -440,6 +488,7 @@ oa_window_dispose (GObject *object)
> +     }
> +
> +     g_clear_object (&window->client);
> ++    g_clear_pointer (&window->pending_account_id, g_free);
> +
> +     G_OBJECT_CLASS (oa_window_parent_class)->dispose (object);
> + }
> +@@ -507,18 +556,112 @@ oa_window_new (void)
> +     return g_object_new (oa_window_get_type (), NULL);
> + }
> +
> ++static OaWindow *
> ++get_window (GtkApplication *app)
> ++{
> ++    OaWindow *window;
> ++    GList *l;
> ++
> ++    for (l = gtk_application_get_windows (app); l != NULL; l = 
> l->next)
> ++    {
> ++        if (OA_IS_WINDOW (l->data))
> ++        {
> ++            return OA_WINDOW (l->data);
> ++        }
> ++    }
> ++
> ++    window = oa_window_new ();
> ++    gtk_window_set_application (GTK_WINDOW (window), app);
> ++
> ++    return window;
> ++}
> ++
> + static void
> + on_app_activate (GtkApplication *app, gpointer user_data)
> + {
> +-    static OaWindow *window = NULL;
> ++    gtk_window_present (GTK_WINDOW (get_window (app)));
> ++}
> ++
> ++static void
> ++launch_panel_activated (GSimpleAction *action,
> ++                        GVariant      *parameter,
> ++                        gpointer       user_data)
> ++{
> ++    GtkApplication *app = GTK_APPLICATION (user_data);
> ++    OaWindow *window;
> ++    const gchar *panel_id;
> ++    GVariant *parameters;
> ++
> ++    g_variant_get (parameter, "(&s@av)", &panel_id, &parameters);
> +
> +-    if (window == NULL)
> ++    if (g_strcmp0 (panel_id, "online-accounts") != 0)
> +     {
> +-        window = oa_window_new ();
> +-        gtk_window_set_application (GTK_WINDOW (window), app);
> ++        g_warning ("Panel '%s' is not provided by 
> gnome-online-accounts-gtk", panel_id);
> ++        g_variant_unref (parameters);
> ++        return;
> +     }
> +
> ++    window = get_window (app);
> +     gtk_window_present (GTK_WINDOW (window));
> ++
> ++    if (g_variant_n_children (parameters) > 0)
> ++    {
> ++        GVariant *value;
> ++
> ++        g_variant_get_child (parameters, 0, "v", &value);
> ++
> ++        if (g_variant_is_of_type (value, G_VARIANT_TYPE_STRING) &&
> ++            g_variant_get_string (value, NULL)[0] != '\0')
> ++        {
> ++            show_account_by_id (window, g_variant_get_string 
> (value, NULL));
> ++        }
> ++
> ++        g_variant_unref (value);
> ++    }
> ++
> ++    g_variant_unref (parameters);
> ++}
> ++
> ++static const GActionEntry app_actions[] = {
> ++    { "launch-panel", launch_panel_activated, "(sav)", NULL, NULL, 
> { 0 } },
> ++    { "launch-single-panel-mode", launch_panel_activated, "(sav)", 
> NULL, NULL, { 0 } },
> ++};
> ++
> ++static void
> ++on_app_startup (GApplication *app, gpointer user_data)
> ++{
> ++    GDBusConnection *connection;
> ++    GError *error = NULL;
> ++
> ++    g_action_map_add_action_entries (G_ACTION_MAP (app),
> ++                                     app_actions,
> ++                                     G_N_ELEMENTS (app_actions),
> ++                                     app);
> ++
> ++    connection = g_application_get_dbus_connection (app);
> ++
> ++    if (connection == NULL)
> ++    {
> ++        return;
> ++    }
> ++
> ++    if (g_dbus_connection_export_action_group (connection,
> ++                                               
> "/org/gnome/Settings",
> ++                                               G_ACTION_GROUP (app),
> ++                                               &error) == 0)
> ++    {
> ++        g_warning ("Failed to export actions on 
> /org/gnome/Settings: %s", error->message);
> ++        g_error_free (error);
> ++        return;
> ++    }
> ++
> ++    g_bus_own_name_on_connection (connection,
> ++                                  "org.gnome.Settings",
> ++                                  G_BUS_NAME_OWNER_FLAGS_NONE,
> ++                                  NULL,
> ++                                  NULL,
> ++                                  NULL,
> ++                                  NULL);
> + }
> +
> + int main(int argc, char *argv[]) {
> +@@ -541,6 +684,7 @@ int main(int argc, char *argv[]) {
> +
> +     g_application_set_option_context_summary (G_APPLICATION (app), 
> "gnome-online-accounts-gtk: A GTK Frontend for GNOME Online 
> Accounts");
> +
> ++    g_signal_connect (app, "startup", G_CALLBACK (on_app_startup), 
> NULL);
> +     g_signal_connect (app, "activate", G_CALLBACK 
> (on_app_activate), NULL);
> +
> +     ret = g_application_run (G_APPLICATION (app), argc, argv);
> diff --git 
> a/meta-gnome/recipes-extended/gnome-online-accounts-gtk/gnome-online-accounts-gtk_3.50.10.bb 
> b/meta-gnome/recipes-extended/gnome-online-accounts-gtk/gnome-online-accounts-gtk_3.50.10.bb
> new file mode 100644
> index 0000000000..f69d99a7d3
> --- /dev/null
> +++ 
> b/meta-gnome/recipes-extended/gnome-online-accounts-gtk/gnome-online-accounts-gtk_3.50.10.bb
> @@ -0,0 +1,29 @@
> +# AI-Generated: Uses Claude Code (Claude Fable 5.1)
> +SUMMARY = "GTK frontend for configuring GNOME Online Accounts"
> +DESCRIPTION = "Standalone GTK4/libadwaita application to add and 
> manage \
> +GNOME Online Accounts on desktops that do not ship 
> gnome-control-center."
> +HOMEPAGE = 
> "<https://github.com/xapp-project/gnome-online-accounts-gtk>"
> +SECTION = "x11/gnome"
> +LICENSE = "GPL-3.0-or-later"
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504" 
> <file://copying;md5=d32239bcb673463ab874e80d47fae504/>
> +
> +DEPENDS = " \
> +    glib-2.0 \
> +    glib-2.0-native \
> +    gnome-online-accounts \
> +    gtk4 \
> +    libadwaita \
> +    libxml2-native \
> +"
> +
> +SRC_URI = " \
> +    
> git://github.com/xapp-project/gnome-online-accounts-gtk.git;protocol=https;branch=master 
> \
> +    
> file://0001-Provide-the-org.gnome.Settings-launch-panel-interface.patch 
> <file://0001-provide-the-org.gnome.settings-launch-panel-interface.patch/> 
> \
> +"
> +SRCREV = "b42482522bc9089c139ceda9b8a7d81a7a149cf9"
> +
> +inherit meson pkgconfig gettext gtk-icon-cache
> +
> +FILES:${PN} += "${datadir}/dbus-1/services"
> +
> +RCONFLICTS:${PN} += "gnome-control-center"
> --
> 2.55.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#129797): 
> <https://lists.openembedded.org/g/openembedded-devel/message/129797>
> Mute This Topic: <https://lists.openembedded.org/mt/121117841/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-XzMfkuDgXGQeC7trA+9V
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2: add missing signed-off:</div></div><div id="geary-quote" dir="auto"><br>On Sun, Sep 6 2026 at 19:47:28 +02:00:00, Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">GNOME Online Accounts only provides the daemon and library that
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
Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 ...nome.Settings-launch-panel-interface.patch | 261 ++++++++++++++++++
 .../gnome-online-accounts-gtk_3.50.10.bb      |  29 ++
 2 files changed, 290 insertions(+)
 create mode 100644 meta-gnome/recipes-extended/gnome-online-accounts-gtk/files/0001-Provide-the-org.gnome.Settings-launch-panel-interface.patch
 create mode 100644 meta-gnome/recipes-extended/gnome-online-accounts-gtk/gnome-online-accounts-gtk_3.50.10.bb

diff --git a/meta-gnome/recipes-extended/gnome-online-accounts-gtk/files/0001-Provide-the-org.gnome.Settings-launch-panel-interface.patch b/meta-gnome/recipes-extended/gnome-online-accounts-gtk/files/0001-Provide-the-org.gnome.Settings-launch-panel-interface.patch
new file mode 100644
index 0000000000..c352138985
--- /dev/null
+++ b/meta-gnome/recipes-extended/gnome-online-accounts-gtk/files/0001-Provide-the-org.gnome.Settings-launch-panel-interface.patch
@@ -0,0 +1,261 @@
+From 08e3b37df99f89c8e36cea80304e2bc1f2986659 Mon Sep 17 00:00:00 2001
+From: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
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
+ 
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
+diff --git a/data/org.gnome.Settings.service.in b/data/org.gnome.Settings.service.in
+new file mode 100644
+index 0000000..ab4b5a1
+--- /dev/null
++++ b/data/org.gnome.Settings.service.in
+@@ -0,0 +1,3 @@
++[D-BUS Service]
++Name=org.gnome.Settings
++Exec=@bindir@/gnome-online-accounts-gtk --gapplication-service
+diff --git a/src/gnome-online-accounts-gtk.c b/src/gnome-online-accounts-gtk.c
+index 25bd116..60d3472 100644
+--- a/src/gnome-online-accounts-gtk.c
++++ b/src/gnome-online-accounts-gtk.c
+@@ -32,6 +32,8 @@ struct _OaWindow
+     GtkWidget *accounts_label;
+ 
+     GtkWidget *offline_revealer;
++
++    gchar *pending_account_id;
+ };
+ 
+ G_DEFINE_TYPE (OaWindow, oa_window, GTK_TYPE_APPLICATION_WINDOW)
+@@ -102,6 +104,43 @@ show_account (OaWindow   *window,
+     }
+ }
+ 
++static void
++show_account_by_id (OaWindow    *window,
++                    const gchar *account_id)
++{
++    guint n_items;
++    guint i;
++
++    if (window-&gt;client == NULL)
++    {
++        g_free (window-&gt;pending_account_id);
++        window-&gt;pending_account_id = g_strdup (account_id);
++        return;
++    }
++
++    n_items = g_list_model_get_n_items (window-&gt;accounts_model);
++
++    for (i = 0; i &lt; n_items; i++)
++    {
++        GoaObject *object;
++        GoaAccount *account;
++
++        object = g_list_model_get_item (window-&gt;accounts_model, i);
++        account = goa_object_peek_account (object);
++
++        if (g_strcmp0 (goa_account_get_id (account), account_id) == 0)
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
+@@ -418,6 +457,15 @@ new_client_cb (GObject *source_object, GAsyncResult *res, gpointer user_data)
+ 
+     populate_accounts (window);
+     goa_provider_get_all (get_all_providers_cb, window);
++
++    if (window-&gt;pending_account_id != NULL)
++    {
++        gchar *account_id;
++
++        account_id = g_steal_pointer (&amp;window-&gt;pending_account_id);
++        show_account_by_id (window, account_id);
++        g_free (account_id);
++    }
+ }
+ 
+ static void
+@@ -440,6 +488,7 @@ oa_window_dispose (GObject *object)
+     }
+ 
+     g_clear_object (&amp;window-&gt;client);
++    g_clear_pointer (&amp;window-&gt;pending_account_id, g_free);
+ 
+     G_OBJECT_CLASS (oa_window_parent_class)-&gt;dispose (object);
+ }
+@@ -507,18 +556,112 @@ oa_window_new (void)
+     return g_object_new (oa_window_get_type (), NULL);
+ }
+ 
++static OaWindow *
++get_window (GtkApplication *app)
++{
++    OaWindow *window;
++    GList *l;
++
++    for (l = gtk_application_get_windows (app); l != NULL; l = l-&gt;next)
++    {
++        if (OA_IS_WINDOW (l-&gt;data))
++        {
++            return OA_WINDOW (l-&gt;data);
++        }
++    }
++
++    window = oa_window_new ();
++    gtk_window_set_application (GTK_WINDOW (window), app);
++
++    return window;
++}
++
+ static void
+ on_app_activate (GtkApplication *app, gpointer user_data)
+ {
+-    static OaWindow *window = NULL;
++    gtk_window_present (GTK_WINDOW (get_window (app)));
++}
++
++static void
++launch_panel_activated (GSimpleAction *action,
++                        GVariant      *parameter,
++                        gpointer       user_data)
++{
++    GtkApplication *app = GTK_APPLICATION (user_data);
++    OaWindow *window;
++    const gchar *panel_id;
++    GVariant *parameters;
++
++    g_variant_get (parameter, "(&amp;s@av)", &amp;panel_id, &amp;parameters);
+ 
+-    if (window == NULL)
++    if (g_strcmp0 (panel_id, "online-accounts") != 0)
+     {
+-        window = oa_window_new ();
+-        gtk_window_set_application (GTK_WINDOW (window), app);
++        g_warning ("Panel '%s' is not provided by gnome-online-accounts-gtk", panel_id);
++        g_variant_unref (parameters);
++        return;
+     }
+ 
++    window = get_window (app);
+     gtk_window_present (GTK_WINDOW (window));
++
++    if (g_variant_n_children (parameters) &gt; 0)
++    {
++        GVariant *value;
++
++        g_variant_get_child (parameters, 0, "v", &amp;value);
++
++        if (g_variant_is_of_type (value, G_VARIANT_TYPE_STRING) &amp;&amp;
++            g_variant_get_string (value, NULL)[0] != '\0')
++        {
++            show_account_by_id (window, g_variant_get_string (value, NULL));
++        }
++
++        g_variant_unref (value);
++    }
++
++    g_variant_unref (parameters);
++}
++
++static const GActionEntry app_actions[] = {
++    { "launch-panel", launch_panel_activated, "(sav)", NULL, NULL, { 0 } },
++    { "launch-single-panel-mode", launch_panel_activated, "(sav)", NULL, NULL, { 0 } },
++};
++
++static void
++on_app_startup (GApplication *app, gpointer user_data)
++{
++    GDBusConnection *connection;
++    GError *error = NULL;
++
++    g_action_map_add_action_entries (G_ACTION_MAP (app),
++                                     app_actions,
++                                     G_N_ELEMENTS (app_actions),
++                                     app);
++
++    connection = g_application_get_dbus_connection (app);
++
++    if (connection == NULL)
++    {
++        return;
++    }
++
++    if (g_dbus_connection_export_action_group (connection,
++                                               "/org/gnome/Settings",
++                                               G_ACTION_GROUP (app),
++                                               &amp;error) == 0)
++    {
++        g_warning ("Failed to export actions on /org/gnome/Settings: %s", error-&gt;message);
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
+ 
+ int main(int argc, char *argv[]) {
+@@ -541,6 +684,7 @@ int main(int argc, char *argv[]) {
+ 
+     g_application_set_option_context_summary (G_APPLICATION (app), "gnome-online-accounts-gtk: A GTK Frontend for GNOME Online Accounts");
+ 
++    g_signal_connect (app, "startup", G_CALLBACK (on_app_startup), NULL);
+     g_signal_connect (app, "activate", G_CALLBACK (on_app_activate), NULL);
+ 
+     ret = g_application_run (G_APPLICATION (app), argc, argv);
diff --git a/meta-gnome/recipes-extended/gnome-online-accounts-gtk/gnome-online-accounts-gtk_3.50.10.bb b/meta-gnome/recipes-extended/gnome-online-accounts-gtk/gnome-online-accounts-gtk_3.50.10.bb
new file mode 100644
index 0000000000..f69d99a7d3
--- /dev/null
+++ b/meta-gnome/recipes-extended/gnome-online-accounts-gtk/gnome-online-accounts-gtk_3.50.10.bb
@@ -0,0 +1,29 @@
+# AI-Generated: Uses Claude Code (Claude Fable 5.1)
+SUMMARY = "GTK frontend for configuring GNOME Online Accounts"
+DESCRIPTION = "Standalone GTK4/libadwaita application to add and manage \
+GNOME Online Accounts on desktops that do not ship gnome-control-center."
+HOMEPAGE = "<a href="https://github.com/xapp-project/gnome-online-accounts-gtk">https://github.com/xapp-project/gnome-online-accounts-gtk</a>"
+SECTION = "x11/gnome"
+LICENSE = "GPL-3.0-or-later"
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=d32239bcb673463ab874e80d47fae504" "="">file://COPYING;md5=d32239bcb673463ab874e80d47fae504"</a>
+
+DEPENDS = " \
+    glib-2.0 \
+    glib-2.0-native \
+    gnome-online-accounts \
+    gtk4 \
+    libadwaita \
+    libxml2-native \
+"
+
+SRC_URI = " \
+    git://github.com/xapp-project/gnome-online-accounts-gtk.git;protocol=https;branch=master \
+    <a href="file://0001-Provide-the-org.gnome.Settings-launch-panel-interface.patch">file://0001-Provide-the-org.gnome.Settings-launch-panel-interface.patch</a> \
+"
+SRCREV = "b42482522bc9089c139ceda9b8a7d81a7a149cf9"
+
+inherit meson pkgconfig gettext gtk-icon-cache
+
+FILES:${PN} += "${datadir}/dbus-1/services"
+
+RCONFLICTS:${PN} += "gnome-control-center"
<div>-- 
</div>2.55.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#129797): <a href="https://lists.openembedded.org/g/openembedded-devel/message/129797">https://lists.openembedded.org/g/openembedded-devel/message/129797</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/121117841/3618223">https://lists.openembedded.org/mt/121117841/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-XzMfkuDgXGQeC7trA+9V--


