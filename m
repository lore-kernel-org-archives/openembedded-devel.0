Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B15AC25B4F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 05:49:32 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.6681.1714628967124060043
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 22:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lQ8I5yqZ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1714628967; x=1746164967;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3gAzvBM/ohAwVn7jk7qYtOQdhO5TAEOp90pV1aOEfaU=;
  b=lQ8I5yqZnVswooJTB3p+opBkULBvmvFO0p/Ae9HxtucxkojSu/NhTNEk
   dM3l3RpUKJyuMPtQwpzZFHsqqUS8aSVfB2oSNxvkXjRQQuZacW/pwkqAq
   vdBTMRs9d+iSon0uP+INHTcNlMs76zoMxJl2sRwskSPkNqCl4M2phmd+r
   cWDQ2Nb6DTge2SXeh2U/BGwZ55CSwx3TKWdpfTei/2Rm+pfgjQCoJa8fX
   lyBc81vjbZ2GAd7w+YSq1WSbkCHodeeNCQBPReNy7c2GF5iI547iBRRYG
   V/c2ePtwwW/nBdtZ4uDTgib7CmZ6VXAZ/usVQFTy0TVvyJPuD9f5VjmIO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="157528896"
X-IronPort-AV: E=Sophos;i="6.07,247,1708354800"; 
   d="scan'208";a="157528896"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 14:49:24 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E7C9D7702
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:22 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 73C9F43FF3
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 103D0217354
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:21 +0900 (JST)
Received: from wangmy-QiTianM610-N000.g08.fujitsu.local (unknown [10.167.225.86])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B225B1A0002;
	Thu,  2 May 2024 13:49:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 04/30] libmodule-build-tiny-perl: upgrade 0.047 -> 0.048
Date: Thu,  2 May 2024 10:48:03 -0400
Message-Id: <20240502144829.241208-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502144829.241208-1-wangmy@fujitsu.com>
References: <20240502144829.241208-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28356.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28356.005
X-TMASE-Result: 10-0.854400-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRtV4BnlVId1nZsoi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62SBoMr99c/mA0zuO0yjV9iKrB/umKaO53WMyrl+Pm59TVnNR
	RDoj6wl11iEf2qPeFOtzKapIj3XJLi9RBwNs081AvaicrXUcnYwGC8e6520fKw0PJt06oJaHpaQ
	l5xviY7wxgWdRvK9Un9g+oMf9KM6Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 05:49:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110215

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 - Implement dynamic prerequisites

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ld-tiny-perl_0.047.bb => libmodule-build-tiny-perl_0.048.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libmodule/{libmodule-build-tiny-perl_0.047.bb => libmodule-build-tiny-perl_0.048.bb} (95%)

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.047.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb
similarity index 95%
rename from meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.047.bb
rename to meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb
index db765b88f..860185007 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.047.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2b9e8b5e2bd19fcc97ac84b78a271a64"
 DEPENDS = "libextutils-config-perl-native libextutils-helpers-perl-native libextutils-installpaths-perl-native"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-Tiny-${PV}.tar.gz"
-SRC_URI[sha256sum] = "71260e9421b93c33dd1b3e7d0cf15f759c0ca7c753fa840279ec3be70f8f8c9d"
+SRC_URI[sha256sum] = "79a73e506fb7badabdf79137a45c6c5027daaf6f9ac3dcfb9d4ffcce92eb36bd"
 
 S = "${WORKDIR}/Module-Build-Tiny-${PV}"
 
-- 
2.34.1


