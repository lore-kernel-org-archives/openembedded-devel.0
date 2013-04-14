Received: from mail-ea0-f174.google.com ([209.85.215.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1URNa8-0000hO-L6
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Apr 2013 16:07:04 +0200
Received: by mail-ea0-f174.google.com with SMTP id m14so1868128eaj.33
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2013 06:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=ZEGkYxozHG49of9jRKJsfa5Une5OJBuNW7KhWvvUJwE=;
	b=DahyiVgVIk/UYNIPSMYwkSgX81mgv7q1XPmx1CxPPsHt6rSIqeiys4q9sAdUSu/u3T
	iG3BwRE2lYdYLHOMXIuNbndatigdmgVkxYRd7PNt3n/j8985bWBAl1hhohPJl5BnlVLT
	PERT5MMVZGFlqES+mK8sJ3tO6wgbxhrE29mA/1Joj0SK0i0Wdvmfz5kNQEjKm80YifB9
	Ejw/zfQ255cxK8y9G0Xpa4lBWG4IcjyB6R0yDjIRCfHG7JfL54sFQNUrILD+6X7iHWqt
	j1v8p0bBtBJBrktf37hL0zqh2Tttv4uT6398lKVxdeJEokrDqakF0s1gNEl1jBhUiSg+
	qtuA==
X-Received: by 10.15.48.4 with SMTP id g4mr50776544eew.28.1365947373411;
	Sun, 14 Apr 2013 06:49:33 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id a2sm20170711eem.11.2013.04.14.06.49.31
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 14 Apr 2013 06:49:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Apr 2013 15:49:34 +0200
Message-Id: <1365947374-20385-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-oe][PATCH] dnsmasq: merge dnsmasq-dbus to main recipe
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
X-List-Received-Date: Sun, 14 Apr 2013 14:07:05 -0000

* they conflict in sysroot anyway, should be converted to PACKAGECONFIG
  but because dbus is already built in most images I'll let it for someone
  who has such use-case

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/dnsmasq/dnsmasq-dbus_2.55.bb | 13 -------------
 meta-oe/recipes-connectivity/dnsmasq/dnsmasq.inc          | 12 ++++++++++++
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/meta-oe/recipes-connectivity/dnsmasq/dnsmasq-dbus_2.55.bb b/meta-oe/recipes-connectivity/dnsmasq/dnsmasq-dbus_2.55.bb
index 896952d..e69de29 100644
--- a/meta-oe/recipes-connectivity/dnsmasq/dnsmasq-dbus_2.55.bb
+++ b/meta-oe/recipes-connectivity/dnsmasq/dnsmasq-dbus_2.55.bb
@@ -1,13 +0,0 @@
-# dnsmasq with support for DBus interface
-
-require dnsmasq_${PV}.bb
-
-S = "${WORKDIR}/dnsmasq-${PV}"
-
-DEPENDS = "dbus"
-EXTRA_OEMAKE = "COPTS=-DHAVE_DBUS"
-
-do_install_append () {
-        install -d ${D}${sysconfdir}/dbus-1/system.d
-        install -m 644 dbus/dnsmasq.conf ${D}${sysconfdir}/dbus-1/system.d/
-}
diff --git a/meta-oe/recipes-connectivity/dnsmasq/dnsmasq.inc b/meta-oe/recipes-connectivity/dnsmasq/dnsmasq.inc
index ef99f48..fa42dd2 100644
--- a/meta-oe/recipes-connectivity/dnsmasq/dnsmasq.inc
+++ b/meta-oe/recipes-connectivity/dnsmasq/dnsmasq.inc
@@ -6,6 +6,8 @@ LICENSE = "GPLv2 GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://COPYING-v3;md5=d32239bcb673463ab874e80d47fae504"
 
+PR = "r1"
+
 #at least versions 2.15 and prior are moved to the archive folder on the server
 SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getVar('PV',1).split('.')[1]) > 15]}dnsmasq-${PV}.tar.gz;name=dnsmasq-${PV} \
            file://init \
@@ -13,6 +15,9 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://dnsmasq.service \
 "
 
+DEPENDS = "dbus"
+EXTRA_OEMAKE = "COPTS=-DHAVE_DBUS"
+
 inherit update-rc.d systemd
 
 INITSCRIPT_NAME = "dnsmasq"
@@ -27,6 +32,9 @@ do_install () {
         install -m 644 ${WORKDIR}/dnsmasq.conf ${D}${sysconfdir}/
         install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq
 
+        install -d ${D}${sysconfdir}/dbus-1/system.d
+        install -m 644 dbus/dnsmasq.conf ${D}${sysconfdir}/dbus-1/system.d/
+
         install -d ${D}${systemd_unitdir}/system
         install -m 0644 ${WORKDIR}/dnsmasq.service ${D}${systemd_unitdir}/system
 }
@@ -37,3 +45,7 @@ RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "dnsmasq.service"
+
+RPROVIDES_${PN} += "${PN}-dbus"
+RREPLACES_${PN} += "${PN}-dbus"
+RCONFLICTS_${PN} += "${PN}-dbus"
-- 
1.8.1.5



