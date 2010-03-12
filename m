Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1NqCn6-0004xC-Mi
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Mar 2010 22:53:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 27612A5096
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Mar 2010 21:50:10 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id XYl-Gw8+58sb
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Mar 2010 21:50:05 +0000 (GMT)
Received: from xora-desktop.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 466D6A5093
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Mar 2010 21:50:05 +0000 (GMT)
Received: by xora-desktop.xora.org.uk (Postfix, from userid 500)
	id 814C627714; Fri, 12 Mar 2010 21:50:45 +0000 (GMT)
Date: Fri, 12 Mar 2010 21:50:45 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100312215045.GA2267@xora-desktop.xora.org.uk>
References: <1268429776-32114-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1268429776-32114-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gtk+-native: Override RRECOMMENDS for native recipe
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
X-List-Received-Date: Fri, 12 Mar 2010 21:53:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2010 at 01:36:16PM -0800, Khem Raj wrote:
> * Remove old style native recipes.
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Graeme Gregory <dp@xora.org.uk>

> ---
>  recipes/gtk+/gtk+-native-1.2_1.2.10.bb |   58 --------------------------=
------
>  recipes/gtk+/gtk+-native_2.12.11.bb    |   20 -----------
>  recipes/gtk+/gtk+_2.18.6.bb            |    3 +-
>  3 files changed, 2 insertions(+), 79 deletions(-)
>  delete mode 100644 recipes/gtk+/gtk+-native-1.2_1.2.10.bb
>  delete mode 100644 recipes/gtk+/gtk+-native_2.12.11.bb
>=20
> diff --git a/recipes/gtk+/gtk+-native-1.2_1.2.10.bb b/recipes/gtk+/gtk+-n=
ative-1.2_1.2.10.bb
> deleted file mode 100644
> index f5ad1a5..0000000
> --- a/recipes/gtk+/gtk+-native-1.2_1.2.10.bb
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -DESCRIPTION =3D "GTK+1.2 is a deprecated library provided for running pr=
ograms not yet converted to GTK+2.0"
> -HOMEPAGE =3D "http://www.gtk.org"
> -SECTION =3D "libs"
> -LICENSE =3D "LGPL"
> -PRIORITY =3D "optional"
> -DEPENDS =3D "glib-1.2 jpeg libpng libxext"
> -
> -PR =3D "r1"
> -
> -FILESPATH =3D+ "${FILE_DIRNAME}/gtk+-1.2-1.2.10:"
> -SRC_URI =3D "ftp://ftp.gtk.org/pub/gtk/v1.2/gtk+-${PV}.tar.gz \
> -           file://gtk+1.2-reconf-fix;patch=3D1 \
> -           file://no-xwc;patch=3D1"
> -S =3D "${WORKDIR}/gtk+-${PV}"
> -
> -inherit autotools pkgconfig flow-lossage
> -
> -do_configure_prepend() {
> -	install -d m4
> -	rm -f ltconfig libtool ltmain.sh
> -	libtoolize --force
> -}
> -
> -FILES_${PN} +=3D "${datadir}/themes"
> -FILES_${PN}-dev +=3D "${datadir}/gtk-1.2/include ${libdir}/gtk-1.2/inclu=
de"
> -
> -
> -EXTRA_OECONF =3D "--enable-debug=3Dno --disable-glibtest --disable-xim"
> -# --disable-cruft
> -
> -LIBV =3D "1.2.10"
> -
> -gtk_include =3D "fnmatch.h gtk.h gtkaccelgroup.h gtkaccellabel.h gtkadju=
stment.h gtkalignment.h gtkarg.h gtkarrow.h gtkaspectframe.h gtkbbox.h gtkb=
in.h gtkbindings.h gtkbox.h gtkbutton.h gtkcalendar.h gtkcheckbutton.h gtkc=
heckmenuitem.h gtkclist.h gtkcolorsel.h gtkcombo.h gtkcompat.h gtkcontainer=
=2Eh gtkctree.h gtkcurve.h gtkdata.h gtkdebug.h gtkdialog.h gtkdnd.h gtkdra=
wingarea.h gtkeditable.h gtkentry.h gtkenums.h gtkeventbox.h gtkfeatures.h =
gtkfilesel.h gtkfixed.h gtkfontsel.h gtkframe.h gtkgamma.h gtkgc.h gtkhandl=
ebox.h gtkhbbox.h gtkhbox.h gtkhpaned.h gtkhruler.h gtkhscale.h gtkhscrollb=
ar.h gtkhseparator.h gtkimage.h gtkinputdialog.h gtkintl.h gtkinvisible.h g=
tkitem.h gtkitemfactory.h gtklabel.h gtklayout.h gtklist.h gtklistitem.h gt=
kmain.h gtkmarshal.h gtkmenu.h gtkmenubar.h gtkmenufactory.h gtkmenuitem.h =
gtkmenushell.h gtkmisc.h gtknotebook.h gtkobject.h gtkoptionmenu.h gtkpacke=
r.h gtkpaned.h gtkpixmap.h gtkplug.h gtkpreview.h gtkprivate.h gtkprogress.=
h gtkprogressbar.h gt
>  kradiobutton.h gtkradiomenuitem.h gtkrange.h gtkrc.h gtkruler.h gtkscale=
=2Eh gtkscrollbar.h gtkscrolledwindow.h gtkselection.h gtkseparator.h gtksi=
gnal.h gtksocket.h gtkspinbutton.h gtkstatusbar.h gtkstyle.h gtktable.h gtk=
tearoffmenuitem.h gtktext.h gtkthemes.h gtktipsquery.h gtktogglebutton.h gt=
ktoolbar.h gtktooltips.h gtktree.h gtktreeitem.h gtktypebuiltins.h gtktypeu=
tils.h gtkvbbox.h gtkvbox.h gtkviewport.h gtkvpaned.h gtkvruler.h gtkvscale=
=2Eh gtkvscrollbar.h gtkvseparator.h gtkwidget.h gtkwindow.h makeenums.h st=
amp-gtkmarshal.h stamp-gtktypebuiltins.h"
> -gdk_include =3D "MwmUtil.h gdk.h gdkcursors.h gdki18n.h gdkinput.h gdkin=
putcommon.h gdkinputgxi.h gdkinputnone.h gdkinputxfree.h gdkkeysyms.h gdkpr=
ivate.h gdkrgb.h gdktypes.h gdkx.h gxid_lib.h gxid_proto.h"
> -
> -do_stage () {
> -	oe_libinstall -so -C gtk libgtk-1.2 ${STAGING_LIBDIR}
> -	oe_libinstall -so -C gdk libgdk-1.2 ${STAGING_LIBDIR}
> -
> -	mkdir -p ${STAGING_INCDIR}/gtk-1.2/gtk
> -	for i in ${gtk_include}; do
> -		install -m 0644 gtk/$i ${STAGING_INCDIR}/gtk-1.2/gtk/$i
> -	done
> -
> -	mkdir -p ${STAGING_INCDIR}/gtk-1.2/gdk
> -	for i in ${gdk_include}; do
> -		install -m 0644 gdk/$i ${STAGING_INCDIR}/gtk-1.2/gdk/$i
> -	done
> -
> -	mkdir -p ${STAGING_LIBDIR}/gtk-1.2/include
> -
> -	install -m 0644 gtk.m4 ${STAGING_DATADIR}/aclocal/
> -}
> -
> -do_install_append () {
> -	install -d ${D}${sysconfdir}/gtk-1.2
> -}
> -
> diff --git a/recipes/gtk+/gtk+-native_2.12.11.bb b/recipes/gtk+/gtk+-nati=
ve_2.12.11.bb
> deleted file mode 100644
> index a53dcde..0000000
> --- a/recipes/gtk+/gtk+-native_2.12.11.bb
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -
> -require gtk+_2.12.11.bb
> -
> -inherit native
> -
> -DEPENDS +=3D "atk-native pango-native cairo-native libx11-native libxext=
-native libxrender-native"
> -PROVIDES =3D "gtk+-native"
> -
> -EXTRA_OECONF +=3D "--without-libtiff --disable-modules --disable-cups"
> -
> -PR =3D "r3"
> -
> -do_install_append() {
> -
> -    # this tool is required by gnome-keyring 2.26.0 to get built
> -    # it is written in Python and use only Python xml
> -    install -d ${STAGING_BINDIR_NATIVE}
> -    install -m 0755 ${S}/gtk/gtk-builder-convert ${STAGING_BINDIR_NATIVE}
> -}
> -
> diff --git a/recipes/gtk+/gtk+_2.18.6.bb b/recipes/gtk+/gtk+_2.18.6.bb
> index 1c2ca79..69f8ff5 100644
> --- a/recipes/gtk+/gtk+_2.18.6.bb
> +++ b/recipes/gtk+/gtk+_2.18.6.bb
> @@ -3,11 +3,12 @@ require gtk+.inc
>  SRC_URI_append_virtclass-native =3D " file://no-demos.patch;patch=3D1 \
>  "
> =20
> -PR =3D "${INC_PR}.3"
> +PR =3D "${INC_PR}.4"
> =20
>  BBCLASSEXTEND =3D "native"
> =20
>  DEPENDS_virtclass-native =3D "libpng-native atk-native pango-native cair=
o-native libxrender-native libxext-native"
> +RRECOMMENDS_${PN}_virtclass-native =3D ""
>  PROVIDES_virtclass-native =3D "gdk-pixbuf-csource-native"
> =20
>  # Enable xkb selectively
> --=20
> 1.7.0
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


