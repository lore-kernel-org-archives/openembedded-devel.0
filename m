Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF59EC5DF86
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:00 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3263.1787132153091652989
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:35:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=g8ZzwkbP;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132157; x=1818668157;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2VGl0b8ouwW2TcsNEWpGs5GhLh3M47Zaddy3JQIUjGw=;
  b=g8ZzwkbPzmP2LpBONK5Qb44qFvC3vCuP2Z0LrW+CfmnhWpIQKcTXWMzl
   0NQ4OfOD/39+lZxi8Q0NXvbfwpSpYVl7sD5JqLYu91GRzhL9dMYU/dBny
   ayBoMLrYhBL/68DlCtwJ0Qxl2tipaEtQpQhrLEJWFiRWiRWedqdG5893c
   CeozZol844GayLBvTSMqaZ261j3uP7rFomZhtor0eekdFQJWMN3C6BLUp
   lBVpyZpIAEL2BrE4w3JVIyNSb7NOQTne1dH11JF6PPLcqiqOqH4p23Wbd
   GA1ccIYkkpcQsjBeZ0ZEsvNqMSo371gYiL5yTOLL0Q9OePE3wezuOVvPo
   A==;
X-CSE-ConnectionGUID: MbPbh1g6RsK95CL4Jom+RQ==
X-CSE-MsgGUID: VwGxP6LKSlWeyJpHxgpj0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="251357011"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="251357011"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:35:55 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 78AE31C1C71A
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:51 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 339DE148AD36
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 3BD4B1801C0F;
	Wed, 19 Aug 2026 09:35:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/70] python3-argcomplete: upgrade 3.7.1 -> 3.7.2
Date: Wed, 19 Aug 2026 17:34:22 +0800
Message-ID: <20260819093514.1101-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129288

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Require Python 3.10+

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-argcomplete_3.7.1.bb => python3-argcomplete_3.7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_3.7.1.bb => python3-argcomplete_3.7.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_3.7.1.bb b/meta-python/recipes-devtools/python/python3-argcomplete_3.7.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-argcomplete_3.7.1.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_3.7.2.bb
index eb03e039d0..eac957bb1c 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_3.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_3.7.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "6926a3a70ae70dce1f3dfb5cf1fc984278cd163e78ec18ad2ed7fa4fabd8f281"
+SRC_URI[sha256sum] = "aad8b69a0b9969edb62db0d1752354c0d50717b10e0cbb00e2a958381b9fc6b9"
 
 PYPI_PACKAGE = "argcomplete"
 
-- 
2.43.0


