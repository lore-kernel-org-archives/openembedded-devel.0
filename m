Return-Path: <matthias@extraklein.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62618C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 11:01:17 +0000 (UTC)
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.63.101])
 by mx.groups.io with SMTP id smtpd.web08.10417.1660042870768872691
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Aug 2022 04:01:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@extraklein.de
 header.s=key2 header.b=as6ObwGt;
 spf=pass (domain: extraklein.de, ip: 188.68.63.101,
 mailfrom: matthias@extraklein.de)
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4M299J2q5xz4xjN
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  9 Aug 2022 13:01:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=extraklein.de;
	s=key2; t=1660042868;
	bh=v6vPe+s6VQUQIWEBXIn7QcxtO0H90iHh7vH/BJuKS1Y=;
	h=From:To:Cc:Subject:Date:From;
	b=as6ObwGtBtE8Ej+mIQOuLf+FXK+V8BLiyr4poVDKumm+m+jo//Aacu7Ev1LNYxvw8
	 icnxlGjYqL9PYEPlVcmYv8AfgY3evt66G8wAMNQTY/2ztFScihdhehDZEGKQElYj4z
	 4Om4ASYN3bYeIeQQ6PGn7fWH7CSHTFPLch/Vp3xGGFxdyWRJDIJjLRaL+0+box9jzr
	 LO083zEYYvSvZP+VylY3yuWjw/Qofsj/IkZ7Mp6Bjk7sqQIOU6rm+P97noZYmvaTL3
	 UJqO7nul2Or0+0CAvAfIyEPEeNOV941plSQFLB3P90MXu6XiiyIw0hiMrvva1oFM7b
	 0lnOKhn+1geLg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.53])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4M299J2KR1z4xVq
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  9 Aug 2022 13:01:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
Received: from mx2fa3.netcup.net (unknown [10.243.12.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4M299H5TkYz8scM
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  9 Aug 2022 13:01:07 +0200 (CEST)
Received: from localhost (ip-088-152-138-057.um26.pools.vodafone-ip.de
 [88.152.138.57])
	by mx2fa3.netcup.net (Postfix) with ESMTPSA id 1D1F814006D;
	Tue,  9 Aug 2022 13:01:07 +0200 (CEST)
Authentication-Results: mx2fa3;
        spf=pass (sender IP is 88.152.138.57)
 smtp.mailfrom=matthias@extraklein.de smtp.helo=localhost
Received-SPF: pass (mx2fa3: connection is authenticated)
From: Matthias Klein <matthias@extraklein.de>
To: openembedded-devel@lists.openembedded.org
Cc: Matthias Klein <matthias@extraklein.de>
Subject: [meta-oe][PATCH] libftdi: update to 1.5
Date: Tue,  9 Aug 2022 13:01:05 +0200
Message-Id: <20220809110105.1524-1-matthias@extraklein.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-PPP-Message-ID: <166004286734.2372.9094896483266511007@mx2fa3.netcup.net>
X-PPP-Vhost: extraklein.de
X-NC-CID: ErhBHpc3snK12h2f57Llf1sjl/VduN5PSftE+9gCWTn4rjvMszE=
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Aug 2022 11:01:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98178

Signed-off-by: Matthias Klein <matthias@extraklein.de>
---
 .../libftdi/{libftdi_1.4.bb =3D> libftdi_1.5.bb}             | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/libftdi/{libftdi_1.4.bb =3D> libftdi_1.5.=
bb} (79%)

diff --git a/meta-oe/recipes-support/libftdi/libftdi_1.4.bb b/meta-oe/rec=
ipes-support/libftdi/libftdi_1.5.bb
similarity index 79%
rename from meta-oe/recipes-support/libftdi/libftdi_1.4.bb
rename to meta-oe/recipes-support/libftdi/libftdi_1.5.bb
index f142cb228..55105c7b2 100644
--- a/meta-oe/recipes-support/libftdi/libftdi_1.4.bb
+++ b/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM=3D "\
 DEPENDS =3D "libusb1 python3 swig-native"
=20
 SRC_URI =3D "http://www.intra2net.com/en/developer/${BPN}/download/${BPN=
}1-${PV}.tar.bz2"
-SRC_URI[md5sum] =3D "0c09fb2bb19a57c839fa6845c6c780a2"
-SRC_URI[sha256sum] =3D "ec36fb49080f834690c24008328a5ef42d3cf584ef4060f3=
a35aa4681cb31b74"
+SRC_URI[md5sum] =3D "f515d7d69170a9afc8b273e8f1466a80"
+SRC_URI[sha256sum] =3D "7c7091e9c86196148bd41177b4590dccb1510bfe6cea5bf7=
407ff194482eb049"
=20
 S =3D "${WORKDIR}/${BPN}1-${PV}"
=20
@@ -22,7 +22,8 @@ inherit cmake binconfig pkgconfig python3native
 PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[cpp-wrapper] =3D "-DFTDI_BUILD_CPP=3Don -DFTDIPP=3Don,-DFT=
DI_BUILD_CPP=3Doff -DFTDIPP=3Doff,boost"
=20
-EXTRA_OECMAKE =3D "-DLIB_SUFFIX=3D${@d.getVar('baselib').replace('lib', =
'')} \
+EXTRA_OECMAKE =3D "-DSTATICLIBS=3Doff -DEXAMPLES=3Doff -DFTDI_EEPROM=3Do=
ff \
+                 -DLIB_SUFFIX=3D${@d.getVar('baselib').replace('lib', ''=
)} \
                  -DPYTHON_LIBRARY=3D${STAGING_LIBDIR}/lib${PYTHON_DIR}${=
PYTHON_ABI}.so \
                  -DPYTHON_INCLUDE_DIR=3D${STAGING_INCDIR}/${PYTHON_DIR}$=
{PYTHON_ABI}"
=20
--=20
2.30.2


