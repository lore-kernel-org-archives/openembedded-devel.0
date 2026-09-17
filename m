Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD2DEC88E72
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 16:03:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43614.1789661024354171815
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Sep 2026 09:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=g4dWa/Wf;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E5821476
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 09:03:40 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 684A53F86F
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 09:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789661023; bh=R6832qBSpjtVuz/6ipg1JZt8fHMm1DBFG4Ehpc/R+ZM=;
	h=From:To:Subject:Date:From;
	b=g4dWa/WfveySDhyB+jfkNTsfkDNoEs22gG6E90Xqz9w2yxeEcNQY6+/DV7tfB4TeR
	 G3/vmG0te1bhawFG6WhxQ9sIFIsxsT+DeqMrWXad+jmeKM7iQyWziEGS+OBtTeuw3Q
	 chEOmk9+94DUnBk8cdqmzf/qWVkWB7G5nSj4ZzQ4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/4] lcms: put tools into lcms-bin
Date: Thu, 17 Sep 2026 17:03:39 +0100
Message-ID: <20260917160342.3130926-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 16:03:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130106

The tools are not required to use the library, so inherit lib_package to
put them into a separate package.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-support/lcms/lcms_2.19.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lcms/lcms_2.19.1.bb b/meta-oe/recipe=
s-support/lcms/lcms_2.19.1.bb
index 281dce01b94..ffa40ea9a43 100644
--- a/meta-oe/recipes-support/lcms/lcms_2.19.1.bb
+++ b/meta-oe/recipes-support/lcms/lcms_2.19.1.bb
@@ -14,7 +14,7 @@ BBCLASSEXTEND =3D "native nativesdk"
=20
 S =3D "${UNPACKDIR}/lcms2-${PV}"
=20
-inherit autotools sourceforge-releases ptest
+inherit autotools sourceforge-releases lib_package ptest
=20
 do_compile_ptest() {
     oe_runmake -C ${B}/testbed testcms
--=20
2.43.0


