Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F36C79F99
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 21:08:54 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21412.1788728927830545365
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Sep 2026 14:08:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=V1EIsWK9;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-46aef6e48fbso1683869fac.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Sep 2026 14:08:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788728927; cv=none;
        d=google.com; s=arc-20260327;
        b=F7V3j1CaUu3zuQ8SJI/0YdSmRHNdYmOVvziCCvAsP6PMfWDVfFSkiWkIDyJfQqAYsY
         zoeTCTvtMzK+Dmq+aaCqWBXhWKUPfmGmq0THErPRjl/i+2Pp3wBNAFlBC9kNKCAPBD08
         aSu2len4m9niinSSsjiWvXVTV6l5VYw0ko72nV5sm16Oz8kUextDQn1U3V9s3ZBA/d1f
         JSvAG3LMWvcYingLPJ44D1lwNRVQ32umtrbdVh3bRbxxhtnD1MB6pum4rpiEz+sh2IGY
         VR1eWp6VZkjvnEmijZCS4wZQwY5Dd7jqd3cSYCqjQbLUsahlRBATF8d5Tc8x/Mj78uGl
         cVfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6kymiMRIUr9Q14imD/av/gIlsZg3jJsd4GyLV1YAnfo=;
        fh=LZspYXC3IzyIN8FmVwz229n7pZIWt1HqVNc3WYXGu+o=;
        b=l2+7YVJCSDn3wRqt3xz/l7JnTCZXivXfrIGCBG1AxGAy09zI/VwY50HXTuKPZ3Blis
         6at9fPQdxuLvZL9D04Ernc5gbAbM9q/cJl+Q8oBGE1gL4C8EfWOrPAvZdKxPHEtNMusE
         ajCO5S1H6x8LZgXfP5a1Fqm5DXe7vG7nf6zrnivBP3/UveynLuEQah//Llcb3Pr34+s+
         ptimmm42x8jenXu9Hk/a7u/V8vHVHdFav2au91oAg/o6Dggma2JqikO/c8gYT+tAN4TG
         oOLUgKoz7KeDHOFu9WMcX5MXE2WXKRA816uHzFCzU1NbQxqu1Jz6cBKupRSkej871DVn
         15Zw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788728927; x=1789333727; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6kymiMRIUr9Q14imD/av/gIlsZg3jJsd4GyLV1YAnfo=;
        b=V1EIsWK9asHWPw5fEOnhGeQDxfcB6f/JMkcPRXZikA8JQErcCZvjZTKb6YXGnHHLsY
         quXt/8bl6Q3GXk0gMNKiz+uYwyeZz49RgvK5imTZqAivKhRz+YldQ/ro1AaNZqJt6g2k
         TgccP67p1yY0s+jqbtJDBpeNDxVBlQ4S/W9uZjsAXrMegAezDuzlNV1vKJ3GY0hK/fhD
         ZQIJY183VPGvbMMtQ9954yM5Nf9J7J5ay7UcIIh5PKBjtE0bMbalGg8ujWbjitqhrzb0
         SrC1zhveQ9P8x2PBpba/o7xohvG/fKlJh/8oc2O9mKQ1+aGAPRcr8mHgvyySrEGUtNzs
         FD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788728927; x=1789333727;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6kymiMRIUr9Q14imD/av/gIlsZg3jJsd4GyLV1YAnfo=;
        b=aFxR6MMs1yOCmZgZxiaN4wECdEmb6G8IPmpxBkCtjjrrZ34JPeFF+sQpauW9U5bBCg
         8YsKSj91oLcT9/OrVKWDZmSE0Lt2r3Am71NozucU/OcbP0p/7DfDs4qYnAVX/26PFy8A
         KXWtqvr/qFPr3Yv11pcQEFEIvx8mfw7Xupqv0AA/9/eUfZLEIuzYyffio42WzACtPm3E
         VsFMqONyP/USe+jjgnZVUdJRBEmnOgtYzKTaLGCD+MWGUtKlMkvYHGH97lvkCtCr9KM6
         al7XFKblthBggVxh58sF83s1jIonKSU8ZYaKNLW6p+1T4412rIc8pJohovayyv1zf/TX
         rIiQ==
X-Gm-Message-State: AFuF++mHbKblTWvvT93xFk6CycM9u/IHjs9aIgpUicWfNXtJlEHZ8ZJo
	XJwLlvCePIQw7S29awTEQyr3QZ04IRrE4Ilj4x1wKRCNy2xrvSl6EoDJ8XxzgfIktWaeP31Jz09
	5L9Jkc8wZ2Fu7w3WB+KtbMDzPZv84PwUQyA==
X-Gm-Gg: AYBFou1X2oLjcyiQ5mz8pLk32mfMs3AT2zQvq0S01FLvcwsNmMkMUYN2wZKnNsznGDC
	hDdBJRXw7sZEeM33d/wGcsuVGaGIlwo2frR2HfzH3dgOtfYeTSHerNbkq7blHAygC+FIx3VXHGj
	V7XwXIZm7GkV0pUAqwdWdunltRNipt474mZ1QKd5oGyn9DkvNFGx8e+PCOwuiVZ8+edv50GMtM/
	8BLy3lYy6fI7DafyoCAm77Oxf62vOEpDMv4SrYcxl00LSspregIL4puVG6aAWTI8BnBUFm5cxL1
	PlUlnW04BWiQ8oq4k4lJ5EWzfzlfveeuMjmkZbRWiEkvfJ0=
X-Received: by 2002:a05:6871:c301:b0:457:494b:1548 with SMTP id
 586e51a60fabf-475516ed3a3mr26216141fac.5.1788728926890; Sun, 06 Sep 2026
 14:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260906174729.209553-1-f_l_k@t-online.de>
In-Reply-To: <20260906174729.209553-1-f_l_k@t-online.de>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 7 Sep 2026 09:08:35 +1200
X-Gm-Features: AcwNN1WOYUSO-AHbkP-fCLgsEamJNxX27_fKZD1buhtq3xlocMBRATZbCMBT9X4
Message-ID: <CADySD0HopGjgnYmRUNVEo-gSmG9hXqANU=a=8rtPOkB3=yjcnA@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCHv2 1/2] gnome-online-accounts-gtk: add recipe
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Sep 2026 21:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129799

On Mon, Sep 7, 2026 at 5:47=E2=80=AFAM Markus Volk via lists.openembedded.o=
rg
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> GNOME Online Accounts only provides the daemon and library that
> applications such as gnome-calendar, gnome-contacts and evolution use
> for their calendar, mail and contact accounts. The only user interface
> for adding accounts is the online-accounts panel of gnome-control-center,
> which pulls in gnome-shell and its settings daemon. Desktops built on
> wlroots compositors or other GTK environments have no way to configure
> these accounts at all.
>
> gnome-online-accounts-gtk from the xapp project is a standalone GTK4 and
> libadwaita application for exactly that job and works without GNOME
> Shell.
>
> GNOME applications open the accounts settings by activating the
> "launch-panel" action of org.gnome.Settings on the session bus. The
> included patch provides that name and action from
> gnome-online-accounts-gtk together with a D-Bus service file, so these
> buttons work here too. Since only one package can own the bus name, the
> package conflicts with gnome-control-center.
>
> Build tested on corei7-64.
>
> AI-Generated: Uses Claude Code (Claude Fable 5.1)
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...nome.Settings-launch-panel-interface.patch | 261 ++++++++++++++++++
>  .../gnome-online-accounts-gtk_3.50.10.bb      |  29 ++
>  2 files changed, 290 insertions(+)
>  create mode 100644 meta-gnome/recipes-extended/gnome-online-accounts-gtk=
/files/0001-Provide-the-org.gnome.Settings-launch-panel-interface.patch
>  create mode 100644 meta-gnome/recipes-extended/gnome-online-accounts-gtk=
/gnome-online-accounts-gtk_3.50.10.bb
>
> diff --git a/meta-gnome/recipes-extended/gnome-online-accounts-gtk/files/=
0001-Provide-the-org.gnome.Settings-launch-panel-interface.patch b/meta-gno=
me/recipes-extended/gnome-online-accounts-gtk/files/0001-Provide-the-org.gn=
ome.Settings-launch-panel-interface.patch
> new file mode 100644
> index 0000000000..c352138985
> --- /dev/null
> +++ b/meta-gnome/recipes-extended/gnome-online-accounts-gtk/files/0001-Pr=
ovide-the-org.gnome.Settings-launch-panel-interface.patch
> @@ -0,0 +1,261 @@
> +From 08e3b37df99f89c8e36cea80304e2bc1f2986659 Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Sun, 6 Sep 2026 18:36:48 +0200
> +Subject: [PATCH] Provide the org.gnome.Settings launch-panel interface
> +
> +GNOME applications such as gnome-calendar, gnome-contacts or evolution
> +open the online accounts settings by activating the "launch-panel"
> +action of org.gnome.Settings on the session bus, which is only provided
> +by gnome-control-center. On desktops that ship gnome-online-accounts-gtk
> +instead, these buttons silently do nothing.
> +
> +Export the application actions on /org/gnome/Settings as well, own the
> +org.gnome.Settings name once the application has started and install a
> +D-Bus service file so the application gets activated on demand. The
> +"online-accounts" panel presents the main window; when an account id is
> +passed as the first argument, the matching account is opened, mirroring
> +the behaviour of the gnome-control-center panel. Other panel ids are
> +ignored with a warning.
> +
> +Upstream-Status: Pending
> +AI-Generated: Uses Claude Code (Claude Fable 5.1)
> +---
> + data/meson.build                   |   8 ++
> + data/org.gnome.Settings.service.in |   3 +
> + src/gnome-online-accounts-gtk.c    | 152 ++++++++++++++++++++++++++++-
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
> +diff --git a/data/org.gnome.Settings.service.in b/data/org.gnome.Setting=
s.service.in
> +new file mode 100644
> +index 0000000..ab4b5a1
> +--- /dev/null
> ++++ b/data/org.gnome.Settings.service.in
> +@@ -0,0 +1,3 @@
> ++[D-BUS Service]
> ++Name=3Dorg.gnome.Settings
> ++Exec=3D@bindir@/gnome-online-accounts-gtk --gapplication-service
> +diff --git a/src/gnome-online-accounts-gtk.c b/src/gnome-online-accounts=
-gtk.c
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
> ++    if (window->client =3D=3D NULL)
> ++    {
> ++        g_free (window->pending_account_id);
> ++        window->pending_account_id =3D g_strdup (account_id);
> ++        return;
> ++    }
> ++
> ++    n_items =3D g_list_model_get_n_items (window->accounts_model);
> ++
> ++    for (i =3D 0; i < n_items; i++)
> ++    {
> ++        GoaObject *object;
> ++        GoaAccount *account;
> ++
> ++        object =3D g_list_model_get_item (window->accounts_model, i);
> ++        account =3D goa_object_peek_account (object);
> ++
> ++        if (g_strcmp0 (goa_account_get_id (account), account_id) =3D=3D=
 0)
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
> +@@ -418,6 +457,15 @@ new_client_cb (GObject *source_object, GAsyncResult=
 *res, gpointer user_data)
> +
> +     populate_accounts (window);
> +     goa_provider_get_all (get_all_providers_cb, window);
> ++
> ++    if (window->pending_account_id !=3D NULL)
> ++    {
> ++        gchar *account_id;
> ++
> ++        account_id =3D g_steal_pointer (&window->pending_account_id);
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
> ++    for (l =3D gtk_application_get_windows (app); l !=3D NULL; l =3D l-=
>next)
> ++    {
> ++        if (OA_IS_WINDOW (l->data))
> ++        {
> ++            return OA_WINDOW (l->data);
> ++        }
> ++    }
> ++
> ++    window =3D oa_window_new ();
> ++    gtk_window_set_application (GTK_WINDOW (window), app);
> ++
> ++    return window;
> ++}
> ++
> + static void
> + on_app_activate (GtkApplication *app, gpointer user_data)
> + {
> +-    static OaWindow *window =3D NULL;
> ++    gtk_window_present (GTK_WINDOW (get_window (app)));
> ++}
> ++
> ++static void
> ++launch_panel_activated (GSimpleAction *action,
> ++                        GVariant      *parameter,
> ++                        gpointer       user_data)
> ++{
> ++    GtkApplication *app =3D GTK_APPLICATION (user_data);
> ++    OaWindow *window;
> ++    const gchar *panel_id;
> ++    GVariant *parameters;
> ++
> ++    g_variant_get (parameter, "(&s@av)", &panel_id, &parameters);
> +
> +-    if (window =3D=3D NULL)
> ++    if (g_strcmp0 (panel_id, "online-accounts") !=3D 0)
> +     {
> +-        window =3D oa_window_new ();
> +-        gtk_window_set_application (GTK_WINDOW (window), app);
> ++        g_warning ("Panel '%s' is not provided by gnome-online-accounts=
-gtk", panel_id);
> ++        g_variant_unref (parameters);
> ++        return;
> +     }
> +
> ++    window =3D get_window (app);
> +     gtk_window_present (GTK_WINDOW (window));
> ++
> ++    if (g_variant_n_children (parameters) > 0)
> ++    {
> ++        GVariant *value;
> ++
> ++        g_variant_get_child (parameters, 0, "v", &value);
> ++
> ++        if (g_variant_is_of_type (value, G_VARIANT_TYPE_STRING) &&
> ++            g_variant_get_string (value, NULL)[0] !=3D '\0')
> ++        {
> ++            show_account_by_id (window, g_variant_get_string (value, NU=
LL));
> ++        }
> ++
> ++        g_variant_unref (value);
> ++    }
> ++
> ++    g_variant_unref (parameters);
> ++}
> ++
> ++static const GActionEntry app_actions[] =3D {
> ++    { "launch-panel", launch_panel_activated, "(sav)", NULL, NULL, { 0 =
} },
> ++    { "launch-single-panel-mode", launch_panel_activated, "(sav)", NULL=
, NULL, { 0 } },
> ++};
> ++
> ++static void
> ++on_app_startup (GApplication *app, gpointer user_data)
> ++{
> ++    GDBusConnection *connection;
> ++    GError *error =3D NULL;
> ++
> ++    g_action_map_add_action_entries (G_ACTION_MAP (app),
> ++                                     app_actions,
> ++                                     G_N_ELEMENTS (app_actions),
> ++                                     app);
> ++
> ++    connection =3D g_application_get_dbus_connection (app);
> ++
> ++    if (connection =3D=3D NULL)
> ++    {
> ++        return;
> ++    }
> ++
> ++    if (g_dbus_connection_export_action_group (connection,
> ++                                               "/org/gnome/Settings",
> ++                                               G_ACTION_GROUP (app),
> ++                                               &error) =3D=3D 0)
> ++    {
> ++        g_warning ("Failed to export actions on /org/gnome/Settings: %s=
", error->message);
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
> +     g_application_set_option_context_summary (G_APPLICATION (app), "gno=
me-online-accounts-gtk: A GTK Frontend for GNOME Online Accounts");
> +
> ++    g_signal_connect (app, "startup", G_CALLBACK (on_app_startup), NULL=
);
> +     g_signal_connect (app, "activate", G_CALLBACK (on_app_activate), NU=
LL);
> +
> +     ret =3D g_application_run (G_APPLICATION (app), argc, argv);
> diff --git a/meta-gnome/recipes-extended/gnome-online-accounts-gtk/gnome-=
online-accounts-gtk_3.50.10.bb b/meta-gnome/recipes-extended/gnome-online-a=
ccounts-gtk/gnome-online-accounts-gtk_3.50.10.bb
> new file mode 100644
> index 0000000000..f69d99a7d3
> --- /dev/null
> +++ b/meta-gnome/recipes-extended/gnome-online-accounts-gtk/gnome-online-=
accounts-gtk_3.50.10.bb
> @@ -0,0 +1,29 @@
> +# AI-Generated: Uses Claude Code (Claude Fable 5.1)
> +SUMMARY =3D "GTK frontend for configuring GNOME Online Accounts"
> +DESCRIPTION =3D "Standalone GTK4/libadwaita application to add and manag=
e \
> +GNOME Online Accounts on desktops that do not ship gnome-control-center.=
"
> +HOMEPAGE =3D "https://github.com/xapp-project/gnome-online-accounts-gtk"
> +SECTION =3D "x11/gnome"
> +LICENSE =3D "GPL-3.0-or-later"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> +
> +DEPENDS =3D " \
> +    glib-2.0 \
> +    glib-2.0-native \
> +    gnome-online-accounts \
> +    gtk4 \
> +    libadwaita \
> +    libxml2-native \
> +"
> +
> +SRC_URI =3D " \
> +    git://github.com/xapp-project/gnome-online-accounts-gtk.git;protocol=
=3Dhttps;branch=3Dmaster \

please also include "tag=3D${PV}" in the SRC_URI

> +    file://0001-Provide-the-org.gnome.Settings-launch-panel-interface.pa=
tch \
> +"
> +SRCREV =3D "b42482522bc9089c139ceda9b8a7d81a7a149cf9"
> +
> +inherit meson pkgconfig gettext gtk-icon-cache
> +
> +FILES:${PN} +=3D "${datadir}/dbus-1/services"
> +
> +RCONFLICTS:${PN} +=3D "gnome-control-center"
> --
> 2.55.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#129797): https://lists.openembedded.org/g/openembedde=
d-devel/message/129797
> Mute This Topic: https://lists.openembedded.org/mt/121117841/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

