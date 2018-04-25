Return-Path: <krzk@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 8F5F274504
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 14:33:55 +0000 (UTC)
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 2FCEA21835;
	Wed, 25 Apr 2018 14:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FCEA21835
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
From: Krzysztof Kozlowski <krzk@kernel.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Apr 2018 16:33:42 +0200
Message-Id: <1524666822-16866-2-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1524666822-16866-1-git-send-email-krzk@kernel.org>
References: <1524666822-16866-1-git-send-email-krzk@kernel.org>
Subject: [meta-networking][rocko][PATCH v2 2/2] wireless-regdb: Bump version to latest upstream 2017.12.23
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
X-List-Received-Date: Wed, 25 Apr 2018 14:33:55 -0000

Bump the wireless-regdb recipe to use newest wireless regulatory
database.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. None.
---
 .../{wireless-regdb_2016.06.10.bb => wireless-regdb_2017.12.23.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/wireless-regdb/{wireless-regdb_2016.06.10.bb => wireless-regdb_2017.12.23.bb} (85%)

diff --git a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2016.06.10.bb b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2017.12.23.bb
similarity index 85%
rename from meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2016.06.10.bb
rename to meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2017.12.23.bb
index 14bf272f4050..cc76e57a3454 100644
--- a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2016.06.10.bb
+++ b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2017.12.23.bb
@@ -5,8 +5,8 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "d282cce92b6e692e8673e2bd97adf33b"
-SRC_URI[sha256sum] = "cfedf1c3521b3c8f32602f25ed796e96e687c3441a00e7c050fedf7fd4f1b8b7"
+SRC_URI[md5sum] = "ae0e1e45d3798d6e1b0d0a3acec1901d"
+SRC_URI[sha256sum] = "0e53e605dd98e7f34429242b5b2afea6dbc91bb913892fa01101e0ec481a4ab9"
 
 inherit bin_package
 
-- 
2.7.4


