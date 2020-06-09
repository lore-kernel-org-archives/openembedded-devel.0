Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.3681.1591722892244479272
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2020 10:14:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=Bpvj2c33;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 7CD1B6014D;
	Tue,  9 Jun 2020 19:14:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1591722884;
	bh=8kH08NC108uB7r4Tfe0lpcQxQDDnmZEGzMRyRBOWeMU=;
	h=From:To:Cc:Subject:Date:From;
	b=Bpvj2c33aFNPBYPFeMyNu5kTl4nAFk0M57d6W/5DMRj5QYyc2TQ/sjnkuJwgoOBcg
	 GyGp+KNWHistCUf9Cyu8oNZ6YsEeXKG/4LmUUSyNMA3aewPS/Fnn+v0E9SFiQ9RLDx
	 oW1vnAk4E8qQg4D9c6E50ELvUXy1GIa75leeKD8qfyUeUphJeXeL0ENE57MYcmJHW0
	 1vhOSt738yk53aasb5xMnaHecAy4GLidkhAllWXLgB8RbkaA14H2DWun2XVbdP5itd
	 992ripjUcJnne1ybBP9TIg7eTtmfOFX8zQ+FCQjm10KKm1iYkIEwd2/tFTYQe2k4WU
	 wF8OeKOsxgbuw==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] haveged: upgrade 1.9.8 -> 1.9.9
Date: Tue,  9 Jun 2020 19:14:40 +0200
Message-Id: <1591722880-8060-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../recipes-extended/haveged/{haveged_1.9.8.bb => haveged_1.9.9.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.8.bb => haveged_1.9.9.bb} (96%)

diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.8.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.9.bb
similarity index 96%
rename from meta-oe/recipes-extended/haveged/haveged_1.9.8.bb
rename to meta-oe/recipes-extended/haveged/haveged_1.9.9.bb
index 403956e..c1839b3 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.8.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.9.bb
@@ -5,8 +5,8 @@ HOMEPAGE = "http://www.issihosts.com/haveged/index.html"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM="file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-# v1.9.8
-SRCREV = "8cd0266472aff59821718c4410e80f28978310f9"
+# v1.9.9
+SRCREV = "6da706c8026b629d9bb7ebebc32239305a03da8e"
 SRC_URI = "git://github.com/jirka-h/haveged.git \
 "
 S = "${WORKDIR}/git"
-- 
2.7.4

