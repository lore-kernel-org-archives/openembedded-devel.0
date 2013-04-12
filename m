Received: from mail-da0-f41.google.com ([209.85.210.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQcXh-0004Rf-L3
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Apr 2013 13:53:29 +0200
Received: by mail-da0-f41.google.com with SMTP id w4so1115757dam.14
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2013 04:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=2GsQnBJEynrrxqvXSeLFOJYuI3BFhyhXjGvLpD5o9Zk=;
	b=wspJOjtXG8TMhWZg/W/epyarv/gXR00rUY+wRDVr/DHrOSUZ12jguIZVXTACSX6SGr
	Wy9pSM7VxAe45CDD+61T63tZqfSHCctvufj2f+/uYNRUHHET8D/Lx4cjT+oxZ68H0HnO
	IxOZS5PhOpJ5IrEWWOv6aDa4NuoaOVqsz9WbvwsSB5XxoGz9lpyeBB/zskxl1o8eLi0G
	1RAi/0f32xQYx/PMh59sHfLB9Zbs1vbiP0EflDKTD8KsR+DTa0qh0HqvOvB7yvVwMUgP
	eEbBdXSbomcIp6jzuB9N3E1TveBeXLqbm13KFjKqac8Lk5gOVVivieTfssffJ8IUZ6MC
	qBLg==
X-Received: by 10.66.139.169 with SMTP id qz9mr14696574pab.159.1365766556546; 
	Fri, 12 Apr 2013 04:35:56 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ms9sm8254034pbc.20.2013.04.12.04.35.53
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 04:35:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Apr 2013 13:35:45 +0200
Message-Id: <1365766545-12755-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-systemd][PATCH] meta-systemd: bump PRINC in all .bbappends
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
X-List-Received-Date: Fri, 12 Apr 2013 11:53:32 -0000

* opkg upgrade will fail to upgrade every package PN when PN-system is installed
  * check_data_file_clashes: Package xserver-nodm-init wants to install file /lib/systemd/system/xserver-nodm.service
    But that file is already provided by package  * xserver-nodm-init-systemd
  You need to manually remove all PN-systemd packages on your target
  opkg remove -force-depends -force-remove `opkg list-installed | grep "\-systemd"`
  be careful with stuff like openssh-sshd-systemd or
  wpa-supplicant-systemd when you have access to target only over
  network
* this PRINC bump will force you to do it now even for people not using
  OEBasicHash or PR service

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-systemd/meta-efl/recipes-efl/efl/entrance_svn.bbappend             | 2 +-
 meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend           | 2 +-
 .../meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bbappend      | 2 +-
 .../meta-networking/recipes-daemons/autofs/autofs_5.0.7.bbappend        | 2 +-
 meta-systemd/meta-networking/recipes-support/nis/yp-tools_2.12.bbappend | 2 +-
 .../meta-networking/recipes-support/nis/ypbind-mt_1.36.bbappend         | 2 +-
 meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappend   | 2 +-
 meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend           | 2 +-
 .../meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bbappend      | 2 +-
 meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bbappend | 2 +-
 meta-systemd/meta-oe/recipes-connectivity/gateone/gateone_git.bbappend  | 2 +-
 .../recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bbappend | 2 +-
 meta-systemd/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend       | 2 +-
 meta-systemd/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend    | 2 +-
 .../meta-oe/recipes-core/packagegroups/packagegroup-basic.bbappend      | 2 +-
 meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend        | 2 +-
 meta-systemd/meta-oe/recipes-extended/at/at_3.1.13.bbappend             | 2 +-
 meta-systemd/meta-oe/recipes-extended/atftp/atftp_git.bbappend          | 2 +-
 meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bbappend  | 2 +-
 meta-systemd/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend      | 2 +-
 meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend    | 2 +-
 meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bbappend    | 2 +-
 meta-systemd/meta-oe/recipes-extended/zram/zram_0.1.bbappend            | 2 +-
 meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend            | 2 +-
 .../recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend   | 2 +-
 .../recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend   | 2 +-
 meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bbappend          | 2 +-
 .../recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bbappend       | 2 +-
 meta-systemd/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bbappend | 2 +-
 .../meta-oe/recipes-support/strongswan/strongswan_5.0.0.bbappend        | 2 +-
 meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend       | 2 +-
 .../meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bbappend  | 2 +-
 meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend   | 2 +-
 meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend   | 2 +-
 meta-systemd/oe-core/recipes-connectivity/connman/connman_1.12.bbappend | 2 +-
 meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5.bbappend      | 2 +-
 meta-systemd/oe-core/recipes-connectivity/ofono/ofono_1.12.bbappend     | 2 +-
 .../oe-core/recipes-connectivity/openssh/openssh_6.1p1.bbappend         | 2 +-
 meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend  | 2 +-
 .../recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend     | 2 +-
 meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.22.2.bbappend | 2 +-
 meta-systemd/oe-core/recipes-extended/cronie/cronie_1.4.9.bbappend      | 2 +-
 meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend | 2 +-
 meta-systemd/oe-core/recipes-extended/pam/libpam_1.1.6.bbappend         | 2 +-
 44 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/meta-systemd/meta-efl/recipes-efl/efl/entrance_svn.bbappend b/meta-systemd/meta-efl/recipes-efl/efl/entrance_svn.bbappend
index 8f85ab7..64f1444 100644
--- a/meta-systemd/meta-efl/recipes-efl/efl/entrance_svn.bbappend
+++ b/meta-systemd/meta-efl/recipes-efl/efl/entrance_svn.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 2}"
+PRINC := "${@int(PRINC) + 3}"
 
 inherit systemd
 
diff --git a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
index e02e698..22e7419 100644
--- a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
+++ b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
@@ -1,7 +1,7 @@
 # look for files in the layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 3}"
+PRINC := "${@int(PRINC) + 4}"
 
 inherit systemd
 
diff --git a/meta-systemd/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bbappend b/meta-systemd/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bbappend
index be801c9..0b302c6 100644
--- a/meta-systemd/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bbappend
+++ b/meta-systemd/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bbappend
@@ -1,4 +1,4 @@
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 inherit systemd
 
diff --git a/meta-systemd/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bbappend b/meta-systemd/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bbappend
index 708b7b2..f22f4df 100644
--- a/meta-systemd/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bbappend
+++ b/meta-systemd/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bbappend
@@ -1,6 +1,6 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "autofs.service"
diff --git a/meta-systemd/meta-networking/recipes-support/nis/yp-tools_2.12.bbappend b/meta-systemd/meta-networking/recipes-support/nis/yp-tools_2.12.bbappend
index 410ad3a..2fc0334 100644
--- a/meta-systemd/meta-networking/recipes-support/nis/yp-tools_2.12.bbappend
+++ b/meta-systemd/meta-networking/recipes-support/nis/yp-tools_2.12.bbappend
@@ -1,6 +1,6 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 # look for files in the layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
diff --git a/meta-systemd/meta-networking/recipes-support/nis/ypbind-mt_1.36.bbappend b/meta-systemd/meta-networking/recipes-support/nis/ypbind-mt_1.36.bbappend
index 23a9c99..9218b7e 100644
--- a/meta-systemd/meta-networking/recipes-support/nis/ypbind-mt_1.36.bbappend
+++ b/meta-systemd/meta-networking/recipes-support/nis/ypbind-mt_1.36.bbappend
@@ -1,6 +1,6 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 # look for files in the layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
diff --git a/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappend b/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappend
index 82e8621..ccb3d45 100644
--- a/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappend
+++ b/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappend
@@ -1,6 +1,6 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
diff --git a/meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend b/meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend
index 7dfd285..672c29d 100644
--- a/meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend
+++ b/meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend
@@ -1,5 +1,5 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-PRINC := "${@int(PRINC) + 6}"
+PRINC := "${@int(PRINC) + 7}"
 
 SRC_URI += " file://keymaps.service"
 
diff --git a/meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bbappend b/meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bbappend
index 38ef272..22aa563 100644
--- a/meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bbappend
+++ b/meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 inherit systemd
 
diff --git a/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bbappend b/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bbappend
index 1982243..bc58446 100644
--- a/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bbappend
+++ b/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 inherit systemd
 
diff --git a/meta-systemd/meta-oe/recipes-connectivity/gateone/gateone_git.bbappend b/meta-systemd/meta-oe/recipes-connectivity/gateone/gateone_git.bbappend
index 489528b..8ec9dfa 100644
--- a/meta-systemd/meta-oe/recipes-connectivity/gateone/gateone_git.bbappend
+++ b/meta-systemd/meta-oe/recipes-connectivity/gateone/gateone_git.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 inherit systemd
 
diff --git a/meta-systemd/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bbappend b/meta-systemd/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bbappend
index 0510b23..5508fb2 100644
--- a/meta-systemd/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bbappend
+++ b/meta-systemd/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bbappend
@@ -1,4 +1,4 @@
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 inherit systemd
 
diff --git a/meta-systemd/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend b/meta-systemd/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
index c212104..0699302 100644
--- a/meta-systemd/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
+++ b/meta-systemd/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
@@ -1,6 +1,6 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 # look for files in the layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
diff --git a/meta-systemd/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend b/meta-systemd/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend
index 69ae431..3d4d98b 100644
--- a/meta-systemd/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend
+++ b/meta-systemd/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend
@@ -1,6 +1,6 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 3}"
+PRINC := "${@int(PRINC) + 4}"
 
 # look for files in the layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
diff --git a/meta-systemd/meta-oe/recipes-core/packagegroups/packagegroup-basic.bbappend b/meta-systemd/meta-oe/recipes-core/packagegroups/packagegroup-basic.bbappend
index 358c9cb..c1b5851 100644
--- a/meta-systemd/meta-oe/recipes-core/packagegroups/packagegroup-basic.bbappend
+++ b/meta-systemd/meta-oe/recipes-core/packagegroups/packagegroup-basic.bbappend
@@ -1,4 +1,4 @@
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 RDEPENDS_${PN} += "\
 	systemd-compat-units \
diff --git a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend
index cdcfb18..394db21 100644
--- a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend
+++ b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 2}"
+PRINC := "${@int(PRINC) + 3}"
 
 inherit systemd
 
diff --git a/meta-systemd/meta-oe/recipes-extended/at/at_3.1.13.bbappend b/meta-systemd/meta-oe/recipes-extended/at/at_3.1.13.bbappend
index 3335224..0dd3675 100644
--- a/meta-systemd/meta-oe/recipes-extended/at/at_3.1.13.bbappend
+++ b/meta-systemd/meta-oe/recipes-extended/at/at_3.1.13.bbappend
@@ -1,6 +1,6 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 # look for files in the layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
diff --git a/meta-systemd/meta-oe/recipes-extended/atftp/atftp_git.bbappend b/meta-systemd/meta-oe/recipes-extended/atftp/atftp_git.bbappend
index 9707abf..de3fe51 100644
--- a/meta-systemd/meta-oe/recipes-extended/atftp/atftp_git.bbappend
+++ b/meta-systemd/meta-oe/recipes-extended/atftp/atftp_git.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 inherit systemd
 
diff --git a/meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bbappend b/meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bbappend
index dfe68f2..dfffccc 100644
--- a/meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bbappend
+++ b/meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 inherit systemd
 
diff --git a/meta-systemd/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend b/meta-systemd/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
index 9528b9b..7e1954f 100644
--- a/meta-systemd/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
+++ b/meta-systemd/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
@@ -1,3 +1,3 @@
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 POLKITAUTH = "systemd"
diff --git a/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend b/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend
index 9600c65..42bcaa7 100644
--- a/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend
+++ b/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend
@@ -1,6 +1,6 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 # look for files in the layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
diff --git a/meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bbappend b/meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bbappend
index 70b3666..8404d01 100644
--- a/meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bbappend
+++ b/meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bbappend
@@ -1,6 +1,6 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 DEPENDS += "systemd"
 
diff --git a/meta-systemd/meta-oe/recipes-extended/zram/zram_0.1.bbappend b/meta-systemd/meta-oe/recipes-extended/zram/zram_0.1.bbappend
index 96ae94c..3b73354 100644
--- a/meta-systemd/meta-oe/recipes-extended/zram/zram_0.1.bbappend
+++ b/meta-systemd/meta-oe/recipes-extended/zram/zram_0.1.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 inherit systemd
 
diff --git a/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend b/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend
index fcb73af..697db03 100644
--- a/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend
+++ b/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend
@@ -1,5 +1,5 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 inherit systemd
 
diff --git a/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend b/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend
index e1eccf6..c7389d4 100644
--- a/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend
+++ b/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 2}"
+PRINC := "${@int(PRINC) + 3}"
 
 inherit systemd
 
diff --git a/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend b/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend
index ee2009a..f5e98fd 100644
--- a/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend
+++ b/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 2}"
+PRINC := "${@int(PRINC) + 3}"
 
 inherit systemd
 
diff --git a/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bbappend b/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bbappend
index 353ced8..0d96a68 100644
--- a/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bbappend
+++ b/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bbappend
@@ -1,4 +1,4 @@
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 inherit systemd
 
diff --git a/meta-systemd/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bbappend b/meta-systemd/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bbappend
index 230a583..7763727 100644
--- a/meta-systemd/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bbappend
+++ b/meta-systemd/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bbappend
@@ -1,6 +1,6 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 EXTRA_OECONF += " \
   --enable-systemd \
diff --git a/meta-systemd/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bbappend b/meta-systemd/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bbappend
index 91e5e3f..7f1c682 100644
--- a/meta-systemd/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bbappend
+++ b/meta-systemd/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bbappend
@@ -1,6 +1,6 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "pcscd.socket"
diff --git a/meta-systemd/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bbappend b/meta-systemd/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bbappend
index 45b7e26..31db08a 100644
--- a/meta-systemd/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bbappend
+++ b/meta-systemd/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bbappend
@@ -1,6 +1,6 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 SYSTEMD_UNITDIR = "${systemd_unitdir}/system"
 
diff --git a/meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend b/meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend
index 5dc6f42..a6b4da0 100644
--- a/meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend
+++ b/meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend
@@ -1,6 +1,6 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 2}"
+PRINC := "${@int(PRINC) + 3}"
 
 # look for files in the layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
diff --git a/meta-systemd/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bbappend b/meta-systemd/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bbappend
index 100f34b..59c471e 100644
--- a/meta-systemd/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bbappend
+++ b/meta-systemd/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bbappend
@@ -3,6 +3,6 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
 DEPENDS += "systemd"
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 SRC_URI += "file://0001-Add-shutdown-reboot-functionality-for-systemd-bug-87.patch"
diff --git a/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend b/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend
index 987c510..13a2ee4 100644
--- a/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend
@@ -1,4 +1,4 @@
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 inherit systemd
 
diff --git a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend b/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
index e4dcabb..752e6c1 100644
--- a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
@@ -1,4 +1,4 @@
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 inherit systemd
 
diff --git a/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.12.bbappend b/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.12.bbappend
index 0ba99b5..96a428f 100644
--- a/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.12.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.12.bbappend
@@ -1,4 +1,4 @@
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "connman.service"
diff --git a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5.bbappend b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5.bbappend
index aec1dfb..d3a322a 100644
--- a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5.bbappend
@@ -3,7 +3,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 inherit systemd
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 SYSTEMD_PACKAGES = "dhcp-server dhcp-relay dhcp-client"
 SYSTEMD_SERVICE_dhcp-server = "dhcpd.service"
diff --git a/meta-systemd/oe-core/recipes-connectivity/ofono/ofono_1.12.bbappend b/meta-systemd/oe-core/recipes-connectivity/ofono/ofono_1.12.bbappend
index e0e8f28..94fce48 100644
--- a/meta-systemd/oe-core/recipes-connectivity/ofono/ofono_1.12.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/ofono/ofono_1.12.bbappend
@@ -1,4 +1,4 @@
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 inherit systemd
 
diff --git a/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.1p1.bbappend b/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.1p1.bbappend
index fe5c919..0d1bb56 100644
--- a/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.1p1.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.1p1.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 SYSTEMD_PACKAGES = "openssh-sshd"
 SYSTEMD_SERVICE_openssh-sshd = "sshd.socket"
diff --git a/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend b/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend
index 73709e8..784fc1f 100644
--- a/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS := "${THISDIR}/${PN}"
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 inherit systemd
 
diff --git a/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend
index d0ce87e..dcd9b84 100644
--- a/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend
@@ -1,3 +1,3 @@
-PRINC := "${@int(PRINC) + 3}"
+PRINC := "${@int(PRINC) + 4}"
 
 RPROVIDES_${PN} += "${PN}-systemd"
diff --git a/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.22.2.bbappend b/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.22.2.bbappend
index 0447f51..12a9823 100644
--- a/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.22.2.bbappend
+++ b/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.22.2.bbappend
@@ -1,6 +1,6 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 SYSTEMD_UNITDIR = "${systemd_unitdir}/system"
 EXTRA_OECONF += "--enable-socket-activation --with-systemdsystemunitdir=${SYSTEMD_UNITDIR}"
diff --git a/meta-systemd/oe-core/recipes-extended/cronie/cronie_1.4.9.bbappend b/meta-systemd/oe-core/recipes-extended/cronie/cronie_1.4.9.bbappend
index 418836f..dc06af9 100644
--- a/meta-systemd/oe-core/recipes-extended/cronie/cronie_1.4.9.bbappend
+++ b/meta-systemd/oe-core/recipes-extended/cronie/cronie_1.4.9.bbappend
@@ -1,7 +1,7 @@
 # look for files in the layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 3}"
+PRINC := "${@int(PRINC) + 4}"
 
 inherit systemd
 
diff --git a/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend
index 0c7548a..b6ec2aa 100644
--- a/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend
+++ b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 inherit systemd
 
diff --git a/meta-systemd/oe-core/recipes-extended/pam/libpam_1.1.6.bbappend b/meta-systemd/oe-core/recipes-extended/pam/libpam_1.1.6.bbappend
index 7c4bcd8..640fa37 100644
--- a/meta-systemd/oe-core/recipes-extended/pam/libpam_1.1.6.bbappend
+++ b/meta-systemd/oe-core/recipes-extended/pam/libpam_1.1.6.bbappend
@@ -1,4 +1,4 @@
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 # Register with logind to make screen/tmux/etc work
 do_install_append() {
-- 
1.8.1.5



