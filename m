Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1OynCY-0005kW-Et
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 16:55:13 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id o8NEt4hs017968
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 23 Sep 2010 09:55:04 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id o8NEt4ep005762;
	Thu, 23 Sep 2010 09:55:04 -0500 (CDT)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o8NEt4U2019619;
	Thu, 23 Sep 2010 09:55:04 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Thu, 23 Sep 2010 09:55:03 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Chase Maupin <chasemaupin03@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 23 Sep 2010 09:55:01 -0500
Thread-Topic: [PATCHv2 3/3] matrix-gui: updating to use latest source revision
Thread-Index: ActbLv9QkzQqw2i+QG2jBmkSaXpgWwAAEbfA
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310E15352@dlee06.ent.ti.com>
References: <1285252829-31313-1-git-send-email-chase.maupin@ti.com>
In-Reply-To: <1285252829-31313-1-git-send-email-chase.maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 198.47.26.153
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: "Lance, Jeff" <j-lance1@ti.com>
Subject: Re: [PATCHv2 3/3] matrix-gui: updating to use latest source revision
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
X-List-Received-Date: Thu, 23 Sep 2010 14:55:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I had an uncommitted change to fix a typo for this patch.  This version add=
resses that typo.

> -----Original Message-----
> From: Chase Maupin [mailto:chasemaupin03@gmail.com]
> Sent: Thursday, September 23, 2010 9:40 AM
> To: openembedded-devel@lists.openembedded.org
> Cc: Lance, Jeff; Maupin, Chase
> Subject: [PATCHv2 3/3] matrix-gui: updating to use latest source revision
>=20
> From: Jeff Lance <j-lance1@ti.com>
>=20
> * Use latest source revision 131
> * Add platform support for multiple platforms
> * Remove un-used files from SRC_URI and repository.
>     * init files are now part of the matrix repository
>     * matrix-gui.desktop is now part of the matrix repository
>     * the cursor override patch is now in the matrix sources
>=20
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> Signed-off-by: Jeff Lance <j-lance1@ti.com>
> ---
>  .../0001-Disable-cursor-override-for-X11.patch     |   27 --------------=
-
> ---
>  recipes/ti/matrix-gui/dm365-evm/init               |   26 --------------=
-
> --
>  recipes/ti/matrix-gui/init                         |   24 --------------=
-
> -
>  recipes/ti/matrix-gui/matrix-gui.desktop           |    7 ----
>  recipes/ti/matrix-gui_svn.bb                       |   30 ++++++++++++--=
-
> ----
>  5 files changed, 19 insertions(+), 95 deletions(-)
>  delete mode 100644 recipes/ti/matrix-gui/0001-Disable-cursor-override-
> for-X11.patch
>  delete mode 100644 recipes/ti/matrix-gui/dm365-evm/init
>  delete mode 100644 recipes/ti/matrix-gui/init
>  delete mode 100644 recipes/ti/matrix-gui/matrix-gui.desktop
>=20
> diff --git a/recipes/ti/matrix-gui/0001-Disable-cursor-override-for-
> X11.patch b/recipes/ti/matrix-gui/0001-Disable-cursor-override-for-
> X11.patch
> deleted file mode 100644
> index 61eba44..0000000
> --- a/recipes/ti/matrix-gui/0001-Disable-cursor-override-for-X11.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From b0e91f703ffdcc73f854a672ec16ebbf21293c9c Mon Sep 17 00:00:00 2001
> -From: Chase Maupin <chase.maupin@ti.com>
> -Date: Mon, 24 May 2010 12:51:49 -0500
> -Subject: [PATCH] Disable cursor override for X11
> -
> -* Disable the cursor override option for using the matrix_gui
> -  program with X11.
> ----
> - main.cpp |    2 +-
> - 1 files changed, 1 insertions(+), 1 deletions(-)
> -
> -diff --git a/main.cpp b/main.cpp
> -index 978e327..1f55e94 100644
> ---- a/main.cpp
> -+++ b/main.cpp
> -@@ -43,7 +43,7 @@ int main(int argc, char * argv[])
> - {
> -     QApplication matrix(argc, argv);
> -     QApplication::setStyle(new CustomStyle);
> --    QApplication::setOverrideCursor(QCursor(Qt::BlankCursor));
> -+//    QApplication::setOverrideCursor(QCursor(Qt::BlankCursor));
> -
> -     // Create a new window to display a web page.
> -     MainWindow * pWindow =3D new MainWindow(0, QString(argv[1]), true);
> ---
> -1.6.0.4
> -
> diff --git a/recipes/ti/matrix-gui/dm365-evm/init b/recipes/ti/matrix-
> gui/dm365-evm/init
> deleted file mode 100644
> index 3aadc1e..0000000
> --- a/recipes/ti/matrix-gui/dm365-evm/init
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -#! /bin/sh
> -matrixgui=3D"/usr/bin/matrix_gui"
> -GUI_OPTS=3D"-geometry 720x480+0+10 -display transformed:Rot0
> /usr/share/matrix/html/menu_main.html"
> -
> -test -x "$matrixgui" || exit 0
> -
> -case "$1" in
> -  start)
> -    # switch to component 480p mode
> -    echo 480P-60 > /sys/class/davinci_display/ch0/mode
> -    echo COMPONENT > /sys/class/davinci_display/ch0/output
> -    echo -n "Starting Matrix GUI application"
> -    start-stop-daemon --start --quiet --background --pidfile
> /var/run/matrix-gui.pid --exec $matrixgui -- $GUI_OPTS
> -    echo "."
> -    ;;
> -  stop)
> -    echo -n "Stopping Matrix GUI application"
> -    start-stop-daemon --stop --quiet --pidfile /var/run/matrix-gui.pid
> -    echo "."
> -    ;;
> -  *)
> -    echo "Usage: /etc/init.d/matrix-gui {start|stop}"
> -    exit 1
> -esac
> -
> -exit 0
> diff --git a/recipes/ti/matrix-gui/init b/recipes/ti/matrix-gui/init
> deleted file mode 100644
> index 40b6512..0000000
> --- a/recipes/ti/matrix-gui/init
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -#! /bin/sh
> -
> -matrixgui=3D"/usr/bin/matrix_gui"
> -GUI_OPTS=3D"/usr/share/matrix/html/menu_main.html"
> -
> -test -x "$matrixgui" || exit 0
> -
> -case "$1" in
> -  start)
> -    echo -n "Starting Matrix GUI application"
> -    start-stop-daemon --start --quiet --background --pidfile
> /var/run/matrix-gui.pid --exec $matrixgui -- $GUI_OPTS
> -    echo "."
> -    ;;
> -  stop)
> -    echo -n "Stopping Matrix GUI application"
> -    start-stop-daemon --stop --quiet --pidfile /var/run/matrix-gui.pid
> -    echo "."
> -    ;;
> -  *)
> -    echo "Usage: /etc/init.d/matrix-gui {start|stop}"
> -    exit 1
> -esac
> -
> -exit 0
> diff --git a/recipes/ti/matrix-gui/matrix-gui.desktop b/recipes/ti/matrix=
-
> gui/matrix-gui.desktop
> deleted file mode 100644
> index 52b5831..0000000
> --- a/recipes/ti/matrix-gui/matrix-gui.desktop
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -[Desktop Entry]
> -Name=3DMatrix GUI
> -Comment=3DStart the Matrix GUI application
> -Exec=3D/usr/bin/matrix_gui /usr/share/matrix/html/menu_main.html
> -Terminal=3Dfalse
> -Type=3DApplication
> -X-GNOME-Autostart-enabled=3Dtrue
> diff --git a/recipes/ti/matrix-gui_svn.bb b/recipes/ti/matrix-gui_svn.bb
> index 4bfe7c2..843e1c5 100644
> --- a/recipes/ti/matrix-gui_svn.bb
> +++ b/recipes/ti/matrix-gui_svn.bb
> @@ -4,27 +4,35 @@ LICENSE =3D "BSD"
>  SECTION =3D "multimedia"
>  PRIORITY =3D "optional"
>=20
> -SRCREV =3D "58"
> -PV =3D "1.0"
> -PR =3D "r14+svnr${SRCPV}"
> +SRCREV =3D "131"
> +PV =3D "1.1"
> +PR =3D "r15+svnr${SRCPV}"
>=20
> -SRC_URI =3D
> "svn://gforge.ti.com/svn/matrix_gui/;module=3Dtrunk;proto=3Dhttps;user=3D=
anonymo
> us;pswd=3D'' \
> -    file://0001-Disable-cursor-override-for-X11.patch \
> -	file://init \
> -    file://matrix-gui.desktop \
> -"
> +PLATFORM_dm365 =3D "dm365"
> +PLATFORM_da850-omapl138-evm =3D "omapl138"
> +PLATFORM_omap3evm =3D "omap3530"
> +PLATFORM_dm37x-evm =3D "dm3730"
> +PLATFORM_am37x-evm =3D "am3715"
> +PLATFORM_beagleboard =3D "am3715"
> +PLATFORM ?=3D "<UNDEFINED>"
> +
> +SRC_URI =3D
> "svn://gforge.ti.com/svn/matrix_gui/;module=3Dtrunk;proto=3Dhttps;user=3D=
anonymo
> us;pswd=3D'' "
>=20
>  S =3D "${WORKDIR}/trunk"
>=20
> +CXXFLAGS_da850-omapl138-evm_append =3D " -DPlatform_omapl138 "
> +CXXFLAGS_dm365_append =3D " -DPlatform_dm365 "
> +PACKAGE_ARCH =3D ${MACHINE_ARCH}
> +
>  inherit qt4x11
>=20
>  do_install() {
>  	install -d ${D}/${bindir}
>  	install -m 0755 ${S}/matrix_gui ${D}/${bindir}
>  	install -d ${D}${sysconfdir}/init.d/
> -	install -c -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/matrix-
> gui
> -    install -d ${D}/${sysconfdir}/xdg/autostart
> -    install -m 0755 ${WORKDIR}/matrix-gui.desktop
> ${D}/${sysconfdir}/xdg/autostart
> +	install -c -m 0755 ${S}/${PLATFORM}/etc/x11/init
> ${D}${sysconfdir}/init.d/matrix-gui
> +	install -d ${D}/${sysconfdir}/xdg/autostart
> +	install -m 0755 ${S}/${PLATFORM}/etc/x11/matrix-gui.desktop
> ${D}/${sysconfdir}/xdg/autostart
>  }
>=20
>  FILES_${PN}-autostart =3D "${sysconfdir}/xdg/autostart/matrix-gui.deskto=
p"
> --
> 1.7.0.4



