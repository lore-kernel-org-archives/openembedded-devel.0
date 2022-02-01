Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A70C6C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 19:38:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.53796.1643744297202030051
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Feb 2022 11:38:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6712511B3
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Feb 2022 11:38:16 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0ED4C3F40C
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Feb 2022 11:38:15 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] fping: set precise license
Date: Tue,  1 Feb 2022 19:38:14 +0000
Message-Id: <20220201193814.2927809-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Feb 2022 19:38:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95204

fping is under a non-standard license: it's almost BSD-3-Clause but is
phrased differently.  As interpretation of the licenses isn't something
we want to do, we can use the exact license text instead of referring to
the 3-clause BSD text.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-networking/recipes-support/fping/fping_5.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/fping/fping_5.0.bb b/meta-ne=
tworking/recipes-support/fping/fping_5.0.bb
index 54606e8b64..541e705c85 100644
--- a/meta-networking/recipes-support/fping/fping_5.0.bb
+++ b/meta-networking/recipes-support/fping/fping_5.0.bb
@@ -8,7 +8,9 @@ replies, fping will send out a ping packet and move on to=
 the next target \
 in a round-robin fashion."
 HOMEPAGE =3D "http://www.fping.org/"
 SECTION =3D "net"
-LICENSE =3D "BSD"
+
+LICENSE =3D "fping"
+NO_GENERIC_LICENSE[fping] =3D "COPYING"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc6170fbadddfcd74f011515291d96=
901"
=20
 SRC_URI =3D "http://www.fping.org/dist/fping-${PV}.tar.gz"
--=20
2.25.1


