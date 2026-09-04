Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5972C79F87
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 11:22:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11561.1788520953415716866
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2026 04:22:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=G4MlT0UO;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FE01153B
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Sep 2026 04:22:29 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 919F83F7D8
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Sep 2026 04:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788520952; bh=LqZrQu8uoBRXf5WdX29lPw1yuQBYhYN9KJoH/Cmq+sw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=G4MlT0UOOMIb8CmzHYPKr1J299EHySig69CzNI9zUuPnhPtf6Lu9aW5nQEm2+hT9f
	 XKzlm5P2R6EHDA46Hs90rlmwKzoHV6v2eMgswSpnGBDNtjNQ8ul7g1CEDvV3JYNpxF
	 lG3Z8YzDFyu3EnmBXLRtNWOa695LFPGK71rt5Egk=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 5/9] thingsboard-gateway: remove pypi inherit
Date: Fri,  4 Sep 2026 12:22:18 +0100
Message-ID: <20260904112222.114451-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904112222.114451-1-ross.burton@arm.com>
References: <20260904112222.114451-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Sep 2026 11:22:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129759

This recipe doesn't fetch from pypi as upstream has stopped uploading
source distributions[1], so there's no need to inherit the pypi class.

[1] https://github.com/thingsboard/thingsboard-gateway/issues/2174

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../thingsboard-gateway/thingsboard-gateway_3.8.4.bb          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thin=
gsboard-gateway/thingsboard-gateway_3.8.4.bb b/meta-oe/dynamic-layers/met=
a-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8=
.4.bb
index 0ad3c8d4315..daa6b29a57e 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard=
-gateway/thingsboard-gateway_3.8.4.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard=
-gateway/thingsboard-gateway_3.8.4.bb
@@ -7,10 +7,10 @@ HOMEPAGE =3D "https://thingsboard.io/"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89ae=
a4e17d99a7cacdbeed46a0096b10"
=20
+SRC_URI =3D "git://github.com/thingsboard/${BPN};protocol=3Dhttps;branch=
=3Dmaster;tag=3D${PV}"
 SRCREV =3D "a735a2d654a218c007b5db7759ceed44794253f9"
-PYPI_SRC_URI =3D "git://github.com/thingsboard/${BPN};protocol=3Dhttps;b=
ranch=3Dmaster;tag=3D${PV}"
=20
-inherit pypi setuptools3
+inherit setuptools3
=20
 RDEPENDS:${PN} +=3D " python3-jsonpath-rw \
                     python3-regex \
--=20
2.43.0


