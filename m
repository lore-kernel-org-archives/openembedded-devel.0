Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 728A4C433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 12:46:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.10715.1639399579275127238
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 04:46:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B85646D
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 04:46:17 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 630FB3F793
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 04:46:17 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] dhcp-relay: fix rebuilds
Date: Mon, 13 Dec 2021 12:46:14 +0000
Message-Id: <20211213124614.3862310-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 12:46:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94327

dhcp-relay needs a fresh tarball of bind unpacked in ${S}, but this is
done by fetching the tarball to ${WORKDIR}, then in do_configure moving
it to ${S} and unpacking it.

If dhcp-relay is re-configured, the tarball no longer exists in ${WORKDIR=
}
so this fails.  Copy instead of moving so rebuilds work.

Also don't rename the downloaded file to just bind.tar.gz as that can
cause probems if the version changes.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-connectivity/dhcp/dhcp-relay_4.4.2p1.bb         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2p1=
.bb b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2p1.bb
index 8e41609f00..c86926813d 100644
--- a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2p1.bb
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2p1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;beginline=3D4;md5=3D=
004a4db50a1e20972e924a8618747
 DEPENDS =3D "openssl libcap zlib"
=20
 SRC_URI =3D "https://ftp.isc.org/isc/dhcp/4.4.2-P1/dhcp-4.4.2-P1.tar.gz =
\
-           https://ftp.isc.org/isc/bind9/9.11.32/bind-9.11.32.tar.gz;nam=
e=3Dbind;downloadfilename=3Dbind.tar.gz;unpack=3D0 \
+           https://ftp.isc.org/isc/bind9/9.11.32/bind-9.11.32.tar.gz;nam=
e=3Dbind;unpack=3D0 \
            file://default-relay \
            file://init-relay \
            file://dhcrelay.service \
@@ -47,11 +47,11 @@ EXTRA_OECONF =3D "--enable-paranoia \
 # Enable shared libs per dhcp README
 do_configure:prepend () {
     cp configure.ac+lt configure.ac
-    rm ${S}/bind/bind.tar.gz
-    mv ${WORKDIR}/bind.tar.gz ${S}/bind/
+    cp ${WORKDIR}/bind-9.11.32.tar.gz ${S}/bind/bind.tar.gz
 }
=20
 do_compile:prepend() {
+    # Need to unpack this now instead of earlier as do_configure will de=
lete the configure script
     rm -rf ${S}/bind/bind-9.11.32/
     tar xf ${S}/bind/bind.tar.gz -C ${S}/bind
     install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${=
S}/bind/bind-9.11.32/
--=20
2.25.1


