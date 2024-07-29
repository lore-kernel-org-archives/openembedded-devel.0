Return-Path: <csokas.bence@prolan.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F98C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 11:54:46 +0000 (UTC)
Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
 by mx.groups.io with SMTP id smtpd.web11.54478.1722254075656351528
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jul 2024 04:54:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prolan.hu header.s=mail header.b=KAEeuW2g;
 spf=pass (domain: prolan.hu, ip: 193.68.50.107, mailfrom: csokas.bence@prolan.hu)
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id EB82DA0935;
	Mon, 29 Jul 2024 13:54:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=BkTBgrwGk9jSFCmLfiZd
	OEJJ7AV/iy3L2kDD5/hYu2I=; b=KAEeuW2g0iLIbc/MQycuPMNEfAU0z6/qYiTX
	A8AoDdrMAM6q86juoydo310JEMEl6p3niUuZMrg66p8MXTOHtAcNR37SkAsEjRxp
	mn7iRZtDeGcmLhtTltt2uDpgRMJeCBRsYMbF8nYa+uqqQw7ZkejRf7DGT2d4UXhb
	Pyd6fUrPcFfrfoptn5bQ8hluQ4ql0CCyaZWBWrr/ehKX5jLnmvkP0OnUhODgzu7Z
	ag2Pt4CCt5/KtxIYibn9ge3wfKqoSvzM2JuJ9GEJ6JAqSGm1Wy/U0S0r+oaeOicp
	9x3+aoX3EG3ORV1dlUcSQ1SGzIPs/LUNejkErgdzRfY2NITVTNpNjbZzSgWulopP
	bRHtN1c7BoE//dl0Cxa1T/io8Y2c+9R8v2tmu/SW6pXXg69Iva/+8OrJHAslC+1p
	crQxz6HYc4hfyXnMEkKB34zy1XSwqgR/SdPhY+m8u88SODyxwnFub8rrGTYvG66k
	d38LNlChwDsffPjjc2sDbf6sUwm1TGAL1EqBex6Nf1ZD9iM2DcnIHLZi7VHv8jKj
	GDLeF/0cTR+WQylOmHZkptNQdy/FBmp/2FECo1HAUmfiwNoEIlg1+pIlcwd2Bndm
	OKg4zJnx7WhO2+OZzJ8bYRkeb04iLVGAtRJLT6cKsa6HM8Wl+Fhjp4sv4NhPU43a
	XoDIE1I=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <openembedded-devel@lists.openembedded.org>
CC: Emil Kronborg <emil.kronborg@protonmail.com>, Khem Raj
	<raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 2/2] php-fpm: fix systemd
Date: Mon, 29 Jul 2024 13:51:22 +0200
Message-ID: <20240729115120.1375412-3-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729115120.1375412-1-csokas.bence@prolan.hu>
References: <20240729115120.1375412-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1722254072;VERSION=7975;MC=387049000;ID=216798;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94854667467
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 11:54:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111455

From: Emil Kronborg <emil.kronborg@protonmail.com>

2848cc99a186 ("php-fpm: Add support for systemd") introduced a systemd
service file, where ExecStart and ExecStop uses /etc/init.d/php-fpm,
which does not exist if systemd is enabled. Consequently, the php-fpm
service fails to start even though it is correctly installed. This is
fixed by this commit in which the service file is identical to the one
from the PHP source code except for the use of BitBake variables. Also,
use ${systemd_system_unitdir} instead of ${systemd_unitdir}/system.

Signed-off-by: Emil Kronborg <emil.kronborg@protonmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/php/php/php-fpm.service  | 57 +++++++++++++++++--
 meta-oe/recipes-devtools/php/php_8.1.29.bb    | 17 +++---
 2 files changed, 62 insertions(+), 12 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php/php-fpm.service b/meta-oe/r=
ecipes-devtools/php/php/php-fpm.service
index eec76fb56..918ffe674 100644
--- a/meta-oe/recipes-devtools/php/php/php-fpm.service
+++ b/meta-oe/recipes-devtools/php/php/php-fpm.service
@@ -1,10 +1,57 @@
+# It's not recommended to modify this file in-place, because it
+# will be overwritten during upgrades.  If you want to customize,
+# the best way is to use the "systemctl edit" command.
+
 [Unit]
-Description=3DPHP-FPM
+Description=3DThe PHP FastCGI Process Manager
 After=3Dnetwork.target
+
 [Service]
-Type=3Dforking
-PIDFile=3D/run/php-fpm.pid
-ExecStart=3D@SYSCONFDIR@/init.d/php-fpm start
-ExecStop=3D@SYSCONFDIR@/init.d/php-fpm stop
+Type=3Dsimple
+PIDFile=3D@LOCALSTATEDIR@/run/php-fpm.pid
+ExecStart=3D@SBINDIR@/php-fpm --nodaemonize --fpm-config /etc/php-fpm.co=
nf
+ExecReload=3D@BINDIR@/kill -USR2 $MAINPID
+
+# Set up a new file system namespace and mounts private /tmp and /var/tm=
p directories
+# so this service cannot access the global directories and other process=
es cannot
+# access this service's directories.
+PrivateTmp=3Dtrue
+
+# Mounts the /usr, /boot, and /etc directories read-only for processes i=
nvoked by this unit.
+ProtectSystem=3Dfull
+
+# Sets up a new /dev namespace for the executed processes and only adds =
API pseudo devices
+# such as /dev/null, /dev/zero or /dev/random (as well as the pseudo TTY=
 subsystem) to it,
+# but no physical devices such as /dev/sda.
+PrivateDevices=3Dtrue
+
+# Explicit module loading will be denied. This allows to turn off module=
 load and unload
+# operations on modular kernels. It is recommended to turn this on for m=
ost services that
+# do not need special file systems or extra kernel modules to work.
+ProtectKernelModules=3Dtrue
+
+# Kernel variables accessible through /proc/sys, /sys, /proc/sysrq-trigg=
er, /proc/latency_stats,
+# /proc/acpi, /proc/timer_stats, /proc/fs and /proc/irq will be made rea=
d-only to all processes
+# of the unit. Usually, tunable kernel variables should only be written =
at boot-time, with the
+# sysctl.d(5) mechanism. Almost no services need to write to these at ru=
ntime; it is hence
+# recommended to turn this on for most services.
+ProtectKernelTunables=3Dtrue
+
+# The Linux Control Groups (cgroups(7)) hierarchies accessible through /=
sys/fs/cgroup will be
+# made read-only to all processes of the unit. Except for container mana=
gers no services should
+# require write access to the control groups hierarchies; it is hence re=
commended to turn this on
+# for most services
+ProtectControlGroups=3Dtrue
+
+# Any attempts to enable realtime scheduling in a process of the unit ar=
e refused.
+RestrictRealtime=3Dtrue
+
+# Restricts the set of socket address families accessible to the process=
es of this unit.
+# Protects against vulnerabilities such as CVE-2016-8655
+RestrictAddressFamilies=3DAF_INET AF_INET6 AF_NETLINK AF_UNIX
+
+# Takes away the ability to create or manage any kind of namespace
+RestrictNamespaces=3Dtrue
+
 [Install]
 WantedBy=3Dmulti-user.target
diff --git a/meta-oe/recipes-devtools/php/php_8.1.29.bb b/meta-oe/recipes=
-devtools/php/php_8.1.29.bb
index 2b3cfd58c..ec86ce088 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.29.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.29.bb
@@ -41,7 +41,7 @@ CVE_CHECK_IGNORE +=3D "\
     CVE-2007-4596 \
 "
=20
-inherit autotools pkgconfig python3native gettext multilib_header multil=
ib_script
+inherit autotools pkgconfig python3native gettext multilib_header multil=
ib_script systemd
=20
 # phpize is not scanned for absolute paths by default (but php-config is=
).
 #
@@ -182,11 +182,11 @@ do_install:append:class-target() {
     install -m 0644 ${WORKDIR}/php-fpm-apache.conf ${D}/${sysconfdir}/ap=
ache2/conf.d/php-fpm.conf
=20
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d=
)};then
-        install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${WORKDIR}/php-fpm.service ${D}${systemd_unitdir=
}/system/
-        sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
-            -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
-            ${D}${systemd_unitdir}/system/php-fpm.service
+        install -d ${D}${systemd_system_unitdir}
+        install -m 0644 ${WORKDIR}/php-fpm.service ${D}${systemd_system_=
unitdir}/php-fpm.service
+        sed -i -e 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${systemd_s=
ystem_unitdir}/php-fpm.service
+        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdi=
r}/php-fpm.service
+        sed -i -e 's,@BINDIR@,${bindir},g' ${D}${systemd_system_unitdir}=
/php-fpm.service
     fi
=20
     if ${@bb.utils.contains('PACKAGECONFIG', 'apache2', 'true', 'false',=
 d)}; then
@@ -248,7 +248,7 @@ FILES:${PN}-cli =3D "${bindir}/php"
 FILES:${PN}-phpdbg =3D "${bindir}/phpdbg"
 FILES:${PN}-phar =3D "${bindir}/phar*"
 FILES:${PN}-cgi =3D "${bindir}/php-cgi"
-FILES:${PN}-fpm =3D "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf ${dat=
adir}/fpm ${sysconfdir}/init.d/php-fpm ${systemd_unitdir}/system/php-fpm.=
service ${sysconfdir}/php-fpm.d/www.conf.default"
+FILES:${PN}-fpm =3D "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf ${dat=
adir}/fpm ${sysconfdir}/init.d/php-fpm ${sysconfdir}/php-fpm.d/www.conf.d=
efault"
 FILES:${PN}-fpm-apache2 =3D "${sysconfdir}/apache2/conf.d/php-fpm.conf"
 CONFFILES:${PN}-fpm =3D "${sysconfdir}/php-fpm.conf"
 CONFFILES:${PN}-fpm-apache2 =3D "${sysconfdir}/apache2/conf.d/php-fpm.co=
nf"
@@ -279,6 +279,9 @@ RPROVIDES:${PN}-modphp =3D "${MODPHP_OLDPACKAGE}"
 RREPLACES:${PN}-modphp =3D "${MODPHP_OLDPACKAGE}"
 RCONFLICTS:${PN}-modphp =3D "${MODPHP_OLDPACKAGE}"
=20
+SYSTEMD_SERVICE:${PN}-fpm =3D "php-fpm.service"
+SYSTEMD_PACKAGES +=3D "${PN}-fpm"
+
 do_install:append:class-native() {
     create_wrapper ${D}${bindir}/php \
         PHP_PEAR_SYSCONF_DIR=3D${sysconfdir}/
--=20
2.34.1



