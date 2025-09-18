Return-Path: <ambroise.vincent@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD9FECA1013
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 15:53:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.18567.1758210805837672797
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 08:53:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ambroise.vincent@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE3D2176C;
	Thu, 18 Sep 2025 08:53:16 -0700 (PDT)
Received: from e121007.cambridge.arm.com (e121007.cambridge.arm.com [10.1.198.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F0D73F673;
	Thu, 18 Sep 2025 08:53:24 -0700 (PDT)
From: Ambroise Vincent <ambroise.vincent@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [meta-python][PATCH] python3-pandas: Add native target to the build
Date: Thu, 18 Sep 2025 16:52:30 +0100
Message-Id: <20250918155230.1658228-1-ambroise.vincent@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 15:53:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119578

Add the native target to the recipe.

Signed-off-by: Ambroise Vincent <ambroise.vincent@arm.com>
---
 meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb =
b/meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb
index d32f0e17bb..f1df026c5c 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb
@@ -46,3 +46,5 @@ do_install:prepend() {
 }
=20
 EXTRA_OEMESON:append:class-target =3D " -Dnumpy_inc_dir=3D${RECIPE_SYSRO=
OT}${PYTHON_SITEPACKAGES_DIR}/numpy/_core/include "
+
+BBCLASSEXTEND =3D "native"
--=20
2.34.1


