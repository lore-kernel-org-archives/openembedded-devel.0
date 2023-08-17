Return-Path: <frieder.schrempf@kontron.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D9A5EB64DD
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 09:20:48 +0000 (UTC)
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
 by mx.groups.io with SMTP id smtpd.web11.183019.1692264039382210495
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Aug 2023 02:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@fris.de header.s=dkim header.b=tUtM+0Vz;
 spf=pass (domain: fris.de, ip: 116.203.77.234, mailfrom: frieder@fris.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 89029C0272;
	Thu, 17 Aug 2023 11:20:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1692264036; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=3EVl2bk+XWvCTK1N5A0A70kJ93i7XKGsAOQN/KgGGlg=;
	b=tUtM+0VzeFMRWJaJ63xkcCkAQNQU1bUwN1O5glyN1UtRwBnlGXIJKzXZCAGSG7R/dVV9Pb
	hpc/bkislXK0p2qTwOVtITVNusTNib9g6zD9s8CKT7beZm6OCj5gVPgPWcD4cjzbOVjaZM
	p1ysYmsll0EFSGtNqGAIS+Ltx050Xqu8xhWarpc4xRytEZdUvq9oMkl0jIZguMeK9lmZLc
	POjw7Byjp956EExzEYcD6rvrJHaw93wGwRdzRhEJonVPwfF31dIPyaWy9wtMn7kgytWp28
	p3sLoFzxhaGoEquqe6l9aTq82txW2zlen53z0jP1y5OwtH4/XchLG6AjDDGThg==
From: Frieder Schrempf <frieder@fris.de>
To: openembedded-devel@lists.openembedded.org
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: [meta-python][PATCH v2] python3-can: Update runtime dependencies
Date: Thu, 17 Aug 2023 11:20:34 +0200
Message-ID: <20230817092034.26410-1-frieder@fris.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 09:20:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104455

From: Frieder Schrempf <frieder.schrempf@kontron.de>

According to the setup.py of v4.2.2 [1] the following runtime
dependencies are currently missing. Add them.

* packaging
* setuptools

Also the aenum dependency was droppen in v4.0.0 [2], so let's
remove it.

[1] https://github.com/hardbyte/python-can/blob/4.2.2/setup.py
[2] https://github.com/hardbyte/python-can/commit/13625ea2cc18e3283b8111b=
ec7e139ed9b6c7f48

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Changes in v2:
* Drop unused aenum dependency
* Update subject and commit message
---
 meta-python/recipes-devtools/python/python3-can_4.2.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-can_4.2.2.bb b/m=
eta-python/recipes-devtools/python/python3-can_4.2.2.bb
index 7ecbf1207..32b5ad101 100644
--- a/meta-python/recipes-devtools/python/python3-can_4.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-can_4.2.2.bb
@@ -10,7 +10,6 @@ PYPI_PACKAGE=3D"python-can"
 inherit pypi setuptools3
=20
 RDEPENDS:${PN} +=3D " \
-    python3-aenum \
     python3-asyncio \
     python3-codecs \
     python3-compression \
@@ -20,7 +19,9 @@ RDEPENDS:${PN} +=3D " \
     python3-logging \
     python3-misc \
     python3-netserver \
+    python3-packaging \
     python3-pkg-resources \
+    python3-setuptools \
     python3-sqlite3 \
     python3-typing-extensions \
     python3-wrapt \
--=20
2.41.0


