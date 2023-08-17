Return-Path: <frieder.schrempf@kontron.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36847EB64DD
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 09:12:08 +0000 (UTC)
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
 by mx.groups.io with SMTP id smtpd.web10.183230.1692263524951181803
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Aug 2023 02:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@fris.de header.s=dkim header.b=ndiL7n+f;
 spf=pass (domain: fris.de, ip: 116.203.77.234, mailfrom: frieder@fris.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CDF3BC0361;
	Thu, 17 Aug 2023 11:12:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1692263521; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=CIYw+9L8wxK4VrQg7a7WbelX/objxcVbYwLRo20Os0w=;
	b=ndiL7n+f11eI0hebP7A4+Ii6YO3FL2SC0M9ZVJQKN9eNYfNVqgZ+NoX8cAO1awzpZg7YJt
	7gfAh//ZZJkzjYixq2XImZZSjS/jE+3QMvlxrQ0XlvteIzALN7ULDEIS4p9hBoO4rd+Fzq
	ci3O9ko6Jc68tXv0t0XPaLYLdRawLtbNiB1ebfA0eWy9In8w5JMM/Vn/rj10r2qbl2FWji
	fzkZ7rFAVYaLQzcIBryzYHEsYJjRum/vq2Oa/pGroM9gfEb6CFzzjxeUW15p4pWkNIRYUv
	UHJA4NkarNEclwGguBjka7GN3QbC4x+OuY7GE6g8XOl41Y219U2feTgPYld9Dw==
From: Frieder Schrempf <frieder@fris.de>
To: openembedded-devel@lists.openembedded.org
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: [meta-python][PATCH] python3-can: Add missing runtime dependencies
Date: Thu, 17 Aug 2023 11:11:49 +0200
Message-ID: <20230817091149.24140-1-frieder@fris.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 09:12:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104453

From: Frieder Schrempf <frieder.schrempf@kontron.de>

According to the setup.py of v4.2.2 [1] the following runtime
dependencies are currently missing. Add them.

* packaging
* setuptools

[1] https://github.com/hardbyte/python-can/blob/4.2.2/setup.py

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 meta-python/recipes-devtools/python/python3-can_4.2.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-can_4.2.2.bb b/m=
eta-python/recipes-devtools/python/python3-can_4.2.2.bb
index 7ecbf1207..f3cfd1724 100644
--- a/meta-python/recipes-devtools/python/python3-can_4.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-can_4.2.2.bb
@@ -20,7 +20,9 @@ RDEPENDS:${PN} +=3D " \
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


