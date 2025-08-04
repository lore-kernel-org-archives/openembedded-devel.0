Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69412C87FDA
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 08:34:03 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.13436.1754296434495116537
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Aug 2025 01:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=abA8G1+O;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754296435; x=1785832435;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9ggcmxergY5sPOjVSK0SLp0bEZ/y23rLPPm51rY26zw=;
  b=abA8G1+ODXQV1iHWxMaDdhpz7zLBRI+TuvrbYMkjIgUEOQIzfNoEUlrC
   NPvt620aDZrQsj4G13FZ0nPNTYHThZo7NKFXo6pLTufR9DoQybvKt9HvF
   Emw0kQJ+zxCYcOxuV6bkG77pFD+G+APhPC2Q/tAod9mkL/TDL5Ejjoq5M
   pjWKQ6IW/MBZjLQF8SMKqpCXeeF8zsoL/tkXq3PIK9ULFuBlYoxYN0oY/
   JCfegIqQkBnlNpN3NKRY9ZVnEl1PbBUPrm7BmhuzF2iKOIF8j/aeF8Q+Z
   MpGIcoCRIOTmGwiJAau4jxc4I9WvnAZeEIhaMTYl2ctzRSqsIyDOOCKiZ
   A==;
X-CSE-ConnectionGUID: F9Ea3rQoTGKO0JaC3fhU+Q==
X-CSE-MsgGUID: 5l2K965GSJK5xfHn+6/RAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="208387045"
X-IronPort-AV: E=Sophos;i="6.17,258,1747666800"; 
   d="scan'208";a="208387045"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 17:33:53 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id A347F1000346
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:33:52 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 1542D180033B
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:33:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A2DC71A0071;
	Mon,  4 Aug 2025 16:33:48 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 04/18] libnet-dns-perl: upgrade 1.51 -> 1.52
Date: Mon,  4 Aug 2025 16:33:26 +0800
Message-ID: <20250804083340.1649-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250804083340.1649-1-wangmy@fujitsu.com>
References: <20250804083340.1649-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 08:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118837

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Refactor SVCB to avoid internal use of generic keyNN.
- DELEG documentation and code improvement.
- Fix rt.cpan.org: bug in resolver base selection on non-Unix/Linux platforms

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libnet/{libnet-dns-perl_1.51.bb => libnet-dns-perl_1.52.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.51.bb => libnet-dns-perl_1.52.bb} (95%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.51.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.52.bb
similarity index 95%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.51.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.52.bb
index 48dba40a8c..d0f8141794 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.51.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.52.bb
@@ -9,7 +9,7 @@ DEPENDS += "perl"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "40eec0b2866c67b86505a1c79cbb4b131c98c0bb59f305aa48959c89093d4503"
+SRC_URI[sha256sum] = "c9884fcb08e4d03c23188d4e10836c2382fcb65b69859581a20845a3235a7203"
 
 UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.43.0


