Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F3ACC54F54
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:07:31 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5787.1785218847284870318
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dJTsZZec;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218848; x=1816754848;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=G28dTB+/BfG/1YdZN18VymkVqo1VmgESFyaRh9EYcAo=;
  b=dJTsZZeczsZxj5azcXFFPqv8MTQ4/yczly9rx5ukjql0blfO0Ls51+uw
   2icMReAjlI2llKDmgCmKTeAYK3jJMGuPEe3h80VPUHqPRH/s+e+ghupLl
   YHl6FXFjfKp9iFH4kv1FMoaMgAAEi0G9dyQuP/zbl/P/C0y9TA1GC0W97
   pXFSbeeECl4vAr+hyJNI1LBTPX0R6M424GCB50A5bwpUcRLlqiwWU3hTQ
   2M9qcMsoffKlcefmHiACFQe5mMmmisUE5ZKXZd8kn6ZWN0zexpLmokJXt
   UyyI3PViIATJ9ywEJAIf37YxDWQzRDKhxJwG425oz6deotrBCLUT21FM9
   A==;
X-CSE-ConnectionGUID: znYKq8WUReqjso3J0fysTg==
X-CSE-MsgGUID: kGZlyxitSCmkgbyT5xXQuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="248766239"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="248766239"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:07:26 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 9A91A820096
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:25 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 5553EC00767
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:25 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id AFEBE10005F4
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:23 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-typeguard: upgrade 4.5.2 -> 4.6.0
Date: Tue, 28 Jul 2026 14:06:41 +0800
Message-ID: <20260728060645.819-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060645.819-1-wangmy@fujitsu.com>
References: <20260728060645.819-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128498

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-typeguard_4.5.2.bb => python3-typeguard_4.6.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typeguard_4.5.2.bb => python3-typeguard_4.6.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_4.5.2.bb b/meta-python/recipes-devtools/python/python3-typeguard_4.6.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-typeguard_4.5.2.bb
rename to meta-python/recipes-devtools/python/python3-typeguard_4.6.0.bb
index 0ea613ef11..746ea20fb6 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_4.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_4.6.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/typeguard/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
 
-SRC_URI[sha256sum] = "5a16dcac23502039299c97c8941651bc33d7ea8cc4b2f7d6bbb1b528f6eea423"
+SRC_URI[sha256sum] = "e7414f09111317de3e335de92cd397c5c0ca00b1cc1676de12e1d444a79b3f21"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


