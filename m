Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8AB7C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 12:08:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6332.1742386130377691222
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 05:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2AF8E12FC
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 05:08:58 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9DC563F694
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 05:08:49 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 5/9] miniupnpd: don't inherit autotools
Date: Wed, 19 Mar 2025 12:08:32 +0000
Message-ID: <20250319120836.982987-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250319120836.982987-1-ross.burton@arm.com>
References: <20250319120836.982987-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 12:08:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116072

This upstream does not in fact use autotools

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-connectivity/miniupnpd/miniupnpd_2.1.20191006.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1=
.20191006.bb b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2=
.1.20191006.bb
index 1c2f030f83..5c0086f8f4 100644
--- a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.201910=
06.bb
+++ b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.201910=
06.bb
@@ -7,7 +7,7 @@ SECTION =3D "networking"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da1ed15843ce66639bcf9f109cf247=
870"
=20
-inherit autotools gettext pkgconfig systemd
+inherit gettext pkgconfig systemd
=20
 DEPENDS +=3D "iptables net-tools util-linux libmnl libnetfilter-conntrac=
k"
=20
@@ -20,12 +20,11 @@ SRC_URI[sha256sum] =3D "218fad7af31f3c22fb4c9db28a55a=
2a8b5067d41f5b38f52008a057a00
=20
 IPV6 =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '--ipv6', '', =
d)}"
=20
-do_configure:prepend() {
+do_configure() {
    echo "${@d.getVar('DISTRO_VERSION')}" > ${S}/os.openembedded
 }
=20
 do_compile() {
-    cd ${S}
     CONFIG_OPTIONS=3D"${IPV6} --leasefile --vendorcfg" oe_runmake -f Mak=
efile.linux config.h
     CONFIG_OPTIONS=3D"${IPV6} --leasefile --vendorcfg" oe_runmake -f Mak=
efile.linux
 }
--=20
2.43.0


