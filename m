Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Oou3R-0004U1-AG
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 10:12:57 +0200
Received: by pwj8 with SMTP id 8so1111579pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 01:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=rHH7MXAkYB0gbb3SgIYUrqzjyau4sBDSK4ON7ZVa3IE=;
	b=SBvDagNNCpF76dwlreOtqzurhKsR1yyQm11Htz7X057cmMknq7Mf8gQyPAOTUpo5iy
	cAsxnh0yh1jOtjGYwF63J45oz7uwyyxIK0Q1ttyw7PX7HvisTIl3H8bzaQC17S5cj0dJ
	o1wud1fjRdFlY4PK7rjigTJahn8+aPwfnoPlE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=xKcifr2QVi8SfZRKkZZkIVzshVjhFX9z0XCyNswL2Cbsw2KFInZ/iEpWhnNNZfs9Si
	LltE5Dp2gQV1zandfCL+VIrhuMPu22enoslHKm+xF/V6Llz3ueqpqciv2sI43ddXiuy5
	GQHp2V5Eo8on6KYyRRpl6SFeVNDWtOIhfKQKY=
Received: by 10.142.217.19 with SMTP id p19mr926775wfg.142.1282896744030;
	Fri, 27 Aug 2010 01:12:24 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id y16sm4056848wff.14.2010.08.27.01.12.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 27 Aug 2010 01:12:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Aug 2010 01:11:54 -0700
Message-Id: <1282896714-3167-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1282896714-3167-1-git-send-email-raj.khem@gmail.com>
References: <1282896714-3167-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] recipes: Update recipes to get 'bitbake world' parse and calculate runqueue successfully.
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
X-List-Received-Date: Fri, 27 Aug 2010 08:12:57 -0000

* Move recipes to nonwotking which are depending upon other recipes
  which are already in nonworking state.

* Fix other recipes for renamed dependencies etc.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/angstrom/angstrom-bootmanager.bb           |    2 +-
 recipes/bt950-cs/bt950-cs_0.1.bb                   |    2 +-
 recipes/clutter/clutter-gtk-0.6_git.bb             |   10 ---
 recipes/clutter/clutter_0.6svn.bb                  |   10 ---
 recipes/esc/esc-node-demo_git.bb                   |    4 +-
 .../files/mini-browser-desktop-fix.patch           |   16 ----
 .../gpe-mini-browser-hildon_0.15.bb                |   54 --------------
 .../gpe-mini-browser-hildon_0.16.bb                |   55 ---------------
 .../gpe-mini-browser-hildon_0.17.bb                |   25 -------
 recipes/gpe-mini-browser/gpe-mini-browser_0.15.bb  |   55 ---------------
 recipes/gpe-mini-browser/gpe-mini-browser_0.16.bb  |   55 ---------------
 recipes/gpe-mini-browser/gpe-mini-browser_0.17.bb  |   54 --------------
 recipes/gpe-mini-browser/gpe-mini-browser_0.18.bb  |   51 --------------
 recipes/gpe-mini-browser/gpe-mini-browser_0.19.bb  |   55 ---------------
 recipes/gpe-mini-browser/gpe-mini-browser_0.20.bb  |   55 ---------------
 recipes/gpe-mini-browser/gpe-mini-browser_0.21.bb  |   57 ---------------
 recipes/gpe-mini-browser/gpe-mini-browser_svn.bb   |   55 ---------------
 recipes/gpe-todo/gpe-todo-hildon_0.54.bb           |   20 ------
 recipes/gpe-todo/gpe-todo-hildon_0.55.bb           |   20 ------
 recipes/gpephone/libmsgenabler2_svn.bb             |    2 +-
 recipes/images/initramfs-bootmenu-debug-image.bb   |    2 +-
 recipes/images/initramfs-bootmenu-image.bb         |    2 +-
 recipes/images/maemo-image.bb                      |   20 ------
 .../initrdscripts/initramfs-module-bootmenu_1.0.bb |    2 +-
 .../initramfs-module-kexecboot_1.0.bb              |    2 +-
 recipes/libgpepimc/libgpepimc-hildon_0.5.bb        |   30 --------
 recipes/maemo-mapper/maemo-mapper_svn.bb           |   22 ------
 recipes/maemo/hildon-control-panel_0.9.1-1.2.bb    |   21 ------
 recipes/maemo/hildon-status-bar/source.patch       |   11 ---
 recipes/maemo/hildon-status-bar_0.8.11-1.bb        |   15 ----
 recipes/maemo/lessertunjo_0.0.10.bb                |   25 -------
 recipes/maemo/libosso-help_1.0.01.bb               |   24 -------
 .../maemo/osso-application-installer_1.0.03-1.bb   |   22 ------
 recipes/maemo4/libosso-help_2.1.2.bb               |   21 ------
 recipes/meta/meta-angstrom-2007.bb                 |    1 -
 recipes/meta/meta-maemo.bb                         |   11 ---
 recipes/meta/meta-opie.bb                          |    6 +-
 recipes/meta/meta-toolchain-arago-dvsdk.bb         |    1 +
 recipes/minisip/libmsip_svn.bb                     |    2 +-
 recipes/networkmanager/cnetworkmanager_git.bb      |    2 +-
 .../files/mini-browser-desktop-fix.patch           |   16 ++++
 .../gpe-mini-browser-hildon_0.15.bb                |   54 ++++++++++++++
 .../gpe-mini-browser-hildon_0.16.bb                |   55 +++++++++++++++
 .../gpe-mini-browser-hildon_0.17.bb                |   25 +++++++
 .../gpe-mini-browser/gpe-mini-browser_0.15.bb      |   55 +++++++++++++++
 .../gpe-mini-browser/gpe-mini-browser_0.16.bb      |   55 +++++++++++++++
 .../gpe-mini-browser/gpe-mini-browser_0.17.bb      |   54 ++++++++++++++
 .../gpe-mini-browser/gpe-mini-browser_0.18.bb      |   51 ++++++++++++++
 .../gpe-mini-browser/gpe-mini-browser_0.19.bb      |   55 +++++++++++++++
 .../gpe-mini-browser/gpe-mini-browser_0.20.bb      |   55 +++++++++++++++
 .../gpe-mini-browser/gpe-mini-browser_0.21.bb      |   57 +++++++++++++++
 .../gpe-mini-browser/gpe-mini-browser_svn.bb       |   55 +++++++++++++++
 .../nonworking/gpe-todo/gpe-todo-hildon_0.54.bb    |   20 ++++++
 .../nonworking/gpe-todo/gpe-todo-hildon_0.55.bb    |   20 ++++++
 recipes/nonworking/images/maemo-image.bb           |   20 ++++++
 .../nonworking/libgpepimc/libgpepimc-hildon_0.5.bb |   30 ++++++++
 .../nonworking/maemo-mapper/maemo-mapper_svn.bb    |   22 ++++++
 .../maemo/hildon-control-panel_0.9.1-1.2.bb        |   21 ++++++
 .../maemo/hildon-status-bar/source.patch           |   11 +++
 .../nonworking/maemo/hildon-status-bar_0.8.11-1.bb |   15 ++++
 recipes/nonworking/maemo/lessertunjo_0.0.10.bb     |   25 +++++++
 recipes/nonworking/maemo/libosso-help_1.0.01.bb    |   24 +++++++
 .../maemo/osso-application-installer_1.0.03-1.bb   |   22 ++++++
 recipes/nonworking/maemo4/libosso-help_2.1.2.bb    |   21 ++++++
 recipes/nonworking/meta/meta-maemo.bb              |   11 +++
 recipes/nonworking/tasks/task-maemo.bb             |   73 ++++++++++++++++++++
 recipes/nonworking/ukeyboard/ukeyboard_1.2.bb      |   17 +++++
 recipes/openmoko-base/openmoko-session_svn.bb      |    2 +-
 recipes/sugar/sugar-fructose.bb                    |    2 +-
 recipes/tasks/task-arago-toolchain-target.bb       |    3 +-
 recipes/tasks/task-demo-x11.bb                     |   17 ++---
 recipes/tasks/task-gmae.bb                         |    7 ++
 recipes/tasks/task-gpe.bb                          |    6 +-
 recipes/tasks/task-maemo.bb                        |   73 --------------------
 recipes/tasks/task-mamona-base.bb                  |    5 +-
 recipes/tasks/task-mamona-python.bb                |   10 +---
 recipes/tasks/task-mamona-systemtap.bb             |    1 -
 recipes/tasks/task-mamona-wm.bb                    |    1 -
 recipes/tasks/task-openmoko-base.bb                |    2 +-
 recipes/tasks/task-openmoko-python-devel.bb        |    1 -
 recipes/tasks/task-openprotium.bb                  |    5 +-
 recipes/tasks/task-opie-apps.bb                    |    2 +-
 recipes/tasks/task-python-sharprom_20060425.bb     |   18 +++---
 recipes/udev/udev-compat141_141.bb                 |    6 ++-
 recipes/ukeyboard/ukeyboard_1.2.bb                 |   17 -----
 recipes/vlc/vlc-davinci_0.8.6h.bb                  |    2 +-
 recipes/xqt2/xqt2_20060509.bb                      |    2 +-
 87 files changed, 1003 insertions(+), 1017 deletions(-)
 delete mode 100644 recipes/clutter/clutter-gtk-0.6_git.bb
 delete mode 100644 recipes/clutter/clutter_0.6svn.bb
 delete mode 100644 recipes/gpe-mini-browser/files/mini-browser-desktop-fix.patch
 delete mode 100644 recipes/gpe-mini-browser/gpe-mini-browser-hildon_0.15.bb
 delete mode 100644 recipes/gpe-mini-browser/gpe-mini-browser-hildon_0.16.bb
 delete mode 100644 recipes/gpe-mini-browser/gpe-mini-browser-hildon_0.17.bb
 delete mode 100644 recipes/gpe-mini-browser/gpe-mini-browser_0.15.bb
 delete mode 100644 recipes/gpe-mini-browser/gpe-mini-browser_0.16.bb
 delete mode 100644 recipes/gpe-mini-browser/gpe-mini-browser_0.17.bb
 delete mode 100644 recipes/gpe-mini-browser/gpe-mini-browser_0.18.bb
 delete mode 100644 recipes/gpe-mini-browser/gpe-mini-browser_0.19.bb
 delete mode 100644 recipes/gpe-mini-browser/gpe-mini-browser_0.20.bb
 delete mode 100644 recipes/gpe-mini-browser/gpe-mini-browser_0.21.bb
 delete mode 100644 recipes/gpe-mini-browser/gpe-mini-browser_svn.bb
 delete mode 100644 recipes/gpe-todo/gpe-todo-hildon_0.54.bb
 delete mode 100644 recipes/gpe-todo/gpe-todo-hildon_0.55.bb
 delete mode 100644 recipes/images/maemo-image.bb
 delete mode 100644 recipes/libgpepimc/libgpepimc-hildon_0.5.bb
 delete mode 100644 recipes/maemo-mapper/maemo-mapper_svn.bb
 delete mode 100644 recipes/maemo/hildon-control-panel_0.9.1-1.2.bb
 delete mode 100644 recipes/maemo/hildon-status-bar/source.patch
 delete mode 100644 recipes/maemo/hildon-status-bar_0.8.11-1.bb
 delete mode 100644 recipes/maemo/lessertunjo_0.0.10.bb
 delete mode 100644 recipes/maemo/libosso-help_1.0.01.bb
 delete mode 100644 recipes/maemo/osso-application-installer_1.0.03-1.bb
 delete mode 100644 recipes/maemo4/libosso-help_2.1.2.bb
 delete mode 100644 recipes/meta/meta-maemo.bb
 create mode 100644 recipes/nonworking/gpe-mini-browser/files/mini-browser-desktop-fix.patch
 create mode 100644 recipes/nonworking/gpe-mini-browser/gpe-mini-browser-hildon_0.15.bb
 create mode 100644 recipes/nonworking/gpe-mini-browser/gpe-mini-browser-hildon_0.16.bb
 create mode 100644 recipes/nonworking/gpe-mini-browser/gpe-mini-browser-hildon_0.17.bb
 create mode 100644 recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.15.bb
 create mode 100644 recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.16.bb
 create mode 100644 recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.17.bb
 create mode 100644 recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.18.bb
 create mode 100644 recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.19.bb
 create mode 100644 recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.20.bb
 create mode 100644 recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.21.bb
 create mode 100644 recipes/nonworking/gpe-mini-browser/gpe-mini-browser_svn.bb
 create mode 100644 recipes/nonworking/gpe-todo/gpe-todo-hildon_0.54.bb
 create mode 100644 recipes/nonworking/gpe-todo/gpe-todo-hildon_0.55.bb
 create mode 100644 recipes/nonworking/images/maemo-image.bb
 create mode 100644 recipes/nonworking/libgpepimc/libgpepimc-hildon_0.5.bb
 create mode 100644 recipes/nonworking/maemo-mapper/maemo-mapper_svn.bb
 create mode 100644 recipes/nonworking/maemo/hildon-control-panel_0.9.1-1.2.bb
 create mode 100644 recipes/nonworking/maemo/hildon-status-bar/source.patch
 create mode 100644 recipes/nonworking/maemo/hildon-status-bar_0.8.11-1.bb
 create mode 100644 recipes/nonworking/maemo/lessertunjo_0.0.10.bb
 create mode 100644 recipes/nonworking/maemo/libosso-help_1.0.01.bb
 create mode 100644 recipes/nonworking/maemo/osso-application-installer_1.0.03-1.bb
 create mode 100644 recipes/nonworking/maemo4/libosso-help_2.1.2.bb
 create mode 100644 recipes/nonworking/meta/meta-maemo.bb
 create mode 100644 recipes/nonworking/tasks/task-maemo.bb
 create mode 100644 recipes/nonworking/ukeyboard/ukeyboard_1.2.bb
 delete mode 100644 recipes/tasks/task-maemo.bb
 delete mode 100644 recipes/ukeyboard/ukeyboard_1.2.bb

diff --git a/recipes/angstrom/angstrom-bootmanager.bb b/recipes/angstrom/angstrom-bootmanager.bb
index 6cae115..e5f3478 100644
--- a/recipes/angstrom/angstrom-bootmanager.bb
+++ b/recipes/angstrom/angstrom-bootmanager.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "A graphical Boot Manager for the Ångström Linux Distribution"
 AUTHOR = "Michael 'Mickey' Lauer <mickey@Vanille.de>"
 SECTION = "base"
-DEPENDS = "evas-fb ecore-fb esmart-fb imlib2-fb edje efl++-fb"
+#DEPENDS = "ecore esmart-fb imlib2-fb edje efl++-fb"
 #RDEPENDS_${PN} = "libefl++0"
 
 ALLOW_EMPTY = "1"
diff --git a/recipes/bt950-cs/bt950-cs_0.1.bb b/recipes/bt950-cs/bt950-cs_0.1.bb
index ec90c81..09b6281 100644
--- a/recipes/bt950-cs/bt950-cs_0.1.bb
+++ b/recipes/bt950-cs/bt950-cs_0.1.bb
@@ -11,7 +11,7 @@ file://makefile.patch"
 
 S = "${WORKDIR}/bt950-${PV}"
 
-PACKAGES = "${PN}-dbg kernel-module-bt950-cs"
+PACKAGES += "kernel-module-bt950-cs"
 FILES_kernel-module-bt950-cs = "/etc/pcmcia/bt950.conf /lib/modules/${KERNEL_VERSION}/kernel/drivers/bluetooth/bt950_cs.o"
 
 inherit module
diff --git a/recipes/clutter/clutter-gtk-0.6_git.bb b/recipes/clutter/clutter-gtk-0.6_git.bb
deleted file mode 100644
index e37c4c9..0000000
--- a/recipes/clutter/clutter-gtk-0.6_git.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require clutter-gtk.inc
-
-SRCREV = "2ba362a1a223c2b28541030a80aa11191615340a"
-PV = "0.6.0+git${SRCREV}"
-
-DEPENDS += "clutter-0.6"
-
-SRC_URI = "git://git.clutter-project.org/clutter-gtk.git;protocol=git;branch=clutter-gtk-0-6"
-
-S = "${WORKDIR}/git"
diff --git a/recipes/clutter/clutter_0.6svn.bb b/recipes/clutter/clutter_0.6svn.bb
deleted file mode 100644
index e86cbaf..0000000
--- a/recipes/clutter/clutter_0.6svn.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require clutter.inc
-
-PV = "0.6.0+svnr${SRCPV}"
-PR = "${INC_PR}.0"
-SRCREV = "3240"
-
-SRC_URI = "svn://svn.o-hand.com/repos/clutter/branches;module=clutter-0-6;proto=http \
-	   file://enable_tests-0.6.patch "
-
-S = "${WORKDIR}/clutter-0-6"
diff --git a/recipes/esc/esc-node-demo_git.bb b/recipes/esc/esc-node-demo_git.bb
index 814771b..f29b7ba 100644
--- a/recipes/esc/esc-node-demo_git.bb
+++ b/recipes/esc/esc-node-demo_git.bb
@@ -23,7 +23,7 @@ do_install() {
         install -m 0755 ${S}/${i} ${D}${datadir}/esc-training
     done
 }
-
-RDEPENDS_${PN} = "nodejs"
+# disable for now until nodejs recipe is committed
+#RDEPENDS_${PN} = "nodejs"
 FILES_${PN} += "${datadir}/esc-training"
 
diff --git a/recipes/gpe-mini-browser/files/mini-browser-desktop-fix.patch b/recipes/gpe-mini-browser/files/mini-browser-desktop-fix.patch
deleted file mode 100644
index 4912abb..0000000
--- a/recipes/gpe-mini-browser/files/mini-browser-desktop-fix.patch
+++ /dev/null
@@ -1,16 +0,0 @@
---- gpe-mini-browser-0.21.old/gpe-mini-browser-0.21//gpe-mini-browser.desktop.in.in	2007-01-09 14:53:31.000000000 +0200
-+++ gpe-mini-browser-0.21/gpe-mini-browser.desktop.in.in	2007-12-11 20:45:04.749584640 +0200
-@@ -2,9 +2,8 @@
- _Name=Mini Web Browser
- _Comment=Browse the web
- Exec=gpe-mini-browser
--Terminal=0
-+Terminal=false
- Type=Application
--Icon=gpe-mini-browser.png
--Categories=Application;PIM;GPE
--StartupNotify=True
--
-+Icon=gpe-mini-browser
-+Categories=X-GPE;X-PIM;X-Internet;X-Browser;
-+StartupNotify=true
diff --git a/recipes/gpe-mini-browser/gpe-mini-browser-hildon_0.15.bb b/recipes/gpe-mini-browser/gpe-mini-browser-hildon_0.15.bb
deleted file mode 100644
index faa9131..0000000
--- a/recipes/gpe-mini-browser/gpe-mini-browser-hildon_0.15.bb
+++ /dev/null
@@ -1,54 +0,0 @@
-require gpe-mini-browser.inc
-
-PR = "r0"
-
-SRC_URI      = "${GPE_MIRROR}/gpe-mini-browser-${PV}.tar.gz"
-DEPENDS      = "osb-nrcit libosso hildon-lgpl hildon-fm libgpewidget"
-EXTRA_OECONF = "--enable-hildon"
-
-S = "${WORKDIR}/gpe-mini-browser-${PV}"
-
-inherit autotools
-
-do_install() {
-		install -d ${D}/usr/share/applications/hildon
-		install -m 0644 ${S}/hildon/gpe-mini-browser.desktop ${D}/usr/share/applications/hildon/gpe-mini-browser.desktop
-		install -d ${D}/usr/share/pixmaps
-		install -m 0644 ${S}/gpe-mini-browser.png ${D}/usr/share/pixmaps/gpe-mini-browser.png
-		autotools_do_install
-}
-
-pkg_postinst_${PN}-doc () {
-        #!/bin/sh
-	if [ "x$D" != "x" ]; then
-        if [ -e /etc/gpe/gpe-help.conf ]; then
-                echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
-        else
-                 echo [Help] >> /etc/gpe/gpe-help.conf
-                 echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
-        fi
-        if [ -x /usr/bin/gpe-helpindex ]; then
-                echo generating help-index
-                gpe-helpindex
-        else
-                echo not generating index for gpe-mini-browser
-        fi
-	fi
-}
-
-pkg_postrm_${PN}-doc () {
-        #!/bin/sh
-        if [ -e /etc/gpe/gpe-help.conf ]; then
-                sed '/^\<gpe-mini-browser\>/d' /etc/gpe/gpe-help.conf > /tmp/gpe-help.conf
-                mv /tmp/gpe-help.conf /etc/gpe/gpe-help.conf
-        fi
-        if [ -x /usr/bin/gpe-helpindex ]; then
-                echo generating help-index
-                gpe-helpindex
-        else
-                echo not generating index for gpe-mini-browser
-        fi
-}
-
-SRC_URI[md5sum] = "b048cee7254d7fe6eb1e2821ce8706df"
-SRC_URI[sha256sum] = "aa9c2dbe8d763b4461a42d46378cc49335a266a7d6dcd794ecd46fac037c8913"
diff --git a/recipes/gpe-mini-browser/gpe-mini-browser-hildon_0.16.bb b/recipes/gpe-mini-browser/gpe-mini-browser-hildon_0.16.bb
deleted file mode 100644
index 370017a..0000000
--- a/recipes/gpe-mini-browser/gpe-mini-browser-hildon_0.16.bb
+++ /dev/null
@@ -1,55 +0,0 @@
-require gpe-mini-browser.inc
-
-PR = "r0"
-
-SRC_URI      = "${GPE_MIRROR}/gpe-mini-browser-${PV}.tar.gz"
-DESCRIPTION  = "A lightweight webbrowser for the GPE platform (Hildon UI)"
-DEPENDS      = "osb-nrcit libosso hildon-lgpl hildon-fm libgpewidget"
-EXTRA_OECONF = "--enable-hildon"
-
-S = "${WORKDIR}/gpe-mini-browser-${PV}"
-
-inherit autotools
-
-do_install() {
-		install -d ${D}/usr/share/applications/hildon
-		install -m 0644 ${S}/hildon/gpe-mini-browser.desktop ${D}/usr/share/applications/hildon/gpe-mini-browser.desktop
-		install -d ${D}/usr/share/pixmaps
-		install -m 0644 ${S}/gpe-mini-browser.png ${D}/usr/share/pixmaps/gpe-mini-browser.png
-		autotools_do_install
-}
-
-pkg_postinst_${PN}-doc () {
-        #!/bin/sh
-	if [ "x$D" != "x" ]; then
-        if [ -e /etc/gpe/gpe-help.conf ]; then
-                echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
-        else
-                 echo [Help] >> /etc/gpe/gpe-help.conf
-                 echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
-        fi
-        if [ -x /usr/bin/gpe-helpindex ]; then
-                echo generating help-index
-                gpe-helpindex
-        else
-                echo not generating index for gpe-mini-browser
-        fi
-	fi
-}
-
-pkg_postrm_${PN}-doc () {
-        #!/bin/sh
-        if [ -e /etc/gpe/gpe-help.conf ]; then
-                sed '/^\<gpe-mini-browser\>/d' /etc/gpe/gpe-help.conf > /tmp/gpe-help.conf
-                mv /tmp/gpe-help.conf /etc/gpe/gpe-help.conf
-        fi
-        if [ -x /usr/bin/gpe-helpindex ]; then
-                echo generating help-index
-                gpe-helpindex
-        else
-                echo not generating index for gpe-mini-browser
-        fi
-}
-
-SRC_URI[md5sum] = "858f3e7219cde7b18e69293526020416"
-SRC_URI[sha256sum] = "36d2487895d3579ae3e8693ebe789b5de454506fc572937dac2fb7ef512f105f"
diff --git a/recipes/gpe-mini-browser/gpe-mini-browser-hildon_0.17.bb b/recipes/gpe-mini-browser/gpe-mini-browser-hildon_0.17.bb
deleted file mode 100644
index 692f418..0000000
--- a/recipes/gpe-mini-browser/gpe-mini-browser-hildon_0.17.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-require gpe-mini-browser.inc
-
-PR = "r0"
-
-SRC_URI      = "${GPE_MIRROR}/gpe-mini-browser-${PV}.tar.gz"
-DESCRIPTION  = "A lightweight webbrowser for the GPE platform (Hildon UI)"
-DEPENDS      = "osb-nrcit libosso hildon-lgpl hildon-fm libgpewidget"
-EXTRA_OECONF = "--enable-hildon"
-
-S = "${WORKDIR}/gpe-mini-browser-${PV}"
-
-inherit autotools
-
-do_install() {
-		install -d ${D}/usr/share/applications/hildon
-		install -m 0644 ${S}/hildon/gpe-mini-browser.desktop ${D}/usr/share/applications/hildon/gpe-mini-browser.desktop
-		install -d ${D}/usr/share/pixmaps
-		install -m 0644 ${S}/gpe-mini-browser.png ${D}/usr/share/pixmaps/gpe-mini-browser.png
-		autotools_do_install
-}
-
-
-
-SRC_URI[md5sum] = "749c571ec28e2ea4f31602f3d5609e4b"
-SRC_URI[sha256sum] = "19d345571344f65e35b06c3faad6cfc86afeb8a41533d39bfbf364e1da34188c"
diff --git a/recipes/gpe-mini-browser/gpe-mini-browser_0.15.bb b/recipes/gpe-mini-browser/gpe-mini-browser_0.15.bb
deleted file mode 100644
index 68d8020..0000000
--- a/recipes/gpe-mini-browser/gpe-mini-browser_0.15.bb
+++ /dev/null
@@ -1,55 +0,0 @@
-require gpe-mini-browser.inc
-
-PR = "r1"
-
-SRC_URI = "ftp://ftp.handhelds.org/projects/gpe/source/gpe-mini-browser-${PV}.tar.gz"
-DEPENDS = "osb-nrcit libgpewidget"
-
-S = "${WORKDIR}/gpe-mini-browser-${PV}"
-
-inherit autotools
-
-do_install() {
-	#	install -d ${D}${docdir}/gpe
-	#	install -m 0644 ${S}/gpe-mini-browser.html  ${D}${docdir}/gpe/
-		install -d ${D}/usr/share/applications
-		install -m 0644 ${S}/gpe-mini-browser.desktop ${D}/usr/share/applications/gpe-mini-browser.desktop
-		install -d ${D}/usr/share/pixmaps
-		install -m 0644 ${S}/gpe-mini-browser.png ${D}/usr/share/pixmaps/gpe-mini-browser.png
-		autotools_do_install
-}
-
-pkg_postinst_${PN}-doc () {
-        #!/bin/sh
-	if [ "x$D" != "x" ]; then
-        if [ -e /etc/gpe/gpe-help.conf ]; then
-                echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
-        else
-                 echo [Help] >> /etc/gpe/gpe-help.conf
-                 echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
-        fi
-        if [ -x /usr/bin/gpe-helpindex ]; then
-                echo generating help-index
-                gpe-helpindex
-        else
-                echo not generating index for gpe-mini-browser
-        fi
-	fi
-}
-
-pkg_postrm_${PN}-doc () {
-        #!/bin/sh
-        if [ -e /etc/gpe/gpe-help.conf ]; then
-                sed '/^\<gpe-mini-browser\>/d' /etc/gpe/gpe-help.conf > /tmp/gpe-help.conf
-                mv /tmp/gpe-help.conf /etc/gpe/gpe-help.conf
-        fi
-        if [ -x /usr/bin/gpe-helpindex ]; then
-                echo generating help-index
-                gpe-helpindex
-        else
-                echo not generating index for gpe-mini-browser
-        fi
-}
-
-SRC_URI[md5sum] = "b048cee7254d7fe6eb1e2821ce8706df"
-SRC_URI[sha256sum] = "aa9c2dbe8d763b4461a42d46378cc49335a266a7d6dcd794ecd46fac037c8913"
diff --git a/recipes/gpe-mini-browser/gpe-mini-browser_0.16.bb b/recipes/gpe-mini-browser/gpe-mini-browser_0.16.bb
deleted file mode 100644
index e83467c..0000000
--- a/recipes/gpe-mini-browser/gpe-mini-browser_0.16.bb
+++ /dev/null
@@ -1,55 +0,0 @@
-require gpe-mini-browser.inc
-
-PR = "r1"
-
-SRC_URI = "ftp://ftp.handhelds.org/projects/gpe/source/gpe-mini-browser-${PV}.tar.gz"
-DEPENDS = "osb-nrcit sqlite libgpewidget"
-
-S = "${WORKDIR}/gpe-mini-browser-${PV}"
-
-inherit autotools
-
-do_install() {
-	#	install -d ${D}${docdir}/gpe
-	#	install -m 0644 ${S}/gpe-mini-browser.html  ${D}${docdir}/gpe/
-		install -d ${D}/usr/share/applications
-		install -m 0644 ${S}/gpe-mini-browser.desktop ${D}/usr/share/applications/gpe-mini-browser.desktop
-		install -d ${D}/usr/share/pixmaps
-		install -m 0644 ${S}/gpe-mini-browser.png ${D}/usr/share/pixmaps/gpe-mini-browser.png
-		autotools_do_install
-}
-
-pkg_postinst_${PN}-doc () {
-        #!/bin/sh
-	if [ "x$D" != "x" ]; then
-        if [ -e /etc/gpe/gpe-help.conf ]; then
-                echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
-        else
-                 echo [Help] >> /etc/gpe/gpe-help.conf
-                 echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
-        fi
-        if [ -x /usr/bin/gpe-helpindex ]; then
-                echo generating help-index
-                gpe-helpindex
-        else
-                echo not generating index for gpe-mini-browser
-        fi
-	fi
-}
-
-pkg_postrm_${PN}-doc () {
-        #!/bin/sh
-        if [ -e /etc/gpe/gpe-help.conf ]; then
-                sed '/^\<gpe-mini-browser\>/d' /etc/gpe/gpe-help.conf > /tmp/gpe-help.conf
-                mv /tmp/gpe-help.conf /etc/gpe/gpe-help.conf
-        fi
-        if [ -x /usr/bin/gpe-helpindex ]; then
-                echo generating help-index
-                gpe-helpindex
-        else
-                echo not generating index for gpe-mini-browser
-        fi
-}
-
-SRC_URI[md5sum] = "858f3e7219cde7b18e69293526020416"
-SRC_URI[sha256sum] = "36d2487895d3579ae3e8693ebe789b5de454506fc572937dac2fb7ef512f105f"
diff --git a/recipes/gpe-mini-browser/gpe-mini-browser_0.17.bb b/recipes/gpe-mini-browser/gpe-mini-browser_0.17.bb
deleted file mode 100644
index 5499ca3..0000000
--- a/recipes/gpe-mini-browser/gpe-mini-browser_0.17.bb
+++ /dev/null
@@ -1,54 +0,0 @@
-require gpe-mini-browser.inc
-
-SRC_URI = "ftp://ftp.handhelds.org/projects/gpe/source/gpe-mini-browser-${PV}.tar.gz"
-DEPENDS = "osb-nrcit sqlite libgpewidget"
-RRECOMMENDS_${PN} = "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-pixbuf-loader-jpeg"
-
-
-S = "${WORKDIR}/gpe-mini-browser-${PV}"
-
-inherit autotools
-
-do_install() {
-		install -d ${D}/usr/share/applications
-		install -m 0644 ${S}/gpe-mini-browser.desktop ${D}/usr/share/applications/gpe-mini-browser.desktop
-		install -d ${D}/usr/share/pixmaps
-		install -m 0644 ${S}/gpe-mini-browser.png ${D}/usr/share/pixmaps/gpe-mini-browser.png
-		autotools_do_install
-}
-
-pkg_postinst_${PN}-doc () {
-        #!/bin/sh
-	if [ "x$D" != "x" ]; then
-        if [ -e /etc/gpe/gpe-help.conf ]; then
-                echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
-        else
-                 echo [Help] >> /etc/gpe/gpe-help.conf
-                 echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
-        fi
-        if [ -x /usr/bin/gpe-helpindex ]; then
-                echo generating help-index
-                gpe-helpindex
-        else
-                echo not generating index for gpe-mini-browser
-        fi
-	fi
-}
-
-pkg_postrm_${PN}-doc () {
-        #!/bin/sh
-        if [ -e /etc/gpe/gpe-help.conf ]; then
-                sed '/^\<gpe-mini-browser\>/d' /etc/gpe/gpe-help.conf > /tmp/gpe-help.conf
-                mv /tmp/gpe-help.conf /etc/gpe/gpe-help.conf
-        fi
-        if [ -x /usr/bin/gpe-helpindex ]; then
-                echo generating help-index
-                gpe-helpindex
-        else
-                echo not generating index for gpe-mini-browser
-        fi
-}
-
-
-SRC_URI[md5sum] = "749c571ec28e2ea4f31602f3d5609e4b"
-SRC_URI[sha256sum] = "19d345571344f65e35b06c3faad6cfc86afeb8a41533d39bfbf364e1da34188c"
diff --git a/recipes/gpe-mini-browser/gpe-mini-browser_0.18.bb b/recipes/gpe-mini-browser/gpe-mini-browser_0.18.bb
deleted file mode 100644
index 9c67dcc..0000000
--- a/recipes/gpe-mini-browser/gpe-mini-browser_0.18.bb
+++ /dev/null
@@ -1,51 +0,0 @@
-require gpe-mini-browser.inc
-
-SRC_URI = "ftp://ftp.handhelds.org/projects/gpe/source/gpe-mini-browser-${PV}.tar.gz"
-DEPENDS = "osb-nrcit sqlite libgpewidget"
-RRECOMMENDS_${PN} = "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-pixbuf-loader-jpeg"
-
-
-S = "${WORKDIR}/gpe-mini-browser-${PV}"
-
-inherit autotools
-
-do_install() {
-		install -d ${D}/usr/share/applications
-		install -m 0644 ${S}/gpe-mini-browser.desktop ${D}/usr/share/applications/gpe-mini-browser.desktop
-		install -d ${D}/usr/share/pixmaps
-		install -m 0644 ${S}/gpe-mini-browser.png ${D}/usr/share/pixmaps/gpe-mini-browser.png
-		autotools_do_install
-}
-
-pkg_postinst_${PN}-doc () {
-        #!/bin/sh
-	if [ "x$D" != "x" ]; then
-        if [ -e /etc/gpe/gpe-help.conf ]; then
-                echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
-        else
-                 echo [Help] >> /etc/gpe/gpe-help.conf
-                 echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
-        fi
-        if [ -x /usr/bin/gpe-helpindex ]; then
-                echo generating help-index
-                gpe-helpindex
-        else
-                echo not generating index for gpe-mini-browser
-        fi
-	fi
-}
-
-pkg_postrm_${PN}-doc () {
-        #!/bin/sh
-        if [ -e /etc/gpe/gpe-help.conf ]; then
-                sed '/^\<gpe-mini-browser\>/d' /etc/gpe/gpe-help.conf > /tmp/gpe-help.conf
-                mv /tmp/gpe-help.conf /etc/gpe/gpe-help.conf
-        fi
-        if [ -x /usr/bin/gpe-helpindex ]; then
-                echo generating help-index
-                gpe-helpindex
-        else
-                echo not generating index for gpe-mini-browser
-        fi
-}
-
diff --git a/recipes/gpe-mini-browser/gpe-mini-browser_0.19.bb b/recipes/gpe-mini-browser/gpe-mini-browser_0.19.bb
deleted file mode 100644
index 0a9c78d..0000000
--- a/recipes/gpe-mini-browser/gpe-mini-browser_0.19.bb
+++ /dev/null
@@ -1,55 +0,0 @@
-require gpe-mini-browser.inc
-
-SRC_URI = "http://gpe.linuxtogo.org/download/source/gpe-mini-browser-${PV}.tar.gz"
-DEPENDS = "osb-nrcit sqlite libgpewidget"
-RRECOMMENDS_${PN} = "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-pixbuf-loader-jpeg"
-
-PR = "r2"
-
-S = "${WORKDIR}/gpe-mini-browser-${PV}"
-
-inherit autotools
-
-do_install() {
-		install -d ${D}/usr/share/applications
-		install -m 0644 ${S}/gpe-mini-browser.desktop ${D}/usr/share/applications/gpe-mini-browser.desktop
-		install -d ${D}/usr/share/pixmaps
-		install -m 0644 ${S}/gpe-mini-browser.png ${D}/usr/share/pixmaps/gpe-mini-browser.png
-		autotools_do_install
-}
-
-pkg_postinst_${PN}-doc () {
-        #!/bin/sh
-	if [ "x$D" != "x" ]; then
-        if [ -e /etc/gpe/gpe-help.conf ]; then
-                echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
-        else
-                 echo [Help] >> /etc/gpe/gpe-help.conf
-                 echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
-        fi
-        if [ -x /usr/bin/gpe-helpindex ]; then
-                echo generating help-index
-                gpe-helpindex
-        else
-                echo not generating index for gpe-mini-browser
-        fi
-	fi
-}
-
-pkg_postrm_${PN}-doc () {
-        #!/bin/sh
-        if [ -e /etc/gpe/gpe-help.conf ]; then
-                sed '/^\<gpe-mini-browser\>/d' /etc/gpe/gpe-help.conf > /tmp/gpe-help.conf
-                mv /tmp/gpe-help.conf /etc/gpe/gpe-help.conf
-        fi
-        if [ -x /usr/bin/gpe-helpindex ]; then
-                echo generating help-index
-                gpe-helpindex
-        else
-                echo not generating index for gpe-mini-browser
-        fi
-}
-
-
-SRC_URI[md5sum] = "922640f40f67d15892d9ea8ec6c8ffea"
-SRC_URI[sha256sum] = "ece034b916a7760cfb854baab474b7931246bdb078c814366bf90a9fbff246af"
diff --git a/recipes/gpe-mini-browser/gpe-mini-browser_0.20.bb b/recipes/gpe-mini-browser/gpe-mini-browser_0.20.bb
deleted file mode 100644
index 1bff97b..0000000
--- a/recipes/gpe-mini-browser/gpe-mini-browser_0.20.bb
+++ /dev/null
@@ -1,55 +0,0 @@
-require gpe-mini-browser.inc
-
-SRC_URI = "http://gpe.linuxtogo.org/download/source/gpe-mini-browser-${PV}.tar.gz"
-DEPENDS = "osb-nrcit sqlite libgpewidget"
-RRECOMMENDS_${PN} = "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-pixbuf-loader-jpeg"
-
-PR = "r2"
-
-S = "${WORKDIR}/gpe-mini-browser-${PV}"
-
-inherit autotools
-
-do_install() {
-		install -d ${D}/usr/share/applications
-		install -m 0644 ${S}/gpe-mini-browser.desktop ${D}/usr/share/applications/gpe-mini-browser.desktop
-		install -d ${D}/usr/share/pixmaps
-		install -m 0644 ${S}/gpe-mini-browser.png ${D}/usr/share/pixmaps/gpe-mini-browser.png
-		autotools_do_install
-}
-
-pkg_postinst_${PN}-doc () {
-        #!/bin/sh
-	if [ "x$D" != "x" ]; then
-        if [ -e /etc/gpe/gpe-help.conf ]; then
-                echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
-        else
-                 echo [Help] >> /etc/gpe/gpe-help.conf
-                 echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
-        fi
-        if [ -x /usr/bin/gpe-helpindex ]; then
-                echo generating help-index
-                gpe-helpindex
-        else
-                echo not generating index for gpe-mini-browser
-        fi
-	fi
-}
-
-pkg_postrm_${PN}-doc () {
-        #!/bin/sh
-        if [ -e /etc/gpe/gpe-help.conf ]; then
-                sed '/^\<gpe-mini-browser\>/d' /etc/gpe/gpe-help.conf > /tmp/gpe-help.conf
-                mv /tmp/gpe-help.conf /etc/gpe/gpe-help.conf
-        fi
-        if [ -x /usr/bin/gpe-helpindex ]; then
-                echo generating help-index
-                gpe-helpindex
-        else
-                echo not generating index for gpe-mini-browser
-        fi
-}
-
-
-SRC_URI[md5sum] = "1a7a4095cafed9cda21e500842b686a1"
-SRC_URI[sha256sum] = "ddba5fea0424c9c121269e96ea202014a29568263d478ac5682022973d2986f1"
diff --git a/recipes/gpe-mini-browser/gpe-mini-browser_0.21.bb b/recipes/gpe-mini-browser/gpe-mini-browser_0.21.bb
deleted file mode 100644
index 824a416..0000000
--- a/recipes/gpe-mini-browser/gpe-mini-browser_0.21.bb
+++ /dev/null
@@ -1,57 +0,0 @@
-require gpe-mini-browser.inc
-
-SRC_URI = "http://gpe.linuxtogo.org/download/source/gpe-mini-browser-${PV}.tar.gz"
-DEPENDS = "osb-nrcit sqlite libgpewidget"
-RRECOMMENDS_${PN} = "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-pixbuf-loader-jpeg"
-
-PR = "r2"
-
-SRC_URI += "file://mini-browser-desktop-fix.patch"
-
-S = "${WORKDIR}/gpe-mini-browser-${PV}"
-
-inherit autotools
-
-do_install() {
-		install -d ${D}/usr/share/applications
-		install -m 0644 ${S}/gpe-mini-browser.desktop ${D}/usr/share/applications/gpe-mini-browser.desktop
-		install -d ${D}/usr/share/pixmaps
-		install -m 0644 ${S}/gpe-mini-browser.png ${D}/usr/share/pixmaps/gpe-mini-browser.png
-		autotools_do_install
-}
-
-pkg_postinst_${PN}-doc () {
-        #!/bin/sh
-	if [ "x$D" != "x" ]; then
-        if [ -e /etc/gpe/gpe-help.conf ]; then
-                echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
-        else
-                 echo [Help] >> /etc/gpe/gpe-help.conf
-                 echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
-        fi
-        if [ -x /usr/bin/gpe-helpindex ]; then
-                echo generating help-index
-                gpe-helpindex
-        else
-                echo not generating index for gpe-mini-browser
-        fi
-	fi
-}
-
-pkg_postrm_${PN}-doc () {
-        #!/bin/sh
-        if [ -e /etc/gpe/gpe-help.conf ]; then
-                sed '/^\<gpe-mini-browser\>/d' /etc/gpe/gpe-help.conf > /tmp/gpe-help.conf
-                mv /tmp/gpe-help.conf /etc/gpe/gpe-help.conf
-        fi
-        if [ -x /usr/bin/gpe-helpindex ]; then
-                echo generating help-index
-                gpe-helpindex
-        else
-                echo not generating index for gpe-mini-browser
-        fi
-}
-
-
-SRC_URI[md5sum] = "a1297dfd14c008e3415f89b01eef75cd"
-SRC_URI[sha256sum] = "ec0358d104fa992f1437b37cdf70e83ab152794d2989ef2e9715ab8659dc46e3"
diff --git a/recipes/gpe-mini-browser/gpe-mini-browser_svn.bb b/recipes/gpe-mini-browser/gpe-mini-browser_svn.bb
deleted file mode 100644
index 0ebff73..0000000
--- a/recipes/gpe-mini-browser/gpe-mini-browser_svn.bb
+++ /dev/null
@@ -1,55 +0,0 @@
-DEPENDS = "sqlite gettext gtk+ glib-2.0 osb-nrcit libgpewidget"
-RRECOMMENDS_${PN} = "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-pixbuf-loader-jpeg"
-
-SRCREV = "9900"
-PV = "0.20+svn${SRCDATE}"
-PR = "r1"
-
-inherit autotools
-
-SRC_URI = "${GPE_EXTRA_SVN}"
-
-S = "${WORKDIR}/gpe-mini-browser"
-
-do_install() {
-                install -d ${D}/usr/share/applications
-                install -m 0644 ${S}/gpe-mini-browser.desktop ${D}/usr/share/applications/gpe-mini-browser.desktop
-                install -d ${D}/usr/share/pixmaps
-                install -m 0644 ${S}/gpe-mini-browser.png ${D}/usr/share/pixmaps/gpe-mini-browser.png
-                autotools_do_install
-}
-
-pkg_postinst_${PN}-doc () {
-        #!/bin/sh
-        if [ "x$D" != "x" ]; then
-        if [ -e /etc/gpe/gpe-help.conf ]; then
-                echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
-        else
-                 echo [Help] >> /etc/gpe/gpe-help.conf
-                 echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
-        fi
-        if [ -x /usr/bin/gpe-helpindex ]; then
-                echo generating help-index
-                gpe-helpindex
-        else
-                echo not generating index for gpe-mini-browser
-        fi
-        fi
-}
-pkg_postrm_${PN}-doc () {
-        #!/bin/sh
-        if [ -e /etc/gpe/gpe-help.conf ]; then
-                sed '/^\<gpe-mini-browser\>/d' /etc/gpe/gpe-help.conf > /tmp/gpe-help.conf
-                mv /tmp/gpe-help.conf /etc/gpe/gpe-help.conf
-        fi
-        if [ -x /usr/bin/gpe-helpindex ]; then
-                echo generating help-index
-                gpe-helpindex
-        else
-                echo not generating index for gpe-mini-browser
-        fi
-}
-
-require gpe-mini-browser.inc
-
-#DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/gpe-todo/gpe-todo-hildon_0.54.bb b/recipes/gpe-todo/gpe-todo-hildon_0.54.bb
deleted file mode 100644
index 9954d51..0000000
--- a/recipes/gpe-todo/gpe-todo-hildon_0.54.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-LICENSE     = "GPL"
-PR          = "r1"
-DESCRIPTION = "GPE to-do list"
-DEPENDS     = "libgpewidget-hildon libgpepimc-hildon libtododb sdk-default-icons libosso"
-RDEPENDS_${PN}    = "sdk-default-icons"
-SECTION = "gpe"
-PRIORITY    = "optional"
-
-inherit gpe autotools pkgconfig
-
-EXTRA_OECONF = "--enable-hildon"
-
-SRC_URI="${GPE_MIRROR}/gpe-todo-${PV}.tar.bz2"
-
-S = "${WORKDIR}/gpe-todo-${PV}"
-
-FILES_${PN} += "${datadir}/gpe-todo ${libdir}/dbus-1.0"
-
-SRC_URI[md5sum] = "8fdd52954a7a29691013900b65eb5702"
-SRC_URI[sha256sum] = "b3f51635b3ce6408fdfbd0283e1d8036c23b6ecb5adf0d66882e7e48eb5d97b9"
diff --git a/recipes/gpe-todo/gpe-todo-hildon_0.55.bb b/recipes/gpe-todo/gpe-todo-hildon_0.55.bb
deleted file mode 100644
index d71f862..0000000
--- a/recipes/gpe-todo/gpe-todo-hildon_0.55.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-LICENSE     = "GPL"
-PR          = "r1"
-DESCRIPTION = "GPE to-do list"
-DEPENDS     = "libgpewidget-hildon libgpepimc-hildon libtododb sdk-default-icons libosso"
-RDEPENDS_${PN}    = "sdk-default-icons"
-SECTION = "gpe"
-PRIORITY    = "optional"
-
-inherit gpe autotools pkgconfig
-
-EXTRA_OECONF = "--enable-hildon"
-
-SRC_URI="${GPE_MIRROR}/gpe-todo-${PV}.tar.bz2"
-
-S = "${WORKDIR}/gpe-todo-${PV}"
-
-FILES_${PN} += "${datadir}/gpe-todo ${libdir}/dbus-1.0"
-
-SRC_URI[md5sum] = "e8c08165d9723779473e3390a949afac"
-SRC_URI[sha256sum] = "ec2ef95c967acce5834c8b4985c610014c16242d223d233947d67b4514ebe298"
diff --git a/recipes/gpephone/libmsgenabler2_svn.bb b/recipes/gpephone/libmsgenabler2_svn.bb
index 6b5c326..cbd068a 100644
--- a/recipes/gpephone/libmsgenabler2_svn.bb
+++ b/recipes/gpephone/libmsgenabler2_svn.bb
@@ -2,7 +2,7 @@ LICENSE     = "LiPS"
 DESCRIPTION = "LiPS message backend library."
 SECTION = "gpe/libs"
 PRIORITY    = "optional"
-DEPENDS     = "glib-2.0 dbus-glib librecord2 liblipsevent2 telepathy-mission-control libgsmd-lips"
+DEPENDS     = "glib-2.0 dbus-glib librecord2 liblipsevent2 telepathy-mission-control libgsmd"
 PV = "0.0+svnr-${SRCREV}"
 PR          = "r2"
 
diff --git a/recipes/images/initramfs-bootmenu-debug-image.bb b/recipes/images/initramfs-bootmenu-debug-image.bb
index df5bf2b..a8f8ee3 100644
--- a/recipes/images/initramfs-bootmenu-debug-image.bb
+++ b/recipes/images/initramfs-bootmenu-debug-image.bb
@@ -1,7 +1,7 @@
 # initramfs image with interactive boot menu allowing to select rootfs location
 # from choices of block devices, loopback images and NFS.
 
-IMAGE_INSTALL = "busybox-static initramfs-module-bootmenu initramfs-module-check-modules initramfs-module-kexecboot klibc-utils-static-modprobe"
+IMAGE_INSTALL = "busybox-static initramfs-module-bootmenu initramfs-module-check-modules initramfs-module-kexecboot klibc-static-utils-modprobe"
 IMAGE_INSTALL += " dropbear dropbear-backdoor"
 IMAGE_LINGUAS = ""
 
diff --git a/recipes/images/initramfs-bootmenu-image.bb b/recipes/images/initramfs-bootmenu-image.bb
index 79806c9..51be798 100644
--- a/recipes/images/initramfs-bootmenu-image.bb
+++ b/recipes/images/initramfs-bootmenu-image.bb
@@ -1,7 +1,7 @@
 # initramfs image with interactive boot menu allowing to select rootfs location
 # from choices of block devices, loopback images and NFS.
 
-IMAGE_INSTALL = "busybox-static initramfs-module-bootmenu initramfs-module-check-modules initramfs-module-kexecboot klibc-utils-static-modprobe"
+IMAGE_INSTALL = "busybox-static initramfs-module-bootmenu initramfs-module-check-modules initramfs-module-kexecboot klibc-static-utils-modprobe"
 IMAGE_LINGUAS = ""
 
 
diff --git a/recipes/images/maemo-image.bb b/recipes/images/maemo-image.bb
deleted file mode 100644
index c0498bb..0000000
--- a/recipes/images/maemo-image.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-#
-# Meta package for maemo based system image
-#
-
-GUI_MACHINE_CLASS ?= "none"
-
-MAEMO_EXTRA_DEPENDS = "scap dosfstools"
-MAEMO_EXTRA_INSTALL = "osso-af-services osso-af-base-apps scap dosfstools"
-
-XSERVER ?= "xserver-kdrive-omap"
-
-DEPENDS = "${MACHINE_TASK_PROVIDER} \
-	   meta-maemo \
-	   ${MAEMO_EXTRA_DEPENDS}"
-
-IMAGE_INSTALL = "${MACHINE_TASK_PROVIDER} maemo-task-base maemo-task-theme \
-	               maemo-task-apps ${MAEMO_EXTRA_INSTALL} \
-		       ${XSERVER}"
-
-inherit image
diff --git a/recipes/initrdscripts/initramfs-module-bootmenu_1.0.bb b/recipes/initrdscripts/initramfs-module-bootmenu_1.0.bb
index 890fef3..f662cb4 100644
--- a/recipes/initrdscripts/initramfs-module-bootmenu_1.0.bb
+++ b/recipes/initrdscripts/initramfs-module-bootmenu_1.0.bb
@@ -1,7 +1,7 @@
 SRC_URI = "file://30-bootmenu.sh"
 PR = "r19"
 DESCRIPTION = "An initramfs module with UI for selection of boot device."
-RDEPENDS_${PN} = "klibc-utils-static-fstype initramfs-uniboot initramfs-module-block initramfs-module-loop initramfs-module-nfs"
+RDEPENDS_${PN} = "klibc-static-utils-fstype initramfs-uniboot initramfs-module-block initramfs-module-loop initramfs-module-nfs"
 # For VFAT mounting.
 RRECOMMENDS_${PN} = "kernel-module-nls-cp437 kernel-module-nls-iso8859-1"
 
diff --git a/recipes/initrdscripts/initramfs-module-kexecboot_1.0.bb b/recipes/initrdscripts/initramfs-module-kexecboot_1.0.bb
index e153d2b..a973b06 100644
--- a/recipes/initrdscripts/initramfs-module-kexecboot_1.0.bb
+++ b/recipes/initrdscripts/initramfs-module-kexecboot_1.0.bb
@@ -1,7 +1,7 @@
 SRC_URI = "file://87-kexecboot.sh"
 PR = "r3"
 DESCRIPTION = "An initramfs module for kexecing kernel from rootfs."
-RDEPENDS_${PN} = "initramfs-uniboot kexec-klibc-static"
+RDEPENDS_${PN} = "initramfs-uniboot kexec-tools-klibc"
 
 do_install() {
 	install -d ${D}/initrd.d
diff --git a/recipes/libgpepimc/libgpepimc-hildon_0.5.bb b/recipes/libgpepimc/libgpepimc-hildon_0.5.bb
deleted file mode 100644
index 12155b9..0000000
--- a/recipes/libgpepimc/libgpepimc-hildon_0.5.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-LICENSE     = "LGPL"
-PR          = "r1"
-DESCRIPTION = "Common code for GPE PIMs (hildon UI version)"
-SECTION = "gpe/libs"
-PRIORITY    = "optional"
-DEPENDS     = "libgpewidget-hildon gtk+ sqlite hildon-lgpl"
-PROVIDES    = "libgepepimc"
-RPROVIDES_${PN}   = "libgepepimc"
-
-SRC_URI     = "${GPE_MIRROR}/libgpepimc-${PV}.tar.bz2"
-
-EXTRA_OECONF = "--enable-hildon"
-S = "${WORKDIR}/libgpepimc-${PV}"
-
-inherit pkgconfig autotools
-
-headers = "pim-categories.h pim-categories-ui.h"
-
-do_stage () {
-	oe_libinstall -so libgpepimc ${STAGING_LIBDIR}
-
-	mkdir -p ${STAGING_INCDIR}/gpe
-	for h in ${headers}; do
-		install -m 0644 ${S}/gpe/$h ${STAGING_INCDIR}/gpe/$h
-	done
-}
-
-
-SRC_URI[md5sum] = "bbb0efe3359510fc0393f3f305c1c6e7"
-SRC_URI[sha256sum] = "b0d1236dbb27f054f8b8a6f8ed4d735db89eb466be641bed67363f4dd76385ad"
diff --git a/recipes/maemo-mapper/maemo-mapper_svn.bb b/recipes/maemo-mapper/maemo-mapper_svn.bb
deleted file mode 100644
index 713a54a..0000000
--- a/recipes/maemo-mapper/maemo-mapper_svn.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "GPS navigation/map display software"
-LICENSE = "GPL"
-DEPENDS = "gdbm libconic sqlite3 gtk+ libhildonfm libosso osso-ic-oss libosso-help gnome-vfs dbus bluez-libs"
-RDEPENDS_${PN} = "bluez-utils"
-RRECOMMENDS_${PN} = "gpsd flite"
-SRCREV = "118"
-PV = "2.0.3+svnr${SRCPV}"
-PR = "r3"
-
-SRC_URI = "svn://garage.maemo.org/svn/maemo-mapper;proto=https;module=trunk \
-           file://mapper-hildon1.diff;maxrev=108" 
-
-S = "${WORKDIR}/trunk"
-
-inherit autotools pkgconfig
-
-do_install_append () {
-	install -d ${D}${datadir}/applications/
-	mv ${D}/maemo-mapper.desktop ${D}${datadir}/applications/
-}
-
-#FILES_${PN} += "${datadir}/icons"
diff --git a/recipes/maemo/hildon-control-panel_0.9.1-1.2.bb b/recipes/maemo/hildon-control-panel_0.9.1-1.2.bb
deleted file mode 100644
index 3c56364..0000000
--- a/recipes/maemo/hildon-control-panel_0.9.1-1.2.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-PR         = "r2"
-LICENSE    = "GPL"
-
-DEPENDS = "hildon-lgpl hildon-base-lib osso-af-settings libosso hildon-libs osso-af-settings libosso-help"
-
-SRC_URI = "http://repository.maemo.org/pool/maemo/ossw/source/h/${PN}/${PN}_${PV}.tar.gz \
-           file://config-path.patch;striplevel=0 \
-           file://noWerror.patch;striplevel=0"
-
-S = "${WORKDIR}/hildon-control-panel-0.9.1"
-
-inherit autotools pkgconfig
-
-FILES_${PN} += "${libdir}/dbus-1.0 ${datadir}/applications"
-
-do_stage() {
-        install -d ${STAGING_INCDIR}/hildon-cp-plugin
-        install -m 644 *.h ${STAGING_INCDIR}/hildon-cp-plugin
-}
-SRC_URI[md5sum] = "72c8b814ebeec8668cea575e08bb1548"
-SRC_URI[sha256sum] = "bbe77d297c7560d3fdad343ab49f23c9c0aa1574db77108d1b97845fb7bb26d5"
diff --git a/recipes/maemo/hildon-status-bar/source.patch b/recipes/maemo/hildon-status-bar/source.patch
deleted file mode 100644
index dd5e82b..0000000
--- a/recipes/maemo/hildon-status-bar/source.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- status-bar-launch.sh.old	2005-06-14 17:12:10.000000000 +0200
-+++ status-bar-launch.sh	2005-06-14 17:12:15.000000000 +0200
-@@ -21,7 +21,7 @@
- # 02110-1301 USA
- #
- 
--source af.conf
-+. af.conf
- 
- if [ "$1" != "start" ] && [ "$1" != "stop" ] && [ "$1" != "restart" ]; then
-   echo "Usage: $0 {start|stop|restart}"
diff --git a/recipes/maemo/hildon-status-bar_0.8.11-1.bb b/recipes/maemo/hildon-status-bar_0.8.11-1.bb
deleted file mode 100644
index 5d6238c..0000000
--- a/recipes/maemo/hildon-status-bar_0.8.11-1.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-PR         = "r1"
-LICENSE    = "GPL"
-
-DEPENDS = "hildon-lgpl libosso hildon-libs"
-
-SRC_URI = "http://repository.maemo.org/pool/maemo/ossw/source/h/${PN}/${PN}_${PV}.tar.gz \
-           file://source.patch;striplevel=0"
-
-S = "${WORKDIR}/hildon-status-bar-0.8.11"
-
-inherit autotools pkgconfig
-
-
-SRC_URI[md5sum] = "7948087bfe3b1bf8025a37fbb64bde44"
-SRC_URI[sha256sum] = "eca16f42de8e4a213acb3ba0978fa56fbdf2f38e5be5882163753068ab4a15cd"
diff --git a/recipes/maemo/lessertunjo_0.0.10.bb b/recipes/maemo/lessertunjo_0.0.10.bb
deleted file mode 100644
index 691893d..0000000
--- a/recipes/maemo/lessertunjo_0.0.10.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-LICENSE =	"LGPL"
-
-DEPENDS =	"gconf-osso hildon-libs dbus libosso"
-SRC_URI =	"http://repository.maemo.org/pool/maemo/ossw/source/l/lessertunjo/lessertunjo_${PV}-3.tar.gz"
-
-inherit  pkgconfig
-
-S = "${WORKDIR}/lessertunjo"
-LDFLAGS += " -losso -L${STAGING_LIBDIR} -I${STAGING_INCDIR}  -I${STAGING_LIBDIR}/dbus-1.0/include -I${STAGING_INCDIR}/dbus-1.0 -I${STAGING_INCDIR}/glib-2.0  -I${STAGING_INCDIR}/gconf/2"
-
-
-do_install() {
-	install -d ${D}${libdir}
-	install -m 755 *so.0.0.10  ${D}${libdir}
-}
-
-do_stage() {
-	oe_libinstall -so libshadowapp libshadowappd  ${STAGING_LIBDIR}
-	install -d ${STAGING_INCDIR}
-	install -m 644 *.h ${STAGING_INCDIR}
-
-}
-
-SRC_URI[md5sum] = "b6d7ca9e9740286f0ce918da9fb8438b"
-SRC_URI[sha256sum] = "0ee6a3caee4812827b8e167d4a07dbf859cb08a00a20f09568c3baae379d6ce8"
diff --git a/recipes/maemo/libosso-help_1.0.01.bb b/recipes/maemo/libosso-help_1.0.01.bb
deleted file mode 100644
index b80d45a..0000000
--- a/recipes/maemo/libosso-help_1.0.01.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-LICENSE = 	"LGPL"
-PR = "r0"
-
-DEPENDS = 	"libosso hildon-lgpl hildon-base-lib hildon-libs"
-SRC_URI =	"http://repository.maemo.org/pool/maemo/ossw/source/libo/${PN}/libosso-help_${PV}.tar.gz \
-                 file://no-Werror.patch;striplevel=0 \
-                 file://help-header-pp.patch;striplevel=0"
-
-inherit pkgconfig autotools
-
-S = "${WORKDIR}/libosso-help-sdk-${PV}"
-
-#FILES_${PN} += "${libdir}/dbus-1.0/services/ ${libdir}/outo/*.so ${libdir}/outo/*bin ${libdir}/outo/mimedummy.doc"
-
-do_stage() {
-	install -d ${STAGING_INCDIR}
-	install -m 644 helplib/*.h ${STAGING_INCDIR}
-	install -m644 helplib/.libs/libossohelp.so ${STAGING_LIBDIR}
-	install -m644 helplib/.libs/libossohelp.so.0 ${STAGING_LIBDIR}
-	install -m644 helplib/.libs/libossohelp.so.0.0.0 ${STAGING_LIBDIR}
-}
-
-SRC_URI[md5sum] = "dbc3c68809e39bd6681aab8ad16ffe3c"
-SRC_URI[sha256sum] = "ef6f6fda31dfbf7b3186b6f1d0ffd12ee0675d9a057ad2994f81b5164213a693"
diff --git a/recipes/maemo/osso-application-installer_1.0.03-1.bb b/recipes/maemo/osso-application-installer_1.0.03-1.bb
deleted file mode 100644
index 3d24f21..0000000
--- a/recipes/maemo/osso-application-installer_1.0.03-1.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-PR         = "r1"
-LICENSE    = "GPL"
-
-DEPENDS = "hildon-lgpl hildon-base-lib libosso hildon-libs hildon-control-panel shared-mime-info"
-RDEPENDS_${PN} = "shared-mime-info"
-
-SRC_URI = "http://repository.maemo.org/pool/maemo/ossw/source/o/${PN}/${PN}_${PV}.tar.gz \
-           file://fix-buildsystem.patch"
-
-S = "${WORKDIR}/osso-application-installer-1.0.03"
-
-inherit autotools pkgconfig
-
-FILES_${PN} += "${libdir}/dbus-1.0 ${libdir}/hildon-control-panel/*.so ${datadir}/applications ${datadir}/mime"
-
-pkg_postinst () {
-  echo "Updating MIME database... this may take a while."
-  ${bindir}/update-mime-database ${datadir}/mime
-}
-
-SRC_URI[md5sum] = "05e47346d432bd4c78736b12f262d612"
-SRC_URI[sha256sum] = "f7129c56cd7e561c10457d101f37ebf3a8b02df83f42a30cb90b46eb0de5dede"
diff --git a/recipes/maemo4/libosso-help_2.1.2.bb b/recipes/maemo4/libosso-help_2.1.2.bb
deleted file mode 100644
index b7b6de5..0000000
--- a/recipes/maemo4/libosso-help_2.1.2.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-LICENSE = "LGPL"
-DESCRIPTION = "Nokia osso help library"
-
-DEPENDS = "libhildonhelp libosso gtkhtml-3.8 libxml2 "
-
-PR = "r0"
-
-SRC_URI = "http://repository.maemo.org/pool/sardine-experimental/main.disabled/source/libo/libosso-help/libosso-help_${PV}-2.tar.gz"
-
-inherit autotools pkgconfig lib_package
-
-S = "${WORKDIR}/2.1.2-2"
-
-do_configure_prepend() {
-	# remove Werror from OSSO_CFLAGS
-	sed -i s:-Werror::g configure.ac
-        sed -i -e s:AC_CONFIG_SRCDIR:#AC_CONFIG_SRCDIR:g configure.ac
-}
-
-SRC_URI[md5sum] = "fc5a1f4598670cec9ac40fb603f80570"
-SRC_URI[sha256sum] = "ecbff97da422f1498eae8f9b8a17389c0ccdd7eee1ca0259f035e712c8e0a405"
diff --git a/recipes/meta/meta-angstrom-2007.bb b/recipes/meta/meta-angstrom-2007.bb
index 8355b10..fbd7f0b 100644
--- a/recipes/meta/meta-angstrom-2007.bb
+++ b/recipes/meta/meta-angstrom-2007.bb
@@ -15,7 +15,6 @@ RDEPENDS_${PN} += " \
 
 # Browsers know to work on all archs
 RDEPENDS_${PN} += " \
-         gpe-mini-browser \
          midori \
 	 minimo \
          openmoko-browser2 \
diff --git a/recipes/meta/meta-maemo.bb b/recipes/meta/meta-maemo.bb
deleted file mode 100644
index ac0dabe..0000000
--- a/recipes/meta/meta-maemo.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION = "Meta-package for maemo environment"
-LICENSE = "MIT"
-PR = "r1"
-
-RDEPENDS_${PN} = "\
-    maemo-task-base \
-    maemo-task-apps \
-    maemo-task-libs-install \
-    maemo-task-theme"
-
-inherit meta
diff --git a/recipes/meta/meta-opie.bb b/recipes/meta/meta-opie.bb
index 0a8ed86..1584765 100644
--- a/recipes/meta/meta-opie.bb
+++ b/recipes/meta/meta-opie.bb
@@ -7,11 +7,13 @@ RDEPENDS_${PN} = "task-opie-applets task-opie-apps task-opie-base \
             task-opie-base-applets task-opie-base-apps \
             task-opie-base-decorations task-opie-base-inputmethods \
             task-opie-base-pim task-opie-base-settings \
-            task-opie-base-styles task-opie-bluetooth \
+            task-opie-base-styles \
+            ${@base_contains("COMBINED_FEATURES", "bluetooth", "task-opie-bluetooth", "",d)} \
             task-opie-datebookplugins task-opie-decorations \
             task-opie-extra-apps task-opie-extra-settings \
             task-opie-extra-styles task-opie-extra-games \
-            task-opie-games task-opie-inputmethods task-opie-irda \
+            ${@base_contains("COMBINED_FEATURES", "irda", "task-opie-irda", "",d)} \
+            task-opie-games task-opie-inputmethods \
             task-opie-multimedia task-opie-pim task-opie-settings \
             task-opie-styles task-opie-todayplugins task-opie-wlan"
 
diff --git a/recipes/meta/meta-toolchain-arago-dvsdk.bb b/recipes/meta/meta-toolchain-arago-dvsdk.bb
index 8e5b233..6deb2bc 100644
--- a/recipes/meta/meta-toolchain-arago-dvsdk.bb
+++ b/recipes/meta/meta-toolchain-arago-dvsdk.bb
@@ -1,3 +1,4 @@
+EXCLUDE_FROM_WORLD = "1"
 TOOLCHAIN_HOST_TASK = "task-arago-toolchain-dvsdk-host"
 TOOLCHAIN_TARGET_TASK = "task-arago-toolchain-dvsdk-target"
 
diff --git a/recipes/minisip/libmsip_svn.bb b/recipes/minisip/libmsip_svn.bb
index 004eaa7..1b1299a 100644
--- a/recipes/minisip/libmsip_svn.bb
+++ b/recipes/minisip/libmsip_svn.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "C++ implementation Session Initiation Protocol (RFC3261)"
 HOMEPAGE = "http://www.minisip.org"
 SECTION = "libs/network"
 PRIORITY = "optional"
-DEPENDS = "libmnetutil0 libmutil0"
+DEPENDS = "libmnetutil libmutil0"
 PV = "0.2.2+svn${SRCDATE}"
 LICENSE = "LGPL"
 
diff --git a/recipes/networkmanager/cnetworkmanager_git.bb b/recipes/networkmanager/cnetworkmanager_git.bb
index d8ec179..5625502 100644
--- a/recipes/networkmanager/cnetworkmanager_git.bb
+++ b/recipes/networkmanager/cnetworkmanager_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Command line interface for Network Manager"
 HOMEPAGE = "http://vidner.net/martin/software/cnetworkmanager/"
 LICENSE = "GPL"
 SECTION = "console/network"
-RDEPENDS_${PN} = "python-core python-crypt python-dbus python-math python-pygobject python-re python-textutils python-uuid python-xml"
+RDEPENDS_${PN} = "python-core python-crypt python-dbus python-math python-pygobject python-re python-textutils python-xml"
 PR = "r2"
 PV = "0.8+git"
 
diff --git a/recipes/nonworking/gpe-mini-browser/files/mini-browser-desktop-fix.patch b/recipes/nonworking/gpe-mini-browser/files/mini-browser-desktop-fix.patch
new file mode 100644
index 0000000..4912abb
--- /dev/null
+++ b/recipes/nonworking/gpe-mini-browser/files/mini-browser-desktop-fix.patch
@@ -0,0 +1,16 @@
+--- gpe-mini-browser-0.21.old/gpe-mini-browser-0.21//gpe-mini-browser.desktop.in.in	2007-01-09 14:53:31.000000000 +0200
++++ gpe-mini-browser-0.21/gpe-mini-browser.desktop.in.in	2007-12-11 20:45:04.749584640 +0200
+@@ -2,9 +2,8 @@
+ _Name=Mini Web Browser
+ _Comment=Browse the web
+ Exec=gpe-mini-browser
+-Terminal=0
++Terminal=false
+ Type=Application
+-Icon=gpe-mini-browser.png
+-Categories=Application;PIM;GPE
+-StartupNotify=True
+-
++Icon=gpe-mini-browser
++Categories=X-GPE;X-PIM;X-Internet;X-Browser;
++StartupNotify=true
diff --git a/recipes/nonworking/gpe-mini-browser/gpe-mini-browser-hildon_0.15.bb b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser-hildon_0.15.bb
new file mode 100644
index 0000000..faa9131
--- /dev/null
+++ b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser-hildon_0.15.bb
@@ -0,0 +1,54 @@
+require gpe-mini-browser.inc
+
+PR = "r0"
+
+SRC_URI      = "${GPE_MIRROR}/gpe-mini-browser-${PV}.tar.gz"
+DEPENDS      = "osb-nrcit libosso hildon-lgpl hildon-fm libgpewidget"
+EXTRA_OECONF = "--enable-hildon"
+
+S = "${WORKDIR}/gpe-mini-browser-${PV}"
+
+inherit autotools
+
+do_install() {
+		install -d ${D}/usr/share/applications/hildon
+		install -m 0644 ${S}/hildon/gpe-mini-browser.desktop ${D}/usr/share/applications/hildon/gpe-mini-browser.desktop
+		install -d ${D}/usr/share/pixmaps
+		install -m 0644 ${S}/gpe-mini-browser.png ${D}/usr/share/pixmaps/gpe-mini-browser.png
+		autotools_do_install
+}
+
+pkg_postinst_${PN}-doc () {
+        #!/bin/sh
+	if [ "x$D" != "x" ]; then
+        if [ -e /etc/gpe/gpe-help.conf ]; then
+                echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
+        else
+                 echo [Help] >> /etc/gpe/gpe-help.conf
+                 echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
+        fi
+        if [ -x /usr/bin/gpe-helpindex ]; then
+                echo generating help-index
+                gpe-helpindex
+        else
+                echo not generating index for gpe-mini-browser
+        fi
+	fi
+}
+
+pkg_postrm_${PN}-doc () {
+        #!/bin/sh
+        if [ -e /etc/gpe/gpe-help.conf ]; then
+                sed '/^\<gpe-mini-browser\>/d' /etc/gpe/gpe-help.conf > /tmp/gpe-help.conf
+                mv /tmp/gpe-help.conf /etc/gpe/gpe-help.conf
+        fi
+        if [ -x /usr/bin/gpe-helpindex ]; then
+                echo generating help-index
+                gpe-helpindex
+        else
+                echo not generating index for gpe-mini-browser
+        fi
+}
+
+SRC_URI[md5sum] = "b048cee7254d7fe6eb1e2821ce8706df"
+SRC_URI[sha256sum] = "aa9c2dbe8d763b4461a42d46378cc49335a266a7d6dcd794ecd46fac037c8913"
diff --git a/recipes/nonworking/gpe-mini-browser/gpe-mini-browser-hildon_0.16.bb b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser-hildon_0.16.bb
new file mode 100644
index 0000000..370017a
--- /dev/null
+++ b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser-hildon_0.16.bb
@@ -0,0 +1,55 @@
+require gpe-mini-browser.inc
+
+PR = "r0"
+
+SRC_URI      = "${GPE_MIRROR}/gpe-mini-browser-${PV}.tar.gz"
+DESCRIPTION  = "A lightweight webbrowser for the GPE platform (Hildon UI)"
+DEPENDS      = "osb-nrcit libosso hildon-lgpl hildon-fm libgpewidget"
+EXTRA_OECONF = "--enable-hildon"
+
+S = "${WORKDIR}/gpe-mini-browser-${PV}"
+
+inherit autotools
+
+do_install() {
+		install -d ${D}/usr/share/applications/hildon
+		install -m 0644 ${S}/hildon/gpe-mini-browser.desktop ${D}/usr/share/applications/hildon/gpe-mini-browser.desktop
+		install -d ${D}/usr/share/pixmaps
+		install -m 0644 ${S}/gpe-mini-browser.png ${D}/usr/share/pixmaps/gpe-mini-browser.png
+		autotools_do_install
+}
+
+pkg_postinst_${PN}-doc () {
+        #!/bin/sh
+	if [ "x$D" != "x" ]; then
+        if [ -e /etc/gpe/gpe-help.conf ]; then
+                echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
+        else
+                 echo [Help] >> /etc/gpe/gpe-help.conf
+                 echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
+        fi
+        if [ -x /usr/bin/gpe-helpindex ]; then
+                echo generating help-index
+                gpe-helpindex
+        else
+                echo not generating index for gpe-mini-browser
+        fi
+	fi
+}
+
+pkg_postrm_${PN}-doc () {
+        #!/bin/sh
+        if [ -e /etc/gpe/gpe-help.conf ]; then
+                sed '/^\<gpe-mini-browser\>/d' /etc/gpe/gpe-help.conf > /tmp/gpe-help.conf
+                mv /tmp/gpe-help.conf /etc/gpe/gpe-help.conf
+        fi
+        if [ -x /usr/bin/gpe-helpindex ]; then
+                echo generating help-index
+                gpe-helpindex
+        else
+                echo not generating index for gpe-mini-browser
+        fi
+}
+
+SRC_URI[md5sum] = "858f3e7219cde7b18e69293526020416"
+SRC_URI[sha256sum] = "36d2487895d3579ae3e8693ebe789b5de454506fc572937dac2fb7ef512f105f"
diff --git a/recipes/nonworking/gpe-mini-browser/gpe-mini-browser-hildon_0.17.bb b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser-hildon_0.17.bb
new file mode 100644
index 0000000..692f418
--- /dev/null
+++ b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser-hildon_0.17.bb
@@ -0,0 +1,25 @@
+require gpe-mini-browser.inc
+
+PR = "r0"
+
+SRC_URI      = "${GPE_MIRROR}/gpe-mini-browser-${PV}.tar.gz"
+DESCRIPTION  = "A lightweight webbrowser for the GPE platform (Hildon UI)"
+DEPENDS      = "osb-nrcit libosso hildon-lgpl hildon-fm libgpewidget"
+EXTRA_OECONF = "--enable-hildon"
+
+S = "${WORKDIR}/gpe-mini-browser-${PV}"
+
+inherit autotools
+
+do_install() {
+		install -d ${D}/usr/share/applications/hildon
+		install -m 0644 ${S}/hildon/gpe-mini-browser.desktop ${D}/usr/share/applications/hildon/gpe-mini-browser.desktop
+		install -d ${D}/usr/share/pixmaps
+		install -m 0644 ${S}/gpe-mini-browser.png ${D}/usr/share/pixmaps/gpe-mini-browser.png
+		autotools_do_install
+}
+
+
+
+SRC_URI[md5sum] = "749c571ec28e2ea4f31602f3d5609e4b"
+SRC_URI[sha256sum] = "19d345571344f65e35b06c3faad6cfc86afeb8a41533d39bfbf364e1da34188c"
diff --git a/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.15.bb b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.15.bb
new file mode 100644
index 0000000..68d8020
--- /dev/null
+++ b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.15.bb
@@ -0,0 +1,55 @@
+require gpe-mini-browser.inc
+
+PR = "r1"
+
+SRC_URI = "ftp://ftp.handhelds.org/projects/gpe/source/gpe-mini-browser-${PV}.tar.gz"
+DEPENDS = "osb-nrcit libgpewidget"
+
+S = "${WORKDIR}/gpe-mini-browser-${PV}"
+
+inherit autotools
+
+do_install() {
+	#	install -d ${D}${docdir}/gpe
+	#	install -m 0644 ${S}/gpe-mini-browser.html  ${D}${docdir}/gpe/
+		install -d ${D}/usr/share/applications
+		install -m 0644 ${S}/gpe-mini-browser.desktop ${D}/usr/share/applications/gpe-mini-browser.desktop
+		install -d ${D}/usr/share/pixmaps
+		install -m 0644 ${S}/gpe-mini-browser.png ${D}/usr/share/pixmaps/gpe-mini-browser.png
+		autotools_do_install
+}
+
+pkg_postinst_${PN}-doc () {
+        #!/bin/sh
+	if [ "x$D" != "x" ]; then
+        if [ -e /etc/gpe/gpe-help.conf ]; then
+                echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
+        else
+                 echo [Help] >> /etc/gpe/gpe-help.conf
+                 echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
+        fi
+        if [ -x /usr/bin/gpe-helpindex ]; then
+                echo generating help-index
+                gpe-helpindex
+        else
+                echo not generating index for gpe-mini-browser
+        fi
+	fi
+}
+
+pkg_postrm_${PN}-doc () {
+        #!/bin/sh
+        if [ -e /etc/gpe/gpe-help.conf ]; then
+                sed '/^\<gpe-mini-browser\>/d' /etc/gpe/gpe-help.conf > /tmp/gpe-help.conf
+                mv /tmp/gpe-help.conf /etc/gpe/gpe-help.conf
+        fi
+        if [ -x /usr/bin/gpe-helpindex ]; then
+                echo generating help-index
+                gpe-helpindex
+        else
+                echo not generating index for gpe-mini-browser
+        fi
+}
+
+SRC_URI[md5sum] = "b048cee7254d7fe6eb1e2821ce8706df"
+SRC_URI[sha256sum] = "aa9c2dbe8d763b4461a42d46378cc49335a266a7d6dcd794ecd46fac037c8913"
diff --git a/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.16.bb b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.16.bb
new file mode 100644
index 0000000..e83467c
--- /dev/null
+++ b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.16.bb
@@ -0,0 +1,55 @@
+require gpe-mini-browser.inc
+
+PR = "r1"
+
+SRC_URI = "ftp://ftp.handhelds.org/projects/gpe/source/gpe-mini-browser-${PV}.tar.gz"
+DEPENDS = "osb-nrcit sqlite libgpewidget"
+
+S = "${WORKDIR}/gpe-mini-browser-${PV}"
+
+inherit autotools
+
+do_install() {
+	#	install -d ${D}${docdir}/gpe
+	#	install -m 0644 ${S}/gpe-mini-browser.html  ${D}${docdir}/gpe/
+		install -d ${D}/usr/share/applications
+		install -m 0644 ${S}/gpe-mini-browser.desktop ${D}/usr/share/applications/gpe-mini-browser.desktop
+		install -d ${D}/usr/share/pixmaps
+		install -m 0644 ${S}/gpe-mini-browser.png ${D}/usr/share/pixmaps/gpe-mini-browser.png
+		autotools_do_install
+}
+
+pkg_postinst_${PN}-doc () {
+        #!/bin/sh
+	if [ "x$D" != "x" ]; then
+        if [ -e /etc/gpe/gpe-help.conf ]; then
+                echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
+        else
+                 echo [Help] >> /etc/gpe/gpe-help.conf
+                 echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
+        fi
+        if [ -x /usr/bin/gpe-helpindex ]; then
+                echo generating help-index
+                gpe-helpindex
+        else
+                echo not generating index for gpe-mini-browser
+        fi
+	fi
+}
+
+pkg_postrm_${PN}-doc () {
+        #!/bin/sh
+        if [ -e /etc/gpe/gpe-help.conf ]; then
+                sed '/^\<gpe-mini-browser\>/d' /etc/gpe/gpe-help.conf > /tmp/gpe-help.conf
+                mv /tmp/gpe-help.conf /etc/gpe/gpe-help.conf
+        fi
+        if [ -x /usr/bin/gpe-helpindex ]; then
+                echo generating help-index
+                gpe-helpindex
+        else
+                echo not generating index for gpe-mini-browser
+        fi
+}
+
+SRC_URI[md5sum] = "858f3e7219cde7b18e69293526020416"
+SRC_URI[sha256sum] = "36d2487895d3579ae3e8693ebe789b5de454506fc572937dac2fb7ef512f105f"
diff --git a/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.17.bb b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.17.bb
new file mode 100644
index 0000000..5499ca3
--- /dev/null
+++ b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.17.bb
@@ -0,0 +1,54 @@
+require gpe-mini-browser.inc
+
+SRC_URI = "ftp://ftp.handhelds.org/projects/gpe/source/gpe-mini-browser-${PV}.tar.gz"
+DEPENDS = "osb-nrcit sqlite libgpewidget"
+RRECOMMENDS_${PN} = "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-pixbuf-loader-jpeg"
+
+
+S = "${WORKDIR}/gpe-mini-browser-${PV}"
+
+inherit autotools
+
+do_install() {
+		install -d ${D}/usr/share/applications
+		install -m 0644 ${S}/gpe-mini-browser.desktop ${D}/usr/share/applications/gpe-mini-browser.desktop
+		install -d ${D}/usr/share/pixmaps
+		install -m 0644 ${S}/gpe-mini-browser.png ${D}/usr/share/pixmaps/gpe-mini-browser.png
+		autotools_do_install
+}
+
+pkg_postinst_${PN}-doc () {
+        #!/bin/sh
+	if [ "x$D" != "x" ]; then
+        if [ -e /etc/gpe/gpe-help.conf ]; then
+                echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
+        else
+                 echo [Help] >> /etc/gpe/gpe-help.conf
+                 echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
+        fi
+        if [ -x /usr/bin/gpe-helpindex ]; then
+                echo generating help-index
+                gpe-helpindex
+        else
+                echo not generating index for gpe-mini-browser
+        fi
+	fi
+}
+
+pkg_postrm_${PN}-doc () {
+        #!/bin/sh
+        if [ -e /etc/gpe/gpe-help.conf ]; then
+                sed '/^\<gpe-mini-browser\>/d' /etc/gpe/gpe-help.conf > /tmp/gpe-help.conf
+                mv /tmp/gpe-help.conf /etc/gpe/gpe-help.conf
+        fi
+        if [ -x /usr/bin/gpe-helpindex ]; then
+                echo generating help-index
+                gpe-helpindex
+        else
+                echo not generating index for gpe-mini-browser
+        fi
+}
+
+
+SRC_URI[md5sum] = "749c571ec28e2ea4f31602f3d5609e4b"
+SRC_URI[sha256sum] = "19d345571344f65e35b06c3faad6cfc86afeb8a41533d39bfbf364e1da34188c"
diff --git a/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.18.bb b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.18.bb
new file mode 100644
index 0000000..9c67dcc
--- /dev/null
+++ b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.18.bb
@@ -0,0 +1,51 @@
+require gpe-mini-browser.inc
+
+SRC_URI = "ftp://ftp.handhelds.org/projects/gpe/source/gpe-mini-browser-${PV}.tar.gz"
+DEPENDS = "osb-nrcit sqlite libgpewidget"
+RRECOMMENDS_${PN} = "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-pixbuf-loader-jpeg"
+
+
+S = "${WORKDIR}/gpe-mini-browser-${PV}"
+
+inherit autotools
+
+do_install() {
+		install -d ${D}/usr/share/applications
+		install -m 0644 ${S}/gpe-mini-browser.desktop ${D}/usr/share/applications/gpe-mini-browser.desktop
+		install -d ${D}/usr/share/pixmaps
+		install -m 0644 ${S}/gpe-mini-browser.png ${D}/usr/share/pixmaps/gpe-mini-browser.png
+		autotools_do_install
+}
+
+pkg_postinst_${PN}-doc () {
+        #!/bin/sh
+	if [ "x$D" != "x" ]; then
+        if [ -e /etc/gpe/gpe-help.conf ]; then
+                echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
+        else
+                 echo [Help] >> /etc/gpe/gpe-help.conf
+                 echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
+        fi
+        if [ -x /usr/bin/gpe-helpindex ]; then
+                echo generating help-index
+                gpe-helpindex
+        else
+                echo not generating index for gpe-mini-browser
+        fi
+	fi
+}
+
+pkg_postrm_${PN}-doc () {
+        #!/bin/sh
+        if [ -e /etc/gpe/gpe-help.conf ]; then
+                sed '/^\<gpe-mini-browser\>/d' /etc/gpe/gpe-help.conf > /tmp/gpe-help.conf
+                mv /tmp/gpe-help.conf /etc/gpe/gpe-help.conf
+        fi
+        if [ -x /usr/bin/gpe-helpindex ]; then
+                echo generating help-index
+                gpe-helpindex
+        else
+                echo not generating index for gpe-mini-browser
+        fi
+}
+
diff --git a/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.19.bb b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.19.bb
new file mode 100644
index 0000000..0a9c78d
--- /dev/null
+++ b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.19.bb
@@ -0,0 +1,55 @@
+require gpe-mini-browser.inc
+
+SRC_URI = "http://gpe.linuxtogo.org/download/source/gpe-mini-browser-${PV}.tar.gz"
+DEPENDS = "osb-nrcit sqlite libgpewidget"
+RRECOMMENDS_${PN} = "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-pixbuf-loader-jpeg"
+
+PR = "r2"
+
+S = "${WORKDIR}/gpe-mini-browser-${PV}"
+
+inherit autotools
+
+do_install() {
+		install -d ${D}/usr/share/applications
+		install -m 0644 ${S}/gpe-mini-browser.desktop ${D}/usr/share/applications/gpe-mini-browser.desktop
+		install -d ${D}/usr/share/pixmaps
+		install -m 0644 ${S}/gpe-mini-browser.png ${D}/usr/share/pixmaps/gpe-mini-browser.png
+		autotools_do_install
+}
+
+pkg_postinst_${PN}-doc () {
+        #!/bin/sh
+	if [ "x$D" != "x" ]; then
+        if [ -e /etc/gpe/gpe-help.conf ]; then
+                echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
+        else
+                 echo [Help] >> /etc/gpe/gpe-help.conf
+                 echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
+        fi
+        if [ -x /usr/bin/gpe-helpindex ]; then
+                echo generating help-index
+                gpe-helpindex
+        else
+                echo not generating index for gpe-mini-browser
+        fi
+	fi
+}
+
+pkg_postrm_${PN}-doc () {
+        #!/bin/sh
+        if [ -e /etc/gpe/gpe-help.conf ]; then
+                sed '/^\<gpe-mini-browser\>/d' /etc/gpe/gpe-help.conf > /tmp/gpe-help.conf
+                mv /tmp/gpe-help.conf /etc/gpe/gpe-help.conf
+        fi
+        if [ -x /usr/bin/gpe-helpindex ]; then
+                echo generating help-index
+                gpe-helpindex
+        else
+                echo not generating index for gpe-mini-browser
+        fi
+}
+
+
+SRC_URI[md5sum] = "922640f40f67d15892d9ea8ec6c8ffea"
+SRC_URI[sha256sum] = "ece034b916a7760cfb854baab474b7931246bdb078c814366bf90a9fbff246af"
diff --git a/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.20.bb b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.20.bb
new file mode 100644
index 0000000..1bff97b
--- /dev/null
+++ b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.20.bb
@@ -0,0 +1,55 @@
+require gpe-mini-browser.inc
+
+SRC_URI = "http://gpe.linuxtogo.org/download/source/gpe-mini-browser-${PV}.tar.gz"
+DEPENDS = "osb-nrcit sqlite libgpewidget"
+RRECOMMENDS_${PN} = "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-pixbuf-loader-jpeg"
+
+PR = "r2"
+
+S = "${WORKDIR}/gpe-mini-browser-${PV}"
+
+inherit autotools
+
+do_install() {
+		install -d ${D}/usr/share/applications
+		install -m 0644 ${S}/gpe-mini-browser.desktop ${D}/usr/share/applications/gpe-mini-browser.desktop
+		install -d ${D}/usr/share/pixmaps
+		install -m 0644 ${S}/gpe-mini-browser.png ${D}/usr/share/pixmaps/gpe-mini-browser.png
+		autotools_do_install
+}
+
+pkg_postinst_${PN}-doc () {
+        #!/bin/sh
+	if [ "x$D" != "x" ]; then
+        if [ -e /etc/gpe/gpe-help.conf ]; then
+                echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
+        else
+                 echo [Help] >> /etc/gpe/gpe-help.conf
+                 echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
+        fi
+        if [ -x /usr/bin/gpe-helpindex ]; then
+                echo generating help-index
+                gpe-helpindex
+        else
+                echo not generating index for gpe-mini-browser
+        fi
+	fi
+}
+
+pkg_postrm_${PN}-doc () {
+        #!/bin/sh
+        if [ -e /etc/gpe/gpe-help.conf ]; then
+                sed '/^\<gpe-mini-browser\>/d' /etc/gpe/gpe-help.conf > /tmp/gpe-help.conf
+                mv /tmp/gpe-help.conf /etc/gpe/gpe-help.conf
+        fi
+        if [ -x /usr/bin/gpe-helpindex ]; then
+                echo generating help-index
+                gpe-helpindex
+        else
+                echo not generating index for gpe-mini-browser
+        fi
+}
+
+
+SRC_URI[md5sum] = "1a7a4095cafed9cda21e500842b686a1"
+SRC_URI[sha256sum] = "ddba5fea0424c9c121269e96ea202014a29568263d478ac5682022973d2986f1"
diff --git a/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.21.bb b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.21.bb
new file mode 100644
index 0000000..824a416
--- /dev/null
+++ b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.21.bb
@@ -0,0 +1,57 @@
+require gpe-mini-browser.inc
+
+SRC_URI = "http://gpe.linuxtogo.org/download/source/gpe-mini-browser-${PV}.tar.gz"
+DEPENDS = "osb-nrcit sqlite libgpewidget"
+RRECOMMENDS_${PN} = "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-pixbuf-loader-jpeg"
+
+PR = "r2"
+
+SRC_URI += "file://mini-browser-desktop-fix.patch"
+
+S = "${WORKDIR}/gpe-mini-browser-${PV}"
+
+inherit autotools
+
+do_install() {
+		install -d ${D}/usr/share/applications
+		install -m 0644 ${S}/gpe-mini-browser.desktop ${D}/usr/share/applications/gpe-mini-browser.desktop
+		install -d ${D}/usr/share/pixmaps
+		install -m 0644 ${S}/gpe-mini-browser.png ${D}/usr/share/pixmaps/gpe-mini-browser.png
+		autotools_do_install
+}
+
+pkg_postinst_${PN}-doc () {
+        #!/bin/sh
+	if [ "x$D" != "x" ]; then
+        if [ -e /etc/gpe/gpe-help.conf ]; then
+                echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
+        else
+                 echo [Help] >> /etc/gpe/gpe-help.conf
+                 echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
+        fi
+        if [ -x /usr/bin/gpe-helpindex ]; then
+                echo generating help-index
+                gpe-helpindex
+        else
+                echo not generating index for gpe-mini-browser
+        fi
+	fi
+}
+
+pkg_postrm_${PN}-doc () {
+        #!/bin/sh
+        if [ -e /etc/gpe/gpe-help.conf ]; then
+                sed '/^\<gpe-mini-browser\>/d' /etc/gpe/gpe-help.conf > /tmp/gpe-help.conf
+                mv /tmp/gpe-help.conf /etc/gpe/gpe-help.conf
+        fi
+        if [ -x /usr/bin/gpe-helpindex ]; then
+                echo generating help-index
+                gpe-helpindex
+        else
+                echo not generating index for gpe-mini-browser
+        fi
+}
+
+
+SRC_URI[md5sum] = "a1297dfd14c008e3415f89b01eef75cd"
+SRC_URI[sha256sum] = "ec0358d104fa992f1437b37cdf70e83ab152794d2989ef2e9715ab8659dc46e3"
diff --git a/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_svn.bb b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_svn.bb
new file mode 100644
index 0000000..0ebff73
--- /dev/null
+++ b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_svn.bb
@@ -0,0 +1,55 @@
+DEPENDS = "sqlite gettext gtk+ glib-2.0 osb-nrcit libgpewidget"
+RRECOMMENDS_${PN} = "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-pixbuf-loader-jpeg"
+
+SRCREV = "9900"
+PV = "0.20+svn${SRCDATE}"
+PR = "r1"
+
+inherit autotools
+
+SRC_URI = "${GPE_EXTRA_SVN}"
+
+S = "${WORKDIR}/gpe-mini-browser"
+
+do_install() {
+                install -d ${D}/usr/share/applications
+                install -m 0644 ${S}/gpe-mini-browser.desktop ${D}/usr/share/applications/gpe-mini-browser.desktop
+                install -d ${D}/usr/share/pixmaps
+                install -m 0644 ${S}/gpe-mini-browser.png ${D}/usr/share/pixmaps/gpe-mini-browser.png
+                autotools_do_install
+}
+
+pkg_postinst_${PN}-doc () {
+        #!/bin/sh
+        if [ "x$D" != "x" ]; then
+        if [ -e /etc/gpe/gpe-help.conf ]; then
+                echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
+        else
+                 echo [Help] >> /etc/gpe/gpe-help.conf
+                 echo gpe-mini-browser= /usr/share/doc/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
+        fi
+        if [ -x /usr/bin/gpe-helpindex ]; then
+                echo generating help-index
+                gpe-helpindex
+        else
+                echo not generating index for gpe-mini-browser
+        fi
+        fi
+}
+pkg_postrm_${PN}-doc () {
+        #!/bin/sh
+        if [ -e /etc/gpe/gpe-help.conf ]; then
+                sed '/^\<gpe-mini-browser\>/d' /etc/gpe/gpe-help.conf > /tmp/gpe-help.conf
+                mv /tmp/gpe-help.conf /etc/gpe/gpe-help.conf
+        fi
+        if [ -x /usr/bin/gpe-helpindex ]; then
+                echo generating help-index
+                gpe-helpindex
+        else
+                echo not generating index for gpe-mini-browser
+        fi
+}
+
+require gpe-mini-browser.inc
+
+#DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/nonworking/gpe-todo/gpe-todo-hildon_0.54.bb b/recipes/nonworking/gpe-todo/gpe-todo-hildon_0.54.bb
new file mode 100644
index 0000000..9954d51
--- /dev/null
+++ b/recipes/nonworking/gpe-todo/gpe-todo-hildon_0.54.bb
@@ -0,0 +1,20 @@
+LICENSE     = "GPL"
+PR          = "r1"
+DESCRIPTION = "GPE to-do list"
+DEPENDS     = "libgpewidget-hildon libgpepimc-hildon libtododb sdk-default-icons libosso"
+RDEPENDS_${PN}    = "sdk-default-icons"
+SECTION = "gpe"
+PRIORITY    = "optional"
+
+inherit gpe autotools pkgconfig
+
+EXTRA_OECONF = "--enable-hildon"
+
+SRC_URI="${GPE_MIRROR}/gpe-todo-${PV}.tar.bz2"
+
+S = "${WORKDIR}/gpe-todo-${PV}"
+
+FILES_${PN} += "${datadir}/gpe-todo ${libdir}/dbus-1.0"
+
+SRC_URI[md5sum] = "8fdd52954a7a29691013900b65eb5702"
+SRC_URI[sha256sum] = "b3f51635b3ce6408fdfbd0283e1d8036c23b6ecb5adf0d66882e7e48eb5d97b9"
diff --git a/recipes/nonworking/gpe-todo/gpe-todo-hildon_0.55.bb b/recipes/nonworking/gpe-todo/gpe-todo-hildon_0.55.bb
new file mode 100644
index 0000000..d71f862
--- /dev/null
+++ b/recipes/nonworking/gpe-todo/gpe-todo-hildon_0.55.bb
@@ -0,0 +1,20 @@
+LICENSE     = "GPL"
+PR          = "r1"
+DESCRIPTION = "GPE to-do list"
+DEPENDS     = "libgpewidget-hildon libgpepimc-hildon libtododb sdk-default-icons libosso"
+RDEPENDS_${PN}    = "sdk-default-icons"
+SECTION = "gpe"
+PRIORITY    = "optional"
+
+inherit gpe autotools pkgconfig
+
+EXTRA_OECONF = "--enable-hildon"
+
+SRC_URI="${GPE_MIRROR}/gpe-todo-${PV}.tar.bz2"
+
+S = "${WORKDIR}/gpe-todo-${PV}"
+
+FILES_${PN} += "${datadir}/gpe-todo ${libdir}/dbus-1.0"
+
+SRC_URI[md5sum] = "e8c08165d9723779473e3390a949afac"
+SRC_URI[sha256sum] = "ec2ef95c967acce5834c8b4985c610014c16242d223d233947d67b4514ebe298"
diff --git a/recipes/nonworking/images/maemo-image.bb b/recipes/nonworking/images/maemo-image.bb
new file mode 100644
index 0000000..c0498bb
--- /dev/null
+++ b/recipes/nonworking/images/maemo-image.bb
@@ -0,0 +1,20 @@
+#
+# Meta package for maemo based system image
+#
+
+GUI_MACHINE_CLASS ?= "none"
+
+MAEMO_EXTRA_DEPENDS = "scap dosfstools"
+MAEMO_EXTRA_INSTALL = "osso-af-services osso-af-base-apps scap dosfstools"
+
+XSERVER ?= "xserver-kdrive-omap"
+
+DEPENDS = "${MACHINE_TASK_PROVIDER} \
+	   meta-maemo \
+	   ${MAEMO_EXTRA_DEPENDS}"
+
+IMAGE_INSTALL = "${MACHINE_TASK_PROVIDER} maemo-task-base maemo-task-theme \
+	               maemo-task-apps ${MAEMO_EXTRA_INSTALL} \
+		       ${XSERVER}"
+
+inherit image
diff --git a/recipes/nonworking/libgpepimc/libgpepimc-hildon_0.5.bb b/recipes/nonworking/libgpepimc/libgpepimc-hildon_0.5.bb
new file mode 100644
index 0000000..12155b9
--- /dev/null
+++ b/recipes/nonworking/libgpepimc/libgpepimc-hildon_0.5.bb
@@ -0,0 +1,30 @@
+LICENSE     = "LGPL"
+PR          = "r1"
+DESCRIPTION = "Common code for GPE PIMs (hildon UI version)"
+SECTION = "gpe/libs"
+PRIORITY    = "optional"
+DEPENDS     = "libgpewidget-hildon gtk+ sqlite hildon-lgpl"
+PROVIDES    = "libgepepimc"
+RPROVIDES_${PN}   = "libgepepimc"
+
+SRC_URI     = "${GPE_MIRROR}/libgpepimc-${PV}.tar.bz2"
+
+EXTRA_OECONF = "--enable-hildon"
+S = "${WORKDIR}/libgpepimc-${PV}"
+
+inherit pkgconfig autotools
+
+headers = "pim-categories.h pim-categories-ui.h"
+
+do_stage () {
+	oe_libinstall -so libgpepimc ${STAGING_LIBDIR}
+
+	mkdir -p ${STAGING_INCDIR}/gpe
+	for h in ${headers}; do
+		install -m 0644 ${S}/gpe/$h ${STAGING_INCDIR}/gpe/$h
+	done
+}
+
+
+SRC_URI[md5sum] = "bbb0efe3359510fc0393f3f305c1c6e7"
+SRC_URI[sha256sum] = "b0d1236dbb27f054f8b8a6f8ed4d735db89eb466be641bed67363f4dd76385ad"
diff --git a/recipes/nonworking/maemo-mapper/maemo-mapper_svn.bb b/recipes/nonworking/maemo-mapper/maemo-mapper_svn.bb
new file mode 100644
index 0000000..713a54a
--- /dev/null
+++ b/recipes/nonworking/maemo-mapper/maemo-mapper_svn.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "GPS navigation/map display software"
+LICENSE = "GPL"
+DEPENDS = "gdbm libconic sqlite3 gtk+ libhildonfm libosso osso-ic-oss libosso-help gnome-vfs dbus bluez-libs"
+RDEPENDS_${PN} = "bluez-utils"
+RRECOMMENDS_${PN} = "gpsd flite"
+SRCREV = "118"
+PV = "2.0.3+svnr${SRCPV}"
+PR = "r3"
+
+SRC_URI = "svn://garage.maemo.org/svn/maemo-mapper;proto=https;module=trunk \
+           file://mapper-hildon1.diff;maxrev=108" 
+
+S = "${WORKDIR}/trunk"
+
+inherit autotools pkgconfig
+
+do_install_append () {
+	install -d ${D}${datadir}/applications/
+	mv ${D}/maemo-mapper.desktop ${D}${datadir}/applications/
+}
+
+#FILES_${PN} += "${datadir}/icons"
diff --git a/recipes/nonworking/maemo/hildon-control-panel_0.9.1-1.2.bb b/recipes/nonworking/maemo/hildon-control-panel_0.9.1-1.2.bb
new file mode 100644
index 0000000..3c56364
--- /dev/null
+++ b/recipes/nonworking/maemo/hildon-control-panel_0.9.1-1.2.bb
@@ -0,0 +1,21 @@
+PR         = "r2"
+LICENSE    = "GPL"
+
+DEPENDS = "hildon-lgpl hildon-base-lib osso-af-settings libosso hildon-libs osso-af-settings libosso-help"
+
+SRC_URI = "http://repository.maemo.org/pool/maemo/ossw/source/h/${PN}/${PN}_${PV}.tar.gz \
+           file://config-path.patch;striplevel=0 \
+           file://noWerror.patch;striplevel=0"
+
+S = "${WORKDIR}/hildon-control-panel-0.9.1"
+
+inherit autotools pkgconfig
+
+FILES_${PN} += "${libdir}/dbus-1.0 ${datadir}/applications"
+
+do_stage() {
+        install -d ${STAGING_INCDIR}/hildon-cp-plugin
+        install -m 644 *.h ${STAGING_INCDIR}/hildon-cp-plugin
+}
+SRC_URI[md5sum] = "72c8b814ebeec8668cea575e08bb1548"
+SRC_URI[sha256sum] = "bbe77d297c7560d3fdad343ab49f23c9c0aa1574db77108d1b97845fb7bb26d5"
diff --git a/recipes/nonworking/maemo/hildon-status-bar/source.patch b/recipes/nonworking/maemo/hildon-status-bar/source.patch
new file mode 100644
index 0000000..dd5e82b
--- /dev/null
+++ b/recipes/nonworking/maemo/hildon-status-bar/source.patch
@@ -0,0 +1,11 @@
+--- status-bar-launch.sh.old	2005-06-14 17:12:10.000000000 +0200
++++ status-bar-launch.sh	2005-06-14 17:12:15.000000000 +0200
+@@ -21,7 +21,7 @@
+ # 02110-1301 USA
+ #
+ 
+-source af.conf
++. af.conf
+ 
+ if [ "$1" != "start" ] && [ "$1" != "stop" ] && [ "$1" != "restart" ]; then
+   echo "Usage: $0 {start|stop|restart}"
diff --git a/recipes/nonworking/maemo/hildon-status-bar_0.8.11-1.bb b/recipes/nonworking/maemo/hildon-status-bar_0.8.11-1.bb
new file mode 100644
index 0000000..5d6238c
--- /dev/null
+++ b/recipes/nonworking/maemo/hildon-status-bar_0.8.11-1.bb
@@ -0,0 +1,15 @@
+PR         = "r1"
+LICENSE    = "GPL"
+
+DEPENDS = "hildon-lgpl libosso hildon-libs"
+
+SRC_URI = "http://repository.maemo.org/pool/maemo/ossw/source/h/${PN}/${PN}_${PV}.tar.gz \
+           file://source.patch;striplevel=0"
+
+S = "${WORKDIR}/hildon-status-bar-0.8.11"
+
+inherit autotools pkgconfig
+
+
+SRC_URI[md5sum] = "7948087bfe3b1bf8025a37fbb64bde44"
+SRC_URI[sha256sum] = "eca16f42de8e4a213acb3ba0978fa56fbdf2f38e5be5882163753068ab4a15cd"
diff --git a/recipes/nonworking/maemo/lessertunjo_0.0.10.bb b/recipes/nonworking/maemo/lessertunjo_0.0.10.bb
new file mode 100644
index 0000000..691893d
--- /dev/null
+++ b/recipes/nonworking/maemo/lessertunjo_0.0.10.bb
@@ -0,0 +1,25 @@
+LICENSE =	"LGPL"
+
+DEPENDS =	"gconf-osso hildon-libs dbus libosso"
+SRC_URI =	"http://repository.maemo.org/pool/maemo/ossw/source/l/lessertunjo/lessertunjo_${PV}-3.tar.gz"
+
+inherit  pkgconfig
+
+S = "${WORKDIR}/lessertunjo"
+LDFLAGS += " -losso -L${STAGING_LIBDIR} -I${STAGING_INCDIR}  -I${STAGING_LIBDIR}/dbus-1.0/include -I${STAGING_INCDIR}/dbus-1.0 -I${STAGING_INCDIR}/glib-2.0  -I${STAGING_INCDIR}/gconf/2"
+
+
+do_install() {
+	install -d ${D}${libdir}
+	install -m 755 *so.0.0.10  ${D}${libdir}
+}
+
+do_stage() {
+	oe_libinstall -so libshadowapp libshadowappd  ${STAGING_LIBDIR}
+	install -d ${STAGING_INCDIR}
+	install -m 644 *.h ${STAGING_INCDIR}
+
+}
+
+SRC_URI[md5sum] = "b6d7ca9e9740286f0ce918da9fb8438b"
+SRC_URI[sha256sum] = "0ee6a3caee4812827b8e167d4a07dbf859cb08a00a20f09568c3baae379d6ce8"
diff --git a/recipes/nonworking/maemo/libosso-help_1.0.01.bb b/recipes/nonworking/maemo/libosso-help_1.0.01.bb
new file mode 100644
index 0000000..b80d45a
--- /dev/null
+++ b/recipes/nonworking/maemo/libosso-help_1.0.01.bb
@@ -0,0 +1,24 @@
+LICENSE = 	"LGPL"
+PR = "r0"
+
+DEPENDS = 	"libosso hildon-lgpl hildon-base-lib hildon-libs"
+SRC_URI =	"http://repository.maemo.org/pool/maemo/ossw/source/libo/${PN}/libosso-help_${PV}.tar.gz \
+                 file://no-Werror.patch;striplevel=0 \
+                 file://help-header-pp.patch;striplevel=0"
+
+inherit pkgconfig autotools
+
+S = "${WORKDIR}/libosso-help-sdk-${PV}"
+
+#FILES_${PN} += "${libdir}/dbus-1.0/services/ ${libdir}/outo/*.so ${libdir}/outo/*bin ${libdir}/outo/mimedummy.doc"
+
+do_stage() {
+	install -d ${STAGING_INCDIR}
+	install -m 644 helplib/*.h ${STAGING_INCDIR}
+	install -m644 helplib/.libs/libossohelp.so ${STAGING_LIBDIR}
+	install -m644 helplib/.libs/libossohelp.so.0 ${STAGING_LIBDIR}
+	install -m644 helplib/.libs/libossohelp.so.0.0.0 ${STAGING_LIBDIR}
+}
+
+SRC_URI[md5sum] = "dbc3c68809e39bd6681aab8ad16ffe3c"
+SRC_URI[sha256sum] = "ef6f6fda31dfbf7b3186b6f1d0ffd12ee0675d9a057ad2994f81b5164213a693"
diff --git a/recipes/nonworking/maemo/osso-application-installer_1.0.03-1.bb b/recipes/nonworking/maemo/osso-application-installer_1.0.03-1.bb
new file mode 100644
index 0000000..3d24f21
--- /dev/null
+++ b/recipes/nonworking/maemo/osso-application-installer_1.0.03-1.bb
@@ -0,0 +1,22 @@
+PR         = "r1"
+LICENSE    = "GPL"
+
+DEPENDS = "hildon-lgpl hildon-base-lib libosso hildon-libs hildon-control-panel shared-mime-info"
+RDEPENDS_${PN} = "shared-mime-info"
+
+SRC_URI = "http://repository.maemo.org/pool/maemo/ossw/source/o/${PN}/${PN}_${PV}.tar.gz \
+           file://fix-buildsystem.patch"
+
+S = "${WORKDIR}/osso-application-installer-1.0.03"
+
+inherit autotools pkgconfig
+
+FILES_${PN} += "${libdir}/dbus-1.0 ${libdir}/hildon-control-panel/*.so ${datadir}/applications ${datadir}/mime"
+
+pkg_postinst () {
+  echo "Updating MIME database... this may take a while."
+  ${bindir}/update-mime-database ${datadir}/mime
+}
+
+SRC_URI[md5sum] = "05e47346d432bd4c78736b12f262d612"
+SRC_URI[sha256sum] = "f7129c56cd7e561c10457d101f37ebf3a8b02df83f42a30cb90b46eb0de5dede"
diff --git a/recipes/nonworking/maemo4/libosso-help_2.1.2.bb b/recipes/nonworking/maemo4/libosso-help_2.1.2.bb
new file mode 100644
index 0000000..b7b6de5
--- /dev/null
+++ b/recipes/nonworking/maemo4/libosso-help_2.1.2.bb
@@ -0,0 +1,21 @@
+LICENSE = "LGPL"
+DESCRIPTION = "Nokia osso help library"
+
+DEPENDS = "libhildonhelp libosso gtkhtml-3.8 libxml2 "
+
+PR = "r0"
+
+SRC_URI = "http://repository.maemo.org/pool/sardine-experimental/main.disabled/source/libo/libosso-help/libosso-help_${PV}-2.tar.gz"
+
+inherit autotools pkgconfig lib_package
+
+S = "${WORKDIR}/2.1.2-2"
+
+do_configure_prepend() {
+	# remove Werror from OSSO_CFLAGS
+	sed -i s:-Werror::g configure.ac
+        sed -i -e s:AC_CONFIG_SRCDIR:#AC_CONFIG_SRCDIR:g configure.ac
+}
+
+SRC_URI[md5sum] = "fc5a1f4598670cec9ac40fb603f80570"
+SRC_URI[sha256sum] = "ecbff97da422f1498eae8f9b8a17389c0ccdd7eee1ca0259f035e712c8e0a405"
diff --git a/recipes/nonworking/meta/meta-maemo.bb b/recipes/nonworking/meta/meta-maemo.bb
new file mode 100644
index 0000000..ac0dabe
--- /dev/null
+++ b/recipes/nonworking/meta/meta-maemo.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Meta-package for maemo environment"
+LICENSE = "MIT"
+PR = "r1"
+
+RDEPENDS_${PN} = "\
+    maemo-task-base \
+    maemo-task-apps \
+    maemo-task-libs-install \
+    maemo-task-theme"
+
+inherit meta
diff --git a/recipes/nonworking/tasks/task-maemo.bb b/recipes/nonworking/tasks/task-maemo.bb
new file mode 100644
index 0000000..4a28b08
--- /dev/null
+++ b/recipes/nonworking/tasks/task-maemo.bb
@@ -0,0 +1,73 @@
+DESCRIPTION = "Task package for maemo environment"
+LICENSE = "MIT"
+ALLOW_EMPTY = "1"
+PR = "r1"
+
+PACKAGES = "\
+    maemo-task-base \
+    maemo-task-apps \
+    maemo-task-libs-install \
+    maemo-task-theme"
+
+RDEPENDS_maemo-base-depends = "\
+    diet-x11 \
+    virtual/xserver \
+    xpext \
+    xsp"
+
+RDEPENDS_maemo-task-libs-install = "\
+    libsqlite \
+    hildon-lgpl \
+    libhildonbase \
+    libhildonwidgets \
+    hildon-fm"
+
+RDEPENDS_maemo-task-base = "\
+    gdk-pixbuf-loader-png \
+    gdk-pixbuf-loader-xpm \
+    gdk-pixbuf-loader-jpeg \
+    pango-module-basic-x \
+    pango-module-basic-fc \
+    bluez-utils-dbus \
+    matchbox \
+    shared-mime-info \
+    rxvt-unicode \
+    xst \
+    xhost \
+    xrdb \
+    libgtkstylus \
+    outo \
+    hildon-initscripts \
+    libosso \
+    osso-af-utils \
+    osso-af-startup \
+    osso-core-config \
+    gnome-vfs \
+    osso-thumbnail \
+    xauth \
+    esd"
+
+RDEPENDS_maemo-task-theme = "\
+    xcursor-transparent-theme \
+    sdk-default-theme \
+    sdk-default-theme-config \
+    sdk-default-icons \
+    sapwood \
+    ttf-bitstream-vera \
+    sapwood \
+    osso-sounds"
+
+RDEPENDS_maemo-task-apps = "\
+    osso-gwobex \
+    osso-gwconnect \
+    osso-bttools \
+    hildon-status-bar \
+    hildon-home \
+    hildon-navigator \
+    hildon-control-panel \
+    osso-application-installer \
+    osso-app-killer \
+    osso-screenshot-tool \
+    gpe-todo-hildon \
+    gpe-contacts-hildon \
+    gpe-mini-browser-hildon"
diff --git a/recipes/nonworking/ukeyboard/ukeyboard_1.2.bb b/recipes/nonworking/ukeyboard/ukeyboard_1.2.bb
new file mode 100644
index 0000000..0891396
--- /dev/null
+++ b/recipes/nonworking/ukeyboard/ukeyboard_1.2.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Additional keyboard layouts for Nokia N800/N810"
+SECTION = "user/other"
+DEPENDS = "gtk+ libosso gconf hildon-control-panel"
+
+SRC_URI = "http://upir.cz/maemo/dists/chinook/main/source/ukeyboard_${PV}.tar.gz "
+
+do_install() {
+    oe_runmake install DESTDIR=${D}
+}
+
+FILES_${PN} += "${datadir}/X11/xkb \
+                ${datadir}/scv_layouts \
+		${libdir}/hildon-control-panel/libukeyboard-prefs.so"
+FILES_${PN}-dbg += "${libdir}/hildon-control-panel/.debug/"
+
+SRC_URI[md5sum] = "cf291d487250e3e9c1cc34389ce49297"
+SRC_URI[sha256sum] = "1f54d52abc5a53db45bc063948375b947af2c031ee1b810686027f7694deb474"
diff --git a/recipes/openmoko-base/openmoko-session_svn.bb b/recipes/openmoko-base/openmoko-session_svn.bb
index 19f1ce4..05625a1 100644
--- a/recipes/openmoko-base/openmoko-session_svn.bb
+++ b/recipes/openmoko-base/openmoko-session_svn.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Matchbox session files for Openmoko"
 SECTION = "openmoko/base"
-RDEPENDS_${PN} = "matchbox-panel-2 matchbox-wm openmoko-today gconf"
+RDEPENDS_${PN} = "matchbox-panel-2 matchbox-wm openmoko-today2 gconf"
 PV = "0.1+svnr${SRCPV}"
 PR = "r1"
 
diff --git a/recipes/sugar/sugar-fructose.bb b/recipes/sugar/sugar-fructose.bb
index ad0db39..697ac21 100644
--- a/recipes/sugar/sugar-fructose.bb
+++ b/recipes/sugar/sugar-fructose.bb
@@ -1,3 +1,3 @@
 DESCRIPTION = "Sugar fructose activities"
 
-DEPENDS = "etoys sugar-web-activity"
+DEPENDS = "etoys"
diff --git a/recipes/tasks/task-arago-toolchain-target.bb b/recipes/tasks/task-arago-toolchain-target.bb
index aa592b6..496910e 100644
--- a/recipes/tasks/task-arago-toolchain-target.bb
+++ b/recipes/tasks/task-arago-toolchain-target.bb
@@ -14,14 +14,13 @@ RDEPENDS_${PN} = "\
     alsa-lib-dev \
     alsa-utils-dev \
     curl-dev \
-    e2fsprogs-libs-dev \
+    e2fsprogs-dev \
     i2c-tools-dev \
     freetype-dev \
     jpeg-dev \
     lzo-dev \
     libopkg-dev \
     libpng-dev \
-    libpng12-dev \
     readline-dev \
     libts-dev \
     libusb-compat-dev \
diff --git a/recipes/tasks/task-demo-x11.bb b/recipes/tasks/task-demo-x11.bb
index 39b68e7..e342658 100644
--- a/recipes/tasks/task-demo-x11.bb
+++ b/recipes/tasks/task-demo-x11.bb
@@ -8,7 +8,7 @@ ECONFIG ?= "places e-wm-config-angstrom e-wm-config-angstrom-touchscreen e-wm-co
 
 RDEPENDS_${PN} = "\
     task-base-extended \
-	task-gstreamer-ti \
+    task-gstreamer-ti \
     angstrom-x11-base-depends \
     angstrom-gpe-task-base \
     angstrom-gpe-task-settings \
@@ -20,16 +20,15 @@ RDEPENDS_${PN} = "\
     firefox midori \
     hicolor-icon-theme gnome-icon-theme \
     mplayer \
-	angstrom-gnome-icon-theme-enable \
-	picodlp-control \
-	connman-gnome \
-	gnome-bluetooth \
-	alsa-utils-aplay \
-	alsa-utils-alsamixer \
+    angstrom-gnome-icon-theme-enable \
+    picodlp-control \
+    connman-gnome \
+    gnome-bluetooth \
+    alsa-utils-aplay \
+    alsa-utils-alsamixer \
     libgles-omap3 \
-    libgles-omap3-demos \
+    libgles-omap3-x11demos \
     libgles-omap3-tests \
-    bc-cat-omap3-module-tests \
 "
 
 # Install all kernel modules
diff --git a/recipes/tasks/task-gmae.bb b/recipes/tasks/task-gmae.bb
index 1638c98..27f8f7f 100644
--- a/recipes/tasks/task-gmae.bb
+++ b/recipes/tasks/task-gmae.bb
@@ -2,6 +2,13 @@ DESCRIPTION = "GNOME Mobile & Embedded Initiative"
 PR = "r2"
 
 inherit task
+XSERVER ?= "xserver-xorg \
+           xf86-input-evdev \
+           xf86-input-mouse \
+           xf86-video-fbdev \
+           xf86-video-sisusb \
+           xf86-input-keyboard \
+"
 
 PACKAGES = 'gmae-core \
             gmae-toolkit \
diff --git a/recipes/tasks/task-gpe.bb b/recipes/tasks/task-gpe.bb
index 785f018..92efb3a 100644
--- a/recipes/tasks/task-gpe.bb
+++ b/recipes/tasks/task-gpe.bb
@@ -18,7 +18,9 @@ PACKAGES = "\
     gpe-task-sectest"
 
 RDEPENDS_gpe-base-depends = "\
-    diet-x11 \
+    diet-x11"
+
+DEPENDS_gpe-base-depends = "\
     virtual/xserver"
 
 RDEPENDS_gpe-task-base = "\
@@ -102,7 +104,7 @@ RDEPENDS_gpe-task-games = "\
     xdemineur"
 
 RDEPENDS_gpe-task-connectivity = "\
-    gpe-mini-browser"
+    gpe-mini-browser2"
 #    gaim
 #    linphone-hh
 
diff --git a/recipes/tasks/task-maemo.bb b/recipes/tasks/task-maemo.bb
deleted file mode 100644
index 4a28b08..0000000
--- a/recipes/tasks/task-maemo.bb
+++ /dev/null
@@ -1,73 +0,0 @@
-DESCRIPTION = "Task package for maemo environment"
-LICENSE = "MIT"
-ALLOW_EMPTY = "1"
-PR = "r1"
-
-PACKAGES = "\
-    maemo-task-base \
-    maemo-task-apps \
-    maemo-task-libs-install \
-    maemo-task-theme"
-
-RDEPENDS_maemo-base-depends = "\
-    diet-x11 \
-    virtual/xserver \
-    xpext \
-    xsp"
-
-RDEPENDS_maemo-task-libs-install = "\
-    libsqlite \
-    hildon-lgpl \
-    libhildonbase \
-    libhildonwidgets \
-    hildon-fm"
-
-RDEPENDS_maemo-task-base = "\
-    gdk-pixbuf-loader-png \
-    gdk-pixbuf-loader-xpm \
-    gdk-pixbuf-loader-jpeg \
-    pango-module-basic-x \
-    pango-module-basic-fc \
-    bluez-utils-dbus \
-    matchbox \
-    shared-mime-info \
-    rxvt-unicode \
-    xst \
-    xhost \
-    xrdb \
-    libgtkstylus \
-    outo \
-    hildon-initscripts \
-    libosso \
-    osso-af-utils \
-    osso-af-startup \
-    osso-core-config \
-    gnome-vfs \
-    osso-thumbnail \
-    xauth \
-    esd"
-
-RDEPENDS_maemo-task-theme = "\
-    xcursor-transparent-theme \
-    sdk-default-theme \
-    sdk-default-theme-config \
-    sdk-default-icons \
-    sapwood \
-    ttf-bitstream-vera \
-    sapwood \
-    osso-sounds"
-
-RDEPENDS_maemo-task-apps = "\
-    osso-gwobex \
-    osso-gwconnect \
-    osso-bttools \
-    hildon-status-bar \
-    hildon-home \
-    hildon-navigator \
-    hildon-control-panel \
-    osso-application-installer \
-    osso-app-killer \
-    osso-screenshot-tool \
-    gpe-todo-hildon \
-    gpe-contacts-hildon \
-    gpe-mini-browser-hildon"
diff --git a/recipes/tasks/task-mamona-base.bb b/recipes/tasks/task-mamona-base.bb
index fa56e24..a909595 100644
--- a/recipes/tasks/task-mamona-base.bb
+++ b/recipes/tasks/task-mamona-base.bb
@@ -9,14 +9,15 @@ RDEPENDS_${PN} = "\
   apt \
   base-files \
   base-passwd \
-  bash | bash-noemu \
+  bash \
+  bash-noemu \
   busybox \
   bzip2 \
   coreutils \
   dpkg \
   e2fsprogs \
   e2fsprogs-badblocks \
-  e2fsprogs-uuidgen \
+  util-linux-ng \
   file \
   gawk \
   gawk-common \
diff --git a/recipes/tasks/task-mamona-python.bb b/recipes/tasks/task-mamona-python.bb
index 4503627..8b19643 100644
--- a/recipes/tasks/task-mamona-python.bb
+++ b/recipes/tasks/task-mamona-python.bb
@@ -18,15 +18,12 @@ RDEPENDS_${PN} = "\
     python-gmpy	\
     python-gnosis \
     python-gst \
-    python-hmm \
     python-imaging \
     python-imdbpy \
     python-inotify \
     python-irclib \
-    python-itools \
     python-logilab-common \
     python-libgmail \
-    python-lightmediascanner \
     python-lxml	\
     python-mad \
     python-numarray	\
@@ -48,7 +45,6 @@ RDEPENDS_${PN} = "\
     python-pylint \
     python-pyqt	\
     python-pyraf \
-    python-pyreverse \
     python-pyrex \
     python-pyro \
     python-pyserial \
@@ -63,17 +59,13 @@ RDEPENDS_${PN} = "\
     python-simplejson \
     python-sip \
     python-sgmlop \
-    python-snmplib \
     python-soappy \
     python-spydi \
-    python-spyro \
     python-sqlalchemy \
     python-sqlobject \
     python-tlslite \
-    python-urwid \
-    python-vmaps \
+    python-twisted \
     python-vorbis \
     python-webpy \
     task-python-efl \
-    twisted \
 "
diff --git a/recipes/tasks/task-mamona-systemtap.bb b/recipes/tasks/task-mamona-systemtap.bb
index 84182d6..72a3622 100644
--- a/recipes/tasks/task-mamona-systemtap.bb
+++ b/recipes/tasks/task-mamona-systemtap.bb
@@ -6,6 +6,5 @@ PACKAGES = "${PN}"
 
 RDEPENDS_${PN} = "\
     libcap \
-    systemtap \
     task-mamona-sdk \
 "
diff --git a/recipes/tasks/task-mamona-wm.bb b/recipes/tasks/task-mamona-wm.bb
index 49d3a6a..e2ac612 100644
--- a/recipes/tasks/task-mamona-wm.bb
+++ b/recipes/tasks/task-mamona-wm.bb
@@ -12,6 +12,5 @@ RDEPENDS_${PN} = "\
     libmamona-im-gtk \
     pango-module-basic-x \
     pango-module-basic-fc \
-    aterm \
     midori \
 "
diff --git a/recipes/tasks/task-openmoko-base.bb b/recipes/tasks/task-openmoko-base.bb
index b7b7b58..3c46c56 100644
--- a/recipes/tasks/task-openmoko-base.bb
+++ b/recipes/tasks/task-openmoko-base.bb
@@ -11,7 +11,7 @@ inherit task
 DESCRIPTION_task-openmoko-base = "Openmoko: Top Panel, Application Launcher, Application Manager"
 RDEPENDS_task-openmoko-base = "\
   matchbox-panel-2 \
-  matchbox-panel-2-applets \
+#  matchbox-panel-2-applets \
 #  matchbox-keyboard-inputmethod \
 #  matchbox-keyboard-im \
 #  matchbox-keyboard-applet \
diff --git a/recipes/tasks/task-openmoko-python-devel.bb b/recipes/tasks/task-openmoko-python-devel.bb
index a493183..7b375c0 100644
--- a/recipes/tasks/task-openmoko-python-devel.bb
+++ b/recipes/tasks/task-openmoko-python-devel.bb
@@ -8,5 +8,4 @@ inherit task
 RDEPENDS_task-openmoko-python-devel = "\
   task-python-efl \
   python-pygtk \
-  python-lightmediascanner \
 "
diff --git a/recipes/tasks/task-openprotium.bb b/recipes/tasks/task-openprotium.bb
index 2cfe30d..1cfc740 100644
--- a/recipes/tasks/task-openprotium.bb
+++ b/recipes/tasks/task-openprotium.bb
@@ -4,7 +4,10 @@ ALLOW_EMPTY = "1"
 PR = "r3"
 
 inherit task
-
+DISTRO_SSH_DAEMON ?= "dropbear"
+DISTRO_DEV_MANAGER ?= ""
+DISTRO_INIT_MANAGER ?= ""
+DISTRO_LOGIN_MANAGER ?= ""
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 # be sure to build the kernel:
 DEPENDS = "virtual/kernel"
diff --git a/recipes/tasks/task-opie-apps.bb b/recipes/tasks/task-opie-apps.bb
index 2f9cc27..f791c21 100644
--- a/recipes/tasks/task-opie-apps.bb
+++ b/recipes/tasks/task-opie-apps.bb
@@ -8,7 +8,7 @@ PACKAGES = "task-opie-apps task-opie-extra-apps"
 
 RDEPENDS_task-opie-apps = "opie-advancedfm opie-bartender opie-calculator \
                   opie-checkbook opie-clock \
-                  opie-console opie-dagger opie-embeddedkonsole \
+                  opie-console opie-embeddedkonsole \
                   opie-euroconv opie-eye opie-ftp opie-gutenbrowser \
                   opie-helpbrowser opie-irc opie-keypebble opie-odict \
                   opie-oxygen opie-rdesktop opie-reader opie-remote \
diff --git a/recipes/tasks/task-python-sharprom_20060425.bb b/recipes/tasks/task-python-sharprom_20060425.bb
index 16038ad..15776ea 100644
--- a/recipes/tasks/task-python-sharprom_20060425.bb
+++ b/recipes/tasks/task-python-sharprom_20060425.bb
@@ -8,13 +8,20 @@ NONWORKING = "\
 		python-crypto		\
 		python-gammu		\
 		python-gmpy		\
+		python-hmm		\
+		python-itools		\
 		python-pybluez		\
+		python-pyreverse	\
 		python-pysqlite		\
 		python-pygtk		\
 		python-pyqwt		\
+		python-snmplib		\
 		python-sgmlop		\
+		python-spyro		\
 		python-sword            \
-		python-vorbis"
+		python-urwid		\
+		python-vorbis		\
+		python-vmaps"
 
 RDEPENDS_${PN} = "\
 		python-ao 		\
@@ -23,9 +30,7 @@ RDEPENDS_${PN} = "\
 		python-fnorb		\
 		python-fpconst		\
 		python-gnosis		\
-		python-hmm		\
 		python-irclib		\
-		python-itools		\
 		python-libgmail		\
 		python-logilab-common	\
 		python-lxml		\
@@ -45,7 +50,6 @@ RDEPENDS_${PN} = "\
 		python-pylint		\
 		python-pyqt		\
 		python-pyraf		\
-		python-pyreverse	\
 		python-pyro		\
 		python-pyserial		\
 		python-pyvisa		\
@@ -55,17 +59,13 @@ RDEPENDS_${PN} = "\
 		python-scapy		\
 		python-scons		\
 		python-sip		\
-		python-snmplib		\
 		python-soappy		\
 		python-spydi		\
-		python-spyro		\
 		python-tlslite		\
-		python-urwid		\
-		python-vmaps		\
+		python-twisted		\
 		python-webpy		\
 		moin			\
 		plone			\
-		twisted			\
 		zope"
 
 #fixme add python-egenix-mx-base if brought in from nonworking
diff --git a/recipes/udev/udev-compat141_141.bb b/recipes/udev/udev-compat141_141.bb
index 2411fc6..c39d4cb 100644
--- a/recipes/udev/udev-compat141_141.bb
+++ b/recipes/udev/udev-compat141_141.bb
@@ -15,7 +15,11 @@ PACKAGES = "${PN} ${PN}-dbg"
 PROVIDES = "udev-compat"
 
 # Need udev with udev-compat-wrapper support and nothing else.
-RDEPENDS_${PN} = "udev-compat-wrapper"
+RDEPENDS_${PN}_spitz = "udev-compat-wrapper"
+RDEPENDS_${PN}_akita = "udev-compat-wrapper"
+RDEPENDS_${PN}_c7x0 = "udev-compat-wrapper"
+RDEPENDS_${PN}_poodle = "udev-compat-wrapper"
+
 # Remove hotplug RPROVIDES
 RPROVIDES_${PN} = "udev-compat"
 
diff --git a/recipes/ukeyboard/ukeyboard_1.2.bb b/recipes/ukeyboard/ukeyboard_1.2.bb
deleted file mode 100644
index 0891396..0000000
--- a/recipes/ukeyboard/ukeyboard_1.2.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "Additional keyboard layouts for Nokia N800/N810"
-SECTION = "user/other"
-DEPENDS = "gtk+ libosso gconf hildon-control-panel"
-
-SRC_URI = "http://upir.cz/maemo/dists/chinook/main/source/ukeyboard_${PV}.tar.gz "
-
-do_install() {
-    oe_runmake install DESTDIR=${D}
-}
-
-FILES_${PN} += "${datadir}/X11/xkb \
-                ${datadir}/scv_layouts \
-		${libdir}/hildon-control-panel/libukeyboard-prefs.so"
-FILES_${PN}-dbg += "${libdir}/hildon-control-panel/.debug/"
-
-SRC_URI[md5sum] = "cf291d487250e3e9c1cc34389ce49297"
-SRC_URI[sha256sum] = "1f54d52abc5a53db45bc063948375b947af2c031ee1b810686027f7694deb474"
diff --git a/recipes/vlc/vlc-davinci_0.8.6h.bb b/recipes/vlc/vlc-davinci_0.8.6h.bb
index ed53508..c7fa7b4 100644
--- a/recipes/vlc/vlc-davinci_0.8.6h.bb
+++ b/recipes/vlc/vlc-davinci_0.8.6h.bb
@@ -10,7 +10,7 @@ PR = "r6"
 
 PV = "0.8.6h+${PR}+gitr${SRCREV}"
 
-DEPENDS = "codec-engine dbus libxml2 gnutls tremor faad2 ffmpeg flac  \
+DEPENDS = "ti-codec-engine dbus libxml2 gnutls tremor faad2 ffmpeg flac  \
            ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad libid3tag liba52 mpeg2dec', d)}"
 
 SRC_URI = "git://git.videolan.org/vlc.git;protocol=git;branch=0.8.6-neuros"
diff --git a/recipes/xqt2/xqt2_20060509.bb b/recipes/xqt2/xqt2_20060509.bb
index 7634d27..4492bc7 100644
--- a/recipes/xqt2/xqt2_20060509.bb
+++ b/recipes/xqt2/xqt2_20060509.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Xqt2 is an X-Server than runs within the Opie environment"
 HOMEPAGE = "http://xqt.sourceforge.jp"
-DEPENDS = "freetype libxi xmu flex-native virtual/libqte2 libqpe-opie"
+DEPENDS = "freetype libxi libxmu flex-native virtual/libqte2 libqpe-opie"
 LICENSE = "GPL"
 SECTION = "opie/applications"
 APPTYPE = "binary"
-- 
1.7.1



