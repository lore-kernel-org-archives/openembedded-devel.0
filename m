Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA43BC7EE29
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 12:18:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20696.1684844315072396898
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 May 2023 05:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7BC7150C;
	Tue, 23 May 2023 05:19:19 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3C2A13F6C4;
	Tue, 23 May 2023 05:18:34 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/3] hplip: remove redundant FILES:${PN}-dbg
Date: Tue, 23 May 2023 13:18:30 +0100
Message-Id: <20230523121831.1877208-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230523121831.1877208-1-ross.burton@arm.com>
References: <20230523121831.1877208-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 12:18:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102733

From: Ross Burton <ross.burton@arm.com>

These files will be automatically packaged so there's no need to package
them manually.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-extended/hplip/hplip_3.22.10.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb b/meta-oe/re=
cipes-extended/hplip/hplip_3.22.10.bb
index 3ccfa7d662..ed9f28e073 100644
--- a/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
+++ b/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
@@ -74,12 +74,6 @@ RDEPENDS:${PN} +=3D " \
 "
 RDEPENDS:${PN}-filter +=3D "perl ghostscript"
=20
-# need to snag the debug file or OE will fail on backend package
-FILES:${PN}-dbg +=3D "\
-        ${libexecdir}/cups/backend/.debug \
-        ${PYTHON_SITEPACKAGES_DIR}/.debug \
-        ${libexecdir}/cups/filter/.debug "
-
 FILES:${PN} +=3D "${datadir}/ipp-usb/quirks/HPLIP.conf"
 FILES:${PN}-dev +=3D "${PYTHON_SITEPACKAGES_DIR}/*.la"
 FILES:${PN}-ppd =3D "${datadir}/ppd"
--=20
2.34.1


