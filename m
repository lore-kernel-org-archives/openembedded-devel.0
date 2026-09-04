Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB59C79F87
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 15:53:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1511.1788537180879184966
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2026 08:53:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=rW8e/5Py;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2C0D152B
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Sep 2026 08:52:56 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 075553F7D8
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Sep 2026 08:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788537180; bh=8nxCuyNxsl6rCEnVS+xavokSAf8di1anIhq8QiGtA9c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rW8e/5PyaWt+psby/6SQASQA3kEdVq/din0AYBIA1qi7HVFEZrlHJF0Ylc8OSlQhv
	 Sd20vJtknxqQM35ZVuf207xxamw4e2SD5Iy2Uptg6IN2FCH3zZUH1a0hoPiLuncmOS
	 qwCoKtWhP9kjwbDuYbgTEf49QksBoQU4xLS4jAjk=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/5] python3-ordered-set: remove obsolete DEPENDS
Date: Fri,  4 Sep 2026 16:52:50 +0100
Message-ID: <20260904155251.1373817-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904155251.1373817-1-ross.burton@arm.com>
References: <20260904155251.1373817-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Sep 2026 15:53:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129771

These dependencies are no longer needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-ordered-set_4.1.0.bb       | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-ordered-set_4.1.=
0.bb b/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
index 1644dc62d5..6dbc9d6538 100644
--- a/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
@@ -8,6 +8,3 @@ SRC_URI[sha256sum] =3D "694a8e44c87657c59292ede72891eb91d=
34131f6531463aab3009191c7
 inherit pypi python_flit_core ptest-python-pytest
=20
 PTEST_PYTEST_DIR =3D "test"
-
-DEPENDS +=3D "python3-pytest-runner-native"
-
--=20
2.43.0


