Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1LuQcG-0002Lb-52
	for openembedded-devel@openembedded.org; Thu, 16 Apr 2009 14:23:32 +0200
Received: (qmail 18796 invoked by uid 1003); 16 Apr 2009 12:18:56 -0000
Received: from localhost (HELO localhost.localdomain)
	(philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 16 Apr 2009 12:18:53 -0000
Message-ID: <49E7222C.6040404@balister.org>
Date: Thu, 16 Apr 2009 08:18:52 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 2.0.0.14 (X11/20080501)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1239701117-7033-1-git-send-email-k.kooi@student.utwente.nl>	<1239701117-7033-2-git-send-email-k.kooi@student.utwente.nl>	<1239701117-7033-3-git-send-email-k.kooi@student.utwente.nl>
	<1239701117-7033-4-git-send-email-k.kooi@student.utwente.nl>
In-Reply-To: <1239701117-7033-4-git-send-email-k.kooi@student.utwente.nl>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	URIBL_SBL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][STABLE][PATCH 3/4] gnome: update various bits to 2.26, sync with .dev
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
X-List-Received-Date: Thu, 16 Apr 2009 12:23:48 -0000
X-Groupsio-MsgNum: 9446
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms060008030305060907030401"

--------------ms060008030305060907030401
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



Koen Kooi wrote:
> From: Koen Kooi <koen@openembedded.org>
> 
> ---
>  classes/gtk-icon-cache.bbclass                     |   14 ++++++--
>  recipes/gnome/cheese_2.26.0.bb                     |   12 ++++++
>  recipes/gnome/gail_1.20.0.bb                       |    1 +
>  recipes/gnome/gnome-bluetooth_2.27.3.bb            |   23 ++++++++++++
>  recipes/gnome/gnome-desktop_2.26.0.bb              |    8 ++++
>  recipes/gnome/gnome-icon-theme_2.26.0.bb           |   13 +++++++
>  recipes/gnome/gnome-keyring_2.24.1.bb              |    4 ++-
>  recipes/gnome/gnome-menus_2.26.0.bb                |   15 ++++++++
>  recipes/gnome/gnome-panel/idl-sysroot.patch        |   12 +++---
>  recipes/gnome/gnome-panel_2.26.0.bb                |   27 ++++++++++++++
>  recipes/gnome/gnome-python-desktop_2.26.0.bb       |   28 +++++++++++++++
>  recipes/gnome/gvfs_1.2.1.bb                        |   21 +++++++++++
>  recipes/gnome/libart-lgpl/x86_64/art_config.h      |   10 +++++
>  recipes/gnome/libgnomecanvas_2.20.0.bb             |    3 +-
>  recipes/gnome/libgweather_2.26.0.bb                |   25 +++++++++++++
>  recipes/gnome/libsoup-2.4_2.26.0.bb                |    4 +-
>  recipes/gnome/libunique_1.0.8.bb                   |    7 ++++
>  recipes/nautilus/nautilus/idl-sysroot.patch        |    7 ++++
>  recipes/nautilus/nautilus/no-try-run-strftime.diff |   28 +++++++++++++++
>  recipes/nautilus/nautilus_2.24.2.bb                |    3 ++
>  recipes/nautilus/nautilus_2.26.1.bb                |   37 ++++++++++++++++++++
>  21 files changed, 289 insertions(+), 13 deletions(-)
>  create mode 100644 recipes/gnome/cheese_2.26.0.bb
>  create mode 100644 recipes/gnome/gnome-bluetooth_2.27.3.bb
>  create mode 100644 recipes/gnome/gnome-desktop_2.26.0.bb
>  create mode 100644 recipes/gnome/gnome-icon-theme_2.26.0.bb
>  create mode 100644 recipes/gnome/gnome-menus_2.26.0.bb
>  create mode 100644 recipes/gnome/gnome-panel_2.26.0.bb
>  create mode 100644 recipes/gnome/gnome-python-desktop_2.26.0.bb
>  create mode 100644 recipes/gnome/gvfs_1.2.1.bb
>  create mode 100644 recipes/gnome/libart-lgpl/x86_64/art_config.h
>  create mode 100644 recipes/gnome/libgweather_2.26.0.bb
>  create mode 100644 recipes/gnome/libunique_1.0.8.bb
>  create mode 100644 recipes/nautilus/nautilus/idl-sysroot.patch
>  create mode 100644 recipes/nautilus/nautilus/no-try-run-strftime.diff
>  create mode 100644 recipes/nautilus/nautilus_2.26.1.bb
> 
> diff --git a/classes/gtk-icon-cache.bbclass b/classes/gtk-icon-cache.bbclass
> index b256365..ea1fdff 100644
> --- a/classes/gtk-icon-cache.bbclass
> +++ b/classes/gtk-icon-cache.bbclass
> @@ -11,11 +11,19 @@ fi
>  # Update the pixbuf loaders in case they haven't been registered yet
>  gdk-pixbuf-query-loaders > /etc/gtk-2.0/gdk-pixbuf.loaders
>  
> -gtk-update-icon-cache -q /usr/share/icons/hicolor
> +for icondir in /usr/share/icons/* ; do
> +    if [ -d $icondir ] ; then
> +        gtk-update-icon-cache -qt  $icondir
> +    fi
> +done
>  }
>  
>  gtk_icon_cache_postrm() {
> -gtk-update-icon-cache -q /usr/share/icons/hicolor
> +for icondir in /usr/share/icons/* ; do
> +    if [ -d $icondir ] ; then
> +        gtk-update-icon-cache -qt  $icondir
> +    fi
> +done
>  }
>  
>  python populate_packages_append () {
> @@ -24,7 +32,7 @@ python populate_packages_append () {
>  	workdir = bb.data.getVar('WORKDIR', d, 1)
>  	
>  	for pkg in packages:
> -		icon_dir = '%s/install/%s/%s/icons/hicolor' % (workdir, pkg, bb.data.getVar('datadir', d, 1))
> +		icon_dir = '%s/install/%s/%s/icons' % (workdir, pkg, bb.data.getVar('datadir', d, 1))
>  		if not os.path.exists(icon_dir):
>  			continue
>  		
> diff --git a/recipes/gnome/cheese_2.26.0.bb b/recipes/gnome/cheese_2.26.0.bb
> new file mode 100644
> index 0000000..6b780bd
> --- /dev/null
> +++ b/recipes/gnome/cheese_2.26.0.bb
> @@ -0,0 +1,12 @@
> +DESCRIPTION = "Take photos and videos with your webcam, with fun graphical effects"
> +LICENSE = "GPLv2"
> +
> +PR = "r1"
> +
> +DEPENDS = "gtk+ gstreamer hal librsvg gnome-desktop eds-dbus"
> +RRECOMMENDS_${PN} = "gst-plugin-gconfelements gst-plugins-good-meta gst-plugins-base-meta"
> +
> +inherit gnome
> +
> +FILES_${PN} += "${datadir}/dbus-1"
> +
> diff --git a/recipes/gnome/gail_1.20.0.bb b/recipes/gnome/gail_1.20.0.bb
> index 58168a0..13346f3 100644
> --- a/recipes/gnome/gail_1.20.0.bb
> +++ b/recipes/gnome/gail_1.20.0.bb
> @@ -3,6 +3,7 @@ SECTION = "x11/libs"
>  PR = "r0"
>  DESCRIPTION = "GNOME Accessibility Implementation Library"
>  DEPENDS = "gtk+"
> +PROVIDES = "virtual/gail"
>  
>  inherit gnome
>  
> diff --git a/recipes/gnome/gnome-bluetooth_2.27.3.bb b/recipes/gnome/gnome-bluetooth_2.27.3.bb
> new file mode 100644
> index 0000000..9742afa
> --- /dev/null
> +++ b/recipes/gnome/gnome-bluetooth_2.27.3.bb
> @@ -0,0 +1,23 @@
> +LICENSE = "GPL"
> +SECTION = "x11/gnome"
> +
> +inherit autotools gnome pkgconfig
> +
> +GBTREV = "607"
> +SRC_URI = "svn://svn.gnome.org/svn/${PN};module=trunk;rev=${GBTREV};proto=http"
> +S = "${WORKDIR}/trunk"
> +PV = "2.27.3+svnr${GBTREV}"
> +
> +DEPENDS = "obexd obex-data-server gconf-dbus gtk+ dbus-glib libunique libnotify hal bluez4 gnome-keyring"
> +RRECOMMENDS_${PN} += "obexd obex-data-server"
> +RCONFLICTS_${PN} = "bluez-gnome"
> +
> +EXTRA_OECONF = "--enable-debug"
> +CFLAGS += " -g "
> +
> +do_configure_prepend() {
> +    sed -i -e s:docs::g ${S}/Makefile.am
> +	echo "EXTRA_DIST = version.xml" > gnome-doc-utils.make
> +	echo "EXTRA_DIST = version.xml" > gtk-doc.make
> +}
> +
> diff --git a/recipes/gnome/gnome-desktop_2.26.0.bb b/recipes/gnome/gnome-desktop_2.26.0.bb
> new file mode 100644
> index 0000000..52c0e6d
> --- /dev/null
> +++ b/recipes/gnome/gnome-desktop_2.26.0.bb
> @@ -0,0 +1,8 @@
> +require gnome-desktop.inc
> +
> +inherit gnome pkgconfig
> +
> +DEPENDS += "gnome-doc-utils gnome-vfs libxrandr"
> +
> +SRC_URI += " \
> +            file://no-desktop-docs.patch;patch=1;pnum=0"
> diff --git a/recipes/gnome/gnome-icon-theme_2.26.0.bb b/recipes/gnome/gnome-icon-theme_2.26.0.bb
> new file mode 100644
> index 0000000..7e5c7b3
> --- /dev/null
> +++ b/recipes/gnome/gnome-icon-theme_2.26.0.bb
> @@ -0,0 +1,13 @@
> +LICENSE = "GPL"
> +SECTION = "x11/gnome"
> +DEPENDS = "icon-naming-utils-native glib-2.0 intltool-native"
> +RDEPENDS = "hicolor-icon-theme"
> +RRECOMMENDS = "librsvg-gtk"
> +
> +FILES_${PN} += "${datadir}/*"
> +
> +EXTRA_OECONF = "--disable-hicolor-check"
> +
> +inherit gnome
> +
> +
> diff --git a/recipes/gnome/gnome-keyring_2.24.1.bb b/recipes/gnome/gnome-keyring_2.24.1.bb
> index 105ee16..9d2b523 100644
> --- a/recipes/gnome/gnome-keyring_2.24.1.bb
> +++ b/recipes/gnome/gnome-keyring_2.24.1.bb
> @@ -3,7 +3,9 @@ SECTION = "x11/gnome"
>  
>  inherit autotools gnome pkgconfig
>  
> -DEPENDS = "gtk+ libtasn1 libgcrypt"
> +PR = "r1"
> +
> +DEPENDS = "gtk+ libtasn1 libgcrypt gconf"
>  
>  EXTRA_OECONF = "--disable-gtk-doc"
>  
> diff --git a/recipes/gnome/gnome-menus_2.26.0.bb b/recipes/gnome/gnome-menus_2.26.0.bb
> new file mode 100644
> index 0000000..5837e7f
> --- /dev/null
> +++ b/recipes/gnome/gnome-menus_2.26.0.bb
> @@ -0,0 +1,15 @@
> +DEPENDS = "python gnome-vfs libxml2 gconf popt gtk+"
> +LICENSE = "GPL"
> +
> +inherit gnome pkgconfig
> +
> +do_stage() {
> +autotools_stage_all
> +}
> +
> +PACKAGES += "${PN}-python"
> +FILES_${PN} += "${datadir}/desktop-directories/"
> +FILES_${PN}-python = "${libdir}/python*"
> +FILES_${PN}-dbg += "${libdir}/python*/site-packages/*/.debug \
> +                    ${libdir}/python*/site-packages/.debug"
> +
> diff --git a/recipes/gnome/gnome-panel/idl-sysroot.patch b/recipes/gnome/gnome-panel/idl-sysroot.patch
> index f863d4b..07e5ded 100644
> --- a/recipes/gnome/gnome-panel/idl-sysroot.patch
> +++ b/recipes/gnome/gnome-panel/idl-sysroot.patch
> @@ -1,7 +1,7 @@
> -Index: gnome-panel-2.24.0/gnome-panel/Makefile.am
> +Index: gnome-panel-2.26.0/gnome-panel/Makefile.am
>  ===================================================================
> ---- gnome-panel-2.24.0.orig/gnome-panel/Makefile.am	2009-03-16 22:37:12.000000000 +0000
> -+++ gnome-panel-2.24.0/gnome-panel/Makefile.am	2009-04-09 14:39:02.000000000 +0000
> +--- gnome-panel-2.26.0.orig/gnome-panel/Makefile.am	2009-03-16 22:37:12.000000000 +0000
> ++++ gnome-panel-2.26.0/gnome-panel/Makefile.am	2009-04-09 14:39:02.000000000 +0000
>  @@ -43,7 +43,7 @@
>   	$(NULL)
>   
> @@ -11,10 +11,10 @@ Index: gnome-panel-2.24.0/gnome-panel/Makefile.am
>   
>   BUILT_SOURCES = \
>   	$(CORBA_SRCLIST)	\
> -Index: gnome-panel-2.24.0/libpanel-applet/Makefile.am
> +Index: gnome-panel-2.26.0/libpanel-applet/Makefile.am
>  ===================================================================
> ---- gnome-panel-2.24.0.orig/libpanel-applet/Makefile.am	2009-03-16 22:37:13.000000000 +0000
> -+++ gnome-panel-2.24.0/libpanel-applet/Makefile.am	2009-04-09 14:51:18.000000000 +0000
> +--- gnome-panel-2.26.0.orig/libpanel-applet/Makefile.am	2009-03-16 22:37:13.000000000 +0000
> ++++ gnome-panel-2.26.0/libpanel-applet/Makefile.am	2009-04-09 14:51:18.000000000 +0000
>  @@ -45,7 +45,7 @@
>   	GNOME_Panel.h
>   
> diff --git a/recipes/gnome/gnome-panel_2.26.0.bb b/recipes/gnome/gnome-panel_2.26.0.bb
> new file mode 100644
> index 0000000..c744a44
> --- /dev/null
> +++ b/recipes/gnome/gnome-panel_2.26.0.bb
> @@ -0,0 +1,27 @@
> +LICENSE = "GPL"
> +DEPENDS = "gconf librsvg libgweather startup-notification libwnck orbit2 gtk+ libbonoboui libglade libgnome libgnomeui gnome-desktop libglade gnome-menus orbit2-native"
> +
> +inherit gnome pkgconfig
> +
> +SRC_URI += "file://idl-sysroot.patch;patch=1"
> +
> +do_configure_prepend() {
> +        sed -i -e s:help:: ${S}/Makefile.am
> +}
> +
> +
> +PACKAGES =+ "libpanel-applet"
> +FILES_libpanel-applet = "${libdir}/libpanel-applet-2.so.*"
> +
> +FILES_${PN} =+ "${datadir}/gnome* \
> +                ${datadir}/icons"
> +
> +export SYSROOT = "${STAGING_DIR_HOST}"
> +EXTRA_OEMAKE = "ORBIT_IDL=${STAGING_BINDIR_NATIVE}/orbit-idl-2 SYSROOT=${SYSROOT}"
> +EXTRA_OECONF = "--disable-scrollkeeper \
> +                --disable-eds \
> +               "
> +
> +do_stage() {
> +        autotools_stage_all
> +}
> diff --git a/recipes/gnome/gnome-python-desktop_2.26.0.bb b/recipes/gnome/gnome-python-desktop_2.26.0.bb
> new file mode 100644
> index 0000000..0ddc05e
> --- /dev/null
> +++ b/recipes/gnome/gnome-python-desktop_2.26.0.bb
> @@ -0,0 +1,28 @@
> +LICENSE = "GPL/LGPL"
> +DEPENDS = "librsvg libwnck totem-pl-parser libgtop gnome-panel gnome-desktop eds-dbus python-pygtk gnome-python libgnomeprint libgnomeprintui"
> +
> +PR = "r4"
> +
> +inherit gnome distutils-base
> +
> +SRC_URI += "file://acinclude.m4"
> +
> +EXTRA_OECONF += "--with-python-includes=${STAGING_INCDIR}/../"
> +
> +do_configure_prepend() {
> +        install -m 0644 ${WORKDIR}/acinclude.m4 ${S}/
> +}
> +
> +do_configure_prepend() {
> +	sed -i -e s:'`$PKG_CONFIG --variable=defsdir pygtk-2.0`':\"${STAGING_DATADIR}/pygtk/2.0/defs\":g \
> +	       -e s:'`$PKG_CONFIG --variable=defsdir gnome-python-2.0`':\"${STAGING_DATADIR}/pygtk/2.0/defs\":g \
> +	       -e s:'`$PKG_CONFIG --variable=argtypesdir gnome-python-2.0`':\"${STAGING_DATADIR}/pygtk/2.0/argtypes\":g \	
> +	${S}/configure.ac
> +}	
> +
> +AUTOTOOLS_STAGE_PKGCONFIG = "1"
> +do_stage() {
> +	autotools_stage_all
> +}	
> +
> +FILES_${PN}-dev += "${datadir}/pygtk"
> diff --git a/recipes/gnome/gvfs_1.2.1.bb b/recipes/gnome/gvfs_1.2.1.bb
> new file mode 100644
> index 0000000..399cce6
> --- /dev/null
> +++ b/recipes/gnome/gvfs_1.2.1.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION = "gvfs is a userspace virtual filesystem"
> +LICENSE = "LGPL"
> +DEPENDS = "gnome-keyring glib-2.0 obexftp fuse avahi fuse hal gconf-dbus samba gphoto2"
> +
> +inherit gnome
> +
> +EXTRA_OECONF = "--enable-samba  --with-archive-includes=${STAGING_INCDIR}"
> +
> +PACKAGES =+ "gvfsd-ftp gvfsd-sftp gvfsd-trash"
> +
> +FILES_${PN} += "${datadir}/dbus-1/services/* ${libdir}/gio/modules/*.so"
> +FILES_${PN}-dbg += "${libdir}/gio/modules/.debug/*"
> +FILES_${PN}-dev += "${libdir}/gio/modules/*.la"
> +
> +FILES_gvfsd-ftp = "${libexecdir}/gvfsd-ftp ${sysconfdir}/gvfs/mounts/ftp.mount"
> +FILES_gvfsd-sftp = "${libexecdir}/gvfsd-sftp ${sysconfdir}/gvfs/mounts/sftp.mount"
> +FILES_gvfsd-trash = "${libexecdir}/gvfsd-trash ${sysconfdir}/gvfs/mounts/trash.mount"
> +
> +do_stage() {
> +	autotools_stage_all
> +}
> diff --git a/recipes/gnome/libart-lgpl/x86_64/art_config.h b/recipes/gnome/libart-lgpl/x86_64/art_config.h
> new file mode 100644
> index 0000000..500ffc3
> --- /dev/null
> +++ b/recipes/gnome/libart-lgpl/x86_64/art_config.h
> @@ -0,0 +1,10 @@
> +/* Automatically generated by gen_art_config.c */
> +
> +#define ART_SIZEOF_CHAR 1
> +#define ART_SIZEOF_SHORT 2
> +#define ART_SIZEOF_INT 4
> +#define ART_SIZEOF_LONG 8
> +
> +typedef unsigned char art_u8;
> +typedef unsigned short art_u16;
> +typedef unsigned int art_u32;
> diff --git a/recipes/gnome/libgnomecanvas_2.20.0.bb b/recipes/gnome/libgnomecanvas_2.20.0.bb
> index 8e13c95..16391cb 100644
> --- a/recipes/gnome/libgnomecanvas_2.20.0.bb
> +++ b/recipes/gnome/libgnomecanvas_2.20.0.bb
> @@ -1,10 +1,11 @@
>  LICENSE = "GPL"
>  SECTION = "x11/gnome/libs"
>  DESCRIPTION = "A powerful object-oriented display"
> +PR = "r2"
>  
>  inherit gnome
>  
> -DEPENDS = "libglade libart-lgpl gail"
> +DEPENDS = "libglade libart-lgpl virtual/gail"
>  
>  EXTRA_OECONF = "--disable-gtk-doc"
>  
> diff --git a/recipes/gnome/libgweather_2.26.0.bb b/recipes/gnome/libgweather_2.26.0.bb
> new file mode 100644
> index 0000000..f36dbbd
> --- /dev/null
> +++ b/recipes/gnome/libgweather_2.26.0.bb
> @@ -0,0 +1,25 @@
> +LICENSE = "LGPL"
> +DEPENDS = "libgnome libsoup-2.4 gtk+"
> +
> +inherit gnome
> +
> +do_configure_prepend() {
> +        sed -i -e s:help:: ${S}/Makefile.am
> +}
> +
> +
> +PACKAGES =+ "libpanel-applet"
> +FILES_libpanel-applet = "${libdir}/libpanel-applet-2.so.*"
> +
> +FILES_${PN} =+ "${datadir}/gnome* \
> +                ${datadir}/icons"
> +
> +do_configure_prepend() {
> +	sed -i -e 's: doc : :g' ${S}/Makefile.am
> +}
> +
> +EXTRA_OEMAKE = "ORBIT_IDL=${STAGING_BINDIR_NATIVE}/orbit-idl-2"
> +
> +do_stage() {
> +        autotools_stage_all
> +}
> diff --git a/recipes/gnome/libsoup-2.4_2.26.0.bb b/recipes/gnome/libsoup-2.4_2.26.0.bb
> index 5413d49..73824f9 100644
> --- a/recipes/gnome/libsoup-2.4_2.26.0.bb
> +++ b/recipes/gnome/libsoup-2.4_2.26.0.bb
> @@ -1,9 +1,9 @@
>  DESCRIPTION = "An HTTP library implementation in C"
>  SECTION = "x11/gnome/libs"
>  LICENSE = "GPL"
> -DEPENDS = "libproxy glib-2.0 gnutls libxml2"
> +DEPENDS = "libproxy glib-2.0 gnutls libxml2 sqlite3"
>  
> -Pr = "r1"
> +PR = "r2"
>  
>  inherit gnome
>  
> diff --git a/recipes/gnome/libunique_1.0.8.bb b/recipes/gnome/libunique_1.0.8.bb
> new file mode 100644
> index 0000000..1526930
> --- /dev/null
> +++ b/recipes/gnome/libunique_1.0.8.bb
> @@ -0,0 +1,7 @@
> +LICENSE = "LGPL"
> +SECTION = "x11/gnome"
> +
> +inherit autotools_stage gnome lib_package
> +
> +DEPENDS = "gtk+ dbus"
> +
> diff --git a/recipes/nautilus/nautilus/idl-sysroot.patch b/recipes/nautilus/nautilus/idl-sysroot.patch
> new file mode 100644
> index 0000000..0062cfb
> --- /dev/null
> +++ b/recipes/nautilus/nautilus/idl-sysroot.patch
> @@ -0,0 +1,7 @@
> +Index: nautilus-2.24.2/add-include-prefix
> +===================================================================
> +--- nautilus-2.24.2.orig/add-include-prefix	2008-10-06 17:22:21.000000000 +0000
> ++++ nautilus-2.24.2/add-include-prefix	2009-04-09 16:00:05.000000000 +0000
> +@@ -1 +1 @@
> +-sed -e 's/^/ /' -e 's/  */ /g' -e 's/ / -I /g' -e 's/ -I $//'
> ++sed -e 's:^: :' -e 's:  *: :g' -e 's: : -I '"$SYSROOT"':g' -e 's: -I '"$SYSROOT"'$::'
> diff --git a/recipes/nautilus/nautilus/no-try-run-strftime.diff b/recipes/nautilus/nautilus/no-try-run-strftime.diff
> new file mode 100644
> index 0000000..ccd2934
> --- /dev/null
> +++ b/recipes/nautilus/nautilus/no-try-run-strftime.diff
> @@ -0,0 +1,28 @@
> +--- /tmp/configure.in	2009-04-13 11:26:43.000000000 +0200
> ++++ nautilus-2.26.1/configure.in	2009-04-13 11:28:37.000000000 +0200
> +@@ -375,25 +375,6 @@
> + 
> + dnl ===========================================================================
> + 
> +-dnl strftime checks
> +-
> +-AC_TRY_RUN([#include <time.h>
> +-                int main ()
> +-                {
> +-                  char buf[100];
> +-                  struct tm tm = {0};
> +-                  tm.tm_year = 99;
> +-                  if (strftime(buf, 100, "%EY", &tm) == 4 &&
> +-		      strcmp (buf, "1999")==0)
> +-                    return 0;
> +-                  return 1;
> +-                }
> +-            ],
> +-	    AC_DEFINE(HAVE_STRFTIME_EXTENSION, 1, [Define if strftime supports %E and %O modifiers.])
> +-            )
> +-
> +-dnl ===========================================================================
> +-
> + #
> + # Checks for Xft/XRender
> + #
> diff --git a/recipes/nautilus/nautilus_2.24.2.bb b/recipes/nautilus/nautilus_2.24.2.bb
> index 30915b7..58cb015 100644
> --- a/recipes/nautilus/nautilus_2.24.2.bb
> +++ b/recipes/nautilus/nautilus_2.24.2.bb
> @@ -4,6 +4,9 @@
>  
>  inherit gnome
>  
> +SRC_URI += "file://idl-sysroot.patch;patch=1"
> +export SYSROOT = "${STAGING_DIR_HOST}"
> +
>  LICENSE="GPL"
>  
>  PR = "r1"
> diff --git a/recipes/nautilus/nautilus_2.26.1.bb b/recipes/nautilus/nautilus_2.26.1.bb
> new file mode 100644
> index 0000000..8eb5c80
> --- /dev/null
> +++ b/recipes/nautilus/nautilus_2.26.1.bb
> @@ -0,0 +1,37 @@
> +# nautilus OE build file
> +# Copyright (C) 2005, Advanced Micro Devices, Inc.  All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +inherit gnome
> +
> +SRC_URI += "file://idl-sysroot.patch;patch=1 \
> +            file://no-try-run-strftime.diff;patch=1 \
> +"
> +
> +export SYSROOT = "${STAGING_DIR_HOST}"
> +
> +LICENSE="GPL"
> +
> +DEPENDS += " gvfs tracker librsvg libexif eel esound gnome-desktop orbit2-native"
> +RDEPENDS = "gvfs gvfsd-ftp gvfsd-sftp gvfsd-trash"
> +
> +EXTRA_OECONF = " --disable-gtk-doc  --disable-update-mimedb "
> +
> +PACKAGES += " libnautilus"
> +
> +FILES_${PN} += "${datadir}/icons  /usr/libexec/ "
> +FILES_libnautilus = "/usr/lib/*.so*"
> +FILES_${PN}-dbg += "/usr/libexec/.debug"
> +
> +do_configure_prepend() {
> +	sed -i -e /docs/d Makefile.am
> +}
> +
> +# We need native orbit-idl with target idl files. No way to say it in a clean way:
> +do_configure_append () {
> +	find -name Makefile -exec sed -i '/\/usr\/bin\/orbit-idl-2/{s:/usr/bin:${STAGING_BINDIR_NATIVE}:;s:/usr/share:${STAGING_DATADIR}:g}' {} \;
> +}
> +
> +do_stage() {
> +	autotools_stage_all
> +}

Acked-by: Philip Balister <philip@balister.org>

--------------ms060008030305060907030401
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJRTCCAv0w
ggJmoAMCAQICECwlen/oUcoDd1VrNqKp/fwwDQYJKoZIhvcNAQEFBQAwYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA5MDQxNTAwNDQ1OFoXDTEwMDQxNTAwNDQ1
OFowYjERMA8GA1UEBBMIQmFsaXN0ZXIxDzANBgNVBCoTBlBoaWxpcDEYMBYGA1UEAxMPUGhpbGlw
IEJhbGlzdGVyMSIwIAYJKoZIhvcNAQkBFhNwaGlsaXBAYmFsaXN0ZXIub3JnMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEAx5Xoie8CV9dJeiaiKRdylvicHE9Aha6f9/CLlVs+Ezob7fIu
Ra4P9ugzZZ2VCtPMQU3Qsjw35mVmYaKXB1U+fZeffbyad6OJEIK1jhqBIz5jtJMc/YWXn/bRmqCl
MfTCgilUMOcsfiHAbmLVhYiNbEhOuy6vWdxSSolHqVa/IHE72qqjhoYWHd+5XVfx1c4jW+CePNMQ
EHxjCzuD+wq6Mzle72dXw+bnyIpG99hB26uNmV//h5iz1VmJU63FZWynSjG79NcY9+mTWXeX213V
V6kJ2wce2rETbYvKQ7err6NnZnG/tiwGI1M7fQqQAti+CkDciLJ129LO+APVYZQgEwIDAQABozAw
LjAeBgNVHREEFzAVgRNwaGlsaXBAYmFsaXN0ZXIub3JnMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcN
AQEFBQADgYEAIUyDAPIEniN6SUdbDiBqi2dtITdnkoUItm/tX9TRn66P0VtWug7k7xjo6piWRE7B
ZwhihotNY0ZnjlK+h0VorxfY63B5tarRB6qJ7f26ukmpltwWWLDB2hWFoKUCn6PE2NTdj+1xNinh
ZNQHy4GyygXjlVfVSn/ZnaGJ31z4PK0wggL9MIICZqADAgECAhAsJXp/6FHKA3dVazaiqf38MA0G
CSqGSIb3DQEBBQUAMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAo
UHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQTAe
Fw0wOTA0MTUwMDQ0NThaFw0xMDA0MTUwMDQ0NThaMGIxETAPBgNVBAQTCEJhbGlzdGVyMQ8wDQYD
VQQqEwZQaGlsaXAxGDAWBgNVBAMTD1BoaWxpcCBCYWxpc3RlcjEiMCAGCSqGSIb3DQEJARYTcGhp
bGlwQGJhbGlzdGVyLm9yZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMeV6InvAlfX
SXomoikXcpb4nBxPQIWun/fwi5VbPhM6G+3yLkWuD/boM2WdlQrTzEFN0LI8N+ZlZmGilwdVPn2X
n328mnejiRCCtY4agSM+Y7STHP2Fl5/20ZqgpTH0woIpVDDnLH4hwG5i1YWIjWxITrsur1ncUkqJ
R6lWvyBxO9qqo4aGFh3fuV1X8dXOI1vgnjzTEBB8Yws7g/sKujM5Xu9nV8Pm58iKRvfYQdurjZlf
/4eYs9VZiVOtxWVsp0oxu/TXGPfpk1l3l9td1VepCdsHHtqxE22LykO3q6+jZ2Zxv7YsBiNTO30K
kALYvgpA3IiyddvSzvgD1WGUIBMCAwEAAaMwMC4wHgYDVR0RBBcwFYETcGhpbGlwQGJhbGlzdGVy
Lm9yZzAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBBQUAA4GBACFMgwDyBJ4jeklHWw4gaotnbSE3
Z5KFCLZv7V/U0Z+uj9FbVroO5O8Y6OqYlkROwWcIYoaLTWNGZ45SvodFaK8X2OtwebWq0Qeqie39
urpJqZbcFliwwdoVhaClAp+jxNjU3Y/tcTYp4WTUB8uBssoF45VX1Up/2Z2hid9c+DytMIIDPzCC
AqigAwIBAgIBDTANBgkqhkiG9w0BAQUFADCB0TELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rl
cm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMRowGAYDVQQKExFUaGF3dGUgQ29uc3VsdGluZzEo
MCYGA1UECxMfQ2VydGlmaWNhdGlvbiBTZXJ2aWNlcyBEaXZpc2lvbjEkMCIGA1UEAxMbVGhhd3Rl
IFBlcnNvbmFsIEZyZWVtYWlsIENBMSswKQYJKoZIhvcNAQkBFhxwZXJzb25hbC1mcmVlbWFpbEB0
aGF3dGUuY29tMB4XDTAzMDcxNzAwMDAwMFoXDTEzMDcxNjIzNTk1OVowYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDE
pjxVc1X7TrnKmVoeaMB1BHCd3+n/ox7svc31W/Iadr1/DDph8r9RzgHU5VAKMNcCY1osiRVwjt3J
8CuFWqo/cVbLrzwLB+fxH5E2JCoTzyvV84J3PQO+K/67GD4Hv0CAAmTXp6a7n2XRxSpUhQ9IBH+n
ttE8YQRAHmQZcmC3+wIDAQABo4GUMIGRMBIGA1UdEwEB/wQIMAYBAf8CAQAwQwYDVR0fBDwwOjA4
oDagNIYyaHR0cDovL2NybC50aGF3dGUuY29tL1RoYXd0ZVBlcnNvbmFsRnJlZW1haWxDQS5jcmww
CwYDVR0PBAQDAgEGMCkGA1UdEQQiMCCkHjAcMRowGAYDVQQDExFQcml2YXRlTGFiZWwyLTEzODAN
BgkqhkiG9w0BAQUFAAOBgQBIjNFQg+oLLswNo2asZw9/r6y+whehQ5aUnX9MIbj4Nh+qLZ82L8D0
HFAgk3A8/a3hYWLD2ToZfoSxmRsAxRoLgnSeJVCUYsfbJ3FXJY3dqZw5jowgT2Vfldr394fWxghO
rvbqNOUQGls1TXfjViF4gtwhGTXeJLHTHUb/XV9lTzGCA2QwggNgAgEBMHYwYjELMAkGA1UEBhMC
WkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0
ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAhAsJXp/6FHKA3dVazaiqf38MAkGBSsOAwIa
BQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA5MDQxNjEy
MTg1MlowIwYJKoZIhvcNAQkEMRYEFCeyhcqgP0lPeA3rkJF88naHFc76MFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQLCV6f+hRygN3VWs2oqn9/DCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQLCV6f+hRygN3VWs2oqn9
/DANBgkqhkiG9w0BAQEFAASCAQAHvGVrudD3gV7D6a40IC1TeJQCi+n0Zogp+syn3OzBf2YMdb/J
/xd0OImFk+z8yvK4cjZZYMzcb+UFM1y3QgcOOibZ4O/TTMc6OiifTbfZ+e50twiOsg9T4EGCf5el
jl+YyoUkf/O4ZxA8NnSwElbTJjjJ3y5frjrKnvBS6Hu50PmFfL81LnwF8+IGsVQ4dgCPepaDnCPy
q+q/hOnWGdV91VNYt1q13DU2LBgyK5wOrx2m630Hw8JYRqLspUrvbFASCYcrxw8wjYWpJRMhko6B
AaShkBJm6ZmvEJaWZDXjBvRGm9zP7LlOBfQFGSMFxdlRLBmDqMMQbXYBPRv4403LAAAAAAAA

--------------ms060008030305060907030401--
