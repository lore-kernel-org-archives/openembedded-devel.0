Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C21C88CB5
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 09:55:09 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.31373.1753869308938792788
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 02:55:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nkVK1Dnh;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753869310; x=1785405310;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UlTVmVb4ELyMu1Yc/0qaiYr44wxt+vS5yi71NhyUa1s=;
  b=nkVK1DnhTKsKtetFx4XieVRRjfNOkiBjo/PB7pImsNZOgL1pdQlRA9cy
   OekfCr6/Gvg9aZy8vwCw7uSCUmFjl3JQYTNyF1HBwXPy5iAouuo9GKt4P
   Z5+sa98HTGmYOOXhz7GJUDFGHX4CLpagGmWNxwa+lLyh8fgAFprMDFrny
   LSlJJ1UqxCxpVwz5xBO2SINCmWlwrqMwVxg9kE84M2VfJ0HgczvLQ21l+
   4DPhdSScC6rLlUwWVT73moZ9WIgpAAqjyyiL5Eq4IA+pHrZsLgdMysLlb
   T1kWC3ew0GGL8q9D33ujGr6pVcDITdkuAqHRw/vBCuAhG3b/dkeRbhn0Y
   Q==;
X-CSE-ConnectionGUID: lDVCdNKCR0a95EqZjGJVSQ==
X-CSE-MsgGUID: frb1EUWXSvKXqS0rD3cAdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="207893424"
X-IronPort-AV: E=Sophos;i="6.16,350,1744038000"; 
   d="scan'208";a="207893424"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 18:55:08 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 5FBD41C00085
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:07 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id C04DCC01EEE
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EECBB1A00A0;
	Wed, 30 Jul 2025 17:55:02 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/40] libxml++-5.0: upgrade 5.0.1 -> 5.4.0
Date: Wed, 30 Jul 2025 17:54:28 +0800
Message-ID: <20250730095456.695-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730095456.695-1-wangmy@fujitsu.com>
References: <20250730095456.695-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118779

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libxml/{libxml++-5.0_5.0.1.bb => libxml++-5.0_5.4.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/libxml/{libxml++-5.0_5.0.1.bb => libxml++-5.0_5.4.0.bb} (86%)

diff --git a/meta-oe/recipes-core/libxml/libxml++-5.0_5.0.1.bb b/meta-oe/recipes-core/libxml/libxml++-5.0_5.4.0.bb
similarity index 86%
rename from meta-oe/recipes-core/libxml/libxml++-5.0_5.0.1.bb
rename to meta-oe/recipes-core/libxml/libxml++-5.0_5.4.0.bb
index 58c2697b9a..e4fdac2c2c 100644
--- a/meta-oe/recipes-core/libxml/libxml++-5.0_5.0.1.bb
+++ b/meta-oe/recipes-core/libxml/libxml++-5.0_5.4.0.bb
@@ -13,7 +13,7 @@ inherit gnomebase ptest
 
 S = "${UNPACKDIR}/libxml++-${PV}"
 
-SRC_URI[archive.sha256sum] = "15c38307a964fa6199f4da6683a599eb7e63cc89198545b36349b87cf9aa0098"
+SRC_URI[archive.sha256sum] = "e9a23c436686a94698d2138e6bcbaf849121d63bfa0f50dc34fefbfd79566848"
 
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


