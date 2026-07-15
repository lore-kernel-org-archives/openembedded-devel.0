Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46072C44513
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:32 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3449.1784112024848809544
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ANFkmLn/;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784112031; x=1815648031;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dogGte9oUAJkMmKxXwT8d0Ov9c3C59pjASo6eLlv5eY=;
  b=ANFkmLn/sd2rAkfq1PgMDIQLyTdeSeEUOB+HiqfaTd9qLGnoaIj+Kp5I
   Um6UCFdTznuFPuIHbiqr86we7Ofd74LLRpTYOkXPuwvgNPI7S2PB+weMp
   D9HvW5uJrON7nl/WnQJXnbSRknp6T3exfxNB+tpe2HjjN0X6ne/cmNyuH
   XIy2HbvPNuGqqqpd+d1uOiKIvLyOpJPxN/T3gzGAh27qzf+BFoG52VGtr
   /ENEZuzevas0Kliln64upJyusyeqltcvtg5E+RpcMRPUPa0nIUbAjjuHX
   85dk9e36VOcdLmyPVfI3JBlUi8/hZUI2GIIAQVQanQLyW26Soj+l2eGKS
   w==;
X-CSE-ConnectionGUID: ABx0rHI4R/OWqQCZkgRDcQ==
X-CSE-MsgGUID: 7wT6i0u/QQCSV4tejqPJmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="225218951"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="225218951"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:40:31 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 2E3DF3D1B
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:31 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id CD3F31C0014F
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id D30DA1802734;
	Wed, 15 Jul 2026 10:40:28 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 35/44] wireshark: upgrade 4.6.6 -> 4.6.7
Date: Wed, 15 Jul 2026 18:39:05 +0800
Message-ID: <20260715103914.2120-35-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128208

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wireshark/{wireshark_4.6.6.bb => wireshark_4.6.7.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.6.6.bb => wireshark_4.6.7.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.6.6.bb b/meta-networking/recipes-support/wireshark/wireshark_4.6.7.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_4.6.6.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.6.7.bb
index 232cb2058b..7eacd4d3db 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.6.6.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.6.7.bb
@@ -31,7 +31,7 @@ SRC_URI:append:class-native = " file://0001-don-t-look-for-iconv.h-for-native-bu
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src/all-versions"
 
-SRC_URI[sha256sum] = "27e7ff780cd68a7466082be82ca26c06a002e74a71646ef3a6e4683e444c1a86"
+SRC_URI[sha256sum] = "242929b8c10ba89a8d3bcad7ff2eba8effb648d30f48e270d2e5e6ff94d88613"
 
 PE = "1"
 
-- 
2.43.0


