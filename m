Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA136C4321E
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 16:35:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.50671.1643733312855691688
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Feb 2022 08:35:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50C9011FB
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Feb 2022 08:35:12 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0CD63F40C
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Feb 2022 08:35:11 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 06/14] spice: set correct LICENSE
Date: Tue,  1 Feb 2022 16:34:59 +0000
Message-Id: <20220201163507.1320861-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201163507.1320861-1-ross.burton@arm.com>
References: <20220201163507.1320861-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Feb 2022 16:35:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95191

Remove BSD, as this package is entirely LGPL2+.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-networking/recipes-support/spice/spice_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-ne=
tworking/recipes-support/spice/spice_git.bb
index 9c6baccc7c..c9f95b0125 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -10,7 +10,7 @@ environment - not only on its computer-server machine, =
but also from \
 anywhere on the Internet and using a wide variety of machine \
 architectures."
=20
-LICENSE =3D "BSD & LGPLv2.1+"
+LICENSE =3D "LGPLv2.1+"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
=20
 PV =3D "0.14.2+git${SRCPV}"
--=20
2.25.1


