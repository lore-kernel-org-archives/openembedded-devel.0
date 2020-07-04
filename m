Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.19247.1593870674345134762
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Jul 2020 06:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=UXTFfTxM;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1339-171.w193-250.abo.wanadoo.fr [193.250.150.171])
	by koncepto.io (Postfix) with ESMTPSA id E897860301;
	Sat,  4 Jul 2020 15:51:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1593870670;
	bh=WuvE3qEYEeWXCWqXrhqqo7h19XP+KCH7enxE8p8E0F4=;
	h=From:To:Cc:Subject:Date:From;
	b=UXTFfTxMt3N4XdaT9xSaScUk22MCB/xZdrJhcfVyLxlX5XFawe+aloadoeCRWGfVo
	 dmeujXmDmAFIIkKooRXekyIfmFEmdtxBfBMAAm8dFATNtvnHcmUKRK9B5hzoCgLeM6
	 y/ThnA4gGLo3Zo1htTzChXifVHF8K5GcRvMqBaaufFue4t88gadweYpfk3eOGxwmSK
	 qN4jb0ug6OzKL5XmQ6i8e/9rM6JifYrA8vRjx7AOIPpyMheo6jyAgKiSAGQ8LmKeoa
	 dwzhqI2xaxsM3x94Bq3ZYn2FDQqSb3Pfcu+g6QnH83+UrnOkVMrtGnGBnER+6hEoSJ
	 RNbEBQkzXmrJg==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH 1/2] haveged: upgrade 1.9.9 -> 1.9.13
Date: Sat,  4 Jul 2020 15:51:06 +0200
Message-Id: <1593870667-26940-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

This includes the following changes:

1.9.10:
 - fix ordering cycle with private tmp

1.9.11:
 - Fixed wrong version string in v1.9.10

1.9.12:
 - Fix a memory leak in havege_destroy

1.9.13:
 - Added support for --version
 - Updated systemd SystemCallFilter settings

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../haveged/{haveged_1.9.9.bb => haveged_1.9.13.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.9.bb => haveged_1.9.13.bb} (97%)

diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.9.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.13.bb
similarity index 97%
rename from meta-oe/recipes-extended/haveged/haveged_1.9.9.bb
rename to meta-oe/recipes-extended/haveged/haveged_1.9.13.bb
index c1839b37a..50326ea2f 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.9.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.13.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM="file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 # v1.9.9
-SRCREV = "6da706c8026b629d9bb7ebebc32239305a03da8e"
+SRCREV = "1283a65c541c4a83e152024a63faf7b267b9b1cd"
 SRC_URI = "git://github.com/jirka-h/haveged.git \
 "
 S = "${WORKDIR}/git"
-- 
2.27.0

