Received: from [65.182.109.83] (helo=mta4.brinkster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1MxgPr-0003PS-0E
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Oct 2009 14:23:51 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta4.brinkster.com (Postfix) with ESMTP id 9D534280427
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2009 08:22:48 -0400 (EDT)
X-Virus-Scanned: amavisd-new at 
Received: from mta4.brinkster.com ([127.0.0.1])
	by localhost (mta4.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EZQE+FbKNNIW
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2009 08:22:42 -0400 (EDT)
Received: from MareImbrium (82-46-19-72.cable.ubr02.bath.blueyonder.co.uk
	[82.46.19.72])
	by mta4.brinkster.com (Postfix) with ESMTP id 74A6B28037B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2009 08:22:38 -0400 (EDT)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 13 Oct 2009 13:22:03 +0100
Message-ID: <007401ca4bff$ca83f630$5f8be290$@Willis@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcpL/8WGle9Tw9vsR+6de2RbTL216A==
X-SA-Exim-Connect-IP: 65.182.109.83
X-SA-Exim-Mail-From: John.Willis@Distant-earth.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [RFC] Experimental XFCE 4.6.1 support.
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
X-List-Received-Date: Tue, 13 Oct 2009 12:23:51 -0000
X-Groupsio-MsgNum: 13414
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0075_01CA4C08.2C485E30"
Content-Language: en-us

------=_NextPart_000_0075_01CA4C08.2C485E30
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit

Attached is the 1st cut of some recipe patches I have been hacking on to add
XFCE 4.6.1 to OpenEmbedded. 

These recipes are far from perfect (yet to be style checked and I am sure
there are some packaging omissions/bugs in there) but I am posting them here
to ensure they don't get lost and get any feedback. 

They are in no way fit for use in anger and they currently don't play nicely
with the existing 4.4.* recipes (side by side versioning/build issues etc.).

The patch introduces an xfce-base folder for the core XFCE files and an
xfce-extras for holding the non-core support applications, ristretto,
squeeze, gigolo etc. etc.

It also introduces a new task-xfce46-base.bb/task-xfce46-extras.bb to tie it
all up. xfce46-image.bb should build you up a sample image if you so desire.

Regards,

John Willis

--

> What is a grue?

The grue is a sinister, lurking presence in the dark places of the earth.
Its favourite diet is adventurers, but its insatiable appetite is tempered
by its fear of light. No grue has ever been seen by the light of day, and
few have survived its fearsome jaws to tell the tale.


------=_NextPart_000_0075_01CA4C08.2C485E30
Content-Type: application/octet-stream;
	name="0037-xfxe-4.6.1-Start-to-add-XFCE-4.6.1-support-to-OE.-Th.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0037-xfxe-4.6.1-Start-to-add-XFCE-4.6.1-support-to-OE.-Th.patch"

From 4e6a873d6b83da758dd4be77f6323457741c07b1 Mon Sep 17 00:00:00 2001
From: David-John Willis <John.Willis@Distant-earth.com>
Date: Tue, 13 Oct 2009 12:23:45 +0100
Subject: [PATCH 37/38] xfxe 4.6.1: Start to add XFCE 4.6.1 support to OE. T=
his currently does not play well side by side with 4.4.* so is an RFC at th=
e moment.

---
 recipes/images/xfce46-image.bb                     |   14 ++
 recipes/tasks/task-xfce46-base.bb                  |   32 ++++
 recipes/tasks/task-xfce46-extras.bb                |   35 ++++
 recipes/xfce-base/exo/configure.patch              |   43 +++++
 recipes/xfce-base/exo/configure.patch.clean        |   57 ++++++
 recipes/xfce-base/exo/exo-0.3.101-iocharset.patch  |   79 ++++++++
 .../exo/exo-0.3.101-iocharset.patch.clean          |  195 ++++++++++++++++=
++++
 recipes/xfce-base/exo/exo-no-tests.patch           |   14 ++
 recipes/xfce-base/exo/exo-no-tests.patch.clean     |   37 ++++
 recipes/xfce-base/exo_0.3.101.bb                   |   33 ++++
 recipes/xfce-base/gtk-xfce-engine_2.6.0.bb         |   13 ++
 recipes/xfce-base/libxfce4menu_4.6.1.bb            |   13 ++
 recipes/xfce-base/libxfce4util_4.6.1.bb            |   30 +++
 recipes/xfce-base/libxfcegui4_4.6.1.bb             |   21 ++
 recipes/xfce-base/thunar_1.0.1.bb                  |   28 +++
 recipes/xfce-base/xfce-terminal/into-support.patch |   94 ++++++++++
 recipes/xfce-base/xfce-terminal_0.2.12.bb          |   15 ++
 recipes/xfce-base/xfce-utils_4.6.1.bb              |   32 ++++
 recipes/xfce-base/xfce4-appfinder_4.6.1.bb         |   12 ++
 recipes/xfce-base/xfce4-dev-tools_4.6.0.bb         |   17 ++
 recipes/xfce-base/xfce4-mixer_4.6.1.bb             |   16 ++
 recipes/xfce-base/xfce4-panel_4.6.1.bb             |   36 ++++
 recipes/xfce-base/xfce4-power-manager_4.6.1.bb     |    1 +
 recipes/xfce-base/xfce4-session_4.6.1.bb           |   21 ++
 .../xfce4-settings-4.6.1-configure.patch           |   11 +
 .../xfce4-settings-4.6.1-libxklavier.patch         |   12 ++
 .../xfce4-settings-4.6.1-workspaces.c.patch        |   17 ++
 recipes/xfce-base/xfce4-settings_4.6.1.bb          |   20 ++
 recipes/xfce-base/xfconf_4.6.1.bb                  |   16 ++
 ...egfault-when-removable-icons-are-disabled.patch |   16 ++
 .../xfdesktop/relocation-and-memleak.patch         |   49 +++++
 .../xfdesktop/xfdesktop-4.4.3-fix-build.patch      |   10 +
 recipes/xfce-base/xfdesktop_4.6.1.bb               |   16 ++
 recipes/xfce-base/xfwm4-themes_4.6.0.bb            |   24 +++
 recipes/xfce-base/xfwm4_4.6.1.bb                   |   33 ++++
 recipes/xfce-extras/gigolo_0.3.2.bb                |   13 ++
 recipes/xfce-extras/mousepad_0.2.16.bb             |    9 +
 .../xfce-extras/notification-daemon-xfce_0.3.7.bb  |   23 +++
 recipes/xfce-extras/orage_4.6.1.bb                 |   16 ++
 recipes/xfce-extras/ristretto_0.0.21.bb            |   12 ++
 recipes/xfce-extras/squeeze_0.2.3.bb               |   12 ++
 recipes/xfce-extras/xfce4-notifyd_0.1.0.bb         |   21 ++
 recipes/xfce-extras/xfprint_4.6.1.bb               |   13 ++
 43 files changed, 1231 insertions(+), 0 deletions(-)
 create mode 100755 recipes/images/xfce46-image.bb
 create mode 100755 recipes/tasks/task-xfce46-base.bb
 create mode 100755 recipes/tasks/task-xfce46-extras.bb
 create mode 100755 recipes/xfce-base/exo/configure.patch
 create mode 100644 recipes/xfce-base/exo/configure.patch.clean
 create mode 100644 recipes/xfce-base/exo/exo-0.3.101-iocharset.patch
 create mode 100644 recipes/xfce-base/exo/exo-0.3.101-iocharset.patch.clean
 create mode 100755 recipes/xfce-base/exo/exo-no-tests.patch
 create mode 100644 recipes/xfce-base/exo/exo-no-tests.patch.clean
 create mode 100755 recipes/xfce-base/exo_0.3.101.bb
 create mode 100755 recipes/xfce-base/gtk-xfce-engine_2.6.0.bb
 create mode 100755 recipes/xfce-base/libxfce4menu_4.6.1.bb
 create mode 100755 recipes/xfce-base/libxfce4util_4.6.1.bb
 create mode 100755 recipes/xfce-base/libxfcegui4_4.6.1.bb
 create mode 100755 recipes/xfce-base/thunar_1.0.1.bb
 create mode 100755 recipes/xfce-base/xfce-terminal/into-support.patch
 create mode 100755 recipes/xfce-base/xfce-terminal_0.2.12.bb
 create mode 100755 recipes/xfce-base/xfce-utils_4.6.1.bb
 create mode 100755 recipes/xfce-base/xfce4-appfinder_4.6.1.bb
 create mode 100755 recipes/xfce-base/xfce4-dev-tools_4.6.0.bb
 create mode 100755 recipes/xfce-base/xfce4-mixer_4.6.1.bb
 create mode 100755 recipes/xfce-base/xfce4-panel_4.6.1.bb
 create mode 100755 recipes/xfce-base/xfce4-power-manager_4.6.1.bb
 create mode 100755 recipes/xfce-base/xfce4-session_4.6.1.bb
 create mode 100755 recipes/xfce-base/xfce4-settings/xfce4-settings-4.6.1-c=
onfigure.patch
 create mode 100755 recipes/xfce-base/xfce4-settings/xfce4-settings-4.6.1-l=
ibxklavier.patch
 create mode 100755 recipes/xfce-base/xfce4-settings/xfce4-settings-4.6.1-w=
orkspaces.c.patch
 create mode 100755 recipes/xfce-base/xfce4-settings_4.6.1.bb
 create mode 100755 recipes/xfce-base/xfconf_4.6.1.bb
 create mode 100755 recipes/xfce-base/xfdesktop/fix-segfault-when-removable=
-icons-are-disabled.patch
 create mode 100755 recipes/xfce-base/xfdesktop/relocation-and-memleak.patc=
h
 create mode 100755 recipes/xfce-base/xfdesktop/xfdesktop-4.4.3-fix-build.p=
atch
 create mode 100755 recipes/xfce-base/xfdesktop_4.6.1.bb
 create mode 100755 recipes/xfce-base/xfwm4-themes_4.6.0.bb
 create mode 100755 recipes/xfce-base/xfwm4_4.6.1.bb
 create mode 100755 recipes/xfce-extras/gigolo_0.3.2.bb
 create mode 100755 recipes/xfce-extras/mousepad_0.2.16.bb
 create mode 100755 recipes/xfce-extras/notification-daemon-xfce_0.3.7.bb
 create mode 100755 recipes/xfce-extras/orage_4.6.1.bb
 create mode 100755 recipes/xfce-extras/ristretto_0.0.21.bb
 create mode 100755 recipes/xfce-extras/squeeze_0.2.3.bb
 create mode 100755 recipes/xfce-extras/xfce4-notifyd_0.1.0.bb
 create mode 100755 recipes/xfce-extras/xfprint_4.6.1.bb

diff --git a/recipes/images/xfce46-image.bb b/recipes/images/xfce46-image.b=
b
new file mode 100755
index 0000000..068f5df
--- /dev/null
+++ b/recipes/images/xfce46-image.bb
@@ -0,0 +1,14 @@
+export IMAGE_BASENAME =3D "xfce46-image"
+
+IMAGE_LINGUAS =3D ""
+
+X_DEPENDS =3D "virtual/xserver"
+X_RDEPENDS =3D "${XSERVER}"
+
+XFCE_DEPENDS =3D "${MACHINE_TASK_PROVIDER} task-xfce46-base"
+XFCE_RDEPENDS =3D "${XFCE_DEPENDS}"
+
+IMAGE_INSTALL =3D "${X_RDEPENDS} ${XFCE_RDEPENDS}"
+DEPENDS =3D "${X_DEPENDS} ${XFCE_DEPENDS}"
+
+inherit image
diff --git a/recipes/tasks/task-xfce46-base.bb b/recipes/tasks/task-xfce46-=
base.bb
new file mode 100755
index 0000000..ad002f2
--- /dev/null
+++ b/recipes/tasks/task-xfce46-base.bb
@@ -0,0 +1,32 @@
+# task-xfce46-base
+
+DESCRIPTION =3D "All packages required for a base installation of XFCE 4.6=
.*"
+PR =3D "r1.3"
+
+inherit task
+
+RDEPENDS_${PN} =3D " \
+    xfwm4 \
+    xfwm4-theme-default \
+    xfce4-session \    =20
+    xfconf \
+    xfdesktop \
+    xfce4-panel \
+    \
+    gtk-xfce-engine \
+    \
+    xfce-utils \
+    xfce4-panel-plugin-actions \
+    xfce4-panel-plugin-clock \
+    xfce4-panel-plugin-iconbox \
+    xfce4-panel-plugin-launcher \
+    xfce4-panel-plugin-pager \
+    xfce4-panel-plugin-separator \
+    xfce4-panel-plugin-showdesktop \
+    xfce4-panel-plugin-systray \
+    xfce4-panel-plugin-tasklist \
+    xfce4-panel-plugin-windowlist \  =20
+    xfce4-settings \
+    xfce-terminal \
+    thunar \
+"
diff --git a/recipes/tasks/task-xfce46-extras.bb b/recipes/tasks/task-xfce4=
6-extras.bb
new file mode 100755
index 0000000..3a7beb6
--- /dev/null
+++ b/recipes/tasks/task-xfce46-extras.bb
@@ -0,0 +1,35 @@
+# task-xfce46-extras
+
+DESCRIPTION =3D "Extra suggested packages to produce a recommended XFCE 4.=
6.* installation"
+PR =3D "r1.3"
+
+inherit task
+
+RDEPENDS_${PN} =3D " \
+    task-xfce46-base \
+    \
+    xfce4-notifyd \
+    xfce4-mixer \
+    xfce4-appfinder \
+    xfprint \   =20
+    midori \
+    orage \
+    squeeze \
+    ristretto \
+    mousepad \=20
+    gigolo \
+"
+
+#    xfwm4-theme-daloa \
+#    xfwm4-theme-moheli \
+#    xfwm4-theme-default-4.0 \
+#    xfwm4-theme-default-4.2 \
+#    xfwm4-theme-default-4.4 \
+#    xfwm4-theme-katiola \
+#    xfwm4-theme-kokodi \
+#    xfwm4-theme-moheli \
+#    xfwm4-theme-sassandra \
+#    xfwm4-theme-stoneage \
+#    xfwm4-theme-therapy \
+#    xfwm4-theme-tyrex \
+#    xfwm4-theme-wallis \ =20
diff --git a/recipes/xfce-base/exo/configure.patch b/recipes/xfce-base/exo/=
configure.patch
new file mode 100755
index 0000000..2ccfcfc
--- /dev/null
+++ b/recipes/xfce-base/exo/configure.patch
@@ -0,0 +1,43 @@
+--- exo-0.3.4/configure.in~	2007-12-02 10:37:06.000000000 -0200
++++ exo-0.3.4/configure.in	2008-06-05 17:21:42.000000000 -0300
+@@ -127,22 +127,24 @@
+ dnl ***************************************
+ dnl *** Check for strftime() extensions ***
+ dnl ***************************************
+-AC_TRY_RUN([
+-  #include <string.h>
+-  #include <time.h>
+-  int
+-  main (int argc, char **argv)
+-  {
+-    struct tm tm;
+-    char      buffer[16];
+-    tm.tm_year =3D 81;
+-    if (strftime (buffer, 16, "%EY", &tm) =3D=3D 4 && strcmp (buffer, "19=
81") =3D=3D 0)
+-      return 0;
+-    return 1;
+-  }
+-], [
+-  AC_DEFINE([HAVE_STRFTIME_EXTENSION], 1, [Define if strftime supports %E=
 and %O modifiers.])
+-])
++dnl grrrr...  this doesn't work for cross compiling, define it for OE
++AC_DEFINE([HAVE_STRFTIME_EXTENSION], 1, [Define if strftime supports %E a=
nd %O modifiers.])
++dnl AC_TRY_RUN([
++dnl   #include <string.h>
++dnl   #include <time.h>
++dnl   int
++dnl   main (int argc, char **argv)
++dnl   {
++dnl     struct tm tm;
++dnl     char      buffer[16];
++dnl     tm.tm_year =3D 81;
++dnl     if (strftime (buffer, 16, "%EY", &tm) =3D=3D 4 && strcmp (buffer,=
 "1981") =3D=3D 0)
++dnl       return 0;
++dnl     return 1;
++dnl   }
++dnl ], [
++dnl   AC_DEFINE([HAVE_STRFTIME_EXTENSION], 1, [Define if strftime support=
s %E and %O modifiers.])
++dnl ])
+=20
+ dnl ******************************
+ dnl *** Check for i18n support ***
diff --git a/recipes/xfce-base/exo/configure.patch.clean b/recipes/xfce-bas=
e/exo/configure.patch.clean
new file mode 100644
index 0000000..6677ae9
--- /dev/null
+++ b/recipes/xfce-base/exo/configure.patch.clean
@@ -0,0 +1,57 @@
+## Reminder:  Tabs should not be used (use spaces instead)  in : --- exo-0=
.3.4/configure.in~	2007-12-02 10:37:06.000000000 -0200
+## Warning: unknown variable/routine "--- exo-0.3.4/configure.in~	2007-12-=
02 10:37:06.000000000 -0200
+"
+## Reminder:  Tabs should not be used (use spaces instead)  in : +++ exo-0=
.3.4/configure.in	2008-06-05 17:21:42.000000000 -0300
+## Warning: unknown variable/routine "+++ exo-0.3.4/configure.in	2008-06-0=
5 17:21:42.000000000 -0300
+"
+## Warning: unknown variable/routine "@@ -127,22 +127,24 @@
+"
+## Warning: unknown variable/routine " dnl *******************************=
********
+"
+## Warning: unknown variable/routine " dnl *** Check for strftime() extens=
ions ***
+"
+## Warning: unknown variable/routine " dnl *******************************=
********
+"
+
+--- exo-0.3.4/configure.in~     2007-12-02 10:37:06.000000000 -0200
++++ exo-0.3.4/configure.in      2008-06-05 17:21:42.000000000 -0300
+@@ -127,22 +127,24 @@
+ dnl ***************************************
+ dnl *** Check for strftime() extensions ***
+ dnl ***************************************
+-AC_TRY_RUN([
+-  #include <string.h>
+-  #include <time.h>
+-  int
+-  main (int argc, char **argv)
+-  {
+-    struct tm tm;
+-    char      buffer[16];
+-    tm.tm_year =3D 81;
+-    if (strftime (buffer, 16, "%EY", &tm) =3D=3D 4 && strcmp (buffer, "19=
81") =3D=3D 0)
+-      return 0;
+-    return 1;
+-  }
+-], [
+-  AC_DEFINE([HAVE_STRFTIME_EXTENSION], 1, [Define if strftime supports %E=
 and %O modifiers.])
+-])
++dnl grrrr...  this doesn't work for cross compiling, define it for OE
++AC_DEFINE([HAVE_STRFTIME_EXTENSION], 1, [Define if strftime supports %E a=
nd %O modifiers.])
++dnl AC_TRY_RUN([
++dnl   #include <string.h>
++dnl   #include <time.h>
++dnl   int
++dnl   main (int argc, char **argv)
++dnl   {
++dnl     struct tm tm;
++dnl     char      buffer[16];
++dnl     tm.tm_year =3D 81;
++dnl     if (strftime (buffer, 16, "%EY", &tm) =3D=3D 4 && strcmp (buffer,=
 "1981") =3D=3D 0)
++dnl       return 0;
++dnl     return 1;
++dnl   }
++dnl ], [
++dnl   AC_DEFINE([HAVE_STRFTIME_EXTENSION], 1, [Define if strftime support=
s %E and %O modifiers.])
++dnl ])
+ dnl ******************************
+ dnl *** Check for i18n support ***
diff --git a/recipes/xfce-base/exo/exo-0.3.101-iocharset.patch b/recipes/xf=
ce-base/exo/exo-0.3.101-iocharset.patch
new file mode 100644
index 0000000..a667f11
--- /dev/null
+++ b/recipes/xfce-base/exo/exo-0.3.101-iocharset.patch
@@ -0,0 +1,79 @@
+diff --git a/exo-mount/exo-mount-hal.c b/exo-mount/exo-mount-hal.c
+index 791a536..4b130c3 100644
+--- a/exo-mount/exo-mount-hal.c
++++ b/exo-mount/exo-mount-hal.c
+@@ -34,6 +34,8 @@
+ #include <unistd.h>
+ #endif
+=20
++#include <langinfo.h>
++
+ #include <libhal-storage.h>
+=20
+ #include <exo-hal/exo-hal.h>
+@@ -616,6 +618,30 @@ oom:  g_set_error (error, G_FILE_ERROR, G_FILE_ERROR_=
NOMEM, g_strerror (ENOMEM))
+=20
+=20
+ /**
++ * exo_mount_hal_iocharset:
++ *
++ * Determines the preferred iocharset for filesystems
++ * that support it.
++ *
++ * Return value: iocharset string or %NULL if none.
++ **/
++static const gchar*
++exo_mount_hal_iocharset ()
++{
++  const gchar* cs =3D g_getenv("EXO_MOUNT_IOCHARSET");
++  if (cs !=3D NULL)
++    return cs;
++
++  const char* codeset =3D nl_langinfo (CODESET);
++  if (codeset && !strcmp (codeset, "UTF-8"))
++    return "utf8";
++
++  return NULL;
++}
++
++
++
++/**
+  * exo_mount_hal_device_mount:
+  * @device : an #ExoMountHalDevice.
+  * @error  : return location for errors or %NULL.
+@@ -676,6 +702,12 @@ exo_mount_hal_device_mount (ExoMountHalDevice *device=
,
+               /* however this one is FreeBSD specific */
+               options[n++] =3D g_strdup ("longnames");
+             }
++          else if (strcmp (device->fsoptions[m], "iocharset=3D") =3D=3D 0=
)
++            {
++              const gchar* iocharset =3D exo_mount_hal_iocharset();
++              if (iocharset !=3D NULL)
++                options[n++] =3D g_strdup_printf ("iocharset=3D%s", iocha=
rset);
++            }
+         }
+     }
+=20
+diff --git a/exo-mount/main.c b/exo-mount/main.c
+index 80eae1d..f442019 100644
+--- a/exo-mount/main.c
++++ b/exo-mount/main.c
+@@ -39,6 +39,8 @@
+ #include <string.h>
+ #endif
+=20
++#include <locale.h>
++
+ #include <glib/gstdio.h>
+=20
+ #include <exo-hal/exo-hal.h>
+@@ -97,6 +99,8 @@ main (int argc, char **argv)
+   /* initialize the i18n support */
+   xfce_textdomain (GETTEXT_PACKAGE, PACKAGE_LOCALE_DIR, "UTF-8");
+=20
++  setlocale(LC_CTYPE, "");
++
+   /* initialize GTK+ */
+   if (!gtk_init_with_args (&argc, &argv, "Xfce mount", entries, GETTEXT_P=
ACKAGE, &err))
+     {
diff --git a/recipes/xfce-base/exo/exo-0.3.101-iocharset.patch.clean b/reci=
pes/xfce-base/exo/exo-0.3.101-iocharset.patch.clean
new file mode 100644
index 0000000..c50a6aa
--- /dev/null
+++ b/recipes/xfce-base/exo/exo-0.3.101-iocharset.patch.clean
@@ -0,0 +1,195 @@
+## Warning: unknown variable/routine "diff --git a/exo-mount/exo-mount-hal=
.c b/exo-mount/exo-mount-hal.c
+"
+## Warning: unknown variable/routine "index 791a536..4b130c3 100644
+"
+## Warning: unknown variable/routine "--- a/exo-mount/exo-mount-hal.c
+"
+## Warning: unknown variable/routine "+++ b/exo-mount/exo-mount-hal.c
+"
+## Warning: unknown variable/routine "@@ -34,6 +34,8 @@
+"
+## Reminder:  Comments inside bb files are allowed using the '#' character=
 at the beginning of a line  in :  #include <unistd.h>
+## Reminder:  Comments inside bb files are allowed using the '#' character=
 at the beginning of a line  in :  #endif
+## Warning: unknown variable/routine "+#include <langinfo.h>
+"
+## Warning: unknown variable/routine "+
+"
+## Reminder:  Comments inside bb files are allowed using the '#' character=
 at the beginning of a line  in :  #include <libhal-storage.h>
+## Reminder:  Comments inside bb files are allowed using the '#' character=
 at the beginning of a line  in :  #include <exo-hal/exo-hal.h>
+## Warning: unknown variable/routine "@@ -616,6 +618,30 @@ oom:  g_set_err=
or (error, G_FILE_ERROR, G_FILE_ERROR_NOMEM, g_strerror (ENOMEM))
+"
+## Warning: unknown variable/routine " /**
+"
+## Warning: unknown variable/routine "+ * exo_mount_hal_iocharset:
+"
+## Warning: unknown variable/routine "+ *
+"
+## Warning: unknown variable/routine "+ * Determines the preferred iochars=
et for filesystems
+"
+## Warning: unknown variable/routine "+ * that support it.
+"
+## Warning: unknown variable/routine "+ *
+"
+## Warning: unknown variable/routine "+ * Return value: iocharset string o=
r %NULL if none.
+"
+## Warning: unknown variable/routine "+ **/
+"
+## Warning: unknown variable/routine "+static const gchar*
+"
+## Warning: unknown variable/routine "+exo_mount_hal_iocharset ()
+"
+## Warning: unknown variable/routine "+{
+"
+## Warning: unknown variable/routine "+  const gchar* cs =3D g_getenv("EXO=
_MOUNT_IOCHARSET");
+"
+## Warning: unknown variable/routine "+  if (cs !=3D NULL)
+"
+## Warning: unknown variable/routine "+    return cs;
+"
+## Warning: unknown variable/routine "+
+"
+## Warning: unknown variable/routine "+  const char* codeset =3D nl_langin=
fo (CODESET);
+"
+## Warning: unknown variable/routine "+  if (codeset && !strcmp (codeset, =
"UTF-8"))
+"
+## Warning: unknown variable/routine "+    return "utf8";
+"
+## Warning: unknown variable/routine "+
+"
+## Warning: unknown variable/routine "+  return NULL;
+"
+## Warning: unknown variable/routine "+}
+"
+## Warning: unknown variable/routine "+
+"
+## Warning: unknown variable/routine "+
+"
+## Warning: unknown variable/routine "+
+"
+## Warning: unknown variable/routine "+/**
+"
+## Warning: unknown variable/routine "  * exo_mount_hal_device_mount:
+"
+## Warning: unknown variable/routine "  * @device : an #ExoMountHalDevice.
+"
+## Warning: unknown variable/routine "  * @error  : return location for er=
rors or %NULL.
+"
+## Warning: unknown variable/routine "@@ -676,6 +702,12 @@ exo_mount_hal_d=
evice_mount (ExoMountHalDevice *device,
+"
+## Warning: unknown variable/routine "               /* however this one i=
s FreeBSD specific */
+"
+## Warning: unknown variable/routine "               options[n++] =3D g_st=
rdup ("longnames");
+"
+## Warning: unknown variable/routine "             }
+"
+## Warning: unknown variable/routine "+          else if (strcmp (device->=
fsoptions[m], "iocharset=3D") =3D=3D 0)
+"
+## Warning: unknown variable/routine "+            {
+"
+## Warning: unknown variable/routine "+              const gchar* iocharse=
t =3D exo_mount_hal_iocharset();
+"
+## Warning: unknown variable/routine "+              if (iocharset !=3D NU=
LL)
+"
+## Warning: unknown variable/routine "+                options[n++] =3D g_=
strdup_printf ("iocharset=3D%s", iocharset);
+"
+## Warning: unknown variable/routine "+            }
+"
+## Warning: unknown variable/routine "         }
+"
+## Warning: unknown variable/routine "     }
+"
+## Warning: unknown variable/routine "diff --git a/exo-mount/main.c b/exo-=
mount/main.c
+"
+## Warning: unknown variable/routine "index 80eae1d..f442019 100644
+"
+## Warning: unknown variable/routine "--- a/exo-mount/main.c
+"
+## Warning: unknown variable/routine "+++ b/exo-mount/main.c
+"
+## Warning: unknown variable/routine "@@ -39,6 +39,8 @@
+"
+## Reminder:  Comments inside bb files are allowed using the '#' character=
 at the beginning of a line  in :  #include <string.h>
+## Reminder:  Comments inside bb files are allowed using the '#' character=
 at the beginning of a line  in :  #endif
+## Warning: unknown variable/routine "+#include <locale.h>
+"
+## Warning: unknown variable/routine "+
+"
+## Reminder:  Comments inside bb files are allowed using the '#' character=
 at the beginning of a line  in :  #include <glib/gstdio.h>
+## Reminder:  Comments inside bb files are allowed using the '#' character=
 at the beginning of a line  in :  #include <exo-hal/exo-hal.h>
+## Warning: unknown variable/routine "@@ -97,6 +99,8 @@ main (int argc, ch=
ar **argv)
+"
+## Warning: unknown variable/routine "   /* initialize the i18n support */
+"
+## Reminder:  No spaces are allowed at the beginning of lines that define =
a variable or a do_ routine  in :    xfce_textdomain (GETTEXT_PACKAGE, PACK=
AGE_LOCALE_DIR, "UTF-8");
+#include <unistd.h>
+#endif
+#include <libhal-storage.h>
+#include <string.h>
+#endif
+#include <glib/gstdio.h>
+
+diff --git a/exo-mount/exo-mount-hal.c b/exo-mount/exo-mount-hal.c
+index 791a536..4b130c3 100644
+--- a/exo-mount/exo-mount-hal.c
++++ b/exo-mount/exo-mount-hal.c
+@@ -34,6 +34,8 @@
++#include <langinfo.h>
++
+#include <exo-hal/exo-hal.h>
+@@ -616,6 +618,30 @@ oom:  g_set_error (error, G_FILE_ERROR, G_FILE_ERROR_=
NOMEM, g_strerror (ENOMEM))
+ /**
++ * exo_mount_hal_iocharset:
++ *
++ * Determines the preferred iocharset for filesystems
++ * that support it.
++ *
++ * Return value: iocharset string or %NULL if none.
++ **/
++static const gchar*
++exo_mount_hal_iocharset ()
++{
++  const gchar* cs =3D g_getenv("EXO_MOUNT_IOCHARSET");
++  if (cs !=3D NULL)
++    return cs;
++
++  const char* codeset =3D nl_langinfo (CODESET);
++  if (codeset && !strcmp (codeset, "UTF-8"))
++    return "utf8";
++
++  return NULL;
++}
++
++
++
++/**
+  * exo_mount_hal_device_mount:
+  * @device : an #ExoMountHalDevice.
+  * @error  : return location for errors or %NULL.
+@@ -676,6 +702,12 @@ exo_mount_hal_device_mount (ExoMountHalDevice *device=
,
+               /* however this one is FreeBSD specific */
+               options[n++] =3D g_strdup ("longnames");
+             }
++          else if (strcmp (device->fsoptions[m], "iocharset=3D") =3D=3D 0=
)
++            {
++              const gchar* iocharset =3D exo_mount_hal_iocharset();
++              if (iocharset !=3D NULL)
++                options[n++] =3D g_strdup_printf ("iocharset=3D%s", iocha=
rset);
++            }
+         }
+     }
+diff --git a/exo-mount/main.c b/exo-mount/main.c
+index 80eae1d..f442019 100644
+--- a/exo-mount/main.c
++++ b/exo-mount/main.c
+@@ -39,6 +39,8 @@
++#include <locale.h>
++
+#include <exo-hal/exo-hal.h>
+@@ -97,6 +99,8 @@ main (int argc, char **argv)
+   /* initialize the i18n support */
+xfce_textdomain (GETTEXT_PACKAGE, PACKAGE_LOCALE_DIR, "UTF-8");
++  setlocale(LC_CTYPE, "");
++
+   /* initialize GTK+ */
+   if (!gtk_init_with_args (&argc, &argv, "Xfce mount", entries, GETTEXT_P=
ACKAGE, &err))
+     {
diff --git a/recipes/xfce-base/exo/exo-no-tests.patch b/recipes/xfce-base/e=
xo/exo-no-tests.patch
new file mode 100755
index 0000000..1cb51ab
--- /dev/null
+++ b/recipes/xfce-base/exo/exo-no-tests.patch
@@ -0,0 +1,14 @@
+The tests/ subdir consists of stuff trying to run a generated file ('exo-c=
source'), which doesn't work on host systems
+
+--- /tmp/Makefile.am	2008-10-30 09:23:41.000000000 +0100
++++ exo-0.3.4/Makefile.am	2008-10-30 09:24:03.011124000 +0100
+@@ -23,8 +23,7 @@
+ 	pixmaps								\
+ 	po								\
+ 	po-doc								\
+-	$(PYTHON_SUBDIR)						\
+-	tests
++	$(PYTHON_SUBDIR)
+=20
+ AUTOMAKE_OPTIONS =3D							\
+ 	1.8								\
diff --git a/recipes/xfce-base/exo/exo-no-tests.patch.clean b/recipes/xfce-=
base/exo/exo-no-tests.patch.clean
new file mode 100644
index 0000000..fc2068d
--- /dev/null
+++ b/recipes/xfce-base/exo/exo-no-tests.patch.clean
@@ -0,0 +1,37 @@
+## Warning: unknown variable/routine "The tests/ subdir consists of stuff =
trying to run a generated file ('exo-csource'), which doesn't work on host =
systems
+"
+## Reminder:  Tabs should not be used (use spaces instead)  in : --- /tmp/=
Makefile.am	2008-10-30 09:23:41.000000000 +0100
+## Warning: unknown variable/routine "--- /tmp/Makefile.am	2008-10-30 09:2=
3:41.000000000 +0100
+"
+## Reminder:  Tabs should not be used (use spaces instead)  in : +++ exo-0=
.3.4/Makefile.am	2008-10-30 09:24:03.011124000 +0100
+## Warning: unknown variable/routine "+++ exo-0.3.4/Makefile.am	2008-10-30=
 09:24:03.011124000 +0100
+"
+## Warning: unknown variable/routine "@@ -23,8 +23,7 @@
+"
+## Reminder:  Tabs should not be used (use spaces instead)  in :  	pixmaps=
								\
+## Warning: unknown variable/routine " 	pixmaps								\
+"
+## Reminder:  Tabs should not be used (use spaces instead)  in :  	po					=
			\
+## Reminder:  Tabs should not be used (use spaces instead)  in :  	po-doc	=
							\
+## Reminder:  Tabs should not be used (use spaces instead)  in : -	$(PYTHO=
N_SUBDIR)						\
+## Reminder:  Tabs should not be used (use spaces instead)  in : -	tests
+## Reminder:  Tabs should not be used (use spaces instead)  in : +	$(PYTHO=
N_SUBDIR)
+## Warning: unknown variable/routine "+	$(PYTHON_SUBDIR)
+"
+## Reminder:  Tabs should not be used (use spaces instead)  in :  AUTOMAKE=
_OPTIONS =3D							\
+## Warning: unknown variable/routine " AUTOMAKE_OPTIONS =3D							\
+"
+## Reminder:  Tabs should not be used (use spaces instead)  in :  	1.8				=
				\
+
+The tests/ subdir consists of stuff trying to run a generated file ('exo-c=
source'), which doesn't work on host systems
+--- /tmp/Makefile.am    2008-10-30 09:23:41.000000000 +0100
++++ exo-0.3.4/Makefile.am       2008-10-30 09:24:03.011124000 +0100
+@@ -23,8 +23,7 @@
+        pixmaps                                                         \
+        po                                                              \
+        po-doc                                                          \
+-       $(PYTHON_SUBDIR)                                                \
+-       tests
++       $(PYTHON_SUBDIR)
+ AUTOMAKE_OPTIONS =3D                                                     =
\
+        1.8                                                             \
diff --git a/recipes/xfce-base/exo_0.3.101.bb b/recipes/xfce-base/exo_0.3.1=
01.bb
new file mode 100755
index 0000000..ad466c2
--- /dev/null
+++ b/recipes/xfce-base/exo_0.3.101.bb
@@ -0,0 +1,33 @@
+DESCRIPTION=3D"XFCE extensions and framework library with session manageme=
nt support"
+DEPENDS =3D "libxfce4util hal liburi-perl-native python-native"
+SECTION =3D "x11"
+PR =3D "r0.2"
+
+inherit xfce
+
+RPROVIDES =3D "exo"=20
+PROVIDES =3D "${RPROVIDES}"
+
+XFCE_VERSION =3D 4.6.1
+
+SRC_URI +=3D " \
+    file://exo-0.3.101-iocharset.patch;patch=3D1 \
+    file://exo-no-tests.patch;patch=3D1 \
+    file://configure.patch;patch=3D1 \
+"
+
+# Note: Python checking is broken
+do_configure_prepend() {
+	sed -i -e s:'`$PKG_CONFIG --variable=3Ddefsdir pygtk-2.0`':\"${STAGING_DA=
TADIR}/pygtk/2.0/defs\":g ${S}/configure.in
+}
+
+do_stage() {
+    autotools_stage_all
+}
+
+FILES_${PN} +=3D "${datadir}/xfce4/ \
+                ${libdir}/python*/site-packages/* \
+                ${prefix}/share/pygtk/2.0/defs/exo-0.3/exo.defs \
+"
+
+FILES_${PN}-dbg +=3D "${libdir}/python*/site-packages/*/.debug/*"
diff --git a/recipes/xfce-base/gtk-xfce-engine_2.6.0.bb b/recipes/xfce-base=
/gtk-xfce-engine_2.6.0.bb
new file mode 100755
index 0000000..d74228f
--- /dev/null
+++ b/recipes/xfce-base/gtk-xfce-engine_2.6.0.bb
@@ -0,0 +1,13 @@
+DESCRIPTION =3D "XFCE theme for GTK"
+DEPENDS +=3D "gtk+"
+SECTION =3D "x11"
+PR =3D "r0.2"
+
+RPROVIDES =3D "gtk-xfce-engine"=20
+
+inherit xfce
+XFCE_VERSION =3D 4.6.1
+
+FILES_${PN} +=3D "${libdir}/gtk-2.0/*/engines/libxfce.so \
+                ${datadir}/themes/"
+FILES_${PN}-dbg +=3D "${libdir}/gtk-2.0/*/engines/.debug"
diff --git a/recipes/xfce-base/libxfce4menu_4.6.1.bb b/recipes/xfce-base/li=
bxfce4menu_4.6.1.bb
new file mode 100755
index 0000000..6bdd167
--- /dev/null
+++ b/recipes/xfce-base/libxfce4menu_4.6.1.bb
@@ -0,0 +1,13 @@
+DESCRIPTION=3D"a freedesktop.org compliant menu library for Xfce4"
+HOMEPAGE=3D"http://www.xfce.org/projects/libraries"
+DEPENDS =3D "gettext pkgconfig intltool"
+RDEPENDS =3D "gtk+ libxfce4util"
+
+LICENSE=3D"LGPL-2 FDL-1.1"
+PR =3D "r0.2"
+
+inherit xfce
+
+do_stage() {
+autotools_stage_all
+}
diff --git a/recipes/xfce-base/libxfce4util_4.6.1.bb b/recipes/xfce-base/li=
bxfce4util_4.6.1.bb
new file mode 100755
index 0000000..9474be0
--- /dev/null
+++ b/recipes/xfce-base/libxfce4util_4.6.1.bb
@@ -0,0 +1,30 @@
+# libxfce4util OE build file
+# Copyright (C) 2004, Advanced Micro Devices, Inc.  All Rights Reserved
+# Released under the MIT license (see COPYING.MIT)
+
+DESCRIPTION =3D "Basic utility library for Xfce4"
+SECTION =3D "x11/libs"
+LICENSE =3D "GPL"
+DEPENDS =3D "glib-2.0 xfce4-dev-tools"
+PR =3D "r0.2"
+
+RPROVIDES =3D "libxfce4util"
+PROVIDES =3D "${RPROVIDES}"
+
+inherit xfce pkgconfig
+
+MACROS=3D"m4/X11.m4 m4/debug.m4 m4/depends.m4 m4/i18n.m4"
+
+do_stage() {
+	install -d ${STAGING_LIBDIR} ${STAGING_INCDIR}/libxfce4util
+	# The line below expands to the list of headers that native makefile
+	# would install.  Complain and/or fix if it's not portable enough
+	for file in  $(eval $(make -n -C libxfce4util install|grep "^list=3D'[^.]=
\\+.h"|cut -d\; -f1); echo $list); do=20
+		install -m 644 libxfce4util/$file ${STAGING_INCDIR}/libxfce4util
+	done
+
+	oe_libinstall -C libxfce4util -so libxfce4util ${STAGING_LIBDIR}
+
+}
+
+FILES_${PN}-dev +=3D " ${datadir}/xfce4/m4"
diff --git a/recipes/xfce-base/libxfcegui4_4.6.1.bb b/recipes/xfce-base/lib=
xfcegui4_4.6.1.bb
new file mode 100755
index 0000000..d412dcd
--- /dev/null
+++ b/recipes/xfce-base/libxfcegui4_4.6.1.bb
@@ -0,0 +1,21 @@
+# libxfcegui4 OE build file
+# Copyright (C) 2004, Advanced Micro Devices, Inc.  All Rights Reserved
+# Released under the MIT license (see COPYING.MIT)
+
+DESCRIPTION =3D "XFCE Widget library and X Window System interaction"
+DEPENDS =3D "gettext pkgconfig intltool virtual/libx11 libxfce4util xfconf=
 dbh libxml2 gtk+ "
+RDEPENDS =3D "xfconf startup-notification "
+
+SECTION =3D "x11/libs"
+PR =3D "r0.2"
+
+RPROVIDES =3D "libxfcegui4"=20
+PROVIDES =3D "${RPROVIDES}"
+
+inherit xfce
+
+do_stage() {
+autotools_stage_all
+}
+
+FILES_${PN} +=3D "${libdir}/xfce4/modules ${datadir}/xfce4/mime ${datadir}=
/icons/hicolor"
diff --git a/recipes/xfce-base/thunar_1.0.1.bb b/recipes/xfce-base/thunar_1=
.0.1.bb
new file mode 100755
index 0000000..7d7dece
--- /dev/null
+++ b/recipes/xfce-base/thunar_1.0.1.bb
@@ -0,0 +1,28 @@
+DESCRIPTION =3D "File manager for the Xfce Desktop Environment"
+DEPENDS =3D "exo dbus-glib libexif xfce4-panel libice libsm gamin"
+RDEPENDS =3D "libxfcegui4 exo dbus-glib libexif xfce4-panel libice libsm g=
amin"
+RRECOMMENDS =3D "shared-mime-info"
+SECTION =3D "x11"
+PR =3D "r0.2"
+
+RPROVIDES =3D "thunar"=20
+
+inherit xfce pkgconfig
+
+XFCE_VERSION =3D 4.6.1
+
+SRC_URI =3D "http://www.us.xfce.org/archive/xfce-${XFCE_VERSION}/src/Thuna=
r-${PV}.tar.bz2"
+
+S =3D "${WORKDIR}/Thunar-${PV}/"
+
+FILES_${PN} +=3D "${libdir}/thunarx-1/*.so \
+		${libdir}/thunarx-1/*.la \
+                ${datadir}/dbus-1 \
+                ${datadir}/thumbnailers \
+                ${datadir}/Thunar \
+                ${datadir}/xfce4"
+FILES_${PN}-dbg +=3D "${libdir}/thunarx-1/.debug/ ${libexecdir}/xfce4/pane=
l-plugins/.debug/"
+
+do_stage () {
+	autotools_stage_all
+}
diff --git a/recipes/xfce-base/xfce-terminal/into-support.patch b/recipes/x=
fce-base/xfce-terminal/into-support.patch
new file mode 100755
index 0000000..30540d0
--- /dev/null
+++ b/recipes/xfce-base/xfce-terminal/into-support.patch
@@ -0,0 +1,94 @@
+diff --git a/terminal/terminal-app.c b/terminal/terminal-app.c
+index 4b7ae6f..a581a85 100644
+--- a/terminal/terminal-app.c
++++ b/terminal/terminal-app.c
+@@ -37,6 +37,8 @@
+ #include <string.h>
+ #endif
+=20
++#include <gdk/gdkx.h>
++
+ #include <terminal/terminal-accel-map.h>
+ #include <terminal/terminal-app.h>
+ #include <terminal/terminal-config.h>
+@@ -565,7 +567,8 @@ terminal_app_open_window (TerminalApp         *app,
+           g_free (geometry);
+=20
+           /* show the window */
+-          gtk_widget_show (window);
++          if (!attr->embed_window)
++            gtk_widget_show (window);
+         }
+=20
+       terminal_screen_launch_child (TERMINAL_SCREEN (terminal));
+@@ -584,6 +587,14 @@ terminal_app_open_window (TerminalApp         *app,
+       g_signal_connect (G_OBJECT (app->session_client), "save-yourself",
+                         G_CALLBACK (terminal_app_save_yourself), app);
+     }
++
++  if (attr->embed_window)
++    {
++      GdkDrawable* win =3D GDK_DRAWABLE(window->window);
++	  XReparentWindow(GDK_DRAWABLE_XDISPLAY(win), GDK_DRAWABLE_XID(win), att=
r->embed_window, 0, 0);
++	  XMapWindow(GDK_DRAWABLE_XDISPLAY(win), GDK_DRAWABLE_XID(win));
++      gtk_widget_show(window);
++    }
+ }
+=20
+=20
+diff --git a/terminal/terminal-options.c b/terminal/terminal-options.c
+index ec6a934..ad9dace 100644
+--- a/terminal/terminal-options.c
++++ b/terminal/terminal-options.c
+@@ -30,6 +30,8 @@
+ #include <string.h>
+ #endif
+=20
++#include <stdlib.h>
++
+ #include <libxfce4util/libxfce4util.h>
+=20
+ #include <terminal/terminal-options.h>
+@@ -454,6 +456,31 @@ terminal_options_parse (gint              argc,
+           g_free (default_directory);
+           default_directory =3D g_strdup (s);
+         }
++      else if (strncmp ("--into", argv[n], 6) =3D=3D 0)
++        {
++          s =3D argv[n] + 6;
++
++          if (*s =3D=3D '=3D')
++            {
++              ++s;
++            }
++          else if (n + 1 >=3D argc)
++            {
++              g_set_error (error, G_SHELL_ERROR, G_SHELL_ERROR_FAILED,
++                           _("Option \"--into\" requires specifying "
++                             "the window id as its parameter"));
++              goto failed;
++            }
++          else
++            {
++              s =3D argv[++n];
++            }
++
++          if (win_attr !=3D NULL)
++            {
++              win_attr->embed_window =3D strtoul(s, NULL, 0);
++            }
++        }
+       else
+         {
+           g_set_error (error, G_SHELL_ERROR, G_SHELL_ERROR_FAILED,
+diff --git a/terminal/terminal-options.h b/terminal/terminal-options.h
+index b047269..4783596 100644
+--- a/terminal/terminal-options.h
++++ b/terminal/terminal-options.h
+@@ -65,5 +65,6 @@ struct _TerminalWindowAttr
+   TerminalVisibility   borders;
+   TerminalVisibility   toolbars;
++  guint32              embed_window;
+ };
+=20
+ gboolean  terminal_options_parse    (gint                 argc,
diff --git a/recipes/xfce-base/xfce-terminal_0.2.12.bb b/recipes/xfce-base/=
xfce-terminal_0.2.12.bb
new file mode 100755
index 0000000..07b4b26
--- /dev/null
+++ b/recipes/xfce-base/xfce-terminal_0.2.12.bb
@@ -0,0 +1,15 @@
+DESCRIPTION =3D "Terminal emulator for the Xfce desktop environment"
+DEPENDS =3D "exo vte dbus-glib gtk+"
+RDEPENDS +=3D "gnome-pty-helper"
+PR =3D "r0.2"
+
+inherit xfce
+
+RPROVIDES =3D "xfce-terminal"
+
+XFCE_VERSION =3D 4.6.1
+
+SRC_URI =3D "http://www.us.xfce.org/archive/xfce-${XFCE_VERSION}/src/Termi=
nal-${PV}.tar.bz2 \
+"
+
+S =3D "${WORKDIR}/Terminal-${PV}"
diff --git a/recipes/xfce-base/xfce-utils_4.6.1.bb b/recipes/xfce-base/xfce=
-utils_4.6.1.bb
new file mode 100755
index 0000000..a3c8213
--- /dev/null
+++ b/recipes/xfce-base/xfce-utils_4.6.1.bb
@@ -0,0 +1,32 @@
+# xfce-utils OE build file
+# Copyright (C) 2004, Advanced Micro Devices, Inc.  All Rights Reserved
+# Released under the MIT license (see COPYING.MIT)
+
+DESCRIPTION=3D"XFCE4 Utilities"
+DEPENDS =3D "virtual/libx11"
+RDEPENDS =3D "libxfcegui4"
+SECTION =3D "x11"
+PR =3D "r0.2"
+
+inherit xfce
+
+RPROVIDES =3D "xfce-utils"
+
+FILES_${PN} +=3D " \=20
+        ${bindir}/* \
+        ${datadir}/dbus-1/* \
+        ${datadir}/xfce4/AUTHORS \
+        ${datadir}/xfce4/BSD \
+        ${datadir}/xfce4/COPYING \
+        ${datadir}/xfce4/GPL \
+	${datadir}/xfce4/INFO \
+        ${datadir}/xfce4/LGPL \
+        ${datadir}/xfce4/AUTHORS.html \
+        ${datadir}/xfce4/BSD.html \
+        ${datadir}/xfce4/COPYING.html \
+        ${datadir}/xfce4/GPL.html \
+	${datadir}/xfce4/INFO.html \
+        ${datadir}/xfce4/LGPL.html"
+
+# NOTE:  This package takes a --with-browser for the default browser
+# NOTE:  Works with gdm also gtkhtml
diff --git a/recipes/xfce-base/xfce4-appfinder_4.6.1.bb b/recipes/xfce-base=
/xfce4-appfinder_4.6.1.bb
new file mode 100755
index 0000000..2167a3a
--- /dev/null
+++ b/recipes/xfce-base/xfce4-appfinder_4.6.1.bb
@@ -0,0 +1,12 @@
+# xfce4-appfinder build file
+# Copyright (C) 2004, Advanced Micro Devices, Inc.  All Rights Reserved
+# Released under the MIT license (see COPYING.MIT)
+
+DESCRIPTION=3D"XFCE Application Finder"
+DEPENDS=3D"libxfcegui4 libxfce4menu thunar"
+SECTION =3D "x11"
+PR =3D "r0.3"
+
+RPROVIDES =3D "xfce4-appfinder"=20
+
+inherit xfce
diff --git a/recipes/xfce-base/xfce4-dev-tools_4.6.0.bb b/recipes/xfce-base=
/xfce4-dev-tools_4.6.0.bb
new file mode 100755
index 0000000..9b5eb6f
--- /dev/null
+++ b/recipes/xfce-base/xfce4-dev-tools_4.6.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION =3D "Xfce4 development tools"
+SECTION =3D "x11/libs"
+LICENSE =3D "GPL"
+PR =3D "r0.2"
+
+RPROVIDES =3D "xfce4-dev-tools"
+PROVIDES =3D "${RPROVIDES}"
+
+inherit xfce
+XFCE_VERSION =3D 4.6.1
+
+do_stage() {
+	install -d ${STAGING_DATADIR}/aclocal
+	install -m 644 m4macros/*.m4 ${STAGING_DATADIR}/aclocal/
+}
+
+FILES_${PN}-dev +=3D " ${datadir}/xfce4/dev-tools/m4macros/*.m4"
diff --git a/recipes/xfce-base/xfce4-mixer_4.6.1.bb b/recipes/xfce-base/xfc=
e4-mixer_4.6.1.bb
new file mode 100755
index 0000000..dd9b455
--- /dev/null
+++ b/recipes/xfce-base/xfce4-mixer_4.6.1.bb
@@ -0,0 +1,16 @@
+# xfce-mixer-plugin OE build file
+# Copyright (C) 2004, Advanced Micro Devices, Inc.  All Rights Reserved
+# Released under the MIT license (see COPYING.MIT)
+
+DESCRIPTION=3D"XFCE panel mixer plugin"
+DEPENDS=3D"libwnck xfce4-panel"
+RDEPENDS=3D"xfce4-panel"
+SECTION =3D "x11"
+PR =3D "r0.3"
+
+inherit xfce
+
+RPROVIDES =3D "xfce4-mixer"
+
+FILES_${PN}-dev +=3D "${libdir}/xfce4/modules/libxfce4mixer.so"
+FILES_${PN}-dbg +=3D "${libexecdir}/xfce4/panel-plugins/.debug/"
diff --git a/recipes/xfce-base/xfce4-panel_4.6.1.bb b/recipes/xfce-base/xfc=
e4-panel_4.6.1.bb
new file mode 100755
index 0000000..bd42e02
--- /dev/null
+++ b/recipes/xfce-base/xfce4-panel_4.6.1.bb
@@ -0,0 +1,36 @@
+# xfce4-panel OE build file
+# Copyright (C) 2004, Advanced Micro Devices, Inc.  All Rights Reserved
+# Released under the MIT license (see COPYING.MIT)
+
+DESCRIPTION =3D "XFCE4 Panel"
+DEPENDS =3D "virtual/libx11 startup-notification libxfcegui4 libxml2 exo"
+SECTION =3D "x11"
+PR =3D "r0.2"
+
+inherit pkgconfig xfce
+
+RPROVIDES =3D "xfce4-panel"
+PROVIDES =3D "${RPROVIDES}"
+
+EXTRA_OECONF +=3D " --enable-startup-notification"
+
+do_stage() {
+    autotools_stage_all
+}
+
+do_install() {
+    oe_runmake DESTDIR=3D${D} install
+}
+
+python populate_packages_prepend() {
+	plugin_dir =3D bb.data.expand('${libdir}/xfce4/panel-plugins/', d)
+	plugin_name =3D bb.data.expand('${PN}-plugin-%s', d)
+	do_split_packages(d, plugin_dir, '^lib(.*).so$', plugin_name,
+	                  '${PN} plugin for %s', extra_depends=3D'', prepend=3DTr=
ue,
+	                  aux_files_pattern=3D['${datadir}/xfce4/panel-plugins/%s=
.desktop',
+	                                     '${sysconfdir}/xdg/xfce/panel/%s-*',
+	                                     '${datadir}/icons/hicolor/48x48/apps=
/*-%s.png',
+	                                     '${bindir}/*%s*'])
+}
+
+PACKAGES_DYNAMIC =3D "${PN}-plugin-*"
diff --git a/recipes/xfce-base/xfce4-power-manager_4.6.1.bb b/recipes/xfce-=
base/xfce4-power-manager_4.6.1.bb
new file mode 100755
index 0000000..88fb614
--- /dev/null
+++ b/recipes/xfce-base/xfce4-power-manager_4.6.1.bb
@@ -0,0 +1 @@
+PR =3D "r0.2"
\ No newline at end of file
diff --git a/recipes/xfce-base/xfce4-session_4.6.1.bb b/recipes/xfce-base/x=
fce4-session_4.6.1.bb
new file mode 100755
index 0000000..b177435
--- /dev/null
+++ b/recipes/xfce-base/xfce4-session_4.6.1.bb
@@ -0,0 +1,21 @@
+DESCRIPTION =3D "xfce4-session is a session manager for Xfce 4 Desktop  En=
vironment"
+RDEPENDS =3D "libxfcegui4 libxfce4util dbus iceauth"
+SECTION =3D "x11"
+PR =3D "r0.2"
+
+RPROVIDES =3D "xfce4-session"
+PROVIDES =3D "${RPROVIDES}"
+
+inherit xfce
+
+FILES_${PN} +=3D "${libdir}/xfce4/splash/engines/*.so"
+FILES_${PN} +=3D "${datadir}/xfce4/tips/*"
+FILES_${PN} +=3D "${datadir}/themes/Default/balou/*"
+FILES_${PN} +=3D "${libdir}/xfce4/mcs-plugins/*.so"
+
+FILES_${PN}-dbg +=3D "${libdir}/xfce4/splash/engines/.debug/*.so"
+FILES_${PN}-dbg +=3D "${libdir}/xfce4/mcs-plugins/.debug/*.so"
+
+FILES_${PN}-dev +=3D "${libdir}/xfce4/splash/engines/*.la"
+FILES_${PN}-dev +=3D "${libdir}/xfce4/splash/engines/*.a"
+FILES_${PN}-dev +=3D "${libdir}/xfce4/mcs-plugins/*.a"
diff --git a/recipes/xfce-base/xfce4-settings/xfce4-settings-4.6.1-configur=
e.patch b/recipes/xfce-base/xfce4-settings/xfce4-settings-4.6.1-configure.p=
atch
new file mode 100755
index 0000000..beb5857
--- /dev/null
+++ b/recipes/xfce-base/xfce4-settings/xfce4-settings-4.6.1-configure.patch
@@ -0,0 +1,11 @@
+--- ./configure.ac.orig	2009-02-25 18:58:49.000000000 +0100
++++ ./configure.ac	2009-03-01 11:14:33.000000000 +0100
+@@ -85,8 +85,8 @@ XDT_CHECK_PACKAGE([LIBXFCE4KBD_PRIVATE],
+ XDT_CHECK_PACKAGE([GLADE], [libglade-2.0], [2.0.0])
+ XDT_CHECK_PACKAGE([XFCONF], [libxfconf-0], [4.6.0])
+ XDT_CHECK_PACKAGE([DBUS_GLIB], [dbus-glib-1], [0.34])
+-XDT_CHECK_PACKAGE([XI], [xi], [1.0.0])
+-XDT_CHECK_PACKAGE([LIBX11], [x11], [1.0.0])
++ XDT_CHECK_PACKAGE([XI], [xi], [1.0.0])
++#XDT_CHECK_PACKAGE([LIBX11], [x11], [1.0.0])
+ XDT_CHECK_PACKAGE([LIBWNCK], [libwnck-1.0], [2.12.0])
diff --git a/recipes/xfce-base/xfce4-settings/xfce4-settings-4.6.1-libxklav=
ier.patch b/recipes/xfce-base/xfce4-settings/xfce4-settings-4.6.1-libxklavi=
er.patch
new file mode 100755
index 0000000..3268eca
--- /dev/null
+++ b/recipes/xfce-base/xfce4-settings/xfce4-settings-4.6.1-libxklavier.pat=
ch
@@ -0,0 +1,12 @@
+diff -ur xfce4-settings-4.6.1.orig/dialogs/keyboard-settings/xfce-keyboard=
-settings.c xfce4-settings-4.6.1/dialogs/keyboard-settings/xfce-keyboard-se=
ttings.c
+--- xfce4-settings-4.6.1.orig/dialogs/keyboard-settings/xfce-keyboard-sett=
ings.c	2009-03-02 19:48:00.000000000 +0200
++++ xfce4-settings-4.6.1/dialogs/keyboard-settings/xfce-keyboard-settings.=
c	2009-07-20 12:08:28.000000000 +0300
+@@ -378,7 +378,7 @@
+   xkl_config_rec_get_from_server (settings->priv->xkl_rec_config, setting=
s->priv->xkl_engine);
+=20
+   settings->priv->xkl_registry =3D xkl_config_registry_get_instance (sett=
ings->priv->xkl_engine);
+-  xkl_config_registry_load (settings->priv->xkl_registry);
++  xkl_config_registry_load (settings->priv->xkl_registry, FALSE);
+=20
+   /* Tab */
+   xkb_tab_layout_vbox =3D glade_xml_get_widget (settings->priv->glade_xml=
, "xkb_tab_layout_vbox");
diff --git a/recipes/xfce-base/xfce4-settings/xfce4-settings-4.6.1-workspac=
es.c.patch b/recipes/xfce-base/xfce4-settings/xfce4-settings-4.6.1-workspac=
es.c.patch
new file mode 100755
index 0000000..6e60405
--- /dev/null
+++ b/recipes/xfce-base/xfce4-settings/xfce4-settings-4.6.1-workspaces.c.pa=
tch
@@ -0,0 +1,17 @@
+--- xfce4-settings-helper/workspaces.c.orig	2009-01-25 15:29:31.000000000 =
+0100
++++ xfce4-settings-helper/workspaces.c	2009-01-27 13:32:51.000000000 +0100
+@@ -129,9 +129,14 @@ xfce_workspaces_helper_set_workspace_nam
+         wnck_screen_force_update(screen);
+=20
+         /* walk all the workspaces on this screen */
++#if 0
+         workspaces =3D wnck_screen_get_workspaces(screen);
+         for(li =3D workspaces, i =3D 0; li !=3D NULL; li =3D li->next, i+=
+) {
+             workspace =3D WNCK_WORKSPACE(li->data);
++#else
++        for(i =3D 0; i < wnck_screen_get_workspace_count(screen); i++) {
++            workspace =3D wnck_screen_get_workspace(screen, i);
++#endif
+=20
+             /* check if we have a valid name in the array */
+             if(n_names > i && names[i] !=3D NULL && names[i] !=3D '\0') {
diff --git a/recipes/xfce-base/xfce4-settings_4.6.1.bb b/recipes/xfce-base/=
xfce4-settings_4.6.1.bb
new file mode 100755
index 0000000..a52c077
--- /dev/null
+++ b/recipes/xfce-base/xfce4-settings_4.6.1.bb
@@ -0,0 +1,20 @@
+DESCRIPTION=3D"Xfce4 settings"
+HOMEPAGE =3D "http://www.xfce.org"
+SECTION =3D "x11/wm"
+LICENSE =3D "GPL-2"
+
+DEPENDS =3D "virtual/libx11 virtual/xserver libxi libwnck xrandr exo libxf=
ce4util"
+RDEPENDS =3D "gtk+ libxfce4util libxfcegui4 xfconf exo"
+
+PR =3D "r0.3"
+
+inherit xfce
+
+SRC_URI +=3D " \
+    file://xfce4-settings-4.6.1-libxklavier.patch;patch=3D1 \
+    file://xfce4-settings-4.6.1-configure.patch;patch=3D1 \
+"
+
+do_stage() {
+autotools_stage_all
+}
diff --git a/recipes/xfce-base/xfconf_4.6.1.bb b/recipes/xfce-base/xfconf_4=
.6.1.bb
new file mode 100755
index 0000000..c237977
--- /dev/null
+++ b/recipes/xfce-base/xfconf_4.6.1.bb
@@ -0,0 +1,16 @@
+DESCRIPTION =3D "Xfce configuration daemon and utilities"
+HOMEPAGE =3D "http://www.xfce.org"
+SECTION =3D "x11/wm"
+LICENSE =3D "GPL-2"
+DEPENDS =3D "libxfce4util"
+RDEPENDS =3D "libxfce4util"
+
+PR =3D "r0.3"
+
+inherit xfce
+
+do_stage() {
+autotools_stage_all
+}
+
+FILES_${PN} +=3D "${datadir}/dbus-1/services/org.xfce.Xfconf.service"
diff --git a/recipes/xfce-base/xfdesktop/fix-segfault-when-removable-icons-=
are-disabled.patch b/recipes/xfce-base/xfdesktop/fix-segfault-when-removabl=
e-icons-are-disabled.patch
new file mode 100755
index 0000000..af5bc4c
--- /dev/null
+++ b/recipes/xfce-base/xfdesktop/fix-segfault-when-removable-icons-are-dis=
abled.patch
@@ -0,0 +1,16 @@
+diff -Nur xfdesktop-4.4.2-BKP/src/xfdesktop-file-icon-manager.c xfdesktop-=
4.4.2/src/xfdesktop-file-icon-manager.c
+--- xfdesktop-4.4.2-BKP/src/xfdesktop-file-icon-manager.c	2008-11-03 16:19=
:46.000000000 -0200
++++ xfdesktop-4.4.2/src/xfdesktop-file-icon-manager.c	2008-11-03 16:20:45.=
000000000 -0200
+@@ -2046,8 +2046,10 @@
+    =20
+     g_hash_table_foreach(fmanager->priv->icons,
+                          file_icon_hash_write_icons, rcfile);
+-    g_hash_table_foreach(fmanager->priv->removable_icons,
+-                         file_icon_hash_write_icons, rcfile);
++    if(fmanager->priv->show_removable_media) {
++        g_hash_table_foreach(fmanager->priv->removable_icons,
++                             file_icon_hash_write_icons, rcfile);
++    }
+     g_hash_table_foreach(fmanager->priv->special_icons,
+                          file_icon_hash_write_icons, rcfile);
+    =20
diff --git a/recipes/xfce-base/xfdesktop/relocation-and-memleak.patch b/rec=
ipes/xfce-base/xfdesktop/relocation-and-memleak.patch
new file mode 100755
index 0000000..df9011d
--- /dev/null
+++ b/recipes/xfce-base/xfdesktop/relocation-and-memleak.patch
@@ -0,0 +1,49 @@
+Patch taken from Gentoo at http://overlays.gentoo.org/svn/proj/alt/trunk/p=
refix-overlay/xfce-base/xfdesktop/files/
+
+Included by: Otavio Salvador <otavio@ossystems.com.br>
+
+diff -ur xfdesktop-4.4.2.orig/modules/menu/desktop-menu-dentry.c xfdesktop=
-4.4.2/modules/menu/desktop-menu-dentry.c
+--- xfdesktop-4.4.2.orig/modules/menu/desktop-menu-dentry.c	2007-11-17 21:=
31:43.000000000 +0200
++++ xfdesktop-4.4.2/modules/menu/desktop-menu-dentry.c	2008-03-21 11:18:59=
.000000000 +0200
+@@ -173,7 +173,8 @@
+         if(cmpname && g_ascii_strcasecmp(name, cmpname) < 0)
+             break;
+     }
+-   =20
++    g_list_free(items);
++
+     gtk_menu_shell_insert(menu_shell, mi, i);
+    =20
+     return i;
+diff -ur xfdesktop-4.4.2.orig/modules/menu/desktop-menuspec.c xfdesktop-4.=
4.2/modules/menu/desktop-menuspec.c
+--- xfdesktop-4.4.2.orig/modules/menu/desktop-menuspec.c	2007-11-17 21:31:=
43.000000000 +0200
++++ xfdesktop-4.4.2/modules/menu/desktop-menuspec.c	2008-03-21 11:18:59.00=
0000000 +0200
+@@ -203,7 +203,7 @@
+                 else
+                     foundcat =3D NULL;
+                 if(!foundcat) {
+-                    g_ptr_array_free(revpath, FALSE);
++                    g_ptr_array_free(revpath, TRUE);
+                     revpath =3D NULL;
+                     break;
+                 }
+@@ -220,7 +220,7 @@
+                 newpath[totlen] =3D 0;
+                =20
+                 g_ptr_array_add(mtfpi->paths, newpath);
+-                g_ptr_array_free(revpath, FALSE);
++                g_ptr_array_free(revpath, TRUE);
+             }
+         }
+     }
+diff -ur xfdesktop-4.4.2.orig/modules/menu/desktop-menuspec.h xfdesktop-4.=
4.2/modules/menu/desktop-menuspec.h
+--- xfdesktop-4.4.2.orig/modules/menu/desktop-menuspec.h	2007-11-17 21:31:=
43.000000000 +0200
++++ xfdesktop-4.4.2/modules/menu/desktop-menuspec.h	2008-03-21 11:18:56.00=
0000000 +0200
+@@ -82,6 +82,6 @@
+  * @param paths A GPtrArray obtained from either menuspec_get_path_simple=
() or
+  *              menuspec_get_path_multilevel().
+  */
+-G_INLINE_FUNC void desktop_menuspec_path_free(GPtrArray *paths);
++void desktop_menuspec_path_free(GPtrArray *paths);
+=20
+ #endif /* ifdef __MENUSPEC_H__ */
diff --git a/recipes/xfce-base/xfdesktop/xfdesktop-4.4.3-fix-build.patch b/=
recipes/xfce-base/xfdesktop/xfdesktop-4.4.3-fix-build.patch
new file mode 100755
index 0000000..e807f69
--- /dev/null
+++ b/recipes/xfce-base/xfdesktop/xfdesktop-4.4.3-fix-build.patch
@@ -0,0 +1,10 @@
+--- xfdesktop-4.4.3/configure.ac.orig	2008-11-09 17:52:20 +0000
++++ xfdesktop-4.4.3/configure.ac	2008-11-09 17:52:24 +0000
+@@ -17,7 +17,6 @@ m4_define([autoconf_minimum_version], [2
+=20
+ dnl init autoconf
+ AC_INIT([xfdesktop], [xfdesktop_version], [http://bugzilla.xfce.org/])
+-AC_PREREQ([autoconf_minimum_version])
+=20
+ dnl init automake
+ XFDESKTOP_VERSION=3Dxfdesktop_version
diff --git a/recipes/xfce-base/xfdesktop_4.6.1.bb b/recipes/xfce-base/xfdes=
ktop_4.6.1.bb
new file mode 100755
index 0000000..aff645d
--- /dev/null
+++ b/recipes/xfce-base/xfdesktop_4.6.1.bb
@@ -0,0 +1,16 @@
+DESCRIPTION =3D "XFCE4 Desktop Manager"
+SECTION =3D "x11/base"
+
+DEPENDS =3D "virtual/libx11 exo libxfcegui4 xfce4-panel gtk+"
+RDEPENDS =3D "libxfcegui4 libxml2 xfce4-panel thunar exo gtk+"
+PR =3D "r0.4"
+
+RPROVIDES =3D "xfdesktop"
+
+inherit xfce
+
+FILES_xfdesktop-backdrops =3D "${datadir}/xfce4/backdrops/*"
+FILES_${PN} +=3D "${libdir}/xfce4/panel-plugins/*.so \
+                ${libdir}/xfce4/panel-plugins/xfce4-menu-plugin \
+                ${datadir}/xfce4/panel-plugins/*.desktop"
+FILES_${PN}-dbg +=3D "${libexecdir}/xfce4/panel-plugins/.debug"
diff --git a/recipes/xfce-base/xfwm4-themes_4.6.0.bb b/recipes/xfce-base/xf=
wm4-themes_4.6.0.bb
new file mode 100755
index 0000000..edd3c1f
--- /dev/null
+++ b/recipes/xfce-base/xfwm4-themes_4.6.0.bb
@@ -0,0 +1,24 @@
+# xfwm4-themes OE build file
+# Copyright (C) 2004, Advanced Micro Devices, Inc.  All Rights Reserved
+# Released under the MIT license (see COPYING.MIT)
+
+DESCRIPTION=3D"XFCE4 Window Manager Themes"
+SECTION =3D "x11/wm"
+PR =3D "r0.7"
+
+DEPENDS =3D "xfwm4 libglade libxml2"
+RDEPENDS =3D "xfwm4 libglade libxml2"
+
+inherit xfce
+
+RPROVIDES =3D "xfwm4-themes"=20
+
+# No ${PN} for this one=20
+PACKAGES=3D""
+
+PACKAGES_DYNAMIC =3D "xfwm4-theme-*"
+
+python populate_packages_prepend () {
+	themedir =3D bb.data.expand('${datadir}/xfwm4/themes', d)
+	do_split_packages(d, themedir, '^(.*)', 'xfwm4-theme-%s', 'XFWM4 theme %s=
', allow_dirs=3DTrue)
+}
diff --git a/recipes/xfce-base/xfwm4_4.6.1.bb b/recipes/xfce-base/xfwm4_4.6=
.1.bb
new file mode 100755
index 0000000..719cf64
--- /dev/null
+++ b/recipes/xfce-base/xfwm4_4.6.1.bb
@@ -0,0 +1,33 @@
+# xfwm4 OE build file
+# Copyright (C) 2004, Advanced Micro Devices, Inc.  All Rights Reserved
+# Released under the MIT license (see COPYING.MIT)
+
+DESCRIPTION=3D"XFCE4 Window Manager"
+SECTION =3D "x11/wm"
+PR =3D "r0.4"
+
+RPROVIDES =3D "xfwm4"
+
+inherit xfce update-alternatives
+
+FILES_${PN} +=3D "${datadir}/xfwm4/defaults ${datadir}/xfwm4/themes/defaul=
t.keys/*"
+
+DEPENDS =3D "startup-notification virtual/libx11 libxpm libxfce4util libxf=
cegui4"
+RDEPENDS =3D "xfwm4-theme-default"
+
+
+EXTRA_OECONF +=3D " --enable-startup-notification"
+
+PACKAGES_DYNAMIC +=3D "xfwm4-theme-*"
+
+python populate_packages_prepend () {
+	themedir =3D bb.data.expand('${datadir}/themes', d)
+	do_split_packages(d, themedir, '^(.*)', 'xfwm4-theme-%s', 'XFWM4 theme %s=
', allow_dirs=3DTrue)
+}
+
+ALTERNATIVE_PATH =3D "${bindir}/xfce4-session"
+ALTERNATIVE_NAME =3D "x-window-manager"
+ALTERNATIVE_LINK =3D "${bindir}/x-window-manager"
+ALTERNATIVE_PRIORITY =3D "10"
+
+FILES_${PN}-dbg +=3D "${libexecdir}/xfce4/xfwm4/.debug/*"
diff --git a/recipes/xfce-extras/gigolo_0.3.2.bb b/recipes/xfce-extras/gigo=
lo_0.3.2.bb
new file mode 100755
index 0000000..710cd6b
--- /dev/null
+++ b/recipes/xfce-extras/gigolo_0.3.2.bb
@@ -0,0 +1,13 @@
+DESCRIPTION =3D "Gigolo is a frontend to easily manage connections to remo=
te filesystems using GIO/GVfs."
+DEPENDS =3D "pkgconfig gtk+"
+RDEPENDS =3D "libxfce4util libxfcegui4"
+
+SECTION =3D "x11"
+LICENSE =3D "GPL-2"
+PR =3D "r0.1"
+
+inherit xfce
+
+XFCE_VERSION =3D 4.6.1
+
+SRC_URI =3D "http://files.uvena.de/${PN}/${PN}-${PV}.tar.bz2"
diff --git a/recipes/xfce-extras/mousepad_0.2.16.bb b/recipes/xfce-extras/m=
ousepad_0.2.16.bb
new file mode 100755
index 0000000..0be5835
--- /dev/null
+++ b/recipes/xfce-extras/mousepad_0.2.16.bb
@@ -0,0 +1,9 @@
+DESCRIPTION =3D "Text editor for Xfce based on Leafpad"
+RDEPENDS =3D "libxfce4util hal liburi-perl-native python-native"
+SECTION =3D "x11"
+PR =3D "r0.1"
+
+RPROVIDES =3D "mousepad"
+
+inherit xfce
+XFCE_VERSION =3D 4.6.1
diff --git a/recipes/xfce-extras/notification-daemon-xfce_0.3.7.bb b/recipe=
s/xfce-extras/notification-daemon-xfce_0.3.7.bb
new file mode 100755
index 0000000..af04d2f
--- /dev/null
+++ b/recipes/xfce-extras/notification-daemon-xfce_0.3.7.bb
@@ -0,0 +1,23 @@
+DESCRIPTION =3D "Notification-daemon-xfce is a port of Gnome=92s notificat=
ion-daemon for the Xfce desktop."
+DEPENDS =3D "pkgconfig dbus gtk+ libsexy"
+RDEPENDS =3D "libxfce4util libxfcegui4 libnotify"
+
+# TODO: Make sure this conflicts with Gnome daemon if you try and install =
it :-o.
+RCONFLICTS =3D ""
+
+SECTION =3D "x11"
+PR =3D "r0.1"
+
+inherit xfce
+
+XFCE_VERSION =3D 4.6.1
+
+SRC_URI =3D "http://goodies.xfce.org/releases/${PN}/${PN}-${PV}.tar.bz2"
+
+FILES_${PN} +=3D "${datadir}/dbus-1/services/org.freedesktop.Notifications=
.service \
+                ${libdir}/notification-daemon-xfce-1.0/engines/*.so"
+               =20
+FILES_${PN}-dbg +=3D "${libdir}/notification-daemon-xfce-1.0/engines/.debu=
g"
+
+FILES_${PN}-dev +=3D "${libdir}/notification-daemon-xfce-1.0/engines/*.la"
+FILES_${PN}-dev +=3D "${libdir}/notification-daemon-xfce-1.0/engines/*.a"
diff --git a/recipes/xfce-extras/orage_4.6.1.bb b/recipes/xfce-extras/orage=
_4.6.1.bb
new file mode 100755
index 0000000..831b71e
--- /dev/null
+++ b/recipes/xfce-extras/orage_4.6.1.bb
@@ -0,0 +1,16 @@
+DESCRIPTION =3D "Calendar application for the Xfce Desktop  Environment"
+DEPENDS =3D "xfce4-panel"
+RDEPENDS =3D "libxfcegui4 exo xfce4-panel"
+RREPLACES =3D "xfcalendar"
+RPROVIDES =3D "orage"
+
+SECTION =3D "x11"
+PR =3D "r0.3"
+
+XFCE_VERSION =3D 4.6.1
+
+EXTRA_OECONF +=3D " --disable-libxfce4mcs"
+
+FILES_${PN}-dbg +=3D "${libexecdir}/xfce4/panel-plugins/.debug/"
+
+inherit xfce
diff --git a/recipes/xfce-extras/ristretto_0.0.21.bb b/recipes/xfce-extras/=
ristretto_0.0.21.bb
new file mode 100755
index 0000000..f04d81c
--- /dev/null
+++ b/recipes/xfce-extras/ristretto_0.0.21.bb
@@ -0,0 +1,12 @@
+DESCRIPTION =3D "Ristretto is a picture-viewer for XFCE"
+DEPENDS =3D "thunar libxfce4util libxfcegui4 libexif dbus"
+RDEPENDS =3D "thunar libxfce4util libxfcegui4"
+
+SECTION =3D "x11"
+PR =3D "r0.1"
+
+inherit xfce
+
+XFCE_VERSION =3D 4.6.1
+
+SRC_URI =3D "http://goodies.xfce.org/releases/ristretto/${PN}-${PV}.tar.gz=
"
diff --git a/recipes/xfce-extras/squeeze_0.2.3.bb b/recipes/xfce-extras/squ=
eeze_0.2.3.bb
new file mode 100755
index 0000000..d3bda3b
--- /dev/null
+++ b/recipes/xfce-extras/squeeze_0.2.3.bb
@@ -0,0 +1,12 @@
+DESCRIPTION =3D "Squeeze is an archive manager for the Xfce Desktop  Envir=
onment"
+DEPENDS =3D "pkgconfig dbus gtk+ thunar"
+RDEPENDS =3D "libxfce4util"
+
+SECTION =3D "x11"
+PR =3D "r0.2"
+
+inherit xfce
+
+XFCE_VERSION =3D 4.6.1
+
+SRC_URI =3D "http://squeeze.xfce.org/downloads/${PN}-${PV}.tar.bz2"
diff --git a/recipes/xfce-extras/xfce4-notifyd_0.1.0.bb b/recipes/xfce-extr=
as/xfce4-notifyd_0.1.0.bb
new file mode 100755
index 0000000..34a3a1e
--- /dev/null
+++ b/recipes/xfce-extras/xfce4-notifyd_0.1.0.bb
@@ -0,0 +1,21 @@
+DESCRIPTION =3D "Notification daemon for the Xfce desktop."
+DEPENDS =3D "pkgconfig dbus gtk+ libsexy"
+RDEPENDS =3D "libxfce4util libxfcegui4 libnotify xfconf"
+
+SECTION =3D "x11"
+PR =3D "r0.1"
+
+inherit xfce
+
+XFCE_VERSION =3D 4.6.1
+
+SRC_URI =3D "http://spuriousinterrupt.org/files/${PN}/${PN}-${PV}.tar.bz2"
+
+FILES_${PN} =3D "\
+    ${datadir}/dbus-1/services \
+    ${datadir}/themes \
+    ${datadir}/icons \
+    ${datadir}/applications \ =20
+    ${libexecdir}/xfce4-notifyd \    =20
+    ${bindir}/xfce4-notifyd-config \
+"
diff --git a/recipes/xfce-extras/xfprint_4.6.1.bb b/recipes/xfce-extras/xfp=
rint_4.6.1.bb
new file mode 100755
index 0000000..86b1947
--- /dev/null
+++ b/recipes/xfce-extras/xfprint_4.6.1.bb
@@ -0,0 +1,13 @@
+# xfprint OE build file
+# Copyright (C) 2004, Advanced Micro Devices, Inc.  All Rights Reserved
+# Released under the MIT license (see COPYING.MIT)
+
+DESCRIPTION=3D"XFCE4 Print Manager"
+SECTION =3D "x11/base"
+PR =3D "r0.1"
+
+RPROVIDES =3D "xfprint"
+
+DEPENDS=3D"libxfcegui4"
+
+inherit xfce
--=20
1.6.3.1


------=_NextPart_000_0075_01CA4C08.2C485E30
Content-Type: application/octet-stream;
	name="0038-xfce.bbclass-Update-to-support-XFCE-4.6.1-breaks-4.4.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0038-xfce.bbclass-Update-to-support-XFCE-4.6.1-breaks-4.4.patch"

From b7760745645365198c67f857572963b291feafe8 Mon Sep 17 00:00:00 2001
From: David-John Willis <John.Willis@Distant-earth.com>
Date: Tue, 13 Oct 2009 13:12:03 +0100
Subject: [PATCH 38/38] xfce.bbclass: Update to support XFCE 4.6.1 (breaks 4=
.4.* at the moment, really need another bbclass).

---
 classes/xfce.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
 mode change 100644 =3D> 100755 classes/xfce.bbclass

diff --git a/classes/xfce.bbclass b/classes/xfce.bbclass
old mode 100644
new mode 100755
index b18313f..4d48131
--- a/classes/xfce.bbclass
+++ b/classes/xfce.bbclass
@@ -1,4 +1,4 @@
-# xfce.oeclass
+# xfce.bbclass
 # Copyright (C) 2004, Advanced Micro Devices, Inc.  All Rights Reserved
 # Released under the MIT license (see packages/COPYING)
=20
--=20
1.6.3.1


------=_NextPart_000_0075_01CA4C08.2C485E30
Content-Type: application/octet-stream;
	name="0027-Add-XFCE-4.6-checksums.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0027-Add-XFCE-4.6-checksums.patch"

From 414769eb089553c97a5aabaaa5e71abd7ae52f4c Mon Sep 17 00:00:00 2001
From: David-John Willis <John.Willis@Distant-earth.com>
Date: Thu, 8 Oct 2009 08:49:36 +0100
Subject: [PATCH 27/38] Add XFCE 4.6 checksums.

---
 conf/checksums.ini |   96 ++++++++++++++++++++++++++++++++++++++++++++++++=
++++
 1 files changed, 96 insertions(+), 0 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index cf93dd5..6820e53 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -1138,6 +1138,10 @@ sha256=3Dc1f29cfd31c335a409bdc530c2e68661d20a1e3c2e5=
d64454470b6700a40681e
 md5=3Df0ef2cea8acfbcc58d865c05b0c7e1ff
 sha256=3D8c4c70bf487f2e432046dce07cf4b77ff181667d0905f9cb1203ff95ff5dd5ff
=20
+[http://www.us.xfce.org/archive/xfce-4.6.1/src/Terminal-0.2.12.tar.bz2]
+md5=3Dadb419d279c9fc16d02291c052190717
+sha256=3D352205b03e9ed1b9080c61235fbc0fa15609410e724237441055a232a3b603dc
+
 [http://www.us.xfce.org/archive/xfce-4.4.2/src/Terminal-0.2.8.tar.bz2]
 md5=3Dcfe660ecf50e9d3b073576bbc4af6ab2
 sha256=3D20a58b96915f67c5b4f49fb1428e1876195f1f9fd7d37e0081352cadc13463e7
@@ -1170,6 +1174,10 @@ sha256=3D0b654cd39126333a0dab7fdd2fd0c5023f6eb45e72d=
1d8bf9fb3cab175002bc7
 md5=3D0fc5008858661c0abd0399acbe30ef28
 sha256=3D26c833b0bdf3281c61e03f1fb985feced88cf4a5cebce7bd055f05e025460037
=20
+[http://www.us.xfce.org/archive/xfce-4.6.1/src/Thunar-1.0.1.tar.bz2]
+md5=3D218373aa45d74b6ba8c69c4d5af3bb19
+sha256=3D7a2b6b493463756bbc9c54144fab2f2163bc84f0896b4c06fd225d11025a210d
+
 [http://www.cpan.org/modules/by-module/Time/TimeDate-1.16.tar.gz]
 md5=3Db3cc35a7cabd106ac8829d2f2ff4bd9d
 sha256=3D7942ef0181b5828563a1b98a0a801a75bc0102773a1c942a09ac1d0b9fba6cb3
@@ -6106,6 +6114,10 @@ sha256=3D53082354ae893fd385051c96214640cbeba527131cc=
f9f5320626252a4aef8d5
 md5=3Deb8b6d834d2224e17561593dc4158e4d
 sha256=3D418c3b9e099b96f7b8e1456c34b585b2f4bd10af88fb976116a154e4cb54fa9b
=20
+[http://www.us.xfce.org/archive/xfce-4.6.1/src/exo-0.3.101.tar.bz2]
+md5=3D1c0eebb360f53eab70454b70e1bde36e
+sha256=3D0016f6ff0d1d22ed42fb5c9bcecc5559a62572781446fdfd1444786b5d33e324
+
 [http://www.us.xfce.org/archive/xfce-4.4.2/src/exo-0.3.4.tar.bz2]
 md5=3D7a1af943b1df32b6f89ae91823118a22
 sha256=3Da5373e9bd6055caa7cd5d06128f6236cfd2f4f6657ea4a85d7bd9eafe5bf0538
@@ -8038,6 +8050,10 @@ sha256=3D3d3013fb5648b6060202a63c13c160899da8baf7561=
40c7fd8f4ed432b40fdd2
 md5=3Df492b6e3607aed801b77657f3808f5c1
 sha256=3D3d3013fb5648b6060202a63c13c160899da8baf756140c7fd8f4ed432b40fdd2
=20
+[http://files.uvena.de/gigolo/gigolo-0.3.2.tar.bz2]
+md5=3De810a525b495d08bce69317aa37d6134
+sha256=3De4b20c058ba70f3aa0258ff16817e238303f5d1efb87dbac4acf016e628a7151
+
 [ftp://ftp.gimp.org/pub/gimp/v2.2/gimp-2.2.10.tar.bz2]
 md5=3Daa29506ed2272af02941a7a601a7a097
 sha256=3D41f4befa851177e2ca9bbab2fad19926178c831454ca51f2cb91fec0ed9e243e
@@ -10686,6 +10702,10 @@ sha256=3Dcb2b353839a7f1dcd8f93a6cb32b5c54a6fe560de=
e432585edb2f5eebe526c50
 md5=3D00eb6a62defe6867d28a18569b96d151
 sha256=3D6fecdb590fa024db698de9027314c1be044f28feab9850f592aa60c3a79ede78
=20
+[http://www.us.xfce.org/archive/xfce-4.6.1/src/gtk-xfce-engine-2.6.0.tar.b=
z2]
+md5=3De836705d2933d0a77c6628285e10d982
+sha256=3Dc817050b2526ac107e1971d344aa20e06b98b80b60c912e83fa96d7804b4e8ca
+
 [http://src.gentoo.pl/distfiles/gtk2-ssh-askpass-0.3.tar.gz]
 md5=3D14ca8c653ad19699b7299198d7a94e0a
 sha256=3D5b0a2b2ea2cbe26d7738a360ba5aad57d7d03297a662cf209a032c0b9725d33c
@@ -15818,6 +15838,10 @@ sha256=3D8f3cd90d4ea258ffa35b8723c1eae7ace31409baa=
85361889664084c6c5d1b6d
 md5=3D5ffe66a3eeb884839806ce929e5d2776
 sha256=3D192843e8fdd63e10ba431ca12265c654dbce9677ec9d330038eea462ca0e5c8e
=20
+[http://www.us.xfce.org/archive/xfce-4.6.1/src/libxfce4menu-4.6.1.tar.bz2]
+md5=3D5dc9343885c2c6f931318b2a1cdcc9db
+sha256=3D5442b458b0e4f6bbbb6ddfbf1a7789dde1d270ab85686a3be77731a4d5ef84da
+
 [http://www.us.xfce.org/archive/xfce-4.2.2/src/libxfce4util-4.2.2.tar.gz]
 md5=3D5f27635aa0ba5e40ffaf3031b530b36b
 sha256=3D8efb3416a37654050089234115fe7db9268c8da0ee0369ff3f5330cef3f15a66
@@ -15830,6 +15854,10 @@ sha256=3D988efce9b4fd7252475234be3ca3fe8b737125eba=
adc8c448d1c5d4cbc8bb521
 md5=3D261e7a5df039493ad746e0c359211092
 sha256=3Df717dcdb4d8ee8f967ed0882e82aad06abe66c32481b9954737273312c937a6d
=20
+[http://www.us.xfce.org/archive/xfce-4.6.1/src/libxfce4util-4.6.1.tar.bz2]
+md5=3Deac51d58179cbcadc3f802450a8ec9cd
+sha256=3Dceecdc7d3c89f547606c2d77a8a42ccf9975c809374fab84ff0833a08510c16b
+
 [http://www.us.xfce.org/archive/xfce-4.2.2/src/libxfcegui4-4.2.2.tar.gz]
 md5=3De88d6e8379eae60cee6dd6122bf3ae59
 sha256=3Dbdd542e60ffbe4987b5ae765e581fe5bcfdfc4d623341d09aaff7794e90d4454
@@ -15846,6 +15874,10 @@ sha256=3Da3da5f3b70e65d6679cfb21fd2baf10baedceb8b0=
99347987f9b6c5fa7cd329b
 md5=3D799a4869138c605126e8e71d58189bfd
 sha256=3D622c2585f61666d9c46841829ba141e86861c73bd9041a3a73452d1c8df5ee91
=20
+[http://www.us.xfce.org/archive/xfce-4.6.1/src/libxfcegui4-4.6.1.tar.bz2]
+md5=3D539cff747634b8ee6f0d2362ee78a286
+sha256=3D3468a9cb348bf54f8a0afa386366683eff1987b722d2e81326f9e7ec7dfbe093
+
 [http://xorg.freedesktop.org/releases/individual/lib/libxkbfile-1.0.4.tar.=
bz2]
 md5=3D12b4ceb5d42b520228b5fb40a96ae6c5
 sha256=3D468ade4eaa3951a7c34b6ae1c290ab1a1d364ee36c5c455ef0df15550825b8ae
@@ -17938,6 +17970,10 @@ sha256=3D48c456dfcadec2db472320e317fa37dc697f184e1=
2f99006a1ec0b6512d2ebcd
 md5=3D326075ac933e5da38cedbc20e80b7026
 sha256=3Df32cc263fb73b05c5bad17121073a2b37a7d5c8e411f780312c2701902e6637a
=20
+[http://www.us.xfce.org/archive/xfce-4.6.1/src/mousepad-0.2.16.tar.bz2]
+md5=3Dd98854edb76d823ac20b266fdf5a64a1
+sha256=3D86e593fd4b1b87d27cda9ebd8901078e795031b5880645850d6ef0b410f4e73e
+
 [http://www.stack.nl/~brama/mp3blaster/src/mp3blaster-3.1.3.tar.gz]
 md5=3D38beb6a5648cbca4ec87ee14b0982283
 sha256=3Dc1b110f2aa5ed8744f7f6eeabf24d6cd1cecc50f4b5473ec6ddf622935f360ee
@@ -22194,6 +22230,10 @@ sha256=3D654d6b190f4644d82c10b4ce5645b72405c2e78ea=
346ce3d8eb385fc3f3732de
 md5=3D2ea5f7cd44f79b64721ce60f1fc1c2b7
 sha256=3Dc3ab591b02afbb5b3f76a0c1406c607b9561138bdb0a62105981de559d2920dc
=20
+[http://goodies.xfce.org/releases/ristretto/ristretto-0.0.21.tar.gz]
+md5=3D7774dcafdc365e70b8d981c0a52d6250
+sha256=3Db3e63ef1d4a582c2a3f4e99f097ec28273edf9feb51162b470d4c12c61a51378
+
 [http://heanet.dl.sourceforge.net/sourceforge/gkernel/rng-tools-2.tar.gz]
 md5=3D63d503191eabed630324c104cc024475
 sha256=3D1126f0ecc8cab3af14a562cddc5d8ffeef47df7eba34a7aadcdee35a25ec2b1e
@@ -23446,6 +23486,10 @@ sha256=3D8423027a1e7dc238d27ec227f47ce22d1317b4c9a=
0a9ee49a38b6e6f8da8a5c8
 md5=3Da3c23391da4ebab0ac4a75021ddabf96
 sha256=3D18948edbe06bac2c4307eea99bfb962643e4b82e5b7edd541b4d743748e12e21
=20
+[http://squeeze.xfce.org/downloads/squeeze-0.2.3.tar.bz2]
+md5=3Dbd3cb0648b49be1f146fc4f675606176
+sha256=3D7b8dc13e0adf72c67bba12e1ed1285ec820946e65d0eec247f7bd159a2cfac2d
+
 [http://www.squid-cache.org/Versions/v2/2.6/squid-2.6.STABLE14.tar.bz2]
 md5=3Deadb138d48320df8b99349121159c6bf
 sha256=3Ddcb0c10965430862721b675e2f9f6a30819880e03124b5e9403bfce2c7f3b69a
@@ -25790,6 +25834,10 @@ sha256=3Da4f15c73e2b67c888cbedfaa8093661dff6cb8593=
57c197c60f3026baddb939e
 md5=3D4c6a93e00123d8bb7af48a009519aca4
 sha256=3D4f923e24d674ac62ded3da402a4de6d402886d80e3d7cac91cf026921f32fcf7
=20
+[http://djwillis.openpandora.org/pandora/wifi/wl1251-wireless-2009-08-30-2=
158.zip]
+md5=3Db69ee5a5ffc825ff6d7970a62dcae46a
+sha256=3D6641a438972acdc8113957c25a17db55d6d9c3ce037ed3ac5337ac6ee153d73f
+
 [ftp://ftp.elmeg.de/artem/ClientCards/11b/linux/wl_lkm_718_release.tar.gz]
 md5=3D049c6c3d410e9f46884627b57485d3e7
 sha256=3Da28c7ea94d57a5354b7de06cf5f6416d80a40596911c129d4b6a4087dc916831
@@ -27894,6 +27942,10 @@ sha256=3Da40832c874dda5a06c0208cd178a8d02cd61cb237=
9aa46cdffbe3fb592fd551c
 md5=3D119dd3f1daedfa41e3be89bad8997336
 sha256=3Deba910fb99598e09fa4c41c4ab405216a2b59a837a3ab058656360ec2324314c
=20
+[http://www.us.xfce.org/archive/xfce-4.6.1/src/xfce-utils-4.6.1.tar.bz2]
+md5=3D1aa2362b11e79e56d52ce0d265faf1b6
+sha256=3D8310ad3694567dc7cbe0d57f4283712ca9e576ca73c9dc53a576b546f0b6b571
+
 [http://www.us.xfce.org/archive/xfce-4.2.2/src/xfce4-appfinder-4.2.2.tar.g=
z]
 md5=3D0ef8c944e8aa2db06719e02b2c40d70c
 sha256=3D4bca692e0af03c0f70c6cf62f2b60274e71899beaa45815c2d0f46f7f19c06d5
@@ -27906,10 +27958,18 @@ sha256=3D1e6c80b800dd02f6b1cbf69df36307cc0b341ab7=
3438c5508ac760fd8be66232
 md5=3D0bdd0b1e96a1e1cf50ce5d582758b992
 sha256=3Dbdf232505f240d0933ca3cd7d2a5c07c31477a70570d95111f94a1226bf7e59c
=20
+[http://www.us.xfce.org/archive/xfce-4.6.1/src/xfce4-appfinder-4.6.1.tar.b=
z2]
+md5=3Da1bc7d88100cfd92714a300be531589b
+sha256=3D5eab9a3ba822a1163c07efd917c3425eaf149c01c09df375ac38a0cb7ddf20a4
+
 [http://www.us.xfce.org/archive/xfce-4.4.2/src/xfce4-dev-tools-4.4.0.1.tar=
.bz2]
 md5=3D7d09d161efc7ef86b3b48791d98c8ae8
 sha256=3D1e7a506f08c8a4f368dd18648006ba3934a94eb96fd4545f5303d46aeae9cc3e
=20
+[http://www.us.xfce.org/archive/xfce-4.6.1/src/xfce4-dev-tools-4.6.0.tar.b=
z2]
+md5=3Dc9587fa78e877eee858a33391d0afd62
+sha256=3D4763a891ac7030c109c7ca03b1b0b834859c2aac4f8e359774ee01a6875694ac
+
 [http://www.us.xfce.org/archive/xfce-4.4.2/src/xfce4-icon-theme-4.4.2.tar.=
bz2]
 md5=3Dd3e3e64596a7efa857d2e6bb0cbd09bb
 sha256=3D72178637c479ba848747285e0c7dc53a3abfe26b6517df5e75c7449542017350
@@ -27926,6 +27986,14 @@ sha256=3D6beda572195d6f7ed108e0659592d1ca6ad5088e7=
69e3d219cc4114533f8b169
 md5=3Dc21cb5680f135dc86e5f0a6f9473003a
 sha256=3Db390241dfddbc10ae1b870d1326a7675b9ac99e13c89326ba2accea3bfecc47a
=20
+[http://www.us.xfce.org/archive/xfce-4.6.1/src/xfce4-mixer-4.6.1.tar.bz2]
+md5=3Da99e2455445480ef5081fe69454a46fc
+sha256=3Dcf7b8af6696b0e3795ab65d15a8b5d217123955919713f7bae86008b56abb5dd
+
+[http://spuriousinterrupt.org/files/xfce4-notifyd/xfce4-notifyd-0.1.0.tar.=
bz2]
+md5=3D659ecaf37f0f7ee9e31f7b25f9813778
+sha256=3D989b0e9ae9ff5bdbdbf56368a44eca039236033f84d05001e311c21c988bd0e1
+
 [http://www.us.xfce.org/archive/xfce-4.2.2/src/xfce4-panel-4.2.2.tar.gz]
 md5=3D50699e6c8e4a79f0a4f962e12559c9d0
 sha256=3Db29e8524c448b9712f5eff0d7702706289a4a2967125b82a92a50ca142cc2d66
@@ -27938,10 +28006,26 @@ sha256=3D1925b19457594b5e2a57f07f649375be428a038e=
b821c8b445dc1e7d2fe9c769
 md5=3D8f26b32c442bf9926f98f285a3c251dd
 sha256=3Dddabfb0ccf04366820efdeb7c640ee3a648a55e51b5177c9861a5ab896e96ddd
=20
+[http://www.us.xfce.org/archive/xfce-4.6.1/src/xfce4-panel-4.6.1.tar.bz2]
+md5=3D73a366b9892152266b465d7d9c35bef4
+sha256=3Db308ddc96fcb27b3f18ed2fa20aeb3a12fb73cec7676d75914a58d1b27124b83
+
 [http://www.us.xfce.org/archive/xfce-4.4.2/src/xfce4-session-4.4.2.tar.bz2=
]
 md5=3D4c3d1acb8ce37ea4dd55d82aeb38e9e7
 sha256=3D7394906dec7b50789407219f85143ae83b10938949d38adeecdd59eb50c8c1c6
=20
+[http://www.us.xfce.org/archive/xfce-4.6.1/src/xfce4-session-4.6.1.tar.bz2=
]
+md5=3D7628be41ed3511a20cff5673d9d39858
+sha256=3Dfeed3f9053b83233697223a20f95ca0ad6efe9fedffcc098e4935a425e8f9f0e
+
+[http://www.us.xfce.org/archive/xfce-4.6.1/src/xfce4-settings-4.6.1.tar.bz=
2]
+md5=3Ddc1c8704471c5b0104fa10c30eb60cb6
+sha256=3D36dda4d43366fad47ee95ea5d4fa336d0b14f79c524b4f29a2ac1b9ada4abf8d
+
+[http://www.us.xfce.org/archive/xfce-4.6.1/src/xfconf-4.6.1.tar.bz2]
+md5=3Dd4d3018767ea9eb4b57cc57d4038023b
+sha256=3D22a596f73795be398382e82e9c11062423daa374339ce6db808f73a6ba19380e
+
 [http://xorg.freedesktop.org/releases/individual/app/xfd-1.0.1.tar.bz2]
 md5=3Dc72abd90f50ef459bc14b39ec9fcc7f8
 sha256=3D111baa16780429d6739ab69b7393a18d75a10b7615dcc8cd0b0878ab9a5e2e1e
@@ -27966,6 +28050,10 @@ sha256=3D427df09a88f9b4a38fbed68d8154090bf0c11fbdc=
132c26247dc5568ee5ae910
 md5=3D694601234e74903d0fccba064f411e0c
 sha256=3D7e50c13e45b1424924c49dd1e9daa6c16881ee57ac21e4e2c6f20c0eec227cdb
=20
+[http://www.us.xfce.org/archive/xfce-4.6.1/src/xfdesktop-4.6.1.tar.bz2]
+md5=3Dae15cacc3e3834cca7238a8e1035c50d
+sha256=3D22aa4a654798dcfa728a9c0056486f73ae87a51239950c8f85aedef488cd571a
+
 [http://www.us.xfce.org/archive/xfce-4.2.0/src/xffm-4.2.0.tar.gz]
 md5=3D476b50335da473d46b12f43a07a28e83
 sha256=3Ddcd12681eaaf2b88dd512023949080b6d47426ff855efc03329790ab479280c9
@@ -28006,6 +28094,10 @@ sha256=3D4eee12555dbc296fa26afbfdbfabad3586000239d=
5666e54b6bfae7f8cd03e89
 md5=3Dbe4802807e74dea30f4825102ceff5c5
 sha256=3Db9bb03820a8ba1995ffe3e5b96b6d5ebbbc0347ad1202172f13bba63b2984d54
=20
+[http://www.us.xfce.org/archive/xfce-4.6.1/src/xfprint-4.6.1.tar.bz2]
+md5=3Dd92fca97a42816085080baf07a99a62e
+sha256=3Dbe0cc5d149234c22dee69db5f8cbddebc46bc21a4f96fefdec21df36b2a15f17
+
 [http://xorg.freedesktop.org/releases/individual/app/xfs-1.0.4.tar.bz2]
 md5=3Df43cb64d623b748208dfd9012d17b654
 sha256=3D452dde2923c7ae5a2b8cb4b9735507c579c1c55a0e5e45a34210e52574ee641b
@@ -28070,6 +28162,10 @@ sha256=3D3600267ba477217f065628454bffb30d881973194=
0c7fdbfd197c731bca9125f
 md5=3D21da77e50b07e72bba784bf3418ca067
 sha256=3D710120122bc4acaaecdb0646656c5aa92f1d44c4c81d1a6775688abab04cca0a
=20
+[http://www.us.xfce.org/archive/xfce-4.6.1/src/xfwm4-4.6.1.tar.bz2]
+md5=3D538ff2554a23bf877d336e573884da9a
+sha256=3D0a808d19a7ddf1f5271d0b7009a5d0dc919562a85afab4071df060f51e9ee9ed
+
 [http://www.us.xfce.org/archive/xfce-4.2.0/src/xfwm4-themes-4.2.0.tar.gz]
 md5=3Da8d0676fbf9cd3b3514d76a39d4ecbe1
 sha256=3D9aebac55dfc92a3533678a873d0f3babee285061b0ad5b26a56b6e72fb306ed4
--=20
1.6.3.1


------=_NextPart_000_0075_01CA4C08.2C485E30--
