Return-Path: <krzk@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 6C62C74903
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 May 2018 07:22:36 +0000 (UTC)
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 3177020882;
	Fri, 25 May 2018 07:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1527232957;
	bh=TnqXEDSANu/XAcA+RFYEGNzymJnOisStqNA3WEuv3+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PbqddBoHBFwaCATuxAmzQ8kXp/aeG2bgIt+yhiB2wNwirTTSUbnXYCB6m3ypvhjRn
	4sqGD03WkNIkqrXCsIIg+hcvifBPTE2F4e9nwXd92lu9soU9fDYnXue7Yby2y2lztP
	990z7MW3uVJTUfXFHEknmB+geTnSgnSAttqXqNBU=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 May 2018 09:22:25 +0200
Message-Id: <1527232945-25853-2-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527232945-25853-1-git-send-email-krzk@kernel.org>
References: <1527232945-25853-1-git-send-email-krzk@kernel.org>
Subject: [meta-networking][PATC v3 2/2] wireless-regdb: Bump version to latest upstream 2018.05.09
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
X-List-Received-Date: Fri, 25 May 2018 07:22:36 -0000

Bump the wireless-regdb recipe to use newest wireless regulatory
database.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v2:
1. Bump from 2017.12.23 to 2018.05.09.

Changes since v1:
1. None.
---
 .../{wireless-regdb_2016.06.10.bb => wireless-regdb_2018.05.09.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/wireless-regdb/{wireless-regdb_2016.06.10.bb => wireless-regdb_2018.05.09.bb} (85%)

diff --git a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2016.06.10.bb b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.09.bb
similarity index 85%
rename from meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2016.06.10.bb
rename to meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.09.bb
index 14bf272f4050..1c7d2bd1ae48 100644
--- a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2016.06.10.bb
+++ b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.09.bb
@@ -5,8 +5,8 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "d282cce92b6e692e8673e2bd97adf33b"
-SRC_URI[sha256sum] = "cfedf1c3521b3c8f32602f25ed796e96e687c3441a00e7c050fedf7fd4f1b8b7"
+SRC_URI[md5sum] = "4bada6171bf89a2926bddcaebde448b5"
+SRC_URI[sha256sum] = "ed5706eab62a0985ecfaf1a6055fd402882d4c7ffee0b473f39291142aba6435"
 
 inherit bin_package
 
-- 
2.7.4


