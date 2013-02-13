Received: from mail-da0-f53.google.com ([209.85.210.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U5gL7-00068i-7k
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Feb 2013 18:41:57 +0100
Received: by mail-da0-f53.google.com with SMTP id w3so649240dad.40
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Feb 2013 09:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=E6yXTyruOZWGAMrZZ6sPO11HHOVSPmcdVM+0D87S1FA=;
	b=t5qd7Eo6NOzj0/lmOpyz/7arFqnTpsmLtL/B4PKFT6JzIgggN19CZv0tZZ3WfsH3ou
	/HL0qCB65Q7BxnoDJxe0Oc70WeutbEssX14DmaXnsBFTldZ0mTj3LuK+9C1wpDNWnA3l
	e9Swf/sORo3ayZMubbV+yFLBhjnYJPzKm0uLI/WU9kydomSKxAA0lrmpav4zgkCLH5Vq
	svP25tr712JkZlj6zfEAt6VE662HLbmM+wLxasFtz5w5lSV4drjy9ygFL0l0ek3bwaxk
	qPi05o91OVBv0Jyq4LGDd6aIhKJ8Nif7V4NdNrJXT8QW54Vy5xqXa26PVsw1gzmPa/Xn
	tRnw==
X-Received: by 10.66.80.70 with SMTP id p6mr65967626pax.23.1360776347299;
	Wed, 13 Feb 2013 09:25:47 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id o5sm85065000pay.5.2013.02.13.09.25.46
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 13 Feb 2013 09:25:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Feb 2013 09:25:35 -0800
Message-Id: <1360776335-21633-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1360776335-21633-1-git-send-email-raj.khem@gmail.com>
References: <1360776335-21633-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-systemd][PATCH 2/2] meta-systemd: Append ${PN} to SYSTEMD_SERVICE
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
X-List-Received-Date: Wed, 13 Feb 2013 17:42:09 -0000

When using systemd class from OE-Core we also need
to install the units explicitly.

systemd packages ending with -systemd are consumed
and now provided by package proper.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../meta-efl/recipes-efl/efl/entrance_svn.bbappend |   16 +++++++++-----
 .../recipes-gnome/gdm/gdm_2.32.2.bbappend          |    5 +++--
 .../recipes-multimedia/musicpd/mpd_0.17.1.bbappend |    5 +++--
 .../recipes-daemons/autofs/autofs_5.0.7.bbappend   |    5 +++--
 .../recipes-support/nis/yp-tools_2.12.bbappend     |   10 +++++++--
 .../recipes-support/nis/ypbind-mt_1.36.bbappend    |   10 ++++++---
 .../recipes-support/ntp/ntp_4.2.6p5.bbappend       |    8 ++++---
 .../recipes-bsp/keymaps/keymaps_1.0.bbappend       |   11 ++++++++--
 .../cherokee/cherokee_1.2.98.bbappend              |   11 ++++++++--
 .../dnsmasq/dnsmasq_2.55.bbappend                  |   11 ++++++++--
 .../gateone/gateone_git.bbappend                   |    9 ++++++--
 .../networkmanager/networkmanager_0.9.2.0.bbappend |    3 +--
 .../recipes-core/busybox/busybox_1.20.2.bbappend   |    6 +++---
 .../dropbear/dropbear_2012.55.bbappend             |    9 ++++++--
 .../recipes-devtools/cloud9/cloud9_0.6.bbappend    |    6 ++++++
 .../meta-oe/recipes-extended/at/at_3.1.13.bbappend |    9 ++++++--
 .../recipes-extended/atftp/atftp_git.bbappend      |   11 ++++++++--
 .../recipes-extended/cronie/cronie_1.4.8.bbappend  |   11 ++++++++--
 .../net-snmp/net-snmp_5.7.1.bbappend               |   13 ++++++++++--
 .../rpcbind/rpcbind_0.2.0.bbappend                 |   10 +++++++--
 .../rsyslog/rsyslog_5.8.0.bbappend                 |    5 +++--
 .../recipes-extended/zram/zram_0.1.bbappend        |   11 ++++++++--
 .../recipes-graphics/lxdm/lxdm_git.bbappend        |    5 +++--
 .../xinput-calibrator_git.bbappend                 |   11 ++++++++--
 .../xserver-nodm-init_2.0.bbappend                 |   11 ++++++----
 .../recipes-navigation/gpsd/gpsd_3.7.bbappend      |    5 +++--
 .../nonworking/syslog-ng/syslog-ng_3.2.5.bbappend  |    5 +++--
 .../pcsc-lite/pcsc-lite_1.8.6.bbappend             |    5 +++--
 .../strongswan/strongswan_5.0.0.bbappend           |    5 +++--
 .../recipes-support/udisks/udisks_1.0.4.bbappend   |    5 +++--
 .../avahi/avahi_0.6.31.bbappend                    |    7 ++++---
 .../bluez/bluez4_4.101.bbappend                    |    5 +++--
 .../connman/connman_1.10.bbappend                  |    5 +++--
 .../recipes-connectivity/dhcp/dhcp_4.2.5.bbappend  |   22 ++++++++++++++++----
 .../recipes-connectivity/ofono/ofono_1.12.bbappend |    5 +++--
 .../openssh/openssh_6.1p1.bbappend                 |   13 ++++++++++--
 .../portmap/portmap_6.0.bbappend                   |   10 +++++++--
 .../util-linux/util-linux_2.22.2.bbappend          |    5 +++--
 .../lighttpd/lighttpd_1.4.32.bbappend              |    7 +++++++
 .../systemd/systemd-machine-units_1.0.bb           |    2 +-
 40 files changed, 242 insertions(+), 86 deletions(-)

diff --git a/meta-systemd/meta-efl/recipes-efl/efl/entrance_svn.bbappend b/meta-systemd/meta-efl/recipes-efl/efl/entrance_svn.bbappend
index df96e34..89f3565 100644
--- a/meta-systemd/meta-efl/recipes-efl/efl/entrance_svn.bbappend
+++ b/meta-systemd/meta-efl/recipes-efl/efl/entrance_svn.bbappend
@@ -1,13 +1,19 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 inherit systemd
 
 SRC_URI += "file://entrance.service"
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "entrance.service"
+RPROVIDES_${PN} += "${PN}"
 
-RCONFLICTS_${PN}-systemd += "xserver-nodm-init-systemd"
-RREPLACES_${PN}-systemd += "xserver-nodm-init-systemd"
+SYSTEMD_SERVICE_${PN} = "entrance.service"
+
+do_install_append() {
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/entrance.service ${D}${systemd_unitdir}/system
+}
+
+RCONFLICTS_${PN} += "xserver-nodm-init-systemd"
+RREPLACES_${PN} += "xserver-nodm-init-systemd"
diff --git a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
index 45b47c3..6ea753d 100644
--- a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
+++ b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
@@ -14,5 +14,6 @@ do_install_append() {
 		> ${D}${systemd_unitdir}/system/gdm.service
 }
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "gdm.service"
+SYSTEMD_PACKAGES = "${PN}"
+RPROVIDES_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "gdm.service"
diff --git a/meta-systemd/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bbappend b/meta-systemd/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bbappend
index eee4cdd..e19723a 100644
--- a/meta-systemd/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bbappend
+++ b/meta-systemd/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bbappend
@@ -10,5 +10,6 @@ do_install_append() {
         ${D}/${systemd_unitdir}/system/mpd.service
 }
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "mpd.service"
+SYSTEMD_PACKAGES = "${PN}"
+RPROVIDES_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "mpd.service"
diff --git a/meta-systemd/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bbappend b/meta-systemd/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bbappend
index 3d318fb..f6792f1 100644
--- a/meta-systemd/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bbappend
+++ b/meta-systemd/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bbappend
@@ -2,5 +2,6 @@ inherit systemd
 
 PRINC := "${@int(PRINC) + 1}"
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "autofs.service"
+SYSTEMD_PACKAGES = "${PN}"
+RPROVIDES_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "autofs.service"
diff --git a/meta-systemd/meta-networking/recipes-support/nis/yp-tools_2.12.bbappend b/meta-systemd/meta-networking/recipes-support/nis/yp-tools_2.12.bbappend
index 041ca83..76dd4ba 100644
--- a/meta-systemd/meta-networking/recipes-support/nis/yp-tools_2.12.bbappend
+++ b/meta-systemd/meta-networking/recipes-support/nis/yp-tools_2.12.bbappend
@@ -7,6 +7,12 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
 SRC_URI += "file://domainname.service"
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "domainname.service"
+SYSTEMD_PACKAGES = "${PN}"
+RPROVIDES_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "domainname.service"
+
+do_install_append() {
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/domainname.service ${D}${systemd_unitdir}/system
+}
 
diff --git a/meta-systemd/meta-networking/recipes-support/nis/ypbind-mt_1.36.bbappend b/meta-systemd/meta-networking/recipes-support/nis/ypbind-mt_1.36.bbappend
index 14dbaac..cd3b98e 100644
--- a/meta-systemd/meta-networking/recipes-support/nis/ypbind-mt_1.36.bbappend
+++ b/meta-systemd/meta-networking/recipes-support/nis/ypbind-mt_1.36.bbappend
@@ -7,6 +7,10 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
 SRC_URI += "file://ypbind.service"
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "ypbind.service"
-
+SYSTEMD_PACKAGES = "${PN}"
+RPROVIDES_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "ypbind.service"
+do_install_append() {
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/ypbind.service ${D}${systemd_unitdir}/system
+}
diff --git a/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappend b/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappend
index c6cd031..4580cf7 100644
--- a/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappend
+++ b/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappend
@@ -4,9 +4,11 @@ PRINC := "${@int(PRINC) + 1}"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-SYSTEMD_PACKAGES = "${PN}-systemd ntpdate-systemd"
-SYSTEMD_SERVICE_${PN}-systemd = "ntpd.service"
-SYSTEMD_SERVICE_ntpdate-systemd = "ntpdate.service"
+SYSTEMD_PACKAGES = "${PN} ntpdate"
+SYSTEMD_SERVICE_${PN} = "ntpd.service"
+SYSTEMD_SERVICE_ntpdate = "ntpdate.service"
+
+FILES_ntpdate += "${systemd_unitdir}/system/ntpdate.service"
 
 SRC_URI += " \
 	file://ntpdate.service \
diff --git a/meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend b/meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend
index 7f336a1..c8d0d3d 100644
--- a/meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend
+++ b/meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend
@@ -4,5 +4,12 @@ PRINC := "${@int(PRINC) + 6}"
 SRC_URI += " file://keymaps.service"
 
 inherit systemd
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "${PN}.service"
+SYSTEMD_PACKAGES = "${PN}"
+RPROVIDES_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "${PN}.service"
+
+do_install_append() {
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/${PN}.service ${D}${systemd_unitdir}/system
+}
+
diff --git a/meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bbappend b/meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bbappend
index 7cc7dd8..c8571b7 100644
--- a/meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bbappend
+++ b/meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bbappend
@@ -6,5 +6,12 @@ inherit systemd
 
 SRC_URI += "file://cherokee.service"
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "cherokee.service"
+SYSTEMD_PACKAGES = "${PN}"
+RPROVIDES_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "cherokee.service"
+
+do_install_append() {
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/cherokee.service ${D}${systemd_unitdir}/system
+}
+
diff --git a/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bbappend b/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bbappend
index 0a9c77e..799b3cd 100644
--- a/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bbappend
+++ b/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bbappend
@@ -6,5 +6,12 @@ inherit systemd
 
 SRC_URI += "file://dnsmasq.service"
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "dnsmasq.service"
+SYSTEMD_PACKAGES = "${PN}"
+RPROVIDES_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "dnsmasq.service"
+
+do_install_append() {
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/dnsmasq.service ${D}${systemd_unitdir}/system
+}
+
diff --git a/meta-systemd/meta-oe/recipes-connectivity/gateone/gateone_git.bbappend b/meta-systemd/meta-oe/recipes-connectivity/gateone/gateone_git.bbappend
index dd5fea1..489528b 100644
--- a/meta-systemd/meta-oe/recipes-connectivity/gateone/gateone_git.bbappend
+++ b/meta-systemd/meta-oe/recipes-connectivity/gateone/gateone_git.bbappend
@@ -7,5 +7,10 @@ inherit systemd
 SRC_URI += "file://gateone.service"
 
 NATIVE_SYSTEMD_SUPPORT = "1"
-SYSTEMD_PACKAGES = "${PN}"
-SYSTEMD_SERVICE = "gateone.service"
+SYSTEMD_SERVICE_${PN} = "gateone.service"
+
+do_install_append() {
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/gateone.service ${D}${systemd_unitdir}/system
+}
+
diff --git a/meta-systemd/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bbappend b/meta-systemd/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bbappend
index 6ae5d75..0510b23 100644
--- a/meta-systemd/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bbappend
+++ b/meta-systemd/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bbappend
@@ -4,8 +4,7 @@ inherit systemd
 
 DEPENDS += "systemd"
 
-SYSTEMD_PACKAGES = "${PN}"
-SYSTEMD_SERVICE = "NetworkManager.service"
+SYSTEMD_SERVICE_${PN} = "NetworkManager.service"
 SYSTEMD_UNITDIR = "${systemd_unitdir}/system"
 
 # NetworkManager-wait-online is not catched by systemd.bbclass
diff --git a/meta-systemd/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend b/meta-systemd/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
index a0ae2ce..c212104 100644
--- a/meta-systemd/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
+++ b/meta-systemd/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
@@ -8,8 +8,8 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 SRC_URI += "file://busybox-syslog.service.in \
             file://busybox-klogd.service.in"
 
-SYSTEMD_PACKAGES = "${PN}-syslog-systemd"
-SYSTEMD_SERVICE_${PN}-syslog-systemd = "busybox-syslog.service"
+SYSTEMD_PACKAGES = "${PN}-syslog"
+SYSTEMD_SERVICE_${PN}-syslog = "busybox-syslog.service"
 
 do_install_append() {
 	install -d ${D}${systemd_unitdir}/system
@@ -20,4 +20,4 @@ do_install_append() {
 
 	ln -sf /dev/null ${D}${systemd_unitdir}/system/syslog.service
 }
-FILES_${PN}-syslog-systemd = "${systemd_unitdir}/system/syslog.service"
+FILES_${PN}-syslog += "${systemd_unitdir}/system/syslog.service"
diff --git a/meta-systemd/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend b/meta-systemd/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend
index 15546e1..c46e981 100644
--- a/meta-systemd/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend
+++ b/meta-systemd/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend
@@ -9,9 +9,14 @@ SRC_URI += "file://dropbearkey.service \
             file://dropbear@.service \
             file://dropbear.socket"
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE_${PN}-systemd = "dropbear.socket"
+SYSTEMD_PACKAGES = "${PN}"
+RPROVIDES_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "dropbear.socket"
 
 do_install_append() {
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/dropbearkey.service ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/dropbear@.service ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/dropbear.socket ${D}${systemd_unitdir}/system
 	ln -sf /dev/null ${D}${systemd_unitdir}/system/dropbear.service
 }
diff --git a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend
index 777d2f4..dc32172 100644
--- a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend
+++ b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend
@@ -10,4 +10,10 @@ inherit systemd
 
 NATIVE_SYSTEMD_SUPPORT = "1"
 SYSTEMD_PACKAGES = "${PN}"
+RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "cloud9.service"
+do_install_append() {
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/cloud9.service ${D}${systemd_unitdir}/system
+}
+
diff --git a/meta-systemd/meta-oe/recipes-extended/at/at_3.1.13.bbappend b/meta-systemd/meta-oe/recipes-extended/at/at_3.1.13.bbappend
index d80cfff..2e63c69 100644
--- a/meta-systemd/meta-oe/recipes-extended/at/at_3.1.13.bbappend
+++ b/meta-systemd/meta-oe/recipes-extended/at/at_3.1.13.bbappend
@@ -7,6 +7,11 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI += "file://atd.service"
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "atd.service"
+SYSTEMD_PACKAGES = "${PN}"
+RPROVIDES_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "atd.service"
+do_install_append() {
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/atd.service ${D}${systemd_unitdir}/system
+}
 
diff --git a/meta-systemd/meta-oe/recipes-extended/atftp/atftp_git.bbappend b/meta-systemd/meta-oe/recipes-extended/atftp/atftp_git.bbappend
index 3706d9f..9707abf 100644
--- a/meta-systemd/meta-oe/recipes-extended/atftp/atftp_git.bbappend
+++ b/meta-systemd/meta-oe/recipes-extended/atftp/atftp_git.bbappend
@@ -6,5 +6,12 @@ inherit systemd
 
 SRC_URI += "file://atftpd.service"
 
-SYSTEMD_PACKAGES = "atftpd-systemd"
-SYSTEMD_SERVICE_atftpd-systemd = "atftpd.service"
+SYSTEMD_PACKAGES = "atftpd"
+SYSTEMD_SERVICE_atftpd = "atftpd.service"
+FILES_atftpd += "${systemd_unitdir}/system/atftpd.service"
+RPROVIDES_atftpd += "atftpd-systemd"
+do_install_append() {
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/atftpd.service ${D}${systemd_unitdir}/system
+}
+
diff --git a/meta-systemd/meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend b/meta-systemd/meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend
index 66db466..0ffba65 100644
--- a/meta-systemd/meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend
+++ b/meta-systemd/meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend
@@ -5,7 +5,14 @@ PRINC := "${@int(PRINC) + 3}"
 
 inherit systemd
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE_${PN}-systemd = "crond.service"
+SYSTEMD_PACKAGES = "${PN}"
+RPROVIDES_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "crond.service"
 
 SRC_URI += "file://crond.service"
+
+do_install_append() {
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/crond.service ${D}${systemd_unitdir}/system
+}
+
diff --git a/meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bbappend b/meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bbappend
index f221c1d..dfe68f2 100644
--- a/meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bbappend
+++ b/meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bbappend
@@ -9,11 +9,20 @@ SRC_URI += " \
         file://snmpd.service \
         file://snmptrapd.service \
 "
+do_install_append() {
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/snmpd.service ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/snmptrapd.service ${D}${systemd_unitdir}/system
+}
 
 EXTRA_OECONF += "--with-systemd"
 
 SYSTEMD_PACKAGES = "${PN}-server-snmpd-systemd \
                     ${PN}-server-snmptrapd-systemd"
 
-SYSTEMD_SERVICE_${PN}-server-snmpd-systemd = "snmpd.service"
-SYSTEMD_SERVICE_${PN}-server-snmptrapd-systemd =  "snmptrapd.service"
+SYSTEMD_SERVICE_${PN}-server-snmpd = "snmpd.service"
+SYSTEMD_SERVICE_${PN}-server-snmptrapd =  "snmptrapd.service"
+RPROVIDES_${PN}-server-snmpd += "${PN}-server-snmpd-systemd"
+RPROVIDES_${PN}-server-snmptrapd += "${PN}-server-snmptrapd-systemd"
+FILES_${PN}-server-snmpd += "${systemd_unitdir}/system/snmpd.service"
+FILES_${PN}-server-snmptrapd += "${systemd_unitdir}/system/snmptrapd.service"
diff --git a/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend b/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend
index 0fa7f97..fb31f92 100644
--- a/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend
+++ b/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend
@@ -7,6 +7,12 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI += "file://rpcbind.service"
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "rpcbind.service"
+SYSTEMD_PACKAGES = "${PN}"
+RPROVIDES_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "rpcbind.service"
+
+do_install_append() {
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/rpcbind.service ${D}${systemd_unitdir}/system
+}
 
diff --git a/meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bbappend b/meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bbappend
index b813a50..85d99ed 100644
--- a/meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bbappend
+++ b/meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bbappend
@@ -6,5 +6,6 @@ DEPENDS += "systemd"
 
 SYSTEMD_UNITDIR = "${systemd_unitdir}/system"
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "${PN}.service"
+SYSTEMD_PACKAGES = "${PN}"
+RPROVIDES_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "${PN}.service"
diff --git a/meta-systemd/meta-oe/recipes-extended/zram/zram_0.1.bbappend b/meta-systemd/meta-oe/recipes-extended/zram/zram_0.1.bbappend
index cc98fe1..34b82f7 100644
--- a/meta-systemd/meta-oe/recipes-extended/zram/zram_0.1.bbappend
+++ b/meta-systemd/meta-oe/recipes-extended/zram/zram_0.1.bbappend
@@ -8,5 +8,12 @@ SRC_URI += " \
         file://zram.service \
 "
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE_${PN}-systemd = "zram.service"
+SYSTEMD_PACKAGES = "${PN}"
+RPROVIDES_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "zram.service"
+
+do_install_append() {
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/zram.service ${D}${systemd_unitdir}/system
+}
+
diff --git a/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend b/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend
index 2828a70..6fe4b9f 100644
--- a/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend
+++ b/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend
@@ -4,5 +4,6 @@ PRINC := "${@int(PRINC) + 1}"
 inherit systemd
 
 SYSTEMD_UNITDIR = "${systemd_unitdir}/system"
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "lxdm.service"
+SYSTEMD_PACKAGES = "${PN}"
+RPROVIDES_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "lxdm.service"
diff --git a/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend b/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend
index 5bc5bc3..5f829ac 100644
--- a/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend
+++ b/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend
@@ -6,5 +6,12 @@ inherit systemd
 
 SRC_URI += "file://xinput-calibrator.service"
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "${PN}.service"
+SYSTEMD_PACKAGES = "${PN}"
+RPROVIDES_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "${PN}.service"
+
+do_install_append() {
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/xinput-calibrator.service ${D}${systemd_unitdir}/system
+}
+
diff --git a/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend b/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend
index b6b77c9..9310513 100644
--- a/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend
+++ b/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend
@@ -10,12 +10,15 @@ SRC_URI += "file://xserver-nodm.service \
 
 do_install_append() {
         install -d ${D}${sysconfdir}/default
+	install -d ${D}${systemd_unitdir}/system
         install xserver-nodm.conf ${D}${sysconfdir}/default/xserver-nodm
+	install -m 0644 ${WORKDIR}/xserver-nodm.service ${D}${systemd_unitdir}/system
 }
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE_${PN}-systemd = "xserver-nodm.service"
+SYSTEMD_PACKAGES = "${PN}"
+RPROVIDES_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "xserver-nodm.service"
 
-FILES_${PN}-systemd += "${sysconfdir}/default/xserver-nodm"
+FILES_${PN} += "${sysconfdir}/default/xserver-nodm"
 
-RDEPENDS_${PN}-systemd += "xserver-common (>= 1.30) xinit"
+RDEPENDS_${PN} += "xserver-common (>= 1.30) xinit"
diff --git a/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bbappend b/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bbappend
index 9504761..23e0bc3 100644
--- a/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bbappend
+++ b/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bbappend
@@ -6,8 +6,9 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI += "file://gpsd.service"
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "${PN}.socket"
+SYSTEMD_PACKAGES = "${PN}"
+RPROVIDES_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "${PN}.socket"
 SYSTEMD_OESCONS = "true"
 
 do_install_append() {
diff --git a/meta-systemd/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bbappend b/meta-systemd/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bbappend
index 92c2e77..95e2f7a 100644
--- a/meta-systemd/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bbappend
+++ b/meta-systemd/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bbappend
@@ -7,5 +7,6 @@ EXTRA_OECONF += " \
   --with-systemdsystemunitdir=${systemd_unitdir}/system \
 "
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "${PN}.service"
+SYSTEMD_PACKAGES = "${PN}"
+RPROVIDES_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "${PN}.service"
diff --git a/meta-systemd/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bbappend b/meta-systemd/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bbappend
index b8150b7..74e5ae8 100644
--- a/meta-systemd/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bbappend
+++ b/meta-systemd/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bbappend
@@ -2,5 +2,6 @@ inherit systemd
 
 PRINC := "${@int(PRINC) + 1}"
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "pcscd.socket"
+SYSTEMD_PACKAGES = "${PN}"
+RPROVIDES_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "pcscd.socket"
diff --git a/meta-systemd/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bbappend b/meta-systemd/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bbappend
index a60a109..5334fff 100644
--- a/meta-systemd/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bbappend
+++ b/meta-systemd/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bbappend
@@ -4,5 +4,6 @@ PRINC := "${@int(PRINC) + 1}"
 
 SYSTEMD_UNITDIR = "${systemd_unitdir}/system"
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "${PN}.service"
+SYSTEMD_PACKAGES = "${PN}"
+RPROVIDES_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "${PN}.service"
diff --git a/meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend b/meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend
index 9d0f18c..87eb3bb 100644
--- a/meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend
+++ b/meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend
@@ -9,6 +9,7 @@ DEPENDS += "systemd"
 
 SRC_URI += "file://add-systemd-support.patch"
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE_${PN}-systemd = "udisks-daemon.service"
+SYSTEMD_PACKAGES = "${PN}"
+RPROVIDES_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "udisks-daemon.service"
 SYSTEMD_AUTO_ENABLE = "disable"
diff --git a/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend b/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend
index d41ca93..ec0f08d 100644
--- a/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend
@@ -2,8 +2,9 @@ PRINC := "${@int(PRINC) + 1}"
 
 inherit systemd
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "avahi-daemon.service"
+SYSTEMD_PACKAGES = "${PN}"
+RPROVIDES_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "avahi-daemon.service"
 SYSTEMD_AUTO_ENABLE = "enable"
 
-FILES_${PN}-systemd += "${systemd_unitdir}/system/"
+FILES_${PN} += "${systemd_unitdir}/system/"
diff --git a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend b/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
index 8945a6d..004c494 100644
--- a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
@@ -4,6 +4,7 @@ inherit systemd
 
 EXTRA_OECONF += "--with-systemdunitdir=${systemd_unitdir}/system/"
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "bluetooth.service"
+SYSTEMD_PACKAGES = "${PN}"
+RPROVIDES_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "bluetooth.service"
 SYSTEMD_AUTO_ENABLE = "disable"
diff --git a/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.10.bbappend b/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.10.bbappend
index a9d13e6..dd0469a 100644
--- a/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.10.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.10.bbappend
@@ -4,5 +4,6 @@ PRINC := "${@int(PRINC) + 1}"
 
 EXTRA_OECONF += "--with-systemdunitdir=${systemd_unitdir}/system/"
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE_${PN}-systemd = "connman.service"
+SYSTEMD_PACKAGES = "${PN}"
+RPROVIDES_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "connman.service"
diff --git a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5.bbappend b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5.bbappend
index fde2426..aec1dfb 100644
--- a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5.bbappend
@@ -5,12 +5,26 @@ inherit systemd
 
 PRINC := "${@int(PRINC) + 1}"
 
-SYSTEMD_PACKAGES = "dhcp-server-systemd dhcp-relay-systemd dhcp-client-systemd"
-SYSTEMD_SERVICE_dhcp-server-systemd = "dhcpd.service"
-SYSTEMD_SERVICE_dhcp-relay-systemd = "dhcrelay.service"
-SYSTEMD_SERVICE_dhcp-client-systemd = "dhclient.service"
+SYSTEMD_PACKAGES = "dhcp-server dhcp-relay dhcp-client"
+SYSTEMD_SERVICE_dhcp-server = "dhcpd.service"
+SYSTEMD_SERVICE_dhcp-relay = "dhcrelay.service"
+SYSTEMD_SERVICE_dhcp-client = "dhclient.service"
+
+FILES_dhcp-server += "${systemd_unitdir}/system/dhcpd.service"
+FILES_dhcp-relay += "${systemd_unitdir}/system/dhrelay.service"
+FILES_dhcp-client += "${systemd_unitdir}/system/dhclient.service"
+RPROVIDES_dhcp-server += "dhcp-server-systemd"
+RPROVIDES_dhcp-relay += "dhcp-relay-systemd"
+RPROVIDES_dhcp-client += "dhcp-client-systemd"
 
 SRC_URI += "file://dhcpd.service \
             file://dhclient.service \
             file://dhcrelay.service \
            "
+do_install_append() {
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/dhcpd.service ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/dhclient.service ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/dhcrelay.service ${D}${systemd_unitdir}/system
+}
+
diff --git a/meta-systemd/oe-core/recipes-connectivity/ofono/ofono_1.12.bbappend b/meta-systemd/oe-core/recipes-connectivity/ofono/ofono_1.12.bbappend
index a061b52..9923708 100644
--- a/meta-systemd/oe-core/recipes-connectivity/ofono/ofono_1.12.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/ofono/ofono_1.12.bbappend
@@ -2,6 +2,7 @@ PRINC := "${@int(PRINC) + 1}"
 
 inherit systemd
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "ofono.service"
+SYSTEMD_PACKAGES = "${PN}"
+RPROVIDES_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "ofono.service"
 SYSTEMD_AUTO_ENABLE = "disable"
diff --git a/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.1p1.bbappend b/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.1p1.bbappend
index a459065..fe5c919 100644
--- a/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.1p1.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.1p1.bbappend
@@ -2,9 +2,18 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 PRINC := "${@int(PRINC) + 1}"
 
-SYSTEMD_PACKAGES = "openssh-sshd-systemd"
-SYSTEMD_SERVICE = "sshd.socket"
+SYSTEMD_PACKAGES = "openssh-sshd"
+SYSTEMD_SERVICE_openssh-sshd = "sshd.socket"
+FILES_openssh-sshd += "${systemd_unitdir}/system/sshd.socket"
+RPROVIDES_openssh-sshd += "openssh-sshd-systemd"
 
 inherit systemd
 
 SRC_URI += "file://sshd.socket file://sshd@.service file://sshdgenkeys.service"
+do_install_append() {
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/sshdgenkeys.service ${D}${systemd_unitdir}/system
+}
+
diff --git a/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend b/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend
index c0276a3..281c440 100644
--- a/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend
@@ -4,8 +4,14 @@ PRINC := "${@int(PRINC) + 1}"
 
 inherit systemd
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "portmap.service"
+SYSTEMD_PACKAGES = "${PN}"
+RPROVIDES_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "portmap.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
 SRC_URI_append = " file://portmap.service"
+do_install_append() {
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/portmap.service ${D}${systemd_unitdir}/system
+}
+
diff --git a/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.22.2.bbappend b/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.22.2.bbappend
index 809a554..e0b1aba 100644
--- a/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.22.2.bbappend
+++ b/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.22.2.bbappend
@@ -4,5 +4,6 @@ PRINC := "${@int(PRINC) + 1}"
 
 SYSTEMD_UNITDIR = "${systemd_unitdir}/system"
 EXTRA_OECONF += "--enable-socket-activation --with-systemdsystemunitdir=${SYSTEMD_UNITDIR}"
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "uuidd.socket"
+SYSTEMD_PACKAGES = "${PN}"
+RPROVIDES_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "uuidd.socket"
diff --git a/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend
index 0e08358..89079dc 100644
--- a/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend
+++ b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend
@@ -7,4 +7,11 @@ inherit systemd
 SRC_URI += "file://lighttpd.service"
 
 SYSTEMD_PACKAGES = "${PN}"
+RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "lighttpd.service"
+
+do_install_append() {
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/lighttpd.service ${D}${systemd_unitdir}/system
+}
+
diff --git a/meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb b/meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb
index f33b2a9..3b3c1dc 100644
--- a/meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb
+++ b/meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb
@@ -8,7 +8,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 PR = "r1"
 
 inherit systemd
-SYSTEMD_SERVICE = ""
+SYSTEMD_SERVICE_${PN} = ""
 SYSTEMD_PACKAGES = "${PN}"
 NATIVE_SYSTEMD_SUPPORT = "1"
 ALLOW_EMPTY_${PN} = "1"
-- 
1.7.9.5



