Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 391FAC4332F
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 16:11:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.3629.1637251903929438920
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E637B11D4
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:47 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FC353F766
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:47 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 11/19] pcsc-lite: set precise BSD license
Date: Thu, 18 Nov 2021 16:11:30 +0000
Message-Id: <20211118161138.663375-11-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211118161138.663375-1-ross.burton@arm.com>
References: <20211118161138.663375-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 16:11:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94036

"BSD" is ambiguous, use the precise license BSD-3-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.0.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.0.bb b/meta-=
oe/recipes-support/pcsc-lite/pcsc-lite_1.9.0.bb
index 93b18ba1d5..d90dd43042 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.0.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.0.bb
@@ -1,11 +1,11 @@
 SUMMARY =3D "PC/SC Lite smart card framework and applications"
 HOMEPAGE =3D "http://pcsclite.alioth.debian.org/"
-LICENSE =3D "BSD & GPLv3+"
-LICENSE:${PN} =3D "BSD"
-LICENSE:${PN}-lib =3D "BSD"
-LICENSE:${PN}-doc =3D "BSD"
-LICENSE:${PN}-dev =3D "BSD"
-LICENSE:${PN}-dbg =3D "BSD & GPLv3+"
+LICENSE =3D "BSD-3-Clause & GPLv3+"
+LICENSE:${PN} =3D "BSD-3-Clause"
+LICENSE:${PN}-lib =3D "BSD-3-Clause"
+LICENSE:${PN}-doc =3D "BSD-3-Clause"
+LICENSE:${PN}-dev =3D "BSD-3-Clause"
+LICENSE:${PN}-dbg =3D "BSD-3-Clause & GPLv3+"
 LICENSE:${PN}-spy =3D "GPLv3+"
 LICENSE:${PN}-spy-dev =3D "GPLv3+"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D628c01ba985ecfa21677f5ee2d520=
2f6"
--=20
2.25.1


