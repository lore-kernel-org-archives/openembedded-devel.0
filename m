Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id BCB586010D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 10:02:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46SLDx0wZRz5c
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 12:02:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1568109761;
	bh=1zbQYuX13uAatJLdjLJ0B2XPauX8XosE2MW+ZGwAv70=;
	h=From:To:Subject:Date:From;
	b=KSjMzDZOjju8S14CUY+4pPVQ/3yBx1a70QO0fT3uy7xt+f7j7JIXTLyhWHBKcT+Og
	LGElt62sHhq08GqL1/X9klU+SbpIGT8LFuS3+vJ/qnf+W4ECVX2deJ3CQfjRROQ46A
	w8eWWUgcYCBBua/xMq3bauVLmVNPt+zxpTJdbrgJmHgRB5U9S6YXldTugcU8a657zR
	AWYrolCyaC1RHcaEjB7F8ne7BKRChXzDnOTgdDm8Zkv7QRor6zYplG+HQuHP+s6Y/c
	22FmCxyfhCCTCHRc/9UyTe7NWfL6fDZ9mLu6aprcYUtLX8pYL3clla0jTwveVkwAmi
	przKks4i5oC2FM2ZLyX6Tvu2IfQC+VEPG7JMbBgr9wI2IHft3l0Gyr69UB1U6mXxkR
	ZOIU3SVVYrBHrfnI/hIEiOBKL64K0rY62sfDxh3DA077ODujookF0iFgUMJBxodo/1
	6PJlb1BLQGpQruTUq/17SZEmgCY1yIIMpIGv9fI4idYqjwE2WdLOjlkKmNsBubCCaq
	v5yYpb1hLbpUzV+ZgRXZ1xVM12LwoPsLHHnTxytfhv/vLwaRGlxgWO6SA30bOPW/+H
	+uYKZ2lAEUT50f48HlTeUu48cwPD17rpeIYu5oxJETfFEz+GD8fFxqMzAw1sY872LT
	C8/Z8422OWCXLO9FphA8l+K0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Sep 2019 13:02:39 +0300
Message-Id: <20190910100240.26965-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] php: Remove no longer needed CFLAGS_append_aarch64
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
X-List-Received-Date: Tue, 10 Sep 2019 10:02:41 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-devtools/php/php.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 23380da2c..6e9315c1e 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -99,7 +99,6 @@ PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl"
 export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
 export PHP_PEAR_PHP_BIN = "${STAGING_BINDIR_NATIVE}/php"
 CFLAGS += " -D_GNU_SOURCE -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I${STAGING_INCDIR}/apache2"
-CFLAGS_append_aarch64 = " -O2"
 
 EXTRA_OEMAKE = "INSTALL_ROOT=${D}"
 
-- 
2.17.1


