Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id B4A7E6C8FB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2014 17:42:40 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id m10so3279565eaj.40
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2014 09:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=U2dqJxi8/3OR+RIntBZfBdMB0Zfb653mUgbJwHyAoZo=;
	b=t12yyD+ds3nkNmFFysIOQrqf8lEKRpa0cWNigM1PdlgP3faPBtsnT2vONNvJeq+Dps
	F3UQ3r995nLW4bBEr9/0ZXTxOwLJMSDVqTltLVrp5jqrq8F1leasrxdbzsX9p72DnSZ9
	0cHDC2XdWuxNB4etZ+3KpG04AStBFz+2FD/fF1VGRTzgP0t8teuW+0mdWCmWgclzSpds
	4KyVlc/6ggdYfsyLO8CDNIUR1kJSF1jbzkfYkcvVe5CZYYk/v7RuFmL+Zmz9S/UzicUM
	bbJsYC5dIUuIVGCuGPMo5bDUQRCGqh0tgZ9VuafR+oYqKUVGsEwKGjQbr1FHwQMrAnQc
	ghzg==
X-Received: by 10.14.193.132 with SMTP id k4mr18698530een.55.1390239761466;
	Mon, 20 Jan 2014 09:42:41 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id k41sm5450078eey.0.2014.01.20.09.42.40
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Jan 2014 09:42:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Jan 2014 18:42:37 +0100
Message-Id: <1390239757-27055-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <1390239757-27055-1-git-send-email-Martin.Jansa@gmail.com>
References: <cover.1389805976.git.Martin.Jansa@gmail.com>
	<1390239757-27055-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 4/4] e-wm: Add recipe for 0.18.2
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
X-List-Received-Date: Mon, 20 Jan 2014 17:42:41 -0000

* keep old 0.17.* around because new enlightenment is more picky on where it
  will run (compositor is now mandatory)
* announcement
  http://sourceforge.net/mailarchive/message.php?msg_id=31789335

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm.inc       | 14 +++-----------
 meta-efl/recipes-efl/e17/e-wm_0.17.5.bb | 12 ++++++++++++
 meta-efl/recipes-efl/e17/e-wm_0.18.2.bb | 20 ++++++++++++++++++++
 3 files changed, 35 insertions(+), 11 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/e-wm_0.18.2.bb

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
diff --git a/meta-efl/recipes-efl/e17/e-wm_0.18.2.bb b/meta-efl/recipes-efl/e17/e-wm_0.18.2.bb
new file mode 100644
index 0000000..ab96e9a
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/e-wm_0.18.2.bb
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
+SRC_URI[md5sum] = "eea52b438b143ac318d5ed8e09e06f2b"
+SRC_URI[sha256sum] = "106a6949b14ce3eae0c1eb82bf09492fa8417df0b26faf595f5050f0e89b5483"
+
+do_configure_prepend() {
+    sed '/^ *EFL_PKG_CHECK_VAR/ s/systemduserunitdir/systemdsystemunitdir/g' -i ${S}/configure.ac
+}
+
+PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
-- 
1.8.5.3


