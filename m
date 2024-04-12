Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A56D6C00A94
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 10:59:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.44091.1712919539865843010
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Apr 2024 03:58:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C39D7339
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Apr 2024 03:59:28 -0700 (PDT)
Received: from e133390.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 113CD3F766
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Apr 2024 03:58:58 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/2] python3-decorator: Add BBCLASSEXTEND for native and nativesdk
Date: Fri, 12 Apr 2024 11:58:49 +0100
Message-Id: <20240412105849.286999-2-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240412105849.286999-1-peter.hoyes@arm.com>
References: <20240412105849.286999-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Apr 2024 10:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109939

Signed-off-by: Peter Hoyes <peter.hoyes@arm.com>
---
 meta-python/recipes-devtools/python/python3-decorator_5.1.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-decorator_5.1.1.=
bb b/meta-python/recipes-devtools/python/python3-decorator_5.1.1.bb
index 6d5cafb1d..f33037624 100644
--- a/meta-python/recipes-devtools/python/python3-decorator_5.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-decorator_5.1.1.bb
@@ -16,3 +16,5 @@ inherit pypi setuptools3
 RDEPENDS:${PN} +=3D "\
     python3-stringold \
     "
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


