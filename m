Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rumr7-0001KV-I5
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:21:18 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so1955924eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=HOn3mCg8ngerXs8Tpsu2ESvq0Pt/XHMbad6MHD9MmCs=;
	b=Z9sTWeTZdLl+3JYpjFOsU6dHdR7l5RHCl/CvFXnAxLi0PLN6n6rEYZrWwj/PbNMR+E
	avDaLkRLxxNa5j4oneoIMCftxC8sx23mzpI6t4l9u675bI+mvenXQ39neVdtGmOBQCJ3
	n3Fb+VkCoj1kNPHlh+RlAWWV7A5GkN6IUZoPs=
Received: by 10.213.7.136 with SMTP id d8mr2148273ebd.102.1328627597497;
	Tue, 07 Feb 2012 07:13:17 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n58sm1424741een.10.2012.02.07.07.13.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:13:16 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Feb 2012 16:12:49 +0100
Message-Id: <1328627573-5217-24-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][RFC 23/27] networkmanager: inherit systemd / added NetworkManager-wait-online.service / remove unneeded systemd code
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
X-List-Received-Date: Tue, 07 Feb 2012 15:21:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../networkmanager/networkmanager_0.9.2.0.bb       |   26 ++++---------------
 1 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
index 1dcc3cf..02b5664 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
@@ -4,10 +4,10 @@ SECTION = "net/misc"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b"
 
-PR = "r2"
+PR = "r3"
 
-DEPENDS = "systemd libnl dbus dbus-glib udev wireless-tools polkit gnutls util-linux ppp"
-inherit gnome gettext
+DEPENDS = "libnl dbus dbus-glib udev wireless-tools polkit gnutls util-linux ppp ${@base_conditional('INIT_MANAGER', 'systemd', 'systemd', '', d)}"
+inherit gnome gettext systemd
 
 SRC_URI = "${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.bz2 \
     file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch \
@@ -27,6 +27,9 @@ EXTRA_OECONF = " \
         --with-iptables=${sbindir}/iptables \
 "
 
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE_${PN}-systemd = "NetworkManager.service NetworkManager-wait-online.service"
+
 do_configure_prepend() {
     cp ${WORKDIR}/gtk-doc.make ${S}/
     echo "EXTRA_DIST = version.xml" > gnome-doc-utils.make
@@ -70,7 +73,6 @@ FILES_${PN} += " \
 		${datadir}/polkit-1 \
 		${datadir}/dbus-1 \
 		${base_libdir}/udev/* \
-        ${base_libdir}/systemd \
 "
 
 RRECOMMENDS_${PN} += "iptables"
@@ -96,20 +98,4 @@ FILES_${PN}-tests = "${bindir}/nm-tool \
                      ${bindir}/nm-testdevices"
 
 
-pkg_postinst_${PN}() {
-    # can't do this offline
-    if [ "x$D" != "x" ]; then
-        exit 1
-    fi
-    
-    systemctl enable NetworkManager.service
-}
-
-pkg_prerm_${PN}() {
-    # can't do this offline
-    if [ "x$D" != "x" ]; then
-        exit 1
-    fi
 
-    systemctl disable NetworkManager.service
-}
-- 
1.7.6.4



