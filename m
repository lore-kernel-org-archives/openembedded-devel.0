Return-Path: <ayoub.zaki@embexus.com>
Received: from mailrelay1-3.pub.mailoutpod1-cph3.one.com
	(mailrelay1-3.pub.mailoutpod1-cph3.one.com [46.30.212.10])
	by mail.openembedded.org (Postfix) with ESMTP id 319EE6C3B2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jul 2019 08:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=embexus.com; s=20140924;
	h=message-id:date:subject:cc:to:from:from;
	bh=53kwAx1on9oaf0+m2NNTP5+qi3+cSjCX5CsxNYPV4cc=;
	b=ECZHGM8Cnt4yb0Ts5TD1suVGCtqZse1sMtTiZPLRr9CO2jerSUfyF7HquIHSnNqIGRHlpToykmShZ
	2B+YIVEmFZyHeaDP0LkOz9TootTuI4rnnPbglep4vkm6MD5P23bBWrm+3YtLHkJS0FhcbCsc/d1Kbb
	AOlXSYjrcfAVqtME=
X-HalOne-Cookie: 4e7d8e9d6a39b407140e3dc685845667e3f17a65
X-HalOne-ID: 805f608f-b1d7-11e9-aee2-d0431ea8a283
Received: from xps.fritz.box (unknown [2.206.27.35])
	by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 805f608f-b1d7-11e9-aee2-d0431ea8a283;
	Mon, 29 Jul 2019 08:04:34 +0000 (UTC)
From: Ayoub Zaki <ayoub.zaki@embexus.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Jul 2019 10:04:32 +0200
Message-Id: <20190729080432.20866-1-ayoub.zaki@embexus.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH v4] usbguard: Initial recipe
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
X-List-Received-Date: Mon, 29 Jul 2019 08:04:35 -0000

Introduce the USBGuard software framework that helps to protect against rogue USB devices (a.k.a. BadUSB)
by implementing basic whitelisting and blacklisting capabilities based on device attributes.
---
 ...kgconfig-instead-of-libgcrypt-config.patch | 25 +++++++++++++
 .../usbguard/usbguard_0.7.4.bb                | 37 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 meta-oe/recipes-security/usbguard/usbguard/0001-Use-pkgconfig-instead-of-libgcrypt-config.patch
 create mode 100644 meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb

diff --git a/meta-oe/recipes-security/usbguard/usbguard/0001-Use-pkgconfig-instead-of-libgcrypt-config.patch b/meta-oe/recipes-security/usbguard/usbguard/0001-Use-pkgconfig-instead-of-libgcrypt-config.patch
new file mode 100644
index 000000000..022320b40
--- /dev/null
+++ b/meta-oe/recipes-security/usbguard/usbguard/0001-Use-pkgconfig-instead-of-libgcrypt-config.patch
@@ -0,0 +1,25 @@
+From 85a3c46fa0bcf05d824b86b7e5412ec65924e86a Mon Sep 17 00:00:00 2001
+From: Ayoub Zaki <ayoub.zaki@embexus.com>
+Date: Mon, 29 Jul 2019 09:46:56 +0200
+Subject: [PATCH 1/1] Use pkgconfig instead of libgcrypt-config
+
+---
+ m4/libgcrypt.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/m4/libgcrypt.m4 b/m4/libgcrypt.m4
+index 6cf482f..d674eae 100644
+--- a/m4/libgcrypt.m4
++++ b/m4/libgcrypt.m4
+@@ -28,7 +28,7 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
+      libgcrypt_config_prefix="$withval", libgcrypt_config_prefix="")
+   if test x$libgcrypt_config_prefix != x ; then
+      if test x${LIBGCRYPT_CONFIG+set} != xset ; then
+-        LIBGCRYPT_CONFIG=$libgcrypt_config_prefix/bin/libgcrypt-config
++        LIBGCRYPT_CONFIG=$(shell pkg-config libgcrypt)
+      fi
+   fi
+ 
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb b/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
new file mode 100644
index 000000000..75ab62c3a
--- /dev/null
+++ b/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
@@ -0,0 +1,37 @@
+DESCRIPTION="USBGuard framework helps to protect against BadUSB."
+HOMEPAGE="https://github.com/dkopecek/usbguard"
+LICENSE="GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022"
+
+SRCREV = "0ab32d7fa092067030fcbef530968b5cc237b08c"
+SRC_URI = "git://git@github.com/USBGuard/usbguard.git;protocol=https;branch=master \
+           file://0001-Use-pkgconfig-instead-of-libgcrypt-config.patch \
+          "
+
+inherit autotools pkgconfig systemd bash-completion
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "protobuf-native libxml2-native libxslt-native xmlto-native glib-2.0-native \
+	dbus dbus-glib libqb libcap-ng libgcrypt libsodium protobuf pegtl"
+
+EXTRA_OECONF += "--with-bundled-catch"
+
+PACKAGECONFIG ??= "libsodium \
+	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
+	${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)}"
+
+PACKAGECONFIG[systemd]   = "--enable-systemd,--disable-systemd"
+PACKAGECONFIG[libsodium] = "--with-crypto-library=sodium"
+PACKAGECONFIG[libgcrypt] = "--with-crypto-library=gcrypt"
+PACKAGECONFIG[polkit]    = "--with-polkit,--without-polkit"
+PACKAGECONFIG[dbus]      = "--with-dbus,--without-dbus"
+
+SYSTEMD_SERVICE_${PN} = "${PN}.service"
+SYSTEMD_PACKAGES += "${PN}"
+
+do_install_append(){
+	
+	sed -i 's|/var/log/usbguard/usbguard-audit.log|/var/log/usbguard-audit.log|g' \ 
+						${D}${sysconfdir}/usbguard/usbguard-daemon.conf
+}
-- 
2.17.1


