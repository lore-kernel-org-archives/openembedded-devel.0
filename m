Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1PFaAt-0007p3-3G
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Nov 2010 23:26:52 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 1B0AE77AEFA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Nov 2010 17:25:56 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07742-03 for <openembedded-devel@lists.openembedded.org>; 
	Mon,  8 Nov 2010 17:25:56 -0500 (EST)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id C9C1961D3E3; Mon,  8 Nov 2010 17:25:55 -0500 (EST)
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 66FBF77AEFA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Nov 2010 17:25:52 -0500 (EST)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id 5E9005001A0; Mon,  8 Nov 2010 17:25:52 -0500 (EST)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Nov 2010 17:25:52 -0500
Message-Id: <1289255152-27798-2-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1289255152-27798-1-git-send-email-msmith@cbnco.com>
References: <1289255152-27798-1-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.jrz.cbn
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] metacity: patch configure to add --disable-canberra
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
X-List-Received-Date: Mon, 08 Nov 2010 22:26:52 -0000

Canberra is still enabled by default, but amenders can add
--disable-canberra to EXTRA_OECONF.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 .../gnome/metacity/add-disable-canberra-flag.patch |  117 ++++++++++++++++++++
 recipes/gnome/metacity_2.30.3.bb                   |    6 +-
 2 files changed, 122 insertions(+), 1 deletions(-)
 create mode 100644 recipes/gnome/metacity/add-disable-canberra-flag.patch

diff --git a/recipes/gnome/metacity/add-disable-canberra-flag.patch b/recipes/gnome/metacity/add-disable-canberra-flag.patch
new file mode 100644
index 0000000..df4a36f
--- /dev/null
+++ b/recipes/gnome/metacity/add-disable-canberra-flag.patch
@@ -0,0 +1,117 @@
+configure.in: add flag to disable canberra
+
+For embedded builds, it'd be nice to be able to disable canberra.
+Canberra is still enabled by default.
+
+Upstream: https://bugzilla.gnome.org/show_bug.cgi?id=634360
+
+--- metacity-2.30.3/config.h.in.orig	2010-11-08 15:41:29.000000000 -0500
++++ metacity-2.30.3/config.h.in	2010-11-08 15:51:54.000000000 -0500
+@@ -15,6 +15,9 @@
+ /* Define to 1 if you have the `bind_textdomain_codeset' function. */
+ #undef HAVE_BIND_TEXTDOMAIN_CODESET
+ 
++/* Build with canberra support */
++#undef HAVE_CANBERRA
++
+ /* Building with compositing manager support */
+ #undef HAVE_COMPOSITE_EXTENSIONS
+ 
+--- metacity-2.30.3/configure.in.orig	2010-11-08 15:41:15.000000000 -0500
++++ metacity-2.30.3/configure.in	2010-11-08 15:51:44.000000000 -0500
+@@ -155,7 +155,7 @@
+        ;;
+ esac
+ 
+-METACITY_PC_MODULES="gtk+-$GTK_API_VERSION >= $GTK_MIN_VERSION pango >= 1.2.0 $CANBERRA_GTK"
++METACITY_PC_MODULES="gtk+-$GTK_API_VERSION >= $GTK_MIN_VERSION pango >= 1.2.0"
+ AC_SUBST(GTK_API_VERSION)
+ 
+ AC_ARG_ENABLE(gconf,
+@@ -168,6 +168,16 @@
+     METACITY_PC_MODULES="$METACITY_PC_MODULES gconf-2.0 >= 1.2.0"
+ fi
+ 
++AC_ARG_ENABLE(canberra,
++  AC_HELP_STRING([--disable-canberra],
++                 [disable use of canberra for event sounds, for embedded non-GNOME builds]),,
++  enable_canberra=yes)
++
++if test x$enable_canberra = xyes; then
++    AC_DEFINE(HAVE_CANBERRA,1,[Build with canberra support])
++    METACITY_PC_MODULES="$METACITY_PC_MODULES $CANBERRA_GTK"
++fi
++
+ AC_ARG_ENABLE(verbose-mode,
+   AC_HELP_STRING([--disable-verbose-mode],
+                  [disable metacity's ability to do verbose logging, for embedded/size-sensitive custom builds]),,
+@@ -596,6 +606,7 @@
+ 	compiler:		  ${CC}
+ 
+ 	GConf:                    ${enable_gconf}
++	Canberra:                 ${enable_canberra}
+ 	XFree86 Xinerama:         ${use_xfree_xinerama}
+ 	Solaris Xinerama:         ${use_solaris_xinerama}
+ 	Startup notification:     ${have_startup_notification}
+--- metacity-2.30.3/src/core/bell.c.orig	2010-09-04 12:09:52.000000000 -0400
++++ metacity-2.30.3/src/core/bell.c	2010-11-08 15:54:47.000000000 -0500
+@@ -52,7 +52,10 @@
+ #include "bell.h"
+ #include "screen-private.h"
+ #include "prefs.h"
++
++#ifdef HAVE_CANBERRA
+ #include <canberra-gtk.h>
++#endif
+ 
+ /**
+  * Flashes one entire screen.  This is done by making a window the size of the
+@@ -284,8 +287,10 @@
+ 
+   if (meta_prefs_bell_is_audible ()) 
+     {
+-      ca_proplist *p;
+       XkbBellNotifyEvent *xkb_bell_event = (XkbBellNotifyEvent*) xkb_ev;
++
++#ifdef HAVE_CANBERRA
++      ca_proplist *p;
+       MetaWindow *window;
+       int res;
+ 
+@@ -312,6 +317,9 @@
+       ca_proplist_destroy (p);
+ 
+       if (res != CA_SUCCESS && res != CA_ERROR_DISABLED)
++#else
++      if (1)
++#endif /* HAVE_CANBERRA */
+         {      
+           /* ...and in case that failed we use the classic X11 bell. */
+           XkbForceDeviceBell (display->xdisplay, 
+--- metacity-2.30.3/src/core/workspace.c.orig	2010-09-04 12:09:53.000000000 -0400
++++ metacity-2.30.3/src/core/workspace.c	2010-11-08 15:50:52.000000000 -0500
+@@ -29,7 +29,10 @@
+ #include "prefs.h"
+ #include <X11/Xatom.h>
+ #include <string.h>
++
++#ifdef HAVE_CANBERRA
+ #include <canberra-gtk.h>
++#endif
+ 
+ void meta_workspace_queue_calc_showing   (MetaWorkspace *workspace);
+ static void set_active_space_hint        (MetaScreen *screen);
+@@ -355,11 +358,13 @@
+     goto finish;
+   }
+ 
++#ifdef HAVE_CANBERRA
+   ca_context_play(ca_gtk_context_get(), 1,
+                   CA_PROP_EVENT_ID, e,
+                   CA_PROP_EVENT_DESCRIPTION, "Desktop switched",
+                   CA_PROP_CANBERRA_CACHE_CONTROL, "permanent",
+                   NULL);
++#endif
+ 
+  finish:
+   meta_screen_free_workspace_layout (&layout);
diff --git a/recipes/gnome/metacity_2.30.3.bb b/recipes/gnome/metacity_2.30.3.bb
index 317a192..bb9a80e 100644
--- a/recipes/gnome/metacity_2.30.3.bb
+++ b/recipes/gnome/metacity_2.30.3.bb
@@ -5,7 +5,11 @@ DEPENDS = "libcanberra libwnck startup-notification gtk+ gconf gdk-pixbuf-csourc
 
 inherit gnome update-alternatives
 
-SRC_URI += "file://crosscompile.patch "
+PR = "r1"
+
+SRC_URI += "file://crosscompile.patch;apply=yes \
+	file://add-disable-canberra-flag.patch;apply=yes \
+"
 
 SRC_URI[archive.md5sum] = "553784f376d96b902e19ff437cd5b339"
 SRC_URI[archive.sha256sum] = "08f887018fa5e447cf184d03bae3fe2c05fdb7583bed6768e3b4d66392fc18dd"
-- 
1.7.0.4



