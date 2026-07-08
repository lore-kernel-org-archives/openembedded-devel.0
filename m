Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE6F8C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:45:51 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4723.1783503941569259008
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:45:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PcFjxPED;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503943; x=1815039943;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Myqn1PANGdmBXrB4MwKKLZXsVK+0vllRhIjZASyxxis=;
  b=PcFjxPEDTnWXfbuuXWDpQzkByzIFLYnutbNSAlP5qslgTljOqa8bEfc6
   q9QN2y2S+a+37mBl+tQZb2MmI/uu0+4adUi248l1AiDFbJuuAwpuzQ9Z/
   uDRz5CYr1EC6SjEUA0/1ZK3LiOYyJAyH1puBqu350wPNxyc3xa2wcrkGP
   e4J4CLbP0W1aLmAqcGOCvjOKLsWVAyLT+dXFNUK8VXBAepY7d7XL63aev
   MlKbdghSuN9vOIhvtrCRyaewGnX6MJt60DHQMdaRCZMLaik2zzL8UDeCW
   PGzXQsZJzhxgxqEp/R5/LJ7VCfshZzE/IDgL/T6V/1SkqI4uOq7hvdwBh
   Q==;
X-CSE-ConnectionGUID: vuLK7E7ATmWfeJ6kWgcp6g==
X-CSE-MsgGUID: nVYU5+lpS6ycHJBYASwg7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="244842974"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="244842974"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:45:42 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 09BD6C00414
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:40 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id B3C9014042D1
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:39 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id D537A1800C26;
	Wed,  8 Jul 2026 09:45:37 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/37] python3-bumble: upgrade 0.0.230 -> 0.0.231
Date: Wed,  8 Jul 2026 17:44:26 +0800
Message-ID: <20260708094508.2060-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:45:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128087

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bumble_0.0.230.bb => python3-bumble_0.0.231.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bumble_0.0.230.bb => python3-bumble_0.0.231.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-bumble_0.0.230.bb b/meta-python/recipes-devtools/python/python3-bumble_0.0.231.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-bumble_0.0.230.bb
rename to meta-python/recipes-devtools/python/python3-bumble_0.0.231.bb
index a42478f9a0..768b204de9 100644
--- a/meta-python/recipes-devtools/python/python3-bumble_0.0.230.bb
+++ b/meta-python/recipes-devtools/python/python3-bumble_0.0.231.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/google/bumble"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a775f1b11285b6abedd76748d176125"
 
-SRC_URI[sha256sum] = "1064d45e8370fc2b1bb684c0efd59534407ea16c3a2811985ed50a886fa3b674"
+SRC_URI[sha256sum] = "43bd0ba5830d74ded82a369b535d2d98a8b2a41945540b1fe874bb14259dc5a2"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


