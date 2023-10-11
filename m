Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99BF2CDB46B
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 16:34:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.21328.1697042038437941511
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Oct 2023 09:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: luca.fancellu@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5B611516;
	Wed, 11 Oct 2023 09:34:38 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 810773F7A6;
	Wed, 11 Oct 2023 09:33:57 -0700 (PDT)
From: Luca Fancellu <luca.fancellu@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Diego.Sueiro@arm.com,
	Rahul.Singh@arm.com
Subject: [meta-oe][PATCH 3/3] linuxptp: add systemd services
Date: Wed, 11 Oct 2023 17:33:46 +0100
Message-Id: <20231011163346.1856498-4-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011163346.1856498-1-luca.fancellu@arm.com>
References: <20231011163346.1856498-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Oct 2023 16:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105429

Add systemd services phc2sys@.service and ptp4l@.service,
these services are taken from the Ubuntu/Debian linuxptp
package.

Update the recipe to install them when needed using the
systemd bbclass, the services are disabled by default.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 .../linuxptp/linuxptp/systemd/phc2sys@.service   | 13 +++++++++++++
 .../linuxptp/linuxptp/systemd/ptp4l@.service     | 11 +++++++++++
 .../linuxptp/linuxptp_4.1.bb                     | 16 ++++++++++++++++
 3 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/system=
d/phc2sys@.service
 create mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/system=
d/ptp4l@.service

diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/phc2s=
ys@.service b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/phc2=
sys@.service
new file mode 100644
index 000000000000..dd2512bdca11
--- /dev/null
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/phc2sys@.ser=
vice
@@ -0,0 +1,13 @@
+[Unit]
+Description=3DSynchronize system clock or PTP hardware clock (PHC)
+Documentation=3Dman:phc2sys
+Requires=3Dptp4l.service
+After=3Dptp4l.service
+Before=3Dtime-sync.target
+
+[Service]
+Type=3Dsimple
+ExecStart=3D/usr/sbin/phc2sys -w -s %I
+
+[Install]
+WantedBy=3Dmulti-user.target
diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/ptp4l=
@.service b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/ptp4l@=
.service
new file mode 100644
index 000000000000..1bad2d72df6b
--- /dev/null
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/ptp4l@.servi=
ce
@@ -0,0 +1,11 @@
+[Unit]
+Description=3DPrecision Time Protocol (PTP) service for %I
+Documentation=3Dman:ptp4l
+After=3Dsys-subsystem-net-devices-%i.device
+
+[Service]
+Type=3Dsimple
+ExecStart=3D/usr/sbin/ptp4l -f /etc/linuxptp/ptp4l.conf -i %I
+
+[Install]
+WantedBy=3Dmulti-user.target
diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb b/meta=
-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb
index 3c7efbdeca72..95ed76e621e6 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb
@@ -11,11 +11,15 @@ SRC_URI =3D "${LINUXPTP_SRC_URI}/files/v4.1/linuxptp-=
${PV}.tgz \
            file://build-Allow-CC-and-prefix-to-be-overriden.patch \
            file://Use-cross-cpp-in-incdefs.patch \
            file://0001-include-string.h-for-strncpy.patch \
+           file://systemd/phc2sys@.service \
+           file://systemd/ptp4l@.service \
            "
=20
 SRC_URI[md5sum] =3D "1db8699fc155965341759be5e5aad938"
 SRC_URI[sha256sum] =3D "e1743d44f8208897e30895da3579e670ff919b914feb4b5a=
949f3e421ddde535"
=20
+inherit systemd
+
 UPSTREAM_CHECK_URI =3D "${LINUXPTP_SRC_URI}/files/"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)/"
=20
@@ -23,6 +27,8 @@ EXTRA_OEMAKE =3D "ARCH=3D${TARGET_ARCH} EXTRA_CFLAGS=3D=
'${CFLAGS}' mandir=3D${mandir}"
=20
 export KBUILD_OUTPUT=3D"${RECIPE_SYSROOT}"
=20
+LINUXPTP_SYSTEMD_SERVICES =3D "phc2sys@.service ptp4l@.service"
+
 do_install() {
     oe_runmake install DESTDIR=3D${D} prefix=3D${prefix}
=20
@@ -35,8 +41,18 @@ do_install() {
     install -d ${D}/${sysconfdir}/linuxptp/
     install -m 644 ${S}/configs/default.cfg \
         ${D}${sysconfdir}/linuxptp/ptp4l.conf
+
+    # Install systemd services
+    install -d ${D}/${systemd_unitdir}/system/
+    for service in ${LINUXPTP_SYSTEMD_SERVICES}; do
+        install -m 644 ${WORKDIR}/systemd/$service \
+            ${D}/${systemd_unitdir}/system/$service
+    done
 }
=20
+SYSTEMD_SERVICE:${PN} =3D "${LINUXPTP_SYSTEMD_SERVICES}"
+SYSTEMD_AUTO_ENABLE:${PN} =3D "disable"
+
 PACKAGES =3D+ "${PN}-configs"
=20
 FILES:${PN}-configs +=3D "${docdir}"
--=20
2.34.1


