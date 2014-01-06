Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 742FD6077F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2014 15:47:26 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id f15so7876274eak.25
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2014 07:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mqlnUJqsWa7wqRUDOViNAJNFseUC6jF06GztMnoBs2U=;
	b=bItO+dQuAu/qvoTQAGy86gxIjNwWngFID3HP9JbjW0n4ekgLZHoRAU2IYz76/SJ3R7
	7qlAikYbPgfQVOsfNvq6rnGdFDXReVVedRqnp4JBbS427Ht3/Wxzvu2ftx1aVLrN+EwN
	/yFy1o0lovCl0V/EWxPQdXnu2+m6YOEkG6U7Llc7WkQ+oiGiXbwTTDtHlCoXgYcyq/LZ
	5zJlQXgH+mI2TW4o4Vlz3Sk5IcU4oLvBJwjqMERAZMzRv+BxZqZ+ApsZyoQJfF+9px9R
	uwlSgv85Khw9U4txfBsPjnp1B1+xlYQZgtW+mmT4g7+XBh+A1FxkK+T81EVRRseU9lsv
	EjMg==
X-Received: by 10.14.209.129 with SMTP id s1mr89230940eeo.21.1389023246988;
	Mon, 06 Jan 2014 07:47:26 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id v7sm171956287eel.2.2014.01.06.07.47.24
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Jan 2014 07:47:25 -0800 (PST)
Date: Mon, 6 Jan 2014 16:47:32 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Yevhen Kyriukha <kirgene@gmail.com>
Message-ID: <20140106154732.GL3709@jama>
References: <1389017945-55027-1-git-send-email-kirgene@gmail.com>
	<20140106144257.GJ3709@jama>
	<CADV-EXG_nU=-C_EOWRcXMo_Pg5p+FRKNhB8VGYfZCtORa1ZSRw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADV-EXG_nU=-C_EOWRcXMo_Pg5p+FRKNhB8VGYfZCtORa1ZSRw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v3] udisks: updated to v2.1.1.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Jan 2014 15:47:27 -0000
X-Groupsio-MsgNum: 47617
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C01fF7hLGvN0zd9s"
Content-Disposition: inline

--C01fF7hLGvN0zd9s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 06, 2014 at 05:22:48PM +0200, Yevhen Kyriukha wrote:
> 2014/1/6 Martin Jansa <martin.jansa@gmail.com>
> >
> > On Mon, Jan 06, 2014 at 04:19:05PM +0200, Yevhen Kyriukha wrote:
> > > One patch was removed because changes are already exist in upstream v=
ersion.
> > > Added patch to turn libatasmart, polkit, acl and libsystemd-login int=
o optional dependencies.
> >
> > I cannot take this patch until gnome-disk-utility and acl are fixed, see
> > https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/=
msg34110.html
> >
>=20
> OK.
> Do you know if someone is working on gnome-disk-utility update?

No I don't know about anyone doing it already.

> And what's wrong with acl?

libacl doesn't exist in public layers, acl does.

Do you have some private layer with libacl included?

> > > Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com>
> > > ---
> > >  .../udisks/udisks/add-systemd-support.patch        | 112 ---
> > >  .../udisks/udisks/optional-depends.patch           | 902 +++++++++++=
----------
> > >  meta-oe/recipes-support/udisks/udisks_1.0.4.bb     |  39 -
> > >  meta-oe/recipes-support/udisks/udisks_2.1.1.bb     |  38 +
> > >  4 files changed, 532 insertions(+), 559 deletions(-)
> > >  delete mode 100644 meta-oe/recipes-support/udisks/udisks/add-systemd=
-support.patch
> > >  delete mode 100644 meta-oe/recipes-support/udisks/udisks_1.0.4.bb
> > >  create mode 100644 meta-oe/recipes-support/udisks/udisks_2.1.1.bb
> > >
> > > diff --git a/meta-oe/recipes-support/udisks/udisks/add-systemd-suppor=
t.patch b/meta-oe/recipes-support/udisks/udisks/add-systemd-support.patch
> > > deleted file mode 100644
> > > index 29df8a4..0000000
> > > --- a/meta-oe/recipes-support/udisks/udisks/add-systemd-support.patch
> > > +++ /dev/null
> > > @@ -1,112 +0,0 @@
> > > -From 7a485d491697906b445020dfcb37fe91806d7134 Mon Sep 17 00:00:00 20=
01
> > > -From: Lennart Poettering <lennart@poettering.net>
> > > -Date: Thu, 22 Jul 2010 02:20:22 +0200
> > > -Subject: [PATCH] systemd: install systemd unit files
> > > -Upstream-Status: ?
> > > -Based on: https://www.libreoffice.org/bugzilla/show_bug.cgi?id=3D292=
05
> > > ----
> > > - Makefile.am                            |    5 ++++-
> > > - configure.ac                           |    9 +++++++++
> > > - data/.gitignore                        |    1 +
> > > - data/Makefile.am                       |   11 ++++++++++-
> > > - data/org.freedesktop.UDisks.service.in |    2 +-
> > > - data/udisks-daemon.service.in          |   12 ++++++++++++
> > > - 6 files changed, 37 insertions(+), 3 deletions(-)
> > > - create mode 100644 data/udisks-daemon.service.in
> > > -
> > > -diff --git a/Makefile.am b/Makefile.am
> > > -index 588f05d..c3aaeea 100644
> > > ---- a/Makefile.am
> > > -+++ b/Makefile.am
> > > -@@ -24,7 +24,10 @@ EXTRA_DIST =3D                      \
> > > -     ChangeLog
> > > -
> > > - # xsltproc barfs on 'make distcheck'; disable for now
> > > --DISTCHECK_CONFIGURE_FLAGS=3D--disable-man-pages --disable-gtk-doc
> > > -+DISTCHECK_CONFIGURE_FLAGS =3D \
> > > -+    --disable-man-pages \
> > > -+    --disable-gtk-doc \
> > > -+    --with-systemdsystemunitdir=3D$$dc_install_base/$(systemdsystem=
unitdir)
> > > -
> > > - clean-local :
> > > -     rm -f *~
> > > -diff --git a/configure.ac b/configure.ac
> > > -index a9141bf..39bbd7a 100644
> > > ---- a/configure.ac
> > > -+++ b/configure.ac
> > > -@@ -232,6 +232,15 @@ AC_SUBST([GETTEXT_PACKAGE])
> > > - AM_GLIB_GNU_GETTEXT
> > > - AC_DEFINE_UNQUOTED([GETTEXT_PACKAGE],["$GETTEXT_PACKAGE"],[gettext =
domain])
> > > -
> > > -+# systemd
> > > -+
> > > -+AC_ARG_WITH([systemdsystemunitdir],
> > > -+        AS_HELP_STRING([--with-systemdsystemunitdir=3DDIR], [Direct=
ory for systemd service files]),
> > > -+        [],
> > > -+        [with_systemdsystemunitdir=3D$($PKG_CONFIG --variable=3Dsys=
temdsystemunitdir systemd)])
> > > -+AC_SUBST([systemdsystemunitdir], [$with_systemdsystemunitdir])
> > > -+AM_CONDITIONAL(HAVE_SYSTEMD, [test -n "$with_systemdsystemunitdir"])
> > > -+
> > > - AC_OUTPUT([
> > > - Makefile
> > > - data/Makefile
> > > -diff --git a/data/Makefile.am b/data/Makefile.am
> > > -index ca6d8ac..bf5c1a7 100644
> > > ---- a/data/Makefile.am
> > > -+++ b/data/Makefile.am
> > > -@@ -35,6 +35,14 @@ avahiservicedir =3D $(sysconfdir)/avahi/services
> > > - avahiservice_DATA =3D udisks.service
> > > - endif # REMOTE_ACCESS_ENABLED
> > > -
> > > -+if HAVE_SYSTEMD
> > > -+systemdsystemunit_DATA =3D \
> > > -+    udisks-daemon.service
> > > -+
> > > -+udisks-daemon.service: udisks-daemon.service.in
> > > -+    @sed -e "s|\@libexecdir\@|$(libexecdir)|" $< > $@
> > > -+endif
> > > -+
> > > - EXTRA_DIST =3D                                                \
> > > -     80-udisks.rules                                 \
> > > -     $(dbusif_DATA)                                  \
> > > -@@ -42,7 +50,8 @@ EXTRA_DIST =3D                                    =
           \
> > > -     $(dbusconf_in_files)                            \
> > > -     udisks.pc.in                                    \
> > > -     udisks.service                                  \
> > > -+    udisks-daemon.service.in                        \
> > > -     $(NULL)
> > > -
> > > - clean-local :
> > > --    rm -f *~ $(service_DATA) $(dbusconf_DATA)
> > > -+    rm -f *~ $(service_DATA) $(dbusconf_DATA) udisks-daemon.service
> > > -diff --git a/data/org.freedesktop.UDisks.service.in b/data/org.freed=
esktop.UDisks.service.in
> > > -index b3606a6..6ba2cd0 100644
> > > ---- a/data/org.freedesktop.UDisks.service.in
> > > -+++ b/data/org.freedesktop.UDisks.service.in
> > > -@@ -2,4 +2,4 @@
> > > - Name=3Dorg.freedesktop.UDisks
> > > - Exec=3D@libexecdir@/udisks-daemon
> > > - User=3Droot
> > > --
> > > -+SystemdService=3Dudisks-daemon.service
> > > -diff --git a/data/udisks-daemon.service.in b/data/udisks-daemon.serv=
ice.in
> > > -new file mode 100644
> > > -index 0000000..78379b2
> > > ---- /dev/null
> > > -+++ b/data/udisks-daemon.service.in
> > > -@@ -0,0 +1,12 @@
> > > -+[Unit]
> > > -+Description=3DDisk Manager
> > > -+After=3Dsyslog.target
> > > -+
> > > -+[Service]
> > > -+Type=3Ddbus
> > > -+BusName=3Dorg.freedesktop.UDisks
> > > -+ExecStart=3D@libexecdir@/udisks-daemon
> > > -+StandardOutput=3Dsyslog
> > > -+
> > > -+[Install]
> > > -+WantedBy=3Dgraphical.target
> > > ---
> > > -1.7.0.1
> > > -
> > > diff --git a/meta-oe/recipes-support/udisks/udisks/optional-depends.p=
atch b/meta-oe/recipes-support/udisks/udisks/optional-depends.patch
> > > index 6131701..6ca6002 100644
> > > --- a/meta-oe/recipes-support/udisks/udisks/optional-depends.patch
> > > +++ b/meta-oe/recipes-support/udisks/udisks/optional-depends.patch
> > > @@ -1,68 +1,93 @@
> > > -From 1b70b7a798eeeec554ab5aa9fcfff96a22e91774 Mon Sep 17 00:00:00 20=
01
> > > -From: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
> > > -Date: Thu, 26 May 2011 17:30:04 -0300
> > > -Subject: [PATCH] Allow disabling atasmart, lvm2 and devicemapper sup=
port.
> > > +Allow optional build with atasmart, polkit, acl and libsystemd-login.
> > >
> > > -https://bugs.freedesktop.org/show_bug.cgi?id=3D37647
> > > +Upstream-Status: Inappropriate [embedded specific]
> > > +
> > > +Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com>
> > > +---
> > > + configure.ac                |  120 ++++++++++++++++++++++++++++----=
-----------
> > > + data/Makefile.am            |    2 +
> > > + src/udisksdaemon.c          |    8 +++
> > > + src/udisksdaemon.h          |    2 +
> > > + src/udisksdaemontypes.h     |    4 ++
> > > + src/udisksdaemonutil.c      |    7 +++
> > > + src/udiskslinuxdriveata.c   |   12 +++++
> > > + src/udiskslinuxfilesystem.c |    6 +++
> > > + tools/udisksctl.c           |   55 +++++++++++++++-----
> > > + 9 files changed, 161 insertions(+), 55 deletions(-)
> > >
> > >  diff --git a/configure.ac b/configure.ac
> > > -index 62cc35d..b664135 100644
> > > +index dda6dce..f521a31 100644
> > >  --- a/configure.ac
> > >  +++ b/configure.ac
> > > -@@ -155,13 +155,33 @@ PKG_CHECK_MODULES(POLKIT_GOBJECT_1, [polkit-go=
bject-1 >=3D 0.97])
> > > - AC_SUBST(POLKIT_GOBJECT_1_CFLAGS)
> > > - AC_SUBST(POLKIT_GOBJECT_1_LIBS)
> > > +@@ -30,14 +30,6 @@ AC_PROG_LIBTOOL
> > > +
> > > + m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
> > >
> > > --PKG_CHECK_MODULES(LIBPARTED, [libparted >=3D 1.8.8])
> > > --AC_SUBST(LIBPARTED_CFLAGS)
> > > --AC_SUBST(LIBPARTED_LIBS)
> > > +-# Initialization
> > > +-#
> > >  -
> > > --PKG_CHECK_MODULES(DEVMAPPER, [devmapper >=3D 1.02])
> > > --AC_SUBST(DEVMAPPER_CFLAGS)
> > > --AC_SUBST(DEVMAPPER_LIBS)
> > > -+have_parted=3Dno
> > > -+AC_ARG_ENABLE(parted, AS_HELP_STRING([--disable-parted], [disable d=
isk partitioning]))
> > > -+if test "x$enable_parted" !=3D "xno"; then
> > > -+  PKG_CHECK_MODULES(LIBPARTED, [libparted >=3D 1.8.8],
> > > -+                    [AC_DEFINE(USE_PARTED, 1, [Define if parted sho=
uld be used]) have_parted=3Dyes],
> > > -+                    have_parted=3Dno)
> > > -+  AC_SUBST(LIBPARTED_CFLAGS)
> > > -+  AC_SUBST(LIBPARTED_LIBS)
> > > -+  if test "x$have_parted" =3D xno -a "x$enable_parted" =3D xyes; th=
en
> > > -+    AC_MSG_ERROR([parted support requested but libraries not found])
> > > -+  fi
> > > -+fi
> > > -+AM_CONDITIONAL(HAVE_PARTED, [test "$have_parted" =3D "yes"])
> > > -+
> > > -+have_devmapper=3Dno
> > > -+AC_ARG_ENABLE(devmapper, AS_HELP_STRING([--disable-devmapper], [dis=
able device mapper support]))
> > > -+if test "x$enable_devmapper" !=3D "xno"; then
> > > -+  PKG_CHECK_MODULES(DEVMAPPER, [devmapper >=3D 1.02],
> > > -+                    [AC_DEFINE(HAVE_DEVMAPPER, 1, [Define if device=
 mapper is available]) have_devmapper=3Dyes],
> > > -+                    have_devmapper=3Dno)
> > > -+  AC_SUBST(DEVMAPPER_CFLAGS)
> > > -+  AC_SUBST(DEVMAPPER_LIBS)
> > > -+  if test "x$have_devmapper" =3D xno -a "x$enable_devmapper" =3D xy=
es; then
> > > -+    AC_MSG_ERROR([devmapper support requested but libraries not fou=
nd])
> > > -+  fi
> > > -+fi
> > > -+AM_CONDITIONAL(HAVE_DEVMAPPER, [test "$have_devmapper" =3D "yes"])
> > > +-GNOME_COMMON_INIT
> > > +-GNOME_DEBUG_CHECK
> > > +-GNOME_COMPILE_WARNINGS([maximum])
> > > +-GNOME_MAINTAINER_MODE_DEFINES
> > > +-
> > > + # Compilation
> > > + #
> > >
> > > - have_lvm2=3Dno
> > > - AC_ARG_ENABLE(lvm2, AS_HELP_STRING([--disable-lvm2], [disable LVM2 =
support]))
> > > -@@ -185,9 +205,19 @@ if test "x$enable_dmmp" !=3D "xno"; then
> > > - fi
> > > - AM_CONDITIONAL(HAVE_DMMP, [test "$have_dmmp" =3D "yes"])
> > > +@@ -133,29 +125,59 @@ PKG_CHECK_MODULES(GIO, [gio-unix-2.0 >=3D 2.31=
=2E13])
> > > + AC_SUBST(GIO_CFLAGS)
> > > + AC_SUBST(GIO_LIBS)
> > >
> > > --PKG_CHECK_MODULES(LIBATASMART, [libatasmart >=3D 0.14])
> > > +-PKG_CHECK_MODULES(POLKIT_GOBJECT_1, [polkit-gobject-1 >=3D 0.92])
> > > +-AC_SUBST(POLKIT_GOBJECT_1_CFLAGS)
> > > +-AC_SUBST(POLKIT_GOBJECT_1_LIBS)
> > > +-
> > > +-PKG_CHECK_MODULES(POLKIT_AGENT_1, [polkit-agent-1 >=3D 0.92])
> > > +-AC_SUBST(POLKIT_AGENT_1_CFLAGS)
> > > +-AC_SUBST(POLKIT_AGENT_1_LIBS)
> > > +-
> > > +-PKG_CHECK_MODULES(LIBATASMART, [libatasmart >=3D 0.17])
> > >  -AC_SUBST(LIBATASMART_CFLAGS)
> > >  -AC_SUBST(LIBATASMART_LIBS)
> > > +-
> > > +-PKG_CHECK_MODULES(LIBSYSTEMD_LOGIN,
> > > +-                  [libsystemd-login >=3D 44 libsystemd-daemon],
> > > +-                  have_libsystemd_login=3Dyes,
> > > +-                  have_libsystemd_login=3Dno)
> > > +-AM_CONDITIONAL(HAVE_LIBSYSTEMD_LOGIN, test x$have_libsystemd_login =
=3D xyes)
> > > +-if test "x$have_libsystemd_login" =3D "xyes"; then
> > > +-  AC_DEFINE([HAVE_LIBSYSTEMD_LOGIN], 1, [Define to 1 if libsystemd-=
login is available])
> > > ++have_polkit=3Dno
> > > ++AC_ARG_ENABLE(poolkit, AS_HELP_STRING([--disable-polkit], [disable =
polkit support]))
> > > ++if test "x$enable_polkit" !=3D "xno"; then
> > > ++  have_polkit_gobject=3Dno
> > > ++  have_polkit_agent=3Dno
> > > ++  PKG_CHECK_MODULES(POLKIT_GOBJECT_1, [polkit-gobject-1 >=3D 0.92],
> > > ++          have_polkit_gobject=3Dyes, have_polkit_gobject=3Dno)
> > > ++  AC_SUBST(POLKIT_GOBJECT_1_CFLAGS)
> > > ++  AC_SUBST(POLKIT_GOBJECT_1_LIBS)
> > > ++
> > > ++  PKG_CHECK_MODULES(POLKIT_AGENT_1, [polkit-agent-1 >=3D 0.92],
> > > ++          have_polkit_agent=3Dyes, have_polkit_agent=3Dno)
> > > ++  AC_SUBST(POLKIT_AGENT_1_CFLAGS)
> > > ++  AC_SUBST(POLKIT_AGENT_1_LIBS)
> > > ++
> > > ++  if test "x$have_polkit_gobject" =3D xyes -a "x$have_polkit_agent"=
 =3D xyes; then
> > > ++    have_polkit=3Dyes
> > > ++    AC_DEFINE(HAVE_POLKIT, 1, [Define if polkit is available])
> > > ++  fi
> > > ++  if test "x$have_polkit" =3D xno -a "x$enable_polkit" =3D xyes; th=
en
> > > ++    AC_MSG_ERROR([polkit support requested but libraries not found])
> > > ++  fi
> > > ++fi
> > > ++AM_CONDITIONAL(HAVE_POLKIT, [test "$have_polkit" =3D "yes"])
> > > ++
> > >  +have_libatasmart=3Dno
> > >  +AC_ARG_ENABLE(libatasmart, AS_HELP_STRING([--disable-libatasmart], =
[disable libatasmart support]))
> > >  +if test "x$enable_libatasmart" !=3D "xno"; then
> > >  +  PKG_CHECK_MODULES(LIBATASMART, [libatasmart >=3D 0.14],
> > > -+                    [AC_DEFINE(HAVE_LIBATASMART, 1, [Define if liba=
tasmart is available]) have_libatasmart=3Dyes],
> > > -+                    have_libatasmart=3Dno)
> > > ++          [AC_DEFINE(HAVE_LIBATASMART, 1, [Define if libatasmart is=
 available]) have_libatasmart=3Dyes],
> > > ++          have_libatasmart=3Dno)
> > >  +  AC_SUBST(LIBATASMART_CFLAGS)
> > >  +  AC_SUBST(LIBATASMART_LIBS)
> > >  +  if test "x$have_libatasmart" =3D xno -a "x$enable_libatasmart" =
=3D xyes; then
> > > @@ -70,415 +95,476 @@ index 62cc35d..b664135 100644
> > >  +  fi
> > >  +fi
> > >  +AM_CONDITIONAL(HAVE_LIBATASMART, [test "$have_libatasmart" =3D "yes=
"])
> > > -
> > > - PKG_CHECK_MODULES(LIBUDEV, [libudev >=3D 143])
> > > - AC_SUBST(LIBUDEV_CFLAGS)
> > > -@@ -267,9 +297,12 @@ echo "
> > > -         cppflags:                   ${CPPFLAGS}
> > > -         xsltproc:                   ${XSLTPROC}
> > > -
> > > -+        Parted support:             ${have_parted}
> > > -+        Device Mapper support:      ${have_devmapper}
> > > -         LVM2 support:               ${have_lvm2}
> > > -         dm-multipath:               ${have_dmmp}
> > > -         Remote Access:              ${remote_access}
> > > ++
> > > ++have_libsystemd_login=3Dno
> > > ++AC_ARG_ENABLE(libsystemd_login, AS_HELP_STRING([--disable-libsystem=
d-login], [disable libsystemd-login support]))
> > > ++if test "x$enable_libsystemd_login" !=3D "xno"; then
> > > ++  PKG_CHECK_MODULES(LIBSYSTEMD_LOGIN,
> > > ++          [libsystemd-login >=3D 44 libsystemd-daemon],
> > > ++          [AC_DEFINE(HAVE_LIBSYSTEMD_LOGIN, 1, [Define if libsystem=
d-login is available]) have_libsystemd_login=3Dyes],
> > > ++          have_libsystemd_login=3Dno)
> > > ++  AC_SUBST(LIBSYSTEMD_LOGIN_CFLAGS)
> > > ++  AC_SUBST(LIBSYSTEMD_LOGIN_LIBS)
> > > ++  if test "x$have_libsystemd_login" =3D xno -a "x$enable_libsystemd=
_login" =3D xyes; then
> > > ++    AC_MSG_ERROR([libsystemd-login support requested but libraries =
not found])
> > > ++  fi
> > > + fi
> > > +-AC_SUBST(HAVE_LIBSYSTEMD_LOGIN)
> > > +-AC_SUBST(LIBSYSTEMD_LOGIN_CFLAGS)
> > > +-AC_SUBST(LIBSYSTEMD_LOGIN_LIBS)
> > > ++AM_CONDITIONAL(HAVE_LIBSYSTEMD_LOGIN, test x$have_libsystemd_login =
=3D xyes)
> > > +
> > > + # udevdir
> > > + AC_ARG_WITH([udevdir],
> > > +@@ -175,17 +197,30 @@ fi
> > > + AM_CONDITIONAL(HAVE_SYSTEMD, [test -n "$systemdsystemunitdir"])
> > > +
> > > + # libacl
> > > +-AC_CHECK_HEADERS(
> > > +-        [sys/acl.h acl/libacl.h],
> > > +-        [ACL_CFLAGS=3D""],
> > > +-        AC_MSG_ERROR([*** ACL headers not found.]))
> > > +-AC_CHECK_LIB(
> > > +-        [acl],
> > > +-        [acl_get_file],
> > > +-        [ACL_LIBS=3D"-lacl"],
> > > +-        AC_MSG_ERROR([*** libacl not found.]))
> > > +-AC_SUBST(ACL_CFLAGS)
> > > +-AC_SUBST(ACL_LIBS)
> > > ++have_acl=3Dno
> > > ++AC_ARG_ENABLE(acl, AS_HELP_STRING([--disable-acl], [disable acl sup=
port]))
> > > ++if test "x$enable_acl" !=3D "xno"; then
> > > ++  AC_CHECK_HEADERS(
> > > ++          [sys/acl.h acl/libacl.h],
> > > ++          [
> > > ++            AC_CHECK_LIB(
> > > ++                [acl],
> > > ++                [acl_get_file],
> > > ++                [AC_DEFINE(HAVE_ACL, 1, [Define if libacl is availa=
ble]) have_acl=3Dyes],
> > > ++                have_acl=3Dno)
> > > ++          ],
> > > ++          have_acl=3Dno)
> > > ++  if test "x$have_acl" =3D "xyes"; then
> > > ++    ACL_CFLAGS=3D""
> > > ++    ACL_LIBS=3D"-lacl"
> > > ++  fi
> > > ++  AC_SUBST(ACL_CFLAGS)
> > > ++  AC_SUBST(ACL_LIBS)
> > > ++  if test "x$have_acl" =3D xno -a "x$enable_acl" =3D xyes; then
> > > ++    AC_MSG_ERROR([acl support requested but libraries not found])
> > > ++  fi
> > > ++fi
> > > ++AM_CONDITIONAL(HAVE_ACL, [test "$have_acl" =3D "yes"])
> > > +
> > > + # Internationalization
> > > + #
> > > +@@ -232,6 +267,9 @@ echo "
> > > +         udevdir:                    ${udevdir}
> > > +         systemdsystemunitdir:       ${systemdsystemunitdir}
> > > +         using libsystemd-login:     ${have_libsystemd_login}
> > >  +        libatasmart support:        ${have_libatasmart}
> > > ++        acl support:                ${have_acl}
> > > ++        polkit support:             ${have_polkit}
> > > +
> > > +         compiler:                   ${CC}
> > > +         cflags:                     ${CFLAGS}
> > > +diff --git a/data/Makefile.am b/data/Makefile.am
> > > +index 0921698..bf8c8b3 100644
> > > +--- a/data/Makefile.am
> > > ++++ b/data/Makefile.am
> > > +@@ -28,9 +28,11 @@ endif
> > > + udevrulesdir =3D $(udevdir)/rules.d
> > > + udevrules_DATA =3D 80-udisks2.rules
> > > +
> > > ++if HAVE_POLKIT
> > > + polkitdir        =3D $(datadir)/polkit-1/actions
> > > + polkit_in_files  =3D org.freedesktop.udisks2.policy.in
> > > + polkit_DATA      =3D $(polkit_in_files:.policy.in=3D.policy)
> > > ++endif
> > >
> > > -         Maintainer mode:            ${USE_MAINTAINER_MODE}
> > > -         Profiling:                  ${enable_profiling}
> > > -diff --git a/src/adapter-private.h b/src/adapter-private.h
> > > -index 3409e21..ef584e3 100644
> > > ---- a/src/adapter-private.h
> > > -+++ b/src/adapter-private.h
> > > -@@ -23,7 +23,6 @@
> > > + completionsdir =3D $(datadir)/bash-completion/completions
> > > + completions_DATA =3D                                  \
> > > +diff --git a/src/udisksdaemon.c b/src/udisksdaemon.c
> > > +index 6f194ae..842d7d9 100644
> > > +--- a/src/udisksdaemon.c
> > > ++++ b/src/udisksdaemon.c
> > > +@@ -65,8 +65,10 @@ struct _UDisksDaemon
> > >
> > > - #include <dbus/dbus-glib.h>
> > > - #include <gudev/gudev.h>
> > > --#include <atasmart.h>
> > > +   UDisksLinuxProvider *linux_provider;
> > >
> > > - #include "types.h"
> > > ++#ifdef HAVE_POLKIT
> > > +   /* may be NULL if polkit is masked */
> > > +   PolkitAuthority *authority;
> > > ++#endif
> > >
> > > -diff --git a/src/adapter.c b/src/adapter.c
> > > -index b85a0ef..802420b 100644
> > > ---- a/src/adapter.c
> > > -+++ b/src/adapter.c
> > > -@@ -30,7 +30,6 @@
> > > - #include <dbus/dbus-glib.h>
> > > - #include <dbus/dbus-glib-lowlevel.h>
> > > - #include <gudev/gudev.h>
> > > --#include <atasmart.h>
> > > -
> > > - #include "daemon.h"
> > > - #include "adapter.h"
> > > -diff --git a/src/daemon.c b/src/daemon.c
> > > -index 6072502..d043cb0 100644
> > > ---- a/src/daemon.c
> > > -+++ b/src/daemon.c
> > > -@@ -1745,6 +1745,7 @@ mdstat_changed_event (GIOChannel *channel,
> > > -   return TRUE;
> > > - }
> > > +   UDisksState *state;
> > >
> > > -+#ifdef HAVE_LIBATASMART
> > > - static gboolean
> > > - refresh_ata_smart_data (Daemon *daemon)
> > > - {
> > > -@@ -1773,6 +1774,7 @@ refresh_ata_smart_data (Daemon *daemon)
> > > +@@ -100,7 +102,9 @@ udisks_daemon_finalize (GObject *object)
> > > +   udisks_state_stop_cleanup (daemon->state);
> > > +   g_object_unref (daemon->state);
> > > +
> > > ++#ifdef HAVE_POLKIT
> > > +   g_clear_object (&daemon->authority);
> > > ++#endif
> > > +   g_object_unref (daemon->object_manager);
> > > +   g_object_unref (daemon->linux_provider);
> > > +   g_object_unref (daemon->mount_monitor);
> > > +@@ -190,6 +194,7 @@ udisks_daemon_constructed (GObject *object)
> > > +   GError *error;
> > > +
> > > +   error =3D NULL;
> > > ++#ifdef HAVE_POLKIT
> > > +   daemon->authority =3D polkit_authority_get_sync (NULL, &error);
> > > +   if (daemon->authority =3D=3D NULL)
> > > +     {
> > > +@@ -197,6 +202,7 @@ udisks_daemon_constructed (GObject *object)
> > > +                     error->message, g_quark_to_string (error->domai=
n), error->code);
> > > +       g_error_free (error);
> > > +     }
> > > ++#endif
> > >
> > > -   return FALSE;
> > > +   daemon->object_manager =3D g_dbus_object_manager_server_new ("/or=
g/freedesktop/UDisks2");
> > > +
> > > +@@ -418,12 +424,14 @@ udisks_daemon_get_linux_provider (UDisksDaemon=
 *daemon)
> > > +  * authority is not available. Do not free, the object is owned by
> > > +  * @daemon.
> > > +  */
> > > ++#ifdef HAVE_POLKIT
> > > + PolkitAuthority *
> > > + udisks_daemon_get_authority (UDisksDaemon *daemon)
> > > + {
> > > +   g_return_val_if_fail (UDISKS_IS_DAEMON (daemon), NULL);
> > > +   return daemon->authority;
> > >   }
> > >  +#endif
> > >
> > > - static gboolean
> > > - register_disks_daemon (Daemon *daemon)
> > > -@@ -1984,12 +1986,14 @@ daemon_new (void)
> > > -   mount_file_clean_stale (l);
> > > -   g_list_free (l);
> > > + /**
> > > +  * udisks_daemon_get_state:
> > > +diff --git a/src/udisksdaemon.h b/src/udisksdaemon.h
> > > +index 6005e91..6bf3bd1 100644
> > > +--- a/src/udisksdaemon.h
> > > ++++ b/src/udisksdaemon.h
> > > +@@ -37,7 +37,9 @@ UDisksMountMonitor       *udisks_daemon_get_mount_=
monitor     (UDisksDaemon    *
> > > + UDisksFstabMonitor       *udisks_daemon_get_fstab_monitor     (UDis=
ksDaemon    *daemon);
> > > + UDisksCrypttabMonitor    *udisks_daemon_get_crypttab_monitor  (UDis=
ksDaemon    *daemon);
> > > + UDisksLinuxProvider      *udisks_daemon_get_linux_provider    (UDis=
ksDaemon    *daemon);
> > > ++#ifdef HAVE_POLKIT
> > > + PolkitAuthority          *udisks_daemon_get_authority         (UDis=
ksDaemon    *daemon);
> > > ++#endif
> > > + UDisksState              *udisks_daemon_get_state             (UDis=
ksDaemon    *daemon);
> > >
> > > -+#ifdef HAVE_LIBATASMART
> > > -   /* set up timer for refreshing ATA SMART data - we don't want to =
refresh immediately because
> > > -    * when adding a device we also do this...
> > > -    */
> > > -   daemon->priv->ata_smart_refresh_timer_id =3D g_timeout_add_second=
s (ATA_SMART_REFRESH_INTERVAL_SECONDS,
> > > -                                                                    =
 (GSourceFunc) refresh_ata_smart_data,
> > > -                                                                    =
 daemon);
> > > + /**
> > > +diff --git a/src/udisksdaemontypes.h b/src/udisksdaemontypes.h
> > > +index 398581c..d8439ad 100644
> > > +--- a/src/udisksdaemontypes.h
> > > ++++ b/src/udisksdaemontypes.h
> > > +@@ -22,7 +22,11 @@
> > > + #define __UDISKS_DAEMON_TYPES_H__
> > > +
> > > + #include <gio/gio.h>
> > > ++
> > > ++#ifdef HAVE_POLKIT
> > > + #include <polkit/polkit.h>
> > >  +#endif
> > > ++
> > > + #include <udisks/udisks.h>
> > > + #include <gudev/gudev.h>
> > >
> > > -   PROFILE ("daemon_new(): end");
> > > -   return daemon;
> > > -diff --git a/src/device-private.c b/src/device-private.c
> > > -index 22a0d35..fb96525 100644
> > > ---- a/src/device-private.c
> > > -+++ b/src/device-private.c
> > > -@@ -1378,7 +1378,7 @@ device_set_drive_ata_smart_time_collected (Dev=
ice *device,
> > > -
> > > - void
> > > - device_set_drive_ata_smart_status (Device *device,
> > > --                                   SkSmartOverall value)
> > > -+                                   guint value)
> > > +diff --git a/src/udisksdaemonutil.c b/src/udisksdaemonutil.c
> > > +index 574bf2c..c8625c0 100644
> > > +--- a/src/udisksdaemonutil.c
> > > ++++ b/src/udisksdaemonutil.c
> > > +@@ -426,6 +426,7 @@ udisks_daemon_util_setup_by_user (UDisksDaemon *=
daemon,
> > > +  *
> > > +  * http://cgit.freedesktop.org/polkit/commit/?h=3Dwip/js-rule-files=
&id=3D224f7b892478302dccbe7e567b013d3c73d376fd
> > > +  */
> > > ++#ifdef HAVE_POLKIT
> > > + static void
> > > + _safe_polkit_details_insert (PolkitDetails *details, const gchar *k=
ey, const gchar *value)
> > >   {
> > > -   if (G_UNLIKELY (device->priv->drive_ata_smart_status !=3D value))
> > > -     {
> > > -diff --git a/src/device-private.h b/src/device-private.h
> > > -index a6db7f2..71473a6 100644
> > > ---- a/src/device-private.h
> > > -+++ b/src/device-private.h
> > > -@@ -23,7 +23,6 @@
> > > +@@ -495,6 +496,7 @@ check_authorization_no_polkit (UDisksDaemon     =
     *daemon,
> > > +  out:
> > > +   return ret;
> > > + }
> > > ++#endif
> > >
> > > - #include <dbus/dbus-glib.h>
> > > - #include <gudev/gudev.h>
> > > --#include <atasmart.h>
> > > -
> > > - #include "types.h"
> > > -
> > > -@@ -224,7 +223,7 @@ struct DevicePrivate
> > > -
> > > -   gboolean drive_ata_smart_is_available;
> > > -   guint64 drive_ata_smart_time_collected;
> > > --  SkSmartOverall drive_ata_smart_status;
> > > -+  guint drive_ata_smart_status;
> > > -   void *drive_ata_smart_blob;
> > > -   gsize drive_ata_smart_blob_size;
> > > -
> > > -@@ -391,7 +390,7 @@ void device_set_holders_objpath (Device *device,=
 GStrv value);
> > > -
> > > - void device_set_drive_ata_smart_is_available (Device *device, gbool=
ean value);
> > > - void device_set_drive_ata_smart_time_collected (Device *device, gui=
nt64 value);
> > > --void device_set_drive_ata_smart_status (Device *device, SkSmartOver=
all value);
> > > -+void device_set_drive_ata_smart_status (Device *device, guint value=
);
> > > - void device_set_drive_ata_smart_blob_steal (Device *device, gchar *=
blob, gsize blob_size);
> > > -
> > > - G_END_DECLS
> > > -diff --git a/src/device.c b/src/device.c
> > > -index 6a34940..7a5a4a9 100644
> > > ---- a/src/device.c
> > > -+++ b/src/device.c
> > > -@@ -50,7 +50,9 @@
> > > - #include <dbus/dbus-glib.h>
> > > - #include <dbus/dbus-glib-lowlevel.h>
> > > - #include <gudev/gudev.h>
> > > -+#ifdef HAVE_LIBATASMART
> > > - #include <atasmart.h>
> > > + /**
> > > +  * udisks_daemon_util_check_authorization_sync:
> > > +@@ -540,6 +542,7 @@ udisks_daemon_util_check_authorization_sync (UDi=
sksDaemon          *daemon,
> > > +                                              const gchar           =
*message,
> > > +                                              GDBusMethodInvocation =
*invocation)
> > > + {
> > > ++#ifdef HAVE_POLKIT
> > > +   PolkitAuthority *authority =3D NULL;
> > > +   PolkitSubject *subject =3D NULL;
> > > +   PolkitDetails *details =3D NULL;
> > > +@@ -752,10 +755,14 @@ udisks_daemon_util_check_authorization_sync (U=
DisksDaemon          *daemon,
> > > +   g_clear_object (&details);
> > > +   g_clear_object (&result);
> > > +   return ret;
> > > ++#else
> > > ++  return TRUE;
> > >  +#endif
> > > + }
> > > +
> > > + /* ----------------------------------------------------------------=
------------------------------------ */
> > > +
> > > ++
> > > + /**
> > > +  * udisks_daemon_util_get_caller_uid_sync:
> > > +  * @daemon: A #UDisksDaemon.
> > > +diff --git a/src/udiskslinuxdriveata.c b/src/udiskslinuxdriveata.c
> > > +index 48cc6e6..30407d6 100644
> > > +--- a/src/udiskslinuxdriveata.c
> > > ++++ b/src/udiskslinuxdriveata.c
> > > +@@ -36,7 +36,9 @@
> > > + #include <glib/gstdio.h>
> > > + #include <errno.h>
> > >
> > > - #include "daemon.h"
> > > - #include "device.h"
> > > -@@ -659,10 +661,14 @@ get_property (GObject *object,
> > > -     case PROP_DRIVE_ATA_SMART_STATUS:
> > > -       {
> > > -         const gchar *status;
> > > --        if (device->priv->drive_ata_smart_status =3D=3D (SkSmartOve=
rall) - 1)
> > >  +#ifdef HAVE_LIBATASMART
> > > -+        if (device->priv->drive_ata_smart_status =3D=3D (guint) - 1)
> > > -           status =3D "";
> > > -         else
> > > -           status =3D sk_smart_overall_to_string (device->priv->driv=
e_ata_smart_status);
> > > -+#else
> > > -+        status =3D "";
> > > + #include <atasmart.h>
> > >  +#endif
> > > -         g_value_set_string (value, status);
> > > -       }
> > > -       break;
> > > -@@ -5114,6 +5120,7 @@ device_new (Daemon *daemon,
> > > -       goto out;
> > > -     }
> > > +
> > > + #include "udiskslogging.h"
> > > + #include "udiskslinuxprovider.h"
> > > +@@ -346,6 +348,7 @@ typedef struct
> > > +   gint num_attributes_failed_in_the_past;
> > > + } ParseData;
> > >
> > >  +#ifdef HAVE_LIBATASMART
> > > -   /* if just added, update the smart data if applicable */
> > > -   if (device->priv->drive_ata_smart_is_available)
> > > -     {
> > > -@@ -5121,6 +5128,7 @@ device_new (Daemon *daemon,
> > > -       gchar *ata_smart_refresh_data_options[] =3D { NULL };
> > > -       device_drive_ata_smart_refresh_data (device, ata_smart_refres=
h_data_options, NULL);
> > > + static void
> > > + parse_attr_cb (SkDisk                           *d,
> > > +                const SkSmartAttributeParsedData *a,
> > > +@@ -426,6 +429,7 @@ selftest_status_to_string (SkSmartSelfTestExecut=
ionStatus status)
> > >       }
> > > +   return ret;
> > > + }
> > >  +#endif
> > >
> > > -   PROFILE ("device_new(native_path=3D%s): end", native_path);
> > > -  out:
> > > -@@ -9794,16 +9802,18 @@ drive_ata_smart_refresh_data_completed_cb (D=
BusGMethodInvocation *context,
> > > -                                            const char *stdout,
> > > -                                            gpointer user_data)
> > > + /**
> > > +  * udisks_linux_drive_ata_refresh_smart_sync:
> > > +@@ -456,6 +460,7 @@ udisks_linux_drive_ata_refresh_smart_sync (UDisk=
sLinuxDriveAta  *drive,
> > > +                                            GCancellable         *ca=
ncellable,
> > > +                                            GError              **er=
ror)
> > >   {
> > >  +#ifdef HAVE_LIBATASMART
> > > -   gint rc;
> > > --  SkDisk *d;
> > > -+  SkDisk *d =3D NULL;
> > > -+  SkSmartOverall overall;
> > > -   gchar *blob;
> > > -   gsize blob_size;
> > > -   time_t time_collected;
> > > --  SkSmartOverall overall;
> > > +   UDisksLinuxDriveObject *object;
> > > +   UDisksLinuxDevice *device =3D NULL;
> > > +   gboolean ret =3D FALSE;
> > > +@@ -610,6 +615,9 @@ udisks_linux_drive_ata_refresh_smart_sync (UDisk=
sLinuxDriveAta  *drive,
> > > +     sk_disk_free (d);
> > > +   g_clear_object (&object);
> > > +   return ret;
> > > ++#else
> > > ++  return TRUE;
> > >  +#endif
> > > + }
> > >
> > > -   PROFILE ("drive_ata_smart_refresh_data_completed_cb(device=3D%s) =
start", device->priv->native_path);
> > > -
> > > --  d =3D NULL;
> > > + /* ----------------------------------------------------------------=
------------------------------------ */
> > > +@@ -636,6 +644,7 @@ udisks_linux_drive_ata_smart_selftest_sync (UDis=
ksLinuxDriveAta     *drive,
> > > +                                             GCancellable           =
 *cancellable,
> > > +                                             GError                 =
**error)
> > > + {
> > >  +#ifdef HAVE_LIBATASMART
> > > -   blob =3D NULL;
> > > -
> > > -   if (job_was_cancelled || stdout =3D=3D NULL)
> > > -@@ -9907,6 +9917,11 @@ drive_ata_smart_refresh_data_completed_cb (DB=
usGMethodInvocation *context,
> > > -   g_free (blob);
> > > -   if (d !=3D NULL)
> > > +   UDisksLinuxDriveObject  *object;
> > > +   UDisksLinuxDevice *device;
> > > +   SkDisk *d =3D NULL;
> > > +@@ -692,6 +701,9 @@ udisks_linux_drive_ata_smart_selftest_sync (UDis=
ksLinuxDriveAta     *drive,
> > >       sk_disk_free (d);
> > > -+
> > > +   g_clear_object (&object);
> > > +   return ret;
> > >  +#else
> > > -+  throw_error (context, ERROR_FAILED, "libatasmart support disabled=
");
> > > ++  return TRUE;
> > >  +#endif
> > > -+
> > > -   PROFILE ("drive_ata_smart_refresh_data_completed_cb(device=3D%s) =
end", device->priv->native_path);
> > >   }
> > >
> > > -diff --git a/src/expander-private.h b/src/expander-private.h
> > > -index ef4f440..98a8300 100644
> > > ---- a/src/expander-private.h
> > > -+++ b/src/expander-private.h
> > > -@@ -23,7 +23,6 @@
> > > -
> > > - #include <dbus/dbus-glib.h>
> > > - #include <gudev/gudev.h>
> > > --#include <atasmart.h>
> > > -
> > > - #include "types.h"
> > > -
> > > -diff --git a/src/expander.c b/src/expander.c
> > > -index 734ec0a..e799f13 100644
> > > ---- a/src/expander.c
> > > -+++ b/src/expander.c
> > > -@@ -34,7 +34,6 @@
> > > - #include <dbus/dbus-glib.h>
> > > - #include <dbus/dbus-glib-lowlevel.h>
> > > - #include <gudev/gudev.h>
> > > --#include <atasmart.h>
> > > - #include <stdlib.h>
> > > -
> > > - #include "daemon.h"
> > > -diff --git a/src/helpers/Makefile.am b/src/helpers/Makefile.am
> > > -index 4b863c0..d3ec4e9 100644
> > > ---- a/src/helpers/Makefile.am
> > > -+++ b/src/helpers/Makefile.am
> > > -@@ -19,15 +19,9 @@ INCLUDES =3D \
> > > -
> > > - libexec_PROGRAMS =3D                                  \
> > > -     udisks-helper-mkfs                              \
> > > --    udisks-helper-delete-partition                  \
> > > --    udisks-helper-create-partition                  \
> > > --    udisks-helper-modify-partition                  \
> > > --    udisks-helper-create-partition-table            \
> > > -     udisks-helper-change-filesystem-label           \
> > > -     udisks-helper-linux-md-remove-component         \
> > > -     udisks-helper-fstab-mounter                     \
> > > --    udisks-helper-ata-smart-collect                 \
> > > --    udisks-helper-ata-smart-selftest                \
> > > -     udisks-helper-drive-detach                      \
> > > -     udisks-helper-drive-poll                        \
> > > -     udisks-helper-linux-md-check                    \
> > > -@@ -48,6 +42,13 @@ udisks_helper_mkfs_SOURCES =3D job-shared.h job-m=
kfs.c
> > > - udisks_helper_mkfs_CPPFLAGS =3D $(AM_CPPFLAGS)
> > > - udisks_helper_mkfs_LDADD =3D $(GLIB_LIBS)
> > > -
> > > -+if HAVE_PARTED
> > > -+libexec_PROGRAMS +=3D                                     \
> > > -+    udisks-helper-delete-partition                  \
> > > -+    udisks-helper-create-partition                  \
> > > -+    udisks-helper-modify-partition                  \
> > > -+    udisks-helper-create-partition-table
> > > -+
> > > - udisks_helper_delete_partition_SOURCES =3D job-shared.h job-delete-=
partition.c
> > > - udisks_helper_delete_partition_CPPFLAGS =3D $(AM_CPPFLAGS)
> > > - udisks_helper_delete_partition_LDADD =3D $(GLIB_LIBS) libpartutil.la
> > > -@@ -63,11 +64,17 @@ udisks_helper_modify_partition_LDADD =3D $(GLIB_=
LIBS) libpartutil.la
> > > - udisks_helper_create_partition_table_SOURCES =3D job-shared.h job-c=
reate-partition-table.c
> > > - udisks_helper_create_partition_table_CPPFLAGS =3D $(AM_CPPFLAGS)
> > > - udisks_helper_create_partition_table_LDADD =3D $(GLIB_LIBS) libpart=
util.la
> > > -+endif
> > > + /* ----------------------------------------------------------------=
------------------------------------ */
> > > +diff --git a/src/udiskslinuxfilesystem.c b/src/udiskslinuxfilesystem=
=2Ec
> > > +index 4c8d8aa..98c3d44 100644
> > > +--- a/src/udiskslinuxfilesystem.c
> > > ++++ b/src/udiskslinuxfilesystem.c
> > > +@@ -29,7 +29,9 @@
> > > + #include <stdio.h>
> > > + #include <mntent.h>
> > > + #include <sys/types.h>
> > > ++#ifdef HAVE_ACL
> > > + #include <sys/acl.h>
> > > ++#endif
> > > + #include <errno.h>
> > >
> > > - udisks_helper_change_filesystem_label_SOURCES =3D job-shared.h job-=
change-filesystem-label.c
> > > - udisks_helper_change_filesystem_label_CPPFLAGS =3D $(AM_CPPFLAGS)
> > > - udisks_helper_change_filesystem_label_LDADD =3D $(GLIB_LIBS)
> > > + #include <glib/gstdio.h>
> > > +@@ -790,6 +792,7 @@ ensure_utf8 (const gchar *s)
> > >
> > > -+if HAVE_LIBATASMART
> > > -+libexec_PROGRAMS +=3D                                     \
> > > -+    udisks-helper-ata-smart-collect                 \
> > > -+    udisks-helper-ata-smart-selftest
> > > -+
> > > - udisks_helper_ata_smart_selftest_SOURCES =3D job-shared.h job-ata-s=
mart-selftest.c
> > > - udisks_helper_ata_smart_selftest_CPPFLAGS =3D $(AM_CPPFLAGS) $(LIBA=
TASMART_CFLAGS) $(GLIB_CFLAGS)
> > > - udisks_helper_ata_smart_selftest_LDADD =3D $(LIBATASMART_LIBS) $(GL=
IB_LIBS)
> > > -@@ -75,6 +82,7 @@ udisks_helper_ata_smart_selftest_LDADD =3D $(LIBAT=
ASMART_LIBS) $(GLIB_LIBS)
> > > - udisks_helper_ata_smart_collect_SOURCES =3D job-ata-smart-collect.c
> > > - udisks_helper_ata_smart_collect_CPPFLAGS =3D $(AM_CPPFLAGS) $(LIBAT=
ASMART_CFLAGS) $(GLIB_CFLAGS)
> > > - udisks_helper_ata_smart_collect_LDADD =3D $(LIBATASMART_LIBS) $(GLI=
B_LIBS)
> > > -+endif
> > > + /* ----------------------------------------------------------------=
------------------------------------ */
> > >
> > > - udisks_helper_linux_md_remove_component_SOURCES =3D job-shared.h jo=
b-linux-md-remove-component.c
> > > - udisks_helper_linux_md_remove_component_CPPFLAGS =3D $(AM_CPPFLAGS)
> > > -diff --git a/src/helpers/partutil.c b/src/helpers/partutil.c
> > > -index 72a8fe3..8893a39 100644
> > > ---- a/src/helpers/partutil.c
> > > -+++ b/src/helpers/partutil.c
> > > -@@ -62,7 +62,6 @@ DEBUG (const gchar *format,
> > > - #  include <config.h>
> > > - #endif
> > > -
> > > --#define USE_PARTED
> > > - #ifdef USE_PARTED
> > > - #include <parted/parted.h>
> > > - #endif
> > > -@@ -928,6 +927,7 @@ part_table_parse_apple (int fd,
> > > -   return p;
> > > - }
> > > -
> > > -+#ifdef USE_PARTED
> > > - static PartitionTable *
> > > - part_table_load_from_disk_from_file (char *device_file)
> > > - {
> > > -@@ -948,6 +948,7 @@ part_table_load_from_disk_from_file (char *devic=
e_file)
> > > -  out:
> > > ++#ifdef HAVE_ACL
> > > + static gboolean
> > > + add_acl (const gchar  *path,
> > > +          uid_t         uid,
> > > +@@ -825,6 +828,7 @@ add_acl (const gchar  *path,
> > > +     acl_free (acl);
> > >     return ret;
> > >   }
> > >  +#endif
> > >
> > > - PartitionTable *
> > > - part_table_load_from_disk (int fd)
> > > -diff --git a/src/port-private.h b/src/port-private.h
> > > -index cc48376..a91532f 100644
> > > ---- a/src/port-private.h
> > > -+++ b/src/port-private.h
> > > -@@ -23,7 +23,6 @@
> > > -
> > > - #include <dbus/dbus-glib.h>
> > > - #include <gudev/gudev.h>
> > > --#include <atasmart.h>
> > > -
> > > - #include "types.h"
> > > -
> > > -diff --git a/src/probers/Makefile.am b/src/probers/Makefile.am
> > > -index 06bb566..01c693b 100644
> > > ---- a/src/probers/Makefile.am
> > > -+++ b/src/probers/Makefile.am
> > > -@@ -22,8 +22,6 @@ INCLUDES =3D \
> > > -
> > > - udevhelperdir =3D $(slashlibdir)/udev
> > > - udevhelper_PROGRAMS =3D       udisks-part-id                  \
> > > --                    udisks-dm-export                \
> > > --                    udisks-probe-ata-smart          \
> > > -                     udisks-probe-sas-expander       \
> > > -                     $(NULL)
> > > -
> > > -@@ -35,17 +33,23 @@ udisks_part_id_SOURCES =3D part-id.c
> > > - udisks_part_id_CPPFLAGS =3D $(AM_CPPFLAGS) $(LIBUDEV_CFLAGS)
> > > - udisks_part_id_LDADD =3D $(GLIB_LIBS) $(LIBUDEV_LIBS) $(top_builddi=
r)/src/helpers/libpartutil.la
> > > -
> > > -+if HAVE_DEVMAPPER
> > > -+udevhelper_PROGRAMS +=3D udisks-dm-export
> > > - udisks_dm_export_SOURCES =3D udisks-dm-export.c
> > > - udisks_dm_export_CPPFLAGS =3D $(AM_CPPFLAGS) $(DEVMAPPER_CFLAGS) $(=
GLIB_CFLAGS)
> > > - udisks_dm_export_LDADD =3D $(DEVMAPPER_LIBS) $(GLIB_LIBS)
> > > -+endif
> > > -
> > > - udisks_lvm_pv_export_SOURCES =3D udisks-lvm-pv-export.c
> > > - udisks_lvm_pv_export_CPPFLAGS =3D $(AM_CPPFLAGS) $(DEVMAPPER_CFLAGS=
) $(LVM2_CFLAGS) $(GLIB_CFLAGS)
> > > - udisks_lvm_pv_export_LDADD =3D $(DEVMAPPER_LIBS) $(LVM2_LIBS) $(GLI=
B_LIBS)
> > > -
> > > -+if HAVE_LIBATASMART
> > > -+udevhelper_PROGRAMS +=3D udisks-probe-ata-smart
> > > - udisks_probe_ata_smart_SOURCES =3D udisks-probe-ata-smart.c
> > > - udisks_probe_ata_smart_CPPFLAGS =3D $(AM_CPPFLAGS) $(LIBATASMART_CF=
LAGS)
> > > - udisks_probe_ata_smart_LDADD =3D $(LIBATASMART_LIBS)
> > > -+endif
> > > + /*
> > > +  * calculate_mount_point: <internal>
> > > +@@ -914,6 +918,7 @@ calculate_mount_point (UDisksDaemon             =
 *daemon,
> > > +                            mount_dir);
> > > +               goto out;
> > > +             }
> > > ++#ifdef HAVE_ACL
> > > +           /* Finally, add the read+execute ACL for $USER */
> > > +           if (!add_acl (mount_dir, uid, error))
> > > +             {
> > > +@@ -921,6 +926,7 @@ calculate_mount_point (UDisksDaemon             =
 *daemon,
> > > +                 udisks_warning ("Error calling rmdir() on %s: %m", =
mount_dir);
> > > +               goto out;
> > > +             }
> > > ++#endif
> > > +         }
> > > +     }
> > > +   /* otherwise fall back to mounting in /media */
> > > +diff --git a/tools/udisksctl.c b/tools/udisksctl.c
> > > +index 97b0f17..eaac6a4 100644
> > > +--- a/tools/udisksctl.c
> > > ++++ b/tools/udisksctl.c
> > > +@@ -35,9 +35,11 @@
> > > +
> > > + #include <locale.h>
> > > +
> > > ++#ifdef HAVE_POLKIT
> > > + #include <polkit/polkit.h>
> > > + #define POLKIT_AGENT_I_KNOW_API_IS_SUBJECT_TO_CHANGE
> > > + #include <polkitagent/polkitagent.h>
> > > ++#endif
> > >
> > > - udisks_probe_sas_expander_SOURCES =3D udisks-probe-sas-expander.c
> > > - udisks_probe_sas_expander_CPPFLAGS =3D $(AM_CPPFLAGS) $(GLIB_CFLAGS)
> > > -diff --git a/tools/udisks.c b/tools/udisks.c
> > > -index 6fbd6a6..e0c4fbb 100644
> > > ---- a/tools/udisks.c
> > > -+++ b/tools/udisks.c
> > > -@@ -43,7 +43,9 @@
> > > - #include <dbus/dbus-glib.h>
> > > - #include <dbus/dbus-glib-lowlevel.h>
> > > + static UDisksClient *client =3D NULL;
> > > + static GMainLoop *loop =3D NULL;
> > > +@@ -58,6 +60,7 @@ static void modify_argv0_for_command (gint *argc, =
gchar **argv[], const gchar *c
> > >
> > > -+#ifdef HAVE_LIBATASMART
> > > - #include <atasmart.h>
> > > -+#endif
> > > + /* ----------------------------------------------------------------=
------------------------------------ */
> > >
> > > - #include "udisks-daemon-glue.h"
> > > - #include "udisks-device-glue.h"
> > > -@@ -979,6 +981,7 @@ end_highlight (void)
> > > -     g_print ("\x1B[0m");
> > > - }
> > > ++#ifdef HAVE_POLKIT
> > > + static PolkitAgentListener *local_polkit_agent =3D NULL;
> > > + static gpointer local_agent_handle =3D NULL;
> > >
> > > -+#ifdef HAVE_LIBATASMART
> > > - static const gchar *
> > > - ata_smart_status_to_desc (const gchar *status,
> > > -                           gboolean *out_highlight)
> > > -@@ -1159,6 +1162,7 @@ print_ata_smart_attr (SkDisk *d,
> > > -   g_free (threshold_str);
> > > -   g_free (pretty);
> > > +@@ -120,6 +123,7 @@ shutdown_local_polkit_agent (void)
> > > +   if (local_polkit_agent !=3D NULL)
> > > +     g_object_unref (local_polkit_agent);
> > >   }
> > >  +#endif
> > >
> > > - static void
> > > - do_show_info (const char *object_path)
> > > -@@ -1440,7 +1444,7 @@ do_show_info (const char *object_path)
> > > -         g_print ("    if speed:                  %" G_GINT64_FORMAT=
 " bits/s\n", props->drive_connection_speed);
> > >
> > > -       /* ----------------------------------------------------------=
--------------------------------------- */
> > > --
> > > -+#ifdef HAVE_LIBATASMART
> > > -       if (!props->drive_ata_smart_is_available)
> > > + /* ----------------------------------------------------------------=
------------------------------------ */
> > > +@@ -817,8 +821,11 @@ handle_command_mount_unmount (gint        *argc,
> > > +                                               &error))
> > >           {
> > > -           g_print ("    ATA SMART:                 not available\n"=
);
> > > -@@ -1493,7 +1497,9 @@ do_show_info (const char *object_path)
> > > -             }
> > > -
> > > -         }
> > > --
> > > -+#else
> > > -+          g_print ("    ATA SMART:                 not supported\n"=
);
> > > +           if (error->domain =3D=3D UDISKS_ERROR &&
> > > +-              error->code =3D=3D UDISKS_ERROR_NOT_AUTHORIZED_CAN_OB=
TAIN &&
> > > +-              setup_local_polkit_agent ())
> > > ++              error->code =3D=3D UDISKS_ERROR_NOT_AUTHORIZED_CAN_OB=
TAIN
> > > ++#ifdef HAVE_POLKIT
> > > ++              && setup_local_polkit_agent ()
> > >  +#endif
> > > -       /* ----------------------------------------------------------=
--------------------------------------- */
> > > ++             )
> > > +             {
> > > +               g_error_free (error);
> > > +               goto try_again;
> > > +@@ -846,8 +853,11 @@ handle_command_mount_unmount (gint        *argc,
> > > +                                                 &error))
> > > +         {
> > > +           if (error->domain =3D=3D UDISKS_ERROR &&
> > > +-              error->code =3D=3D UDISKS_ERROR_NOT_AUTHORIZED_CAN_OB=
TAIN &&
> > > +-              setup_local_polkit_agent ())
> > > ++              error->code =3D=3D UDISKS_ERROR_NOT_AUTHORIZED_CAN_OB=
TAIN
> > > ++#ifdef HAVE_POLKIT
> > > ++              && setup_local_polkit_agent ()
> > > ++#endif
> > > ++             )
> > > +             {
> > > +               g_error_free (error);
> > > +               goto try_again;
> > > +@@ -1264,8 +1274,11 @@ handle_command_unlock_lock (gint        *argc,
> > > +                                               &error))
> > > +         {
> > > +           if (error->domain =3D=3D UDISKS_ERROR &&
> > > +-              error->code =3D=3D UDISKS_ERROR_NOT_AUTHORIZED_CAN_OB=
TAIN &&
> > > +-              setup_local_polkit_agent ())
> > > ++              error->code =3D=3D UDISKS_ERROR_NOT_AUTHORIZED_CAN_OB=
TAIN
> > > ++#ifdef HAVE_POLKIT
> > > ++              && setup_local_polkit_agent ()
> > > ++#endif
> > > ++             )
> > > +             {
> > > +               g_error_free (error);
> > > +               goto try_again;
> > > +@@ -1298,8 +1311,11 @@ handle_command_unlock_lock (gint        *argc,
> > > +                                             &error))
> > > +         {
> > > +           if (error->domain =3D=3D UDISKS_ERROR &&
> > > +-              error->code =3D=3D UDISKS_ERROR_NOT_AUTHORIZED_CAN_OB=
TAIN &&
> > > +-              setup_local_polkit_agent ())
> > > ++              error->code =3D=3D UDISKS_ERROR_NOT_AUTHORIZED_CAN_OB=
TAIN
> > > ++#ifdef HAVE_POLKIT
> > > ++              && setup_local_polkit_agent ()
> > > ++#endif
> > > ++             )
> > > +             {
> > > +               g_error_free (error);
> > > +               goto try_again;
> > > +@@ -1639,8 +1655,11 @@ handle_command_loop (gint        *argc,
> > > +       if (!rc)
> > > +         {
> > > +           if (error->domain =3D=3D UDISKS_ERROR &&
> > > +-              error->code =3D=3D UDISKS_ERROR_NOT_AUTHORIZED_CAN_OB=
TAIN &&
> > > +-              setup_local_polkit_agent ())
> > > ++              error->code =3D=3D UDISKS_ERROR_NOT_AUTHORIZED_CAN_OB=
TAIN
> > > ++#ifdef HAVE_POLKIT
> > > ++              && setup_local_polkit_agent ()
> > > ++#endif
> > > ++             )
> > > +             {
> > > +               g_error_free (error);
> > > +               goto setup_try_again;
> > > +@@ -1699,8 +1718,11 @@ handle_command_loop (gint        *argc,
> > > +                                          &error))
> > > +         {
> > > +           if (error->domain =3D=3D UDISKS_ERROR &&
> > > +-              error->code =3D=3D UDISKS_ERROR_NOT_AUTHORIZED_CAN_OB=
TAIN &&
> > > +-              setup_local_polkit_agent ())
> > > ++              error->code =3D=3D UDISKS_ERROR_NOT_AUTHORIZED_CAN_OB=
TAIN
> > > ++#ifdef HAVE_POLKIT
> > > ++              && setup_local_polkit_agent ()
> > > ++#endif
> > > ++             )
> > > +             {
> > > +               g_error_free (error);
> > > +               goto delete_try_again;
> > > +@@ -1978,8 +2000,11 @@ handle_command_smart_simulate (gint        *a=
rgc,
> > > +                                                 &error))
> > > +     {
> > > +       if (error->domain =3D=3D UDISKS_ERROR &&
> > > +-          error->code =3D=3D UDISKS_ERROR_NOT_AUTHORIZED_CAN_OBTAIN=
 &&
> > > +-          setup_local_polkit_agent ())
> > > ++          error->code =3D=3D UDISKS_ERROR_NOT_AUTHORIZED_CAN_OBTAIN
> > > ++#ifdef HAVE_POLKIT
> > > ++          && setup_local_polkit_agent ()
> > > ++#endif
> > > ++         )
> > > +         {
> > > +           g_error_free (error);
> > > +           goto try_again;
> > > +@@ -3176,7 +3201,9 @@ main (int argc,
> > > +   if (client !=3D NULL)
> > > +     g_object_unref (client);
> > > +   _color_shutdown ();
> > > ++#ifdef HAVE_POLKIT
> > > +   shutdown_local_polkit_agent ();
> > > ++#endif
> > > +   return ret;
> > > + }
> > >
> > > -     }
> > >  --
> > > -1.7.5.rc3
> > > +1.7.9.5
> > >
> > > diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb b/meta-oe=
/recipes-support/udisks/udisks_1.0.4.bb
> > > deleted file mode 100644
> > > index 32f0c11..0000000
> > > --- a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
> > > +++ /dev/null
> > > @@ -1,39 +0,0 @@
> > > -DESCRIPTION =3D "A storage daemon that implements well-defined D-Bus=
 interfaces that can be used to query and manipulate storage devices."
> > > -LICENSE =3D "GPLv2+"
> > > -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D73d83aebe7e4b62346afde80e=
0e94273"
> > > -
> > > -DEPENDS =3D "libatasmart sg3-utils polkit udev dbus-glib glib-2.0"
> > > -# optional dependencies: device-mapper parted
> > > -
> > > -DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'systemd', 'system=
d', '', d)}"
> > > -
> > > -SRC_URI =3D "http://hal.freedesktop.org/releases/${BPN}-${PV}.tar.gz=
;name=3D${BPN} \
> > > -           file://optional-depends.patch"
> > > -
> > > -SRC_URI +=3D "${@base_contains('DISTRO_FEATURES', 'systemd', 'file:/=
/add-systemd-support.patch', '', d)}"
> > > -
> > > -SRC_URI[udisks.md5sum] =3D "86c63b2b5484f2060499a052b5b6256b"
> > > -SRC_URI[udisks.sha256sum] =3D "854b89368733b9c3a577101b761ad5397ae75=
a05110c8698ac5b29de9a8bf8f5"
> > > -
> > > -PR =3D "r9"
> > > -
> > > -inherit autotools systemd
> > > -
> > > -PACKAGECONFIG ??=3D ""
> > > -PACKAGECONFIG[parted] =3D "--enable-parted,--disable-parted,parted"
> > > -
> > > -EXTRA_OECONF =3D "--disable-man-pages"
> > > -
> > > -FILES_${PN} +=3D "${libdir}/polkit-1/extensions/*.so \
> > > -                ${datadir}/dbus-1/ \
> > > -                ${datadir}/polkit-1 \
> > > -                ${base_libdir}/udev/* \
> > > -"
> > > -
> > > -FILES_${PN}-dbg +=3D "${base_libdir}/udev/.debug"
> > > -
> > > -RPROVIDES_${PN} +=3D "${PN}-systemd"
> > > -RREPLACES_${PN} +=3D "${PN}-systemd"
> > > -RCONFLICTS_${PN} +=3D "${PN}-systemd"
> > > -SYSTEMD_SERVICE_${PN} =3D "udisks-daemon.service"
> > > -SYSTEMD_AUTO_ENABLE =3D "disable"
> > > diff --git a/meta-oe/recipes-support/udisks/udisks_2.1.1.bb b/meta-oe=
/recipes-support/udisks/udisks_2.1.1.bb
> > > new file mode 100644
> > > index 0000000..d4c6eff
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-support/udisks/udisks_2.1.1.bb
> > > @@ -0,0 +1,38 @@
> > > +DESCRIPTION =3D "A storage daemon that implements well-defined D-Bus=
 interfaces that can be used to query and manipulate storage devices."
> > > +LICENSE =3D "GPLv2+"
> > > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddd79f6dbbffdbc8e86b086a8f=
0c0ef43"
> > > +
> > > +DEPENDS =3D "udev dbus-glib glib-2.0"
> > > +
> > > +DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'systemd', 'system=
d', '', d)}"
> > > +
> > > +SRC_URI =3D "http://udisks.freedesktop.org/releases/${P}.tar.bz2 \
> > > +           file://optional-depends.patch"
> > > +
> > > +SRC_URI[md5sum] =3D "80e03f312542b800cf3162254b202725"
> > > +SRC_URI[sha256sum] =3D "013b09ff38aa256b89c01525771f4565cb088724d5c8=
c79b32e9f811e88086fb"
> > > +
> > > +inherit autotools systemd
> > > +
> > > +PACKAGECONFIG ??=3D "atasmart polkit acl ${@base_contains('DISTRO_FE=
ATURES', 'systemd', 'systemd-login', '', d)}"
> > > +PACKAGECONFIG[atasmart] =3D "--enable-libatasmart,--disable-libatasm=
art,libatasmart"
> > > +PACKAGECONFIG[polkit] =3D "--enable-polkit,--disable-polkit,polkit"
> > > +PACKAGECONFIG[acl] =3D "--enable-acl,--disable-acl,libacl"
> > > +PACKAGECONFIG[systemd-login] =3D "--enable-libsystemd-login,--disabl=
e-libsystemd-login,systemd"
> > > +
> > > +EXTRA_OECONF =3D "--disable-man"
> > > +
> > > +PACKAGES =3D+ "${PN}-bash-completion"
> > > +
> > > +FILES_${PN} +=3D "${libdir}/polkit-1/extensions/*.so \
> > > +                ${datadir}/dbus-1/ \
> > > +                ${datadir}/polkit-1 \
> > > +                ${base_libdir}/udev/* \
> > > +                ${libdir}/udisks2/* \
> > > +"
> > > +FILES_${PN}-dbg +=3D "${base_libdir}/udev/.debug \
> > > +             ${libdir}/udisks2/.debug"
> > > +FILES_${PN}-bash-completion =3D "${datadir}/bash-completion"
> > > +
> > > +SYSTEMD_SERVICE_${PN} =3D "udisks2.service"
> > > +SYSTEMD_AUTO_ENABLE =3D "disable"
> > > --
> > > 1.8.1.2
> > >
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--C01fF7hLGvN0zd9s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLK0BQACgkQN1Ujt2V2gBwjNgCfct84ZwhHXcCDOtoSs0Eql3RI
oO4An3gMWVL16yfOvsiNE8Ntb6TRXQdQ
=eqan
-----END PGP SIGNATURE-----

--C01fF7hLGvN0zd9s--
