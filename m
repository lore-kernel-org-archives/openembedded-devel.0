Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A47C5B56C
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 12:21:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28246.1786364502419569759
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 05:21:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ZRikLb3/;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 121DB14BF
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:38 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 999E63FA7A
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786364502; bh=J6yZrOtz5eCT0ihRNa7EBKLbzfN93pD6E8CqV6Irikc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZRikLb3/z8lapQ7+OfI/07unpvKEm5VsRyPSVjNgHDCd3wKBvCKK5TNMR1CNJP5Sm
	 e+0PFVfYoGJpEgYReGg03CciblZ3RydaaWSF4Mt50MZZ4yAvcF/JbcA6icBPcYRh9n
	 sCq8ZTBRfgqQW/Eo76jo/CxwhQf+WalIWSEzeryo=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 14/24] python3-cachecontrol: use correct build backend
Date: Mon, 10 Aug 2026 13:21:20 +0100
Message-ID: <20260810122130.633299-14-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810122130.633299-1-ross.burton@arm.com>
References: <20260810122130.633299-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 12:21:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128894

This package uses flit now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-cachecontrol_0.14.3.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-cachecontrol_0.1=
4.3.bb b/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.3.=
bb
index d617de8ce3..b32b6fe34b 100644
--- a/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D6572692148=
079ebbbd800be4b9f36c6d"
=20
 SRC_URI[sha256sum] =3D "73e7efec4b06b20d9267b441c1f733664f989fb8688391b6=
70ca812d70795d11"
=20
-inherit pypi python_poetry_core
+inherit pypi python_flit_core
=20
 RDEPENDS:${PN} +=3D "\
     python3-crypt \
--=20
2.43.0


