Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id ABCC97CF98
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2019 17:16:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45TWp11SHLz2M
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2019 19:16:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560964601;
	bh=Ml7cZ4s8hC/L06/USILq7ztmns4sftwUgcvWBN25alI=;
	h=From:To:Subject:Date:From;
	b=L+QgnwifMb2ByPJZs9voDV7WIDR4vL4YTJsxD/bc0PEkViyKncKh69wr3coxhluJg
	W2RQIMtvVf60roGRAZjyAA3VjRvotA32VHFSfO0/C7dZGaEFgiFzT7fM6JN6bR0Z9t
	OQWV1s2qaVO84SUkH5LstBMbXBrpmFzL3vBa8Wls6GsVNtG3jW09QiWbkctLYqU/uR
	uVvcMzQgt30t487c3Dyf9zhi5xxEgSHnwQLSI1qZi2E+/SJP82wUeOHU32VVDNxehD
	mwtsmjzTnk3xlBTSft5UgsaGkvAm9pAamMvGu/WaX4fjSeUOkeU4TR0ThbRqgrmyMz
	GevAWQOYFr6fk/211XVPvbF9SYu7BMP4i3W5iZydHwbwKlbD//hF/i8YyTbK4xH2GL
	Jui7CpOBdz7J1GhK6RfHTtG5HmX0LRZqoiW5hqi1E1Bwai5eF3HaWbpZ8Za26Ze031
	cs5b2A6pazN5GzAof7cgahFXUxrqc2fRBBrqT/jlSn1qxeklJg7ItKzIw08kbdOGWr
	xLtplhkJYFQpVsNC6MqUc3e7f096OcGBjODalyD0H/lgs8BV6g00qJERE9DFr9hOdA
	bfXFpTattm9O5vESqnA4/oe0poXB9qK2Hvqjp42ZAeZ70YEk3CEA6xqEbyDJJ9u9kN
	aJGtiShiebwODSdYU8OWSU9o=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jun 2019 20:16:40 +0300
Message-Id: <20190619171640.4798-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][warrior][PATCH] wireless-regdb: Upgrade 2019.03.01 -> 2019.06.03
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
X-List-Received-Date: Wed, 19 Jun 2019 17:16:41 -0000

This includes deletion of a frequency where transmission
is no longer legal in Japan.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...eless-regdb_2019.03.01.bb => wireless-regdb_2019.06.03.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/wireless-regdb/{wireless-regdb_2019.03.01.bb => wireless-regdb_2019.06.03.bb} (91%)

diff --git a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2019.03.01.bb b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2019.06.03.bb
similarity index 91%
rename from meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2019.03.01.bb
rename to meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2019.06.03.bb
index 7b7de5849..ded44b3d4 100644
--- a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2019.03.01.bb
+++ b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2019.06.03.bb
@@ -5,8 +5,8 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "b5eb2d0cc23f5e495a59405e34ce437f"
-SRC_URI[sha256sum] = "3a4e6f7006599bc5764f86e1e86422710da13ad80e0242147b61c6855ebc915f"
+SRC_URI[md5sum] = "4b5ba3f089db7fdb7b9daae6a7c1f2cb"
+SRC_URI[sha256sum] = "cd917ed86b63ce8d93947979f1f18948f03a4ac0ad89ec25227b36ac00dc54bf"
 
 inherit bin_package allarch
 
-- 
2.17.1


