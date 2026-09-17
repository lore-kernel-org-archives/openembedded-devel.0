Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC2BBC982D7
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 16:03:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43348.1789661025442212486
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Sep 2026 09:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=K1LQ+2uM;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FCC61AED
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 09:03:41 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A4AFF3F86F
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 09:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789661025; bh=F/WPF1Qh1QrQRz0TtECdIwJPk3SVorXMSn3Wu6YRc7Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=K1LQ+2uMtCHRu0On31ENNlsAyb6ruTUPpPlo+v22Sxdg06R6mx4WNgy04yAVzlpHA
	 dPxgRmAUPS322IIM/g//xl71yR9crjlL6jnXq3XnYRsT7wNH1vSl7AI3myDL/endi7
	 CHcp3C1CK3SSCIcPW8He3Yr/VUHpOre22nm3hBb4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/4] lcms: remove bash RDEPENDS
Date: Thu, 17 Sep 2026 17:03:41 +0100
Message-ID: <20260917160342.3130926-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917160342.3130926-1-ross.burton@arm.com>
References: <20260917160342.3130926-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 16:03:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130108

The ptest package contains a #!/bin/sh script, so there is no need to
depend on bash.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-support/lcms/lcms_2.19.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/lcms/lcms_2.19.1.bb b/meta-oe/recipe=
s-support/lcms/lcms_2.19.1.bb
index cc68cccbba9..a704e1be7e6 100644
--- a/meta-oe/recipes-support/lcms/lcms_2.19.1.bb
+++ b/meta-oe/recipes-support/lcms/lcms_2.19.1.bb
@@ -28,6 +28,4 @@ do_install_ptest() {
     install -m 0644 ${S}/testbed/*.icc ${D}${PTEST_PATH}/
 }
=20
-RDEPENDS:${PN}-ptest +=3D "bash"
-
 CVE_PRODUCT +=3D "littlecms:little_cms_color_engine"
--=20
2.43.0


