Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web12.32646.1605522687537023278
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2020 02:31:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: kory.maincent@bootlin.com)
X-Originating-IP: 163.172.53.213
Received: from build.dedibox.fr (build.bootlin.com [163.172.53.213])
	(Authenticated sender: kory.maincent@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 6F5BAC0010
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2020 10:31:24 +0000 (UTC)
From: "Kory Maincent" <kory.maincent@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-mono][PATCH] mono: fix build dependencies
Date: Mon, 16 Nov 2020 11:31:24 +0100
Message-Id: <20201116103124.4024903-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add libatomic-ops to dependencies to avoid this error:
/include/private/gc_atomic_ops.h:105:11: fatal error: atomic_ops.h: No such file or directory

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 recipes-mono/mono/mono-6.10.0.104.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-mono/mono/mono-6.10.0.104.inc b/recipes-mono/mono/mono-6.10.0.104.inc
index 27dff49..a1dd195 100644
--- a/recipes-mono/mono/mono-6.10.0.104.inc
+++ b/recipes-mono/mono/mono-6.10.0.104.inc
@@ -2,4 +2,4 @@ SRC_URI[sha256sum] = "b8d6eb70a252d2efad8384d66b529883dc59e581565d617fa57f8e7931
 
 S = "${WORKDIR}/mono-${PV}"
 
-DEPENDS += " cmake-native"
+DEPENDS += " cmake-native libatomic-ops"
-- 
2.25.1

