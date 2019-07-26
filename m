Return-Path: <ayoub.zaki@embexus.com>
Received: from mailrelay2-3.pub.mailoutpod1-cph3.one.com
	(mailrelay2-3.pub.mailoutpod1-cph3.one.com [46.30.212.11])
	by mail.openembedded.org (Postfix) with ESMTP id 997207F119
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jul 2019 09:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=embexus.com; s=20140924;
	h=references:in-reply-to:message-id:date:subject:cc:to:from:from;
	bh=7DJasP+FR8U3Y0y3mapZgIx8k7gyieTVAW1lfls7vNg=;
	b=Wj7+7y2ocIxHGQ9vMhctcBuFKg0UZHN9D7thbpoRvKEoS4cKa+Mp2+eZLBMCVPpn1rF9/r1mMno0r
	iIJUEK+FOz8Y/L/xw/viOJeAbqmHowWN0IOzOjbJo+ahq5hgtW6XwoHAO4BSHawsFIp4Gs769dypKy
	vhUep55S2w5jhAqY=
X-HalOne-Cookie: e532dfbf157871bd365ab23c0fa4e0032bfd6ef8
X-HalOne-ID: 0402d925-af89-11e9-b9fe-d0431ea8a290
Received: from xps.cvs.cvsdiv.com (unknown [193.240.242.3])
	by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 0402d925-af89-11e9-b9fe-d0431ea8a290;
	Fri, 26 Jul 2019 09:37:42 +0000 (UTC)
From: Ayoub Zaki <ayoub.zaki@embexus.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jul 2019 11:37:36 +0200
Message-Id: <20190726093736.24607-2-ayoub.zaki@embexus.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726093736.24607-1-ayoub.zaki@embexus.com>
References: <20190726093736.24607-1-ayoub.zaki@embexus.com>
Subject: [meta-oe][PATCH v3 2/2] usbguard: Initial recipe
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
X-List-Received-Date: Fri, 26 Jul 2019 09:37:43 -0000

Introduce the USBGuard software framework that helps to protect against rogue USB devices (a.k.a. BadUSB)
by implementing basic whitelisting and blacklisting capabilities based on device attributes.
---
 .../usbguard/usbguard_0.7.4.bb                | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb

diff --git a/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb b/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
new file mode 100644
index 000000000..9ec21d2c7
--- /dev/null
+++ b/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
@@ -0,0 +1,35 @@
+DESCRIPTION="USBGuard framework helps to protect against BadUSB."
+HOMEPAGE="https://github.com/dkopecek/usbguard"
+LICENSE="GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022"
+
+SRCREV = "0ab32d7fa092067030fcbef530968b5cc237b08c"
+SRC_URI = "git://git@github.com/USBGuard/usbguard.git;protocol=https;branch=master"
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


