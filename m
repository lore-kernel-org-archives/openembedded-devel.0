Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB2A6C3ABC9
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 18:22:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.83316.1747160531330180416
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 May 2025 11:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: luca.fancellu@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6D30150C
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 May 2025 11:21:59 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D5023F673
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 May 2025 11:22:10 -0700 (PDT)
From: Luca Fancellu <luca.fancellu@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [master][walnascar][meta-python][PATCH] python3-rich: Add native and nativesdk target to the build
Date: Tue, 13 May 2025 19:22:01 +0100
Message-Id: <20250513182201.4114176-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 May 2025 18:22:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117400

Add the native and nativesdk target to the recipe.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 meta-python/recipes-extended/python-rich/python3-rich_14.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-extended/python-rich/python3-rich_14.0.0=
.bb b/meta-python/recipes-extended/python-rich/python3-rich_14.0.0.bb
index 95c0fd8a7546..8a4d6b843e7a 100644
--- a/meta-python/recipes-extended/python-rich/python3-rich_14.0.0.bb
+++ b/meta-python/recipes-extended/python-rich/python3-rich_14.0.0.bb
@@ -17,3 +17,5 @@ RDEPENDS:${PN} =3D "python3-html \
                   python3-pygments \
                   python3-unixadmin \
                   "
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


