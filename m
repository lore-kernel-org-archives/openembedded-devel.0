Return-Path: <krzk@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 9DF8578887
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jul 2018 18:58:38 +0000 (UTC)
Received: from localhost.localdomain (adsl-84-227-236-43.adslplus.ch
	[84.227.236.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6CD2020871;
	Thu,  5 Jul 2018 18:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1530817120;
	bh=Dw2MrZ2j0Nz5ivlH/Crqudm7t/gl9JpvxRJfFLs9+64=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gytUOxQhb0wgmrZ5PSba01hyC17Mn/Oqx7ONv3MmYuyQ64fpXV/MR1ik9fHNFPb9T
	/Q8UMfUO2tsxYbq77Oah/Hf63lLdt1ZI1OOUrc5mpLz6m1MSy7l6TGYXVuGx/ZI+wY
	AqmRZcKwyv8dyik7bUsFUcGTtpFadLDu/7LVZQmc=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jul 2018 20:58:10 +0200
Message-Id: <20180705185812.23209-2-krzk@kernel.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180705185812.23209-1-krzk@kernel.org>
References: <20180705185812.23209-1-krzk@kernel.org>
Subject: [meta-networking][PATCH v5 1/3] wireless-regdb: Bump version to latest upstream 2018.05.31
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
X-List-Received-Date: Thu, 05 Jul 2018 18:58:38 -0000

Bump the wireless-regdb recipe to use newest wireless regulatory
database.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../{wireless-regdb_2016.06.10.bb => wireless-regdb_2018.05.31.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/wireless-regdb/{wireless-regdb_2016.06.10.bb => wireless-regdb_2018.05.31.bb} (82%)

diff --git a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2016.06.10.bb b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb
similarity index 82%
rename from meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2016.06.10.bb
rename to meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb
index 64e9401e7a3c..8bb866ff1281 100644
--- a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2016.06.10.bb
+++ b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb
@@ -5,8 +5,8 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "d282cce92b6e692e8673e2bd97adf33b"
-SRC_URI[sha256sum] = "cfedf1c3521b3c8f32602f25ed796e96e687c3441a00e7c050fedf7fd4f1b8b7"
+SRC_URI[md5sum] = "0cbbdc21186c76cf58aba01b03f3dc5b"
+SRC_URI[sha256sum] = "e1dfbc3b97771373077f430c3c05082fae883145b37db5b2cfd12c56676fbe7b"
 
 inherit bin_package
 
-- 
2.14.1


