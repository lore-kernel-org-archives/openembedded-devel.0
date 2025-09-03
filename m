Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB07CA1009
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:03:50 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.8057.1756890228384009348
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mlq/obHR;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890229; x=1788426229;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fzxiu7s/sp6rgSTKNl+xypAzd7dnl3PM8Uarbrhwh9Y=;
  b=mlq/obHRYfjzox4TXM7IUaE7T7E5iHJ0G6iF40kR8YIQ71AOx7m6ZujS
   a+NI40+Yb1ovCyIMKMlKhEC1nTegB+9/5/gXJ5gDjLlQ+/J0WXkkpErjr
   f58JxWIQDjh464Ftx/JsytFswSmW2yWe85rfy0Qwf94VTrFCA9ZCZWKas
   NND4q3FaXTW3Mg4syxcD1SMOeo9bu+/N5XNeTK2+3KGMCcYOFfhwDoDcX
   eDwJ3ZuUyC3IZuvMwaiYx5gbKkbt74cgAwrq3/4uegZYYRCPDcmJvcTIM
   Kyh3N+PktcNYU6SD9CDBe3MTeW6kj6pka9vNsxko726SHMtFEbEXzKeW6
   A==;
X-CSE-ConnectionGUID: EFO9SydzQ+mnLB9ZTsnspw==
X-CSE-MsgGUID: lz6OQJ7CQMy+aIZOoh280g==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="211487608"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="211487608"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:48 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id D991B42A333
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:46 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 942161C1025F
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:46 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id 8D1E72005D20
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5CA021A0073;
	Wed,  3 Sep 2025 17:03:41 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 19/56] nss: upgrade 3.115 -> 3.115.1
Date: Wed,  3 Sep 2025 17:02:40 +0800
Message-ID: <20250903090317.2002-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119216

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/nss/{nss_3.115.bb => nss_3.115.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nss/{nss_3.115.bb => nss_3.115.1.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss_3.115.bb b/meta-oe/recipes-support/nss/nss_3.115.1.bb
similarity index 99%
rename from meta-oe/recipes-support/nss/nss_3.115.bb
rename to meta-oe/recipes-support/nss/nss_3.115.1.bb
index 7ac488cd4c..07cdb66f1b 100644
--- a/meta-oe/recipes-support/nss/nss_3.115.bb
+++ b/meta-oe/recipes-support/nss/nss_3.115.1.bb
@@ -33,7 +33,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/$
            file://0006-Fix-nss-multilib-build-on-openSUSE-11.x-32bit.patch \
            file://0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "ac2a47fb33bd79320159144e01c0d4af9a937a2d928c7c77ff06f5d9507861ab"
+SRC_URI[sha256sum] = "b8189c030b528e57dc5290023c07eea429ce242912a51a0388c184c75a257bcf"
 
 UPSTREAM_CHECK_URI = "https://ftp.mozilla.org/pub/security/nss/releases/"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>\d+(\_\d+)+)"
-- 
2.43.0


