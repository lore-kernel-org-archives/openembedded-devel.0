Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 169FB7E427
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Jun 2019 20:19:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45LDQl5Rk7z40
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Jun 2019 22:19:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559938783;
	bh=V8w3+TdBPDBDDpV32MVsgDq1+nIYoVzAVjaDP3HZLZI=;
	h=From:To:Subject:Date:From;
	b=k+rpF+IgTGs0TWSHXXIPy//wEggsr0bOIjZbAlKmUbfTENuJtKgvdZt2Cn1VmYOQv
	oUDp3/bVD0skgV5UxU4FVm2syB5k5n7nutYYq7clbn/QLBtEZ94+ufZc03RxwipYlW
	fN+9yfFtF6g2JBzAjFP25Nu4jN/GIkEHNwOK8pJO/Wg2QjA+OS4M12Y7P5FQcRpwFs
	cVAX265pI1p4TbLcZiQY13c8UARC7Or/9Va0GdgTp+kmbBdkYMLb0CWPv5LYF2x5F8
	G06TK/zfj4gXVIxDdo/6Tw6+h5S0AdWEJwnxBUFkNKc52SUf5UtmdsfOneBZ8oej/S
	tk5Whnbw4oLivBfyD+t/Uxe/kDh4w3i5pSIY/AFthIzsFQFrBKhrK8nQPvFEDdDU28
	L1Q5NDm93P/dzRo1KEAPPPRz36f2hqaOZL7cp76yicMJCNfa68T2lwk9gRQ0MJ/Vg4
	8tX3/1LHwq6R6fVF9vX35a7IOWmh1kCOaOM3otoUDiEX7bpYioD3FaH53WAOZD94rf
	p0ow4Ih0hWm+sOnk1od81hfE1imW1K87bX183YqULgX2+Ebx3ub1LAbkucgtG7b45I
	IAr963tQHjtTOicmBoOiBRN/G4P8wrYAuN/PMyGdsuvjSsyM8x6LVQVHdGRFgR95E8
	LQd5gl2uMtTK6u1y67czxlUA=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Jun 2019 23:19:43 +0300
Message-Id: <20190607201943.11955-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] wireless-regdb: Upgrade 2019.03.01 -> 2019.06.03
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
X-List-Received-Date: Fri, 07 Jun 2019 20:19:43 -0000

This includes deletion of a frequency where transmission
is no longer legal in Japan.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
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


