Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.12722.1591553092457231519
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jun 2020 11:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=IDcZJlHL;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 0E7BB60057;
	Sun,  7 Jun 2020 20:04:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1591553090;
	bh=qZR75mFKhtl50gGaCnB+sLIEuo9qWcEgBhmQDukd7gs=;
	h=From:To:Cc:Subject:Date:From;
	b=IDcZJlHLXs1CVFeG6EwxvVnBRwr4akDqN14xZ+wxuFNGNO9Tn3ySapmxMYx/knj3a
	 Xn4SDC3xsMAVrZ1aDVJcirmsQ0aE/mZgmOvktM4Ge10275fxeqTEZoT8MZGoNMcojX
	 TvM+MhNEsSyD25G/wLsF+txnj9uVeUvq45Q36GgCghi6GosEAPTgFzs4GBkWlrf11d
	 nj3GDaFGmYu5P2Es3T8fcOKenCYzXUd8TsBuh8lckF2aR/Ryt18Atys0a4khZI+jmN
	 H2Ys7Ftrrdeq0KFNCAOhFcHOS3fWgqKUxvYR22dLWC5Mt2XmpM+5AYhfv12s7dzeXG
	 9Mx+B/25D8YYQ==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-networking][PATCH 1/2] tcpreplay: fix upstream check URL
Date: Sun,  7 Jun 2020 20:04:39 +0200
Message-Id: <1591553080-26878-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

Fixes:

$: devtool check-upgrade-status tcpreplay
<...>

INFO: tcpreplay                 4.3.2           UNKNOWN_BROKEN  None

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.2.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.2.bb
index a808c27..cc6cd1e 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.2.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.2.bb
@@ -11,6 +11,8 @@ SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcprepl
 SRC_URI[md5sum] = "dfa0d1b3dfd2cd316291a7a20563b649"
 SRC_URI[sha256sum] = "4f479bd9196cafde70c58ab072ca4959ecc5278555cf1aa7cf42f7f210daa951"
 
+UPSTREAM_CHECK_URI = "https://github.com/appneta/tcpreplay/releases"
+
 DEPENDS = "libpcap"
 
 EXTRA_OECONF += "--with-libpcap=${STAGING_DIR_HOST}/usr"
-- 
2.7.4

