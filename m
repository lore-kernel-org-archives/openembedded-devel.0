Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E62417F43D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 12:30:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47CkTX2mZ6z7x
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 13:30:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1573648208;
	bh=WtriyI8p2e/0dEu7eW2tZNYXWt7l+N2TrmfMW/RqmI8=;
	h=From:To:Subject:Date:From;
	b=K4db0H7p2kaCwyuelx/rEOWKteeddQSbxneWQanAdzoG+1qk1YA6ZNC1GkNub++mA
	oXseyJsbLwmtqWiOMR62ebbxQpEICs8OmzCj1VEsPCo3fz6XdVuYkPTx4N7a+iswKP
	J5hEHGK/R2a+lxirngyap4jJAct2LMbooWejNyzZfYfNq1e5E/TdvioM3YmCBcMq1d
	iJj5bgPnSfxnMKaEW/fp/waZZ/SB98Aomyk+goHkSUGdPKwd38l41bXWH9cVvtSRHp
	CwtF1U0/W/mMT4DnRQyj04e+tD2ql0VuABZRoiv7R7wybElt5SPLkxDmNmGTx2DpP3
	EA0nTXzCvbSG8DAN3yRQsLYZWjuIitNCKUDT01pC/+HOLVzgOxlrvxQHWEuOV/dApG
	zjQAD4u4aAhQzKS/zve9dHKN78ymh/4m/qfW0TPMZYtLq8fwk7usHuIIgTGunquD8d
	Nnk5RTLq2EpmIOLo6rqkNfHRHETls0vf4BhSRKcWb3WEJYRY/JtL2P/k/mKsVSF1Tz
	qeMvs65/w0Sy0CAAeyWxbAz+c4iUPx85Fv4wpkwSCXSgNqP5/dbN9hfuOhcbNj7mqq
	6usShYkiCp0IfLorjbtuC+7YVmCdTS59AhSyJFM0u/1+VbflXPIDhm19+gi2QWanDb
	yjaMk6IRrPm/R6TrPFP7Blds=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Nov 2019 14:30:06 +0200
Message-Id: <20191113123006.21785-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python-more-itertools: Add PE
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
X-List-Received-Date: Wed, 13 Nov 2019 12:30:11 -0000

The recipe was downgraded to the last version supporting Python 2.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../recipes-devtools/python/python-more-itertools_5.0.0.bb      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-more-itertools_5.0.0.bb b/meta-python/recipes-devtools/python/python-more-itertools_5.0.0.bb
index c66e55cac..6c44df40a 100644
--- a/meta-python/recipes-devtools/python/python-more-itertools_5.0.0.bb
+++ b/meta-python/recipes-devtools/python/python-more-itertools_5.0.0.bb
@@ -3,3 +3,5 @@ require python-more-itertools.inc
 
 SRC_URI[md5sum] = "f2ea58aa336ce6c13b7b225b3bbe305d"
 SRC_URI[sha256sum] = "38a936c0a6d98a38bcc2d03fdaaedaba9f412879461dd2ceff8d37564d6522e4"
+
+PE = "1"
-- 
2.17.1


