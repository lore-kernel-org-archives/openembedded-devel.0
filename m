Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB17C44503
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:45:52 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4724.1783503943302703297
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lvspO8Do;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503944; x=1815039944;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vq84P6BPgvjOst+88bNUJXv8IRCd54Y2FfOk/9SRvRE=;
  b=lvspO8DowUsHGBghBTcPi8tkG9TDz33uPoniJ+VlL40rQsJi9g0JKp54
   mQXOR36GaiNjb0U2IrLd26XuO7nRhCNolgWybxxBtMuo1tvh3mzn6prde
   l9dbO7nlUvUwAJfc9oIPbubPLKf+mn0Iiuv1GQOnEdElSocbndXhPZ8Hd
   64hNVcLDDqMpk61x1mhasNtua0nv93Il4G0dKN2L2nLm2Ll1N75j6iaWq
   bCD5kBoEPhuG59sIZwZZSPP66KK+mWXFi2fHOU/9OLxRLEyNwENKyVHuQ
   yyuw4/d1I9dNFudpdVeiCDA1Q6fDgycoz72K1WnhUYmk9lDLaJAMksSNw
   g==;
X-CSE-ConnectionGUID: TtLpa7Z+SSSo4AoWFzRKiA==
X-CSE-MsgGUID: O5BETgxUQLqbq2CeFj+hRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="246699896"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="246699896"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:45:43 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 3D1B63F6
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:43 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id E579C100D22F
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:42 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 03B451801133;
	Wed,  8 Jul 2026 09:45:40 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/37] python3-discovery: upgrade 1.4.2 -> 1.4.3
Date: Wed,  8 Jul 2026 17:44:28 +0800
Message-ID: <20260708094508.2060-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:45:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128089

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-discovery_1.4.2.bb => python3-discovery_1.4.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-discovery_1.4.2.bb => python3-discovery_1.4.3.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-discovery_1.4.2.bb b/meta-python/recipes-devtools/python/python3-discovery_1.4.3.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-discovery_1.4.2.bb
rename to meta-python/recipes-devtools/python/python3-discovery_1.4.3.bb
index 1878829d24..05920f16a5 100644
--- a/meta-python/recipes-devtools/python/python3-discovery_1.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-discovery_1.4.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
 PYPI_PACKAGE = "python_discovery"
 
-SRC_URI[sha256sum] = "8f3746c4b4968d22afbb97d36e1a0e5b66e6c0f297290f2e95f05b9b8bf18690"
+SRC_URI[sha256sum] = "ad57d7045a862460d4a235986c33f13ed707d3aeb9153fa47eb7dfd0d4673289"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


