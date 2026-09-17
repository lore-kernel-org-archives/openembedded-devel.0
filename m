Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7601CC982D6
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 15:37:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42666.1789659452402728325
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Sep 2026 08:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=UJPy0EOF;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A3101476
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 08:37:28 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5E1253F7B4
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 08:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789659451; bh=/Avzcwy+UlUGUzuf+YzS8Z+V8brdRHmyaeqewkKP4+0=;
	h=From:To:Subject:Date:From;
	b=UJPy0EOFBAtZFJQWjsXkuvn896tQyXNMnsHpW0K1V5mNMCUXfiOF9MFV2M+wns0k/
	 jBn0kCTlQ1VvN3GQEND2NIebNqEW8WBHNoXGoJQZn6BXvH8NOv1aTtMyv2AdvTuoNC
	 lS2W5yWexwNUZ4tUFZg867JSRddyMJkFrYyPrIY4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 1/8] dool: remove python3-six dependency
Date: Thu, 17 Sep 2026 16:37:18 +0100
Message-ID: <20260917153727.3057505-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 15:37:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130098

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


