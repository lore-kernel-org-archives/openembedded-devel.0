Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <christian.rueb@gmx.net>) id 1NVhbZ-0001kT-66
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 09:32:32 +0100
Received: (qmail invoked by alias); 15 Jan 2010 08:30:16 -0000
Received: from p4FD61FB1.dip0.t-ipconnect.de (EHLO krusty.localnet)
	[79.214.31.177]
	by mail.gmx.net (mp011) with SMTP; 15 Jan 2010 09:30:16 +0100
X-Authenticated: #19296456
X-Provags-ID: V01U2FsdGVkX1/79BZMV8b7GP2c9LFd/onEP2iJZsWvpbb6JxhfGw
	OtfMjsGwK53F05
From: Christian =?utf-8?q?R=C3=BCb?= <christian.rueb@gmx.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jan 2010 09:30:06 +0100
User-Agent: KMail/1.11.4 (Linux/2.6.28-11-generic; KDE/4.2.4; i686; ; )
References: <1263504944-19914-1-git-send-email-christian.rueb@gmx.net>
	<hip8k3$2mq$1@ger.gmane.org>
In-Reply-To: <hip8k3$2mq$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <201001150930.06815.christian.rueb@gmx.net>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.40000000000000002
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: christian.rueb@gmx.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] wpa-gui: add version 0.6.9 (Qt4 based)
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
X-List-Received-Date: Fri, 15 Jan 2010 08:32:32 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Friday, 15. January 2010 09:22:28 Koen Kooi wrote:
> On 14-01-10 22:35, Christian R=C3=BCb wrote:
> > This is version 0.6.9 of wpa-gui (Qt4), not the old one. If you think t=
he package should be named qpa-gui-qt4, please tell me.
> > The stylesheet is made for SHR only as the application does not fit the=
 screen otherwise (font way to big).
>=20
> Why is the icons.patch shr specific? It seems to fix a generic problem.
>=20
> regards,
>=20
> Koen

You are right - I will send a new patch tonight. Is it OK otherwise?

>=20
> >
> > Cheers,
> >  Christian
> >
> >
> > diff --git a/recipes/wpa-supplicant/wpa-gui-0.6.9/desktop.patch b/recip=
es/wpa-supplicant/wpa-gui-0.6.9/desktop.patch
> > new file mode 100644
> > index 0000000..d83ecd9
> > --- /dev/null
> > +++ b/recipes/wpa-supplicant/wpa-gui-0.6.9/desktop.patch
> > @@ -0,0 +1,11 @@
> > +--- wpa_gui-qt4/wpa_gui.desktop	2009-03-23 15:06:28.000000000 +0100
> > ++++ wpa_gui-qt4/wpa_gui.desktop	2009-11-14 18:46:09.000000000 +0100
> > +@@ -2,7 +2,7 @@
> > + Version=3D1.0
> > + Name=3Dwpa_gui
> > + Comment=3DGraphical user interface for wpa_supplicant
> > +-Exec=3Dwpa_gui
> > ++Exec=3Dwpa_gui -stylesheet /usr/share/wpa_gui/style
> > + Icon=3Dwpa_gui
> > + GenericName=3Dwpa_supplicant user interface
> > + Terminal=3Dfalse
> > diff --git a/recipes/wpa-supplicant/wpa-gui-0.6.9/icons.patch b/recipes=
/wpa-supplicant/wpa-gui-0.6.9/icons.patch
> > new file mode 100644
> > index 0000000..244ec63
> > --- /dev/null
> > +++ b/recipes/wpa-supplicant/wpa-gui-0.6.9/icons.patch
> > @@ -0,0 +1,19 @@
> > +diff -rup wpa_supplicant-0.6.9_orig/wpa_supplicant/wpa_gui-qt4/icons/M=
akefile wpa_supplicant-0.6.9/wpa_supplicant/wpa_gui-qt4/icons/Makefile
> > +--- wpa_gui-qt4/icons/Makefile	2009-03-23 15:06:28.000000000 +0100
> > ++++ wpa_gui-qt4/icons/Makefile	2010-01-13 18:36:33.000000000 +0100
> > +@@ -10,10 +10,11 @@ all: $(ICONS)
> > +
> > + %.png:
> > + 	mkdir -p hicolor/$(@:.png=3D)/apps/
> > +-	inkscape $(SVG) --without-gui \
> > +-		--export-width=3D$(word 1,$(subst x, ,$(@:.png=3D)))  \
> > +-	        --export-height=3D$(word 2,$(subst x, ,$(@:.png=3D))) \
> > +-		--export-png=3Dhicolor/$(@:.png=3D)/apps/$(NAME).png
> > ++	rsvg-convert $(SVG) \
> > ++		--width=3D$(word 1,$(subst x, ,$(@:.png=3D)))  \
> > ++	        --height=3D$(word 2,$(subst x, ,$(@:.png=3D))) \
> > ++		--format=3Dpng \
> > ++		--output=3Dhicolor/$(@:.png=3D)/apps/$(NAME).png
> > +
> > + $(NAME).xpm:
> > + 	mkdir -p pixmaps/
> > diff --git a/recipes/wpa-supplicant/wpa-gui-0.6.9/session_manager.patch=
 b/recipes/wpa-supplicant/wpa-gui-0.6.9/session_manager.patch
> > new file mode 100644
> > index 0000000..23ea28c
> > --- /dev/null
> > +++ b/recipes/wpa-supplicant/wpa-gui-0.6.9/session_manager.patch
> > @@ -0,0 +1,72 @@
> > +diff -rup wpa_supplicant-0.6.9_orig/wpa_supplicant/wpa_gui-qt4/main.cp=
p wpa_supplicant-0.6.9/wpa_supplicant/wpa_gui-qt4/main.cpp
> > +--- wpa_gui-qt4/main.cpp	2009-03-23 15:06:28.000000000 +0100
> > ++++ wpa_gui-qt4/main.cpp	2009-11-14 17:55:47.000000000 +0100
> > +@@ -24,7 +24,9 @@ class WpaGuiApp : public QApplication
> > + public:
> > + 	WpaGuiApp(int &argc, char **argv);
> > +
> > ++#ifndef QT_NO_SESSIONMANAGER
> > + 	virtual void saveState(QSessionManager &manager);
> > ++#endif
> > +
> > + 	WpaGui *w;
> > + };
> > +@@ -33,11 +35,13 @@ WpaGuiApp::WpaGuiApp(int &argc, char **a
> > + {
> > + }
> > +
> > ++#ifndef QT_NO_SESSIONMANAGER
> > + void WpaGuiApp::saveState(QSessionManager &manager)
> > + {
> > + 	QApplication::saveState(manager);
> > + 	w->saveState();
> > + }
> > ++#endif
> > +
> > +
> > + int main(int argc, char *argv[])
> > +diff -rup wpa_supplicant-0.6.9_orig/wpa_supplicant/wpa_gui-qt4/wpagui.=
cpp wpa_supplicant-0.6.9/wpa_supplicant/wpa_gui-qt4/wpagui.cpp
> > +--- wpa_gui-qt4/wpagui.cpp	2009-03-23 15:06:28.000000000 +0100
> > ++++ wpa_gui-qt4/wpagui.cpp	2009-11-14 17:55:47.000000000 +0100
> > +@@ -145,6 +145,7 @@ WpaGui::WpaGui(QApplication *_app, QWidg
> > +
> > + 	parse_argv();
> > +
> > ++#ifndef QT_NO_SESSIONMANAGER
> > + 	if (app->isSessionRestored()) {
> > + 		QSettings settings("wpa_supplicant", "wpa_gui");
> > + 		settings.beginGroup("state");
> > +@@ -153,6 +154,7 @@ WpaGui::WpaGui(QApplication *_app, QWidg
> > + 			startInTray =3D settings.value("in_tray").toBool();
> > + 		settings.endGroup();
> > + 	}
> > ++#endif
> > +
> > + 	if (QSystemTrayIcon::isSystemTrayAvailable())
> > + 		createTrayIcon(startInTray);
> > +@@ -1689,6 +1691,7 @@ void WpaGui::addInterface()
> > + }
> > +
> > +
> > ++#ifndef QT_NO_SESSIONMANAGER
> > + void WpaGui::saveState()
> > + {
> > + 	QSettings settings("wpa_supplicant", "wpa_gui");
> > +@@ -1697,3 +1700,4 @@ void WpaGui::saveState()
> > + 	settings.setValue("in_tray", inTray);
> > + 	settings.endGroup();
> > + }
> > ++#endif
> > +diff -rup wpa_supplicant-0.6.9_orig/wpa_supplicant/wpa_gui-qt4/wpagui.=
h wpa_supplicant-0.6.9/wpa_supplicant/wpa_gui-qt4/wpagui.h
> > +--- wpa_gui-qt4/wpagui.h	2009-03-23 15:06:28.000000000 +0100
> > ++++ wpa_gui-qt4/wpagui.h	2009-11-14 17:55:47.000000000 +0100
> > +@@ -40,7 +40,9 @@ public:
> > + 	virtual void disableNetwork(const QString &sel);
> > + 	virtual int getNetworkDisabled(const QString &sel);
> > + 	void setBssFromScan(const QString &bssid);
> > ++#ifndef QT_NO_SESSIONMANAGER
> > + 	void saveState();
> > ++#endif
> > +
> > + public slots:
> > + 	virtual void parse_argv();
> > diff --git a/recipes/wpa-supplicant/wpa-gui-0.6.9/style b/recipes/wpa-s=
upplicant/wpa-gui-0.6.9/style
> > new file mode 100644
> > index 0000000..ffd1749
> > --- /dev/null
> > +++ b/recipes/wpa-supplicant/wpa-gui-0.6.9/style
> > @@ -0,0 +1,4 @@
> > +* {font-size: 16px;}
> > +QPushButton {
> > +	font-size: 20px;
> > +}
> > diff --git a/recipes/wpa-supplicant/wpa-gui_0.6.9.bb b/recipes/wpa-supp=
licant/wpa-gui_0.6.9.bb
> > new file mode 100644
> > index 0000000..31f0804
> > --- /dev/null
> > +++ b/recipes/wpa-supplicant/wpa-gui_0.6.9.bb
> > @@ -0,0 +1,48 @@
> > +DESCRIPTION =3D "Qt interface for choosing which configured network to=
 connect \
> > +to. It also provides a method for browsing 802.11 SSID scan results, a=
n event \
> > +history log of messages generated by wpa_supplicant, and a method to a=
dd or \
> > +edit wpa_supplicant networks."
> > +SECTION =3D "network"
> > +LICENSE =3D "GPL BSD"
> > +HOMEPAGE =3D "http://hostap.epitest.fi/wpa_supplicant/"
> > +DEPENDS =3D "librsvg-native imagemagick-native"
> > +RDEPENDS =3D "wpa-supplicant"
> > +RRECOMMENDS =3D "${LIBC}-gconv-utf-16"
> > +PR =3D "r1"
> > +
> > +SRC_URI =3D "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.ta=
r.gz\
> > +         file://session_manager.patch;patch=3D1 "
> > +
> > +SRC_URI_append_shr =3D "file://desktop.patch;patch=3D1 \
> > +		      file://icons.patch;patch=3D1 \
> > +	              file://style"
> > +
> > +S =3D "${WORKDIR}/wpa_supplicant-${PV}/wpa_supplicant/wpa_gui-qt4"
> > +
> > +inherit qt4x11
> > +ARM_INSTRUCTION_SET =3D "arm"
> > +
> > +do_compile_append() {
> > +       oe_runmake -C ${S}/icons
> > +}
> > +
> > +do_install () {
> > +       install -d ${D}${bindir}
> > +       install -d ${D}${datadir}/wpa_gui
> > +       install -d ${D}${datadir}/applications
> > +       install -d ${D}${datadir}/pixmaps
> > +       install -m 644 icons/hicolor/128x128/apps/wpa_gui.png ${D}${dat=
adir}/pixmaps
> > +       install -m 755 wpa_gui ${D}/${bindir}
> > +       install -m 644 wpa_gui.desktop ${D}/${datadir}/applications
> > +}
> > +
> > +do_install_append_shr() {
> > +       install -m 644 ${WORKDIR}/style ${D}/${datadir}/wpa_gui
> > +}
> > +
> > +FILES_${PN} =3D "/usr/share/pixmaps/wpa_gui.png \
> > +               /usr/share/wpa_gui/style \
> > +               /usr/bin/wpa_gui \
> > +               /usr/share/applications/wpa_gui.desktop"
> > +
> > +FILES_${PN}_append_shr =3D " /usr/share/wpa_gui/style"


