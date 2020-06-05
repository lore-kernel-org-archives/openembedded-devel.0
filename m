Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.1511.1591391746811445157
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jun 2020 14:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=SSKcFlxL;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 84F6C6012F;
	Fri,  5 Jun 2020 23:15:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1591391744;
	bh=7SCeOwKrgMNZ9B3wyhLvkQm8mVLNXJRsHFT75h97rbw=;
	h=From:To:Cc:Subject:Date:From;
	b=SSKcFlxLfJX/alOfg5BFNISPmPNgDCOyTNbnIpY0xwzIwrTrqQVHbMk4P1zHQLz1r
	 cepdC5GEgqqjwZNzLd7TFDacKe+RA3P/mStlvU1L/3hN6rxrLE4ZRdM91+ScMsb8VX
	 G4nCnyn6bgjNChSv/55RPi3nTEk5srLMgMbnq6wrZDxSxc48GD9t3EN/lsP1+pzCUl
	 56bmy6/g2hTJ3/iwUyrgax4h2Qalj/2vQq/7LNI44oz26xVlAcewS4Pl5ttrdvyQdP
	 Fr6fWiE60IACca1AnKm+B4w2mnY0DDY8QlBp1cLpet3V1byZlnc1xhUkQbIs4BepfU
	 o1ba1zPU6RhlQ==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] libiio: upgrade 0.19 -> 0.20
Date: Fri,  5 Jun 2020 23:15:41 +0200
Message-Id: <1591391741-16573-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

See full changelog https://github.com/analogdevicesinc/libiio/releases/tag/v0.20

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-support/libiio/libiio_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
index f83d9c9..d12fac6 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -4,8 +4,8 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7c13b3376cea0ce68d2d2da0a1b3a72c"
 
-SRCREV = "5f5af2e417129ad8f4e05fc5c1b730f0694dca12"
-PV = "0.19+git${SRCPV}"
+SRCREV = "26c5be5ae37334abf3021b52d27f84aa6a6b1842"
+PV = "0.20+git${SRCPV}"
 
 SRC_URI = "git://github.com/analogdevicesinc/libiio.git;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
-- 
2.7.4

