Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpbSt-000869-6y
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:43:08 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2247718bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=LDE8E2EHJQrLUE8YEbkkL5kGxgJ1UlwkLCEwi15gUBc=;
	b=zD0lv0o/qrlsCbwRCjaekMxtyWe6irlLXSX12NYDfElJiY1Ky4RN90wHDcid+XxJOG
	EcpPXZ3ls67ERwhRr/mVLLoF59IISUBDbhrdZ3dlHYRpHUCDH+Fk5i0ioRJp7PHMFDLo
	ksbVRc5O9WAb3Nsb5Zayja5U4pEUxX4iCxdvq+uPG8TVO22KdqDEZfb8s4SqkbuIO7sr
	mfkCyJZgmEY67awlVD6WNvN1RkJcYVx+APd6q2hVD3Z9Dn+1d/9HYx1ykjO4oVXr1BfX
	PKXElQGqPlE+Fi6K6ejbfiaeUmCq0ft/jjp/QCwWlpuKVd8qKogPtAgy6G6+SHFeXcpe
	0VkQ==
Received: by 10.205.126.14 with SMTP id gu14mr102090bkc.137.1342168315371;
	Fri, 13 Jul 2012 01:31:55 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4214355bkc.5.2012.07.13.01.31.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 01:31:54 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 10:30:40 +0200
Message-Id: <1342168240-7760-33-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, V2 32/32] networkmanager: move systemd support to meta-systemd
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
X-List-Received-Date: Fri, 13 Jul 2012 08:43:10 -0000
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
1.7.6.5



