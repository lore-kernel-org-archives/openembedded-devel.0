Return-Path: <patrick.wicki@subset.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 189EFC07E97
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 02:56:10 +0000 (UTC)
Received: from ci74p00im-qukt09090301.me.com (ci74p00im-qukt09090301.me.com [17.57.156.20])
 by mx.groups.io with SMTP id smtpd.web10.63782.1701312967408326927
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Nov 2023 18:56:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@subset.ch header.s=sig1 header.b=kY55KeNc;
 spf=pass (domain: subset.ch, ip: 17.57.156.20, mailfrom: patrick.wicki@subset.ch)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=subset.ch; s=sig1;
	t=1701312966; bh=2iM/wy0DiLlz/nri3mKWkNQVG/D/CvMrwJBruLM0/so=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=kY55KeNcEHtyRtJwWNkw1LfjVIxkjgeGGYVf3QOoRpfiJYB+ux+xP0mAWRWO8eKof
	 fF5XuqCbkKSbKpDlAmjrn+YaZ0/e6vdU3EkZ8ofCp5m12cYxV3Tg/BOisRF2TvIOUE
	 3A1jljAymOQAndcBge2Ie8XCTlIY0k0SvkGLDQlWqXEtwUvRPpakLIhFUycjYi4w2y
	 kvhRCHvdVQ322a5f8K0wEuABnc54qIWqGywSu9YFKym+HAQZhl+5a1pgZ9llB0IsrN
	 PpitOnQc4kS+S13TC84vhUrXS+/V+EyfQC6PKUb5JCASUdIxk5EYG3PznrGKvT3Kbj
	 x9EUi5kCfBaXg==
Received: from localhost.localdomain (ci77p00im-dlb-asmtp-mailmevip.me.com [17.57.156.26])
	by ci74p00im-qukt09090301.me.com (Postfix) with ESMTPSA id CCE6D112026E;
	Thu, 30 Nov 2023 02:56:05 +0000 (UTC)
From: patrick.wicki@subset.ch
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Wicki <patrick.wicki@siemens.com>
Subject: [oe][meta-networking][PATCH 6/6] squid: add systemd service
Date: Thu, 30 Nov 2023 03:55:29 +0100
Message-ID: <1a378232d3f888d04ec0b72957691d7977454a24.1701312810.git.patrick.wicki@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701312810.git.patrick.wicki@siemens.com>
References: <cover.1701312810.git.patrick.wicki@siemens.com>
MIME-Version: 1.0
X-Proofpoint-GUID: nGQPO7u-khg70sYDAGmxEWgSntpBSwiI
X-Proofpoint-ORIG-GUID: nGQPO7u-khg70sYDAGmxEWgSntpBSwiI
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 clxscore=1030
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2311300020
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 02:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107159

From: Patrick Wicki <patrick.wicki@siemens.com>

Integrate the upstream unit file into the recipe.

Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
---
 meta-networking/recipes-daemons/squid/squid_6.5.bb | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/squid/squid_6.5.bb b/meta-ne=
tworking/recipes-daemons/squid/squid_6.5.bb
index 2641943fe..8d5d1a384 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.5.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.5.bb
@@ -32,7 +32,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263 \
                     "
 DEPENDS =3D "libtool"
=20
-inherit autotools pkgconfig useradd ptest perlnative
+inherit autotools pkgconfig useradd ptest perlnative systemd
=20
 LDFLAGS:append:mipsarch =3D " -latomic"
 LDFLAGS:append:powerpc =3D " -latomic"
@@ -44,6 +44,7 @@ USERADD_PARAM:${PN} =3D "--system --no-create-home --ho=
me-dir /var/run/squid --she
=20
 PACKAGECONFIG ??=3D "auth url-rewrite-helpers \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
 "
=20
 PACKAGECONFIG[libnetfilter-conntrack] =3D "--with-netfilter-conntrack=3D=
${includedir}, --without-netfilter-conntrack, libnetfilter-conntrack"
@@ -53,6 +54,7 @@ PACKAGECONFIG[esi] =3D "--enable-esi,--disable-esi,expa=
t libxml2"
 PACKAGECONFIG[ssl] =3D "--with-openssl=3Dyes,--with-openssl=3Dno,openssl=
"
 PACKAGECONFIG[auth] =3D "--enable-auth-basic=3D'${BASIC_AUTH}',--disable=
-auth --disable-auth-basic,krb5 openldap db cyrus-sasl"
 PACKAGECONFIG[url-rewrite-helpers] =3D "--enable-url-rewrite-helpers,--d=
isable-url-rewrite-helpers,"
+PACKAGECONFIG[systemd] =3D "--with-systemd,--without-systemd,systemd"
=20
 PACKAGES =3D+ " \
     ${PN}-conf \
@@ -106,6 +108,12 @@ do_install_ptest() {
=20
 do_install:append() {
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false=
', d)}; then
+        # Install service unit file
+        install -d ${D}/${systemd_unitdir}/system
+        install ${S}/tools/systemd/squid.service ${D}/${systemd_unitdir}=
/system
+        sed -i 's:/var/run/:/run/:g' ${D}/${systemd_unitdir}/system/squi=
d.service
+
+        # Configure tmpfiles.d
         install -d ${D}${sysconfdir}/tmpfiles.d
         echo "d ${localstatedir}/run/${BPN} 0755 squid squid -" >> ${D}$=
{sysconfdir}/tmpfiles.d/${BPN}.conf
         echo "d ${localstatedir}/log/${BPN} 0750 squid squid -" >> ${D}$=
{sysconfdir}/tmpfiles.d/${BPN}.conf
@@ -125,6 +133,9 @@ do_install:append() {
     install -m 0755 ${WORKDIR}/squid.nm ${D}${libdir}/NetworkManager/dis=
patcher.d/20-squid
 }
=20
+SYSTEMD_AUTO_ENABLE =3D "disable"
+SYSTEMD_SERVICE:${PN} =3D "squid.service"
+
 FILES:${PN} +=3D "${libdir} ${datadir}/errors ${datadir}/icons"
 FILES:${PN}-dbg +=3D "/usr/src/debug"
 FILES:${PN}-doc +=3D "${datadir}/*.txt"
--=20
2.43.0


