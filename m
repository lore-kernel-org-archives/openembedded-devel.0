Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A197AD609D3
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 11:04:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.69391.1732705441696989530
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Nov 2024 03:04:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A185A150C
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 03:04:30 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 401C03F58B
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 03:04:00 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] xorgxrdp: use the new xserver-abi.inc to generate Xserver ABI dependencies
Date: Wed, 27 Nov 2024 11:03:55 +0000
Message-Id: <20241127110355.2459679-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 11:04:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114086

Use the new function to generate the missing dependencies, and thus we
can remove the INSANE_SKIP.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb b/meta-=
oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb
index 9650d43695..cad5c07099 100644
--- a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb
+++ b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb
@@ -20,4 +20,10 @@ S =3D "${WORKDIR}/git"
=20
 FILES:${PN} +=3D "${libdir}/xorg/modules/*"
=20
-INSANE_SKIP:${PN} +=3D "xorg-driver-abi"
+require recipes-graphics/xorg-xserver/xserver-abi.inc
+
+python add_xorg_abi_depends() {
+    _add_xorg_abi_depends(d, "xinput")
+    _add_xorg_abi_depends(d, "videodrv")
+}
+PACKAGEFUNCS =3D+ "add_xorg_abi_depends"
--=20
2.34.1


