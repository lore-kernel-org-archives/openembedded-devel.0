Return-Path: <Thomas.Gessler@posteo.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C1CC4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 00:00:42 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web11.2240.1699401632254939117
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Nov 2023 16:00:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.de header.s=2017 header.b=BBHo+3Sa;
 spf=pass (domain: posteo.de, ip: 185.67.36.66, mailfrom: thomas.gessler@posteo.de)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 8420C240101
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Nov 2023 01:00:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1699401630; bh=AZFEb0wVRTa7arCFF+v4JT/cAe1IIAZFPHo/Fj9VbXI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=BBHo+3SaR7mu277hBQRIjOwxjkYXq2VyEYa34idsDoSSE9Yp4FUxoeH5kSn8JML9w
	 3fCo3BBaR4yA+8W22GV3r4EasbgwsHN51r8vYnYkh2RChBu9SuQ7b6L692o+tMBtp3
	 9lqWD8JvMmnh6ZXq2qOdODW/ygSG/b+lYFTsezuz9/phR02L3U//hfs4WRAJWwda4h
	 xDCin7xLn+Iqk3f7v9x2ymidzriXyBvhoZYtncYQe9mYxdmYkpzZScSDXEAwz4qIEZ
	 cZOmGn/F3JeiS214jkpam/Y7GQrD3RahvmEzuBeqqDSjOsUwHoB+QMEYTxrxGHU894
	 XyY61T3Uo5w0Q==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4SQ4wZ14Rxz6txB;
	Wed,  8 Nov 2023 01:00:30 +0100 (CET)
From: Thomas Gessler <Thomas.Gessler@posteo.de>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Gessler <Thomas.Gessler@posteo.de>
Subject: [meta-oe][PATCH] influxdb: Add start script used by systemd service
Date: Tue,  7 Nov 2023 23:59:55 +0000
Message-ID: <20231107235955.6067-1-Thomas.Gessler@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 00:00:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106464

The influxdb systemd service tries to run the script
influxd-systemd-start.sh, but it was not copied to the correct location
by the influxdb recipe. This led to a failure during start-up:

[FAILED] Failed to start InfluxDB i=E2=80=A6ributed, time series database=
.
---
 meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb b/meta-oe/re=
cipes-dbs/influxdb/influxdb_1.8.10.bb
index 50995c09b..7f8110e4c 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
+++ b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
@@ -58,11 +58,15 @@ do_install:append() {
     if [ "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}" ] ; then
         install -d ${D}${systemd_unitdir}/system
         install -m 0644 ${S}/src/${GO_IMPORT}/scripts/influxdb.service $=
{D}${systemd_system_unitdir}/influxdb.service
+        install -d ${D}${libdir}/influxdb/scripts
+        install -m 0755 ${S}/src/${GO_IMPORT}/scripts/influxd-systemd-st=
art.sh ${D}${libdir}/influxdb/scripts/influxd-systemd-start.sh
     fi
=20
     # TODO chown
 }
=20
+FILES:${PN} +=3D "${libdir}/influxdb/scripts/influxd-systemd-start.sh"
+
 INITSCRIPT_PACKAGES =3D "${PN}"
 INITSCRIPT_NAME =3D "influxdb"
 INITSCRIPT_PARAMS =3D "defaults"
--=20
2.34.1


