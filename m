Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.2682.1602957002461621683
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Oct 2020 10:50:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=udq6Bef4;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1148-234.w90-120.abo.wanadoo.fr [90.120.95.234])
	by koncepto.io (Postfix) with ESMTPSA id 40827602F3;
	Sat, 17 Oct 2020 19:49:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1602956999;
	bh=GLK5D3dRbA0RhZ4AUxnShegcmftT5ock1U2UcLJCKEo=;
	h=From:To:Cc:Subject:Date:From;
	b=udq6Bef4xiZRtu2pwvAnmg+UaOh7XY8FyfCHpDiyCjhGo8HfMg00FbaDR1IqOfjtU
	 GadfBO74r/aWDlwu6hg2LrChp0ww/x86+g7geH1RVG5wCBsmM7OG3sgHWSG8BZ7OrQ
	 a1KUrQY+7JMjUMrms31LAsAOdY2lBCJRQiIO3XNaOBqMG6lDc50h6VjRG9s5iEN/Jt
	 36U1p80Nh47PHzJtzHoowhB52rfvdxfHd1kRfbujKeDaxKg8gPDTjAjtiOoGIwakdb
	 8JvabETy79bZArhY3J4+b8aaRZ65FyiMEa2Wd7SSCQYefEjD/JGjyKRrS5G70yOyh1
	 D4YQr7nmUCLgA==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [PATCH] c-periphery: upgrade 2.2.1 -> 2.2.4
Date: Sat, 17 Oct 2020 19:49:51 +0200
Message-Id: <1602956992-14402-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

This includes the following changes:

d34077d update version to v2.2.4
ffdb54c changelog: update to v2.2.4
c552ec7 mmio: clear handle ptr on error to prevent spurious munmap() in mmio_close()
c9bce3a serial: clear handle fd on error to prevent spurious close() in serial_close()
5081fe1 spi: clear handle fd on error to prevent spurious close() in spi_close()
879ef69 i2c: clear handle fd on error to prevent spurious close() in i2c_close()
711e639 gpio: clear handle fd on error to prevent spurious close() in gpio_close()
8988d25 gpio: move handle fd clear after their respective close() in gpio_close()
85a71a1 update version to v2.2.3
d8e68ab changelog: update to v2.2.3
5ecec64 spi: fix formatted bits per word truncation in spi_tostring()
5b81b89 gpio: disable cdev implementation under older gpio-cdev linux abi
3279138 make: add test for cdev gpio support in kernel headers
1de776e update version to v2.2.2
1b1df4d changelog: update to v2.2.2
50fcd0a docs/gpio: add note about kernel headers required for cdev support
05262e6 gpio: add conditional compilation of cdev implementation
caadb46 cmake: add build option for tests
ea1e0da cmake: fix identifying COMMIT_ID within build system
76b7c22 gpio: increase feature test macro version for missing definitions
80bc63d cmake: use relative source and binary directory paths

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../c-periphery/{c-periphery_2.2.1.bb => c-periphery_2.2.4.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-periphery/{c-periphery_2.2.1.bb => c-periphery_2.2.4.bb} (90%)

diff --git a/meta-oe/recipes-support/c-periphery/c-periphery_2.2.1.bb b/meta-oe/recipes-support/c-periphery/c-periphery_2.2.4.bb
similarity index 90%
rename from meta-oe/recipes-support/c-periphery/c-periphery_2.2.1.bb
rename to meta-oe/recipes-support/c-periphery/c-periphery_2.2.4.bb
index b53cd6b..daa681a 100644
--- a/meta-oe/recipes-support/c-periphery/c-periphery_2.2.1.bb
+++ b/meta-oe/recipes-support/c-periphery/c-periphery_2.2.4.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4097ec544cf01e9c7cfc4bdf8e4ed887"
 
 SRC_URI = "git://github.com/vsergeev/c-periphery;protocol=https"
-SRCREV = "c2aa7d164f87b807077daeeb3443a56b89e1d1c9"
+SRCREV = "d34077d7ee45fa7d1947cc0174919452fac31597"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4

