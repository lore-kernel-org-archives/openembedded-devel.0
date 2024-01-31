Return-Path: <emil.kronborg@protonmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69C58C47258
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 19:13:33 +0000 (UTC)
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by mx.groups.io with SMTP id smtpd.web11.3860.1706728403074758726
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Jan 2024 11:13:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@protonmail.com header.s=protonmail3 header.b=txM64W1/;
 spf=pass (domain: protonmail.com, ip: 185.70.43.16, mailfrom: emil.kronborg@protonmail.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1706728400; x=1706987600;
	bh=y+WGltJgujcBTshT8wrKfXALcq8g7E87SPZ+QPDNuKY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=txM64W1/U8dfrJfxBZwFMB5QjZyIdLMDqpsDpZnTC4oRtcuPA1OlpyJ5O42kyvZv+
	 ibk28QEYZpmxamldN0K5v2OzInCNWq7e2g2P2+VCQ9XpOlGUcUoguAKd1++95H+M8m
	 KHXnamWqMyJASO0h1QQGsEUoTQsf4ZQ32MALUR0cdC+kxxCDaveGtJz4Ht5uJyc1kV
	 h8D6sLBia7wRXbsrQZZig8cT6F29u2TW5RhkuEyuzeNork9/xiRgor6j+U+iulS/7Q
	 9UeRYm6aecoRsU2ytictayIAv+AksmVGXny3duBf3erGR31cHTnDD5q6xwSbK4yUrB
	 v1SmC0holIgHQ==
Date: Wed, 31 Jan 2024 19:13:13 +0000
To: openembedded-devel@lists.openembedded.org
From: Emil Kronborg <emil.kronborg@protonmail.com>
Cc: emkan@prevas.dk, Emil Kronborg <emil.kronborg@protonmail.com>
Subject: [meta-oe][PATCH] php-fpm: fix systemd
Message-ID: <20240131191300.117589-1-emil.kronborg@protonmail.com>
Feedback-ID: 20949900:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Jan 2024 19:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108509

2848cc99a186 ("php-fpm: Add support for systemd") introduced a systemd
service file, where ExecStart and ExecStop uses /etc/init.d/php-fpm,
which does not exist if systemd is enabled. Consequently, the php-fpm
service fails to start even though it is correctly installed. This is
fixed by this commit in which the service file is identical to the one
from the PHP source code except for the use of BitBake variables. Also,
use ${systemd_system_unitdir} instead of ${systemd_unitdir}/system.

Signed-off-by: Emil Kronborg <emil.kronborg@protonmail.com>
---
 .../recipes-devtools/php/php/php-fpm.service  | 57 +++++++++++++++++--
 meta-oe/recipes-devtools/php/php_8.2.9.bb     | 17 +++---
 2 files changed, 62 insertions(+), 12 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php/php-fpm.service b/meta-oe/rec=
ipes-devtools/php/php/php-fpm.service
index eec76fb563ac..918ffe6749a6 100644
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
+ExecStart=3D@SBINDIR@/php-fpm --nodaemonize --fpm-config /etc/php-fpm.conf
+ExecReload=3D@BINDIR@/kill -USR2 $MAINPID
+
+# Set up a new file system namespace and mounts private /tmp and /var/tmp =
directories
+# so this service cannot access the global directories and other processes=
 cannot
+# access this service's directories.
+PrivateTmp=3Dtrue
+
+# Mounts the /usr, /boot, and /etc directories read-only for processes inv=
oked by this unit.
+ProtectSystem=3Dfull
+
+# Sets up a new /dev namespace for the executed processes and only adds AP=
I pseudo devices
+# such as /dev/null, /dev/zero or /dev/random (as well as the pseudo TTY s=
ubsystem) to it,
+# but no physical devices such as /dev/sda.
+PrivateDevices=3Dtrue
+
+# Explicit module loading will be denied. This allows to turn off module l=
oad and unload
+# operations on modular kernels. It is recommended to turn this on for mos=
t services that
+# do not need special file systems or extra kernel modules to work.
+ProtectKernelModules=3Dtrue
+
+# Kernel variables accessible through /proc/sys, /sys, /proc/sysrq-trigger=
, /proc/latency_stats,
+# /proc/acpi, /proc/timer_stats, /proc/fs and /proc/irq will be made read-=
only to all processes
+# of the unit. Usually, tunable kernel variables should only be written at=
 boot-time, with the
+# sysctl.d(5) mechanism. Almost no services need to write to these at runt=
ime; it is hence
+# recommended to turn this on for most services.
+ProtectKernelTunables=3Dtrue
+
+# The Linux Control Groups (cgroups(7)) hierarchies accessible through /sy=
s/fs/cgroup will be
+# made read-only to all processes of the unit. Except for container manage=
rs no services should
+# require write access to the control groups hierarchies; it is hence reco=
mmended to turn this on
+# for most services
+ProtectControlGroups=3Dtrue
+
+# Any attempts to enable realtime scheduling in a process of the unit are =
refused.
+RestrictRealtime=3Dtrue
+
+# Restricts the set of socket address families accessible to the processes=
 of this unit.
+# Protects against vulnerabilities such as CVE-2016-8655
+RestrictAddressFamilies=3DAF_INET AF_INET6 AF_NETLINK AF_UNIX
+
+# Takes away the ability to create or manage any kind of namespace
+RestrictNamespaces=3Dtrue
+
 [Install]
 WantedBy=3Dmulti-user.target
diff --git a/meta-oe/recipes-devtools/php/php_8.2.9.bb b/meta-oe/recipes-de=
vtools/php/php_8.2.9.bb
index cb9d0060a3f7..e645a284d5a6 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.9.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.9.bb
@@ -44,7 +44,7 @@ CVE_STATUS_PHP =3D " \
     CVE-2007-4596 \
 "
=20
-inherit autotools pkgconfig python3native gettext multilib_header multilib=
_script
+inherit autotools pkgconfig python3native gettext multilib_header multilib=
_script systemd
=20
 # phpize is not scanned for absolute paths by default (but php-config is).
 #
@@ -193,11 +193,11 @@ do_install:append:class-target() {
     install -m 0644 ${WORKDIR}/php-fpm-apache.conf ${D}/${sysconfdir}/apac=
he2/conf.d/php-fpm.conf
=20
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}=
;then
-        install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${WORKDIR}/php-fpm.service ${D}${systemd_unitdir}/=
system/
-        sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
-            -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
-            ${D}${systemd_unitdir}/system/php-fpm.service
+        install -d ${D}${systemd_system_unitdir}
+        install -m 0644 ${WORKDIR}/php-fpm.service ${D}${systemd_system_un=
itdir}/php-fpm.service
+        sed -i -e 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${systemd_sys=
tem_unitdir}/php-fpm.service
+        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}=
/php-fpm.service
+        sed -i -e 's,@BINDIR@,${bindir},g' ${D}${systemd_system_unitdir}/p=
hp-fpm.service
     fi
=20
     if ${@bb.utils.contains('PACKAGECONFIG', 'apache2', 'true', 'false', d=
)}; then
@@ -259,7 +259,7 @@ FILES:${PN}-cli =3D "${bindir}/php"
 FILES:${PN}-phpdbg =3D "${bindir}/phpdbg"
 FILES:${PN}-phar =3D "${bindir}/phar*"
 FILES:${PN}-cgi =3D "${bindir}/php-cgi"
-FILES:${PN}-fpm =3D "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf ${datad=
ir}/fpm ${sysconfdir}/init.d/php-fpm ${systemd_unitdir}/system/php-fpm.serv=
ice ${sysconfdir}/php-fpm.d/www.conf.default"
+FILES:${PN}-fpm =3D "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf ${datad=
ir}/fpm ${sysconfdir}/init.d/php-fpm ${sysconfdir}/php-fpm.d/www.conf.defau=
lt"
 FILES:${PN}-fpm-apache2 =3D "${sysconfdir}/apache2/conf.d/php-fpm.conf"
 CONFFILES:${PN}-fpm =3D "${sysconfdir}/php-fpm.conf"
 CONFFILES:${PN}-fpm-apache2 =3D "${sysconfdir}/apache2/conf.d/php-fpm.conf=
"
@@ -290,6 +290,9 @@ RPROVIDES:${PN}-modphp =3D "${MODPHP_OLDPACKAGE}"
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
2.43.0



