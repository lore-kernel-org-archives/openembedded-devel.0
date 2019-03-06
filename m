Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C45847CDC0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Mar 2019 19:29:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44F3js3jYSz5Q
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Mar 2019 20:29:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1551900577;
	bh=klc7mml2D/aTB5Iwsle8it7tfXfv7WsIW+9OVZ7zJkE=;
	h=From:To:Subject:Date:From;
	b=RaE+XbLfsfmMksyhe0eQJ9YHkFYOmXzKRC0x5uM6LfwE2EjKEZLz/9P/8vSEyQSPj
	+0Zil1NIxATlO4k3z5+r6nojrSN+20/CVZtBoHwxTzE7LhPR9geRI9uBWxHqR7Q9sc
	jWakLqg5iafU2ICh/7gnRlq6vKU9x0LFnmSOLVHRFhlFiahsGF8j1byOYuXtkLlLKR
	ASArfqTckWYAcIaSTrMGQc2bHuAs4wivFf3ZiACT/HG2gLj+M3lwaOvRLMgamRXBOY
	y8akeTCEA9oBHyf3DJYadCIvMohs+3x6j1XMgFew/igzfdkXXjLFyWZNhKnN64bqXB
	fQZwNyCgXZ5Bky6m1drJq9D8BqPyVtMXH0n1IA0pAeN8qH/V0N5GBCPsQ1SNOM4seQ
	D1Uu8gLLjgHQ8VvsJu+iQNs2/rMGFt+2u+wqT9nJ98S7WplBqOekRQ0nZ2qxyOS2QC
	B4yJgQCgTnzZKzijZCMMODt4S6te24o/DMS7HFMhTZzMe9sO9tLENziA28tlshuoVX
	cDsJeyk50JaKxX7kv5GHw6Q5AnwmBaq97nCHw6udKaWVeKVV3EcUX/9DAEXdHYecg9
	uhxegmnQbMsJBJ977CyMJj7/uPiFN54kiixs+r0k8lqWvIlTrMW1+32AiGcgxjpm6s
	bhQV9lC3NqsuEpzve1H+WZLA=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Mar 2019 21:29:36 +0200
Message-Id: <20190306192936.9724-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] wireless-regdb: Upgrade 2018.10.24 -> 2019.03.01
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Mar 2019 19:29:37 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...eless-regdb_2018.10.24.bb => wireless-regdb_2019.03.01.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/wireless-regdb/{wireless-regdb_2018.10.24.bb => wireless-regdb_2019.03.01.bb} (91%)

diff --git a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.10.24.bb b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2019.03.01.bb
similarity index 91%
rename from meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.10.24.bb
rename to meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2019.03.01.bb
index e1aa9a517..7b7de5849 100644
--- a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.10.24.bb
+++ b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2019.03.01.bb
@@ -5,8 +5,8 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "b81bd1f6525a4806a707881aa3dda63f"
-SRC_URI[sha256sum] = "0d3e845ac77d21aac9b88642c3dd043a83e3920d706b63d5e5c31dffdbec9116"
+SRC_URI[md5sum] = "b5eb2d0cc23f5e495a59405e34ce437f"
+SRC_URI[sha256sum] = "3a4e6f7006599bc5764f86e1e86422710da13ad80e0242147b61c6855ebc915f"
 
 inherit bin_package allarch
 
-- 
2.17.1


