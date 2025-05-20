Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4AA1C54E93
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 08:55:20 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.16489.1747731316435812152
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 01:55:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=l4sE94aX;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747731316; x=1779267316;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Ka3ws1Ut97l3zGF5dEPDCQ+5AVgomhad30wGTMVc+CU=;
  b=l4sE94aXTa8o4FM6t6dNu8T8jOUMQHYuNnHgs7I0xZ2uP38hoHNa0LU/
   LRSQwpPNaVlAVIn2czTL7WBSSHZgkbhuPPIBz4vlOXDS+KIx5FTtHYgg4
   8FG92Eg5tVNce6Qwz43koXk8g5T67Dftv30Ho0wF8/sUF+VnVrOPQnaq7
   qxUF5B/Dz+nIjuTstEhgRLCqzHl/Do0teyXpsdFlcmzaxVumoBJ6xuodb
   vGx95+5AcWMU4G9KHgr6GyLB+MilZrgPsmnnqjqMndZfvW7vpNafjwqrM
   2VIAdklqLLwsk5f57TCVnTnWfIvujttC3s+um6cM8Nr9XSSzomqTQqgo0
   A==;
X-CSE-ConnectionGUID: 8Dcm3Rr7RAWvzxuEH9ZXHg==
X-CSE-MsgGUID: /JkjuoedQuyPDr6QWjRS8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="200077168"
X-IronPort-AV: E=Sophos;i="6.15,302,1739804400"; 
   d="scan'208";a="200077168"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 17:55:14 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A546E8FE0
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 27706BDC87
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:12 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B02D01A009A;
	Tue, 20 May 2025 16:55:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/27] libfido2: upgrade 1.15.0 -> 1.16.0
Date: Tue, 20 May 2025 16:54:40 +0800
Message-Id: <1747731299-20448-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
References: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 08:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117488

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Added support for enterprise attestation.
- Improved handling of invalid key handles in U2F key lookup
- Fixed issue where storing small CTAP 2.1 largeBlobs failed
- Fixed APDU chaining issues for certain authenticators
- Improved documentation and examples.
- New API calls:
  fido_cred_entattest;
  fido_cred_set_entattest.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libfido2/{libfido2_1.15.0.bb => libfido2_1.16.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libfido2/{libfido2_1.15.0.bb => libfido2_1.16.0.bb} (90%)

diff --git a/meta-oe/recipes-support/libfido2/libfido2_1.15.0.bb b/meta-oe/recipes-support/libfido2/libfido2_1.16.0.bb
similarity index 90%
rename from meta-oe/recipes-support/libfido2/libfido2_1.15.0.bb
rename to meta-oe/recipes-support/libfido2/libfido2_1.16.0.bb
index 74844855d9..09d34603d6 100644
--- a/meta-oe/recipes-support/libfido2/libfido2_1.15.0.bb
+++ b/meta-oe/recipes-support/libfido2/libfido2_1.16.0.bb
@@ -10,7 +10,7 @@ DEPENDS = "libcbor openssl zlib udev"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20be19aaa222f71738712b26f7f8717b"
 
 SRC_URI = "https://developers.yubico.com/${BPN}/Releases/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "abaab1318d21d262ece416fb8a7132fa9374bda89f6fa52b86a98a2f5712b61e"
+SRC_URI[sha256sum] = "8c2b6fb279b5b42e9ac92ade71832e485852647b53607c43baaafbbcecea04e4"
 
 inherit cmake pkgconfig manpages
 
-- 
2.43.0


