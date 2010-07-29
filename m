Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OeZte-0007UO-Io
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 22:40:11 +0200
Received: (qmail 11838 invoked by uid 503); 29 Jul 2010 20:57:17 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 29 Jul 2010 20:57:17 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 29 Jul 2010 22:39:43 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 29 Jul 2010 22:39:41 +0200
Message-ID: <4C51E70C.8040106@eukrea.com>
Date: Thu, 29 Jul 2010 22:39:40 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.7) Gecko/20100713 Thunderbird/3.1.1
MIME-Version: 1.0
To: RTovo DSP <rtovo.dsp@gmail.com>
References: <AANLkTimjMO8TfDDyJGA4+pKToawicMe6hyXEjYVEEFsH@mail.gmail.com>
In-Reply-To: <AANLkTimjMO8TfDDyJGA4+pKToawicMe6hyXEjYVEEFsH@mail.gmail.com>
X-Ovh-Tracer-Id: 16648963398596799847
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: bitbake error when do_compile alsa_utils_1.0.20.bb
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
X-List-Received-Date: Thu, 29 Jul 2010 20:40:11 -0000
X-Groupsio-MsgNum: 21608
Content-Type: multipart/mixed; boundary="------------040704060407010502010206"

--------------040704060407010502010206
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 29/07/2010 22:21, RTovo DSP a écrit :
> I'm trying to build angstrom for mx31ads but it fails when trying to build
> alsamixer by not finding libtinfo:
>
you can try the attached patch (work in progress) which should compile 
(tested on i.MX35 which is also an armv6).

Eric

--------------040704060407010502010206
Content-Type: text/x-patch;
 name="alsa_utils_1.0.23.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="alsa_utils_1.0.23.diff"

diff --git a/recipes/alsa/alsa-plugins_1.0.23.bb b/recipes/alsa/alsa-plugins_1.0.23.bb
new file mode 100644
index 0000000..4d0da01
--- /dev/null
+++ b/recipes/alsa/alsa-plugins_1.0.23.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "ALSA Plugins"
+HOMEPAGE = "http://www.alsa-project.org"
+SECTION = "multimedia/alsa/plugins"
+LICENSE = "GPL"
+DEPENDS = "alsa-lib pulseaudio ffmpeg"
+PR = "r1"
+
+SRC_URI = "ftp://ftp.alsa-project.org/pub/plugins/alsa-plugins-${PV}.tar.bz2"
+
+inherit autotools
+
+CFLAGS += "-lavutil"
+
+PACKAGES_DYNAMIC = "libasound-module*"
+
+python populate_packages_prepend() {
+        plugindir = bb.data.expand('${libdir}/alsa-lib/', d)
+        do_split_packages(d, plugindir, '^libasound_module_(.*)\.so$', 'libasound-module-%s', 'Alsa plugin for %s', extra_depends='' )
+}
+
+FILES_${PN}-dev += "${libdir}/alsa-lib/libasound*.a ${libdir}/alsa-lib/libasound*.la"
+FILES_${PN}-dbg += "${libdir}/alsa-lib/.debug"
+
+SRC_URI[md5sum] = "819c4f21e3e913eacefd32993a8fbed7"
+SRC_URI[sha256sum] = "210ceedcb84bf3030e9f362d55b734312632ce72e348bd758536ec62a37aac97"
diff --git a/recipes/alsa/alsa-utils_1.0.23.bb b/recipes/alsa/alsa-utils_1.0.23.bb
new file mode 100644
index 0000000..ba9dbe5
--- /dev/null
+++ b/recipes/alsa/alsa-utils_1.0.23.bb
@@ -0,0 +1,74 @@
+DESCRIPTION = "ALSA Utilities"
+HOMEPAGE = "http://www.alsa-project.org"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+DEPENDS = "alsa-lib ncurses"
+PR = "r2"
+
+SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
+	  file://configure_1.0.23.diff "
+	
+
+inherit gettext autotools
+
+# This are all packages that we need to make. Also, the now empty alsa-utils
+# ipk depend on them.
+
+EXTRA_OECONF = "--disable-xmlto"
+
+#CURSESLIBDIR=""
+#do_configure_prepend() {
+#	sed -i -e 's:panel.h menu.h:menu.h:g' configure.in
+#}
+
+do_configure_append() {
+	for i in $(find ${S} -name Makefile) ; do
+		sed -i -e s:/usr/include/ncurses:${STAGING_INCDIR}/ncurses:g $i
+		sed -i -e 's:-L/usr/lib -lncurses:-L${STAGING_LIBDIR} -lncurses -lpanel -lmenu -lform:g' $i
+	done
+}
+
+PACKAGES += "\
+             alsa-utils-alsamixer \
+             alsa-utils-midi \
+             alsa-utils-aplay \
+             alsa-utils-amixer \
+             alsa-utils-aconnect \
+             alsa-utils-iecset \
+             alsa-utils-speakertest \
+             alsa-utils-aseqnet \
+             alsa-utils-aseqdump \
+             alsa-utils-alsaconf \
+             alsa-utils-alsactl "
+
+# We omit alsaconf, because
+# a) this is a bash script
+# b) it creates config files not suitable for OE-based distros
+
+FILES_${PN} = ""
+FILES_alsa-utils-aplay       = "${bindir}/aplay ${bindir}/arecord"
+FILES_alsa-utils-amixer      = "${bindir}/amixer"
+FILES_alsa-utils-alsamixer   = "${bindir}/alsamixer"
+FILES_alsa-utils-speakertest = "${bindir}/speaker-test ${datadir}/sounds/alsa/ ${datadir}/alsa/"
+FILES_alsa-utils-midi        = "${bindir}/aplaymidi ${bindir}/arecordmidi ${bindir}/amidi"
+FILES_alsa-utils-aconnect    = "${bindir}/aconnect"
+FILES_alsa-utils-aseqnet     = "${bindir}/aseqnet"
+FILES_alsa-utils-iecset      = "${bindir}/iecset"
+FILES_alsa-utils-alsactl     = "${sbindir}/alsactl"
+FILES_alsa-utils-aseqdump    = "${bindir}/aseqdump"
+FILES_alsa-utils-alsaconf    = "${sbindir}/alsaconf"
+
+DESCRIPTION_alsa-utils-aplay        = "play (and record) sound files via ALSA"
+DESCRIPTION_alsa-utils-amixer       = "command-line based control for ALSA mixer and settings"
+DESCRIPTION_alsa-utils-alsamixer    = "ncurses based control for ALSA mixer and settings"
+DESCRIPTION_alsa-utils-speakertest  = "ALSA surround speaker test utility"
+DESCRIPTION_alsa-utils-midi         = "miscalleanous MIDI utilities for ALSA"
+DESCRIPTION_alsa-utils-aconnect     = "ALSA sequencer connection manager"
+DESCRIPTION_alsa-utils-aseqnet      = "network client/server on ALSA sequencer"
+DESCRIPTION_alsa-utils-alsactl      = "saves/restores ALSA-settings in /etc/asound.state"
+DESCRIPTION_alsa-utils-alsaconf     = "a bash script that creates ALSA configuration files"
+
+ALLOW_EMPTY_alsa-utils = "1"
+
+SRC_URI[md5sum] = "cb0cf46029ac9549cf3a31bff6a4f4e1"
+SRC_URI[sha256sum] = "b7d05e915e25f8540ad151c6dd558cf0fc1e9bb0ee23052d531c983666a1f7b0"
diff --git a/recipes/alsa/files/configure_1.0.23.diff b/recipes/alsa/files/configure_1.0.23.diff
new file mode 100644
index 0000000..356a6b6
--- /dev/null
+++ b/recipes/alsa/files/configure_1.0.23.diff
@@ -0,0 +1,128 @@
+--- a/configure.in.orig	2010-06-28 17:58:46.000000000 +0200
++++ b/configure.in	2010-06-28 18:00:36.000000000 +0200
+@@ -1,6 +1,6 @@
+ dnl Process this file with autoconf to produce a configure script.
+ AC_PREREQ(2.59)
+-AC_INIT(aplay/aplay.c)
++AC_INIT(aplay/aplay.c)
+ AC_PREFIX_DEFAULT(/usr)
+ AM_INIT_AUTOMAKE(alsa-utils, 1.0.23)
+ 
+@@ -105,32 +105,23 @@
+     [  --with-curses libname   Specify the curses library to use (default=auto)],
+     curseslib="$withval",
+     curseslib="auto")
+-  CURSESLIBDIR=""
+-  NCURSESLIBSUFFIX=""
+-  CURSES_NLS="no"
+-  if test "$curseslib" = "ncursesw" -o \( "$curseslib" = "auto" -a "$USE_NLS" = "yes" \); then
++  if test "$curseslib" = "ncursesw"; then
+     AC_CHECK_PROG([ncursesw5_config], [ncursesw5-config], [yes])
+     if test "$ncursesw5_config" = "yes"; then
+       CURSESINC="<ncurses.h>"
+       CURSESLIB=`ncursesw5-config --libs`
+-      CURSESLIBDIR=`ncursesw5-config --libdir`
+       CURSES_CFLAGS=`ncursesw5-config --cflags`
+       curseslib="ncursesw"
+     else
+       AC_CHECK_LIB(ncursesw, initscr, 
+                  [ CURSESINC='<ncurses.h>'; CURSESLIB='-lncursesw'; curseslib="ncursesw"])
+     fi
+-    if test -n "$CURSESINC"; then
+-      NCURSESLIBSUFFIX="w"
+-      CURSES_NLS="yes"
+-    fi
+   fi
+   if test "$curseslib" = "ncurses" -o "$curseslib" = "auto"; then
+     AC_CHECK_PROG([ncurses5_config], [ncurses5-config], [yes])
+     if test "$ncurses5_config" = "yes"; then
+       CURSESINC="<ncurses.h>"
+       CURSESLIB=`ncurses5-config --libs`
+-      CURSESLIBDIR=`ncurses5-config --libdir`
+       CURSES_CFLAGS=`ncurses5-config --cflags`
+       curseslib="ncurses"
+     else
+@@ -145,83 +136,6 @@
+   if test -z "$CURSESINC"; then
+      AC_MSG_ERROR(this packages requires a curses library)
+   fi
+-
+-  AC_MSG_CHECKING([for curses library])
+-  AC_MSG_RESULT([$curseslib])
+-  AC_MSG_CHECKING([for curses header name])
+-  AC_MSG_RESULT([$CURSESINC])
+-  AC_MSG_CHECKING([for curses compiler flags])
+-  AC_MSG_RESULT([$CURSES_CFLAGS])
+-
+-  dnl CURSESLIBS might have the library path at the beginning.  If so, we cut it
+-  dnl off so that we can insert the other curses libraries before the ncurses
+-  dnl library but after the library path (which is later again prepended below).
+-  if test -n "$CURSESLIBDIR"; then
+-    if test "-L$CURSESLIBDIR " = "$(echo $CURSESLIB | cut -c-$((${#CURSESLIBDIR}+3)) )"; then
+-      CURSESLIB="$(echo $CURSESLIB | cut -c$((${#CURSESLIBDIR}+4))-)"
+-    fi
+-  fi
+-
+-  saved_CFLAGS="$CFLAGS"
+-  saved_LDFLAGS="$LDFLAGS"
+-  saved_LIBS="$LIBS"
+-  CFLAGS="$CFLAGS $CURSES_CFLAGS"
+-  if test -n "$CURSESLIBDIR"; then
+-    LDFLAGS="$LDFLAGS -L$CURSESLIBDIR"
+-  fi
+-  LIBS="$CURSESLIB $LIBS"
+-
+-  AC_TRY_LINK([#include <panel.h>], [set_escdelay(100);],[HAVE_CURSES_ESCDELAY="yes"])
+-  if test "$HAVE_CURSES_ESCDELAY" = "yes"; then
+-    AC_DEFINE([HAVE_CURSES_ESCDELAY], 1, [Have curses set_escdelay])
+-  fi
+-
+-  if test "$USE_NLS" = "yes"; then
+-    AC_MSG_CHECKING([for curses NLS support])
+-    dnl In theory, a single-byte curses works just fine in ISO 8859-* locales.
+-    dnl In practice, however, everybody uses UTF-8 nowadays, so we'd better
+-    dnl check for wide-character support.
+-    dnl For ncurses/ncursesw, CURSES_NLS was already set above.
+-    if test "$curseslib" = "curses"; then
+-      AC_TRY_LINK([
+-          #define _XOPEN_SOURCE 1
+-          #define _XOPEN_SOURCE_EXTENDED 1
+-          #include <curses.h>
+-        ], [
+-          cchar_t wc;
+-          setcchar(&wc, L"x", A_NORMAL, 0, 0);
+-        ],
+-        [CURSES_NLS="yes"])
+-    fi
+-    AC_MSG_RESULT([$CURSES_NLS])
+-    if test "$CURSES_NLS" = "yes"; then
+-      AC_DEFINE([ENABLE_NLS_IN_CURSES], [1],
+-                [Define if curses-based programs can show translated messages.])
+-    fi
+-  fi
+-
+-  AC_CHECK_HEADERS([panel.h menu.h form.h], [],
+-                   [AC_MSG_ERROR([required curses helper header not found])])
+-  AC_CHECK_LIB([panel$NCURSESLIBSUFFIX], [new_panel],
+-               [CURSESLIB="-lpanel$NCURSESLIBSUFFIX $CURSESLIB"],
+-               [AC_MSG_ERROR([panel$NCURSESLIBSUFFIX library not found])])
+-  AC_CHECK_LIB([menu$NCURSESLIBSUFFIX], [new_menu],
+-               [CURSESLIB="-lmenu$NCURSESLIBSUFFIX $CURSESLIB"],
+-               [AC_MSG_ERROR([menu$NCURSESLIBSUFFIX library not found])])
+-  AC_CHECK_LIB([form$NCURSESLIBSUFFIX], [new_form],
+-               [CURSESLIB="-lform$NCURSESLIBSUFFIX $CURSESLIB"],
+-               [AC_MSG_ERROR([form$NCURSESLIBSUFFIX library not found])])
+-
+-  CFLAGS="$saved_CFLAGS"
+-  LDFLAGS="$saved_LDFLAGS"
+-  LIBS="$saved_LIBS"
+-
+-  if test -n "$CURSESLIBDIR"; then
+-    CURSESLIB="-L$CURSESLIBDIR $CURSESLIB"
+-  fi
+-
+-  AC_MSG_CHECKING([for curses linker flags])
+-  AC_MSG_RESULT([$CURSESLIB])
+ fi
+ 
+ AC_SUBST(CURSESINC)

--------------040704060407010502010206--
