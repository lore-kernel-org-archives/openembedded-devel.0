Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288E9C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 17:01:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.361.1646672470079690248
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 09:01:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4F161570
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 09:01:09 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 503C13FA45
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 09:01:09 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v3 5/5] unattended-upgrades: remove PYPA_WHEEL
Date: Mon,  7 Mar 2022 17:01:04 +0000
Message-Id: <20220307170104.3671129-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307170104.3671129-1-ross.burton@arm.com>
References: <20220307170104.3671129-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 17:01:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95868

As this now uses setuptools_legacy there is no need to set PYPA_WHEEL.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../unattended-upgrades/unattended-upgrades_2.6.bb              | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgr=
ades_2.6.bb b/meta-oe/recipes-devtools/unattended-upgrades/unattended-upg=
rades_2.6.bb
index 2196266b99..e528d72e8c 100644
--- a/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.=
6.bb
+++ b/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.=
6.bb
@@ -15,8 +15,6 @@ S =3D "${WORKDIR}/git"
=20
 inherit setuptools3_legacy
=20
-PYPA_WHEEL =3D "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-0.1-*.wh=
l"
-
 DEPENDS +=3D "apt intltool-native python3-distutils-extra-native"
 RDEPENDS:${PN} +=3D "apt lsb-release python3-apt python3-core python3-da=
tetime python3-email python3-fcntl python3-io python3-logging python3-str=
ingold python3-syslog"
=20
--=20
2.25.1


