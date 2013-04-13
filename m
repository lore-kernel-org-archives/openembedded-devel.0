Received: from mail-ea0-f176.google.com ([209.85.215.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR0o6-0007Yi-Bi
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 15:48:52 +0200
Received: by mail-ea0-f176.google.com with SMTP id h10so1628970eaj.21
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=UToymKPWwhZuSoSS/WGN9OFFkMgEFLFMY0DLYn0a6rA=;
	b=QP+UqAW+2TIjNKKmbW1RaErPwVvnWhmem8RA9ajANfA+GAiuTjLsurxvrcVK3TQBlf
	gS1SCJ7Uc7ouSI9IRaN64JnKDtRt7HGo2ntsvjwhXlKNnf+gIrRT2sv5MANdZxqV93Pt
	6loSiU3xVHTyuVPtrXi9Ooiz0wzAKSEDM27O4FTgF/L6Mc7GB+p2F6IA1KcLk8gjwueC
	NsyynJCM1qAbZolf6MX4ATnxWJFjpEgrV53B5v9Zjv5qCQd9XreyO108tjfQsQXbOkKC
	FunljR+Ewv0X+19xhCnNvReUq/UCEli8Y9/FdGZ/xJcXKa2+x9b7J+miAi39X1iCQbuA
	peGg==
X-Received: by 10.15.21.1 with SMTP id c1mr39401109eeu.36.1365859828752;
	Sat, 13 Apr 2013 06:30:28 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id cd3sm16465664eeb.6.2013.04.13.06.30.28
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:30:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 15:29:46 +0200
Message-Id: <1365859790-20947-29-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 29/33] networkmanager: move systemd support from meta-systemd back to meta-oe
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
X-List-Received-Date: Sat, 13 Apr 2013 13:49:24 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../networkmanager/networkmanager_0.9.2.0.bb               | 14 +++++++++-----
 .../networkmanager/networkmanager_0.9.2.0.bbappend         | 13 -------------
 2 files changed, 9 insertions(+), 18 deletions(-)
 delete mode 100644 meta-systemd/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bbappend

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
index 074e665..cc6abd7 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
@@ -4,10 +4,12 @@ SECTION = "net/misc"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b"
 
-PR = "r8"
+PR = "r11"
 
 DEPENDS = "libnl dbus dbus-glib udev wireless-tools polkit gnutls util-linux ppp"
-inherit gnome gettext
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+
+inherit gnome gettext systemd
 
 SRC_URI = "${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.bz2 \
     file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch \
@@ -20,8 +22,6 @@ SRC_URI[sha256sum] = "a178ed2f0b5a1045ec47b217ea531d0feba9208f6bcfe64b701174a5c1
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-SYSTEMD_UNITDIR ??= "no"
-
 EXTRA_OECONF = " \
 		--with-distro=debian \
 		--with-crypto=gnutls \
@@ -29,9 +29,10 @@ EXTRA_OECONF = " \
                 --with-dhclient=${base_sbindir}/dhclient \
                 --with-iptables=${sbindir}/iptables \
                 --with-tests \
-                --with-systemdsystemunitdir=${SYSTEMD_UNITDIR} \
 "
 
+EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
+
 do_configure_prepend() {
     cp ${WORKDIR}/gtk-doc.make ${S}/
     echo "EXTRA_DIST = version.xml" > gnome-doc-utils.make
@@ -71,6 +72,7 @@ FILES_${PN} += " \
 		${datadir}/polkit-1 \
 		${datadir}/dbus-1 \
 		${base_libdir}/udev/* \
+		${systemd_unitdir}/system/NetworkManager-wait-online.service \
 "
 
 RRECOMMENDS_${PN} += "iptables"
@@ -89,3 +91,5 @@ FILES_${PN}-dev += "${datadir}/NetworkManager/gdb-cmd \
 FILES_${PN}-tests = "${bindir}/nm-tool \
                      ${bindir}/libnm_glib_test \
                      ${bindir}/nm-online"
+
+SYSTEMD_SERVICE_${PN} = "NetworkManager.service"
diff --git a/meta-systemd/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bbappend b/meta-systemd/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bbappend
deleted file mode 100644
index 5508fb2..0000000
--- a/meta-systemd/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bbappend
+++ /dev/null
@@ -1,13 +0,0 @@
-PRINC := "${@int(PRINC) + 2}"
-
-inherit systemd
-
-DEPENDS += "systemd"
-
-SYSTEMD_SERVICE_${PN} = "NetworkManager.service"
-SYSTEMD_UNITDIR = "${systemd_unitdir}/system"
-
-# NetworkManager-wait-online is not catched by systemd.bbclass
-FILES_${PN} += " \
-                ${systemd_unitdir}/system/NetworkManager-wait-online.service \
-"
-- 
1.8.1.5



