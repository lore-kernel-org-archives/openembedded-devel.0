Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web09.5550.1611226874424194398
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jan 2021 03:01:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1l2XiB-0000aG-TG; Thu, 21 Jan 2021 12:01:11 +0100
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1l2XiA-0005Sj-ID; Thu, 21 Jan 2021 12:01:10 +0100
From: "Ulrich ?lmann" <u.oelmann@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?S=C3=B8ren=20Andersen?= <san@skov.dk>,
	Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [meta-oe][gatesgarth][PATCH] zram: fix sourcing of zram parameters
Date: Thu, 21 Jan 2021 12:01:08 +0100
Message-Id: <20210121110108.20791-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Søren Andersen <san@skov.dk>

Signed-off-by: Søren Andersen <san@skov.dk>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3c8ad9192c1c9f4323bdc7ff28456f11db689adb)
Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 meta-oe/recipes-extended/zram/zram/zram-swap-init | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/zram/zram/zram-swap-init b/meta-oe/recipes-extended/zram/zram/zram-swap-init
index 0643dbca2341..ccc3aafe3a6f 100755
--- a/meta-oe/recipes-extended/zram/zram/zram-swap-init
+++ b/meta-oe/recipes-extended/zram/zram/zram-swap-init
@@ -14,7 +14,7 @@ fi
 ZRAM_SIZE_PERCENT=100
 ZRAM_ALGORITHM=lz4
 
-[ -f /etc/default/zram ] && ./etc/default/zram || true
+[ -f /etc/default/zram ] && . /etc/default/zram || true
 
 memtotal=$(grep MemTotal /proc/meminfo | awk ' { print $2 } ')
 memzram=$(($memtotal*${ZRAM_SIZE_PERCENT}/100))
-- 
2.30.0

