Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4302079CC0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 10:40:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46Jzdl004Xz2Y
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 12:40:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567075211;
	bh=R2tQKvAPgRPRcahObK8JwMHCXgQQs3iBY1sELwtxWTU=;
	h=From:To:Subject:Date:From;
	b=mqUEMgHaU3TEgx1wyPUuXHvPAE6yvHuRkbBLkAXNfLc11IFTed9Y2XZ62BRG3oyfv
	MfhtZv98hG/NzH2qcQnFKSbM/WCTPUOmSYRLOCh3Bt13+eQEvadVL4CCmMWTBEx9kY
	Rq3vaoP0p3sOAr4zSMf8i+1HQ3CdxGqvWwqTAg9ku1A18K5yHY8H+ovi8mbtFiQDU9
	/TGaqDtWelFJ9HX5SNEyXFM8/mPzUmjsz7QcNiGPIugpkKq8ieTECV+D/+dWPkQ+e/
	3RPTTP13sahotmaLRp4Nrg5vGG//ZKlnBHBrDMMCZEKsETu77K9+QZNaZCFLKSVbJE
	+uPKwkA/iH84JgaNiBPKKr2ZMbccXm4797DKBF5MGxqv4v1nkh6RGMHgaon+82j37W
	znNqAaqPy8gejqFZL1KdvzsFsGxwCwiAxrHiZ08PUlreckBik5ze1xxS4E7TlZ4Grb
	ibmEMY9blVayLKkRhBrzv64cj58oKz9tXOo4B1duVHX3ftfUM6p0dnXCiH7Gp92IJc
	y04QOLt+HzYsRsOei17tQEWZk5SrKCl0TZvJXJcRF6ZiAEq63JWZOPTDsivGYWDQco
	YpzUVf7RLH/SCjYIleUsgrLNBmBGeqtwpQ1uINHZUmc/UcyWJZwCqEhzFoafFJ7KAU
	x0AD8pCIH7fvD9tofB2xy2rU=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2019 13:40:10 +0300
Message-Id: <20190829104010.8609-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-multimedia][PATCH] mimic: Fix the build with -Os
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
X-List-Received-Date: Thu, 29 Aug 2019 10:40:10 -0000

../git/src/utils/cst_tokenstream.c: In function 'get_token_postpunctuation':
../git/src/utils/cst_tokenstream.c:652:51: error: 'plast' may be used uninitialized in this function [-Werror=maybe-uninitialized]
         memmove(ts->postpunctuation, &ts->token[p + plast], (t - p));
                                                 ~~^~~~~~~

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-multimedia/recipes-multimedia/mimic/mimic_1.2.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/mimic/mimic_1.2.0.2.bb b/meta-multimedia/recipes-multimedia/mimic/mimic_1.2.0.2.bb
index cb4b1b365..b313b110c 100644
--- a/meta-multimedia/recipes-multimedia/mimic/mimic_1.2.0.2.bb
+++ b/meta-multimedia/recipes-multimedia/mimic/mimic_1.2.0.2.bb
@@ -25,3 +25,5 @@ SRC_URI = "git://github.com/MycroftAI/mimic.git"
 inherit autotools
 
 S = "${WORKDIR}/git"
+
+CPPFLAGS_append = " -Wno-error"
-- 
2.17.1


