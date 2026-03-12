Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60CAD103E30E
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:52:56 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18745.1773312764976245957
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KbSO6aew;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312768; x=1804848768;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vRMWrxN8j8IzTGF1Q6mmQkrhCKVESGwUIjRzHGBi59c=;
  b=KbSO6aewBtruseEMIzX3YLCgYlM2BE0SZhBa+04wtBDeqmUUiiz3VqY8
   NZNYiB1cRFqJE/6WpzmtVTF6AokzZAkAo0vXA6gi3ULwmNGe8WrmKFdRJ
   TBF7zw8s+F2yi4TMytxvwjy1BlIRel1JEYYgxxJYt2Xk9+TRG5+SEQStX
   g7hlxgYo0BuEO+k+WfQzy6x3c+l71klveTXWQZY1UksuIE2qClqUg5D1t
   S7dyFnA+WrrcY5sJeqhwUKjzSyhcC4wAJwWU3H+wBfl7qiIP250QyeBkJ
   7+m/YT/TCFOXdJ79Qg1/wIIu2b3Fqn+d6e4U7mmgjOXuxadCqwP6NIimV
   w==;
X-CSE-ConnectionGUID: DRYNwvptT32OFEG8ZF9sXA==
X-CSE-MsgGUID: bEtw3nLMTO2+ToEpONpajg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="232954147"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="232954147"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:52:48 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id AB3B71002B93
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:47 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 5DBF0180A33B
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 6931F18005BE;
	Thu, 12 Mar 2026 10:52:44 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/64] jasper: upgrade 4.2.8 -> 4.2.9
Date: Thu, 12 Mar 2026 18:51:26 +0800
Message-ID: <20260312105220.1856-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125110

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Fixed a bug in the JP2 encoder that caused incorrect handling of
  opacity components in some cases.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../jasper/{jasper_4.2.8.bb => jasper_4.2.9.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/jasper/{jasper_4.2.8.bb => jasper_4.2.9.bb} (92%)

diff --git a/meta-oe/recipes-graphics/jasper/jasper_4.2.8.bb b/meta-oe/recipes-graphics/jasper/jasper_4.2.9.bb
similarity index 92%
rename from meta-oe/recipes-graphics/jasper/jasper_4.2.8.bb
rename to meta-oe/recipes-graphics/jasper/jasper_4.2.9.bb
index e00b56ddbf..b48fff7081 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_4.2.8.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_4.2.9.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a80440d1d8f17d041c71c7271d6e06eb"
 
 SRC_URI = "https://github.com/jasper-software/${BPN}/releases/download/version-${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "98058a94fbff57ec6e31dcaec37290589de0ba6f47c966f92654681a56c71fae"
+SRC_URI[sha256sum] = "f71cf643937a5fcaedcfeb30a22ba406912948ad4413148214df280afc425454"
 
 UPSTREAM_CHECK_URI = "https://github.com/jasper-software/jasper/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/version-(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


