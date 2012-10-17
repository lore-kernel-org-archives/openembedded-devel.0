Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TOUXt-0005gG-6R
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Oct 2012 16:24:29 +0200
Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 17 Oct 2012 07:11:09 -0700
Received: by mail-oa0-f47.google.com with SMTP id h1so7535671oag.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2012 07:11:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=j0+j3LH4B/DqD+gWPa/pYMGAFLEAq66JWBnXOu/kRVI=;
	b=BhJ2FlAA3gd5DdJ+KKSP4zlAZVWF1SSgvc526J2l8IvEWX1jA/pnmGGtpoq6Otfs3J
	ZjueEnSanLI/Ov+pWIm+chMU56jSaU1r5tetjqmARsHoQFgGGSHcS95ndeSlHnVgtbF3
	XWFzvKYH144dB8ypI4jzjsh2dxWWWYtsqnBFwPpJ6gBFWcpBEvHHYMf3ZZ7rN2El3SjB
	1gHqe2DJoax68m4to//BXHASb0u02AbjkC6pHDycQa64XHVLVxjvew6IRU5Yn4m+ZJf0
	Jcan9rCG/+xIlvWYy5ANLYWa82hT4md/XOPLom8joleknB51Z4VUYAXXk6Zz9xpXuIjq
	+XwQ==
Received: by 10.182.45.42 with SMTP id j10mr15265156obm.60.1350483068660; Wed,
	17 Oct 2012 07:11:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.70.6 with HTTP; Wed, 17 Oct 2012 07:10:48 -0700 (PDT)
In-Reply-To: <1346321455-19861-1-git-send-email-ross.burton@intel.com>
References: <20120829210456.GC3287@jama.jama.net>
	<1346321455-19861-1-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 17 Oct 2012 15:10:48 +0100
Message-ID: <CAJTo0LYhurO5y5+rRozExLmAHxqJ=Sz_a+UeB7=qHowu61rnqg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnrccdznesxiGSSluqQdTC2AuZsx+ZFotJU5VYnnPCYM/lko+dpYuGXvWfFD1GCRzppxgMG
Subject: Re: [PATCH] pimlico: remove Poky overrides
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
X-List-Received-Date: Wed, 17 Oct 2012 14:24:29 -0000
Content-Type: text/plain; charset=UTF-8

Bump.

Ross

On 30 August 2012 11:10, Ross Burton <ross.burton@intel.com> wrote:
> There was a poky distro override to enable the "owl" window menu functionality.
> As these packages are in meta-oe now and only Sato/poky supported owl, remove
> the override and patches.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta-gnome/recipes-gnome/pimlico/contacts.inc      |    8 +--
>  .../contacts/contacts-owl-window-menu.patch        |   54 ----------------
>  meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb   |    2 +-
>  meta-gnome/recipes-gnome/pimlico/dates.inc         |    9 ---
>  .../pimlico/dates/dates-owl-window-menu.patch      |   67 --------------------
>  meta-gnome/recipes-gnome/pimlico/dates_git.bb      |    2 +-
>  meta-gnome/recipes-gnome/pimlico/tasks.inc         |    6 --
>  .../recipes-gnome/pimlico/tasks/tasks-owl.diff     |   67 --------------------
>  meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb     |    4 +-
>  9 files changed, 4 insertions(+), 215 deletions(-)
>  delete mode 100644 meta-gnome/recipes-gnome/pimlico/contacts/contacts-owl-window-menu.patch
>  delete mode 100644 meta-gnome/recipes-gnome/pimlico/dates/dates-owl-window-menu.patch
>  delete mode 100644 meta-gnome/recipes-gnome/pimlico/tasks/tasks-owl.diff
>
> diff --git a/meta-gnome/recipes-gnome/pimlico/contacts.inc b/meta-gnome/recipes-gnome/pimlico/contacts.inc
> index 9798985..e19727c 100644
> --- a/meta-gnome/recipes-gnome/pimlico/contacts.inc
> +++ b/meta-gnome/recipes-gnome/pimlico/contacts.inc
> @@ -5,15 +5,11 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
>  LICENSE = "GPLv2 & GPLv2+ & GPLv3+ "
>  SECTION = "x11"
>  DEPENDS = "glib-2.0 gtk+ evolution-data-server"
> -DEPENDS_append_poky = " libowl"
>  RDEPENDS_${PN} = "libedata-book"
>
>  inherit autotools pkgconfig
>
> -OWL = "--disable-owl"
> -OWL_poky = "--enable-owl"
> -
> -EXTRA_OECONF += "--disable-gnome-vfs ${OWL}"
> +EXTRA_OECONF += "--disable-gnome-vfs"
>  EXTRA_OEMAKE += "GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1"
>
>  do_install_append () {
> @@ -30,5 +26,3 @@ SRC_URI = "file://stock_contact.png \
>             file://stock_person.png \
>             file://contacts-conditionally-install-schema.patch \
>            "
> -
> -SRC_URI_append_poky = " file://contacts-owl-window-menu.patch;apply=yes "
> diff --git a/meta-gnome/recipes-gnome/pimlico/contacts/contacts-owl-window-menu.patch b/meta-gnome/recipes-gnome/pimlico/contacts/contacts-owl-window-menu.patch
> deleted file mode 100644
> index 5323876..0000000
> --- a/meta-gnome/recipes-gnome/pimlico/contacts/contacts-owl-window-menu.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -Upstream-Status: Inappropriate [enable feature]
> -
> -Index: contacts-0.9/src/contacts-gtk.c
> -===================================================================
> ---- contacts-0.9.orig/src/contacts-gtk.c       2008-06-06 12:56:08.000000000 +0100
> -+++ contacts-0.9/src/contacts-gtk.c    2008-06-16 08:14:28.000000000 +0100
> -@@ -220,8 +220,8 @@
> -       vbox7 = gtk_vbox_new (FALSE, 0);
> -       gtk_container_add (GTK_CONTAINER (main_window), vbox7);
> -
> --      main_menubar = gtk_menu_bar_new ();
> --      gtk_box_pack_start (GTK_BOX (vbox7), main_menubar, FALSE, FALSE, 0);
> -+      main_menubar = gtk_menu_new ();
> -+      gtk_widget_show (main_menubar);
> -
> -       contacts_menu = gtk_menu_item_new_with_mnemonic (_("C_ontacts"));
> -       gtk_container_add (GTK_CONTAINER (main_menubar), contacts_menu);
> -Index: contacts-0.9/src/Makefile.am
> -===================================================================
> ---- contacts-0.9.orig/src/Makefile.am  2008-06-03 09:16:56.000000000 +0100
> -+++ contacts-0.9/src/Makefile.am       2008-06-16 08:15:34.000000000 +0100
> -@@ -40,7 +40,7 @@
> -                     contacts-@FRONTEND@.c \
> -                     contacts-@FRONTEND@.h
> -
> --contacts_LDADD   = $(CONTACTS_LIBS) $(DBUS_LIBS)
> -+contacts_LDADD   = $(CONTACTS_LIBS) $(DBUS_LIBS) -lowl
> -
> - contacts_LDFLAGS = @CONTACTS_LIBS@ @DBUS_LIBS@
> -
> -Index: contacts-0.9/src/contacts-main.c
> -===================================================================
> ---- contacts-0.9.orig/src/contacts-main.c      2008-06-06 10:26:52.000000000 +0100
> -+++ contacts-0.9/src/contacts-main.c   2008-06-16 08:14:28.000000000 +0100
> -@@ -27,6 +27,8 @@
> - #include <libgnomevfs/gnome-vfs.h>
> - #endif
> -
> -+#include <libowl/owlwindowmenu.h>
> -+
> - #include "bacon-message-connection.h"
> - #include "contacts-defs.h"
> - #include "contacts-utils.h"
> -@@ -266,6 +268,10 @@
> -               gtk_widget_show_all (widget);
> -       }
> -
> -+      gtk_widget_show_all (data->ui->main_menubar);
> -+      owl_set_window_menu (GTK_WINDOW (data->ui->main_window),
> -+                           GTK_MENU (data->ui->main_menubar));
> -+
> -       gtk_main ();
> -
> -       /* if we have modified the current contact, but not saved it, do so now */
> diff --git a/meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb b/meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb
> index 251bbe1..da6959b 100644
> --- a/meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb
> +++ b/meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb
> @@ -1,6 +1,6 @@
>  require contacts.inc
>
> -PR = "r7"
> +PR = "r8"
>
>  SRC_URI =+ "http://pimlico-project.org/sources/${BPN}/${BPN}-${PV}.tar.gz"
>
> diff --git a/meta-gnome/recipes-gnome/pimlico/dates.inc b/meta-gnome/recipes-gnome/pimlico/dates.inc
> index 9b338fd..9b078e1 100644
> --- a/meta-gnome/recipes-gnome/pimlico/dates.inc
> +++ b/meta-gnome/recipes-gnome/pimlico/dates.inc
> @@ -9,12 +9,3 @@ DEPENDS = "glib-2.0 gtk+ libglade evolution-data-server"
>  RDEPENDS_${PN} = "libedata-cal"
>
>  inherit autotools gettext pkgconfig gtk-icon-cache
> -
> -# Poky/Sato specific enhancements
> -OWL = "--disable-owl"
> -OWL_poky = "--enable-owl --disable-dnd"
> -
> -EXTRA_OECONF += "${OWL}"
> -DEPENDS_append_poky = " libowl"
> -SRC_URI_append_poky = " file://dates-owl-window-menu.patch;apply=yes "
> -
> diff --git a/meta-gnome/recipes-gnome/pimlico/dates/dates-owl-window-menu.patch b/meta-gnome/recipes-gnome/pimlico/dates/dates-owl-window-menu.patch
> deleted file mode 100644
> index 714623e..0000000
> --- a/meta-gnome/recipes-gnome/pimlico/dates/dates-owl-window-menu.patch
> +++ /dev/null
> @@ -1,67 +0,0 @@
> ----
> - src/dates_gtk.c      |    5 -----
> - src/dates_main.c     |    5 +++++
> - src/dates_platform.h |    2 +-
> - 3 files changed, 7 insertions(+), 7 deletions(-)
> -
> -Upstream-Status: Inappropriate [enable feature]
> -
> -Index: git/src/dates_gtk.c
> -===================================================================
> ---- git.orig/src/dates_gtk.c   2009-08-18 12:44:56.000000000 +0100
> -+++ git/src/dates_gtk.c        2009-09-03 22:28:50.000000000 +0100
> -@@ -33,10 +33,6 @@
> - #endif
> -
> - #ifndef DATES_PLATFORM_create_main_window
> --/* the default implementation assumes that menu is GtkMenuBar */
> --#ifdef DATES_MENU_WITHOUT_BAR
> --#error Cannot use default create_main_window () if DATES_MENU_WITHOUT_BAR is defined !!!
> --#endif
> - static GtkWidget *
> - create_main_window (DatesData * d, GtkWidget * toolbar,
> -                                       GtkWidget * menu, GtkAccelGroup * accel_group)
> -@@ -59,7 +55,6 @@
> -       gtk_container_add (GTK_CONTAINER (d->main_window), main_vbox);
> -
> -       gtk_widget_show (menu);
> --      gtk_box_pack_start (GTK_BOX (main_vbox), menu, FALSE, FALSE, 0);
> -
> -       gtk_box_pack_end (GTK_BOX (main_vbox), toolbar, FALSE, FALSE, 0);
> -       gtk_container_set_border_width (GTK_CONTAINER (toolbar), 3);
> -Index: git/src/dates_main.c
> -===================================================================
> ---- git.orig/src/dates_main.c  2009-08-18 12:44:56.000000000 +0100
> -+++ git/src/dates_main.c       2009-09-03 22:29:21.000000000 +0100
> -@@ -26,6 +26,8 @@
> - #include <libical/icaltime.h>
> - #include <gconf/gconf-client.h>
> -
> -+#include <gtk/gtkmenuitem.h>
> -+#include <libowl/owlwindowmenu.h>
> - #include "dates_types.h"
> - #include "dates_platform.h"
> - #include "dates_callbacks.h"
> -@@ -582,6 +584,9 @@
> -               g_free (url_uri);
> -       }
> -
> -+      owl_set_window_menu (GTK_WINDOW (data.main_window),
> -+                           GTK_MENU (data.main_menu));
> -+
> -       gtk_main ();
> -
> -       return 0;
> -Index: git/src/dates_platform.h
> -===================================================================
> ---- git.orig/src/dates_platform.h      2009-08-18 12:44:56.000000000 +0100
> -+++ git/src/dates_platform.h   2009-09-03 22:28:50.000000000 +0100
> -@@ -20,7 +20,7 @@
> -
> - #include "dates_types.h"
> -
> --#ifdef WITH_HILDON
> -+#if 1
> - #define DATES_MENU_WITHOUT_BAR 1
> - #endif
> -
> diff --git a/meta-gnome/recipes-gnome/pimlico/dates_git.bb b/meta-gnome/recipes-gnome/pimlico/dates_git.bb
> index 9ee0105..cf5343d 100644
> --- a/meta-gnome/recipes-gnome/pimlico/dates_git.bb
> +++ b/meta-gnome/recipes-gnome/pimlico/dates_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
>
>  SRCREV = "514185dc1f6588085fda41eb59898b93d0487dd4"
>  PV = "0.4.11+git${SRCPV}"
> -PR = "r8"
> +PR = "r9"
>
>  S = "${WORKDIR}/git"
>
> diff --git a/meta-gnome/recipes-gnome/pimlico/tasks.inc b/meta-gnome/recipes-gnome/pimlico/tasks.inc
> index 9cd5259..44f036d 100644
> --- a/meta-gnome/recipes-gnome/pimlico/tasks.inc
> +++ b/meta-gnome/recipes-gnome/pimlico/tasks.inc
> @@ -6,11 +6,5 @@ LICENSE = "GPLv2 & GPLv2+"
>
>  SECTION = "x11"
>  DEPENDS = "glib-2.0 gtk+ evolution-data-server"
> -DEPENDS_append_poky = " libowl"
>
>  inherit autotools pkgconfig gtk-icon-cache
> -
> -OWL ?= "--disable-owl"
> -OWL_poky ?= "--enable-owl"
> -
> -EXTRA_OECONF += "${OWL}"
> diff --git a/meta-gnome/recipes-gnome/pimlico/tasks/tasks-owl.diff b/meta-gnome/recipes-gnome/pimlico/tasks/tasks-owl.diff
> deleted file mode 100644
> index aab23ff..0000000
> --- a/meta-gnome/recipes-gnome/pimlico/tasks/tasks-owl.diff
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -This patch enable owl menu, which is hidden in the title bar to save space on
> -small screen. It has not been used for a long time, rebase needed.
> -
> -Upstream-Status: Inappropriate [enable feature]
> -
> -Index: src/gtk/tasks-ui.xml
> -===================================================================
> ---- src/gtk/tasks-ui.xml       (revision 338)
> -+++ src/gtk/tasks-ui.xml       (working copy)
> -@@ -7,17 +7,14 @@
> -       <menuitem action="EditTask"/>
> -       <menuitem action="CompleteTask"/>
> -       <separator/>
> -+      <menuitem action="Undo"/>
> -+      <menuitem action="Redo"/>
> -+      <separator/>
> -       <menuitem action="DeleteTask"/>
> -       <menuitem action="PurgeTasks"/>
> -       <separator/>
> -+      <menuitem action="About"/>
> -       <menuitem action="Quit"/>
> -     </menu>
> --    <menu action="EditMenu">
> --      <menuitem action="Undo"/>
> --      <menuitem action="Redo"/>
> --    </menu>
> --    <menu action="HelpMenu">
> --      <menuitem action="About"/>
> --    </menu>
> -   </menubar>
> - </ui>
> -Index: src/gtk/main.c
> -===================================================================
> ---- src/gtk/main.c     (revision 338)
> -+++ src/gtk/main.c     (working copy)
> -@@ -21,6 +21,7 @@
> - #include <libecal/e-cal.h>
> - #include <glib/gi18n.h>
> - #include <gtk/gtk.h>
> -+#include <libowl/owlwindowmenu.h>
> -
> - #include <libkoto/ical-util.h>
> - #include <libkoto/koto-actions.h>
> -@@ -564,8 +565,8 @@
> -   gtk_window_add_accel_group (GTK_WINDOW (window), gtk_ui_manager_get_accel_group (ui_manager));
> -   gtk_ui_manager_ensure_update (ui_manager);
> -
> --  menu = gtk_ui_manager_get_widget (ui_manager, "/MenuBar");
> --  gtk_box_pack_start (GTK_BOX (top_box), menu, FALSE, FALSE, 0);
> -+  menu = gtk_ui_manager_get_widget (ui_manager, "/MenuBar/TasksMenu");
> -+  owl_set_window_menu_item (GTK_WINDOW (window), GTK_MENU_ITEM (menu));
> -
> -   box = gtk_vbox_new (FALSE, 4);
> -   gtk_container_set_border_width (GTK_CONTAINER (box), 4);
> -Index: src/gtk/Makefile.am
> -===================================================================
> ---- src/gtk/Makefile.am        (revision 338)
> -+++ src/gtk/Makefile.am        (working copy)
> -@@ -4,7 +4,7 @@
> - bin_PROGRAMS = tasks
> - tasks_CPPFLAGS = -I$(top_srcdir)/
> - tasks_CFLAGS = $(WARN_CFLAGS) $(GTK_CFLAGS) $(ECAL_CFLAGS) $(SEXY_CFLAGS)
> --tasks_LDADD = $(top_builddir)/libkoto/libkoto.a $(GTK_LIBS) $(ECAL_LIBS) $(SEXY_LIBS)
> -+tasks_LDADD = $(top_builddir)/libkoto/libkoto.a $(GTK_LIBS) $(ECAL_LIBS) $(SEXY_LIBS)  -lowl
> -
> - tasks_SOURCES = \
> -       main.c \
> diff --git a/meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb b/meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb
> index f0d9542..992596e 100644
> --- a/meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb
> +++ b/meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb
> @@ -10,6 +10,4 @@ SRC_URI = "http://pimlico-project.org/sources/${BPN}/${BPN}-${PV}.tar.gz"
>  SRC_URI[md5sum] = "0afd969758561599fd782e1effb39c08"
>  SRC_URI[sha256sum] = "1a7fdc5f95a2193a1a25fdb13f071867fb7e42245ce19ccee4bcccb69e557f2e"
>
> -OWL_poky = "--with-owl"
> -
> -PR = "r2"
> +PR = "r3"
> --
> 1.7.10
>


