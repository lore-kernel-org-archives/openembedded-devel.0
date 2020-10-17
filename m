Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.2638.1602957002458283173
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Oct 2020 10:50:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=t3thLMMF;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1148-234.w90-120.abo.wanadoo.fr [90.120.95.234])
	by koncepto.io (Postfix) with ESMTPSA id 17B876037F;
	Sat, 17 Oct 2020 19:50:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1602957000;
	bh=4GxjETROPQB3LSDAaoQROqeO4mXkO1ytX4D+JcJbZRI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t3thLMMF0VGhxr16hOqX626B2E57CgXNpX9z1mfTXVx6mk8o4cMkgsQR451ChINiZ
	 j+KN6ycnf2V90VbUwa78wCElq+2bI+vwo6ndwQXYfTHGJtdcKKe2/Ra4tGfLJNMBQw
	 UXMLWJNL9vlnBu0xmboYQD3xN3lViIJnH51kSl3zqmqlYXqMOE/hmzB0N7DCnkw4M/
	 Ey01+ab+H7VSv3kJ7IoQgMBSQmb4zEQ/NGaPCHh7o/Zwh9A16yyPiZPxL8Zzu4oP7T
	 YKd1x/+DDeovT4JM+ea3RXjL6sh6Fmo2ASPgaywBrugpqjr20YocGFBemL4If798AQ
	 lVITtQbKphKeg==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [PATCH] c-periphery: fix typo in SUMMARY
Date: Sat, 17 Oct 2020 19:49:52 +0200
Message-Id: <1602956992-14402-2-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602956992-14402-1-git-send-email-pjtexier@koncepto.io>
References: <1602956992-14402-1-git-send-email-pjtexier@koncepto.io>

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-support/c-periphery/c-periphery_2.2.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/c-periphery/c-periphery_2.2.4.bb b/meta-oe/recipes-support/c-periphery/c-periphery_2.2.4.bb
index daa681a..621e174 100644
--- a/meta-oe/recipes-support/c-periphery/c-periphery_2.2.4.bb
+++ b/meta-oe/recipes-support/c-periphery/c-periphery_2.2.4.bb
@@ -1,4 +1,4 @@
-SUMMURY = "C-Periphery lib used to access GPIO, LED, PWM, SPI, I2C, MMIO, Serial"
+SUMMARY = "C-Periphery lib used to access GPIO, LED, PWM, SPI, I2C, MMIO, Serial"
 DESCRIPTION = "A C library for peripheral I/O (GPIO, LED, PWM, SPI, I2C, MMIO, Serial) in Linux"
 
 HOMEPAGE = "https://github.com/vsergeev/c-periphery"
-- 
2.7.4

