Return-Path: <fabien.lahoudere@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id E56B2781F8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Sep 2017 13:34:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: aragua) with ESMTPSA id D937B26CDED
From: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Sep 2017 15:34:15 +0200
Message-Id: <20170908133415.15293-1-fabien.lahoudere@collabora.co.uk>
X-Mailer: git-send-email 2.11.0
Subject: [meta-multimedia][PATCH] gerbera: Add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Sep 2017 13:34:41 -0000

Gerbera is a UPnP media server which allows you to stream your digital media
through your home network and consume it on a variety of UPnP compatible devices.

Gerbera is based on MediaTomb 12.1 which is dead upstream, so this is an attempt
to kick it back into life.

Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
---
 .../gerbera/files/gerbera.service                  | 13 +++++++++
 .../recipes-multimedia/gerbera/gerbera_git.bb      | 34 ++++++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/gerbera/files/gerbera.service
 create mode 100644 meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb

diff --git a/meta-multimedia/recipes-multimedia/gerbera/files/gerbera.service b/meta-multimedia/recipes-multimedia/gerbera/files/gerbera.service
new file mode 100644
index 000000000..1b5a3ad3e
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gerbera/files/gerbera.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=Start Gerbera, an UPnP media server
+After=multi-user.target network-online.target
+Wants=network-online.target
+
+[Service]
+ExecStart=/usr/bin/gerbera
+Environment='HOME=/root'
+Type=simple
+RemainAfterExit=yes
+
+[Install]
+WantedBy=multi-user.target
\ No newline at end of file
diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb b/meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb
new file mode 100644
index 000000000..2bbedc0d1
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb
@@ -0,0 +1,34 @@
+Description = "Gerbera - An UPnP media server"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=25cdec9afe3f1f26212ead6bd2f7fac8"
+
+SRC_URI = "git://github.com/v00d00/gerbera.git;protocol=https \
+	   file://gerbera.service "
+
+
+# Modify these as desired
+PV = "1.0+git${SRCPV}"
+SRCREV = "4435b165d121195aefd67d0287f7f9349e181d45"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "expat zlib curl libupnp e2fsprogs sqlite3 taglib "
+RDEPENDS_${PN} = "expat zlib curl libupnp e2fsprogs taglib "
+
+SYSTEMD_SERVICE_${PN} = "gerbera.service"
+SYSTEMD_AUTO_ENABLE = "enable"
+
+inherit cmake systemd
+
+EXTRA_OECMAKE = "-DWITH_JS=FALSE -DWITH_TAGLIB=FALSE -DWITH_MAGIC=FALSE -DWITH_EXIF=FALSE -DLIBUUID_INCLUDE_DIRS=${WORKDIR}/recipe-sysroot/usr/include -DLIBUUID_LIBRARIES=-luuid"
+
+do_install_append() {
+	install -d ${D}/root/.config/
+	install -d ${D}${systemd_system_unitdir}
+        install -m 0644 ${WORKDIR}/gerbera.service ${D}${systemd_system_unitdir}/
+}
+
+FILES_${PN} += " /root/.config/ \
+	         ${systemd_system_unitdir}/* \
+"
\ No newline at end of file
-- 
2.11.0


