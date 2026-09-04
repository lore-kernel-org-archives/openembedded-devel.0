Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2839C79F85
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 11:22:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11560.1788520952242083694
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2026 04:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=LDKoYijZ;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CCA81570
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Sep 2026 04:22:28 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E7D5B3F7D8
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Sep 2026 04:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788520952; bh=y44Qr5ouBOvD2/xRDN9CRLSVujn/hexXH3NbZUHlDV8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LDKoYijZ1bT2F0LLlX/q4e5+0++hByz9MS+vTUcicdBt9KbKMWnYjcN4EedVSwRlN
	 soPyjjLarTrHgj7clsTaWxChuGQU73SnwbYJBudm98Wz/eFfx6OssefEk1uTJfjekk
	 IX/MvC8Gb59PWROLog6LZ5J6R7/KI7zhbez3LYZE=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 4/9] python3-websocket-client: use right PEP517 build class
Date: Fri,  4 Sep 2026 12:22:17 +0100
Message-ID: <20260904112222.114451-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904112222.114451-1-ross.burton@arm.com>
References: <20260904112222.114451-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Sep 2026 11:22:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129758

This package has a pyproject.toml so use the correct build class.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-websocket-client_1.9.2.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-websocket-client=
_1.9.2.bb b/meta-python/recipes-devtools/python/python3-websocket-client_=
1.9.2.bb
index 3be6e09069b..4bcdb8debaf 100644
--- a/meta-python/recipes-devtools/python/python3-websocket-client_1.9.2.=
bb
+++ b/meta-python/recipes-devtools/python/python3-websocket-client_1.9.2.=
bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] =3D "0fcb57545848be86992e128218fd96d=
d87a6769ffdb1a968dff79632b8
=20
 PYPI_PACKAGE =3D "websocket_client"
=20
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
=20
 RDEPENDS:${PN} =3D "\
     python3-six \
--=20
2.43.0


