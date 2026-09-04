Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59508C624D3
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 11:22:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11624.1788520951637860161
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2026 04:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=qd179vZ7;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5171F1570
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Sep 2026 04:22:27 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B28C13F7D8
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Sep 2026 04:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788520951; bh=RgNrmzLFY5eKj5iOCxepltkGierGA+LXoOXe68EM1s4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qd179vZ7hnK4keuNzfv/7CJd401U5Vg+Mf/HiEa+mPpj6u+lASezCs4eMpPw/cBjT
	 DssLIK7shchAkb+QdO9/rP9BVC4sM8RXOS+hkWzALxkZZcm2w1eFzjjwbkFMjshgcq
	 njyGdFuovFWxyF3eZdpsN2RQToX3m3VUJ5Lblt3k=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 2/9] meta-oe: remove redundant PYPI_PACKAGE assignments
Date: Fri,  4 Sep 2026 12:22:15 +0100
Message-ID: <20260904112222.114451-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904112222.114451-1-ross.burton@arm.com>
References: <20260904112222.114451-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Sep 2026 11:22:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129756

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
index 52a4518275b..0ad3c8d4315 100644
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
index 2de92608217..a5034e69821 100644
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
index 323ddb41571..35bd7d76ac6 100644
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


