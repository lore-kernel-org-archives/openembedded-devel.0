Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09BB3C5B569
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 12:21:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28240.1786364495294301811
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 05:21:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=atREd6/G;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B71EE14BF
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:30 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4E7F73F86F
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786364494; bh=yaJnsCuV5mHzmEWES2QFXOfj8CHxrN00jBspJQXAwMg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=atREd6/GN8WbRcc2p1mdiIb/ePL4+kv84HIZAlkffQheBQuTwNziRVgwNEeFzy6ee
	 3qRmUAJ8IMmAg28+BRX96ZB2VKdKUwpSDW0WdErlnJT78R075HayjRPRCvqqi6yRCY
	 tH50ma4dtvbCiFZ+vBODvmM4LCKh1FP1tgJue87k=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 04/24] python3-bandit: clean up dependencies
Date: Mon, 10 Aug 2026 13:21:10 +0100
Message-ID: <20260810122130.633299-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810122130.633299-1-ross.burton@arm.com>
References: <20260810122130.633299-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 12:21:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128884

Python runtime dependencies do not need to be listed in DEPENDS.

pbr and six were removed as runtime dependencies in 1.7.6.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-bandit_1.9.4.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-bandit_1.9.4.bb =
b/meta-python/recipes-devtools/python/python3-bandit_1.9.4.bb
index d8e6f9da87..2c815bd1e9 100644
--- a/meta-python/recipes-devtools/python/python3-bandit_1.9.4.bb
+++ b/meta-python/recipes-devtools/python/python3-bandit_1.9.4.bb
@@ -4,16 +4,14 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D34400b68072d=
710fecd0a2940a0d1658"
=20
 SRC_URI[sha256sum] =3D "b589e5de2afe70bd4d53fa0c1da6199f4085af666fde00e8=
a034f152a52cd628"
=20
-DEPENDS =3D "python3-pbr-native python3-git python3-pbr python3-pyyaml p=
ython3-six python3-stevedore"
+DEPENDS =3D "python3-pbr-native"
=20
 inherit setuptools3 pypi
=20
 RDEPENDS:${PN} +=3D "\
         python3-git \
         python3-modules \
-        python3-pbr \
         python3-pyyaml \
         python3-rich \
-        python3-six \
         python3-stevedore \
         "
--=20
2.43.0


