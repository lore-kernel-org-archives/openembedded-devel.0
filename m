Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C21E2C54EBE
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 17:07:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.93601.1673629639752963612
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Jan 2023 09:07:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80D68FEC;
	Fri, 13 Jan 2023 09:08:01 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE9263F67D;
	Fri, 13 Jan 2023 09:07:18 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v2] python3-pytest-forked: update for move from picobuild to build
Date: Fri, 13 Jan 2023 17:07:14 +0000
Message-Id: <20230113170714.1314902-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Jan 2023 17:07:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100566

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-pytest-forked_1.4.0.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-forked_1.=
4.0.bb b/meta-python/recipes-devtools/python/python3-pytest-forked_1.4.0.=
bb
index 34dd9c407e..2e6a32a248 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-forked_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-forked_1.4.0.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] =3D "8b67587c8f98cbbadfdd804539ed5455b=
6ed03802203485dd2f53c1422
=20
 inherit pypi python_setuptools_build_meta
=20
-PEP517_PICOBUILD_OPTS =3D "--loose-depends"
+PEP517_BUILD_OPTS =3D "--skip-dependency-check"
=20
 DEPENDS +=3D "python3-setuptools-scm-native"
=20
--=20
2.34.1


