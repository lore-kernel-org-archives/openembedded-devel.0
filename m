Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE7BC88E7F
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 10:01:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11304.1789552861785964577
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Sep 2026 03:01:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=CO7YON+I;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C720152B
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Sep 2026 03:00:57 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9C2703F86F
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Sep 2026 03:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789552861; bh=/Avzcwy+UlUGUzuf+YzS8Z+V8brdRHmyaeqewkKP4+0=;
	h=From:To:Subject:Date:From;
	b=CO7YON+IEydjffy+56FgpS+T0F1VLOSxjZrINiMWb5EH+DvXTROE9NHFaMIzIXdV+
	 xqCeupvjAIna9kBGrx4WuTjb7FSwdjcG0lHJb3tgamirUNB5adnn9Ko826pkehw4Xs
	 VpI0EH+bDi+tR3LMFBWtHvyWcjHxPkogNa2CM8CU=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/5] dool: remove python3-six dependency
Date: Wed, 16 Sep 2026 11:00:51 +0100
Message-ID: <20260916100056.1512426-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Sep 2026 10:01:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130080

This was removed in dool 0.9.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-support/dool/dool_1.3.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/dool/dool_1.3.8.bb b/meta-oe/recipes=
-support/dool/dool_1.3.8.bb
index 1c7350e871d..8a057effdf3 100644
--- a/meta-oe/recipes-support/dool/dool_1.3.8.bb
+++ b/meta-oe/recipes-support/dool/dool_1.3.8.bb
@@ -7,7 +7,7 @@ LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1ebbd3e34237af26da5dc08a4e440=
464"
=20
 DEPENDS +=3D "asciidoc-native xmlto-native"
-RDEPENDS:${PN} +=3D "python3-core python3-misc python3-resource python3-=
shell python3-six python3-unixadmin"
+RDEPENDS:${PN} +=3D "python3-core python3-misc python3-resource python3-=
shell python3-unixadmin"
=20
 SRC_URI =3D "git://github.com/scottchiefbaker/dool.git;branch=3Dnext;pro=
tocol=3Dhttps;tag=3Dv${PV}"
=20
--=20
2.43.0


