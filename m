Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A51907FCDA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2019 16:25:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47KMHL4sNkz4Y
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2019 17:25:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1574439950;
	bh=yStH2HvSUimLzYZPzr5ugLXkL/aGl1+tTVwHqsC6DDE=;
	h=From:To:Subject:Date:From;
	b=eg4t56yJnMFth+tr6PIa1II1wvepGBzGdZA6xqxpAWb/FfR6rBND9TISwp5PP/x7q
	rh3X93Ted7R0zg41JVl5L9EfkK1keaiU6LviZKxy1rUvRyCmJA6y1Y705YQQhQOxK7
	F/v7LbAygB29nTQBlTMGqq5K6CeHKDv6FvO+LfHnYn5kLzGxAQBtTCunkwtUh6+/Vg
	PJXwSeoUeh8X7py4p//gILGIDxjM9JQec838fMFZmqASd1ADcaVeE5pgNzjW+mWbsj
	VrPDMCYxQacaLkHrW9NJzzATIEOUWsHL+eLUHk8IiLvR2pAX7plrjC8zAbpREV5DZe
	2DmuSmSNNUWo4tNk/uHtUmJ8ETiN6OebzoTojVlhb/zyu92bKibkYK6hp0g9voYx0x
	QdRo6Sk4K+mksReV6R0dikfLpg5AbnJgiVwCvFDWBXHosNgpYZcgUi5QGsTLMEwvv9
	AJ3dWhjNp9tk45AasB3THI7ee3zaowmRNK2iQb7Ti0MyNKcHy6J1tn1loK9/2k2+zq
	uCug/AosF9oyhAsAtee+HY4cBxq8TMmJFf91l1we9K3pFNcbv7nOGNTox5+lxmCn1W
	/uJ8Yn+PpHUN4T4myg9+K7BB0IhFPccYreTB8X6uYP+/7udhuliTmlnFqwOLSmGD6G
	I9zOrwrluN4qiHY7IslNGpOQ=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Nov 2019 18:25:49 +0200
Message-Id: <20191122162549.31863-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][zeus][PATCH] modemmanager: Upgrade 1.10.6 -> 1.10.8
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
X-List-Received-Date: Fri, 22 Nov 2019 16:25:51 -0000

From: Michael Scott <mike@foundries.io>

This is a bugfix release on the 1.10 branch.

Includes: Fix for an issue presenting after 1.10.6 update where modem
would enter status denied state.

See:
https://cgit.freedesktop.org/ModemManager/ModemManager/commit/?h=1.10.8&id=47fd8a1e55cac0b0b45812e1dda826f38c264d1b

Signed-off-by: Michael Scott <mike@foundries.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../{modemmanager_1.10.6.bb => modemmanager_1.10.8.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.10.6.bb => modemmanager_1.10.8.bb} (92%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.6.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.8.bb
similarity index 92%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.6.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.8.bb
index 92d4fe0f4..3cd21cc0d 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.6.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.8.bb
@@ -14,8 +14,8 @@ DEPENDS = "glib-2.0 libgudev intltool-native libxslt-native"
 SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz \
            "
 
-SRC_URI[md5sum] = "7452a94f0d1ca361ae51ff1d287c53f5"
-SRC_URI[sha256sum] = "3c2ca73782215664141042422759899ca9846440fc26d6223c7cf7ea4dd3c996"
+SRC_URI[md5sum] = "c05ac4246c81cc15d617c4a129232988"
+SRC_URI[sha256sum] = "cbe174078dbdf3f746a55f0004353d3c27da2a31da553036d90fc7dc34a0169a"
 
 S = "${WORKDIR}/ModemManager-${PV}"
 
-- 
2.17.1


