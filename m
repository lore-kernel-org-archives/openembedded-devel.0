Return-Path: <ayoub.zaki@embexus.com>
Received: from mailrelay4-3.pub.mailoutpod1-cph3.one.com
	(mailrelay4-3.pub.mailoutpod1-cph3.one.com [46.30.212.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2F3207EF31
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 18:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=embexus.com; s=20140924;
	h=references:in-reply-to:message-id:date:subject:cc:to:from:from;
	bh=/TpQLXZWhLoM8DdmSpAWXyEesbxuyAgAf35i1TSbbMg=;
	b=aAKjULp2coksNIicgwFfP/ih5vWkvn3tWE+HzJ7R1nUANRE1VzLhVxIxH9uSHRLJWQCu+rRcD0GAn
	fW1ZewMTe0oz0PTIh0hhS0xz6cEJ9iQyWLHA7cpNm1jfCWkdTENApGXpcUXrNN56GzL4OJa3ZzGbGb
	bMns58W/iSj+HpVg=
X-HalOne-Cookie: 5460074504cbf42be945731ad99b4f6c7ff2e8d1
X-HalOne-ID: 9320028b-abe8-11e9-8280-d0431ea8bb10
Received: from xps.fritz.box (unknown [77.181.243.113])
	by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 9320028b-abe8-11e9-8280-d0431ea8bb10;
	Sun, 21 Jul 2019 18:51:40 +0000 (UTC)
From: Ayoub Zaki <ayoub.zaki@embexus.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jul 2019 20:51:37 +0200
Message-Id: <20190721185137.27323-2-ayoub.zaki@embexus.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190721185137.27323-1-ayoub.zaki@embexus.com>
References: <20190721185137.27323-1-ayoub.zaki@embexus.com>
Subject: [meta-oe][PATCH v2 2/2] usbguard: Initial recipe
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
X-List-Received-Date: Sun, 21 Jul 2019 18:51:40 -0000

Introduce the USBGuard software framework that helps to protect against rogue USB devices (a.k.a. BadUSB)
by implementing basic whitelisting and blacklisting capabilities based on device attributes.
---
 .../usbguard/usbguard_0.7.4.bb                | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb

diff --git a/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb b/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
new file mode 100644
index 000000000..eee381fbe
--- /dev/null
+++ b/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
@@ -0,0 +1,37 @@
+DESCRIPTION="USBGuard framework helps to protect against BadUSB."
+HOMEPAGE="https://github.com/dkopecek/usbguard"
+LICENSE="GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022"
+
+SRC_URI="https://github.com/USBGuard/usbguard/archive/${BP}.tar.gz"
+SRC_URI[md5sum] = "ddaa9ae884200c861ad946f34dfd5ab9"
+SRC_URI[sha256sum] = "d37886508583565aae0df6a110b11524c59b39e0deb25ee49fc34274e4784f55"
+
+inherit autotools pkgconfig systemd bash-completion
+
+S= "${WORKDIR}/${BPN}-${BP}"
+
+DEPENDS = "protobuf-native libxml2-native libxslt-native xmlto-native glib-2.0-native \
+	dbus dbus-glib libqb libseccomp libcap-ng libgcrypt libsodium protobuf pegtl"
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
+
+do_install_append(){
+	
+	sed -i 's|/var/log/usbguard/usbguard-audit.log|/var/log/usbguard-audit.log|g' \ 
+						${D}${sysconfdir}/usbguard/usbguard-daemon.conf
+}
-- 
2.17.1


