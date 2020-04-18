Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.3645.1587213033706334006
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Apr 2020 05:30:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=SKyMKpXS;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id C25216008F;
	Sat, 18 Apr 2020 14:30:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1587213031;
	bh=+zcLT06fbeDRxu1YCI/PFd/KtQUWjCoxEVENuxPCRqI=;
	h=From:To:Cc:Subject:Date:From;
	b=SKyMKpXS2UqceFwoeOGRCo9Y31VgmGWAhNuGaDAEjmadM4LAbnWrUURFvj5XAnj97
	 JUGJrNyh5/gz+pcXcMtFvuby9YeiIkH3tTRrW0K6dRnqho3f29RsRyjnJeW0w2FWVl
	 UWd7cR2quZgMR4gncLgL+0TQmWhlvgn6kgFrPqDmcc423GkZR9Qt+BhWg247iD5rc6
	 3nENLbQwA7cenqP0uy4LmyjY5ZG3bgBS/Q6bgFTfB9ENWAFynFuS3B7lztPfrygnI+
	 M1Gzbywl2L1D2pAORjxPYN/DcXYl+5sPpafvjFoeoBD9C1trKLpgoaPnenXwytyh5q
	 UVV3IoqfZXCDA==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] libuv: upgrade 1.35.0 -> 1.36.0
Date: Sat, 18 Apr 2020 14:30:02 +0200
Message-Id: <1587213002-11638-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

See full changelog https://github.com/libuv/libuv/releases/tag/v1.36.0

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-connectivity/libuv/{libuv_1.35.0.bb => libuv_1.36.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libuv/{libuv_1.35.0.bb => libuv_1.36.0.bb} (90%)

diff --git a/meta-oe/recipes-connectivity/libuv/libuv_1.35.0.bb b/meta-oe/recipes-connectivity/libuv/libuv_1.36.0.bb
similarity index 90%
rename from meta-oe/recipes-connectivity/libuv/libuv_1.35.0.bb
rename to meta-oe/recipes-connectivity/libuv/libuv_1.36.0.bb
index 21a8fce..deeaa2b 100644
--- a/meta-oe/recipes-connectivity/libuv/libuv_1.35.0.bb
+++ b/meta-oe/recipes-connectivity/libuv/libuv_1.36.0.bb
@@ -4,7 +4,7 @@ BUGTRACKER = "https://github.com/libuv/libuv/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
 
-SRCREV = "e45f1ec38db882f8dc17b51f51a6684027034609"
+SRCREV = "533b738838ad8407032e14b6772b29ef9af63cfa"
 SRC_URI = "git://github.com/libuv/libuv;branch=v1.x"
 
 S = "${WORKDIR}/git"
-- 
2.7.4

