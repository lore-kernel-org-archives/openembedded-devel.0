Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52596C61DD3
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 16:45:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12332.1788453905795879294
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 09:45:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=GQz+r+8K;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 913CC1650
	for <openembedded-devel@lists.openembedded.org>; Thu,  3 Sep 2026 09:45:01 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E76D63F673
	for <openembedded-devel@lists.openembedded.org>; Thu,  3 Sep 2026 09:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788453905; bh=WNEICYn8GeaRQLh92BwwYSaXxkxoSTwFFtWjR+i5N+c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GQz+r+8Kkpfx8vCV+PVm8+9oEC/Ctz0An0J1b0dl3i2dAELFKX3fi7EEMSNxXgB1H
	 czBl83OSBXsycBbhLGsfEglnFoWJdl6wp7PqaCBXyBw631M7tgdS3r/9H4/RfbbySj
	 hZ/dvTFfhroWhkqVggMdFQDl6Hzt7oVhBT7B9h1I=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/3] meta-oe: remove redundant PYPI_PACKAGE assignments
Date: Thu,  3 Sep 2026 17:44:53 +0100
Message-ID: <20260903164454.152372-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903164454.152372-1-ross.burton@arm.com>
References: <20260903164454.152372-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 16:45:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129743

Remove assignments to PYPI_PACKAGE where the value is the default value,
that is the recipe name with any python3- prefix removed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../thingsboard-gateway/thingsboard-gateway_3.8.4.bb            | 1 -
 meta-oe/recipes-devtools/sip/sip_6.16.1.bb                      | 1 -
 .../python3-looseversion/python3-looseversion_1.3.0.bb          | 2 --
 3 files changed, 4 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thin=
gsboard-gateway/thingsboard-gateway_3.8.4.bb b/meta-oe/dynamic-layers/met=
a-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8=
.4.bb
index 52a4518275..0ad3c8d431 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard=
-gateway/thingsboard-gateway_3.8.4.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard=
-gateway/thingsboard-gateway_3.8.4.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Apache=
-2.0;md5=3D89aea4e17d99a7ca
=20
 SRCREV =3D "a735a2d654a218c007b5db7759ceed44794253f9"
 PYPI_SRC_URI =3D "git://github.com/thingsboard/${BPN};protocol=3Dhttps;b=
ranch=3Dmaster;tag=3D${PV}"
-PYPI_PACKAGE =3D "thingsboard-gateway"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-oe/recipes-devtools/sip/sip_6.16.1.bb b/meta-oe/recipes=
-devtools/sip/sip_6.16.1.bb
index 2de9260821..a5034e6982 100644
--- a/meta-oe/recipes-devtools/sip/sip_6.16.1.bb
+++ b/meta-oe/recipes-devtools/sip/sip_6.16.1.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D236276327275=
fdb261636fb40b18d88d"
=20
 inherit pypi python_setuptools_build_meta python3native
=20
-PYPI_PACKAGE =3D "sip"
 SRC_URI[sha256sum] =3D "0a739c9cd2929de4e0884456d8caf3cfb22c10534757c779=
7bd8dc6bd9ed69bc"
=20
 DEPENDS +=3D "python3-setuptools-scm-native"
diff --git a/meta-oe/recipes-support/python3-looseversion/python3-looseve=
rsion_1.3.0.bb b/meta-oe/recipes-support/python3-looseversion/python3-loo=
seversion_1.3.0.bb
index 323ddb4157..35bd7d76ac 100644
--- a/meta-oe/recipes-support/python3-looseversion/python3-looseversion_1=
.3.0.bb
+++ b/meta-oe/recipes-support/python3-looseversion/python3-looseversion_1=
.3.0.bb
@@ -10,5 +10,3 @@ DEPENDS =3D "python3-hatchling-native"
 SRC_URI[sha256sum] =3D "ebde65f3f6bb9531a81016c6fef3eb95a61181adc47b7f94=
9e9c0ea47911669e"
=20
 inherit pypi python_hatchling
-
-PYPI_PACKAGE =3D "looseversion"
--=20
2.43.0


