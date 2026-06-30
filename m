Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 159C3C43327
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:23:01 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16870.1782811372984832259
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:22:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=F87Nqyhk;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811373; x=1814347373;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nfDhR7ui4WCBOmxDrHTcSpUJc3/tnjdDZdoyWRkFewE=;
  b=F87NqyhkZnu10wz0TkIK+3qJOlGmbvtstWlIisomGFbquF91kSgoX0+r
   FNhQNFrSvcq8jn7ShafeO29p+NqUemty7VOyIL2CT/2bagKJOBrDXfyNu
   79qh7v3/xwkxflH0QbzS2lvSYxw/YtUCJJEtya6GgF2gkeljK54MEKRlX
   amtUvcaxjpAErqPROn6Ugcwn587EMOSgdmAlh9S6qEWwjZHiFFZsWfzkc
   SLym/sMubZvgkqSQ73GJhHPiPHCu7lA0VjocIuVzudl3XvRyDVkUJHi77
   xeWgD9nTmc3J84BFDewsit2RqTwz0W1n5RMZAH5zwkNBSVvxSAmraHO1o
   g==;
X-CSE-ConnectionGUID: 4MywMsPMSOCNaJgbDJzkog==
X-CSE-MsgGUID: p/Al2PF3Re+lJoOf8xAgxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="245748233"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="245748233"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:22:51 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 4EFCCC01AFA
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:51 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 06C4E8493AE
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 1FDC3826FFD;
	Tue, 30 Jun 2026 09:22:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/37] python3-redis: upgrade 8.0.0 -> 8.0.1
Date: Tue, 30 Jun 2026 17:21:54 +0800
Message-ID: <20260630092206.322-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:23:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127968

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix Unix socket maintenance notification handling and tests
- Fix async cluster node connection release on write errors
- Fixed async MultiDBClient with underlying RedisCluster
- Fix hiredis readiness checks for high file descriptors
- fix(search): parse RESP3 FT.SEARCH responses with bytes-typed keys
- Fixing pubsub's listen method to be blocking.
- fix(asyncio): release pooled connection when Pipeline.reset() is cancelled
- Avoid per-check fd allocation in hiredis _socket_can_read() — use poll() instead of a per-call selector
- Updating PyJWT dependency.
- Update CI badge in README.md
- Add missing url query argument parser for ssl_min_version
- ci: least-privilege permissions on spellcheck (read) and stale-issues (job-level write for actions/stale)
- Bumping github-versions actions
- Updating lib version + supported Redis versions in README.md + updating the Redis versions in CI test matrix

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-redis_8.0.0.bb => python3-redis_8.0.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-redis_8.0.0.bb => python3-redis_8.0.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_8.0.0.bb b/meta-python/recipes-devtools/python/python3-redis_8.0.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-redis_8.0.0.bb
rename to meta-python/recipes-devtools/python/python3-redis_8.0.1.bb
index c1ecbb90e5..5278e45128 100644
--- a/meta-python/recipes-devtools/python/python3-redis_8.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_8.0.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=609ded3add9111c4c6e102f1d421d3f8"
 # Prefix archive to avoid clashing with the main redis archives
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
-SRC_URI[sha256sum] = "a00c5355432051ac14e593b8b197fc76c887ee12d55a0984f69328a1115fdc49"
+SRC_URI[sha256sum] = "afc5a7a2f5a084f5b1880dec548dd45be17db7e43c82a30d84f952aefb05cfb0"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


