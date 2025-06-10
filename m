Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A95C7113D
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:51 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.78434.1749526426994854912
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tGvTlXOQ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526427; x=1781062427;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CYGqEh1TXf2e66mS9xn7uQWdOncwFB+5asisntxRWLs=;
  b=tGvTlXOQeFL6r9U4HF8DBcsm/JcdhqlTJSqIyPzidrKoO5f0FuhOHJkp
   MlHfs/ipwscWv/SNea0Zo2mYhJVW9KLOM6ag3oZyCsKJmUBktYuNtt0SC
   P3USPT/7B8nTuRhaqwZ0uIeDH7T8NwC4AY/OwewSt5OIaFBSM7z14B3+4
   KJkpAiFeDC2gNMBNlgtR/V3YoaxZ4u8jdVo9SzIBGlle62riDZYq+oG+i
   E/jmlMypij2VlGq+fvPvpkKGwspNbLhmwP9kuZkBPW0ANuOo/EDxGD3yH
   LEpcbDvM+UpNALTAewXvNp3eW9JcFmUYpVDhTNM6umXwXml5tp1VdBKe9
   A==;
X-CSE-ConnectionGUID: V+y2SGpiSH25WR+QCQRH3Q==
X-CSE-MsgGUID: m8Ci6D2NR/Wxaomd51mkjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="190662467"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="190662467"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:45 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7BEDDD5051
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:43 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2764DD5068
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:43 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A04E61A009A;
	Tue, 10 Jun 2025 11:33:42 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 24/64] nss: upgrade 3.111 -> 3.112
Date: Tue, 10 Jun 2025 11:32:50 +0800
Message-ID: <20250610033330.924-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117812

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/nss/{nss_3.111.bb => nss_3.112.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nss/{nss_3.111.bb => nss_3.112.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss_3.111.bb b/meta-oe/recipes-support/nss/nss_3.112.bb
similarity index 99%
rename from meta-oe/recipes-support/nss/nss_3.111.bb
rename to meta-oe/recipes-support/nss/nss_3.112.bb
index b101ae989b..cf0b20d48b 100644
--- a/meta-oe/recipes-support/nss/nss_3.111.bb
+++ b/meta-oe/recipes-support/nss/nss_3.112.bb
@@ -33,7 +33,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/$
            file://0006-Fix-nss-multilib-build-on-openSUSE-11.x-32bit.patch \
            file://0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "5a4d5a44e91ef03cdc0c4897cf616e3c92f4e590ea835d3e0ccad8b005bd73c6"
+SRC_URI[sha256sum] = "33ae72d43b275957252adc8639e84229d3ae692a57b6191b059d9456b8568a68"
 
 UPSTREAM_CHECK_URI = "https://ftp.mozilla.org/pub/security/nss/releases/"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>\d+(\_\d+)+)"
-- 
2.43.0


