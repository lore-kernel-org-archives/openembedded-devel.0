Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24217C7619A
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 08:03:20 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.17397.1679731391892220575
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Mar 2023 01:03:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout04.t-online.de (Postfix) with SMTP id 62C7A1896E
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 09:03:09 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfyrl-0RoPhJ0; Sat, 25 Mar 2023 09:03:09 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 01/32] polkit-gnome: add recipe
Date: Sat, 25 Mar 2023 09:02:25 +0100
Message-Id: <20230325080256.923752-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1679731389-8556AC08-755EA57D/0/0 CLEAN NORMAL
X-TOI-MSGID: 6d283777-6929-48de-a9ed-934d1ac7c02f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 08:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101714

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...nt-user-to-authenticate-with-by-defa.patch |  78 ++++++++++
 ...alog-Make-the-label-wrap-at-70-chars.patch |  32 +++++
 ...om-accountsservice-instead-of-lookin.patch | 135 ++++++++++++++++++
 ...mestamps-when-displaying-authenticat.patch |  45 ++++++
 ...able-gnome-tools-that-are-not-provid.patch |  28 ++++
 ...olkit-gnome-authentication-agent-1.desktop |  87 +++++++++++
 .../polkit-gnome/polkit-gnome_0.105.bb        |  29 ++++
 7 files changed, 434 insertions(+)
 create mode 100644 meta-gnome/recipes-extended/polkit-gnome/polkit-gnome=
/0001-Select-the-current-user-to-authenticate-with-by-defa.patch
 create mode 100644 meta-gnome/recipes-extended/polkit-gnome/polkit-gnome=
/0002-Auth-dialog-Make-the-label-wrap-at-70-chars.patch
 create mode 100644 meta-gnome/recipes-extended/polkit-gnome/polkit-gnome=
/0003-Get-user-icon-from-accountsservice-instead-of-lookin.patch
 create mode 100644 meta-gnome/recipes-extended/polkit-gnome/polkit-gnome=
/0004-Use-fresh-X11-timestamps-when-displaying-authenticat.patch
 create mode 100644 meta-gnome/recipes-extended/polkit-gnome/polkit-gnome=
/0005-configure.ac-disable-gnome-tools-that-are-not-provid.patch
 create mode 100644 meta-gnome/recipes-extended/polkit-gnome/polkit-gnome=
/polkit-gnome-authentication-agent-1.desktop
 create mode 100644 meta-gnome/recipes-extended/polkit-gnome/polkit-gnome=
_0.105.bb

diff --git a/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0001-S=
elect-the-current-user-to-authenticate-with-by-defa.patch b/meta-gnome/re=
cipes-extended/polkit-gnome/polkit-gnome/0001-Select-the-current-user-to-=
authenticate-with-by-defa.patch
new file mode 100644
index 000000000..91f67bbc8
--- /dev/null
+++ b/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0001-Select-t=
he-current-user-to-authenticate-with-by-defa.patch
@@ -0,0 +1,78 @@
+From: Utopia Maintenance Team
+ <pkg-utopia-maintainers@lists.alioth.debian.org>
+Date: Mon, 30 Apr 2018 17:56:52 +0000
+Subject: Select the current user to authenticate with by default
+
+Bug: http://bugzilla.gnome.org/show_bug.cgi?id=3D596188
+Bug-Ubuntu: https://launchpad.net/bugs/435227
+---
+ src/polkitgnomeauthenticationdialog.c | 23 ++++++++++++++---------
+ 1 file changed, 14 insertions(+), 9 deletions(-)
+
+diff --git a/src/polkitgnomeauthenticationdialog.c b/src/polkitgnomeauth=
enticationdialog.c
+index 743cc96..d307516 100644
+--- a/src/polkitgnomeauthenticationdialog.c
++++ b/src/polkitgnomeauthenticationdialog.c
+@@ -138,7 +138,7 @@ user_combobox_changed (GtkComboBox *widget,
+ static void
+ create_user_combobox (PolkitGnomeAuthenticationDialog *dialog)
+ {
+-  int n;
++  int n, i, selected_index =3D 0;
+   GtkComboBox *combo;
+   GtkTreeIter iter;
+   GtkCellRenderer *renderer;
+@@ -162,7 +162,7 @@ create_user_combobox (PolkitGnomeAuthenticationDialo=
g *dialog)
+=20
+=20
+   /* For each user */
+-  for (n =3D 0; dialog->priv->users[n] !=3D NULL; n++)
++  for (i =3D 0, n =3D 0; dialog->priv->users[n] !=3D NULL; n++)
+     {
+       gchar *gecos;
+       gchar *real_name;
+@@ -224,6 +224,14 @@ create_user_combobox (PolkitGnomeAuthenticationDial=
og *dialog)
+                           USERNAME_COL, dialog->priv->users[n],
+                           -1);
+=20
++      i++;
++      if (passwd->pw_uid =3D=3D getuid ())
++        {
++          selected_index =3D i;
++          g_free (dialog->priv->selected_user);
++          dialog->priv->selected_user =3D g_strdup (dialog->priv->users=
[n]);
++        }
++
+       g_free (real_name);
+       g_object_unref (pixbuf);
+     }
+@@ -252,8 +260,8 @@ create_user_combobox (PolkitGnomeAuthenticationDialo=
g *dialog)
+                                       user_combobox_set_sensitive,
+                                       NULL, NULL);
+=20
+-  /* Initially select the "Select user..." ... */
+-  gtk_combo_box_set_active (GTK_COMBO_BOX (combo), 0);
++  /* Select the default user */
++  gtk_combo_box_set_active (GTK_COMBO_BOX (combo), selected_index);
+=20
+   /* Listen when a new user is selected */
+   g_signal_connect (GTK_WIDGET (combo),
+@@ -719,16 +727,13 @@ polkit_gnome_authentication_dialog_constructed (GO=
bject *object)
+   gtk_widget_set_tooltip_markup (label, s);
+   g_free (s);
+=20
+-  if (have_user_combobox)
++  /* Disable password entry and authenticate until have a user selected=
 */
++  if (have_user_combobox && gtk_combo_box_get_active (GTK_COMBO_BOX (di=
alog->priv->user_combobox)) =3D=3D 0)
+     {
+-      /* ... and make the password entry and "Authenticate" button inse=
nsitive */
+       gtk_widget_set_sensitive (dialog->priv->prompt_label, FALSE);
+       gtk_widget_set_sensitive (dialog->priv->password_entry, FALSE);
+       gtk_widget_set_sensitive (dialog->priv->auth_button, FALSE);
+     }
+-  else
+-    {
+-    }
+=20
+   gtk_widget_realize (GTK_WIDGET (dialog));
+=20
diff --git a/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0002-A=
uth-dialog-Make-the-label-wrap-at-70-chars.patch b/meta-gnome/recipes-ext=
ended/polkit-gnome/polkit-gnome/0002-Auth-dialog-Make-the-label-wrap-at-7=
0-chars.patch
new file mode 100644
index 000000000..76b96f47d
--- /dev/null
+++ b/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0002-Auth-dia=
log-Make-the-label-wrap-at-70-chars.patch
@@ -0,0 +1,32 @@
+From: Lars Uebernickel <lars@uebernic.de>
+Date: Fri, 17 Oct 2014 15:35:25 +0200
+Subject: Auth dialog: Make the label wrap at 70 chars
+
+Because GtkWindow doesn't have a default width anymore.
+
+Bug: https://bugzilla.gnome.org/show_bug.cgi?id=3D738688
+Bug-Ubuntu: https://launchpad.net/bugs/1382566
+---
+ src/polkitgnomeauthenticationdialog.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/polkitgnomeauthenticationdialog.c b/src/polkitgnomeauth=
enticationdialog.c
+index d307516..efd4185 100644
+--- a/src/polkitgnomeauthenticationdialog.c
++++ b/src/polkitgnomeauthenticationdialog.c
+@@ -574,6 +574,7 @@ polkit_gnome_authentication_dialog_constructed (GObj=
ect *object)
+   g_free (s);
+   gtk_misc_set_alignment (GTK_MISC (label), 0.0, 0.5);
+   gtk_label_set_line_wrap (GTK_LABEL (label), TRUE);
++  gtk_label_set_max_width_chars (GTK_LABEL (label), 70);
+   gtk_box_pack_start (GTK_BOX (main_vbox), label, FALSE, FALSE, 0);
+=20
+   /* secondary message */
+@@ -601,6 +602,7 @@ polkit_gnome_authentication_dialog_constructed (GObj=
ect *object)
+     }
+   gtk_misc_set_alignment (GTK_MISC (label), 0.0, 0.5);
+   gtk_label_set_line_wrap (GTK_LABEL (label), TRUE);
++  gtk_label_set_max_width_chars (GTK_LABEL (label), 70);
+   gtk_box_pack_start (GTK_BOX (main_vbox), label, FALSE, FALSE, 0);
+=20
+   /* user combobox */
diff --git a/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0003-G=
et-user-icon-from-accountsservice-instead-of-lookin.patch b/meta-gnome/re=
cipes-extended/polkit-gnome/polkit-gnome/0003-Get-user-icon-from-accounts=
service-instead-of-lookin.patch
new file mode 100644
index 000000000..431493906
--- /dev/null
+++ b/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0003-Get-user=
-icon-from-accountsservice-instead-of-lookin.patch
@@ -0,0 +1,135 @@
+From: Marc Deslauriers <marc.deslauriers@canonical.com>
+Date: Mon, 30 Apr 2018 18:03:22 +0000
+Subject: Get user icon from accountsservice instead of looking in ~/.fac=
e
+
+Bug: https://bugzilla.gnome.org/show_bug.cgi?id=3D669857
+Bug-Ubuntu: https://launchpad.net/bugs/928249
+---
+ src/polkitgnomeauthenticationdialog.c | 107 +++++++++++++++++++++++++++=
+++----
+ 1 file changed, 97 insertions(+), 10 deletions(-)
+
+diff --git a/src/polkitgnomeauthenticationdialog.c b/src/polkitgnomeauth=
enticationdialog.c
+index efd4185..565da87 100644
+--- a/src/polkitgnomeauthenticationdialog.c
++++ b/src/polkitgnomeauthenticationdialog.c
+@@ -135,6 +135,102 @@ user_combobox_changed (GtkComboBox *widget,
+     }
+ }
+=20
++static GdkPixbuf *
++get_user_icon (char *username)
++{
++  GError *error;
++  GDBusConnection *connection;
++  GVariant *find_user_result;
++  GVariant *get_icon_result;
++  GVariant *icon_result_variant;
++  const gchar *user_path;
++  const gchar *icon_filename;
++  GdkPixbuf *pixbuf;
++
++  error =3D NULL;
++  connection =3D g_bus_get_sync (G_BUS_TYPE_SYSTEM, NULL, &error);
++
++  if (connection =3D=3D NULL)
++    {
++      g_warning ("Unable to connect to system bus: %s", error->message)=
;
++      g_error_free (error);
++      return NULL;
++    }
++
++  find_user_result =3D g_dbus_connection_call_sync (connection,
++                                          "org.freedesktop.Accounts",
++                                          "/org/freedesktop/Accounts",
++                                          "org.freedesktop.Accounts",
++                                          "FindUserByName",
++                                          g_variant_new ("(s)",
++                                          username),
++                                          G_VARIANT_TYPE ("(o)"),
++                                          G_DBUS_CALL_FLAGS_NONE,
++                                          -1,
++                                          NULL,
++                                          &error);
++
++  if (find_user_result =3D=3D NULL)
++    {
++      g_warning ("Accounts couldn't find user: %s", error->message);
++      g_error_free (error);
++      return NULL;
++    }
++
++  user_path =3D g_variant_get_string (g_variant_get_child_value (find_u=
ser_result, 0),
++                                    NULL);
++
++  get_icon_result =3D g_dbus_connection_call_sync (connection,
++                                                 "org.freedesktop.Accou=
nts",
++                                                 user_path,
++                                                 "org.freedesktop.DBus.=
Properties",
++                                                 "Get",
++                                                 g_variant_new ("(ss)",
++                                                                "org.fr=
eedesktop.Accounts.User",
++                                                                "IconFi=
le"),
++                                                 G_VARIANT_TYPE ("(v)")=
,
++                                                 G_DBUS_CALL_FLAGS_NONE=
,
++                                                 -1,
++                                                 NULL,
++                                                 &error);
++
++  g_variant_unref (find_user_result);
++
++  if (get_icon_result =3D=3D NULL)
++    {
++      g_warning ("Accounts couldn't find user icon: %s", error->message=
);
++      g_error_free (error);
++      return NULL;
++    }
++
++  g_variant_get_child (get_icon_result, 0, "v", &icon_result_variant);
++  icon_filename =3D g_variant_get_string (icon_result_variant, NULL);
++
++  if (icon_filename =3D=3D NULL)
++    {
++      g_warning ("Accounts didn't return a valid filename for user icon=
");
++      pixbuf =3D NULL;
++    }
++  else
++    {
++      /* TODO: we probably shouldn't hard-code the size to 16x16 */
++      pixbuf =3D gdk_pixbuf_new_from_file_at_size (icon_filename,
++                                                 16,
++                                                 16,
++                                                 &error);
++      if (pixbuf =3D=3D NULL)
++        {
++          g_warning ("Couldn't open user icon: %s", error->message);
++          g_error_free (error);
++        }
++    }
++
++  g_variant_unref (icon_result_variant);
++  g_variant_unref (get_icon_result);
++
++  return pixbuf;
++}
++
+ static void
+ create_user_combobox (PolkitGnomeAuthenticationDialog *dialog)
+ {
+@@ -197,16 +293,7 @@ create_user_combobox (PolkitGnomeAuthenticationDial=
og *dialog)
+       g_free (gecos);
+=20
+       /* Load users face */
+-      pixbuf =3D NULL;
+-      if (passwd->pw_dir !=3D NULL)
+-        {
+-          gchar *path;
+-          path =3D g_strdup_printf ("%s/.face", passwd->pw_dir);
+-          /* TODO: we probably shouldn't hard-code the size to 16x16 */
+-          pixbuf =3D gdk_pixbuf_new_from_file_at_scale (path, 16, 16, T=
RUE, NULL);
+-          g_free (path);
+-        }
+-
++      pixbuf =3D get_user_icon (dialog->priv->users[n]);
+       /* fall back to avatar-default icon */
+       if (pixbuf =3D=3D NULL)
+         {
diff --git a/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0004-U=
se-fresh-X11-timestamps-when-displaying-authenticat.patch b/meta-gnome/re=
cipes-extended/polkit-gnome/polkit-gnome/0004-Use-fresh-X11-timestamps-wh=
en-displaying-authenticat.patch
new file mode 100644
index 000000000..83ad38d83
--- /dev/null
+++ b/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0004-Use-fres=
h-X11-timestamps-when-displaying-authenticat.patch
@@ -0,0 +1,45 @@
+From: Jeffrey Knockel <jeff250@gmail.com>
+Date: Mon, 30 Apr 2018 18:05:20 +0000
+Subject: Use fresh X11 timestamps when displaying authentication dialog
+
+This circumvents focus-stealing prevention.
+
+Bug: https://bugzilla.gnome.org/show_bug.cgi?id=3D676076
+Bug-Debian: https://bugs.debian.org/684300
+Bug-Ubuntu: https://launchpad.net/bugs/946171
+---
+ src/polkitgnomeauthenticator.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/polkitgnomeauthenticator.c b/src/polkitgnomeauthenticat=
or.c
+index 23163b4..e57d76e 100644
+--- a/src/polkitgnomeauthenticator.c
++++ b/src/polkitgnomeauthenticator.c
+@@ -26,6 +26,7 @@
+ #include <sys/types.h>
+ #include <pwd.h>
+ #include <glib/gi18n.h>
++#include <gdk/gdkx.h>
+=20
+ #include <polkit/polkit.h>
+ #include <polkitagent/polkitagent.h>
+@@ -306,7 +307,17 @@ session_request (PolkitAgentSession *session,
+     }
+=20
+   gtk_widget_show_all (GTK_WIDGET (authenticator->dialog));
+-  gtk_window_present (GTK_WINDOW (authenticator->dialog));
++  GdkWindow *window =3D gtk_widget_get_window (GTK_WIDGET (authenticato=
r->dialog));
++
++  if (GDK_IS_X11_WINDOW (window))
++    {
++    gtk_window_present_with_time (GTK_WINDOW (authenticator->dialog), g=
dk_x11_get_server_time (window));
++    }
++  else
++    {
++    gtk_window_present (GTK_WINDOW (authenticator->dialog));
++    }
++
+   password =3D polkit_gnome_authentication_dialog_run_until_response_fo=
r_prompt (POLKIT_GNOME_AUTHENTICATION_DIALOG (authenticator->dialog),
+                                                                        =
        modified_request,
+                                                                        =
        echo_on,
+
diff --git a/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0005-c=
onfigure.ac-disable-gnome-tools-that-are-not-provid.patch b/meta-gnome/re=
cipes-extended/polkit-gnome/polkit-gnome/0005-configure.ac-disable-gnome-=
tools-that-are-not-provid.patch
new file mode 100644
index 000000000..153cca25e
--- /dev/null
+++ b/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0005-configur=
e.ac-disable-gnome-tools-that-are-not-provid.patch
@@ -0,0 +1,28 @@
+From 334abb04ff953dabec63a91094de43e3cf064d7d Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Fri, 24 Feb 2023 17:29:24 +0100
+Subject: [PATCH] configure.ac: disable gnome-tools that are not provided
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 24eb724..02fccbd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -33,8 +33,8 @@ LT_INIT
+ # GNOME
+ # *****
+=20
+-GNOME_DEBUG_CHECK
+-GNOME_COMPILE_WARNINGS([maximum])
++#GNOME_DEBUG_CHECK
++#GNOME_COMPILE_WARNINGS([maximum])
+=20
+ #### gcc warning flags
+=20
+--=20
+2.34.1
+
diff --git a/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/polkit=
-gnome-authentication-agent-1.desktop b/meta-gnome/recipes-extended/polki=
t-gnome/polkit-gnome/polkit-gnome-authentication-agent-1.desktop
new file mode 100644
index 000000000..c45acfa54
--- /dev/null
+++ b/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/polkit-gnome-=
authentication-agent-1.desktop
@@ -0,0 +1,87 @@
+[Desktop Entry]
+Name=3DPolicyKit Authentication Agent
+Name[ar]=3D=D9=85=D8=AF=D9=8A=D8=B1 =D8=A7=D9=84=D8=A7=D8=B3=D8=AA=D9=8A=
=D8=AB=D8=A7=D9=82 PolicyKit
+Name[be]=3DPolicyKit - =D0=B0=D2=91=D0=B5=D0=BD=D1=82 =D0=B0=D1=9E=D1=82=
=D1=8D=D0=BD=D1=82=D1=8B=D1=84=D1=96=D0=BA=D0=B0=D1=86=D1=8B=D1=96
+Name[bn_IN]=3DPolicyKit =E0=A6=85=E0=A6=A8=E0=A7=81=E0=A6=AE=E0=A7=8B=E0=
=A6=A6=E0=A6=A8=E0=A7=87=E0=A6=B0 =E0=A6=8F=E0=A6=9C=E0=A7=87=E0=A6=A8=E0=
=A7=8D=E0=A6=9F
+Name[ca]=3DAgent d'autenticaci=C3=B3 del PolicyKit
+Name[cs]=3DOv=C4=9B=C5=99ovac=C3=AD agent PolicyKit
+Name[da]=3DGodkendelsesprogrammet PolicyKit
+Name[de]=3DLegitimationsdienst von PolicyKit
+Name[el]=3D=CE=A0=CF=81=CE=AC=CE=BA=CF=84=CE=BF=CF=81=CE=B1=CF=82 =CF=80=
=CE=B9=CF=83=CF=84=CE=BF=CF=80=CE=BF=CE=AF=CE=B7=CF=83=CE=B7=CF=82 Policy=
Kit
+Name[en_GB]=3DPolicyKit Authentication Agent
+Name[es]=3DAgente de autenticaci=C3=B3n de PolicyKit
+Name[eu]=3DPolicyKit autentifikatzeko agentea
+Name[fi]=3DPolicytKit-tunnistautumisohjelma
+Name[fr]=3DAgent d'authentification de PolicyKit
+Name[gl]=3DAxente de autenticaci=C3=B3n PolicyKit
+Name[gu]=3DPolicyKit =E0=AA=B8=E0=AA=A4=E0=AB=8D=E0=AA=A4=E0=AA=BE=E0=AA=
=A7=E0=AA=BF=E0=AA=95=E0=AA=B0=E0=AA=A3 =E0=AA=8F=E0=AA=9C=E0=AA=A8=E0=AB=
=8D=E0=AA=9F
+Name[hi]=3DPolicyKit =E0=A4=AA=E0=A5=8D=E0=A4=B0=E0=A4=AE=E0=A4=BE=E0=A4=
=A3=E0=A5=80=E0=A4=95=E0=A4=B0=E0=A4=A3 =E0=A4=AA=E0=A5=8D=E0=A4=B0=E0=A4=
=A4=E0=A4=BF=E0=A4=A8=E0=A4=BF=E0=A4=A7=E0=A4=BF
+Name[hu]=3DPolicyKit hiteles=C3=ADt=C3=A9si =C3=BCgyn=C3=B6k
+Name[it]=3DAgente di autenticazione per PolicyKit
+Name[ja]=3DPolicyKit =E8=AA=8D=E8=A8=BC=E3=82=A8=E3=83=BC=E3=82=B8=E3=82=
=A7=E3=83=B3=E3=83=88
+Name[kn]=3DPolicyKit =E0=B2=A6=E0=B3=83=E0=B2=A2=E0=B3=80=E0=B2=95=E0=B2=
=B0=E0=B2=A3 =E0=B2=AE=E0=B2=A7=E0=B3=8D=E0=B2=AF=E0=B2=B5=E0=B2=B0=E0=B3=
=8D=E0=B2=A4=E0=B2=BF
+Name[lt]=3DPolicyKit tapatyb=C4=97s nustatymo agentas
+Name[ml]=3D=E0=B4=AA=E0=B5=8B=E0=B4=B3=E0=B4=BF=E0=B4=B8=E0=B4=BF=E0=B4=95=
=E0=B5=8D=E0=B4=95=E0=B4=BF=E0=B4=B1=E0=B5=8D=E0=B4=B1=E0=B5=8D =E0=B4=93=
=E0=B4=A5=E0=B4=A8=E0=B5=8D=E0=B4=B1=E0=B4=BF=E0=B4=95=E0=B5=8D=E0=B4=95=E0=
=B5=87=E0=B4=B7=E0=B4=A8=E0=B5=8D=E2=80=8D =E0=B4=8F=E0=B4=9C=E0=B4=A8=E0=
=B5=8D=E0=B4=B1=E0=B5=8D
+Name[mr]=3DPolicyKit =E0=A4=91=E0=A4=A5=E0=A5=87=E0=A4=82=E0=A4=9F=E0=A5=
=80=E0=A4=95=E0=A5=87=E0=A4=B6=E0=A4=A8 =E0=A4=8F=E0=A4=9C=E0=A5=87=E0=A4=
=82=E0=A4=9F
+Name[or]=3DPolicyKit =E0=AC=AC=E0=AD=88=E0=AC=A7=E0=AC=BF=E0=AC=95=E0=AC=
=B0=E0=AC=A3 =E0=AC=B8=E0=AC=A6=E0=AC=B8=E0=AD=8D=E0=AD=9F
+Name[pa]=3D=E0=A8=AA=E0=A8=BE=E0=A8=B2=E0=A8=B8=E0=A9=80=E0=A8=95=E0=A8=BF=
=E0=A9=B1=E0=A8=9F =E0=A8=AA=E0=A8=B0=E0=A8=AE=E0=A8=BE=E0=A8=A3=E0=A8=95=
=E0=A8=BF=E0=A8=A4=E0=A8=BE =E0=A8=8F=E0=A8=9C=E0=A9=B0=E0=A8=9F
+Name[pl]=3DAgent uwierzytelniania PolicyKit
+Name[pt]=3DAgente de Autentica=C3=A7=C3=A3o PolicyKit
+Name[pt_BR]=3DAgente de autentica=C3=A7=C3=A3o PolicyKit
+Name[ro]=3DAgent de autentificare PolicyKit
+Name[sk]=3DAgent PolicyKit na overovanie toto=C5=BEnosti
+Name[sl]=3DPolicyKit program overjanja
+Name[sv]=3DAutentiseringsagent f=C3=B6r PolicyKit
+Name[ta]=3DPolicyKit =E0=AE=85=E0=AE=99=E0=AF=8D=E0=AE=95=E0=AF=80=E0=AE=
=95=E0=AE=BE=E0=AE=B0 =E0=AE=AE=E0=AF=81=E0=AE=95=E0=AE=B5=E0=AE=B0=E0=AF=
=8D
+Name[te]=3D=E0=B0=AA=E0=B0=BE=E0=B0=B2=E0=B0=B8=E0=B1=80=E0=B0=95=E0=B0=BF=
=E0=B0=9F=E0=B1=8D =E0=B0=A7=E0=B1=83=E0=B0=B5=E0=B1=80=E0=B0=95=E0=B0=B0=
=E0=B0=A3 =E0=B0=AA=E0=B1=8D=E0=B0=B0=E0=B0=A4=E0=B0=BF=E0=B0=A8=E0=B0=BF=
=E0=B0=A7=E0=B0=BF
+Name[th]=3D=E0=B8=95=E0=B8=B1=E0=B8=A7=E0=B8=81=E0=B8=A5=E0=B8=B2=E0=B8=87=
=E0=B8=AA=E0=B8=B3=E0=B8=AB=E0=B8=A3=E0=B8=B1=E0=B8=9A=E0=B8=A2=E0=B8=B7=E0=
=B8=99=E0=B8=A2=E0=B8=B1=E0=B8=99=E0=B8=95=E0=B8=B1=E0=B8=A7=E0=B8=9A=E0=B8=
=B8=E0=B8=84=E0=B8=84=E0=B8=A5 PolicyKit
+Name[uk]=3D=D0=90=D0=B3=D0=B5=D0=BD=D1=82 =D0=B0=D0=B2=D1=82=D0=B5=D0=BD=
=D1=82=D0=B8=D1=84=D1=96=D0=BA=D0=B0=D1=86=D1=96=D1=97 PolicyKit
+Name[zh_CN]=3DPolicyKit =E8=AE=A4=E8=AF=81=E4=BB=A3=E7=90=86
+Name[zh_HK]=3DPolicyKit =E9=A9=97=E8=AD=89=E4=BB=A3=E7=90=86=E7=A8=8B=E5=
=BC=8F
+Name[zh_TW]=3DPolicyKit =E9=A9=97=E8=AD=89=E4=BB=A3=E7=90=86=E7=A8=8B=E5=
=BC=8F
+Comment=3DPolicyKit Authentication Agent
+Comment[ar]=3D=D9=85=D8=AF=D9=8A=D8=B1 =D8=A7=D9=84=D8=A7=D8=B3=D8=AA=D9=
=8A=D8=AB=D8=A7=D9=82 PolicyKit
+Comment[be]=3DPolicyKit - =D0=B0=D2=91=D0=B5=D0=BD=D1=82 =D0=B0=D1=9E=D1=
=82=D1=8D=D0=BD=D1=82=D1=8B=D1=84=D1=96=D0=BA=D0=B0=D1=86=D1=8B=D1=96
+Comment[bn_IN]=3DPolicyKit =E0=A6=85=E0=A6=A8=E0=A7=81=E0=A6=AE=E0=A7=8B=
=E0=A6=A6=E0=A6=A8=E0=A7=87=E0=A6=B0 =E0=A6=8F=E0=A6=9C=E0=A7=87=E0=A6=A8=
=E0=A7=8D=E0=A6=9F
+Comment[ca]=3DAgent d'autenticaci=C3=B3 del PolicyKit
+Comment[cs]=3DOv=C4=9B=C5=99ovac=C3=AD agent PolicyKit
+Comment[da]=3DGodkendelsesprogrammet PolicyKit
+Comment[de]=3DLegitimationsdienst von PolicyKit
+Comment[el]=3D=CE=A0=CF=81=CE=AC=CE=BA=CF=84=CE=BF=CF=81=CE=B1=CF=82 =CF=
=80=CE=B9=CF=83=CF=84=CE=BF=CF=80=CE=BF=CE=AF=CE=B7=CF=83=CE=B7=CF=82 Pol=
icyKit
+Comment[en_GB]=3DPolicyKit Authentication Agent
+Comment[es]=3DAgente de autenticaci=C3=B3n de PolicyKit
+Comment[eu]=3DPolicyKit autentifikatzeko agentea
+Comment[fi]=3DPolicytKit-tunnistautumisohjelma
+Comment[fr]=3DAgent d'authentification de PolicyKit
+Comment[gl]=3DAxente de autenticaci=C3=B3n PolicyKit
+Comment[gu]=3DPolicyKit =E0=AA=B8=E0=AA=A4=E0=AB=8D=E0=AA=A4=E0=AA=BE=E0=
=AA=A7=E0=AA=BF=E0=AA=95=E0=AA=B0=E0=AA=A3 =E0=AA=8F=E0=AA=9C=E0=AA=A8=E0=
=AB=8D=E0=AA=9F
+Comment[hi]=3DPolicyKit =E0=A4=AA=E0=A5=8D=E0=A4=B0=E0=A4=AE=E0=A4=BE=E0=
=A4=A3=E0=A5=80=E0=A4=95=E0=A4=B0=E0=A4=A3 =E0=A4=AA=E0=A5=8D=E0=A4=B0=E0=
=A4=A4=E0=A4=BF=E0=A4=A8=E0=A4=BF=E0=A4=A7=E0=A4=BF
+Comment[hu]=3DPolicyKit hiteles=C3=ADt=C3=A9si =C3=BCgyn=C3=B6k
+Comment[it]=3DAgente di autenticazione per PolicyKit
+Comment[ja]=3DPolicyKit =E8=AA=8D=E8=A8=BC=E3=82=A8=E3=83=BC=E3=82=B8=E3=
=82=A7=E3=83=B3=E3=83=88
+Comment[kn]=3DPolicyKit =E0=B2=A6=E0=B3=83=E0=B2=A2=E0=B3=80=E0=B2=95=E0=
=B2=B0=E0=B2=A3 =E0=B2=AE=E0=B2=A7=E0=B3=8D=E0=B2=AF=E0=B2=B5=E0=B2=B0=E0=
=B3=8D=E0=B2=A4=E0=B2=BF
+Comment[lt]=3DPolicyKit tapatyb=C4=97s nustatymo agentas
+Comment[ml]=3D=E0=B4=AA=E0=B5=8B=E0=B4=B3=E0=B4=BF=E0=B4=B8=E0=B4=BF=E0=B4=
=95=E0=B5=8D=E0=B4=95=E0=B4=BF=E0=B4=B1=E0=B5=8D=E0=B4=B1=E0=B5=8D =E0=B4=
=93=E0=B4=A5=E0=B4=A8=E0=B5=8D=E0=B4=B1=E0=B4=BF=E0=B4=95=E0=B5=8D=E0=B4=95=
=E0=B5=87=E0=B4=B7=E0=B4=A8=E0=B5=8D=E2=80=8D =E0=B4=8F=E0=B4=9C=E0=B4=A8=
=E0=B5=8D=E0=B4=B1=E0=B5=8D
+Comment[mr]=3DPolicyKit =E0=A4=91=E0=A4=A5=E0=A5=87=E0=A4=82=E0=A4=9F=E0=
=A5=80=E0=A4=95=E0=A5=87=E0=A4=B6=E0=A4=A8 =E0=A4=8F=E0=A4=9C=E0=A5=87=E0=
=A4=82=E0=A4=9F
+Comment[or]=3DPolicyKit =E0=AC=AC=E0=AD=88=E0=AC=A7=E0=AC=BF=E0=AC=95=E0=
=AC=B0=E0=AC=A3 =E0=AC=B8=E0=AC=A6=E0=AC=B8=E0=AD=8D=E0=AD=9F
+Comment[pa]=3D=E0=A8=AA=E0=A8=BE=E0=A8=B2=E0=A8=B8=E0=A9=80=E0=A8=95=E0=A8=
=BF=E0=A9=B1=E0=A8=9F =E0=A8=AA=E0=A8=B0=E0=A8=AE=E0=A8=BE=E0=A8=A3=E0=A8=
=95=E0=A8=BF=E0=A8=A4=E0=A8=BE =E0=A8=8F=E0=A8=9C=E0=A9=B0=E0=A8=9F
+Comment[pl]=3DAgent uwierzytelniania PolicyKit
+Comment[pt]=3DAgente de Autentica=C3=A7=C3=A3o PolicyKit
+Comment[pt_BR]=3DAgente de autentica=C3=A7=C3=A3o PolicyKit
+Comment[ro]=3DAgent de autentificare PolicyKit
+Comment[sk]=3DAgent PolicyKit na overovanie toto=C5=BEnosti
+Comment[sl]=3DPolicyKit program overjanja
+Comment[sv]=3DAutentiseringsagent f=C3=B6r PolicyKit
+Comment[ta]=3DPolicyKit =E0=AE=85=E0=AE=99=E0=AF=8D=E0=AE=95=E0=AF=80=E0=
=AE=95=E0=AE=BE=E0=AE=B0 =E0=AE=AE=E0=AF=81=E0=AE=95=E0=AE=B5=E0=AE=B0=E0=
=AF=8D
+Comment[te]=3D=E0=B0=AA=E0=B0=BE=E0=B0=B2=E0=B0=B8=E0=B1=80=E0=B0=95=E0=B0=
=BF=E0=B0=9F=E0=B1=8D =E0=B0=A7=E0=B1=83=E0=B0=B5=E0=B1=80=E0=B0=95=E0=B0=
=B0=E0=B0=A3 =E0=B0=AA=E0=B1=8D=E0=B0=B0=E0=B0=A4=E0=B0=BF=E0=B0=A8=E0=B0=
=BF=E0=B0=A7=E0=B0=BF
+Comment[th]=3D=E0=B8=95=E0=B8=B1=E0=B8=A7=E0=B8=81=E0=B8=A5=E0=B8=B2=E0=B8=
=87=E0=B8=AA=E0=B8=B3=E0=B8=AB=E0=B8=A3=E0=B8=B1=E0=B8=9A=E0=B8=A2=E0=B8=B7=
=E0=B8=99=E0=B8=A2=E0=B8=B1=E0=B8=99=E0=B8=95=E0=B8=B1=E0=B8=A7=E0=B8=9A=E0=
=B8=B8=E0=B8=84=E0=B8=84=E0=B8=A5 PolicyKit
+Comment[uk]=3D=D0=90=D0=B3=D0=B5=D0=BD=D1=82 =D0=B0=D0=B2=D1=82=D0=B5=D0=
=BD=D1=82=D0=B8=D1=84=D1=96=D0=BA=D0=B0=D1=86=D1=96=D1=97 PolicyKit
+Comment[zh_CN]=3DPolicyKit =E8=AE=A4=E8=AF=81=E4=BB=A3=E7=90=86
+Comment[zh_HK]=3DPolicyKit =E9=A9=97=E8=AD=89=E4=BB=A3=E7=90=86=E7=A8=8B=
=E5=BC=8F
+Comment[zh_TW]=3DPolicyKit =E9=A9=97=E8=AD=89=E4=BB=A3=E7=90=86=E7=A8=8B=
=E5=BC=8F
+Exec=3D/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
+Terminal=3Dfalse
+Type=3DApplication
+Categories=3D
+NoDisplay=3Dtrue
+OnlyShowIn=3DGNOME;
diff --git a/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome_0.105.=
bb b/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome_0.105.bb
new file mode 100644
index 000000000..e0e4a59d2
--- /dev/null
+++ b/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome_0.105.bb
@@ -0,0 +1,29 @@
+SUMMARY =3D "PolicyKit-gnome provides an Authentication Agent for Policy=
Kit"
+HOMEPAGE =3D "https://gitlab.gnome.org/Archive/policykit-gnome"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D74579fab173e4c5e12aac0cd83ee9=
8ec"
+
+DEPENDS =3D "glib-2.0-native glib-2.0 gtk+3 polkit intltool-native"
+
+inherit autotools pkgconfig features_check
+
+REQUIRED_DISTRO_FEATURES =3D "polkit"
+
+SRC_URI =3D " \
+    git://gitlab.gnome.org/Archive/policykit-gnome.git;protocol=3Dhttps;=
branch=3Dmaster \
+    file://0001-Select-the-current-user-to-authenticate-with-by-defa.pat=
ch \
+    file://0002-Auth-dialog-Make-the-label-wrap-at-70-chars.patch \
+    file://0003-Get-user-icon-from-accountsservice-instead-of-lookin.pat=
ch \
+    file://0004-Use-fresh-X11-timestamps-when-displaying-authenticat.pat=
ch \
+    file://0005-configure.ac-disable-gnome-tools-that-are-not-provid.pat=
ch \
+    file://polkit-gnome-authentication-agent-1.desktop \
+"
+SRCREV =3D "a0763a246a81188f60b0f9810143e49224dc752f"
+S =3D "${WORKDIR}/git"
+
+
+do_install:append() {
+  install -d ${D}${datadir}/applications
+  install -m644 ${WORKDIR}/polkit-gnome-authentication-agent-1.desktop \
+      ${D}${datadir}/applications
+}
--=20
2.34.1


