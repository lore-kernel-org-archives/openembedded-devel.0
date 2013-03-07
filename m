Received: from mail-ea0-f174.google.com ([209.85.215.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UDXjP-0003Ka-K6
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 11:07:24 +0100
Received: by mail-ea0-f174.google.com with SMTP id j13so69239eaa.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2013 01:50:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=KEDMaV1O9KFSdyi7g0zztgKxHQz8WMXKQQ8vmaaKbUM=;
	b=JBfDWXLJZ5RQYDeHcZ033yUTiEq4UQq9/5Jb2e6qe/89Xzzq8T3AX2/N4/mihqcr78
	rDbt9UR+/Z+oC6NrI9MvrU+zE5KMl2aanb6feM9lnoKdQ+GP9Lb0NNqAi4ijPYcsqrUB
	bLsImRP9D4b1CV9FesjR+KEc4CXj0Vf4Sl5ZCfgm7jtBJJzBpsK2N1OGfJNMlXclswi9
	Arwdla+1eFUj7z4ztJdT5z7U1Ehae231Xez2IKeuwKuBLeA96gRZZ2DDz9o9zrwnhZgb
	m0RZjiyl4OjoG/lgWHpa2EeUFzh1wZLimqHQbKx45cjta5KuulyfVzYOiGFg+voNhOxq
	PQvQ==
X-Received: by 10.14.183.198 with SMTP id q46mr58048278eem.1.1362649851808;
	Thu, 07 Mar 2013 01:50:51 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id 46sm1327877eea.3.2013.03.07.01.50.50
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 07 Mar 2013 01:50:50 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Mar 2013 10:50:37 +0100
Message-Id: <1362649839-9160-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQn4FQPvgIu8X0jDI31ZC9vlu+n7cqKEzSITTG/PJtgjWKn4ATR+dRipTdFwwXGseWvNZ03J
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-kde][PATCH 1/3] packagegroup-kde-apps: remove multiline comment
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Mar 2013 10:07:38 -0000
X-List-Received-Date: Thu, 07 Mar 2013 10:07:38 -0000

ERROR: There is a confusing multiline, partially commented expression on line 12 of file /build/setup-scripts/sources/meta-kde/recipes-packagegroups/packagegroup-kde-apps.bb ().
Please clarify whether this is all a comment or should be parsed.
ERROR: Unable to parse /build/setup-scripts/sources/meta-kde/recipes-packagegroups/packagegroup-kde-apps.bb: Exited with "1"                                                                                                                  | ETA:  --:--:--
ERROR: Command execution failed: Exited with 1

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-packagegroups/packagegroup-kde-apps.bb | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/recipes-packagegroups/packagegroup-kde-apps.bb b/recipes-packagegroups/packagegroup-kde-apps.bb
index 4258c4f..3cac437 100644
--- a/recipes-packagegroups/packagegroup-kde-apps.bb
+++ b/recipes-packagegroups/packagegroup-kde-apps.bb
@@ -1,14 +1,3 @@
-#Defect with Qt<4.8.2
-#calligra \
-#calligra-braindump \
-#calligra-flow \
-#calligra-karbon \
-#calligra-kexi \
-#calligra-krita \
-#calligra-plan \
-#calligra-sheets \
-#calligra-stage \
-#calligra-words \
 DESCRIPTION = "KDE packagegroup for applications"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
-- 
1.8.1.4



