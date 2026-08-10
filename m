Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A30C5B570
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 12:21:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28554.1786364499480561091
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 05:21:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=B7mEzAho;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 201BE14BF
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:35 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A83243F86F
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786364499; bh=ko9pp9HPVJ9eyzUjj63ANDfsiuJ0J8CfuqYBuoNxjZQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=B7mEzAhoMFGT0//XspC5Go2roaevg8P1vMCpffmI7SV+QHb6wrmcUP11m07YG+ZIH
	 H90T/kH7neI1vMYFzb2GSOrPB73+/nr5dI7T0Fos1Z8QQYEp0JmuK5f6kDKEG93liQ
	 qalJHEbONbkuYpShlkAKT93NdcGCiKtxxTisICBk=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 10/24] python3-autobahn: use correct build backend
Date: Mon, 10 Aug 2026 13:21:16 +0100
Message-ID: <20260810122130.633299-10-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810122130.633299-1-ross.burton@arm.com>
References: <20260810122130.633299-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 12:21:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128890

This package uses hatchling now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-autobahn_26.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_26.7.1.=
bb b/meta-python/recipes-devtools/python/python3-autobahn_26.7.1.bb
index 7829a0e149..2274abcff2 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_26.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_26.7.1.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] =3D "c6949a2c6eb95fb1c218837dbda0a59ab=
bbebafb8b11098551c01a7061
=20
 CVE_PRODUCT =3D "autobahn"
=20
-inherit pypi python_hatchling python_setuptools_build_meta
+inherit pypi python_hatchling
=20
 DEPENDS +=3D " \
     python3-cffi-native \
--=20
2.43.0


