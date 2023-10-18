Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 505B0CDB482
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 11:21:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.279284.1697628070606156303
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Oct 2023 04:21:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: luca.fancellu@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4966D1007;
	Wed, 18 Oct 2023 04:21:51 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B30933F762;
	Wed, 18 Oct 2023 04:21:09 -0700 (PDT)
From: Luca Fancellu <luca.fancellu@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: diego.sueiro@arm.com,
	rahul.singh@arm.com
Subject: [PATCH v2 2/2] linuxptp: Use templates for the systemd services
Date: Wed, 18 Oct 2023 12:20:59 +0100
Message-Id: <20231018112059.2368845-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231018112059.2368845-1-luca.fancellu@arm.com>
References: <20231018112059.2368845-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 11:21:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105573

Use templates for the systemd services so that sbindir
and sysconfdir can be written into them, improving
portability.

Pass sbindir with EXTRA_OEMAKE and remove 'prefix' which
is redundant since we pass sbindir and mandir already.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 .../{phc2sys@.service =3D> phc2sys@.service.in}     |  2 +-
 .../systemd/{ptp4l@.service =3D> ptp4l@.service.in} |  2 +-
 .../recipes-connectivity/linuxptp/linuxptp_4.1.bb | 15 ++++++++++-----
 3 files changed, 12 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/{phc2sys@.=
service =3D> phc2sys@.service.in} (85%)
 rename meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/{ptp4l@.se=
rvice =3D> ptp4l@.service.in} (73%)

diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/phc2s=
ys@.service b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/phc2=
sys@.service.in
similarity index 85%
rename from meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/phc2sy=
s@.service
rename to meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/phc2sys@=
.service.in
index dd2512bdca11..f66dd2d01031 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/phc2sys@.ser=
vice
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/phc2sys@.ser=
vice.in
@@ -7,7 +7,7 @@ Before=3Dtime-sync.target
=20
 [Service]
 Type=3Dsimple
-ExecStart=3D/usr/sbin/phc2sys -w -s %I
+ExecStart=3D@SBINDIR@/phc2sys -w -s %I
=20
 [Install]
 WantedBy=3Dmulti-user.target
diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/ptp4l=
@.service b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/ptp4l@=
.service.in
similarity index 73%
rename from meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/ptp4l@=
.service
rename to meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/ptp4l@.s=
ervice.in
index 1bad2d72df6b..250218141272 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/ptp4l@.servi=
ce
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/ptp4l@.servi=
ce.in
@@ -5,7 +5,7 @@ After=3Dsys-subsystem-net-devices-%i.device
=20
 [Service]
 Type=3Dsimple
-ExecStart=3D/usr/sbin/ptp4l -f /etc/linuxptp/ptp4l.conf -i %I
+ExecStart=3D@SBINDIR@/ptp4l -f @SYSCONFDIR@/linuxptp/ptp4l.conf -i %I
=20
 [Install]
 WantedBy=3Dmulti-user.target
diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb b/meta=
-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb
index a92434385d52..9a5c9b52043c 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb
@@ -10,8 +10,8 @@ LINUXPTP_SRC_URI =3D "http://sourceforge.net/projects/l=
inuxptp"
 SRC_URI =3D "${LINUXPTP_SRC_URI}/files/v4.1/linuxptp-${PV}.tgz \
            file://0001-include-string.h-for-strncpy.patch \
            file://0002-linuxptp-Use-CC-in-incdefs.sh.patch \
-           file://systemd/phc2sys@.service \
-           file://systemd/ptp4l@.service \
+           file://systemd/phc2sys@.service.in \
+           file://systemd/ptp4l@.service.in \
            "
=20
 SRC_URI[md5sum] =3D "1db8699fc155965341759be5e5aad938"
@@ -22,14 +22,15 @@ inherit systemd
 UPSTREAM_CHECK_URI =3D "${LINUXPTP_SRC_URI}/files/"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)/"
=20
-EXTRA_OEMAKE =3D "CC=3D'${CC}' EXTRA_CFLAGS=3D'${CFLAGS}' mandir=3D'${ma=
ndir}'"
+EXTRA_OEMAKE =3D "CC=3D'${CC}' EXTRA_CFLAGS=3D'${CFLAGS}' mandir=3D'${ma=
ndir}' \
+    sbindir=3D'${sbindir}'"
=20
 export KBUILD_OUTPUT=3D"${RECIPE_SYSROOT}"
=20
 LINUXPTP_SYSTEMD_SERVICES =3D "phc2sys@.service ptp4l@.service"
=20
 do_install() {
-    oe_runmake install DESTDIR=3D${D} prefix=3D${prefix}
+    oe_runmake install DESTDIR=3D${D}
=20
     # Install example configs from source tree
     install -d ${D}${docdir}/${PN}
@@ -44,7 +45,11 @@ do_install() {
     # Install systemd services
     install -d ${D}/${systemd_unitdir}/system/
     for service in ${LINUXPTP_SYSTEMD_SERVICES}; do
-        install -m 644 ${WORKDIR}/systemd/$service \
+        sed -i -e 's,@SBINDIR@,${sbindir},g' \
+            ${WORKDIR}/systemd/$service.in
+        sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
+            ${WORKDIR}/systemd/$service.in
+        install -m 644 ${WORKDIR}/systemd/$service.in \
             ${D}/${systemd_unitdir}/system/$service
     done
 }
--=20
2.34.1


