Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D2CBF6010D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Sep 2019 07:30:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46Nb7k0l6Sz4t
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Sep 2019 09:30:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567582210;
	bh=pIJUAQE8v8AycreKZ/CVWiWUWQtX0rh6dwpuJCnT/FA=;
	h=From:To:Subject:Date:From;
	b=QB2QD7SzAyR6zGPMnRThos+nPD7aL1hqwUAybjBceeJWavkLWiGe8Y6vsY9aaFdz0
	Bwbv6tnUYQd37ffBXut2+7I38K1QH8r7+tOtaMXtASLg6m4ty7oZ8dkMXBQypxNRWs
	T2+JSuVGi14xgD3eRnyuE4Q+OsqWII5PSwFzyh9Czvcq6ezpw+ovQPNNXadqBBXTYQ
	Jcz4rgnwhdgXB251ZnRPFaizGGB7rFxir6l8jknvGHN+Pxp3YDjDcw1+ge1vWXx1Zk
	XCj/MrcaW3z5HAMJDcaHXiqyuUAgVQ1ygq6S7vk2pgzab2JPuUX/H5xecdvMTwsvsa
	8/0gy2IHR/ipa5PMLdfoO6Zfjz75CmYA3FO03NjIBTfaqEPiNBTcS/WKzYxqbFzudX
	fJ0XkvpOHDObOkRGXV+E8zPn4Qoj2grbUy6ZUCak8n5mRWGDlVHGhaKWKkHUwmKvak
	NkMX81lY4kBTaS8PmCSgUIxZfQQbtfEO9ckw9JSJ3AGXDD5eSpJ6Po+Wsjwbt6MaOw
	iqfKBmyfHiVAufRaXxqIPJZE/Gt7YggOCEE2wX60h9HI/c2l7VKpE25GCAy4T667vx
	Yh2lD5s571FL4oiBqrKBJfjCCP0o9CnMgsPlnIrD6zZqJbrf/JewpXINUBznVy1Lbc
	wb+GZPHDRNcVlq85tuh8zu0w=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Sep 2019 10:30:08 +0300
Message-Id: <20190904073008.25419-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] gpsd: gpscat no longer uses python-curses in 3.19
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
X-List-Received-Date: Wed, 04 Sep 2019 07:30:11 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
index 7b7f33520..a28d59dce 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
@@ -124,7 +124,6 @@ RDEPENDS_python-pygps = " \
     python-io \
     python-threading \
     python-terminal \
-    python-curses \
     gpsd \
     python-json"
 
-- 
2.17.1


