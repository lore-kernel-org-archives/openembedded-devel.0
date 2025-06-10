Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 138F0C71132
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:34:02 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.78446.1749526440980418683
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=T2aDNxo9;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526441; x=1781062441;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qW8Yf4WU5zuwG/FT3ChihRqf68Gh4XbIVYvsj0Pq64o=;
  b=T2aDNxo9RMILEbv7YJlQcVkrXGfFZTMVItSJiVCbW7Yx1gLWjnZj6Xpl
   NjD/RxOzEmloCObUxb4w1GboBgdRJYZALPrB8XFtGe7wDJ9BMftVAyGfe
   cveWS2sNau7/SxuEq7wcdR96hQ009tBkgrWkKDn0WN0OHpNkB0+wj5qak
   yuEHif+PLSURC8aoXWjlUHF9aRKMyADze0NXq8WvYSUfhSLLWajXVccWv
   I6K5b8cWQERgqr23Kapv3Z85IVGQ405JPi3qyP8D+tue4GKCs7ym/IFsj
   xcagz4LV5d/fitCCGrlA5qxe7PX5scwsvsXOkE+kfaEOF9R63SIlyTEnq
   g==;
X-CSE-ConnectionGUID: WQvWwMIGS8CDteBErYWAKw==
X-CSE-MsgGUID: BqcMektlQ5OxDCTGkN7X8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="201453638"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="201453638"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:34:00 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A622ED6FBC
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 55F26D5068
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:57 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D359D1A0071;
	Tue, 10 Jun 2025 11:33:56 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 62/64] valijson: upgrade 1.0.5 -> 1.0.6
Date: Tue, 10 Jun 2025 11:33:28 +0800
Message-ID: <20250610033330.924-62-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117852

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../valijson/{valijson_1.0.5.bb => valijson_1.0.6.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/valijson/{valijson_1.0.5.bb => valijson_1.0.6.bb} (93%)

diff --git a/meta-oe/recipes-devtools/valijson/valijson_1.0.5.bb b/meta-oe/recipes-devtools/valijson/valijson_1.0.6.bb
similarity index 93%
rename from meta-oe/recipes-devtools/valijson/valijson_1.0.5.bb
rename to meta-oe/recipes-devtools/valijson/valijson_1.0.6.bb
index 9661d57e2f..7f5d0b1416 100644
--- a/meta-oe/recipes-devtools/valijson/valijson_1.0.5.bb
+++ b/meta-oe/recipes-devtools/valijson/valijson_1.0.6.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5c4583a434195e4f3b418e17c8ca2daf"
 
 SRC_URI = "git://github.com/tristanpenman/valijson.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "8b320f25676030ba13fb90c1bf06133df2628086"
+SRCREV = "4edda758546436462da479bb8c8514f8a95c35ad"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


