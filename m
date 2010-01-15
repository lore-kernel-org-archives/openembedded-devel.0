Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NVhWM-0004vo-Bu for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 09:27:09 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NVhTg-00080b-P8
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 09:24:20 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2010 09:24:20 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2010 09:24:20 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 15 Jan 2010 09:22:28 +0100
Message-ID: <hip8k3$2mq$1@ger.gmane.org>
References: <1263504944-19914-1-git-send-email-christian.rueb@gmx.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100112 Shredder/3.0.2pre
In-Reply-To: <1263504944-19914-1-git-send-email-christian.rueb@gmx.net>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
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
X-List-Received-Date: Fri, 15 Jan 2010 08:27:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 14-01-10 22:35, Christian Rüb wrote:
> This is version 0.6.9 of wpa-gui (Qt4), not the old one. If you think the package should be named qpa-gui-qt4, please tell me.
> The stylesheet is made for SHR only as the application does not fit the screen otherwise (font way to big).

Why is the icons.patch shr specific? It seems to fix a generic problem.

regards,

Koen

> 
> Cheers,
>  Christian
> 
> 
> diff --git a/recipes/wpa-supplicant/wpa-gui-0.6.9/desktop.patch b/recipes/wpa-supplicant/wpa-gui-0.6.9/desktop.patch
> new file mode 100644
> index 0000000..d83ecd9
> --- /dev/null
> +++ b/recipes/wpa-supplicant/wpa-gui-0.6.9/desktop.patch
> @@ -0,0 +1,11 @@
> +--- wpa_gui-qt4/wpa_gui.desktop	2009-03-23 15:06:28.000000000 +0100
> ++++ wpa_gui-qt4/wpa_gui.desktop	2009-11-14 18:46:09.000000000 +0100
> +@@ -2,7 +2,7 @@
> + Version=1.0
> + Name=wpa_gui
> + Comment=Graphical user interface for wpa_supplicant
> +-Exec=wpa_gui
> ++Exec=wpa_gui -stylesheet /usr/share/wpa_gui/style
> + Icon=wpa_gui
> + GenericName=wpa_supplicant user interface
> + Terminal=false
> diff --git a/recipes/wpa-supplicant/wpa-gui-0.6.9/icons.patch b/recipes/wpa-supplicant/wpa-gui-0.6.9/icons.patch
> new file mode 100644
> index 0000000..244ec63
> --- /dev/null
> +++ b/recipes/wpa-supplicant/wpa-gui-0.6.9/icons.patch
> @@ -0,0 +1,19 @@
> +diff -rup wpa_supplicant-0.6.9_orig/wpa_supplicant/wpa_gui-qt4/icons/Makefile wpa_supplicant-0.6.9/wpa_supplicant/wpa_gui-qt4/icons/Makefile
> +--- wpa_gui-qt4/icons/Makefile	2009-03-23 15:06:28.000000000 +0100
> ++++ wpa_gui-qt4/icons/Makefile	2010-01-13 18:36:33.000000000 +0100
> +@@ -10,10 +10,11 @@ all: $(ICONS)
> + 
> + %.png:
> + 	mkdir -p hicolor/$(@:.png=)/apps/
> +-	inkscape $(SVG) --without-gui \
> +-		--export-width=$(word 1,$(subst x, ,$(@:.png=)))  \
> +-	        --export-height=$(word 2,$(subst x, ,$(@:.png=))) \
> +-		--export-png=hicolor/$(@:.png=)/apps/$(NAME).png
> ++	rsvg-convert $(SVG) \
> ++		--width=$(word 1,$(subst x, ,$(@:.png=)))  \
> ++	        --height=$(word 2,$(subst x, ,$(@:.png=))) \
> ++		--format=png \
> ++		--output=hicolor/$(@:.png=)/apps/$(NAME).png
> + 
> + $(NAME).xpm:
> + 	mkdir -p pixmaps/
> diff --git a/recipes/wpa-supplicant/wpa-gui-0.6.9/session_manager.patch b/recipes/wpa-supplicant/wpa-gui-0.6.9/session_manager.patch
> new file mode 100644
> index 0000000..23ea28c
> --- /dev/null
> +++ b/recipes/wpa-supplicant/wpa-gui-0.6.9/session_manager.patch
> @@ -0,0 +1,72 @@
> +diff -rup wpa_supplicant-0.6.9_orig/wpa_supplicant/wpa_gui-qt4/main.cpp wpa_supplicant-0.6.9/wpa_supplicant/wpa_gui-qt4/main.cpp
> +--- wpa_gui-qt4/main.cpp	2009-03-23 15:06:28.000000000 +0100
> ++++ wpa_gui-qt4/main.cpp	2009-11-14 17:55:47.000000000 +0100
> +@@ -24,7 +24,9 @@ class WpaGuiApp : public QApplication
> + public:
> + 	WpaGuiApp(int &argc, char **argv);
> + 
> ++#ifndef QT_NO_SESSIONMANAGER
> + 	virtual void saveState(QSessionManager &manager);
> ++#endif
> + 
> + 	WpaGui *w;
> + };
> +@@ -33,11 +35,13 @@ WpaGuiApp::WpaGuiApp(int &argc, char **a
> + {
> + }
> + 
> ++#ifndef QT_NO_SESSIONMANAGER
> + void WpaGuiApp::saveState(QSessionManager &manager)
> + {
> + 	QApplication::saveState(manager);
> + 	w->saveState();
> + }
> ++#endif
> + 
> + 
> + int main(int argc, char *argv[])
> +diff -rup wpa_supplicant-0.6.9_orig/wpa_supplicant/wpa_gui-qt4/wpagui.cpp wpa_supplicant-0.6.9/wpa_supplicant/wpa_gui-qt4/wpagui.cpp
> +--- wpa_gui-qt4/wpagui.cpp	2009-03-23 15:06:28.000000000 +0100
> ++++ wpa_gui-qt4/wpagui.cpp	2009-11-14 17:55:47.000000000 +0100
> +@@ -145,6 +145,7 @@ WpaGui::WpaGui(QApplication *_app, QWidg
> + 
> + 	parse_argv();
> + 
> ++#ifndef QT_NO_SESSIONMANAGER
> + 	if (app->isSessionRestored()) {
> + 		QSettings settings("wpa_supplicant", "wpa_gui");
> + 		settings.beginGroup("state");
> +@@ -153,6 +154,7 @@ WpaGui::WpaGui(QApplication *_app, QWidg
> + 			startInTray = settings.value("in_tray").toBool();
> + 		settings.endGroup();
> + 	}
> ++#endif
> + 
> + 	if (QSystemTrayIcon::isSystemTrayAvailable())
> + 		createTrayIcon(startInTray);
> +@@ -1689,6 +1691,7 @@ void WpaGui::addInterface()
> + }
> + 
> + 
> ++#ifndef QT_NO_SESSIONMANAGER
> + void WpaGui::saveState()
> + {
> + 	QSettings settings("wpa_supplicant", "wpa_gui");
> +@@ -1697,3 +1700,4 @@ void WpaGui::saveState()
> + 	settings.setValue("in_tray", inTray);
> + 	settings.endGroup();
> + }
> ++#endif
> +diff -rup wpa_supplicant-0.6.9_orig/wpa_supplicant/wpa_gui-qt4/wpagui.h wpa_supplicant-0.6.9/wpa_supplicant/wpa_gui-qt4/wpagui.h
> +--- wpa_gui-qt4/wpagui.h	2009-03-23 15:06:28.000000000 +0100
> ++++ wpa_gui-qt4/wpagui.h	2009-11-14 17:55:47.000000000 +0100
> +@@ -40,7 +40,9 @@ public:
> + 	virtual void disableNetwork(const QString &sel);
> + 	virtual int getNetworkDisabled(const QString &sel);
> + 	void setBssFromScan(const QString &bssid);
> ++#ifndef QT_NO_SESSIONMANAGER
> + 	void saveState();
> ++#endif
> + 
> + public slots:
> + 	virtual void parse_argv();
> diff --git a/recipes/wpa-supplicant/wpa-gui-0.6.9/style b/recipes/wpa-supplicant/wpa-gui-0.6.9/style
> new file mode 100644
> index 0000000..ffd1749
> --- /dev/null
> +++ b/recipes/wpa-supplicant/wpa-gui-0.6.9/style
> @@ -0,0 +1,4 @@
> +* {font-size: 16px;}
> +QPushButton {
> +	font-size: 20px;
> +}
> diff --git a/recipes/wpa-supplicant/wpa-gui_0.6.9.bb b/recipes/wpa-supplicant/wpa-gui_0.6.9.bb
> new file mode 100644
> index 0000000..31f0804
> --- /dev/null
> +++ b/recipes/wpa-supplicant/wpa-gui_0.6.9.bb
> @@ -0,0 +1,48 @@
> +DESCRIPTION = "Qt interface for choosing which configured network to connect \
> +to. It also provides a method for browsing 802.11 SSID scan results, an event \
> +history log of messages generated by wpa_supplicant, and a method to add or \
> +edit wpa_supplicant networks."
> +SECTION = "network"
> +LICENSE = "GPL BSD"
> +HOMEPAGE = "http://hostap.epitest.fi/wpa_supplicant/"
> +DEPENDS = "librsvg-native imagemagick-native"
> +RDEPENDS = "wpa-supplicant"
> +RRECOMMENDS = "${LIBC}-gconv-utf-16"
> +PR = "r1"
> +
> +SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz\
> +         file://session_manager.patch;patch=1 "
> +
> +SRC_URI_append_shr = "file://desktop.patch;patch=1 \
> +		      file://icons.patch;patch=1 \
> +	              file://style"
> +
> +S = "${WORKDIR}/wpa_supplicant-${PV}/wpa_supplicant/wpa_gui-qt4"
> +
> +inherit qt4x11
> +ARM_INSTRUCTION_SET = "arm"
> +
> +do_compile_append() {
> +       oe_runmake -C ${S}/icons
> +}
> +
> +do_install () {
> +       install -d ${D}${bindir}
> +       install -d ${D}${datadir}/wpa_gui
> +       install -d ${D}${datadir}/applications
> +       install -d ${D}${datadir}/pixmaps
> +       install -m 644 icons/hicolor/128x128/apps/wpa_gui.png ${D}${datadir}/pixmaps
> +       install -m 755 wpa_gui ${D}/${bindir}
> +       install -m 644 wpa_gui.desktop ${D}/${datadir}/applications
> +}
> +
> +do_install_append_shr() {
> +       install -m 644 ${WORKDIR}/style ${D}/${datadir}/wpa_gui
> +}
> +
> +FILES_${PN} = "/usr/share/pixmaps/wpa_gui.png \
> +               /usr/share/wpa_gui/style \
> +               /usr/bin/wpa_gui \
> +               /usr/share/applications/wpa_gui.desktop"
> +
> +FILES_${PN}_append_shr = " /usr/share/wpa_gui/style"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLUCXEMkyGM64RGpERAtZmAKCRY07Ooj00oF0Vy/KcxMzQfPgTYACfT+dF
GBLt0rXfw3QQcdIvcQucmdw=
=okMy
-----END PGP SIGNATURE-----



