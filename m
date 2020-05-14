Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.8859.1589448300092612255
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 May 2020 02:25:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=abAWjsku;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id D724F602A8;
	Thu, 14 May 2020 11:24:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1589448293;
	bh=IsGNt294tFK5UyYO9N7O+tikmPbMEoWqDYpIXc0DuB4=;
	h=From:To:Cc:Subject:Date:From;
	b=abAWjskuHTWc/r5nsBFSNCRU7YK7++UKziki60V9XsQTuapr2jOD3qwX/iMmuzPos
	 CRW1vJ9c+KQsZXYESHb5BuhbEION71VUlE0O1RYQNTkSYBL1sVoj+dz4P5dnRL3RCC
	 jO89MhtUC/mPxvBnDFpBN5LyMTWMguSEsAaXnGry2UM7jRC1Ra1i1YZW0r/qag2R4F
	 5liAtamDb2k/K1j6xPpNLnnDQC4giMx0ExbrHE2ttWeLCk8HsU89uvCsSsRjoQiHb9
	 Wg0DMJjt5+uD+rAC+4DJsuXBlBvgmANGqdrxN22DiydD5mavg8EbEOscqIUlAghzFH
	 Ej0wXyuF1zEcQ==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] iwd: upgrade 1.6 -> 1.7
Date: Thu, 14 May 2020 11:24:35 +0200
Message-Id: <1589448275-10920-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

This includes the following changes:

ver 1.7:
	Fix issue with APs that send IGTK falsely in big endian.
	Fix issue with setting linkmode & operstate for open networks.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-connectivity/iwd/{iwd_1.6.bb => iwd_1.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.6.bb => iwd_1.7.bb} (96%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.6.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.7.bb
similarity index 96%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.6.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.7.bb
index 10ac03e..4911b3d 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.6.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.7.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
 DEPENDS = "ell"
 
 SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git"
-SRCREV = "ad97f4f945b828425ff288e905523e11b330d41d"
+SRCREV = "ef6084dcb4fe2e00327bb9c7b113ece204042c22"
 S = "${WORKDIR}/git"
 
 inherit autotools manpages pkgconfig python3native systemd
-- 
2.7.4

