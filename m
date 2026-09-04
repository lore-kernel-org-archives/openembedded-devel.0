Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B62DC79F82
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 15:53:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1525.1788537179363280509
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2026 08:52:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=WOztc3nQ;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 346A91595
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Sep 2026 08:52:55 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7DD6E3F7D8
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Sep 2026 08:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788537178; bh=zrsrTe8Cqv5dbj8/MosbPYeZML6q6MHCouXvQ7pSwvQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WOztc3nQoeNmEyql+AXlwsWgKReq/HQl1TgqZR5PkPKLcrl82hUoMNPaIu+eUzMNp
	 yzb6tPyvRRngacsBmJ6RWhSX8FGa6+6niPS0/xvRdbVRxpa+xmFIRZjAJIXZ8WKz+l
	 h2f/ZKkAyLpOywuI5pf79xIIuXkuYZOZ1j7gSj0I=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/5] python3-astroid: remove obsolete DEPENDS
Date: Fri,  4 Sep 2026 16:52:48 +0100
Message-ID: <20260904155251.1373817-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904155251.1373817-1-ross.burton@arm.com>
References: <20260904155251.1373817-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Sep 2026 15:53:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129769

These dependencies are no longer needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-astroid_4.3.1.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_4.3.1.bb=
 b/meta-python/recipes-devtools/python/python3-astroid_4.3.1.bb
index 2ad1135b50..f0a74e79b1 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_4.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_4.3.1.bb
@@ -8,11 +8,6 @@ SRC_URI[sha256sum] =3D "bb359253d8ced6635a3881c17ebcbbc0=
e0b65ca23b555a9bd03c92a3cb
=20
 inherit pypi python_setuptools_build_meta
=20
-DEPENDS +=3D "\
-    python3-pytest-runner-native \
-    python3-wheel-native \
-"
-
 PACKAGES =3D+ "${PN}-tests"
=20
 FILES:${PN}-tests +=3D " \
--=20
2.43.0


