Return-Path: <clemens.terasa@garz-fricke.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73812C4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 16:58:55 +0000 (UTC)
Received: from mx2.garz-fricke.com (mx2.garz-fricke.com [213.23.127.198])
 by mx.groups.io with SMTP id smtpd.web11.312.1646845131761690009
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Mar 2022 08:58:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garz-fricke.com header.s=dkim-key-2022r
 header.b=AELLfl+p;
 spf=pass (domain: garz-fricke.com, ip: 213.23.127.198,
 mailfrom: clemens.terasa@garz-fricke.com)
DKIM-Signature: v=1; c=relaxed/relaxed; d=garz-fricke.com; s=dkim-key-2022e;
 t=1646845128; bh=liV1Fgcu25v5OBAmVri8JPtQYX0HZSD4rRgdBN3PfiI=; h=
 "Subject:Subject:From:From:Date:Date:ReplyTo:ReplyTo:Cc:Cc:Message-Id:Message-Id";
 a=ed25519-sha256; b=
 6ngBWdr6XZR4ocCjoYM+AVZxy/sybtjrufRbpb/wF6eYko+dDC08QysIcEoTOcK9JJvAEBlP9AT/49I0+ZdNCA==
DKIM-Signature: v=1; c=relaxed/relaxed; d=garz-fricke.com; s=dkim-key-2022r;
 t=1646845128; bh=liV1Fgcu25v5OBAmVri8JPtQYX0HZSD4rRgdBN3PfiI=; h=
 "Subject:Subject:From:From:Date:Date:ReplyTo:ReplyTo:Cc:Cc:Message-Id:Message-Id";
 a=rsa-sha256; b=
 AELLfl+pqSlltq99nvourJJ0cBfUhqL+HgffN+NjXl00dNl7sCRdksLDL1G6HWu1LLbyWfuvpN5Lf+2vfWDcOsR/2p9EJmO1tVWFeX9qcaLsRkiG4HPO7VZdmu4Qi5zoCO5dc3WfXH9LpguHQMrUP4+xe+MyCrPS1dmPXpz7RjirVQZ517u8FvXINQS7Hm8xbA2nzY2Q6An0ERwqEMQV9G+vC0xT/wWBEbyZ+9FSLYWz6GWjXqOoodIPwCuvzwHHAzUIHSituoUa+e4kuwjXoTICQhWtRLa5+UYkOjqilxPvB7Y80X/4C5yEmArBLPC0/OJyqjjOORjKdF0bwPIXtQ==
From: Clemens Terasa <clemens.terasa@garz-fricke.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Clemens Terasa <clemens.terasa@garz-fricke.com>
Subject: [meta-python][dunfell][PATCH] python3-fasteners: Revert new override
 syntax
Date: Wed, 9 Mar 2022 17:58:40 +0100
Message-ID: <20220309165840.267657-1-clemens.terasa@garz-fricke.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SRV99.hamburg.garz-fricke.de (2a00:3:e0c:32e::99) To
 srv99.hamburg.garz-fricke.de (2a00:3:e0c:32e::99)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Mar 2022 16:58:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95908

Commit 7889158dcd187546fc5e99fd81d0779cad3e8d17 introduces a regression,
breaking a dunfell build. It adds a variable override of RDEPENDS with
the new colon based syntax, that was introduced with honister but is
incompatible with dunfell.

Fix this by using the plain old underscore syntax.

Signed-off-by: Clemens Terasa <clemens.terasa@garz-fricke.com>
---
 meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb b/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
index 1ba2c6f20..7ebaa4590 100644
--- a/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
+++ b/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "b1ab4e5adfbc28681ce44b3024421c4f567e705cc3963c732bf1cba334
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} += "\
+RDEPENDS_${PN} += "\
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-fcntl \
 "
-- 
2.25.1

