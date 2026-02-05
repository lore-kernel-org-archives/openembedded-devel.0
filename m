Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC229E83F06
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 05:16:57 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14303.1770268608233277516
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 21:16:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KAK4XIot;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770268607; x=1801804607;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KXpR5xw67eZ8drIFejNJYnAOPMkk+U3qQJH9m0pdjv4=;
  b=KAK4XIotHSOhFpxu60KfIiOsl2EqeWh1/jgwPx1CHY5BVzrH9SxQa/Uh
   c+1InNKdlFPCRVsIlDBqzNpjg76LHd2jUO6huqEeeO1/nN5Qw9YXnrgnH
   r+gK/Cdf7Q9UAQVo25kVTr2ElkWPVjX5F10+vQWWSrA4VnRfBSjRx+I4p
   9lHx1DPYWGb7bj3U6ddQR7/scHqckl1mfqzc7etjiv5x8j9U8BIHXqmSF
   Zzij+IVQJeUp433DaXglQ4BHeRCeYSje41h8b4HYtsMKnxgW75IA2ow8U
   h9ltzUIZ2U0bELjYYQjoaKvYKAI8dnJCT3A8jzr/6X3o2X0+1BVrJUQIQ
   Q==;
X-CSE-ConnectionGUID: VDHGCH3ZSM2OJXKkp1+uYA==
X-CSE-MsgGUID: 8D9J2/m0TGOEU8bZZAbwew==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="228615035"
X-IronPort-AV: E=Sophos;i="6.21,274,1763391600"; 
   d="scan'208";a="228615035"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 14:16:45 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.fujitsu.com (Postfix) with ESMTPS id A73621000373
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:16:46 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 5A9801004151
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:16:46 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id CB92720000C6;
	Thu,  5 Feb 2026 05:16:43 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/24] python3-tqdm: upgrade 4.67.1 -> 4.67.2
Date: Thu,  5 Feb 2026 13:14:31 +0800
Message-ID: <20260205051435.1366-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260205051435.1366-1-wangmy@fujitsu.com>
References: <20260205051435.1366-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 05:16:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124173

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tqdm_4.67.1.bb => python3-tqdm_4.67.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.67.1.bb => python3-tqdm_4.67.2.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.67.1.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.67.2.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.67.1.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.67.2.bb
index b768ede830..f5ee2d3e4c 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.67.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.67.2.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://tqdm.github.io/"
 SECTION = "devel/python"
 
 LICENSE = "MIT & MPL-2.0"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=42dfa9e8c616dbc295df3f58d756b2a1"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=9a9bed097dea538bf341c8623c8f8852"
 
-SRC_URI[sha256sum] = "f8aef9c52c08c13a65f30ea34f4e5aac3fd1a34959879d7e59e63027286627f2"
+SRC_URI[sha256sum] = "649aac53964b2cb8dec76a14b405a4c0d13612cb8933aae547dd144eacc99653"
 
 CVE_PRODUCT = "tqdm"
 
-- 
2.43.0


