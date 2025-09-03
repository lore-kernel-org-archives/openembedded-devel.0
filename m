Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BACAECA1017
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:03:39 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.8054.1756890211646765979
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fEDEiAkx;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890211; x=1788426211;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KkR+hupKdc2sY4SvkjQD25iQW6l0hLGoIziMcvWY7F0=;
  b=fEDEiAkxWEhiMxaJdS4f8zEQ6+ZKGg4Xsd6sQ5SbrU8u4YU8Tl3s9NYP
   w81qNbrDcmak9pZcRJv0OD5wMLSC2ny1Qi6acxY92z7wQIkLQyKgaTahp
   IJTvgIV4JlH8JnMLtQ9qTVnxnLGrG0KoTSDofJppejSEtAgFTfnYXKkmv
   CKmw4NDri+tBF+Yl3ZEn3Qo5CgBEV792EbEL5+jrLWIPomra0FduVPItN
   EmBu2lp15PnVZ/luyY7DDjFH181YNWBb6Soiv5DX0CUV/eNFJx6xTsLFI
   tAdb712SGfhvi9SyYiZNmNeBnIRsp0G1kjjGKbWS2tjpnI8fEymp74zT+
   Q==;
X-CSE-ConnectionGUID: 1tXJ2ExhTV6ywb8++wHkZQ==
X-CSE-MsgGUID: xn4McrLzQSmiwiNQhWgiNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="190432343"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="190432343"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:29 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id CB06A1565
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:29 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 84115C0C864
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:29 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id 781DD2004FBA
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:27 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6870D1A0087;
	Wed,  3 Sep 2025 17:03:23 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 08/56] fping: upgrade 5.3 -> 5.4
Date: Wed,  3 Sep 2025 17:02:29 +0800
Message-ID: <20250903090317.2002-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119209

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Memory allocation safety checks for event storage (thanks David.A for bug report)
- Fix off-by-one boundary check in seqmap code
- The minimum value for the period (-p flag) is now 0.001 milliseconds,
  since it probably never makes sense to use a smaller value, and to avoid doing
  a very large memory allocation for event storage.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/fping/{fping_5.3.bb => fping_5.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/fping/{fping_5.3.bb => fping_5.4.bb} (92%)

diff --git a/meta-networking/recipes-support/fping/fping_5.3.bb b/meta-networking/recipes-support/fping/fping_5.4.bb
similarity index 92%
rename from meta-networking/recipes-support/fping/fping_5.3.bb
rename to meta-networking/recipes-support/fping/fping_5.4.bb
index 5f3ec67cfc..c4b1a5ad25 100644
--- a/meta-networking/recipes-support/fping/fping_5.3.bb
+++ b/meta-networking/recipes-support/fping/fping_5.4.bb
@@ -15,7 +15,7 @@ NO_GENERIC_LICENSE[fping] = "COPYING"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c6170fbadddfcd74f011515291d96901"
 
 SRC_URI = "http://www.fping.org/dist/fping-${PV}.tar.gz"
-SRC_URI[sha256sum] = "d57bd0141aea082e3adfc198bfc3db5dfd12a7014c7c2655e97f61cd54901d0e"
+SRC_URI[sha256sum] = "be320771f075e47dd7e5704b485e9bdc7dd11107884345c0f7c18749357f668d"
 
 S = "${UNPACKDIR}/fping-${PV}"
 
-- 
2.43.0


