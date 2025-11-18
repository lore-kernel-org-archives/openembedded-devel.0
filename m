Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21CA3CEBF92
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:09:39 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8411.1763456971054138096
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 01:09:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=M56rb44G;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763456975; x=1794992975;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T+LEuYo9rKC1+HtN1uXMBkN2W9c66KsgDmRQkyW7dhI=;
  b=M56rb44GUc16pLg17RCaQIyRCqjbSRsUvpQsZCh/gCwvi1X+L930kwOy
   INqNJt5SAHEi1FdpWfKpso8Qatze+otQHX1QMvKf3dJdPBykec+d0FnUf
   7c2BuFS6IKyGX29AYyKa4sgauO9FxaBpR4ZCnku+T72/N6CCxLm62ixI2
   kelK4uZ4O11UQPP0PtSi6LYDC85Nf+2BHcIjf0krxLi2LqNlxLdWQsJeX
   vwB2M/IQ6dsE4NBkoR+OJjUPETxg7Sr7VberZuzveZSXRpZKdW9L3FLWa
   po/+m5Pd2B+Qi//aOfi0+elV6qgFs+jhFz7ATbZUdJaEc6esRZf/QFgzg
   w==;
X-CSE-ConnectionGUID: 6BoNIus7QoC0Q6tDGxzZBw==
X-CSE-MsgGUID: z7ASPvMBRRejKphPL5PZZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="198586337"
X-IronPort-AV: E=Sophos;i="6.19,314,1754924400"; 
   d="scan'208";a="198586337"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:09:34 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 995B782043B
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:34 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 4E727140035C
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id E4C98140027A;
	Tue, 18 Nov 2025 09:09:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/29] python3-snagboot: upgrade 2.4 -> 2.5
Date: Tue, 18 Nov 2025 17:08:42 +0800
Message-ID: <20251118090846.1484-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251118090846.1484-1-wangmy@fujitsu.com>
References: <20251118090846.1484-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121836

From: Wang Mingyu <wangmy@fujitsu.com>

- snagrecover:
    add support for bcm2711/12 platforms
    add support for several AMLogic platforms
    add support for AM654x platforms
    confirm Allwinner A133 support

- snagfactory:
    allow changing target device mid-pipeline
    tone down UI colors, increase button sizes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-snagboot_2.4.bb => python3-snagboot_2.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-snagboot_2.4.bb => python3-snagboot_2.5.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-snagboot_2.4.bb b/meta-python/recipes-devtools/python/python3-snagboot_2.5.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-snagboot_2.4.bb
rename to meta-python/recipes-devtools/python/python3-snagboot_2.5.bb
index 9c6c776685..fe496ffc2f 100644
--- a/meta-python/recipes-devtools/python/python3-snagboot_2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-snagboot_2.5.bb
@@ -3,7 +3,7 @@ SUMMARY = "Snagboot intends to be an open-source replacement vendor-specific too
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI[sha256sum] = "651e9bcc2e43d3fc67cc1cff5b812e3bfb4ed132f4fd7fc1dc5e3fea31a7406d"
+SRC_URI[sha256sum] = "64d114f743cf4d892a63bc35d6af45958e569030881154f9f2ffeac13cf9b664"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


