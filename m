Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0589E6EA9D
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2014 07:34:30 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id k10so2770611eaj.29
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 23:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=GMcE3c9dpIBiTpOqbVlQBnVMPConqdvbTx3fxDACxpc=;
	b=OGBCaNuobFQkxBgFpVlbv8+uXz6MRt/ySNc6jC3JnL6NnZY4W8KjbZqEPMArOMS7Q+
	yH5suGU+okD/jZuLZqn4oi2KKJshqX+G8sd2gvbewSD2J6g57LepN1j1RzDBM35ski16
	U9BqENRq+ZWVtzFcRZdJ0fWNNJC03qtpHqccvBm4tyy6tTKWpTD+C9mcqUGr+ThB3ZbJ
	wf8Pty8vzsxDJaLgQ5vrRLpxSQEm3+1yw3N/n2t0vYUBet84U21G5b3FD8zrnIQ0nU99
	gtiLV4s0uS2XTMx+8jjaTmeIqEUQiq8POD1jKca1Wn+0Ek0GzHzavCHB8Md6WBqtVznS
	MY4g==
X-Received: by 10.14.201.66 with SMTP id a42mr224600eeo.97.1391240071708;
	Fri, 31 Jan 2014 23:34:31 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	o43sm46357990eef.12.2014.01.31.23.34.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jan 2014 23:34:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Feb 2014 08:34:07 +0100
Message-Id: <cc304dbc18cafc73a092bcfa7f5940e495d08efa.1391239970.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
Subject: [PATCH 11/20] e-wm: Add recipe for 0.18.2
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
X-List-Received-Date: Sat, 01 Feb 2014 07:34:31 -0000

* keep old 0.17.* around because new enlightenment is more picky on where it
  will run (compositor is now mandatory)
* 0.18.2 release:
  http://sourceforge.net/mailarchive/message.php?msg_id=31789335
* 0.18.3 release:
  http://sourceforge.net/mailarchive/message.php?msg_id=31895179

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm.inc       | 14 +++-----------
 meta-efl/recipes-efl/e17/e-wm_0.17.5.bb | 12 ++++++++++++
 meta-efl/recipes-efl/e17/e-wm_0.18.3.bb | 20 ++++++++++++++++++++
 3 files changed, 35 insertions(+), 11 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/e-wm_0.18.3.bb

diff --git a/meta-efl/recipes-efl/e17/e-wm.inc b/meta-efl/recipes-efl/e17/e-wm.inc
index 3f24b62..08fe25f 100644
--- a/meta-efl/recipes-efl/e17/e-wm.inc
+++ b/meta-efl/recipes-efl/e17/e-wm.inc
@@ -7,7 +7,8 @@ SRCNAME = "e"
 inherit e update-alternatives gettext
 S = "${WORKDIR}/${SRCNAME}"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam"
 
 EXTRA_OECONF = "\
@@ -30,16 +31,6 @@ do_install_append() {
     # xinit[418]: ERROR: CONFIGURATION FILE HAS BAD PERMISSIONS
     chmod 600 ${D}/${sysconfdir}/enlightenment/sysactions.conf
 
-    install -d ${D}/${datadir}/applications/
-    install -m 644 ${S}/src/modules/fileman/module.desktop ${D}/${datadir}/applications/efm.desktop
-    sed "s#Type=Link#Type=Application#g" -i ${D}/${datadir}/applications/efm.desktop
-    echo "Exec=enlightenment_remote -efm-open-dir" >> ${D}/${datadir}/applications/efm.desktop
-    echo "Terminal=false" >> ${D}/${datadir}/applications/efm.desktop
-    echo "Categories=Application;" >> ${D}/${datadir}/applications/efm.desktop
-    echo "StartupNotify=true" >> ${D}/${datadir}/applications/efm.desktop
-    install -d ${D}/${datadir}/icons/
-    install -m 644 ${S}/data/themes/img/O/icon_icon_theme.png ${D}/${datadir}/icons/e-module-fileman.png
-
     install -d ${D}/${sysconfdir}/xdg/menus
     install -m 644 ${WORKDIR}/applications.menu ${D}/${sysconfdir}/xdg/menus/
     for I in `find ${D}/${libdir}/enlightenment -name "*.a" -print`; do rm -f $I; done
@@ -124,6 +115,7 @@ FILES_${PN} = "\
     ${datadir}/enlightenment/COPYING \
     ${datadir}/xsessions/enlightenment.desktop \
     ${sysconfdir}/xdg \
+    ${systemd_unitdir} \
 "
 
 FILES_${PN}-config-default = "${datadir}/enlightenment/data/config/default"
diff --git a/meta-efl/recipes-efl/e17/e-wm_0.17.5.bb b/meta-efl/recipes-efl/e17/e-wm_0.17.5.bb
index 57eefdb..d374680 100644
--- a/meta-efl/recipes-efl/e17/e-wm_0.17.5.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_0.17.5.bb
@@ -12,3 +12,15 @@ SRC_URI = "\
 
 SRC_URI[md5sum] = "5aefb55df0b1a0a0ae0cf9d0610cf7c7"
 SRC_URI[sha256sum] = "25d4967277cf27d4efb474a9b8eceb1200aa813a51c248b61cc23f69291bff0f"
+
+do_install_append() {
+    install -d ${D}/${datadir}/applications/
+    install -m 644 ${S}/src/modules/fileman/module.desktop ${D}/${datadir}/applications/efm.desktop
+    sed "s#Type=Link#Type=Application#g" -i ${D}/${datadir}/applications/efm.desktop
+    echo "Exec=enlightenment_remote -efm-open-dir" >> ${D}/${datadir}/applications/efm.desktop
+    echo "Terminal=false" >> ${D}/${datadir}/applications/efm.desktop
+    echo "Categories=Application;" >> ${D}/${datadir}/applications/efm.desktop
+    echo "StartupNotify=true" >> ${D}/${datadir}/applications/efm.desktop
+    install -d ${D}/${datadir}/icons/
+    install -m 644 ${S}/data/themes/img/O/icon_icon_theme.png ${D}/${datadir}/icons/e-module-fileman.png
+}
diff --git a/meta-efl/recipes-efl/e17/e-wm_0.18.3.bb b/meta-efl/recipes-efl/e17/e-wm_0.18.3.bb
new file mode 100644
index 0000000..ae21cc1
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/e-wm_0.18.3.bb
@@ -0,0 +1,20 @@
+require ${BPN}.inc
+
+SRCNAME = "enlightenment"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+SRC_URI = "\
+    ${E_RELEASES}/apps/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+    file://enlightenment_start.oe \
+    file://applications.menu \
+"
+
+SRC_URI[md5sum] = "9f6e6c296b88b038ac05415006c678fd"
+SRC_URI[sha256sum] = "17d207246bf10dec5a5fa854da5763e0e6dd61decde3474ff5fedffbb9dc8629"
+
+do_configure_prepend() {
+    sed '/^ *EFL_PKG_CHECK_VAR/ s/systemduserunitdir/systemdsystemunitdir/g' -i ${S}/configure.ac
+}
+
+PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
-- 
1.8.5.3


