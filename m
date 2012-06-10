Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sdq3t-0001fo-I5
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jun 2012 23:52:42 +0200
Received: by mail-wi0-f177.google.com with SMTP id hm14so2039672wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2012 14:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=EiLnuVkU0QOBNEdz626Z8t5X6zxca2HspMMjcWoze5M=;
	b=ci5ZOCUcvJ0wzsXs5aaPuoywJFJ2fRqcKaG9ZFHMBwW7edmufS0tRD9p650fs3uAL1
	rr+Lu0OZYRxXkJHaxt4ycEaK1poVn8BEEi4bZFtfpJr+T2rfNB5F/kVpS94z92OFY6CC
	I8gKOCBBvCfPuWatWKxlODUNjR7yJctMwUWtOobRChQNXrTeNnYEAXJSCDW1BTVtKkau
	d2s1BFXGTtH/o1C/kmElZI9EvoWEGDYfqfEant6yXxCNvPTNmYDIki3prFYpnzqDh26q
	ZZ1HMaztaWGH6WasaxlcF9M3YbfklB1C5ZiQ1I72ypFEOA4H0vmnwkbTQSxzhrx9TXpU
	p1dA==
Received: by 10.180.101.170 with SMTP id fh10mr17944143wib.0.1339364531207;
	Sun, 10 Jun 2012 14:42:11 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2104.dip.t-dialin.net. [91.10.33.4])
	by mx.google.com with ESMTPS id gc6sm19758306wib.0.2012.06.10.14.42.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Jun 2012 14:42:10 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2012 23:47:00 +0200
Message-Id: <1339364820-2880-28-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
References: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [RFC, meta-oe 27/27] networkmanager: move systemd support to meta-systemd
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
X-List-Received-Date: Sun, 10 Jun 2012 21:52:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../networkmanager/networkmanager_0.9.2.0.bb       |   13 ++++++-------
 .../networkmanager/networkmanager_0.9.2.0.bbappend |   14 ++++++++++++++
 2 files changed, 20 insertions(+), 7 deletions(-)
 create mode 100644 meta-systemd/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bbappend

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
index 221dc2c..e774cb9 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
@@ -4,10 +4,10 @@ SECTION = "net/misc"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b"
 
-PR = "r6"
+PR = "r7"
 
-DEPENDS = "systemd libnl dbus dbus-glib udev wireless-tools polkit gnutls util-linux ppp"
-inherit gnome gettext systemd
+DEPENDS = "libnl dbus dbus-glib udev wireless-tools polkit gnutls util-linux ppp"
+inherit gnome gettext
 
 SRC_URI = "${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.bz2 \
     file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch \
@@ -19,6 +19,8 @@ SRC_URI[sha256sum] = "a178ed2f0b5a1045ec47b217ea531d0feba9208f6bcfe64b701174a5c1
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
+SYSTEMD_UNITDIR ??= "no"
+
 EXTRA_OECONF = " \
 		--with-distro=debian \
 		--with-crypto=gnutls \
@@ -26,6 +28,7 @@ EXTRA_OECONF = " \
                 --with-dhclient=${base_sbindir}/dhclient \
                 --with-iptables=${sbindir}/iptables \
                 --with-tests \
+                --with-systemdsystemunitdir=${SYSTEMD_UNITDIR} \
 "
 
 do_configure_prepend() {
@@ -54,9 +57,6 @@ do_install_append () {
 	install -d ${D}/etc/NetworkManager/VPN
 }
 
-SYSTEMD_PACKAGES = "${PN}"
-SYSTEMD_SERVICE = "NetworkManager.service"
-
 PACKAGES =+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests" 
 
 FILES_libnmutil += "${libdir}/libnm-util.so.*"
@@ -70,7 +70,6 @@ FILES_${PN} += " \
 		${datadir}/polkit-1 \
 		${datadir}/dbus-1 \
 		${base_libdir}/udev/* \
-                ${systemd_unitdir}/system/NetworkManager-wait-online.service \
 "
 
 RRECOMMENDS_${PN} += "iptables"
diff --git a/meta-systemd/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bbappend b/meta-systemd/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bbappend
new file mode 100644
index 0000000..6ae5d75
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bbappend
@@ -0,0 +1,14 @@
+PRINC := "${@int(PRINC) + 1}"
+
+inherit systemd
+
+DEPENDS += "systemd"
+
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE = "NetworkManager.service"
+SYSTEMD_UNITDIR = "${systemd_unitdir}/system"
+
+# NetworkManager-wait-online is not catched by systemd.bbclass
+FILES_${PN} += " \
+                ${systemd_unitdir}/system/NetworkManager-wait-online.service \
+"
-- 
1.7.4.4



