Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD75AC35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 16:55:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13141.1742403341073438571
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 09:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B96C5113E
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 09:55:48 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 484FF3F673
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 09:55:40 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] miniupnpd: partial recipe rewrite
Date: Wed, 19 Mar 2025 16:55:36 +0000
Message-ID: <20250319165536.445042-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 16:55:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116084

This upstream does not in fact use autotools, so remove the inherit.

Split the configure step (make config.h) into do_configure and ensure
that it always runs in case the configuration has changed.

Use PACKAGECONFIG for options, as there are more available upstream.

Add UPSTREAM_CHECK variables to check for new releases. This depends on
a bitbake change[1] but with that detects that 2.3.7 has been released.

Add a DEPENDS on openssl as the Makefiles try to link against it and
silently fail without it.

[1] https://lore.kernel.org/bitbake-devel/20250319165339.439776-1-ross.bu=
rton@arm.com/T/#u

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../miniupnpd/miniupnpd_2.1.20191006.bb       | 22 +++++++++++--------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1=
.20191006.bb b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2=
.1.20191006.bb
index 1c2f030f83..b7ba37f290 100644
--- a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.201910=
06.bb
+++ b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.201910=
06.bb
@@ -7,27 +7,31 @@ SECTION =3D "networking"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da1ed15843ce66639bcf9f109cf247=
870"
=20
-inherit autotools gettext pkgconfig systemd
+inherit gettext pkgconfig systemd
=20
-DEPENDS +=3D "iptables net-tools util-linux libmnl libnetfilter-conntrac=
k"
+DEPENDS +=3D "iptables net-tools util-linux libmnl libnetfilter-conntrac=
k openssl"
=20
 SRC_URI =3D "http://miniupnp.tuxfamily.org/files/download.php?file=3D${B=
P}.tar.gz;downloadfilename=3D${BP}.tar.gz \
            file://miniupnpd.service \
            file://0001-Add-OpenEmbedded-cross-compile-case.patch \
            "
-SRC_URI[md5sum] =3D "340789edd49c113afe37834cc901a1e8"
 SRC_URI[sha256sum] =3D "218fad7af31f3c22fb4c9db28a55a2a8b5067d41f5b38f52=
008a057a00d2206d"
=20
-IPV6 =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '--ipv6', '', =
d)}"
+UPSTREAM_CHECK_URI =3D "https://miniupnp.tuxfamily.org/files/"
+UPSTREAM_CHECK_REGEX =3D "${BPN}-(?P<pver>\d+(\.\d+)+)\.tar"
=20
-do_configure:prepend() {
-   echo "${@d.getVar('DISTRO_VERSION')}" > ${S}/os.openembedded
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
+PACKAGECONFIG[ipv6] =3D "--ipv6"
+
+EXTRA_OEMAKE =3D "-f Makefile.linux"
+
+do_configure() {
+    echo "${@d.getVar('DISTRO_VERSION')}" > ${S}/os.openembedded
+    CONFIG_OPTIONS=3D"--leasefile --vendorcfg ${PACKAGECONFIG_CONFARGS}"=
 oe_runmake --always-make config.h
 }
=20
 do_compile() {
-    cd ${S}
-    CONFIG_OPTIONS=3D"${IPV6} --leasefile --vendorcfg" oe_runmake -f Mak=
efile.linux config.h
-    CONFIG_OPTIONS=3D"${IPV6} --leasefile --vendorcfg" oe_runmake -f Mak=
efile.linux
+    oe_runmake
 }
=20
 do_install() {
--=20
2.43.0


