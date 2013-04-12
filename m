Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQcIv-0002ln-TU
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Apr 2013 13:38:06 +0200
Received: by mail-pa0-f42.google.com with SMTP id kq13so1411126pab.29
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2013 04:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=EyHqSpLzH/NMjN+pgyXvUHt4bfS8rISMnmt4DMVunlM=;
	b=l+z8nDKOjjyQkj5LOYBzZXZmg9bq4LGXga2Xyj3Ul5A+WwVsiuLRvxURaE95iUc5NM
	MLX1vknX4pdSJP/XPfTo2GYed37IPI/RGRO1hLPJGRJ0rqCancrfisI7VdeJNtDKU6Wq
	6JVXdz4fm8R/e+oFXug7oeeYYARxUAN5fwTH70HYj9jCKkLquoNU09pMSQx1vI80tFHX
	X5YVfoq5AVxsy+v7V1N8enLwupXrdXivREy7E/8lenrNyT6baFEVauTkuTsGI2XIvFkd
	LDpMhs1kBq2oK7oUMHZapCzDghc4zqfkLzcZw9oPjpyeHkeK5HQRrruo/2in8qZY/5He
	tKQA==
X-Received: by 10.68.231.41 with SMTP id td9mr14192590pbc.58.1365765640693;
	Fri, 12 Apr 2013 04:20:40 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id fa5sm8179624pbb.35.2013.04.12.04.20.37
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 04:20:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Apr 2013 13:20:30 +0200
Message-Id: <1365765631-23070-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-systemd][PATCH 1/2] meta-systemd: drop default SYSTEMD_PACKAGES = "${PN}"
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
X-List-Received-Date: Fri, 12 Apr 2013 11:38:06 -0000

---
 meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend            | 1 -
 .../meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bbappend       | 1 -
 .../meta-networking/recipes-daemons/autofs/autofs_5.0.7.bbappend         | 1 -
 meta-systemd/meta-networking/recipes-support/nis/yp-tools_2.12.bbappend  | 1 -
 meta-systemd/meta-networking/recipes-support/nis/ypbind-mt_1.36.bbappend | 1 -
 meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend            | 1 -
 .../meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bbappend       | 1 -
 meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bbappend  | 1 -
 meta-systemd/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend     | 1 -
 meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend         | 1 -
 meta-systemd/meta-oe/recipes-extended/at/at_3.1.13.bbappend              | 1 -
 meta-systemd/meta-oe/recipes-extended/cronie/cronie_1.4.9.bbappend       | 1 -
 meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend     | 1 -
 meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bbappend     | 1 -
 meta-systemd/meta-oe/recipes-extended/zram/zram_0.1.bbappend             | 1 -
 meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend             | 1 -
 .../recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend    | 1 -
 .../recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend    | 1 -
 meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bbappend           | 1 -
 .../recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bbappend        | 1 -
 meta-systemd/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bbappend  | 1 -
 .../meta-oe/recipes-support/strongswan/strongswan_5.0.0.bbappend         | 1 -
 meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend        | 1 -
 meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend    | 1 -
 meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend    | 1 -
 meta-systemd/oe-core/recipes-connectivity/connman/connman_1.12.bbappend  | 1 -
 meta-systemd/oe-core/recipes-connectivity/ofono/ofono_1.12.bbappend      | 1 -
 meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend   | 1 -
 meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.22.2.bbappend  | 1 -
 meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend  | 1 -
 meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb           | 1 -
 31 files changed, 31 deletions(-)

diff --git a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
index 6ea753d..e02e698 100644
--- a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
+++ b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
@@ -14,6 +14,5 @@ do_install_append() {
 		> ${D}${systemd_unitdir}/system/gdm.service
 }
 
-SYSTEMD_PACKAGES = "${PN}"
 RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "gdm.service"
diff --git a/meta-systemd/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bbappend b/meta-systemd/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bbappend
index e19723a..be801c9 100644
--- a/meta-systemd/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bbappend
+++ b/meta-systemd/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bbappend
@@ -10,6 +10,5 @@ do_install_append() {
         ${D}/${systemd_unitdir}/system/mpd.service
 }
 
-SYSTEMD_PACKAGES = "${PN}"
 RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "mpd.service"
diff --git a/meta-systemd/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bbappend b/meta-systemd/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bbappend
index f6792f1..708b7b2 100644
--- a/meta-systemd/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bbappend
+++ b/meta-systemd/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bbappend
@@ -2,6 +2,5 @@ inherit systemd
 
 PRINC := "${@int(PRINC) + 1}"
 
-SYSTEMD_PACKAGES = "${PN}"
 RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "autofs.service"
diff --git a/meta-systemd/meta-networking/recipes-support/nis/yp-tools_2.12.bbappend b/meta-systemd/meta-networking/recipes-support/nis/yp-tools_2.12.bbappend
index 76dd4ba..410ad3a 100644
--- a/meta-systemd/meta-networking/recipes-support/nis/yp-tools_2.12.bbappend
+++ b/meta-systemd/meta-networking/recipes-support/nis/yp-tools_2.12.bbappend
@@ -7,7 +7,6 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
 SRC_URI += "file://domainname.service"
 
-SYSTEMD_PACKAGES = "${PN}"
 RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "domainname.service"
 
diff --git a/meta-systemd/meta-networking/recipes-support/nis/ypbind-mt_1.36.bbappend b/meta-systemd/meta-networking/recipes-support/nis/ypbind-mt_1.36.bbappend
index cd3b98e..23a9c99 100644
--- a/meta-systemd/meta-networking/recipes-support/nis/ypbind-mt_1.36.bbappend
+++ b/meta-systemd/meta-networking/recipes-support/nis/ypbind-mt_1.36.bbappend
@@ -7,7 +7,6 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
 SRC_URI += "file://ypbind.service"
 
-SYSTEMD_PACKAGES = "${PN}"
 RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "ypbind.service"
 do_install_append() {
diff --git a/meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend b/meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend
index c8d0d3d..7dfd285 100644
--- a/meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend
+++ b/meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend
@@ -4,7 +4,6 @@ PRINC := "${@int(PRINC) + 6}"
 SRC_URI += " file://keymaps.service"
 
 inherit systemd
-SYSTEMD_PACKAGES = "${PN}"
 RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "${PN}.service"
 
diff --git a/meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bbappend b/meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bbappend
index c8571b7..38ef272 100644
--- a/meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bbappend
+++ b/meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bbappend
@@ -6,7 +6,6 @@ inherit systemd
 
 SRC_URI += "file://cherokee.service"
 
-SYSTEMD_PACKAGES = "${PN}"
 RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "cherokee.service"
 
diff --git a/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bbappend b/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bbappend
index 799b3cd..1982243 100644
--- a/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bbappend
+++ b/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bbappend
@@ -6,7 +6,6 @@ inherit systemd
 
 SRC_URI += "file://dnsmasq.service"
 
-SYSTEMD_PACKAGES = "${PN}"
 RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "dnsmasq.service"
 
diff --git a/meta-systemd/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend b/meta-systemd/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend
index c46e981..69ae431 100644
--- a/meta-systemd/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend
+++ b/meta-systemd/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend
@@ -9,7 +9,6 @@ SRC_URI += "file://dropbearkey.service \
             file://dropbear@.service \
             file://dropbear.socket"
 
-SYSTEMD_PACKAGES = "${PN}"
 RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "dropbear.socket"
 
diff --git a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend
index 03d878e..cdcfb18 100644
--- a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend
+++ b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend
@@ -9,7 +9,6 @@ SRC_URI += "file://cloud9.service"
 inherit systemd
 
 NATIVE_SYSTEMD_SUPPORT = "1"
-SYSTEMD_PACKAGES = "${PN}"
 RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "cloud9.service"
 do_install_append() {
diff --git a/meta-systemd/meta-oe/recipes-extended/at/at_3.1.13.bbappend b/meta-systemd/meta-oe/recipes-extended/at/at_3.1.13.bbappend
index 2e63c69..3335224 100644
--- a/meta-systemd/meta-oe/recipes-extended/at/at_3.1.13.bbappend
+++ b/meta-systemd/meta-oe/recipes-extended/at/at_3.1.13.bbappend
@@ -7,7 +7,6 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI += "file://atd.service"
 
-SYSTEMD_PACKAGES = "${PN}"
 RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "atd.service"
 do_install_append() {
diff --git a/meta-systemd/meta-oe/recipes-extended/cronie/cronie_1.4.9.bbappend b/meta-systemd/meta-oe/recipes-extended/cronie/cronie_1.4.9.bbappend
index 0ffba65..418836f 100644
--- a/meta-systemd/meta-oe/recipes-extended/cronie/cronie_1.4.9.bbappend
+++ b/meta-systemd/meta-oe/recipes-extended/cronie/cronie_1.4.9.bbappend
@@ -5,7 +5,6 @@ PRINC := "${@int(PRINC) + 3}"
 
 inherit systemd
 
-SYSTEMD_PACKAGES = "${PN}"
 RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "crond.service"
 
diff --git a/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend b/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend
index fb31f92..9600c65 100644
--- a/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend
+++ b/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend
@@ -7,7 +7,6 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI += "file://rpcbind.service"
 
-SYSTEMD_PACKAGES = "${PN}"
 RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "rpcbind.service"
 
diff --git a/meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bbappend b/meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bbappend
index 85d99ed..70b3666 100644
--- a/meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bbappend
+++ b/meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bbappend
@@ -6,6 +6,5 @@ DEPENDS += "systemd"
 
 SYSTEMD_UNITDIR = "${systemd_unitdir}/system"
 
-SYSTEMD_PACKAGES = "${PN}"
 RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "${PN}.service"
diff --git a/meta-systemd/meta-oe/recipes-extended/zram/zram_0.1.bbappend b/meta-systemd/meta-oe/recipes-extended/zram/zram_0.1.bbappend
index 34b82f7..96ae94c 100644
--- a/meta-systemd/meta-oe/recipes-extended/zram/zram_0.1.bbappend
+++ b/meta-systemd/meta-oe/recipes-extended/zram/zram_0.1.bbappend
@@ -8,7 +8,6 @@ SRC_URI += " \
         file://zram.service \
 "
 
-SYSTEMD_PACKAGES = "${PN}"
 RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "zram.service"
 
diff --git a/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend b/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend
index 6fe4b9f..fcb73af 100644
--- a/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend
+++ b/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend
@@ -4,6 +4,5 @@ PRINC := "${@int(PRINC) + 1}"
 inherit systemd
 
 SYSTEMD_UNITDIR = "${systemd_unitdir}/system"
-SYSTEMD_PACKAGES = "${PN}"
 RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "lxdm.service"
diff --git a/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend b/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend
index 5f829ac..e1eccf6 100644
--- a/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend
+++ b/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend
@@ -6,7 +6,6 @@ inherit systemd
 
 SRC_URI += "file://xinput-calibrator.service"
 
-SYSTEMD_PACKAGES = "${PN}"
 RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "${PN}.service"
 
diff --git a/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend b/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend
index 9310513..ee2009a 100644
--- a/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend
+++ b/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend
@@ -15,7 +15,6 @@ do_install_append() {
 	install -m 0644 ${WORKDIR}/xserver-nodm.service ${D}${systemd_unitdir}/system
 }
 
-SYSTEMD_PACKAGES = "${PN}"
 RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "xserver-nodm.service"
 
diff --git a/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bbappend b/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bbappend
index 23e0bc3..353ced8 100644
--- a/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bbappend
+++ b/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bbappend
@@ -6,7 +6,6 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI += "file://gpsd.service"
 
-SYSTEMD_PACKAGES = "${PN}"
 RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "${PN}.socket"
 SYSTEMD_OESCONS = "true"
diff --git a/meta-systemd/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bbappend b/meta-systemd/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bbappend
index 95e2f7a..230a583 100644
--- a/meta-systemd/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bbappend
+++ b/meta-systemd/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bbappend
@@ -7,6 +7,5 @@ EXTRA_OECONF += " \
   --with-systemdsystemunitdir=${systemd_unitdir}/system \
 "
 
-SYSTEMD_PACKAGES = "${PN}"
 RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "${PN}.service"
diff --git a/meta-systemd/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bbappend b/meta-systemd/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bbappend
index 74e5ae8..91e5e3f 100644
--- a/meta-systemd/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bbappend
+++ b/meta-systemd/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bbappend
@@ -2,6 +2,5 @@ inherit systemd
 
 PRINC := "${@int(PRINC) + 1}"
 
-SYSTEMD_PACKAGES = "${PN}"
 RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "pcscd.socket"
diff --git a/meta-systemd/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bbappend b/meta-systemd/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bbappend
index 5334fff..45b7e26 100644
--- a/meta-systemd/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bbappend
+++ b/meta-systemd/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bbappend
@@ -4,6 +4,5 @@ PRINC := "${@int(PRINC) + 1}"
 
 SYSTEMD_UNITDIR = "${systemd_unitdir}/system"
 
-SYSTEMD_PACKAGES = "${PN}"
 RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "${PN}.service"
diff --git a/meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend b/meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend
index 87eb3bb..5dc6f42 100644
--- a/meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend
+++ b/meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend
@@ -9,7 +9,6 @@ DEPENDS += "systemd"
 
 SRC_URI += "file://add-systemd-support.patch"
 
-SYSTEMD_PACKAGES = "${PN}"
 RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "udisks-daemon.service"
 SYSTEMD_AUTO_ENABLE = "disable"
diff --git a/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend b/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend
index ec0f08d..987c510 100644
--- a/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend
@@ -2,7 +2,6 @@ PRINC := "${@int(PRINC) + 1}"
 
 inherit systemd
 
-SYSTEMD_PACKAGES = "${PN}"
 RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "avahi-daemon.service"
 SYSTEMD_AUTO_ENABLE = "enable"
diff --git a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend b/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
index 004c494..e4dcabb 100644
--- a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
@@ -4,7 +4,6 @@ inherit systemd
 
 EXTRA_OECONF += "--with-systemdunitdir=${systemd_unitdir}/system/"
 
-SYSTEMD_PACKAGES = "${PN}"
 RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "bluetooth.service"
 SYSTEMD_AUTO_ENABLE = "disable"
diff --git a/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.12.bbappend b/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.12.bbappend
index 37c0d29..0ba99b5 100644
--- a/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.12.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.12.bbappend
@@ -1,5 +1,4 @@
 PRINC := "${@int(PRINC) + 1}"
 
-SYSTEMD_PACKAGES = "${PN}"
 RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "connman.service"
diff --git a/meta-systemd/oe-core/recipes-connectivity/ofono/ofono_1.12.bbappend b/meta-systemd/oe-core/recipes-connectivity/ofono/ofono_1.12.bbappend
index 9923708..e0e8f28 100644
--- a/meta-systemd/oe-core/recipes-connectivity/ofono/ofono_1.12.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/ofono/ofono_1.12.bbappend
@@ -2,7 +2,6 @@ PRINC := "${@int(PRINC) + 1}"
 
 inherit systemd
 
-SYSTEMD_PACKAGES = "${PN}"
 RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "ofono.service"
 SYSTEMD_AUTO_ENABLE = "disable"
diff --git a/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend b/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend
index 281c440..73709e8 100644
--- a/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend
@@ -4,7 +4,6 @@ PRINC := "${@int(PRINC) + 1}"
 
 inherit systemd
 
-SYSTEMD_PACKAGES = "${PN}"
 RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "portmap.service"
 SYSTEMD_AUTO_ENABLE = "disable"
diff --git a/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.22.2.bbappend b/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.22.2.bbappend
index e0b1aba..0447f51 100644
--- a/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.22.2.bbappend
+++ b/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.22.2.bbappend
@@ -4,6 +4,5 @@ PRINC := "${@int(PRINC) + 1}"
 
 SYSTEMD_UNITDIR = "${systemd_unitdir}/system"
 EXTRA_OECONF += "--enable-socket-activation --with-systemdsystemunitdir=${SYSTEMD_UNITDIR}"
-SYSTEMD_PACKAGES = "${PN}"
 RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "uuidd.socket"
diff --git a/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend
index 89079dc..0c7548a 100644
--- a/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend
+++ b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend
@@ -6,7 +6,6 @@ inherit systemd
 
 SRC_URI += "file://lighttpd.service"
 
-SYSTEMD_PACKAGES = "${PN}"
 RPROVIDES_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "lighttpd.service"
 
diff --git a/meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb b/meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb
index 3b3c1dc..9512986 100644
--- a/meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb
+++ b/meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb
@@ -9,6 +9,5 @@ PR = "r1"
 
 inherit systemd
 SYSTEMD_SERVICE_${PN} = ""
-SYSTEMD_PACKAGES = "${PN}"
 NATIVE_SYSTEMD_SUPPORT = "1"
 ALLOW_EMPTY_${PN} = "1"
-- 
1.8.1.5



