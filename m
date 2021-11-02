Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93121C4332F
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 18:51:50 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.2223.1635879109028395642
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Nov 2021 11:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=MdotKZcC;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635879109;
  x=1667415109;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7gbTlYnJ1ekbNpskM4uZWuSmhbJUYI4z/j9bXHZCu+A=;
  b=MdotKZcCSyQ9wGE05AWIUPZrHUAHv6V1DamOnFweZb25zXD3pdJ3ykc4
   o+mKnvsQYJCmbcRq7os0vRCGUwlu7aVD8ut/JF1OIJ7J7Y8wLjYNQNfDQ
   u69r4+B0zys4oUNTSjftHekhM1/tJ2TcSvUbh8zH9ZcbzUxHO02Hs6HGn
   sayJn6CbMRoUmyZigT+sv/+vBpzwmiEFJ7lLl9bIAQBzxUfM8R++EV1IE
   1wYnGfiHrLRXUDBqxvJaYyrpQVRjSlkY8ENk4vAlM5t6yFZ+3JCtMfldG
   y/fLqJN/SU3T6S2YutQhUsNk2k4TORriqxe8dOVdWL/2ZbRNxjXSiL6xB
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe,meta-networking][PATCH 1/8] corosync: Clean up leftover
 support for qdevice and qnetd
Date: Tue, 2 Nov 2021 19:51:37 +0100
Message-ID: <20211102185144.13556-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Nov 2021 18:51:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93785

These features were removed in commit 5c051f84 (corosync: Update to
3.0.3), but some code still remained.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../corosync/corosync_3.0.3.bb                 | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/meta-networking/recipes-extended/corosync/corosync_3.0.3.bb b/meta-networking/recipes-extended/corosync/corosync_3.0.3.bb
index 909296197..016441be5 100644
--- a/meta-networking/recipes-extended/corosync/corosync_3.0.3.bb
+++ b/meta-networking/recipes-extended/corosync/corosync_3.0.3.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://corosync.github.io/corosync/"
 
 SECTION = "base"
 
-inherit autotools pkgconfig systemd useradd
+inherit autotools pkgconfig systemd
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
            file://corosync.conf \
@@ -18,10 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a85eb4ce24033adb6088dd1d6ffc5e5d"
 
 DEPENDS = "groff-native nss libqb kronosnet"
 
-SYSTEMD_SERVICE:${PN} = "corosync.service corosync-notifyd.service \
-                         ${@bb.utils.contains('PACKAGECONFIG', 'qdevice', 'corosync-qdevice.service', '', d)} \
-                         ${@bb.utils.contains('PACKAGECONFIG', 'qnetd', 'corosync-qnetd.service', '', d)} \
-"
+SYSTEMD_SERVICE:${PN} = "corosync.service corosync-notifyd.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
 INITSCRIPT_NAME = "corosync-daemon"
@@ -43,7 +40,7 @@ EXTRA_OEMAKE = "tmpfilesdir_DATA="
 #}
 
 do_install:append() {
-    install -D -m 0644 ${WORKDIR}/corosync.conf ${D}/${sysconfdir}/corosync/corosync.conf.example
+    install -D -m 0644 ${WORKDIR}/corosync.conf ${D}${sysconfdir}/corosync/corosync.conf.example
     install -d ${D}${sysconfdir}/sysconfig/
     install -m 0644 ${S}/init/corosync.sysconfig.example ${D}${sysconfdir}/sysconfig/corosync
     install -m 0644 ${S}/tools/corosync-notifyd.sysconfig.example ${D}${sysconfdir}/sysconfig/corosync-notifyd
@@ -53,11 +50,6 @@ do_install:append() {
     install -d ${D}${sysconfdir}/default/volatiles
     echo "d root root 0755 ${localstatedir}/log/cluster none" > ${D}${sysconfdir}/default/volatiles/05_corosync
 
-    if [ ${@bb.utils.filter('PACKAGECONFIG', 'qnetd', d)} ]; then
-        chown -R coroqnetd:coroqnetd ${D}${sysconfdir}/${BPN}/qnetd
-        echo "d coroqnetd coroqnetd 0770 /var/run/corosync-qnetd none" >> ${D}${sysconfdir}/default/volatiles/05_corosync
-    fi
-
     if [ ${@bb.utils.filter('DISTRO_FEATURES','systemd',d)} ]; then
         install -d ${D}${sysconfdir}/tmpfiles.d
         echo "d ${localstatedir}/log/cluster - - - -" > ${D}${sysconfdir}/tmpfiles.d/corosync.conf
@@ -68,7 +60,3 @@ RDEPENDS:${PN} += "bash ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sys
 
 FILES:${PN}-dbg += "${libexecdir}/lcrso/.debug"
 FILES:${PN}-doc += "${datadir}/snmp/mibs/COROSYNC-MIB.txt"
-
-USERADD_PACKAGES = "${PN}"
-GROUPADD_PARAM:${PN} = "--system coroqnetd"
-USERADD_PARAM:${PN} = "--system -d / -M -s /bin/nologin -c 'User for corosync-qnetd' -g coroqnetd coroqnetd"

