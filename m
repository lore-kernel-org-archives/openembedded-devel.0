Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BBBBCD6E47
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:44 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16810.1779875381755207942
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:49:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IF+84mpd;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875383; x=1811411383;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NZbTxq2G084jDko+NEZ9F5HYvLHCJw0BRu1c06JEB1c=;
  b=IF+84mpd8MmzByqBxFhMWKGoEMXnvM2bA498C70Hc23txyzzdbMiavl+
   15fzLfQe7k8XJia5LCKpcLGxHHvCZtfn0FK6hd4EKZTJOElJfL5n62hbB
   FPkhQbHPQ47zE2SmXnyRzmVD6Zd05H3CR1T2Ocipz1O617flrtNcEbmaK
   i3i33dCQlCr5Phjhcqv3zhwN+h9QI/LKBpHG7bpWDVQ9SeFQi+MOYicuG
   W149CMLuhuig652Q/nGIPFE5KXYVzVanj1ce6QxxVkzKw9WvjYb54vCBe
   hGQ2Nb315f8hukGCdhymNIm8TeWVMeN6ZHZH6Fb8RQ9GCogcEPVIGhohO
   w==;
X-CSE-ConnectionGUID: i583Q6zJS1iJv3NwONm99Q==
X-CSE-MsgGUID: hKo/alTJSNmeCpVFNnW80g==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="241969862"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="241969862"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:49:41 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 334D11002801
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:40 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id DD80B1410CB1
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:39 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id DA0A982A2C9;
	Wed, 27 May 2026 09:49:37 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 50/56] python3-yarl: upgrade 1.23.0 -> 1.24.2
Date: Wed, 27 May 2026 17:47:59 +0800
Message-ID: <20260527094805.2039-50-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127257

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-yarl_1.23.0.bb => python3-yarl_1.24.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-yarl_1.23.0.bb => python3-yarl_1.24.2.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.23.0.bb b/meta-python/recipes-devtools/python/python3-yarl_1.24.2.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-yarl_1.23.0.bb
rename to meta-python/recipes-devtools/python/python3-yarl_1.24.2.bb
index 6a973f9acb..4f6e4795b7 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.23.0.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.24.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/yarl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "53b1ea6ca88ebd4420379c330aea57e258408dd0df9af0992e5de2078dc9f5d5"
+SRC_URI[sha256sum] = "9ac374123c6fd7abf64d1fec93962b0bd4ee2c19751755a762a72dd96c0378f8"
 
 PYPI_PACKAGE = "yarl"
 
-- 
2.43.0


