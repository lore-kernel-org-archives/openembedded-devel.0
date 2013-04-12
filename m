Received: from mail-pd0-f177.google.com ([209.85.192.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQcez-0005eI-Ac
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Apr 2013 14:00:54 +0200
Received: by mail-pd0-f177.google.com with SMTP id u11so1354883pdi.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2013 04:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=8cpjw6vijYDWqf58YcSg/w3LTY86liO55aYPOiu7TTU=;
	b=NJlOePYyc4FpQsgyV+SMbrr5IRidmoFLNK27apLHrtFF16IMAzPeU6zZHCL+t7KrL6
	UnTL0tKXYnZWPYu5X7DlW0c/YOyztxgRihoDe3pvxRuqCyx1PCO1g3GZEnOmZ7qoapYq
	Xkxg7Rmp9UJWlBcKbTDPLAizzO8qHQHGwd539sFxCANyGtsZmMMYEbaWZWFR/jsffXe7
	vMXQ8BHW27F9/GTUaiEdaRZQZydSUPzmHoVXYX9Zb/SiwUdxRrvsh6lNP9LvFbz9rROK
	rQSJonX38IRDtkQxKRqNNyLT3tnpcH8WjiTIICDB51c7Pb8MsV9TFssEJlOGyykLOYPd
	k/PQ==
X-Received: by 10.68.17.202 with SMTP id q10mr14115367pbd.146.1365767007035;
	Fri, 12 Apr 2013 04:43:27 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id qh4sm9256230pac.8.2013.04.12.04.43.24
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 04:43:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Apr 2013 13:43:18 +0200
Message-Id: <1365766998-22624-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-systemd][PATCH] meta-systemd: Add not only RPROVIDES, but also RREPLACES/RCONFLICTS
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
X-List-Received-Date: Fri, 12 Apr 2013 12:00:54 -0000

with this combo opkg should automatically remove PN-systemd and replace it with PN
---
 meta-systemd/meta-efl/recipes-efl/efl/entrance_svn.bbappend         | 2 ++
 meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend       | 2 ++
 .../meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bbappend  | 2 ++
 .../meta-networking/recipes-daemons/autofs/autofs_5.0.7.bbappend    | 2 ++
 .../meta-networking/recipes-support/nis/yp-tools_2.12.bbappend      | 2 ++
 .../meta-networking/recipes-support/nis/ypbind-mt_1.36.bbappend     | 2 ++
 .../meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappend        | 4 ++++
 meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend       | 2 ++
 .../meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bbappend  | 2 ++
 .../meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bbappend      | 2 ++
 .../meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend         | 2 ++
 meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend    | 2 ++
 meta-systemd/meta-oe/recipes-extended/at/at_3.1.13.bbappend         | 2 ++
 meta-systemd/meta-oe/recipes-extended/atftp/atftp_git.bbappend      | 2 ++
 .../meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bbappend       | 4 ++++
 .../meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend         | 2 ++
 .../meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bbappend         | 2 ++
 meta-systemd/meta-oe/recipes-extended/zram/zram_0.1.bbappend        | 2 ++
 meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend        | 2 ++
 .../xinput-calibrator/xinput-calibrator_git.bbappend                | 2 ++
 .../xserver-nodm-init/xserver-nodm-init_2.0.bbappend                | 2 ++
 meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bbappend      | 2 ++
 .../recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bbappend   | 2 ++
 .../meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bbappend      | 2 ++
 .../meta-oe/recipes-support/strongswan/strongswan_5.0.0.bbappend    | 2 ++
 meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend   | 2 ++
 .../oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend        | 2 ++
 .../oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend        | 2 ++
 .../oe-core/recipes-connectivity/connman/connman_1.12.bbappend      | 2 ++
 meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5.bbappend  | 6 ++++++
 meta-systemd/oe-core/recipes-connectivity/ofono/ofono_1.12.bbappend | 2 ++
 .../oe-core/recipes-connectivity/openssh/openssh_6.1p1.bbappend     | 2 ++
 .../oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend       | 2 ++
 .../recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend | 2 ++
 .../oe-core/recipes-core/util-linux/util-linux_2.22.2.bbappend      | 2 ++
 meta-systemd/oe-core/recipes-extended/cronie/cronie_1.4.9.bbappend  | 2 ++
 .../oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend      | 2 ++
 37 files changed, 82 insertions(+)

diff --git a/meta-systemd/meta-efl/recipes-efl/efl/entrance_svn.bbappend b/meta-systemd/meta-efl/recipes-efl/efl/entrance_svn.bbappend
index 64f1444..63c33fb 100644
--- a/meta-systemd/meta-efl/recipes-efl/efl/entrance_svn.bbappend
+++ b/meta-systemd/meta-efl/recipes-efl/efl/entrance_svn.bbappend
@@ -7,6 +7,8 @@ inherit systemd
 SRC_URI += "file://entrance.service"
 
 RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
 
 SYSTEMD_SERVICE_${PN} = "entrance.service"
 
diff --git a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
index 22e7419..6201352 100644
--- a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
+++ b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
@@ -15,4 +15,6 @@ do_install_append() {
 }
 
 RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "gdm.service"
diff --git a/meta-systemd/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bbappend b/meta-systemd/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bbappend
index 0b302c6..a3f5f3b 100644
--- a/meta-systemd/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bbappend
+++ b/meta-systemd/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bbappend
@@ -11,4 +11,6 @@ do_install_append() {
 }
 
 RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "mpd.service"
diff --git a/meta-systemd/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bbappend b/meta-systemd/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bbappend
index f22f4df..69ea5d3 100644
--- a/meta-systemd/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bbappend
+++ b/meta-systemd/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bbappend
@@ -3,4 +3,6 @@ inherit systemd
 PRINC := "${@int(PRINC) + 2}"
 
 RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "autofs.service"
diff --git a/meta-systemd/meta-networking/recipes-support/nis/yp-tools_2.12.bbappend b/meta-systemd/meta-networking/recipes-support/nis/yp-tools_2.12.bbappend
index 2fc0334..d5ea1ca 100644
--- a/meta-systemd/meta-networking/recipes-support/nis/yp-tools_2.12.bbappend
+++ b/meta-systemd/meta-networking/recipes-support/nis/yp-tools_2.12.bbappend
@@ -8,6 +8,8 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 SRC_URI += "file://domainname.service"
 
 RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "domainname.service"
 
 do_install_append() {
diff --git a/meta-systemd/meta-networking/recipes-support/nis/ypbind-mt_1.36.bbappend b/meta-systemd/meta-networking/recipes-support/nis/ypbind-mt_1.36.bbappend
index 9218b7e..8f11247 100644
--- a/meta-systemd/meta-networking/recipes-support/nis/ypbind-mt_1.36.bbappend
+++ b/meta-systemd/meta-networking/recipes-support/nis/ypbind-mt_1.36.bbappend
@@ -8,6 +8,8 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 SRC_URI += "file://ypbind.service"
 
 RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "ypbind.service"
 do_install_append() {
 	install -d ${D}${systemd_unitdir}/system
diff --git a/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappend b/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappend
index ccb3d45..7f2a796 100644
--- a/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappend
+++ b/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappend
@@ -8,7 +8,11 @@ SYSTEMD_PACKAGES = "${PN} ntpdate"
 SYSTEMD_SERVICE_${PN} = "ntpd.service"
 SYSTEMD_SERVICE_ntpdate = "ntpdate.service"
 RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
 RPROVIDES_ntpdate += "ntpdate-systemd"
+RREPLACES_ntpdate += "ntpdate-systemd"
+RCONFLICTS_ntpdate += "ntpdate-systemd"
 
 FILES_ntpdate += "${systemd_unitdir}/system/ntpdate.service"
 
diff --git a/meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend b/meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend
index 672c29d..9d97025 100644
--- a/meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend
+++ b/meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend
@@ -5,6 +5,8 @@ SRC_URI += " file://keymaps.service"
 
 inherit systemd
 RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "${PN}.service"
 
 do_install_append() {
diff --git a/meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bbappend b/meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bbappend
index 22aa563..b792c62 100644
--- a/meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bbappend
+++ b/meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bbappend
@@ -7,6 +7,8 @@ inherit systemd
 SRC_URI += "file://cherokee.service"
 
 RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "cherokee.service"
 
 do_install_append() {
diff --git a/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bbappend b/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bbappend
index bc58446..148586e 100644
--- a/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bbappend
+++ b/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bbappend
@@ -7,6 +7,8 @@ inherit systemd
 SRC_URI += "file://dnsmasq.service"
 
 RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "dnsmasq.service"
 
 do_install_append() {
diff --git a/meta-systemd/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend b/meta-systemd/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend
index 3d4d98b..23e2820 100644
--- a/meta-systemd/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend
+++ b/meta-systemd/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend
@@ -10,6 +10,8 @@ SRC_URI += "file://dropbearkey.service \
             file://dropbear.socket"
 
 RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "dropbear.socket"
 
 do_install_append() {
diff --git a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend
index 394db21..50c6886 100644
--- a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend
+++ b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend
@@ -10,6 +10,8 @@ inherit systemd
 
 NATIVE_SYSTEMD_SUPPORT = "1"
 RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "cloud9.service"
 do_install_append() {
 	install -d ${D}${systemd_unitdir}/system
diff --git a/meta-systemd/meta-oe/recipes-extended/at/at_3.1.13.bbappend b/meta-systemd/meta-oe/recipes-extended/at/at_3.1.13.bbappend
index 0dd3675..3d58a64 100644
--- a/meta-systemd/meta-oe/recipes-extended/at/at_3.1.13.bbappend
+++ b/meta-systemd/meta-oe/recipes-extended/at/at_3.1.13.bbappend
@@ -8,6 +8,8 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 SRC_URI += "file://atd.service"
 
 RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "atd.service"
 do_install_append() {
 	install -d ${D}${systemd_unitdir}/system
diff --git a/meta-systemd/meta-oe/recipes-extended/atftp/atftp_git.bbappend b/meta-systemd/meta-oe/recipes-extended/atftp/atftp_git.bbappend
index de3fe51..e58306f 100644
--- a/meta-systemd/meta-oe/recipes-extended/atftp/atftp_git.bbappend
+++ b/meta-systemd/meta-oe/recipes-extended/atftp/atftp_git.bbappend
@@ -10,6 +10,8 @@ SYSTEMD_PACKAGES = "atftpd"
 SYSTEMD_SERVICE_atftpd = "atftpd.service"
 FILES_atftpd += "${systemd_unitdir}/system/atftpd.service"
 RPROVIDES_atftpd += "atftpd-systemd"
+RREPLACES_atftpd += "atftpd-systemd"
+RCONFLICTS_atftpd += "atftpd-systemd"
 do_install_append() {
 	install -d ${D}${systemd_unitdir}/system
 	install -m 0644 ${WORKDIR}/atftpd.service ${D}${systemd_unitdir}/system
diff --git a/meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bbappend b/meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bbappend
index dfffccc..c3538b3 100644
--- a/meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bbappend
+++ b/meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bbappend
@@ -23,6 +23,10 @@ SYSTEMD_PACKAGES = "${PN}-server-snmpd-systemd \
 SYSTEMD_SERVICE_${PN}-server-snmpd = "snmpd.service"
 SYSTEMD_SERVICE_${PN}-server-snmptrapd =  "snmptrapd.service"
 RPROVIDES_${PN}-server-snmpd += "${PN}-server-snmpd-systemd"
+RREPLACES_${PN}-server-snmpd += "${PN}-server-snmpd-systemd"
+RCONFLICTS_${PN}-server-snmpd += "${PN}-server-snmpd-systemd"
 RPROVIDES_${PN}-server-snmptrapd += "${PN}-server-snmptrapd-systemd"
+RREPLACES_${PN}-server-snmptrapd += "${PN}-server-snmptrapd-systemd"
+RCONFLICTS_${PN}-server-snmptrapd += "${PN}-server-snmptrapd-systemd"
 FILES_${PN}-server-snmpd += "${systemd_unitdir}/system/snmpd.service"
 FILES_${PN}-server-snmptrapd += "${systemd_unitdir}/system/snmptrapd.service"
diff --git a/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend b/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend
index 42bcaa7..6586809 100644
--- a/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend
+++ b/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend
@@ -8,6 +8,8 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 SRC_URI += "file://rpcbind.service"
 
 RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "rpcbind.service"
 
 do_install_append() {
diff --git a/meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bbappend b/meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bbappend
index 8404d01..64ef39d 100644
--- a/meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bbappend
+++ b/meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bbappend
@@ -7,4 +7,6 @@ DEPENDS += "systemd"
 SYSTEMD_UNITDIR = "${systemd_unitdir}/system"
 
 RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "${PN}.service"
diff --git a/meta-systemd/meta-oe/recipes-extended/zram/zram_0.1.bbappend b/meta-systemd/meta-oe/recipes-extended/zram/zram_0.1.bbappend
index 3b73354..227c1c7 100644
--- a/meta-systemd/meta-oe/recipes-extended/zram/zram_0.1.bbappend
+++ b/meta-systemd/meta-oe/recipes-extended/zram/zram_0.1.bbappend
@@ -9,6 +9,8 @@ SRC_URI += " \
 "
 
 RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "zram.service"
 
 do_install_append() {
diff --git a/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend b/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend
index 697db03..a3e97bb 100644
--- a/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend
+++ b/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend
@@ -5,4 +5,6 @@ inherit systemd
 
 SYSTEMD_UNITDIR = "${systemd_unitdir}/system"
 RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "lxdm.service"
diff --git a/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend b/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend
index c7389d4..5c14346 100644
--- a/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend
+++ b/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend
@@ -7,6 +7,8 @@ inherit systemd
 SRC_URI += "file://xinput-calibrator.service"
 
 RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "${PN}.service"
 
 do_install_append() {
diff --git a/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend b/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend
index f5e98fd..cae5a3c 100644
--- a/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend
+++ b/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend
@@ -16,6 +16,8 @@ do_install_append() {
 }
 
 RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "xserver-nodm.service"
 
 FILES_${PN} += "${sysconfdir}/default/xserver-nodm"
diff --git a/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bbappend b/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bbappend
index 0d96a68..375e855 100644
--- a/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bbappend
+++ b/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bbappend
@@ -7,6 +7,8 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 SRC_URI += "file://gpsd.service"
 
 RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "${PN}.socket"
 SYSTEMD_OESCONS = "true"
 
diff --git a/meta-systemd/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bbappend b/meta-systemd/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bbappend
index 7763727..0ed05df 100644
--- a/meta-systemd/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bbappend
+++ b/meta-systemd/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bbappend
@@ -8,4 +8,6 @@ EXTRA_OECONF += " \
 "
 
 RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "${PN}.service"
diff --git a/meta-systemd/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bbappend b/meta-systemd/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bbappend
index 7f1c682..f877801 100644
--- a/meta-systemd/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bbappend
+++ b/meta-systemd/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bbappend
@@ -3,4 +3,6 @@ inherit systemd
 PRINC := "${@int(PRINC) + 2}"
 
 RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "pcscd.socket"
diff --git a/meta-systemd/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bbappend b/meta-systemd/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bbappend
index 31db08a..0a474fe 100644
--- a/meta-systemd/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bbappend
+++ b/meta-systemd/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bbappend
@@ -5,4 +5,6 @@ PRINC := "${@int(PRINC) + 2}"
 SYSTEMD_UNITDIR = "${systemd_unitdir}/system"
 
 RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "${PN}.service"
diff --git a/meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend b/meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend
index a6b4da0..5f30216 100644
--- a/meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend
+++ b/meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend
@@ -10,5 +10,7 @@ DEPENDS += "systemd"
 SRC_URI += "file://add-systemd-support.patch"
 
 RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "udisks-daemon.service"
 SYSTEMD_AUTO_ENABLE = "disable"
diff --git a/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend b/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend
index 13a2ee4..d3f4775 100644
--- a/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend
@@ -3,6 +3,8 @@ PRINC := "${@int(PRINC) + 2}"
 inherit systemd
 
 RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "avahi-daemon.service"
 SYSTEMD_AUTO_ENABLE = "enable"
 
diff --git a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend b/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
index 752e6c1..495fffa 100644
--- a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
@@ -5,5 +5,7 @@ inherit systemd
 EXTRA_OECONF += "--with-systemdunitdir=${systemd_unitdir}/system/"
 
 RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "bluetooth.service"
 SYSTEMD_AUTO_ENABLE = "disable"
diff --git a/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.12.bbappend b/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.12.bbappend
index 96a428f..61292ad 100644
--- a/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.12.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.12.bbappend
@@ -1,4 +1,6 @@
 PRINC := "${@int(PRINC) + 2}"
 
 RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "connman.service"
diff --git a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5.bbappend b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5.bbappend
index d3a322a..5fbe857 100644
--- a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5.bbappend
@@ -14,8 +14,14 @@ FILES_dhcp-server += "${systemd_unitdir}/system/dhcpd.service"
 FILES_dhcp-relay += "${systemd_unitdir}/system/dhrelay.service"
 FILES_dhcp-client += "${systemd_unitdir}/system/dhclient.service"
 RPROVIDES_dhcp-server += "dhcp-server-systemd"
+RREPLACES_dhcp-server += "dhcp-server-systemd"
+RCONFLICTS_dhcp-server += "dhcp-server-systemd"
 RPROVIDES_dhcp-relay += "dhcp-relay-systemd"
+RREPLACES_dhcp-relay += "dhcp-relay-systemd"
+RCONFLICTS_dhcp-relay += "dhcp-relay-systemd"
 RPROVIDES_dhcp-client += "dhcp-client-systemd"
+RREPLACES_dhcp-client += "dhcp-client-systemd"
+RCONFLICTS_dhcp-client += "dhcp-client-systemd"
 
 SRC_URI += "file://dhcpd.service \
             file://dhclient.service \
diff --git a/meta-systemd/oe-core/recipes-connectivity/ofono/ofono_1.12.bbappend b/meta-systemd/oe-core/recipes-connectivity/ofono/ofono_1.12.bbappend
index 94fce48..914117a 100644
--- a/meta-systemd/oe-core/recipes-connectivity/ofono/ofono_1.12.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/ofono/ofono_1.12.bbappend
@@ -3,5 +3,7 @@ PRINC := "${@int(PRINC) + 2}"
 inherit systemd
 
 RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "ofono.service"
 SYSTEMD_AUTO_ENABLE = "disable"
diff --git a/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.1p1.bbappend b/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.1p1.bbappend
index 0d1bb56..fe61a89 100644
--- a/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.1p1.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.1p1.bbappend
@@ -6,6 +6,8 @@ SYSTEMD_PACKAGES = "openssh-sshd"
 SYSTEMD_SERVICE_openssh-sshd = "sshd.socket"
 FILES_openssh-sshd += "${systemd_unitdir}/system/sshd.socket"
 RPROVIDES_openssh-sshd += "openssh-sshd-systemd"
+RREPLACES_openssh-sshd += "openssh-sshd-systemd"
+RCONFLICTS_openssh-sshd += "openssh-sshd-systemd"
 
 inherit systemd
 
diff --git a/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend b/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend
index 784fc1f..b7ab2a4 100644
--- a/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend
@@ -5,6 +5,8 @@ PRINC := "${@int(PRINC) + 2}"
 inherit systemd
 
 RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "portmap.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
diff --git a/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend
index dcd9b84..cffb898 100644
--- a/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend
@@ -1,3 +1,5 @@
 PRINC := "${@int(PRINC) + 4}"
 
 RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
diff --git a/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.22.2.bbappend b/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.22.2.bbappend
index 12a9823..fae15a0 100644
--- a/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.22.2.bbappend
+++ b/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.22.2.bbappend
@@ -5,4 +5,6 @@ PRINC := "${@int(PRINC) + 2}"
 SYSTEMD_UNITDIR = "${systemd_unitdir}/system"
 EXTRA_OECONF += "--enable-socket-activation --with-systemdsystemunitdir=${SYSTEMD_UNITDIR}"
 RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "uuidd.socket"
diff --git a/meta-systemd/oe-core/recipes-extended/cronie/cronie_1.4.9.bbappend b/meta-systemd/oe-core/recipes-extended/cronie/cronie_1.4.9.bbappend
index dc06af9..dd1eacf 100644
--- a/meta-systemd/oe-core/recipes-extended/cronie/cronie_1.4.9.bbappend
+++ b/meta-systemd/oe-core/recipes-extended/cronie/cronie_1.4.9.bbappend
@@ -6,6 +6,8 @@ PRINC := "${@int(PRINC) + 4}"
 inherit systemd
 
 RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "crond.service"
 
 SRC_URI += "file://crond.service"
diff --git a/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend
index b6ec2aa..6dded40 100644
--- a/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend
+++ b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend
@@ -7,6 +7,8 @@ inherit systemd
 SRC_URI += "file://lighttpd.service"
 
 RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "lighttpd.service"
 
 do_install_append() {
-- 
1.8.1.5



