Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1522F7EDF1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 23:38:17 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id i21so35722374ljj.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 16:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=LoyAMQYnqc24VuKNfqJ0fOxXOW2ux3UJ2tdVDR6Da90=;
	b=JXuLmPaFp2ZGrbbbSroJdUbP3n3Y6P2VgbKDNzQnNQMrkRMCwWJiYajmRvlEUiR3CR
	OBOAP9l9jugVnlby1EIsQSMz6T9ztYEja7Td2vmzSl/LR67jtCBzMbgiTsxr6ise1RLA
	NJjCXuyLlB9DfB7Hz+6PzbuO4hGAKIUjh6NYQEM4/G6rlyRaI1vCLffvbbn5wW18zutu
	h1vTfCNfN30AQQbZ+wwqrNI2FrcTIAwpyIo/Zdg19K8C8CdXNyHkZUCe5C0L78J44/AF
	1y82JTwJe36/H02DAp7w5qOWhrQ/ZxlkPXb6gGCSbZS0zl6TSs4j+8pAie19OQrmBChI
	XRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LoyAMQYnqc24VuKNfqJ0fOxXOW2ux3UJ2tdVDR6Da90=;
	b=tYpVxdIwDmaQOnY8QNt9zpOax2vXexq8i1RJc/zvnQvBhVGoF50eN5gdiIz984QYyZ
	hwzqL20PGGFzUMzb0QTt1eFl7eRDZKZxjFTSD8RXBxs9RAGO5DiI17MFWJiBVT/6JLX+
	sxhX5+U99tiAjZtTrFNh6ovOkekiE4Mct2LUQjQthdhQ2QfPiuOjgQCqdyeFmc1WfAuS
	74kxDCuCh10YPmn0n8C4EVSyC0msxtsStj/ekU0gRtv6YF82qUoUtWJvFhHp211EdsDB
	WUaG4nZounio2mj8g0oX0i88BLNk9tAxaaXV/di6basLPx2Pw8tbUfQYk77uYKlYujRL
	SLTA==
X-Gm-Message-State: APjAAAURCn57EV22R/pDq36xmpN+oR7o+uea9nrjrc6qQkfIkNIHu7vT
	PvVT5QaMfY5d+2EhXuTb/1lA4v6O
X-Google-Smtp-Source: APXvYqwZwTDsq7OPhC42JewQVWdWa/j43oRQQ3BBxfkckXwU6giCkEbWhZZVhMZ4ZBxfnJuC/3rLAg==
X-Received: by 2002:a2e:7f05:: with SMTP id a5mr34045544ljd.190.1563752297879; 
	Sun, 21 Jul 2019 16:38:17 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	f16sm6437660lfc.81.2019.07.21.16.38.16
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 21 Jul 2019 16:38:17 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Jul 2019 01:38:02 +0200
Message-Id: <20190721233802.32193-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] blueman: update to 2.1.1
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
X-List-Received-Date: Sun, 21 Jul 2019 23:38:18 -0000

Removed patch was upstreamed.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../blueman/blueman_2.1.1.bb                  | 58 +++++++++++++++++++
 .../blueman/blueman_git.bb                    | 42 --------------
 2 files changed, 58 insertions(+), 42 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/blueman/blueman_2.1.1.bb
 delete mode 100644 meta-networking/recipes-connectivity/blueman/blueman_git.bb

diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.1.1.bb b/meta-networking/recipes-connectivity/blueman/blueman_2.1.1.bb
new file mode 100644
index 000000000..36de2af1d
--- /dev/null
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.1.1.bb
@@ -0,0 +1,58 @@
+DESCRIPTION = "Blueman is a GTK+ Bluetooth Manager"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+DEPENDS = "bluez5 python3-pygobject python3-cython-native python3-setuptools-native intltool-native"
+
+inherit autotools systemd gsettings python3native gtk-icon-cache
+
+SRC_URI = " \
+    https://github.com/blueman-project/blueman/releases/download/${PV}/blueman-${PV}.tar.xz \
+    file://0001-Search-for-cython3.patch \
+"
+SRC_URI[md5sum] = "9de89abb31be45bdbf11f7884764a2dc"
+SRC_URI[sha256sum] = "f1eab2334e5a1587defa80900901048d14c2e8ffa8c0cff7240bc9937a61dbc3"
+
+EXTRA_OECONF = " \
+    --disable-runtime-deps-check \
+    --disable-schemas-compile \
+"
+
+SYSTEMD_SERVICE_${PN} = "${BPN}-mechanism.service"
+SYSTEMD_AUTO_ENABLE_${PN} = "disable"
+
+RRECOMENDS_${PN} += "adwaita-icon-theme"
+RDEPENDS_${PN} += " \
+    python3-core \
+    python3-dbus \
+    packagegroup-tools-bluetooth \
+"
+
+PACKAGECONFIG ??= "thunar"
+PACKAGECONFIG[thunar] = "--enable-thunar-sendto,--disable-thunar-sendto"
+
+FILES_${PN} += " \
+    ${datadir}/dbus-1 \
+    ${datadir}/Thunar \
+    ${systemd_user_unitdir} \
+    ${exec_prefix}${systemd_system_unitdir} \
+    ${PYTHON_SITEPACKAGES_DIR} \
+"
+
+FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/_blueman.a"
+
+# In code, path to python is a variable that is replaced with path to native version of it
+# during the configure stage, e.g ../recipe-sysroot-native/usr/bin/python3-native/python3.
+# Replace it with #!/usr/bin/env python3
+do_install_append() {
+    sed -i "1s/.*/#!\/usr\/bin\/env python3/" ${D}${prefix}/libexec/blueman-rfcomm-watcher \
+                                              ${D}${prefix}/libexec/blueman-mechanism \
+                                              ${D}${bindir}/blueman-tray \
+                                              ${D}${bindir}/blueman-services \
+                                              ${D}${bindir}/blueman-sendto \
+                                              ${D}${bindir}/blueman-report \
+                                              ${D}${bindir}/blueman-manager \
+                                              ${D}${bindir}/blueman-assistant \
+                                              ${D}${bindir}/blueman-applet \
+                                              ${D}${bindir}/blueman-adapters
+}
diff --git a/meta-networking/recipes-connectivity/blueman/blueman_git.bb b/meta-networking/recipes-connectivity/blueman/blueman_git.bb
deleted file mode 100644
index 91b64a36b..000000000
--- a/meta-networking/recipes-connectivity/blueman/blueman_git.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-DESCRIPTION = "Blueman is a GTK+ Bluetooth Manager"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-DEPENDS = "bluez5 python3-pygobject python3-cython-native python3-setuptools-native intltool-native"
-
-inherit autotools systemd gsettings python3native gtk-icon-cache
-
-SRC_URI = " \
-    git://github.com/blueman-project/blueman.git \
-    file://0001-Search-for-cython3.patch \
-"
-SRCREV = "c4a03417e81e21543d4568e8e7f7de307582eb50"
-PV = "2.0.5+git${SRCPV}"
-S = "${WORKDIR}/git"
-
-EXTRA_OECONF = " \
-    --disable-runtime-deps-check \
-    --disable-schemas-compile \
-"
-
-SYSTEMD_SERVICE_${PN} = "${BPN}-mechanism.service"
-SYSTEMD_AUTO_ENABLE_${PN} = "disable"
-
-RRECOMENDS_${PN} += "adwaita-icon-theme"
-RDEPENDS_${PN} += " \
-    python3-dbus \
-    packagegroup-tools-bluetooth \
-"
-
-PACKAGECONFIG ??= "thunar"
-PACKAGECONFIG[thunar] = "--enable-thunar-sendto,--disable-thunar-sendto"
-
-FILES_${PN} += " \
-    ${datadir}/dbus-1 \
-    ${datadir}/Thunar \
-    ${systemd_user_unitdir} \
-    ${exec_prefix}${systemd_system_unitdir} \
-    ${PYTHON_SITEPACKAGES_DIR} \
-"
-
-FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/_blueman.a"
-- 
2.17.1


