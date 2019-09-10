Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 775B57F357
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 09:59:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46SL9b4K14z4K
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 11:59:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1568109587;
	bh=2dAVWhcfB2d25s1AXUEBgfpMQv32euS2syPo7glVFLM=;
	h=From:To:Subject:Date:From;
	b=MjjPmBBK2ht1lo6I2P9qCh83fS9zmLehSH24+arAeqKKHSFHai7j7rl6mghXsONIQ
	C0cBsXp1HpUmwAKabQV2Tb6VGUqraGaJjX/TxC+hD2HVCOxGiXjbsnmedhaOE6ZMgV
	cFf2zWfSzaZ6pp39/NTTCA/pwojwe9+WN9/yCH5uSC0zBzHtn77BtVRhW+cwL6X3NR
	bj7PP3QdEUlWliBS84SQIlaly43tdDrkb0YXRrKw2nfhYHaJpZzn42+PrFm517jYp2
	mArrmXX+G5koUcA3a555nfQ3ngIr1BmsIB5DjOBgk5QKsE2G72H8V/FqFEZ0wr39dl
	tzXHTA6ARYJMM8+PU7h7Ld1X7nMpG1/09aspxf7sy80nH28PE0tvAQnXZ7AnP/FRFY
	rEOSqpagug/Mp70cGjgMTUDkRHKexxSw34LBEWRPWuQpebicfMx/jwjEstk9D3u32h
	lxHVDKZe9TlFe4AAodbUQCdujXlRGMW4+8o75Sn/qBSTcbmrjrM+mXoOMK5p1wdFbG
	5xt2ZfZ/Pp5/VT42FG5peYazNo9OK44Xp4UCMXEqQJung/pwIH1R0GS77JS2Bz7Zc6
	l8QYY1CSLL2wdOirFMYtzjqoDTcohAhaOIwaNLBm0q0AnYlU0mXGkStZK4RY8CgEot
	cA5euivD0PDOcYQetxWmdIKs=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Sep 2019 12:59:23 +0300
Message-Id: <20190910095923.26781-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-cmd2: Remove PNBLACKLIST
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
X-List-Received-Date: Tue, 10 Sep 2019 09:59:47 -0000

python3-colorama is now available.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb b/meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb
index 594e93dca..f5c5c7e1a 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb
@@ -7,4 +7,3 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-attrs \
     ${PYTHON_PN}-wcwidth \
     "
-PNBLACKLIST[python3-cmd2] = "Nothing RPROVIDES 'python3-colorama' (but python3-cmd2_0.9.16.bb RDEPENDS on or otherwise requires it)"
-- 
2.17.1


