Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1921C54E71
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:46 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.8158.1710827204299631604
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VLjFqouu;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827205; x=1742363205;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7os1LaZaHJQDNFVrdrsgxcpzmyxbGcB8+kx2AmYDQrU=;
  b=VLjFqouu8v09DIvtc9Ot5urSzoyuq4Qa1ii9b4gbILIXUIHHJ8bP8uee
   rCTNcDx9QOWR/kx0CAIvk9n6fnUPtlyJ6gzfwbGjsXwRINfXZTi5tmvS0
   plpoUNFyjycOPeWOTEaEoUuq/fPEaG5N4ULwz8waabz3+v9ci0f16gIUv
   Ik1yAlq+/QQlASQVOray1iaE2Gn9DKHXtkpbt3a1Q7eRI/lDd6RHXBJJg
   9b9f4Eh8zitwLwNFQylFTwHLBkpuvYdQrrMx0MueenQC/PaVivc+X0uyc
   pUIg1PmJLiFLnQvLMSYImzfAQndt3Omli5fq7MI4sAz4icczmGd/4psKR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="152562813"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="152562813"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:42 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A2B9141214
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:40 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 66BC6D561A
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id F0B7C22880B
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9816B1A006B;
	Tue, 19 Mar 2024 13:46:38 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/50] python3-googleapis-common-protos: upgrade 1.62.0 -> 1.63.0
Date: Tue, 19 Mar 2024 13:45:19 +0800
Message-Id: <1710827139-30056-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10--4.972600-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqz7fZJfDdCIXDHK
	pounjPyfXfnq5PRvFFsdUetUKvcxGu1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4Dh4tQYScTfkcvD/aJAhh3s48plQwfMmRJSeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNZPjSKtQ5PQ/RDFhqSeYMsEKmNYGRZynG2BiohIcb0zPOwYus5R+bIq4bn2JUppM278bJ
	jzyegc533g8ITCK48Uad5FiUtsAwDKgHg/t0KH2U8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109446

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Add api_version field to ServiceOptions in google/api/client.proto
-Add LOCATION_POLICY_VIOLATED enum to ErrorReason in google/api/error_reason.proto
-Add rest_reference_documentation_uri field to ServiceOptions in google/api/client.proto

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...tos_1.62.0.bb => python3-googleapis-common-protos_1.63.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-googleapis-common-protos_1.62.0.bb => python3-googleapis-common-protos_1.63.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.62.0.bb b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.63.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.62.0.bb
rename to meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.63.0.bb
index 5df1210da..aee233726 100644
--- a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.62.0.bb
+++ b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.63.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7ca
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "83f0ece9f94e5672cced82f592d2a5edf527a96ed1794f0bab36d5735c996277"
+SRC_URI[sha256sum] = "17ad01b11d5f1d0171c06d3ba5c04c54474e883b66b949722b4938ee2694ef4e"
 
 RDEPENDS:${PN} += "\
     python3-grpcio \
-- 
2.34.1


