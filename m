Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Greylist: delayed 591 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 19 Mar 2019 09:44:51 UTC
Received: from mx1.tq-group.com (mx1.tq-group.com [62.157.118.193])
	by mail.openembedded.org (Postfix) with ESMTP id B6A086C42C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Mar 2019 09:44:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.58,497,1544482800"; 
   d="scan'208";a="6676350"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
	by mx1-pgp.tq-group.com with ESMTP; 19 Mar 2019 10:35:00 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
	by tq-pgp-pr1.tq-net.de (PGP Universal service);
	Tue, 19 Mar 2019 10:35:00 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Tue, 19 Mar 2019 10:35:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
	t=1552988100; x=1584524100;
	h=from:to:cc:subject:date:message-id;
	bh=nTGYa4XhXMNmvrv5WVC9ZKuJv8g8iU2Rz0jUIzXl81g=;
	b=HNCXWoT1rYPkBffkx9/CSKcmJF+xr5QaG7oLhL2Xra9Di3Q+PN/frIkd
	g8T3mNSf5mT+F8KdSK1NUepNzrILNFltxdQtpuaA/SgNbHvDcm+scn0AH
	MPakvfeVszDX8cbo9nlKXVHKuTNKXhdR7ilo/WnqNDklPIlJjsTFHWhiy
	gvm3YY5wLEBElxLipJYJ4Izh4Pc9wGUC+0cCLO9h0w+gPGWAxc3K7RNgL
	F3ps/oPirRfnlRrheFJVnLdmY2YctELZP8nQDGBg6au1gLHndePSFBX5J
	Ygv8ucJJMzOaK2RPVBbKHWx1nhN52i8WIgqpuCGquBFXjuGottAS3Mm9I g==;
X-IronPort-AV: E=Sophos;i="5.58,497,1544482800"; 
   d="scan'208";a="6676349"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
	by mx1.tq-group.com with ESMTP; 19 Mar 2019 10:35:00 +0100
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
	[10.117.49.26])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id EBB5D280074;
	Tue, 19 Mar 2019 10:34:59 +0100 (CET)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Mar 2019 10:34:23 +0100
Message-Id: <20190319093423.10649-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
Cc: Oliver Friedrich <oliver.friedrich@tq-group.com>
Subject: [meta-oe][PATCH] nbench-byte: update SRC_URI
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
X-List-Received-Date: Tue, 19 Mar 2019 09:44:52 -0000

From: Oliver Friedrich <oliver.friedrich@tq-group.com>

Signed-off-by: Oliver Friedrich <oliver.friedrich@tq-group.com>
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Upstream moved the file for some reason. Please also backport to all stable
branches.

diff --git a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
index 22bb0416a..b4d55be1b 100644
--- a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
+++ b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
@@ -7,7 +7,7 @@ LICENSE = "nbench-byte"
 LIC_FILES_CHKSUM = "file://README;beginline=57;endline=66;md5=020ef579f8fa5746b7e307a54707834f"
 SECTION = "console/utils"
 
-SRC_URI = "https://fossies.org/linux/misc/${BP}.tar.gz \
+SRC_URI = "https://fossies.org/linux/misc/old/${BP}.tar.gz \
            file://nbench_32bits.patch \
            file://Makefile-add-more-dependencies-to-pointer.h.patch"
 
-- 
2.17.1


